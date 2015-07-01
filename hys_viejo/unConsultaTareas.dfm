inherited frmConsultaTareas: TfrmConsultaTareas
  Left = 265
  Top = 206
  Width = 747
  Height = 464
  Caption = ' Consulta de Tareas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 739
    Height = 159
    object pcFilter: TPageControl
      Left = 0
      Top = 0
      Width = 739
      Height = 159
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          731
          131)
        object Label1: TLabel
          Left = 5
          Top = 8
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label2: TLabel
          Left = 5
          Top = 57
          Width = 46
          Height = 13
          Caption = 'Preventor'
        end
        object Label3: TLabel
          Left = 6
          Top = 100
          Width = 33
          Height = 26
          Caption = 'Fecha Tareas'
          WordWrap = True
        end
        object Label4: TLabel
          Left = 152
          Top = 105
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label14: TLabel
          Left = 5
          Top = 31
          Width = 30
          Height = 13
          Caption = 'Estab.'
        end
        object Label9: TLabel
          Left = 373
          Top = 57
          Width = 57
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Coordinador'
        end
        object Label10: TLabel
          Left = 6
          Top = 75
          Width = 40
          Height = 26
          Caption = 'Agregar '#13#10' Visitas'
        end
        object Label11: TLabel
          Left = 380
          Top = 112
          Width = 62
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Prioridad 1'
          FocusControl = pnlColor4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 62
          Top = 3
          Width = 666
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
          DesignSize = (
            666
            21)
          inherited lbContrato: TLabel
            Left = 562
          end
          inherited edContrato: TIntEdit
            Left = 609
          end
          inherited cmbRSocial: TArtComboBox
            Width = 427
          end
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 59
          Top = 52
          Width = 301
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DesignSize = (
            301
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 233
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
          end
        end
        object edFechaTareaDesde: TDateComboBox
          Left = 60
          Top = 103
          Width = 88
          Height = 21
          TabOrder = 5
        end
        object edFechaTareaHasta: TDateComboBox
          Left = 186
          Top = 102
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object edEstablecimiento: TPatternEdit
          Left = 61
          Top = 28
          Width = 668
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Pattern = '1234567890-,'
        end
        inline fraCoordinador: TfraCodigoDescripcion
          Left = 435
          Top = 52
          Width = 295
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 3
          DesignSize = (
            295
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 226
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
          end
        end
        object cmbAgregarVisitas: TCheckCombo
          Left = 61
          Top = 79
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object pnlColor4: TPanel
          Left = 368
          Top = 113
          Width = 10
          Height = 12
          Hint = 'No Investigar'
          Alignment = taLeftJustify
          Anchors = [akRight, akBottom]
          Color = 10021355
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Visible = False
        end
        object cbEmpresaVip: TCheckBox
          Left = 627
          Top = 81
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Empresas VIP'
          TabOrder = 8
        end
      end
      object tbPrevencion: TTabSheet
        Caption = 'Prevenci'#243'n'
        ImageIndex = 1
        DesignSize = (
          731
          131)
        object Label6: TLabel
          Left = 1
          Top = 8
          Width = 76
          Height = 13
          Caption = 'Tipo Prev. Emp.'
        end
        object Label7: TLabel
          Left = 1
          Top = 32
          Width = 79
          Height = 13
          Caption = 'Tipo SRT Estab.'
        end
        inline fraTipoFiltroSRT: TfraCtbTablas
          Left = 85
          Top = 27
          Width = 352
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            352
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 64
            Width = 289
          end
          inherited edCodigo: TPatternEdit
            Width = 59
          end
        end
        object cmbTipoEmpresaPrev: TCheckCombo
          Left = 86
          Top = 3
          Width = 352
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object tbAfiliaciones: TTabSheet
        Caption = 'Afiliaciones'
        ImageIndex = 2
        DesignSize = (
          731
          131)
        object Label47: TLabel
          Left = 4
          Top = 35
          Width = 67
          Height = 13
          Caption = 'Departamento'
        end
        inline fraLocalidad: TfraLocalidadEx
          Left = 4
          Top = 5
          Width = 724
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            724
            25)
          inherited lbCPostal: TLabel
            Left = 0
          end
          inherited lbLocalidad: TLabel
            Left = 127
          end
          inherited lbProvincia: TLabel
            Left = 525
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 176
            Width = 345
          end
          inherited cmbProvincia: TCheckCombo
            Left = 571
            Width = 150
          end
          inherited edCPostal: TPatternEdit
            Left = 72
            Width = 47
          end
          inherited sdqDatos: TSDQuery
            Left = 162
            Top = 19
          end
          inherited dsDatos: TDataSource
            Left = 321
            Top = 22
          end
        end
        inline fraDepart: TfraCodDesc
          Left = 76
          Top = 30
          Width = 329
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            329
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 0
            Width = 325
          end
          inherited edCodigo: TPatternEdit
            Left = -250
            Anchors = [akTop, akRight]
            Visible = False
          end
          inherited sdqDatos: TSDQuery
            SQL.Strings = (
              '  SELECT  ROWNUM AS ID,'
              '          ROWNUM AS codigo,'
              '          cp_departamento AS descripcion,'
              '          '#39#39' AS baja'
              '    FROM  (SELECT  DISTINCT cp_departamento'
              '             FROM  art.ccp_codigopostal'
              '            WHERE  cp_departamento IS NOT NULL) depto'
              'ORDER BY  cp_departamento')
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'rownum'
            FieldDesc = 'cp_departamento'
            FieldID = 'rownum'
            IdType = ctInteger
            OrderBy = 'cp_departamento'
            TableName = 'art.ccp_codigopostal'
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 159
    Width = 739
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 735
      end>
    inherited ToolBar: TToolBar
      Width = 722
      object tbCantRegistros: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cant.Registros'
        Caption = 'Cant.Registros'
        ImageIndex = 48
        OnClick = tbCantRegistrosClick
      end
      object tbConsSiniestros: TToolButton
        Left = 393
        Top = 0
        Hint = 'Consulta de Siniestros'
        Caption = 'Consulta de Siniestros'
        ImageIndex = 53
        OnClick = tbConsSiniestrosClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 188
    Width = 739
    Height = 249
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'PREV'
        Title.Caption = 'Preventor'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRECOORDINADOR'
        Title.Caption = 'Nombre Coordinador'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTABLECIMIENTO'
        Title.Caption = 'Estab.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBESTAB'
        Title.Caption = 'Nombre Estab.'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOSRT'
        Title.Caption = 'Tipo SRT'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPPREV'
        Title.Caption = 'Tipo Prevenci'#243'n'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACT'
        Title.Caption = 'Actividad'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EVENTUAL'
        Title.Caption = 'Eventual'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTEMP'
        Title.Caption = 'Cant.Empleados'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEMP'
        Title.Caption = 'Tel'#233'fonos Empresa'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODPOST'
        Title.Caption = 'C.Postal'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPA'
        Title.Caption = 'C.Postal Arg. '
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART'
        Title.Caption = 'Partido'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIIU'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCIUU'
        Title.Caption = 'Desc. CIIU'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        Title.Caption = 'Provincia'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEANEXO1'
        Title.Caption = 'Tiene Anexo 1'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEANEXO2'
        Title.Caption = 'Tiene Anexo 2'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEANEXOFICTICIO'
        Title.Caption = 'Tiene Anexo Ficticio'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEDENGRAL'
        Title.Caption = 'Tiene Denuncia Gral.'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEDEN'
        Title.Caption = 'Tiene Denuncias'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEPRS'
        Title.Caption = 'Tiene PRS'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTVISITAS'
        Title.Caption = 'Ult. Visita'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVULTVISITA'
        Title.Caption = 'Prev.Ult.Visita'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTRELEVAMIENTO'
        Title.Caption = 'Ult. Relevamniento'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTCAPACITACION'
        Title.Caption = 'Ult. Capacitaci'#243'n'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FINICIOOBRA'
        Title.Caption = 'Fecha Incio Obra'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEXTOBRA'
        Title.Caption = 'Fecha Ext. Obra'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FFINOBRA'
        Title.Caption = 'Fecha Fin Obra'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREAPROGRAMA'
        Title.Caption = 'Tarea'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAPROGRAMA'
        Title.Caption = 'Fecha Tarea Desde'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAPROGRAMAFIN'
        Title.Caption = 'Fecha Tarea Hasta'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREACANCER'
        Title.Caption = 'Tarea Res. 415/02 Actual'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHACANCER'
        Title.Caption = 'Fecha Res. 415/02 Desde Actual'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHACANCERFIN'
        Title.Caption = 'Fecha Res. 415/02 Hasta Actual'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREACANCERANT'
        Title.Caption = 'Tarea Res. 415/02 Anterior'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHACANCERANT'
        Title.Caption = 'Fecha Res. 415/02 Desde Anterior'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHACANCERFINANT'
        Title.Caption = 'Fecha Res. 415/02 Hasta Anterior'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREADIFENILOS'
        Title.Caption = 'Tarea Difenilos Actual'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHADIFENILOS'
        Title.Caption = 'Fecha Difenilos Desde Actual'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHADIFENILOSFIN'
        Title.Caption = 'Fecha Difenilos Hasta Actual'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREADIFENILOSANT'
        Title.Caption = 'Tarea Difenilos Anterior'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHADIFENILOSANT'
        Title.Caption = 'Fecha Difenilos Desde Anterior'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHADIFENILOSFINANT'
        Title.Caption = 'Fecha Difenilos Hasta Anterior'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREAACCMAYORES'
        Title.Caption = 'Tareas Acc. Mayores'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAACCMAYOR'
        Title.Caption = 'Fecha Acc. Mayores Desde'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAACCMAYORESFIN'
        Title.Caption = 'Fecha Acc. Mayores Hasta'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREA463'
        Title.Caption = 'Tarea FGRL Res.463'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA463'
        Title.Caption = 'Fecha FGRL Res.463 Desde'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHA463FIN'
        Title.Caption = 'Fecha FGRL Res.463 Hasta'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAR'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPACITAR'
        Title.Caption = 'Capacitar'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREAMAPARIESGOS'
        Title.Caption = 'Mapa Riesgos'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAMAPARIESGOS'
        Title.Caption = 'Fecha Mapa Riesgos Desde'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAMRIESGOSFIN'
        Title.Caption = 'Fecha Mapa Riesgos Hasta'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXISTENVENCIDOS'
        Title.Caption = 'Existen Vencidos'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VISITASOPERATIVO'
        Title.Caption = 'Visitas Operativo'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECUENCIAVISITA'
        Title.Caption = 'Frecuencia Visita (A'#241'o)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREAINVENFERMEDAD'
        Title.Caption = 'Tarea Investigaci'#243'n Enfermedad'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAINVENFERMEDAD'
        Title.Caption = 'Fecha Investigaci'#243'n Enfermedad Desde'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAINVENFERMEDADFIN'
        Title.Caption = 'Fecha Investigaci'#243'n Enfermedad Hasta'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREAMEDIDAENFERMEDAD'
        Title.Caption = 'Tarea Medida Enfermedad'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAMEDIDAENFERMEDAD'
        Title.Caption = 'Fecha Medida Enfermedad Desde'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAMEDIDAENFERMEDADFIN'
        Title.Caption = 'Fecha Medida Enfermedad Hasta'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREAINVACCIDENTE'
        Title.Caption = 'Tarea Investigaci'#243'n Accidente'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAINVACCIDENTE'
        Title.Caption = 'Fecha Investigaci'#243'n Accidente Desde'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAINVACCIDENTEFIN'
        Title.Caption = 'Fecha Investigaci'#243'n Accidente Hasta'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREAMEDIDAACCIDENTE'
        Title.Caption = 'Tarea Medida Accidente'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAMEDIDAACCIDENTE'
        Title.Caption = 'Fecha Medida Accidente Desde'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAMEDIDAACCIDENTEFIN'
        Title.Caption = 'Fecha Medida Accidente Hasta'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREAPRAM'
        Title.Caption = 'Tarea PRAM'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAPRAM'
        Title.Caption = 'Fecha PRAM Desde'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAPRAMFIN'
        Title.Caption = 'Fecha PRAM Hasta'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREAPROGRAMAANEXA'
        Title.Caption = 'Tarea Programa Anexa'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAPROGRAMAANEXA'
        Title.Caption = 'Fecha Programa Anexa Desde'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAPROGRAMAANEXAFIN'
        Title.Caption = 'Fecha Programa Anexa Hasta'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_HACERFGRL'
        Title.Caption = 'Confeccionar FGRL (solo si hay otra tarea)'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FRECUENCIAPERSONALIZADA'
        Title.Caption = 'Periodicidad Redefinida'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREACONSTRUCCION'
        Title.Caption = 'Tarea Construcci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHACONSTRUCCION'
        Title.Caption = 'Fecha Construcci'#243'n Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHACONSTRUCCIONFIN'
        Title.Caption = 'Fecha Construcci'#243'n Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREARECLAMO'
        Title.Caption = 'Tarea Reclamo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHATAREARECLAMO'
        Title.Caption = 'Fecha Reclamo Desde'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHATAREARECLAMOFIN'
        Title.Caption = 'Fecha Reclamo Hasta'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREARECLAMOANEXA'
        Title.Caption = 'Tarea Reclamo Anexa'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHATAREARECLAMOANEXA'
        Title.Caption = 'Fecha Reclamo Anexa Desde'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHATAREARECLAMOANEXAFIN'
        Title.Caption = 'Fecha Reclamo Anexa Hasta'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_TAREARECLAMOANEXA2'
        Title.Caption = 'Tarea Reclamo Anexa2'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHATAREARECLAMOANEXA2'
        Title.Caption = 'Fecha Reclamo Anexa2 Desde'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHATAREARECLAMOANEXAFIN2'
        Title.Caption = 'Fecha Reclamo Anexa2 Hasta'
        Width = 150
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT tp_nombrepreventor prev, tp_cuit cuit, tp_razonsocial raz' +
        'onsocial, tp_contrato contrato,'
      
        '       tp_establecimiento establecimiento, tp_nombreestab nombes' +
        'tab, tp_tiposrt tiposrt, tp_tipoprevencion tipprev,'
      
        '       tp_actividad act, tp_eventual eventual, tp_cantemple cant' +
        'emp, tp_telefonosempresa telemp, tp_domicilio domicilio,'
      
        '       tp_localidad localidad, tp_cpostal codpost, tp_cpostalarg' +
        ' cpa, tp_partido part, tp_ciiu ciiu, tp_descciiu desciuu,'
      
        '       tp_provincia prov, tp_tieneanexo1 tieneanexo1, tp_tienean' +
        'exo2 tieneanexo2, tp_tieneanexoficticio tieneanexoficticio,'
      
        '       tp_tienedenunciagral tienedengral, tp_tienedenuncias tien' +
        'eden, tp_tieneprs tieneprs, tp_ultvisita ultvisitas,'
      
        '       tp_prevultvisita prevultvisita, tp_ultrelevamniento ultre' +
        'levamiento, tp_ultcapacitacion ultcapacitacion,'
      
        '       tp_fechaincioobra finicioobra, tp_fechaextobra fextobra, ' +
        'tp_fechafinobra ffinobra, tp_idtipoestabprev, tp_itcodigo,'
      
        '       tp_itcoordinador, tp_tareaprograma tareaprograma, tp_fech' +
        'aprograma fechaprograma, tp_tareaaccidente tareaaccidente,'
      
        '       tp_fechaaccidente fechaaccidente, tp_tareaenfermedad tare' +
        'aenfermedad, tp_fechaenfermedad fechaenfermedad,'
      
        '       tp_tareacancer tareacancer, tp_fechacancer fechacancer, t' +
        'p_fechacancerfin, tp_tareadifenilos tareadifenilos,'
      
        '       tp_fechadifenilos fechadifenilos, tp_fechadifenilosfin, t' +
        'p_tareaaccmayores tareaaccmayores,'
      
        '       tp_fechaaccmayores fechaaccmayor, tp_fechaaccmayoresfin, ' +
        'tp_tarea463 tarea463, tp_fecha463 fecha463, tp_fecha463fin,'
      
        '       tp_rar rar, tp_capacitar capacitar, tp_tareamapariesgos t' +
        'areamapariesgos, tp_fechamapariesgos fechamapariesgos,'
      
        '       tp_siniestroenf siniestroenf, tp_siniestroacc siniestroac' +
        'c, tp_existenvencidos existenvencidos, tp_vigenciahasta,'
      
        '       tp_idempresa, tp_tercerizado, tp_visitasoperativo visitas' +
        'operativo, tp_visitaporfrecuencia visitaporfrecuencia,'
      
        '       tp_frecuenciavisita frecuenciavisita, tp_idprovincia, tp_' +
        'tareainvenfermedad, tp_fechainvenfermedad,'
      
        '       tp_tareamedidaenfermedad, tp_fechamedidaenfermedad, tp_ta' +
        'reainvaccidente, tp_fechainvaccidente, tp_tareamedidaaccidente,'
      '       tp_fechamedidaaccidente, (SELECT it_nombre'
      '                                   FROM art.pit_firmantes'
      
        '                                  WHERE it_codigo = tp_itcoordin' +
        'ador) nombrecoordinador, tp_fechaprogramafin,'
      
        '       tp_fechamriesgosfin, tp_fechainvaccidentefin, tp_fechainv' +
        'enfermedadfin, tp_fechamedidaaccidentefin,'
      
        '       tp_fechamedidaenfermedadfin, tp_tareapram, tp_fechapram, ' +
        'tp_fechapramfin, tp_tareaprogramaanexa, tp_fechaprogramaanexa,'
      
        '       tp_fechaprogramaanexafin, DECODE(tp_hacerfgrl, '#39'S'#39', '#39'Conf' +
        'eccionar RGRL Res. 463'#39', '#39#39') tp_hacerfgrl,'
      
        '       tp_frecuenciapersonalizada, tp_tareacancerant, tp_fechaca' +
        'ncerant, tp_fechacancerfinant, tp_tareadifenilosant,'
      '       tp_fechadifenilosant, tp_fechadifenilosfinant,'
      
        '       tp_tareaconstruccion, tp_idtareaconstruccion, tp_fechacon' +
        'struccion, tp_fechaconstruccionfin,'
      
        '       tp_idtareareclamo, tp_tareareclamo, tp_fechatareareclamo,' +
        ' tp_fechatareareclamofin, tp_idtareareclamoanexa, tp_tareareclam' +
        'oanexa,'
      
        '       tp_fechatareareclamoanexa, tp_fechatareareclamoanexafin, ' +
        'tp_idtareareclamoanexa2, tp_tareareclamoanexa2,'
      '       tp_fechatareareclamoanexa2, tp_fechatareareclamoanexafin2'
      '  FROM hys.htp_tareasprevencion'
      ' WHERE 1 = 1')
    object sdqConsultaPREV: TStringField
      FieldName = 'PREV'
      Size = 255
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaRAZONSOCIAL: TStringField
      FieldName = 'RAZONSOCIAL'
      Required = True
      Size = 200
    end
    object sdqConsultaCONTRATO: TFloatField
      FieldName = 'CONTRATO'
      Required = True
    end
    object sdqConsultaESTABLECIMIENTO: TFloatField
      FieldName = 'ESTABLECIMIENTO'
      Required = True
    end
    object sdqConsultaNOMBESTAB: TStringField
      FieldName = 'NOMBESTAB'
      Required = True
      Size = 100
    end
    object sdqConsultaTIPOSRT: TStringField
      FieldName = 'TIPOSRT'
      Required = True
      Size = 2
    end
    object sdqConsultaTIPPREV: TStringField
      FieldName = 'TIPPREV'
      Required = True
      Size = 10
    end
    object sdqConsultaACT: TStringField
      FieldName = 'ACT'
      Required = True
      Size = 1
    end
    object sdqConsultaEVENTUAL: TStringField
      FieldName = 'EVENTUAL'
      Size = 1
    end
    object sdqConsultaCANTEMP: TFloatField
      FieldName = 'CANTEMP'
    end
    object sdqConsultaTELEMP: TStringField
      FieldName = 'TELEMP'
      Size = 60
    end
    object sdqConsultaDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqConsultaLOCALIDAD: TStringField
      FieldName = 'LOCALIDAD'
      Size = 60
    end
    object sdqConsultaCODPOST: TStringField
      FieldName = 'CODPOST'
      Size = 5
    end
    object sdqConsultaCPA: TStringField
      FieldName = 'CPA'
      Size = 8
    end
    object sdqConsultaPART: TStringField
      FieldName = 'PART'
      Size = 255
    end
    object sdqConsultaCIIU: TStringField
      FieldName = 'CIIU'
      Size = 6
    end
    object sdqConsultaDESCIUU: TStringField
      FieldName = 'DESCIUU'
      Size = 200
    end
    object sdqConsultaPROV: TStringField
      FieldName = 'PROV'
      Size = 255
    end
    object sdqConsultaTIENEANEXO1: TStringField
      FieldName = 'TIENEANEXO1'
      Required = True
      Size = 1
    end
    object sdqConsultaTIENEANEXO2: TStringField
      FieldName = 'TIENEANEXO2'
      Required = True
      Size = 1
    end
    object sdqConsultaTIENEANEXOFICTICIO: TStringField
      FieldName = 'TIENEANEXOFICTICIO'
      Required = True
      Size = 1
    end
    object sdqConsultaTIENEDENGRAL: TStringField
      FieldName = 'TIENEDENGRAL'
      Required = True
      Size = 1
    end
    object sdqConsultaTIENEDEN: TStringField
      FieldName = 'TIENEDEN'
      Required = True
      Size = 1
    end
    object sdqConsultaTIENEPRS: TStringField
      FieldName = 'TIENEPRS'
      Required = True
      Size = 1
    end
    object sdqConsultaULTVISITAS: TDateTimeField
      FieldName = 'ULTVISITAS'
    end
    object sdqConsultaPREVULTVISITA: TStringField
      FieldName = 'PREVULTVISITA'
      Size = 255
    end
    object sdqConsultaULTRELEVAMIENTO: TDateTimeField
      FieldName = 'ULTRELEVAMIENTO'
    end
    object sdqConsultaULTCAPACITACION: TDateTimeField
      FieldName = 'ULTCAPACITACION'
    end
    object sdqConsultaFINICIOOBRA: TDateTimeField
      FieldName = 'FINICIOOBRA'
    end
    object sdqConsultaFEXTOBRA: TDateTimeField
      FieldName = 'FEXTOBRA'
    end
    object sdqConsultaFFINOBRA: TDateTimeField
      FieldName = 'FFINOBRA'
    end
    object sdqConsultaTP_IDTIPOESTABPREV: TFloatField
      FieldName = 'TP_IDTIPOESTABPREV'
    end
    object sdqConsultaTP_ITCODIGO: TStringField
      FieldName = 'TP_ITCODIGO'
      Size = 12
    end
    object sdqConsultaTP_ITCOORDINADOR: TStringField
      FieldName = 'TP_ITCOORDINADOR'
      Size = 12
    end
    object sdqConsultaTAREAPROGRAMA: TStringField
      FieldName = 'TAREAPROGRAMA'
      Size = 255
    end
    object sdqConsultaFECHAPROGRAMA: TDateTimeField
      FieldName = 'FECHAPROGRAMA'
    end
    object sdqConsultaTAREAACCIDENTE: TStringField
      FieldName = 'TAREAACCIDENTE'
      Size = 255
    end
    object sdqConsultaFECHAACCIDENTE: TDateTimeField
      FieldName = 'FECHAACCIDENTE'
    end
    object sdqConsultaTAREAENFERMEDAD: TStringField
      FieldName = 'TAREAENFERMEDAD'
      Size = 255
    end
    object sdqConsultaFECHAENFERMEDAD: TDateTimeField
      FieldName = 'FECHAENFERMEDAD'
    end
    object sdqConsultaTAREACANCER: TStringField
      FieldName = 'TAREACANCER'
      Size = 255
    end
    object sdqConsultaFECHACANCER: TDateTimeField
      FieldName = 'FECHACANCER'
    end
    object sdqConsultaTP_FECHACANCERFIN: TDateTimeField
      FieldName = 'TP_FECHACANCERFIN'
    end
    object sdqConsultaTAREADIFENILOS: TStringField
      FieldName = 'TAREADIFENILOS'
      Size = 255
    end
    object sdqConsultaFECHADIFENILOS: TDateTimeField
      FieldName = 'FECHADIFENILOS'
    end
    object sdqConsultaTP_FECHADIFENILOSFIN: TDateTimeField
      FieldName = 'TP_FECHADIFENILOSFIN'
    end
    object sdqConsultaTAREAACCMAYORES: TStringField
      FieldName = 'TAREAACCMAYORES'
      Size = 255
    end
    object sdqConsultaFECHAACCMAYOR: TDateTimeField
      FieldName = 'FECHAACCMAYOR'
    end
    object sdqConsultaTP_FECHAACCMAYORESFIN: TDateTimeField
      FieldName = 'TP_FECHAACCMAYORESFIN'
    end
    object sdqConsultaTAREA463: TStringField
      FieldName = 'TAREA463'
      Size = 255
    end
    object sdqConsultaFECHA463: TDateTimeField
      FieldName = 'FECHA463'
    end
    object sdqConsultaTP_FECHA463FIN: TDateTimeField
      FieldName = 'TP_FECHA463FIN'
    end
    object sdqConsultaRAR: TStringField
      FieldName = 'RAR'
      Size = 255
    end
    object sdqConsultaCAPACITAR: TStringField
      FieldName = 'CAPACITAR'
      Size = 255
    end
    object sdqConsultaTAREAMAPARIESGOS: TStringField
      FieldName = 'TAREAMAPARIESGOS'
      Size = 255
    end
    object sdqConsultaFECHAMAPARIESGOS: TDateTimeField
      FieldName = 'FECHAMAPARIESGOS'
    end
    object sdqConsultaSINIESTROENF: TFloatField
      FieldName = 'SINIESTROENF'
    end
    object sdqConsultaSINIESTROACC: TFloatField
      FieldName = 'SINIESTROACC'
    end
    object sdqConsultaEXISTENVENCIDOS: TStringField
      FieldName = 'EXISTENVENCIDOS'
      Size = 1
    end
    object sdqConsultaTP_VIGENCIAHASTA: TDateTimeField
      FieldName = 'TP_VIGENCIAHASTA'
    end
    object sdqConsultaTP_IDEMPRESA: TFloatField
      FieldName = 'TP_IDEMPRESA'
    end
    object sdqConsultaTP_TERCERIZADO: TStringField
      FieldName = 'TP_TERCERIZADO'
      Size = 1
    end
    object sdqConsultaVISITASOPERATIVO: TFloatField
      FieldName = 'VISITASOPERATIVO'
    end
    object sdqConsultaVISITAPORFRECUENCIA: TFloatField
      FieldName = 'VISITAPORFRECUENCIA'
    end
    object sdqConsultaFRECUENCIAVISITA: TFloatField
      FieldName = 'FRECUENCIAVISITA'
    end
    object sdqConsultaTP_IDPROVINCIA: TFloatField
      FieldName = 'TP_IDPROVINCIA'
    end
    object sdqConsultaTP_TAREAINVENFERMEDAD: TStringField
      FieldName = 'TP_TAREAINVENFERMEDAD'
      Size = 255
    end
    object sdqConsultaTP_FECHAINVENFERMEDAD: TDateTimeField
      FieldName = 'TP_FECHAINVENFERMEDAD'
    end
    object sdqConsultaTP_TAREAMEDIDAENFERMEDAD: TStringField
      FieldName = 'TP_TAREAMEDIDAENFERMEDAD'
      Size = 255
    end
    object sdqConsultaTP_FECHAMEDIDAENFERMEDAD: TDateTimeField
      FieldName = 'TP_FECHAMEDIDAENFERMEDAD'
    end
    object sdqConsultaTP_TAREAINVACCIDENTE: TStringField
      FieldName = 'TP_TAREAINVACCIDENTE'
      Size = 255
    end
    object sdqConsultaTP_FECHAINVACCIDENTE: TDateTimeField
      FieldName = 'TP_FECHAINVACCIDENTE'
    end
    object sdqConsultaTP_TAREAMEDIDAACCIDENTE: TStringField
      FieldName = 'TP_TAREAMEDIDAACCIDENTE'
      Size = 255
    end
    object sdqConsultaTP_FECHAMEDIDAACCIDENTE: TDateTimeField
      FieldName = 'TP_FECHAMEDIDAACCIDENTE'
    end
    object sdqConsultaNOMBRECOORDINADOR: TStringField
      FieldName = 'NOMBRECOORDINADOR'
      Size = 255
    end
    object sdqConsultaTP_FECHAPROGRAMAFIN: TDateTimeField
      FieldName = 'TP_FECHAPROGRAMAFIN'
    end
    object sdqConsultaTP_FECHAMRIESGOSFIN: TDateTimeField
      FieldName = 'TP_FECHAMRIESGOSFIN'
    end
    object sdqConsultaTP_FECHAINVACCIDENTEFIN: TDateTimeField
      FieldName = 'TP_FECHAINVACCIDENTEFIN'
    end
    object sdqConsultaTP_FECHAINVENFERMEDADFIN: TDateTimeField
      FieldName = 'TP_FECHAINVENFERMEDADFIN'
    end
    object sdqConsultaTP_FECHAMEDIDAACCIDENTEFIN: TDateTimeField
      FieldName = 'TP_FECHAMEDIDAACCIDENTEFIN'
    end
    object sdqConsultaTP_FECHAMEDIDAENFERMEDADFIN: TDateTimeField
      FieldName = 'TP_FECHAMEDIDAENFERMEDADFIN'
    end
    object sdqConsultaTP_TAREAPRAM: TStringField
      FieldName = 'TP_TAREAPRAM'
      Size = 255
    end
    object sdqConsultaTP_FECHAPRAM: TDateTimeField
      FieldName = 'TP_FECHAPRAM'
    end
    object sdqConsultaTP_FECHAPRAMFIN: TDateTimeField
      FieldName = 'TP_FECHAPRAMFIN'
    end
    object sdqConsultaTP_TAREAPROGRAMAANEXA: TStringField
      FieldName = 'TP_TAREAPROGRAMAANEXA'
      Size = 255
    end
    object sdqConsultaTP_FECHAPROGRAMAANEXA: TDateTimeField
      FieldName = 'TP_FECHAPROGRAMAANEXA'
    end
    object sdqConsultaTP_FECHAPROGRAMAANEXAFIN: TDateTimeField
      FieldName = 'TP_FECHAPROGRAMAANEXAFIN'
    end
    object sdqConsultaTP_HACERFGRL: TStringField
      FieldName = 'TP_HACERFGRL'
      Size = 26
    end
    object sdqConsultaTP_FRECUENCIAPERSONALIZADA: TFloatField
      FieldName = 'TP_FRECUENCIAPERSONALIZADA'
    end
    object sdqConsultaTP_TAREACANCERANT: TStringField
      FieldName = 'TP_TAREACANCERANT'
      Size = 255
    end
    object sdqConsultaTP_FECHACANCERANT: TDateTimeField
      FieldName = 'TP_FECHACANCERANT'
    end
    object sdqConsultaTP_FECHACANCERFINANT: TDateTimeField
      FieldName = 'TP_FECHACANCERFINANT'
    end
    object sdqConsultaTP_TAREADIFENILOSANT: TStringField
      FieldName = 'TP_TAREADIFENILOSANT'
      Size = 255
    end
    object sdqConsultaTP_FECHADIFENILOSANT: TDateTimeField
      FieldName = 'TP_FECHADIFENILOSANT'
    end
    object sdqConsultaTP_FECHADIFENILOSFINANT: TDateTimeField
      FieldName = 'TP_FECHADIFENILOSFINANT'
    end
    object sdqConsultaTP_TAREACONSTRUCCION: TStringField
      FieldName = 'TP_TAREACONSTRUCCION'
      Size = 255
    end
    object sdqConsultaTP_IDTAREACONSTRUCCION: TFloatField
      FieldName = 'TP_IDTAREACONSTRUCCION'
    end
    object sdqConsultaTP_FECHACONSTRUCCION: TDateTimeField
      FieldName = 'TP_FECHACONSTRUCCION'
    end
    object sdqConsultaTP_FECHACONSTRUCCIONFIN: TDateTimeField
      FieldName = 'TP_FECHACONSTRUCCIONFIN'
    end
    object sdqConsultaTP_IDTAREARECLAMO: TFloatField
      FieldName = 'TP_IDTAREARECLAMO'
    end
    object sdqConsultaTP_TAREARECLAMO: TStringField
      FieldName = 'TP_TAREARECLAMO'
      Size = 255
    end
    object sdqConsultaTP_FECHATAREARECLAMO: TDateTimeField
      FieldName = 'TP_FECHATAREARECLAMO'
    end
    object sdqConsultaTP_FECHATAREARECLAMOFIN: TDateTimeField
      FieldName = 'TP_FECHATAREARECLAMOFIN'
    end
    object sdqConsultaTP_IDTAREARECLAMOANEXA: TFloatField
      FieldName = 'TP_IDTAREARECLAMOANEXA'
    end
    object sdqConsultaTP_TAREARECLAMOANEXA: TStringField
      FieldName = 'TP_TAREARECLAMOANEXA'
      Size = 255
    end
    object sdqConsultaTP_FECHATAREARECLAMOANEXA: TDateTimeField
      FieldName = 'TP_FECHATAREARECLAMOANEXA'
    end
    object sdqConsultaTP_FECHATAREARECLAMOANEXAFIN: TDateTimeField
      FieldName = 'TP_FECHATAREARECLAMOANEXAFIN'
    end
    object sdqConsultaTP_IDTAREARECLAMOANEXA2: TFloatField
      FieldName = 'TP_IDTAREARECLAMOANEXA2'
    end
    object sdqConsultaTP_TAREARECLAMOANEXA2: TStringField
      FieldName = 'TP_TAREARECLAMOANEXA2'
      Size = 255
    end
    object sdqConsultaTP_FECHATAREARECLAMOANEXA2: TDateTimeField
      FieldName = 'TP_FECHATAREARECLAMOANEXA2'
    end
    object sdqConsultaTP_FECHATAREARECLAMOANEXAFIN2: TDateTimeField
      FieldName = 'TP_FECHATAREARECLAMOANEXAFIN2'
    end
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
  end
  object ShortCutControl1: TShortCutControl
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
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 256
  end
end
