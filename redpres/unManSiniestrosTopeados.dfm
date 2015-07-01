inherited frmManSiniestrosTopeados: TfrmManSiniestrosTopeados
  Left = 411
  Top = 134
  Width = 953
  Height = 537
  Caption = 'Siniestros Topeados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 945
    Height = 132
    Visible = True
    DesignSize = (
      945
      132)
    object grpSiniestro: TGroupBox
      Left = 1
      Top = 86
      Width = 117
      Height = 42
      Caption = ' Siniestro '
      TabOrder = 5
      object SinEdit: TSinEdit
        Left = 5
        Top = 14
        Width = 107
        Height = 21
        TabOrder = 0
      end
    end
    object grpEmpresa: TGroupBox
      Left = 597
      Top = 43
      Width = 345
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 4
      DesignSize = (
        345
        43)
      inline fraEmpresa: TfraEmpresa
        Left = 7
        Top = 15
        Width = 331
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
        inherited lbContrato: TLabel
          Left = 227
        end
        inherited edContrato: TIntEdit
          Left = 274
        end
        inherited cmbRSocial: TArtComboBox
          Width = 93
        end
      end
    end
    object gbFechaTope2: TGroupBox
      Left = 504
      Top = 87
      Width = 192
      Height = 41
      Caption = ' Fecha Tope 2 '
      TabOrder = 8
      object Label4: TLabel
        Left = 92
        Top = 18
        Width = 9
        Height = 16
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dFechaTope2_Desde: TDateComboBox
        Left = 4
        Top = 15
        Width = 87
        Height = 21
        MaxDateCombo = dFechaTope2_Hasta
        TabOrder = 0
      end
      object dFechaTope2_Hasta: TDateComboBox
        Left = 101
        Top = 15
        Width = 87
        Height = 21
        MinDateCombo = dFechaTope2_Desde
        TabOrder = 1
      end
    end
    object gbFechaTope1: TGroupBox
      Left = 120
      Top = 87
      Width = 191
      Height = 41
      Caption = ' Fecha Tope 1 '
      TabOrder = 6
      object lblFTope1: TLabel
        Left = 92
        Top = 18
        Width = 9
        Height = 16
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dFechaTope1_Desde: TDateComboBox
        Left = 4
        Top = 15
        Width = 87
        Height = 21
        MaxDateCombo = dFechaTope1_Hasta
        TabOrder = 0
      end
      object dFechaTope1_Hasta: TDateComboBox
        Left = 101
        Top = 15
        Width = 87
        Height = 21
        MinDateCombo = dFechaTope1_Desde
        TabOrder = 1
      end
    end
    object gbFechaLiberacion: TGroupBox
      Left = 312
      Top = 87
      Width = 191
      Height = 41
      Caption = ' Fecha Liberaci'#243'n  '
      TabOrder = 7
      object Label3: TLabel
        Left = 91
        Top = 18
        Width = 9
        Height = 16
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dFechaLiberacion_Desde: TDateComboBox
        Left = 4
        Top = 15
        Width = 87
        Height = 21
        MaxDateCombo = dFechaLiberacion_Hasta
        TabOrder = 0
      end
      object dFechaLiberacion_Hasta: TDateComboBox
        Left = 100
        Top = 15
        Width = 87
        Height = 21
        MinDateCombo = dFechaLiberacion_Desde
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 43
      Width = 364
      Height = 43
      Caption = ' Grupo de Trabajo '
      TabOrder = 3
      DesignSize = (
        364
        43)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 5
        Top = 14
        Width = 353
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          353
          23)
        inherited lblGestor: TLabel
          Left = 182
        end
        inherited cmbGestor: TArtComboBox
          Left = 218
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 128
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 454
      Top = 2
      Width = 489
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Delegaci'#243'n '
      TabOrder = 2
      DesignSize = (
        489
        42)
      inline fraDelegacion: TfraDelegacion
        Left = 8
        Top = 15
        Width = 479
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          479
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 41
          Top = 0
          Width = 434
        end
        inherited edCodigo: TPatternEdit
          Top = 0
          Width = 36
        end
      end
    end
    object gbTopeado: TGroupBox
      Left = 286
      Top = 2
      Width = 166
      Height = 42
      Caption = 'Topeado a la fecha actual'
      TabOrder = 1
      object rbTopeadoSi: TRadioButton
        Left = 8
        Top = 18
        Width = 34
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbTopeadoNo: TRadioButton
        Left = 47
        Top = 18
        Width = 39
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbTopeadoTodos: TRadioButton
        Left = 91
        Top = 18
        Width = 50
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbTopeadoPor: TGroupBox
      Left = 1
      Top = 2
      Width = 284
      Height = 42
      Caption = ' Topeado por '
      TabOrder = 0
      object rbTopeadoPorCie10: TRadioButton
        Left = 5
        Top = 18
        Width = 65
        Height = 17
        Caption = 'CIE-10'
        Checked = True
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbTopeadoPorCie10Click
      end
      object rbTopeadoPorAutorizacion: TRadioButton
        Left = 74
        Top = 18
        Width = 97
        Height = 17
        Caption = 'Autorizaci'#243'n'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        OnClick = rbTopeadoPorAutorizacionClick
      end
      object rbTopeadoPorTraslados: TRadioButton
        Left = 163
        Top = 18
        Width = 73
        Height = 17
        Caption = 'Traslado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = rbTopeadoPorTrasladosClick
      end
      object rbTopeadoPorFKT: TRadioButton
        Left = 234
        Top = 18
        Width = 43
        Height = 17
        Caption = 'FKT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = rbTopeadoPorTrasladosClick
      end
    end
    object rgJustificacionPendiente: TRadioGroup
      Left = 367
      Top = 43
      Width = 228
      Height = 43
      Caption = 'Justificaci'#243'n Pendiente'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'M'#233'dico'
        'Supervisor'
        'Todos')
      TabOrder = 9
    end
    object gbUsuariosPorPrest: TGroupBox
      Left = 698
      Top = 87
      Width = 244
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuarios por prestador '
      TabOrder = 10
      DesignSize = (
        244
        40)
      inline fraUsuariosPorPrest: TfraCodigoDescripcion
        Left = 94
        Top = 13
        Width = 147
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          147
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 81
          Width = 65
        end
        inherited edCodigo: TPatternEdit
          Left = 3
          Width = 78
        end
      end
      object cbPrestSinAsignar: TCheckBox
        Left = 4
        Top = 17
        Width = 92
        Height = 17
        Caption = 'Prest.sin asign.'
        TabOrder = 1
        OnClick = cbPrestSinAsignarClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 132
    Width = 945
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 941
      end>
    inherited ToolBar: TToolBar
      Width = 928
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 161
    Width = 945
    Height = 346
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCIE10'
        Title.Caption = 'Cod. CIE-10'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCIONCIE10'
        Title.Caption = 'Descripci'#243'n CIE-10'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHATOPE1'
        Title.Caption = 'Fecha Tope 1'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHALIBERA'
        Title.Caption = 'Fecha liberaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHATOPE2'
        Title.Caption = 'Fecha Tope 2'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Grupo Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_GESTOR'
        Title.Caption = 'Gestor'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_CANTIDADTOPE1'
        Title.Caption = 'Cantidad Tope 1'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_CANTIDADTOPE2'
        Title.Caption = 'Cantidad Tope 2'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DiasAproTurno'
        Title.Caption = 'Dias e/apro y turno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrestadorAutorizacion'
        Title.Caption = 'Prestador Auto.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UsuarioPorPrestador'
        Title.Caption = 'Usuario Por Prestador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fktcargadas'
        Title.Caption = 'FKT Cargadas'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'trascargados'
        Title.Caption = 'Tras. Cargados'
        Width = 96
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 228
    Top = 256
    Width = 249
    Height = 99
    Caption = 'Extender hacia adelante la Segunda fecha de Tope'
    OnBeforeShow = fpAbmBeforeShow
    DesignSize = (
      249
      99)
    inherited BevelAbm: TBevel
      Top = 63
      Width = 241
    end
    object lblFechaTope2: TLabel [1]
      Left = 10
      Top = 20
      Width = 70
      Height = 13
      Caption = 'Fecha Tope 2:'
    end
    object lblCantidad2doTope: TLabel [2]
      Left = 10
      Top = 28
      Width = 94
      Height = 13
      Caption = 'Cantidad 2do Tope:'
    end
    inherited btnAceptar: TButton
      Left = 91
      Top = 69
    end
    inherited btnCancelar: TButton
      Left = 169
      Top = 69
    end
    object dFechaTope2: TDateComboBox
      Left = 113
      Top = 14
      Width = 100
      Height = 21
      TabOrder = 2
    end
    object edCant2doTope: TIntEdit
      Left = 113
      Top = 25
      Width = 57
      Height = 21
      TabOrder = 3
      MaxLength = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro,'
      
        '       art.utiles.armar_cuit(ex_cuil) cuil, tj_nombre trabajador' +
        ','
      '       art.utiles.armar_cuit(ex_cuit) cuit, em_nombre empresa,'
      '       dg_codigo codcie10, dg_descripcion descripcioncie10,'
      
        '       st_fechatope1, st_fechalibera, st_fechatope2, st_fechabaj' +
        'a,'
      
        '       st_usualta, st_fechaalta, st_id, el_nombre, ex_gestor, gp' +
        '_nombre GTrabajo,'
      '       st_cantidadtope1, st_cantidadtope2'
      '  FROM art.sex_expedientes, ctj_trabajador, art.mgp_gtrabajo,'
      
        '       aem_empresa, sin.sst_siniestrostopeados, cdg_diagnostico,' +
        ' art.del_delegacion'
      ' WHERE ex_idtrabajador = tj_id'
      '   AND ex_cuit = em_cuit'
      '   AND ex_id = st_idexpediente'
      '   AND ex_diagnosticooms = dg_codigo'
      '   AND ex_delegacion = el_id(+)'
      '   AND gp_codigo(+) = ex_gtrabajo '
      '   AND st_fechabaja IS NULL')
  end
  inherited QueryPrint: TQueryPrint
    Border.Width = 7
    Title.Text = 'Listado de Siniestros Topeados'
    SubTitle.Font.Height = -12
    Detail.Font.Charset = ANSI_CHARSET
    FieldSeparation = 3
    PageOrientation = pxLandscape
    PageSize = psLegal
    CellBorder = 6
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
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
        Key = 16453
        LinkControl = tbExportar
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
end
