inherited frmPlanVisitasDetalle: TfrmPlanVisitasDetalle
  Left = 402
  Top = 189
  Caption = 'Visitas Asignadas'
  ClientHeight = 434
  ClientWidth = 739
  ExplicitWidth = 747
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 0
    Top = 297
    Width = 739
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitTop = 300
  end
  inherited pnlFiltros: TPanel
    Width = 739
    Height = 180
    Visible = True
    ExplicitWidth = 739
    ExplicitHeight = 180
    object pcFilter: TPageControl
      Left = 0
      Top = 0
      Width = 739
      Height = 180
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          731
          152)
        object Label2: TLabel
          Left = 7
          Top = 33
          Width = 46
          Height = 13
          Caption = 'Preventor'
        end
        object Label9: TLabel
          Left = 5
          Top = 57
          Width = 57
          Height = 13
          Caption = 'Coordinador'
        end
        object Label1: TLabel
          Left = 7
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Per'#237'odo'
        end
        object Label4: TLabel
          Left = 4
          Top = 82
          Width = 76
          Height = 13
          Caption = 'Tipo Prev. Emp.'
        end
        object Label44: TLabel
          Left = 297
          Top = 108
          Width = 61
          Height = 13
          Caption = 'F.Alta Desde'
        end
        object Label46: TLabel
          Left = 455
          Top = 108
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label21: TLabel
          Left = 7
          Top = 110
          Width = 64
          Height = 13
          Caption = 'Fecha Desde'
        end
        object Label22: TLabel
          Left = 173
          Top = 110
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 64
          Top = 28
          Width = 532
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          ExplicitLeft = 64
          ExplicitTop = 28
          ExplicitWidth = 532
          DesignSize = (
            532
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 466
            CharCase = ecUpperCase
            ExplicitLeft = 68
            ExplicitWidth = 466
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
        inline fraCoordinadorFiltro: TfraCodigoDescripcion
          Left = 64
          Top = 52
          Width = 532
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          ExplicitLeft = 64
          ExplicitTop = 52
          ExplicitWidth = 532
          DesignSize = (
            532
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 466
            CharCase = ecUpperCase
            ExplicitLeft = 68
            ExplicitWidth = 466
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
        object chkSinPreventor: TCheckBox
          Left = 144
          Top = 5
          Width = 116
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Incluir Sin Preventor'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkExcluirBajas: TCheckBox
          Left = 270
          Top = 5
          Width = 78
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excluir Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cmbTipoEmpresaPrev: TCheckCombo
          Left = 89
          Top = 78
          Width = 352
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
        end
        object cbVerPreventorSugerido: TCheckBox
          Left = 357
          Top = 3
          Width = 85
          Height = 23
          Alignment = taLeftJustify
          Caption = 'Ver Preventor Sugerido'
          TabOrder = 3
          WordWrap = True
        end
        object edFechaAltaDesde: TDateComboBox
          Left = 360
          Top = 104
          Width = 88
          Height = 21
          TabOrder = 5
        end
        object edFechaAltaHasta: TDateComboBox
          Left = 487
          Top = 104
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object edFechaDesdeFiltro: TDateComboBox
          Left = 80
          Top = 106
          Width = 88
          Height = 21
          TabOrder = 12
        end
        object edFechaHastaFiltro: TDateComboBox
          Left = 204
          Top = 106
          Width = 88
          Height = 21
          TabOrder = 13
        end
        inline fraProcesoFiltro: TfraCodigoDescripcion
          Left = 64
          Top = 3
          Width = 78
          Height = 23
          TabOrder = 0
          ExplicitLeft = 64
          ExplicitTop = 3
          ExplicitWidth = 78
          DesignSize = (
            78
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 1
            Width = 77
            CharCase = ecUpperCase
            ExplicitLeft = 1
            ExplicitWidth = 77
          end
          inherited edCodigo: TPatternEdit
            Left = 22
            Width = 17
            CharCase = ecNormal
            Visible = False
            ExplicitLeft = 22
            ExplicitWidth = 17
          end
        end
        object chkPrioritarias: TCheckBox
          Left = 610
          Top = 1
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Prioritarias'
          TabOrder = 14
        end
        object chkCompensatorias: TCheckBox
          Left = 610
          Top = 16
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Compensatorias'
          TabOrder = 15
        end
        object chkNoProgramadas: TCheckBox
          Left = 610
          Top = 75
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'No Programadas'
          TabOrder = 19
        end
        object chkEmergentes: TCheckBox
          Left = 610
          Top = 60
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Emergentes'
          TabOrder = 18
        end
        object chkCompensatoriasManual: TCheckBox
          Left = 610
          Top = 44
          Width = 122
          Height = 19
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Compen.Manual'
          TabOrder = 17
        end
        object chkCompensatoriasOtroPeriodo: TCheckBox
          Left = 610
          Top = 31
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Compen.Otro Per'#237'odo'
          TabOrder = 16
        end
        object chkProgramadaOtroAnio: TCheckBox
          Left = 610
          Top = 120
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = '>= 13 Meses'
          TabOrder = 22
          OnClick = chkProgramadaOtroAnioClick
        end
        object chkPrioritariasOtroPeriodo: TCheckBox
          Left = 610
          Top = 90
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Prior. Otro Per'#237'odo'
          TabOrder = 20
        end
        object chkEmergentesOtroPeriodo: TCheckBox
          Left = 610
          Top = 105
          Width = 122
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Emerg. Otro Per'#237'odo'
          TabOrder = 21
        end
        object cbVerPreventorAnterior: TCheckBox
          Left = 457
          Top = 3
          Width = 85
          Height = 23
          Alignment = taLeftJustify
          Caption = 'Ver Preventor Anterior'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          WordWrap = True
          OnClick = cbVerPreventorAnteriorClick
        end
        object chkIncluidoRes771: TCheckBox
          Left = 447
          Top = 80
          Width = 93
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'En Res.771   SI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15073280
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object chkNoIncluidoRes771: TCheckBox
          Left = 546
          Top = 80
          Width = 36
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object chkNoVisitados: TCheckBox
          Left = 650
          Top = 134
          Width = 82
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'No Visitados'
          TabOrder = 23
        end
      end
      object tbAfiliaciones: TTabSheet
        Caption = 'Afiliaciones'
        ImageIndex = 2
        DesignSize = (
          731
          152)
        object Label47: TLabel
          Left = 4
          Top = 83
          Width = 67
          Height = 13
          Caption = 'Departamento'
        end
        object Label5: TLabel
          Left = 4
          Top = 104
          Width = 31
          Height = 13
          Caption = 'Sector'
        end
        object Label18: TLabel
          Left = 5
          Top = 9
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label19: TLabel
          Left = 5
          Top = 33
          Width = 30
          Height = 13
          Caption = 'Estab.'
        end
        object lbAct: TLabel
          Left = 519
          Top = 82
          Width = 47
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'CIIU Viejo'
        end
        object Label23: TLabel
          Left = 519
          Top = 106
          Width = 54
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'CIIU Actual'
        end
        inline fraLocalidad: TfraLocalidadEx
          Left = 4
          Top = 53
          Width = 724
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 4
          ExplicitTop = 53
          ExplicitWidth = 724
          ExplicitHeight = 25
          DesignSize = (
            724
            25)
          inherited lbCPostal: TLabel
            Left = 0
            Width = 39
            ExplicitLeft = 0
            ExplicitWidth = 39
          end
          inherited lbLocalidad: TLabel
            Left = 127
            Width = 46
            ExplicitLeft = 127
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 525
            Width = 44
            ExplicitLeft = 525
            ExplicitWidth = 44
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 176
            Width = 345
            ExplicitLeft = 176
            ExplicitWidth = 345
          end
          inherited cmbProvincia: TCheckCombo
            Left = 571
            Width = 150
            ExplicitLeft = 571
            ExplicitWidth = 150
          end
          inherited edCPostal: TPatternEdit
            Left = 72
            Width = 47
            ExplicitLeft = 72
            ExplicitWidth = 47
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
          Top = 78
          Width = 329
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 76
          ExplicitTop = 78
          ExplicitWidth = 329
          DesignSize = (
            329
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 0
            Width = 325
            OnChange = fraDepartcmbDescripcionChange
            OnExit = fraDepartcmbDescripcionExit
            ExplicitLeft = 0
            ExplicitWidth = 325
          end
          inherited edCodigo: TPatternEdit
            Left = -250
            Anchors = [akTop, akRight]
            Visible = False
            ExplicitLeft = -250
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
        object cmbSector: TCheckCombo
          Left = 76
          Top = 104
          Width = 325
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object rgEmpresa: TRadioGroup
          Left = 410
          Top = 75
          Width = 99
          Height = 57
          Anchors = [akTop, akRight]
          Caption = 'Empresa'
          ItemIndex = 0
          Items.Strings = (
            'Todas'
            'Afiliada'
            'No Afiliada')
          TabOrder = 3
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 78
          Top = 3
          Width = 646
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
          TabOrder = 4
          ExplicitLeft = 78
          ExplicitTop = 3
          ExplicitWidth = 646
          ExplicitHeight = 21
          DesignSize = (
            646
            21)
          inherited lbContrato: TLabel
            Left = 542
            ExplicitLeft = 542
          end
          inherited edContrato: TIntEdit
            Left = 589
            ExplicitLeft = 589
          end
          inherited cmbRSocial: TArtComboBox
            Width = 407
            ExplicitWidth = 407
          end
        end
        object edEstablecimiento: TPatternEdit
          Left = 77
          Top = 29
          Width = 645
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Pattern = '1234567890,'
        end
        object edActividadVieja: TIntEdit
          Left = 575
          Top = 78
          Width = 47
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 6
          MaxLength = 8
        end
        object edActividadActual: TIntEdit
          Left = 575
          Top = 102
          Width = 47
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 7
          MaxLength = 8
        end
      end
      object tbTareas: TTabSheet
        Caption = 'Tareas'
        ImageIndex = 2
        DesignSize = (
          731
          152)
        object Label24: TLabel
          Left = 416
          Top = 11
          Width = 128
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Tareas seg'#250'n tipo empresa'
        end
        object cmbTareasSegunTipoEmpresa: TCheckCombo
          Left = 550
          Top = 7
          Width = 177
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        inline fraTareasSeleccion: TfraMultiSeleccion
          Left = 3
          Top = 2
          Width = 405
          Height = 134
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 2
          ExplicitWidth = 405
          ExplicitHeight = 134
          inherited pnlFilterPanel: TPanel
            Width = 405
            ExplicitWidth = 405
            inherited imgSearch: TImage
              Left = 382
              ExplicitLeft = 382
            end
            inherited edSearch: TEdit
              Width = 380
              ExplicitWidth = 380
            end
            inherited CoolBar: TCoolBar
              Width = 405
              Bands = <
                item
                  Control = fraTareasSeleccion.ToolBar
                  ImageIndex = -1
                  MinHeight = 27
                  Width = 399
                end>
              ExplicitWidth = 405
              inherited ToolBar: TToolBar
                Width = 392
                ExplicitWidth = 392
              end
            end
          end
          inherited lstMultiSeleccion: TARTCheckListBox
            Width = 405
            Height = 80
            Columns = 1
            AutoAjustarColumnas = True
            ExplicitWidth = 405
            ExplicitHeight = 80
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 180
    Width = 739
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 733
      end>
    ExplicitTop = 180
    ExplicitWidth = 739
    inherited ToolBar: TToolBar
      Width = 726
      ExplicitWidth = 726
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited ToolButton11: TToolButton
        Left = 0
        Wrap = True
        ExplicitLeft = 0
        ExplicitHeight = 30
      end
      inherited tbSalir: TToolButton
        Left = 0
        Top = 30
        ExplicitLeft = 0
        ExplicitTop = 30
      end
      object tbNoRealizar: TToolButton
        Left = 23
        Top = 30
        Hint = 'No Realizar'
        Caption = 'No Realizar'
        ImageIndex = 39
        OnClick = tbNoRealizarClick
      end
      object tbReasignarTareas: TToolButton
        Left = 46
        Top = 30
        Hint = 'Reasignar Tareas'
        Caption = 'Reasignar Tareas'
        ImageIndex = 26
        OnClick = tbReasignarTareasClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 69
        Top = 30
        Hint = 'Eliminar Selecci'#243'n'
        Caption = 'Eliminar Selecci'#243'n'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 92
        Top = 30
        Hint = 'Seleccionar Todo'
        Caption = 'Seleccionar Todo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
      object tbCP: TToolButton
        Left = 115
        Top = 30
        Hint = 'Consulta de CP asignados'
        Caption = 'tbCP'
        ImageIndex = 49
        OnClick = tbCPClick
      end
      object tbAsignacionManual: TToolButton
        Left = 138
        Top = 30
        Hint = 'Asignaci'#243'n Manual'
        Caption = 'Asignaci'#243'n Manual'
        ImageIndex = 50
        OnClick = tbAsignacionManualClick
      end
      object tbSumatoria: TToolButton
        Left = 161
        Top = 30
        Hint = 'Sumatoria'
        Caption = 'Sumatoria'
        ImageIndex = 48
        OnClick = tbSumatoriaClick
      end
      object Panel1: TPanel
        Left = 184
        Top = 30
        Width = 330
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkParcial: TCheckBox
          Left = 84
          Top = 2
          Width = 54
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Parcial'
          Color = 10021355
          ParentColor = False
          TabOrder = 0
        end
        object chkTerminado: TCheckBox
          Left = 145
          Top = 2
          Width = 69
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Terminado'
          Color = clMoneyGreen
          ParentColor = False
          TabOrder = 1
        end
        object chkPendiente: TCheckBox
          Left = 8
          Top = 2
          Width = 66
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Pendiente'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
        object chkTerminadoUCAP: TCheckBox
          Left = 217
          Top = 2
          Width = 102
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Terminado UCAP'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 209
    Width = 739
    Height = 88
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_ESTABLECI'
        Title.Caption = 'Nro.Estab.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre Estab.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COORDINADOR'
        Title.Caption = 'Coordinador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_TAREA'
        Title.Caption = 'Tareas'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHADESDE'
        Title.Caption = 'Fecha Desde'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHAHASTA'
        Title.Caption = 'Fecha Hasta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_MES'
        Title.Caption = 'Per'#237'odo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOVISITA'
        Title.Caption = 'Tipo Visita'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOESTABSRT'
        Title.Caption = 'Tipo Estab.SRT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOESTABPREV'
        Title.Caption = 'Tipo Estab.Prev'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPREVEMPRESA'
        Title.Caption = 'Tipo Empresa Prev.'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOEMPRESASRT'
        Title.Caption = 'Tipo Emp.SRT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLEADOS'
        Title.Caption = 'Empleados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_TELEFONOS'
        Title.Caption = 'Tel.Empresa'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'C.Postal'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTALA'
        Title.Caption = 'C.Postal Arg.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        Title.Caption = 'Provincia'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_USUALTA'
        Title.Caption = 'Usu. Alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_USUMODIF'
        Title.Caption = 'Usu. Modif'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOBAJA'
        Title.Caption = 'Motivo Baja'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 250
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
        Expanded = False
        FieldName = 'MR_DESCRIPCION'
        Title.Caption = 'Motivo Reasignaci'#243'n Tarea'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_OBSERVACIONES'
        Title.Caption = 'Observaciones Reasignaci'#243'n'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVSUGERIDO'
        Title.Caption = 'Prev. Sugerido'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESAVIP'
        Title.Caption = 'Empresas VIP'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECUENCIAPERSONALIZADA'
        Title.Caption = 'Periodicidad Redefinida'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_VISITAEMERGENTE'
        Title.Caption = 'Visita Emergente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_VISITAOTROPERIODO'
        Title.Caption = 'Visita Otro Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTVISITA'
        Title.Caption = 'Fecha Ult.Visita'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVULTVIS'
        Title.Caption = 'Prev.Ultima Visita'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RELACION'
        Title.Caption = 'CIUU Viejo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIUU Actual'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Desc. CIUU'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVENTORANTERIOR'
        Title.Caption = 'Preventor Per'#237'odo Anterior'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALIDO463'
        Title.Caption = 'RGRL Valido'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_INFORMADOCUATRIMESTRE'
        Title.Caption = 'Informado Res.771 Cuatrimestre'
        Width = 157
        Visible = True
      end>
  end
  object gbDetalleTareas: TJvgGroupBox [4]
    Left = 0
    Top = 307
    Width = 739
    Height = 127
    Align = alBottom
    Caption = 'Detalle Tareas'
    TabOrder = 4
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GroupIndex = 1
    GlyphCollapsed.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0012FA94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000D00012000012F90012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000487C92000016E70012F9C40005510000787C92000014070092056D00E770
      7C00500016000016E7001866AC00FBB80000000012000000000012F96400000E
      00008A000000003703000000460000000000450000007C92090092094E006688
      7C00240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C920500154C4000FA280000700012000012F9000000000005C8
      0000907C92000018660012FA3C0005510000D87C92000014070092056D0066AC
      7C0098001800001866000000000000000000800014000018640000000000012E
      0000370000000000000000000200006E0000050001000000000012F908000008
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00707C92000016E7000000380066AC
      0000000018007FFDF00012F9D80000000000340000000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001866AC006698
      0000000018000000000016F72000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF00000000000000000000800000000000100186698000000
      0000000000000000000012FA500064E00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C009800000000186600D1D4DE000000
      77002000000000000000B9F42A00BAFDED00FC01C500478D6C00C5BAFE004246
      0100FDEDC80001C5BA000000000000000000A80000000015220012FA8C00616D
      0000202E7300000001000003320000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DC0000D40015000016E6001522E00073E0
      0000FF004800FFFFFF001522A800C12E0000DC004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    GlyphExpanded.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000078000000
      0000000000000000000000000000000000000000000000000000140640000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000000012000000000012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000587C92000016E80012F9C40005510000787C92000014070092056D00E880
      7C00600016000016E80018680400FBB80000000012000000000014017800000E
      0000F0000000001867000000460000000000450000007C920900140178006798
      0000240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C92050014CA2000FA280000700012000012F9000000000005C8
      0000E87C92000018670012FA3C0005510000D87C92000014070092056D006804
      7C00F0001800001867000000000000000000900014000018650000000000010C
      000039000000000000000000020000720000050001000000000012F908000009
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00807C92000016E800000038006804
      0000000018007FFDF00012F9D80001780000340014000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001868040067F0
      0000000018000000000016F83000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF000000000000000000008000000000001001867F0000000
      0000000000000000000012FA500065F00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C00F000000000186700D1D4DE000000
      770020000000000000005CF47600BAFDE5004601C500E5700700C5BAFD000746
      0100FDE5700001C5BA000000000000000000A80000000015220012FA8C00656D
      0000206F6E00000001000000780000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DE0000E40015000016E7001522E20073E2
      0000FF004800FFFFFF001522A800C12E0000DE004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    OnExpanded = gbDetalleTareasExpanded
    FullHeight = 127
    object dbgDetalleTareas: TArtDBGrid
      Left = 2
      Top = 16
      Width = 735
      Height = 109
      Align = alClient
      DataSource = dsDetalleTareas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      OnGetCellParams = dbgDetalleTareasGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TS_TAREA'
          Title.Caption = 'Tarea'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_FECHADESDE'
          Title.Caption = 'Fecha Desde'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_FECHAHASTA'
          Title.Caption = 'Fecha Hasta'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VP_FECHAVISITA'
          Title.Caption = 'Fecha Visita'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'it_nombre'
          Title.Caption = 'Preventor Visita'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cumplimiento'
          Title.Caption = 'Tipo Cumplimiento'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_FECHAALTA'
          Title.Caption = 'Fecha Alta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_USUALTA'
          Title.Caption = 'Usu. Alta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_FECHABAJA'
          Title.Caption = 'Fecha Baja'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_USUBAJA'
          Title.Caption = 'Usu. Baja'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS_MOTIVOBAJA'
          Title.Caption = 'Motivo Baja'
          Width = 94
          Visible = True
        end>
    end
  end
  object fpReasignarTareas: TFormPanel [5]
    Left = 142
    Top = 196
    Width = 517
    Height = 226
    Caption = 'Reasignar Tareas A...'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      517
      226)
    object Bevel4: TBevel
      Left = 4
      Top = 190
      Width = 509
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 148
    end
    object Label37: TLabel
      Left = 8
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label16: TLabel
      Left = 8
      Top = 39
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label17: TLabel
      Left = 8
      Top = 71
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Label56: TLabel
      Left = 75
      Top = 167
      Width = 67
      Height = 13
      Caption = 'Fecha Desde '
    end
    object Label57: TLabel
      Left = 238
      Top = 168
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label58: TLabel
      Left = 5
      Top = 159
      Width = 66
      Height = 26
      Caption = 'Vigencia Prev'#13#10'   Provisorio'
    end
    object btnAceptarCambioprev: TButton
      Left = 355
      Top = 196
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 7
      OnClick = btnAceptarCambioprevClick
    end
    inline fraCambioTareasPreventor: TfraCodigoDescripcion
      Left = 72
      Top = 10
      Width = 437
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 72
      ExplicitTop = 10
      ExplicitWidth = 437
      DesignSize = (
        437
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 372
        CharCase = ecUpperCase
        ExplicitWidth = 372
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object btnCancel: TButton
      Left = 434
      Top = 197
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
    end
    object cbAsignarEstabalPreventor: TCheckBox
      Left = 6
      Top = 122
      Width = 152
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Asignar Estab. al Preventor'
      TabOrder = 3
    end
    inline fraMotivoReasignarTareas: TfraCodigoDescripcion
      Left = 73
      Top = 34
      Width = 353
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 73
      ExplicitTop = 34
      ExplicitWidth = 353
      DesignSize = (
        353
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 288
        CharCase = ecUpperCase
        ExplicitWidth = 288
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edObservacionReasignarTareas: TRichEdit
      Left = 74
      Top = 65
      Width = 432
      Height = 48
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4000
      ParentFont = False
      TabOrder = 2
    end
    object edFDesdeVigenciaPrevProvisorio: TDateComboBox
      Left = 145
      Top = 164
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object edFHastaVigenciaPrevProvisorio: TDateComboBox
      Left = 308
      Top = 164
      Width = 88
      Height = 21
      TabOrder = 6
    end
    object cbAsignarPreventorProvisorio: TCheckBox
      Left = 6
      Top = 141
      Width = 152
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Asignar Preventor Provisorio'
      TabOrder = 4
    end
  end
  object fpMotivo: TFormPanel [6]
    Left = 864
    Top = 220
    Width = 377
    Height = 133
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      377
      133)
    object Bevel1: TBevel
      Left = 4
      Top = 97
      Width = 369
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 12
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarMotivo: TButton
      Left = 219
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarMotivoClick
    end
    object btnCancelarMotivo: TButton
      Left = 297
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivo: TfraCodigoDescripcion
      Left = 53
      Top = 10
      Width = 311
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 53
      ExplicitTop = 10
      ExplicitWidth = 311
      DesignSize = (
        311
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 246
        CharCase = ecUpperCase
        ExplicitWidth = 246
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edMotivoLibre: TRichEdit
      Left = 12
      Top = 41
      Width = 349
      Height = 48
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4000
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited fpAbm: TFormPanel
    Left = 940
    Top = 360
    Width = 589
    Height = 350
    OnShow = fpAbmShow
    ExplicitLeft = 940
    ExplicitTop = 360
    ExplicitWidth = 589
    ExplicitHeight = 350
    inherited BevelAbm: TBevel
      Top = 314
      Width = 581
      ExplicitTop = 314
      ExplicitWidth = 581
    end
    object Label7: TLabel [1]
      Left = 10
      Top = 138
      Width = 64
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label8: TLabel [2]
      Left = 10
      Top = 161
      Width = 33
      Height = 13
      Caption = 'Tareas'
    end
    object Label10: TLabel [3]
      Left = 4
      Top = 246
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label11: TLabel [4]
      Left = 182
      Top = 138
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label20: TLabel [5]
      Left = 10
      Top = 270
      Width = 32
      Height = 26
      Caption = 'Motivo'#13#10' Baja'
    end
    object Label12: TLabel [6]
      Left = 347
      Top = 138
      Width = 20
      Height = 13
      Caption = 'Mes'
    end
    object pcEmpresa: TPageControl [7]
      Left = 0
      Top = 0
      Width = 589
      Height = 135
      ActivePage = tbAfiliada
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 5
      OnChanging = pcEmpresaChanging
      object tbAfiliada: TTabSheet
        Caption = 'Afiliada'
        DesignSize = (
          581
          104)
        object Label6: TLabel
          Left = 10
          Top = 10
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        inline fraEmpresa: TfraEmpresa
          Left = 50
          Top = 6
          Width = 531
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ExplicitLeft = 50
          ExplicitTop = 6
          ExplicitWidth = 531
          ExplicitHeight = 22
          DesignSize = (
            531
            22)
          inherited lbContrato: TLabel
            Left = 427
            ExplicitLeft = 427
          end
          inherited edContrato: TIntEdit
            Left = 474
            ExplicitLeft = 474
          end
          inherited cmbRSocial: TArtComboBox
            Width = 292
            ExplicitWidth = 292
          end
        end
        inline fraEstableci: TfraEstablecimientoDomic
          Left = 1
          Top = 36
          Width = 580
          Height = 47
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 36
          ExplicitWidth = 580
          DesignSize = (
            580
            47)
          inherited lbLocalidad: TLabel
            Left = 346
            Width = 46
            ExplicitLeft = 346
            ExplicitWidth = 46
          end
          inherited lbEstableci: TLabel
            Left = 7
            Width = 30
            ExplicitLeft = 7
            ExplicitWidth = 30
          end
          inherited lbCPostal: TLabel
            Left = 511
            Width = 20
            ExplicitLeft = 511
            ExplicitWidth = 20
          end
          inherited lbDomicilio: TLabel
            Left = 7
            Width = 42
            ExplicitLeft = 7
            ExplicitWidth = 42
          end
          inherited lbProvincia: TLabel
            Left = 346
            Width = 44
            ExplicitLeft = 346
            ExplicitWidth = 44
          end
          inherited cmbDescripcion: TArtComboBox [5]
            Left = 97
            Width = 246
            ExplicitLeft = 97
            ExplicitWidth = 246
          end
          inherited edCodigo: TIntEdit [6]
            Left = 49
            ExplicitLeft = 49
          end
          inherited edLocalidad: TEdit
            Left = 398
            Width = 111
            ExplicitLeft = 398
            ExplicitWidth = 111
          end
          inherited edCPostal: TEdit
            Left = 533
            Width = 48
            ExplicitLeft = 533
            ExplicitWidth = 48
          end
          inherited edDomicilio: TEdit
            Width = 289
            ExplicitWidth = 289
          end
          inherited edProvincia: TEdit
            Left = 398
            Width = 182
            ExplicitLeft = 398
            ExplicitWidth = 182
          end
          inherited sdqDatos: TSDQuery
            Left = 144
            Top = 5
          end
          inherited dsDatos: TDataSource
            Left = 115
            Top = 5
          end
        end
      end
      object tbNoAfiliada: TTabSheet
        Caption = 'No Afiliada'
        ImageIndex = 1
        object Label13: TLabel
          Left = 10
          Top = 7
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object lbRSocial: TLabel
          Left = 138
          Top = 7
          Width = 38
          Height = 13
          Caption = 'R.Social'
          FocusControl = fraEmpresa.cmbRSocial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 218
          Top = 87
          Width = 44
          Height = 13
          Caption = 'Contacto'
          FocusControl = fraEmpresa.cmbRSocial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 3
          Top = 87
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
          FocusControl = fraEmpresa.cmbRSocial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inline fraDomicilio: TfraDomicilio
          Left = 2
          Top = 28
          Width = 576
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 2
          ExplicitTop = 28
          ExplicitWidth = 576
          DesignSize = (
            576
            51)
          inherited lbNro: TLabel
            Left = 361
            ExplicitLeft = 361
          end
          inherited lbPiso: TLabel
            Left = 433
            Width = 20
            ExplicitLeft = 433
            ExplicitWidth = 20
          end
          inherited lbDto: TLabel
            Left = 509
            Width = 20
            ExplicitLeft = 509
            ExplicitWidth = 20
          end
          inherited lbCPostal: TLabel
            Width = 39
            ExplicitWidth = 39
          end
          inherited lbCPA: TLabel
            Width = 21
            ExplicitWidth = 21
          end
          inherited lbLocalidad: TLabel
            Width = 46
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 414
            Width = 44
            ExplicitLeft = 414
            ExplicitWidth = 44
          end
          inherited cmbCalle: TArtComboBox
            Width = 276
            ExplicitWidth = 276
          end
          inherited edNumero: TEdit
            Left = 383
            ExplicitLeft = 383
          end
          inherited edPiso: TEdit
            Left = 459
            ExplicitLeft = 459
          end
          inherited edDto: TEdit
            Left = 531
            ExplicitLeft = 531
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 144
            ExplicitWidth = 144
          end
          inherited edProvincia: TEdit
            Left = 463
            ExplicitLeft = 463
          end
          inherited btnBuscar: TButton
            Left = 326
            ExplicitLeft = 326
          end
        end
        object mskCUIT: TMaskEdit
          Left = 50
          Top = 3
          Width = 81
          Height = 21
          Hint = 'CUIT de la Empresa'
          EditMask = '99-99999999-9;0;'
          MaxLength = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edRSocial: TEdit
          Left = 180
          Top = 3
          Width = 398
          Height = 21
          MaxLength = 60
          TabOrder = 1
        end
        object edContacto: TEdit
          Left = 266
          Top = 84
          Width = 312
          Height = 21
          MaxLength = 255
          TabOrder = 4
        end
        object edTelefono: TEdit
          Left = 49
          Top = 84
          Width = 158
          Height = 21
          MaxLength = 100
          TabOrder = 3
        end
      end
    end
    inherited btnAceptar: TButton
      Left = 431
      Top = 320
      TabOrder = 7
      ExplicitLeft = 431
      ExplicitTop = 320
    end
    inherited btnCancelar: TButton
      Left = 509
      Top = 320
      TabOrder = 8
      ExplicitLeft = 509
      ExplicitTop = 320
    end
    object edFechaDesde: TDateEdit
      Left = 79
      Top = 135
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object chkTareas: TCheckListBox
      Left = 52
      Top = 159
      Width = 531
      Height = 77
      Columns = 2
      ItemHeight = 13
      TabOrder = 3
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 51
      Top = 241
      Width = 533
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 51
      ExplicitTop = 241
      ExplicitWidth = 533
      DesignSize = (
        533
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 467
        CharCase = ecUpperCase
        ExplicitLeft = 68
        ExplicitWidth = 467
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object edFechaHasta: TDateEdit
      Left = 251
      Top = 135
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object edMotivoBaja: TRichEdit
      Left = 52
      Top = 269
      Width = 531
      Height = 42
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4000
      ParentFont = False
      TabOrder = 6
    end
    inline fraProceso: TfraCodigoDescripcion
      Left = 371
      Top = 132
      Width = 213
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 371
      ExplicitTop = 132
      ExplicitWidth = 213
      DesignSize = (
        213
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 21
        Width = 193
        CharCase = ecUpperCase
        ExplicitLeft = 21
        ExplicitWidth = 193
      end
      inherited edCodigo: TPatternEdit
        Width = 17
        CharCase = ecNormal
        ExplicitWidth = 17
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT   em_cuit, em_nombre, co_contrato, ps_idempresa, ps_estab' +
        'leci, es_nombre, ps_id, ps_tarea, ps_fechadesde, ps_fechahasta,'
      
        '         NVL(pv_mes, pv_anio || '#39' - '#39' || pv_cuatrimestre) pv_mes' +
        ', pv_id, pv_fechainicial, pv_fechafinal,'
      
        '         art.hys.get_nombre_preventor_coord(pit.it_codigo) coord' +
        'inador, pit.it_nombre, ps_idpreventor, pit.it_fechabaja,'
      
        '         ep_tipo tipoestabsrt, DECODE(ps_estado, '#39'N'#39', '#39'PENDIENTE' +
        #39', '#39'P'#39', '#39'PARCIAL'#39', '#39'T'#39', '#39'TERMINADO'#39') estado,'
      
        '         tipoestab.te_codigo tipoestabprev, tipoemp.te_codigo ti' +
        'poprevempresa, ps_tipovisita, tv_descripcion tipovisita,'
      
        '         art.hys.get_tipo_empresa(em_cuit, NULL, SYSDATE) tipoem' +
        'presasrt, NVL(co_totempleadosactual, co_totempleados) empleados,'
      '         dc_telefonos,'
      
        '         art.afi.armar_domicilio(es_calle, es_numero, es_piso, e' +
        's_departamento, es_localidad)'
      
        '         || NVL2(es_telefonos, '#39' Tel.'#39' ||(NVL(es_codareatelefono' +
        's, '#39#39') || es_telefonos), '#39#39') domicilio,'
      
        '         art.utiles.get_partido(es_cpostal, es_provincia) depart' +
        'amento, mv_descripcion motivobaja, ps_observacion,'
      
        '         cac.ac_codigo, cac.ac_descripcion, cac.ac_relacion, es_' +
        'localidad, es_cpostal, es_cpostala, es_provincia,'
      
        '         art.getdescripcionprovincia(es_provincia) prov, ps_idmo' +
        'tivobaja, ps_fechaalta, ps_usualta, ps_fechamodif, ps_usumodif,'
      
        '         ps_fechabaja, ps_usubaja, ps_estado, ep_fechaultvisita,' +
        ' prevultvisita.it_nombre prevultvis, ps_calle, ps_numero,'
      
        '         ps_piso, ps_departamento, ps_localidad, ps_contacto, ep' +
        '_id, mr_descripcion, ps_observaciones,'
      
        '         DECODE(art.afiliacion.is_empresavip(co_contrato), '#39'S'#39', ' +
        #39'VIP'#39', '#39'N'#39', NULL) empresavip,'
      
        '         art.hys.get_frecuenciapersonalizada(ps_idempresa, ps_es' +
        'tableci) frecuenciapersonalizada, ps_visitaemergente,'
      '         ps_visitaotroperiodo, NULL prevsugerido,'
      
        '         (SELECT CAST(wm_concat(DISTINCT prevant.it_nombre) AS V' +
        'ARCHAR2(1000))'
      
        '            FROM art.pit_firmantes prevant, hys.hps_planhys plan' +
        'ant'
      '           WHERE planant.ps_idpreventor = prevant.it_id'
      '             AND planant.ps_idempresa = hps.ps_idempresa'
      '             AND planant.ps_estableci = hps.ps_estableci'
      '             AND ps_idproceso = 0) preventoranterior,'
      
        '         art.hys.get_validorelev463(co_contrato, ps_estableci) v' +
        'alido463,'
      '         ps_informadocuatrimestre'
      
        '    FROM hys.hmv_motivobajavisita, afi.adc_domiciliocontrato, co' +
        'munes.cac_actividad cac, hys.hte_tipoempresaprev tipoestab,'
      
        '         hys.hte_tipoempresaprev tipoemp, hys.hco_cuitoperativo ' +
        'hco, art.pit_firmantes prevultvisita, hys.hep_estabporpreventor,'
      
        '         afi.aes_establecimiento, afi.aco_contrato aco, afi.aem_' +
        'empresa, art.pit_firmantes pit, hys.hmr_motivoreasignaciontarea,'
      
        '         hys.htv_tipovisita, hys.hpv_procesovisita hpv, hys.hps_' +
        'planhys hps'
      '   WHERE em_id = ps_idempresa(+)'
      '     AND aco.co_idempresa = em_id'
      '     AND es_contrato = co_contrato'
      '     AND es_nroestableci(+) = ps_estableci'
      '     AND co_contrato = art.get_vultcontrato(em_cuit)'
      '     AND ep_idempresa = em_id'
      '     AND ep_estableci = es_nroestableci'
      '     AND cac.ac_id = es_idactividad'
      '     AND ps_idproceso = pv_id'
      '     AND co_idtipoempresaprev = tipoemp.te_id(+)'
      '     AND hco.co_id(+) = ep_idcooperativo'
      '     AND prevultvisita.it_id(+) = ep_preventorultvisita'
      '     AND tv_id = ps_tipovisita'
      '     AND ep_idtipoestabprev = tipoestab.te_id'
      '     AND mv_id(+) = ps_idmotivobaja'
      '     AND dc_contrato(+) = co_contrato'
      '     AND ps_idmotivoreasignacion = mr_id(+)'
      '     AND dc_tipo(+) = '#39'L'#39
      '     AND ps_estado IN(CHR(78), CHR(80), CHR(84))'
      '     AND ps_fechabaja IS NULL'
      '     AND em_sector + 0 IN(2, 3, 4, 5)'
      '     AND pit.it_id = ps_idpreventor'
      '     AND pit.it_fechabaja IS NULL'
      '     AND pv_id = 2'
      'UNION ALL'
      
        'SELECT   ps_cuit em_cuit, ps_razonsocial em_nombre, TO_NUMBER(NU' +
        'LL) co_contrato, ps_idempresa, ps_estableci,'
      
        '         '#39'EMPRESA NO AFILIADA'#39' es_nombre, ps_id, ps_tarea, ps_fe' +
        'chadesde, ps_fechahasta,'
      
        '         NVL(pv_mes, pv_anio || '#39' - '#39' || pv_cuatrimestre) pv_mes' +
        ', pv_id, pv_fechainicial, pv_fechafinal,'
      
        '         art.hys.get_nombre_preventor_coord(it_codigo) coordinad' +
        'or, it_nombre, ps_idpreventor, it_fechabaja, NULL tipoestabsrt,'
      
        '         DECODE(ps_estado, '#39'N'#39', '#39'PENDIENTE'#39', '#39'P'#39', '#39'PARCIAL'#39', '#39'T'#39 +
        ', '#39'TERMINADO'#39') estado, NULL tipoestabprev, NULL tipoprevempresa,'
      
        '         ps_tipovisita, tv_descripcion tipovisita, NULL tipoempr' +
        'esasrt, TO_NUMBER(NULL) empleados, ps_telefono dc_telefonos,'
      
        '         art.afi.armar_domicilio(ps_calle, ps_numero, ps_piso, p' +
        's_departamento, ps_localidad)'
      
        '         || NVL2(ps_telefono, '#39' Tel. '#39' || ps_telefono, '#39#39') domic' +
        'ilio,'
      
        '         art.utiles.get_partido(ps_cpostal, ps_provincia) depart' +
        'amento, mv_descripcion motivobaja, ps_observacion,'
      
        '         NULL ac_codigo, NULL ac_descripcion, NULL ac_relacion, ' +
        'ps_localidad es_localidad, ps_cpostal es_cpostal,'
      
        '         ps_cpostala es_cpostala, ps_provincia es_provincia, art' +
        '.getdescripcionprovincia(ps_provincia) prov, ps_idmotivobaja,'
      
        '         ps_fechaalta, ps_usualta, ps_fechamodif, ps_usumodif, p' +
        's_fechabaja, ps_usubaja, ps_estado, NULL ep_fechaultvisita,'
      
        '         NULL prevultvis, ps_calle, ps_numero, ps_piso, ps_depar' +
        'tamento, ps_localidad, ps_contacto, TO_NUMBER(NULL) ep_id,'
      '         mr_descripcion, ps_observaciones, NULL empresavip,'
      
        '         art.hys.get_frecuenciapersonalizada(ps_idempresa, ps_es' +
        'tableci) frecuenciapersonalizada, ps_visitaemergente,'
      
        '         ps_visitaotroperiodo, NULL prevsugerido, NULL preventor' +
        'anterior, NULL valido463, ps_informadocuatrimestre'
      
        '    FROM hys.hmv_motivobajavisita, art.pit_firmantes, hys.hmr_mo' +
        'tivoreasignaciontarea, hys.htv_tipovisita,'
      '         hys.hpv_procesovisita, hys.hps_planhys'
      '   WHERE mv_id(+) = ps_idmotivobaja'
      '     AND ps_idmotivoreasignacion = mr_id(+)'
      '     AND ps_idproceso = pv_id'
      '     AND tv_id = ps_tipovisita'
      '     AND ps_idempresa IS NULL'
      '     AND ps_estado IN(CHR(78), CHR(80), CHR(84))'
      '     AND ps_fechabaja IS NULL'
      '     AND it_id = ps_idpreventor'
      '     AND it_fechabaja IS NULL'
      '     AND pv_id = 2'
      'ORDER BY ps_fechahasta')
    object sdqConsultaSELECTED: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      OnGetText = sdqConsultaSELECTEDGetText
      Size = 1
      Calculated = True
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaPS_IDEMPRESA: TFloatField
      FieldName = 'PS_IDEMPRESA'
    end
    object sdqConsultaPS_ESTABLECI: TFloatField
      FieldName = 'PS_ESTABLECI'
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaPS_ID: TFloatField
      FieldName = 'PS_ID'
      Required = True
    end
    object sdqConsultaPS_TAREA: TStringField
      FieldName = 'PS_TAREA'
      Required = True
      Size = 4000
    end
    object sdqConsultaPS_FECHADESDE: TDateTimeField
      FieldName = 'PS_FECHADESDE'
      Required = True
    end
    object sdqConsultaPS_FECHAHASTA: TDateTimeField
      FieldName = 'PS_FECHAHASTA'
      Required = True
    end
    object sdqConsultaPV_MES: TStringField
      DisplayWidth = 50
      FieldName = 'PV_MES'
      Size = 50
    end
    object sdqConsultaCOORDINADOR: TStringField
      FieldName = 'COORDINADOR'
      Size = 4000
    end
    object sdqConsultaIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Required = True
      Size = 255
    end
    object sdqConsultaPS_IDPREVENTOR: TFloatField
      FieldName = 'PS_IDPREVENTOR'
    end
    object sdqConsultaIT_FECHABAJA: TDateTimeField
      FieldName = 'IT_FECHABAJA'
    end
    object sdqConsultaTIPOESTABSRT: TStringField
      FieldName = 'TIPOESTABSRT'
      Required = True
      Size = 2
    end
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 9
    end
    object sdqConsultaTIPOESTABPREV: TStringField
      FieldName = 'TIPOESTABPREV'
      Required = True
      Size = 10
    end
    object sdqConsultaTIPOEMPRESASRT: TStringField
      FieldName = 'TIPOEMPRESASRT'
      Size = 4000
    end
    object sdqConsultaEMPLEADOS: TFloatField
      FieldName = 'EMPLEADOS'
    end
    object sdqConsultaDC_TELEFONOS: TStringField
      FieldName = 'DC_TELEFONOS'
      Size = 60
    end
    object sdqConsultaDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqConsultaDEPARTAMENTO: TStringField
      FieldName = 'DEPARTAMENTO'
      Size = 4000
    end
    object sdqConsultaMOTIVOBAJA: TStringField
      FieldName = 'MOTIVOBAJA'
      Size = 255
    end
    object sdqConsultaPS_OBSERVACION: TStringField
      FieldName = 'PS_OBSERVACION'
      Size = 4000
    end
    object sdqConsultaES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaES_CPOSTAL: TStringField
      FieldName = 'ES_CPOSTAL'
      Size = 5
    end
    object sdqConsultaES_CPOSTALA: TStringField
      FieldName = 'ES_CPOSTALA'
      Size = 8
    end
    object sdqConsultaES_PROVINCIA: TStringField
      FieldName = 'ES_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqConsultaPROV: TStringField
      FieldName = 'PROV'
      Size = 4000
    end
    object sdqConsultaPS_IDMOTIVOBAJA: TFloatField
      FieldName = 'PS_IDMOTIVOBAJA'
    end
    object sdqConsultaPS_FECHAALTA: TDateTimeField
      FieldName = 'PS_FECHAALTA'
      Required = True
    end
    object sdqConsultaPS_USUALTA: TStringField
      FieldName = 'PS_USUALTA'
      Required = True
    end
    object sdqConsultaPS_FECHAMODIF: TDateTimeField
      FieldName = 'PS_FECHAMODIF'
    end
    object sdqConsultaPS_USUMODIF: TStringField
      FieldName = 'PS_USUMODIF'
    end
    object sdqConsultaPS_FECHABAJA: TDateTimeField
      FieldName = 'PS_FECHABAJA'
    end
    object sdqConsultaPS_USUBAJA: TStringField
      FieldName = 'PS_USUBAJA'
    end
    object sdqConsultaPS_ESTADO: TStringField
      FieldName = 'PS_ESTADO'
      Required = True
      Size = 1
    end
    object sdqConsultaPS_CALLE: TStringField
      FieldName = 'PS_CALLE'
      Size = 60
    end
    object sdqConsultaPS_NUMERO: TStringField
      FieldName = 'PS_NUMERO'
    end
    object sdqConsultaPS_PISO: TStringField
      FieldName = 'PS_PISO'
    end
    object sdqConsultaPS_DEPARTAMENTO: TStringField
      FieldName = 'PS_DEPARTAMENTO'
    end
    object sdqConsultaPS_LOCALIDAD: TStringField
      FieldName = 'PS_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaPS_CONTACTO: TStringField
      FieldName = 'PS_CONTACTO'
      Size = 255
    end
    object sdqConsultaEP_ID: TFloatField
      FieldName = 'EP_ID'
      Required = True
    end
    object sdqConsultaMR_DESCRIPCION: TStringField
      FieldName = 'MR_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaPS_OBSERVACIONES: TStringField
      FieldName = 'PS_OBSERVACIONES'
      Size = 400
    end
    object sdqConsultaEMPRESAVIP: TStringField
      FieldName = 'EMPRESAVIP'
      Size = 3
    end
    object sdqConsultaFRECUENCIAPERSONALIZADA: TFloatField
      FieldName = 'FRECUENCIAPERSONALIZADA'
    end
    object sdqConsultaPV_ID: TFloatField
      FieldName = 'PV_ID'
      Required = True
    end
    object sdqConsultaPV_FECHAINICIAL: TDateTimeField
      FieldName = 'PV_FECHAINICIAL'
      Required = True
    end
    object sdqConsultaPV_FECHAFINAL: TDateTimeField
      FieldName = 'PV_FECHAFINAL'
      Required = True
    end
    object sdqConsultaPS_VISITAEMERGENTE: TStringField
      FieldName = 'PS_VISITAEMERGENTE'
      Required = True
      Size = 1
    end
    object sdqConsultaPREVSUGERIDO: TStringField
      DisplayWidth = 255
      FieldName = 'PREVSUGERIDO'
      Size = 255
    end
    object sdqConsultaPS_VISITAOTROPERIODO: TStringField
      FieldName = 'PS_VISITAOTROPERIODO'
      Required = True
      Size = 1
    end
    object sdqConsultaTIPOVISITA: TStringField
      FieldName = 'TIPOVISITA'
      Required = True
      Size = 255
    end
    object sdqConsultaPS_TIPOVISITA: TFloatField
      FieldName = 'PS_TIPOVISITA'
    end
    object sdqConsultaEP_FECHAULTVISITA: TDateTimeField
      FieldName = 'EP_FECHAULTVISITA'
    end
    object sdqConsultaPREVULTVIS: TStringField
      FieldName = 'PREVULTVIS'
      Size = 255
    end
    object sdqConsultaAC_RELACION: TStringField
      FieldName = 'AC_RELACION'
      Size = 6
    end
    object sdqConsultaAC_CODIGO: TStringField
      FieldName = 'AC_CODIGO'
      Size = 6
    end
    object sdqConsultaAC_DESCRIPCION: TStringField
      FieldName = 'AC_DESCRIPCION'
      Size = 200
    end
    object sdqConsultaPREVENTORANTERIOR: TStringField
      FieldName = 'PREVENTORANTERIOR'
      Size = 1000
    end
    object sdqConsultaTIPOPREVEMPRESA: TStringField
      FieldName = 'TIPOPREVEMPRESA'
      Size = 10
    end
    object sdqConsultaVALIDO463: TStringField
      FieldName = 'VALIDO463'
      Size = 4000
    end
    object sdqConsultaPS_INFORMADOCUATRIMESTRE: TStringField
      FieldName = 'PS_INFORMADOCUATRIMESTRE'
      Size = 1
    end
  end
  inherited ShortCutControl: TShortCutControl
    Enabled = False
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqDetalleTareas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT hts.*, vp_fechavisita, it_nombre,'
      '       DECODE(ts_cumplimiento,'
      '              '#39'C'#39', '#39'Cumplido'#39','
      '              '#39'VP'#39', '#39'Vencido Plan'#39','
      '              '#39'VA'#39', '#39'Vencido Plan y Normativo'#39','
      '              '#39'VN'#39', '#39'Vencimiento Normativo'#39','
      '              NULL) cumplimiento'
      
        '  FROM art.pit_firmantes, hys.hvp_visitapreventor, hys.hts_tarea' +
        'hys hts'
      ' WHERE ts_idplan = :idplan'
      '   AND ts_idvisitapreventor = vp_id(+)'
      '   AND it_id(+) = vp_idpreventor')
    Left = 32
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idplan'
        ParamType = ptInput
      end>
  end
  object dsDetalleTareas: TDataSource
    DataSet = sdqDetalleTareas
    Left = 60
    Top = 340
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
    Left = 81
    Top = 256
  end
end
