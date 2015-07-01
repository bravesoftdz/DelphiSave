inherited frmSeguimientoCronicos: TfrmSeguimientoCronicos
  Left = 496
  Top = 216
  Width = 792
  Height = 513
  Caption = 'Seguimiento de pacientes cr'#243'nicos'
  Constraints.MinWidth = 792
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 784
    Height = 119
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 784
      Height = 119
      ActivePage = tsFiltros0
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tsFiltros0: TTabSheet
        Caption = ' &Filtros >>'
        object GroupBox1: TGroupBox
          Left = 142
          Top = 0
          Width = 155
          Height = 43
          Caption = ' Rango siniestros '
          TabOrder = 1
          object Label1: TLabel
            Left = 68
            Top = 19
            Width = 12
            Height = 13
            Caption = '>>'
          end
          object edSinHasta: TIntEdit
            Left = 81
            Top = 15
            Width = 68
            Height = 21
            TabOrder = 1
            AutoExit = True
          end
          object edSinDesde: TIntEdit
            Left = 5
            Top = 15
            Width = 60
            Height = 21
            TabOrder = 0
            OnExit = edSinDesdeExit
            AutoExit = True
          end
        end
        object gbFecha: TGroupBox
          Left = 3
          Top = 44
          Width = 210
          Height = 43
          Caption = ' Fecha de accidente '
          TabOrder = 5
          object Label8: TLabel
            Left = 98
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
          end
          object dcAcciDesde: TDateComboBox
            Left = 8
            Top = 15
            Width = 88
            Height = 21
            Hint = 'Desde Fecha'
            MaxDateCombo = dcAcciHasta
            DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object dcAcciHasta: TDateComboBox
            Left = 114
            Top = 15
            Width = 88
            Height = 21
            Hint = 'Hasta Fecha'
            MinDateCombo = dcAcciDesde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object gbFechaPostAlta: TGroupBox
          Left = 217
          Top = 44
          Width = 210
          Height = 43
          Caption = ' Fecha controles post alta '
          TabOrder = 6
          object Label2: TLabel
            Left = 98
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
          end
          object dcPostDesde: TDateComboBox
            Left = 8
            Top = 15
            Width = 88
            Height = 21
            Hint = 'Desde Fecha'
            MaxDateCombo = dcPostHasta
            DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object dcPostHasta: TDateComboBox
            Left = 114
            Top = 15
            Width = 88
            Height = 21
            Hint = 'Hasta Fecha'
            MinDateCombo = dcPostDesde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object gbFechaOrtesis: TGroupBox
          Left = 431
          Top = 44
          Width = 210
          Height = 43
          Caption = ' Fecha control por especialidad '
          TabOrder = 7
          object Label3: TLabel
            Left = 98
            Top = 18
            Width = 12
            Height = 13
            Caption = '>>'
          end
          object dcEspDesde: TDateComboBox
            Left = 8
            Top = 15
            Width = 88
            Height = 21
            Hint = 'Desde Fecha'
            MaxDateCombo = dcEspHasta
            DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object dcEspHasta: TDateComboBox
            Left = 114
            Top = 15
            Width = 88
            Height = 21
            Hint = 'Hasta Fecha'
            MinDateCombo = dcEspDesde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 0
          Width = 137
          Height = 43
          Caption = ' Siniestro '
          TabOrder = 0
          object SinEdit: TSinEdit
            Left = 8
            Top = 16
            Width = 121
            Height = 21
            TabOrder = 0
            OnSelect = SinEditSelect
          end
        end
        object GroupBox2: TGroupBox
          Left = 301
          Top = 0
          Width = 129
          Height = 43
          Caption = ' Evolucionado '
          TabOrder = 2
          object rbEvoNo: TRadioButton
            Left = 90
            Top = 19
            Width = 36
            Height = 17
            Caption = 'No'
            TabOrder = 2
          end
          object rbEvoSi: TRadioButton
            Left = 57
            Top = 19
            Width = 32
            Height = 17
            Caption = 'Si'
            TabOrder = 1
          end
          object rbEvoTodos: TRadioButton
            Left = 4
            Top = 19
            Width = 53
            Height = 17
            Caption = 'Todos'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
        end
        object GroupBox4: TGroupBox
          Left = 434
          Top = 0
          Width = 129
          Height = 43
          Caption = ' Con egreso '
          TabOrder = 3
          object rbAltaNo: TRadioButton
            Left = 90
            Top = 19
            Width = 36
            Height = 17
            Caption = 'No'
            TabOrder = 2
          end
          object rbAltaSi: TRadioButton
            Left = 57
            Top = 19
            Width = 32
            Height = 17
            Caption = 'Si'
            TabOrder = 1
          end
          object rbAltaTodos: TRadioButton
            Left = 4
            Top = 19
            Width = 53
            Height = 17
            Caption = 'Todos'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
        end
        object rgRegularidad: TRadioGroup
          Left = 566
          Top = 0
          Width = 209
          Height = 44
          Caption = ' Regularidad '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            '30 d'#237'as'
            '60 d'#237'as'
            '90 d'#237'as'
            '120 d'#237'as'
            'Anual')
          TabOrder = 4
        end
        object GroupBox6: TGroupBox
          Left = 646
          Top = 44
          Width = 129
          Height = 43
          Caption = ' Equipado '
          TabOrder = 8
          object rbEquiNo: TRadioButton
            Left = 90
            Top = 19
            Width = 36
            Height = 17
            Caption = 'No'
            TabOrder = 2
          end
          object rbEquiSi: TRadioButton
            Left = 57
            Top = 19
            Width = 32
            Height = 17
            Caption = 'Si'
            TabOrder = 1
          end
          object rbEquiTodos: TRadioButton
            Left = 4
            Top = 19
            Width = 53
            Height = 17
            Caption = 'Todos'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
        end
      end
      object tsFiltros1: TTabSheet
        Caption = ' F&iltros <<'
        ImageIndex = 1
        DesignSize = (
          776
          93)
        object gbPrestador: TGroupBox
          Left = 2
          Top = 0
          Width = 771
          Height = 43
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Prestador '
          TabOrder = 0
          DesignSize = (
            771
            43)
          inline fraPrestadorF: TfraPrestador
            Left = 3
            Top = 12
            Width = 763
            Height = 24
            VertScrollBar.Range = 49
            Anchors = [akLeft, akTop, akRight]
            AutoScroll = False
            TabOrder = 0
            DesignSize = (
              747
              24)
            inherited lbCPostal: TLabel
              Left = 579
            end
            inherited lbTelefono: TLabel
              Left = 491
            end
            inherited cmbPrestFantasia: TArtComboBox
              Width = 196
            end
            inherited cmbPrestador: TArtComboBox
              Width = 335
            end
            inherited edPresLocalidad: TEdit
              Width = 225
            end
            inherited edPresCPostal: TEdit
              Left = 596
            end
            inherited edPresTelefono: TEdit
              Left = 511
            end
          end
        end
        object gbEspecialidad: TGroupBox
          Left = 2
          Top = 43
          Width = 299
          Height = 43
          Caption = ' Especialidad '
          TabOrder = 1
          DesignSize = (
            299
            43)
          inline fraEspecialidadF: TfraCodigoDescripcion
            Left = 3
            Top = 14
            Width = 293
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              293
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 48
              Width = 241
            end
            inherited edCodigo: TPatternEdit
              Width = 44
            end
          end
        end
        object gpGrupoTrabajo: TGroupBox
          Left = 304
          Top = 43
          Width = 469
          Height = 43
          Anchors = [akLeft, akTop, akRight]
          Caption = ' &Grupo de trabajo '
          TabOrder = 2
          DesignSize = (
            469
            43)
          inline fraGrupoTrabajo: TfraGrupoTrabajo
            Left = 4
            Top = 14
            Width = 460
            Height = 23
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            DesignSize = (
              460
              23)
            inherited lblGestor: TLabel
              Left = 289
            end
            inherited cmbGestor: TArtComboBox
              Left = 325
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 235
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 119
    Width = 784
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 780
      end>
    inherited ToolBar: TToolBar
      Width = 767
      inherited ToolButton5: TToolButton
        Visible = True
      end
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
    end
  end
  inherited Grid: TArtDBGrid
    Top = 148
    Width = 784
    Height = 338
    Columns = <
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
        FieldName = 'FACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. accidente'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PE_FECHAALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Egreso'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHAPOSTALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. post alta'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHAESPECIAL'
        Title.Alignment = taCenter
        Title.Caption = 'F. especialidad'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EVOLUCIONADO'
        Title.Alignment = taCenter
        Title.Caption = 'Evol.'
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_EQUIPADO'
        Title.Alignment = taCenter
        Title.Caption = 'Equip.'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGULARIDAD'
        Title.Caption = 'Regularidad'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPECIALIDAD'
        Title.Caption = 'Especialidad'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 170
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        Title.Alignment = taCenter
        Title.Caption = 'CIE-10'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'G.trabajo'
        Width = 100
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
        Width = 100
        Visible = True
      end>
  end
  object fpFechas: TFormPanel [3]
    Left = 82
    Top = 210
    Width = 614
    Height = 260
    Caption = 'Seguimiento de pacientes cr'#243'nicos'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpFechasBeforeShow
    DesignSize = (
      614
      260)
    object Label5: TLabel
      Left = 8
      Top = 49
      Width = 41
      Height = 13
      Caption = 'Post alta'
    end
    object Label6: TLabel
      Left = 146
      Top = 49
      Width = 86
      Height = 13
      Caption = 'Control por espec.'
    end
    object Bevel7: TBevel
      Left = 3
      Top = 222
      Width = 608
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label9: TLabel
      Left = 8
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label4: TLabel
      Left = 8
      Top = 186
      Width = 37
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = 'Observ'#13#10'aciones'
    end
    object Label7: TLabel
      Left = 328
      Top = 49
      Width = 60
      Height = 13
      Caption = 'Especialidad'
    end
    object Bevel1: TBevel
      Left = 2
      Top = 36
      Width = 608
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 168
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Paciente'
    end
    object dcPostAlta: TDateComboBox
      Left = 55
      Top = 45
      Width = 88
      Height = 21
      DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dcEspec: TDateComboBox
      Left = 235
      Top = 45
      Width = 88
      Height = 21
      DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnAceptarFecha: TBitBtn
      Left = 448
      Top = 228
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarFechaClick
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
    end
    object btnCancelarFecha: TBitBtn
      Left = 532
      Top = 228
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 8
      Kind = bkCancel
    end
    object edSiniestro: TSinEdit
      Left = 56
      Top = 8
      Width = 100
      Height = 21
      TabOrder = 9
      ReadOnly = True
      TabStop = False
      Color = clBtnFace
    end
    object edObservaciones: TMemo
      Left = 49
      Top = 183
      Width = 558
      Height = 35
      Anchors = [akLeft, akRight, akBottom]
      MaxLength = 500
      TabOrder = 6
    end
    object rgRegularidadABM: TRadioGroup
      Left = 6
      Top = 141
      Width = 491
      Height = 37
      Anchors = [akLeft, akBottom]
      Caption = ' Regularidad '
      Columns = 6
      ItemIndex = 0
      Items.Strings = (
        'Sin valor'
        '30 d'#237'as'
        '60 d'#237'as'
        '90 d'#237'as'
        '120 d'#237'as'
        'Anual')
      TabOrder = 4
    end
    inline fraEspecialidadABM: TfraCodigoDescripcion
      Left = 392
      Top = 44
      Width = 217
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        217
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 168
      end
      inherited edCodigo: TPatternEdit
        Width = 44
      end
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 71
      Width = 605
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Prestador '
      TabOrder = 3
      DesignSize = (
        605
        70)
      inline fraPrestadorABM: TfraPrestador
        Left = 3
        Top = 15
        Width = 600
        Height = 50
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        DesignSize = (
          600
          50)
        inherited lbCPostal: TLabel
          Left = 528
        end
        inherited lbTelefono: TLabel
          Left = 440
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 145
        end
        inherited cmbPrestador: TArtComboBox
          Width = 270
        end
        inherited edPresLocalidad: TEdit
          Width = 174
        end
        inherited edPresCPostal: TEdit
          Left = 545
        end
        inherited edPresTelefono: TEdit
          Left = 460
        end
      end
    end
    object edPaciente: TEdit
      Left = 220
      Top = 8
      Width = 388
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
    object gbEquipadoABM: TGroupBox
      Left = 501
      Top = 141
      Width = 108
      Height = 37
      Caption = ' Equipado '
      TabOrder = 5
      object rbEquiNoABM: TRadioButton
        Left = 58
        Top = 16
        Width = 36
        Height = 16
        Caption = 'No'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbEquiSiABM: TRadioButton
        Left = 13
        Top = 16
        Width = 32
        Height = 16
        Caption = 'Si'
        TabOrder = 0
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, '
      
        '       ex_id, ex_fechaaccidente faccidente, art.utiles.armar_cui' +
        't(tj_cuil) cuil, '
      
        '       tj_nombre trabajador, utiles.armar_cuit(em_cuit) cuit, em' +
        '_nombre empresa,'
      '       DECODE(ca_identificador, NULL, NULL,'
      
        '             '#39'('#39' || ca_identificador || '#39' ) - '#39' || ca_nombrefant' +
        'a) prestador, '
      
        '       sc_fechapostalta, gp_nombre gtrabajo, art.siniestro.get_u' +
        'suariogestor(ex_id) usugestor, '
      
        '       lg_nombre delegacion, ex_siniestro, ex_orden, ex_recaida,' +
        ' ex_diagnosticooms, '
      
        '       dg_descripcion diagnostico, es_descripcion especialidad, ' +
        'sc_fechaespecial,'
      
        '       sc_observaciones, art.siniestro.is_cronicoevolucionado(sc' +
        '_id) evolucionado,'
      
        '       DECODE(sc_regularidad, 0, '#39'30 d'#237'as'#39', 1, '#39'60 d'#237'as'#39', 2, '#39'90' +
        ' d'#237'as'#39', '
      
        '                              3, '#39'120 d'#237'as'#39', 4, '#39'Anual'#39') regular' +
        'idad'
      
        '  FROM art.dlg_delegaciones, art.mgp_gtrabajo, art.cpr_prestador' +
        ', aem_empresa, '
      
        '       ctj_trabajador, art.sex_expedientes, art.cdg_diagnostico,' +
        ' '
      '       SIN.ssc_seguimientocronicos, art.mes_especialidades'
      ' WHERE ex_id = sc_idexpediente(+)'
      '   AND ex_cuil = tj_cuil'
      '   AND ex_cuit = em_cuit'
      '   AND ca_identificador(+) = sc_idprestador'
      '   AND es_codigo(+) = sc_codespecialidad'
      '   AND ex_gtrabajo = gp_codigo'
      '   AND ex_delegacion = lg_codigo'
      '   AND sc_fechabaja IS NULL'
      '   AND dg_codigo(+) = ex_diagnosticooms'
      '   AND NVL(ex_causafin, '#39'0'#39') NOT IN('#39'02'#39', '#39'99'#39', '#39'95'#39')')
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
        Title = 'F.Accid.'
        TitleAlignment = taCenter
        DataField = 'FACCIDENTE'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'F.Post'
        TitleAlignment = taCenter
        DataField = 'SC_FECHAPOSTALTA'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'F.Esp.'
        TitleAlignment = taCenter
        DataField = 'SC_FECHAESPECIAL'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Evol.'
        TitleAlignment = taCenter
        DataField = 'EVOLUCIONADO'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Regul.'
        DataField = 'REGULARIDAD'
        MaxLength = 8
      end
      item
        Title = 'Especialidad'
        DataField = 'ESPECIALIDAD'
        MaxLength = 18
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 38
      end
      item
        Title = 'Observaciones'
        DataField = 'SC_OBSERVACIONES'
        MaxLength = 30
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        MaxLength = 11
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        MaxLength = 25
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        MaxLength = 11
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        MaxLength = 40
      end
      item
        Title = 'G.Trabajo'
        DataField = 'GTRABAJO'
        MaxLength = 11
      end>
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
        Key = 16467
        LinkControl = tbSalir
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
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
end
