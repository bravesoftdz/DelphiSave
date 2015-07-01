inherited frmCeseILT: TfrmCeseILT
  Left = 344
  Top = 161
  Caption = 'Notificaciones de cese de ILT'
  ClientHeight = 420
  ClientWidth = 792
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  OldCreateOrder = True
  ExplicitWidth = 800
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 123
    ExplicitWidth = 792
    ExplicitHeight = 123
    DesignSize = (
      792
      123)
    object gbFechaCarga: TGroupBox
      Left = 308
      Top = 43
      Width = 118
      Height = 78
      Caption = 'Fecha carga del Alta '
      TabOrder = 5
      object Label2: TLabel
        Left = 97
        Top = 22
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
      object DTPHasta: TDateComboBox
        Left = 7
        Top = 47
        Width = 88
        Height = 21
        MinDateCombo = DTPDesde
        TabOrder = 1
      end
      object DTPDesde: TDateComboBox
        Left = 7
        Top = 18
        Width = 88
        Height = 21
        MaxDateCombo = DTPHasta
        TabOrder = 0
      end
    end
    object gpGrupoTrabajo: TGroupBox
      Left = 428
      Top = 0
      Width = 361
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' &Grupo de trabajo '
      TabOrder = 2
      DesignSize = (
        361
        40)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 7
        Top = 13
        Width = 346
        Height = 22
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 13
        ExplicitWidth = 346
        ExplicitHeight = 22
        DesignSize = (
          346
          22)
        inherited lblGestor: TLabel
          Left = 175
          Width = 31
          ExplicitLeft = 175
          ExplicitWidth = 31
        end
        inherited cmbGestor: TArtComboBox
          Left = 211
          ExplicitLeft = 211
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 121
          ExplicitWidth = 121
        end
      end
    end
    object gbDelegacion: TGroupBox
      Left = 428
      Top = 43
      Width = 362
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = ' De&legaci'#243'n '
      TabOrder = 6
      DesignSize = (
        362
        39)
      inline fraDelegacion: TfraDelegacion
        Left = 5
        Top = 13
        Width = 352
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
        ExplicitWidth = 352
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 307
          DataSource = nil
          ExplicitLeft = 44
          ExplicitWidth = 307
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          ExplicitWidth = 40
        end
      end
    end
    object gbDiasDif: TGroupBox
      Left = 3
      Top = 43
      Width = 125
      Height = 78
      Caption = 'Dias diferencia F. Alta '
      TabOrder = 3
      object rbMenorDias: TRadioButton
        Left = 5
        Top = 16
        Width = 92
        Height = 15
        Caption = 'Menor igual 20'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbMayorDias: TRadioButton
        Left = 5
        Top = 36
        Width = 64
        Height = 15
        Caption = 'Mayor 20'
        TabOrder = 1
      end
      object rbTodosDias: TRadioButton
        Left = 5
        Top = 57
        Width = 52
        Height = 15
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    object gbOrigen: TGroupBox
      Left = 132
      Top = 1
      Width = 294
      Height = 40
      Caption = ' Origen del cese '
      TabOrder = 1
      DesignSize = (
        294
        40)
      inline fraMotivos: TfraCodigoDescripcion
        Left = 5
        Top = 13
        Width = 284
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
        ExplicitWidth = 284
        DesignSize = (
          284
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 40
          Width = 243
          ExplicitLeft = 40
          ExplicitWidth = 243
        end
        inherited edCodigo: TPatternEdit
          Width = 36
          ExplicitWidth = 36
        end
      end
    end
    object cpSiniestro: TCheckPanel
      Left = 3
      Top = 0
      Width = 125
      Height = 42
      Caption = 'Siniestro '
      TabOrder = 0
      Checked = False
      OnChange = cpSiniestroChange
      object edSiniestro: TSinEdit
        Left = 7
        Top = 15
        Width = 111
        Height = 21
        TabOrder = 0
        OnSelect = edSiniestroSelect
      end
    end
    object Panel1: TPanel
      Left = 132
      Top = 47
      Width = 172
      Height = 74
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 4
      object chkTrabGenerada: TCheckBox
        Left = 10
        Top = 7
        Width = 121
        Height = 17
        Caption = 'Trabajador notificado'
        TabOrder = 0
      end
      object chkEmplGenerada: TCheckBox
        Left = 10
        Top = 29
        Width = 158
        Height = 17
        Caption = 'Carta al empleador generada'
        TabOrder = 1
      end
      object chkMailGenerado: TCheckBox
        Left = 10
        Top = 51
        Width = 145
        Height = 17
        Caption = 'Mail al empleador enviado'
        TabOrder = 2
      end
    end
    object gbRegionSanitPrest: TGroupBox
      Left = 429
      Top = 82
      Width = 361
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Regi'#243'n sanitaria del Prestador'
      TabOrder = 7
      DesignSize = (
        361
        39)
      inline fraRegionSanitaria: TfraCtbTablas
        Left = 7
        Top = 13
        Width = 352
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 13
        ExplicitWidth = 352
        DesignSize = (
          352
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 30
          Width = 317
          DataSource = nil
          ExplicitLeft = 30
          ExplicitWidth = 317
        end
        inherited edCodigo: TPatternEdit
          Width = 28
          ExplicitWidth = 28
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 123
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 123
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Left = 9
      Width = 779
      ExplicitLeft = 9
      ExplicitWidth = 779
      inherited tbPropiedades: TToolButton
        Hint = 'Generar carta documento'
        ImageIndex = 30
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbGenerarCartaTrab: TToolButton
        Left = 385
        Top = 0
        Hint = 'Generar carta al trabajador'
        Caption = 'tbGenerarCartaTrab'
        Enabled = False
        ImageIndex = 30
        OnClick = tbGenerarCartaTrabClick
      end
      object ToolButton1: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbGenerarCartaEmpl: TToolButton
        Left = 416
        Top = 0
        Hint = 'Generar carta al empleador'
        Caption = 'tbGenerarCartaEmpl'
        Enabled = False
        ImageIndex = 30
        OnClick = tbGenerarCartaEmplClick
      end
      object tbEnviarEmail: TToolButton
        Left = 439
        Top = 0
        Hint = 'Enviar e-mail al empleador'
        Caption = 'tbEnviarEmail'
        Enabled = False
        ImageIndex = 31
        OnClick = tbEnviarEmailClick
      end
      object ToolButton9: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbCeseILT: TToolButton
        Left = 470
        Top = 0
        Hint = 'Cargar fecha ILT'
        Caption = 'tbCeseILT'
        Enabled = False
        ImageIndex = 16
        OnClick = tbCeseILTClick
      end
      object ToolButton7: TToolButton
        Left = 493
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 501
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 152
    Width = 792
    Height = 268
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 22
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha carga'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_DIAS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as dif.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_NOTIFICACIONENVIADA'
        Title.Alignment = taCenter
        Title.Caption = 'Mail enviado'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_FECHAMAIL'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha mail'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_FECHACARTAEMP'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carta Emp.'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_FECHACARTATRAB'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carta Trab.'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_FECHAFORM'
        Title.Alignment = taCenter
        Title.Caption = 'F.Formulario'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'G.Trabajo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Origen'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REGSANITPREST'
        Title.Caption = 'Regi'#243'n Sanit. Prest.'
        Width = 150
        Visible = True
      end>
  end
  object fpGenerarCarta: TFormPanel [3]
    Left = 136
    Top = 172
    Width = 308
    Height = 90
    Caption = 'Generaci'#243'n de carta'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpGenerarCartaBeforeShow
    OnShow = fpGenerarCartaShow
    DesignSize = (
      308
      90)
    object Bevel2: TBevel
      Left = 3
      Top = 53
      Width = 302
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 93
      Height = 13
      Caption = 'Seleccione firmante'
    end
    object btnAceptarCarta: TBitBtn
      Left = 220
      Top = 60
      Width = 83
      Height = 25
      Caption = '&Aceptar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAceptarCartaClick
    end
    inline fraFirmante: TfraCodigoDescripcion
      Left = 4
      Top = 24
      Width = 299
      Height = 23
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 299
      DesignSize = (
        299
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 234
        DataSource = nil
        ExplicitWidth = 234
      end
    end
  end
  object fpFechaILT: TFormPanel [4]
    Left = 452
    Top = 212
    Width = 200
    Height = 102
    Caption = 'Cese de ILT'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpFechaILTBeforeShow
    Constraints.MinHeight = 94
    Constraints.MinWidth = 200
    DesignSize = (
      200
      102)
    object Label33: TLabel
      Left = 9
      Top = 42
      Width = 58
      Height = 13
      Caption = 'Cese de ILT'
    end
    object Bevel7: TBevel
      Left = 3
      Top = 67
      Width = 194
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object btnAceptarILT: TBitBtn
      Left = 119
      Top = 73
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAceptarILTClick
    end
    object dcCeseILT: TDateComboBox
      Left = 83
      Top = 39
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object SinCese: TSinEdit
      Left = 83
      Top = 9
      Width = 100
      Height = 21
      TabOrder = 2
      ReadOnly = True
      TabStop = False
      Color = clBtnFace
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT null checkbox, ex_id, ex_siniestro, ex_orden, ex_recaida,' +
        ' gc_fechaalta,'
      
        '       utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida' +
        ') siniestro,'
      
        '       utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, ut' +
        'iles.armar_cuit(em_cuit) cuit,'
      
        '       em_nombre empresa, '#39'('#39' || ca_identificador || '#39') - '#39' || c' +
        'a_descripcion prestador,'
      
        '       gp_nombre gtrabajo, lg_nombre delegacion, tj_id, co_contr' +
        'ato,'
      
        '       siniestro.get_usuariogestor(ex_id) usugestor, gc_dias,  g' +
        'c_fechamail,'
      
        '       gc_fechacartaemp, gc_fechacartatrab, gc_id, sc_idtextocar' +
        'tatrab, sc_id idaccion,'
      
        '       sc_idtextocartaempl,  gc_notificacionenviada, gc_fechafor' +
        'm'
      
        'FROM sex_expedientes, ctj_trabajador, aem_empresa, cpr_prestador' +
        ',  dlg_delegaciones,'
      
        '     mgp_gtrabajo, aco_contrato, sin.sgc_seguimientocese, sin.ss' +
        'c_situacionorigen'
      'WHERE ex_id = gc_idexpediente'
      '  AND gc_origen = sc_id'
      '  AND ex_cuil = tj_cuil'
      '  AND ex_cuit = em_cuit'
      '  AND co_idempresa = em_id'
      
        '  AND co_contrato = NVL(afiliacion.get_contratovigente(ex_cuit, ' +
        'ex_fechaaccidente),'
      '                        afiliacion.GET_ULTCONTRATO(ex_cuit))'
      '  AND NVL(gc_idprestador, ex_prestador) = ca_identificador'
      '  AND ex_gtrabajo = gp_codigo'
      '  AND ex_delegacion = lg_codigo'
      '  AND gc_fechabaja IS NULL'
      '  AND NVL(ex_causafin,'#39'0'#39') NOT IN ('#39'02'#39', '#39'99'#39', '#39'95'#39')'
      '  AND gc_fechaalta BETWEEN :pFecha AND :pFecha')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pFecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pFecha'
        ParamType = ptInput
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'gc_fechaalta'
        Title = 'F.Alta'
      end
      item
        DataField = 'siniestro'
        Title = 'Siniestro'
      end
      item
        DataField = 'cuil'
        Title = 'CUIL'
      end
      item
        DataField = 'trabajador'
        Title = 'Trabajador'
      end
      item
        DataField = 'cuit'
        Title = 'CUIT'
      end
      item
        DataField = 'empresa'
        Title = 'Empresa'
      end
      item
        DataField = 'prestador'
        Title = 'Prestador'
      end
      item
        DataField = 'gtrabajo'
        Title = 'G.Trabajo'
      end
      item
        DataField = 'usugestor'
        Title = 'Usuario gestor'
      end
      item
        DataField = 'delegacion'
        Title = 'Delegacion'
      end
      item
        DataField = 'gc_dias'
        Title = 'Dias'
      end
      item
        DataField = 'gc_fechamail'
        Title = 'F.Mail'
      end
      item
        DataField = 'gc_fechacartaemp'
        Title = 'F.Carta Emp.'
      end
      item
        DataField = 'gc_fechacartatrab'
        Title = 'F.CartaTrab.'
      end
      item
        DataField = 'gc_fechaform'
        Title = 'F.Formulario'
      end
      item
        DataField = 'REGSANITPREST'
        Title = 'Reg.Sanit.Prest.'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 13
      end
      item
        Title = 'F. Carga'
        TitleAlignment = taCenter
        DataField = 'GC_FECHAALTA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Dias'
        TitleAlignment = taCenter
        DataField = 'GC_DIAS'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'G.Trabajo'
        DataField = 'GTRABAJO'
        MaxLength = 13
      end
      item
        Title = 'Usuario gestor'
        DataField = 'USUGESTOR'
        MaxLength = 15
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        MaxLength = 13
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        MaxLength = 12
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        MaxLength = 25
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        MaxLength = 13
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        MaxLength = 30
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 30
      end
      item
        Title = 'Reg.Sanit.Prest.'
        DataField = 'REGSANITPREST'
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'VerOrigenCompleto'
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
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
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 0
        LinkControl = tbCeseILT
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
  end
  object mnuImprimir: TPopupMenu
    Left = 24
    Top = 164
    object mnuImprimirGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuImprimirGrillaClick
    end
    object mnuImprimirCeseILT: TMenuItem
      Caption = 'Cese ILT'
      OnClick = mnuImprimirCeseILTClick
    end
  end
end
