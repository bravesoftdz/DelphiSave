inherited frmListRecuperoOrtopedia: TfrmListRecuperoOrtopedia
  Left = 209
  Top = 161
  Width = 795
  Height = 385
  Caption = 'Materiales de ortopedia a recuperar'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 787
    Height = 92
    object GroupBox3: TGroupBox
      Left = 3
      Top = 3
      Width = 207
      Height = 43
      Caption = ' Fecha de gesti'#243'n '
      TabOrder = 0
      object Label4: TLabel
        Left = 97
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcHastaInicio: TDateComboBox
        Left = 113
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeInicio
        TabOrder = 1
      end
      object dcDesdeInicio: TDateComboBox
        Left = 6
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaInicio
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 213
      Top = 3
      Width = 119
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 1
      object edSiniestro: TSinEdit
        Left = 6
        Top = 16
        Width = 107
        Height = 21
        TabOrder = 0
      end
    end
    object gbDelegacion: TGroupBox
      Left = 540
      Top = 3
      Width = 246
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' De&legaci'#243'n '
      TabOrder = 2
      DesignSize = (
        246
        43)
      object cmbDelegacion: TDBCheckCombo
        Left = 8
        Top = 16
        Width = 232
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsDelegacion
        KeyField = 'lg_codigo'
        ListField = 'lg_nombre'
      end
    end
    object grpPrestador: TGroupBox
      Left = 333
      Top = 47
      Width = 452
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 3
      DesignSize = (
        452
        43)
      inline fraPrestador: TfraPrestador
        Left = 3
        Top = 13
        Width = 445
        Height = 23
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 373
        end
        inherited lbTelefono: TLabel
          Left = 285
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 0
          DataSource = nil
        end
        inherited cmbPrestador: TArtComboBox
          Width = 115
          DataSource = nil
        end
        inherited edPresLocalidad: TEdit
          Width = 19
        end
        inherited edPresCPostal: TEdit
          Left = 390
        end
        inherited edPresTelefono: TEdit
          Left = 305
        end
      end
    end
    object gbEstado: TGroupBox
      Left = 334
      Top = 3
      Width = 203
      Height = 43
      Caption = ' Estado '
      TabOrder = 4
      DesignSize = (
        203
        43)
      object cmbEstado: TComboBox
        Left = 7
        Top = 15
        Width = 189
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Todos'
          'Inicial'
          'En tr'#225'mite'
          'Terminado')
      end
    end
    object gbGestor: TGroupBox
      Left = 180
      Top = 47
      Width = 151
      Height = 41
      Caption = ' Usuario gestor '
      TabOrder = 5
      object cmbGestor: TArtComboBox
        Left = 8
        Top = 14
        Width = 138
        Height = 21
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'UG_USUARIO'
            Title.Caption = 'Usuario'
            Visible = True
          end>
        DataSource = dsGestor
        FieldList = 'UG_USUARIO'
        FieldKey = 'UG_ID'
      end
    end
    object gbGrupoTrabajo: TGroupBox
      Left = 2
      Top = 47
      Width = 175
      Height = 41
      Caption = ' Grupo de Trabajo '
      TabOrder = 6
      DesignSize = (
        175
        41)
      object cmbGtrabajo: TDBCheckCombo
        Left = 7
        Top = 14
        Width = 163
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnCloseUp = cmbGtrabajoCloseUp
        DataSource = dsGtrabajo
        KeyField = 'GP_CODIGO'
        ListField = 'GP_NOMBRE'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 787
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 783
      end>
    inherited ToolBar: TToolBar
      Width = 770
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbPosponer: TToolButton
        Left = 370
        Top = 0
        Hint = 'Posponer (Ctrl+P)'
        Caption = 'tbPosponer'
        Enabled = False
        ImageIndex = 38
        OnClick = tbPosponerClick
      end
      object tbTerminar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Terminar (Ctrl+T)'
        Caption = 'tbTerminar'
        Enabled = False
        ImageIndex = 40
        OnClick = tbTerminarClick
      end
      object ToolButton7: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 787
    Height = 237
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AUTORIZACION'
        Title.Alignment = taCenter
        Title.Caption = 'Nro.aut.'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OR_FECHAINIGESTION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Gesti'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OR_RECUPERADO'
        Title.Alignment = taCenter
        Title.Caption = 'Recup.'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OR_PROXIMORECLAMO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Prox.Reclamo'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATCOTIZADO'
        Title.Caption = 'Material cotizado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELTRABAJADOR'
        Title.Caption = 'Tel. trabajador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMTRABAJADOR'
        Title.Caption = 'Domicilio trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELPRESTADOR'
        Title.Caption = 'Tel. prestador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMPRESTADOR'
        Title.Caption = 'Dom. prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'G. Trabajo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OR_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 300
        Visible = True
      end>
  end
  object fpAlta: TFormPanel [3]
    Left = 104
    Top = 184
    Width = 201
    Height = 129
    Caption = 'Alta material'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpAltaBeforeShow
    DesignSize = (
      201
      129)
    object Label1: TLabel
      Left = 9
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label2: TLabel
      Left = 9
      Top = 39
      Width = 58
      Height = 13
      Caption = 'Autorizaci'#243'n'
    end
    object Label3: TLabel
      Left = 9
      Top = 68
      Width = 67
      Height = 13
      Caption = 'Fecha gesti'#243'n'
    end
    object Bevel6: TBevel
      Left = 3
      Top = 93
      Width = 195
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object edSiniestroAlta: TSinEdit
      Left = 88
      Top = 8
      Width = 100
      Height = 21
      OnExit = edSiniestroAltaSelect
      TabOrder = 0
      OnSelect = edSiniestroAltaSelect
    end
    object cmbNroAutAlta: TArtComboBox
      Left = 88
      Top = 35
      Width = 55
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'AU_NUMAUTO'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Nro. Aut.'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_MATERIALCOTI'
          ReadOnly = True
          Title.Caption = 'Material cotizado'
          Width = 360
          Visible = True
        end>
      FieldList = 'AU_NUMAUTO'
      FieldKey = 'AU_ID'
    end
    object dcGestionAlta: TDateComboBox
      Left = 88
      Top = 63
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object btnCancelarAlta: TButton
      Left = 128
      Top = 99
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object btnAceptarAlta: TButton
      Left = 52
      Top = 99
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnAceptarAltaClick
    end
  end
  object fpPosponer: TFormPanel [4]
    Left = 272
    Top = 152
    Width = 321
    Height = 158
    Caption = 'Posponer'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      321
      158)
    object Label5: TLabel
      Left = 4
      Top = 12
      Width = 81
      Height = 13
      Caption = 'F. Pr'#243'x. Reclamo'
    end
    object Label6: TLabel
      Left = 4
      Top = 39
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Bevel1: TBevel
      Left = 3
      Top = 123
      Width = 316
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object dcProxReclamo: TDateComboBox
      Left = 91
      Top = 7
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object edObsPos: TMemo
      Left = 4
      Top = 56
      Width = 312
      Height = 62
      MaxLength = 500
      TabOrder = 1
    end
    object btnCancelarPos: TButton
      Left = 247
      Top = 129
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object btnAceptarPos: TButton
      Left = 171
      Top = 129
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAceptarPosClick
    end
  end
  object fpTerminar: TFormPanel [5]
    Left = 420
    Top = 184
    Width = 321
    Height = 153
    Caption = 'Terminar'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      321
      153)
    object Label8: TLabel
      Left = 4
      Top = 31
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Bevel2: TBevel
      Left = 3
      Top = 115
      Width = 316
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object edObsTer: TMemo
      Left = 4
      Top = 48
      Width = 312
      Height = 62
      MaxLength = 500
      TabOrder = 1
    end
    object btnCancelarTer: TButton
      Left = 247
      Top = 122
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object btnAceptarTer: TButton
      Left = 171
      Top = 122
      Width = 68
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAceptarTerClick
    end
    object chkRecuperoTer: TCheckBox
      Left = 6
      Top = 9
      Width = 88
      Height = 16
      Caption = 'Con recupero'
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT sp_siniestro, sp_orden, sp_recaida, or_id, or_observacion' +
        'es,'
      
        '       utiles.armar_siniestro(sp_siniestro, sp_orden, sp_recaida' +
        ') siniestro, or_fechainigestion, or_estado,'
      '       ca_nombrefanta prestador, ca_telefono telprestador,'
      
        '       utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_d' +
        'epartamento, ca_localidad) domprestador, tj_nombre trabajador,'
      '       art.trabajador.get_telefono(tj_id, 4) teltrabajador,'
      
        '       utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_d' +
        'epartamento, tj_localidad) domtrabajador,'
      
        '       pa_materialcoti matcotizado, pa_materialsoli matsolicitad' +
        'o, NVL(sp_autoapro, sp_autooriginal) autorizacion,'
      
        '       sp_valor_adju valadjudicado, lg_nombre delegacion, gp_nom' +
        'bre gtrabajo, or_recuperado, or_proximoreclamo,'
      '       or_fechabaja, or_estado,'
      
        '       decode(or_estado, '#39'I'#39', '#39'Inicial'#39', '#39'E'#39', '#39'En tr'#225'mite'#39', '#39'T'#39',' +
        ' '#39'Terminado'#39') estado'
      
        '  FROM amed.mor_ortopedia_recupero, cpr_prestador, ctj_trabajado' +
        'r, sex_expedientes, msp_siniestropresup,'
      
        '       mpa_presupuestoautorizacion, dlg_delegaciones, mgp_gtraba' +
        'jo'
      ' WHERE or_fechabaja IS NULL'
      '   AND pa_prestador = ca_identificador'
      
        '   AND siniestro.get_idexpediente(sp_siniestro, sp_orden, sp_rec' +
        'aida) = ex_id'
      '   AND tj_cuil = ex_cuil'
      '   AND or_idpresupuesto = sp_nropedido'
      '   AND pa_id = sp_presupuesto'
      '   AND ex_delegacion = lg_codigo'
      '   AND ex_gtrabajo = gp_codigo'
      '')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 14
      end
      item
        Title = 'N'#186' Aut.'
        TitleAlignment = taCenter
        DataField = 'AUTORIZACION'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'F.Gesti'#243'n'
        TitleAlignment = taCenter
        DataField = 'OR_FECHAINIGESTION'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'F.Prox.Recl.'
        TitleAlignment = taCenter
        DataField = 'OR_PROXIMORECLAMO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Recup.'
        TitleAlignment = taCenter
        DataField = 'OR_RECUPERADO'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        MaxLength = 10
      end
      item
        Title = 'Material cotizado'
        DataField = 'MATCOTIZADO'
        MaxLength = 50
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 40
      end
      item
        Title = 'Tel. prestador'
        DataField = 'TELPRESTADOR'
        MaxLength = 25
      end
      item
        Title = 'Observaciones'
        DataField = 'OR_OBSERVACIONES'
        MaxLength = 0
      end>
    DataSource = nil
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited ShortCutControl: TShortCutControl
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
      end
      item
        Key = 16464
        LinkControl = tbPosponer
      end
      item
        Key = 16468
        LinkControl = tbTerminar
      end>
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 636
    Top = 17
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select lg_codigo, lg_nombre '
      '  from art.dlg_delegaciones'
      ' order by lg_nombre')
    Left = 608
    Top = 17
  end
  object dsAut: TDataSource
    DataSet = sdqAut
    Left = 116
    Top = 152
  end
  object sdqAut: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT au_numauto, au_id, sp_nropedido, au_siniestro, pa_materia' +
        'lcoti'
      
        '  FROM sau_autorizaciones, amed.msp_siniestropresup, amed.mpa_pr' +
        'esupuestoautorizacion'
      ' WHERE au_siniestro = sp_siniestro'
      '   AND au_orden = sp_orden'
      '   AND au_recaida = sp_recaida'
      '   AND au_numauto = NVL(sp_autoapro, sp_autooriginal)'
      '   AND sp_adjudicado = '#39'S'#39
      '   AND sp_fechabaja IS NULL'
      '   AND pa_fechabaja IS NULL'
      '   AND au_estado NOT IN('#39'R'#39', '#39'N'#39', '#39'P'#39', '#39'D'#39')'
      '   AND sp_presupuesto = pa_id'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM amed.mor_ortopedia_recupero'
      '                   WHERE or_idautorizacion = au_id'
      '                     AND or_fechabaja IS NULL)'
      '   AND sp_siniestro = :pSiniestro'
      '   AND sp_orden = :pOrden'
      '   AND sp_recaida = :pRecaida')
    Left = 88
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pRecaida'
        ParamType = ptInput
      end>
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select gp_codigo, gp_nombre'
      'from art.mgp_gtrabajo'
      'where gp_fbaja is null'
      'order by gp_nombre')
    Left = 74
    Top = 55
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 102
    Top = 55
  end
  object sdqGestor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ug_id, ug_usuario'
      '    FROM mug_usuariogrupotrabajo'
      '   WHERE ug_fechabaja IS NULL'
      '     AND ug_tipousuario IN ('#39'01'#39', '#39'04'#39')'
      '')
    Left = 210
    Top = 51
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 238
    Top = 51
  end
end
