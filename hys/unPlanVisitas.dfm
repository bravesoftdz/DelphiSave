inherited frmPlanVisitas: TfrmPlanVisitas
  Left = 532
  Top = 188
  Width = 747
  Height = 464
  Caption = 'Asignaci'#243'n de Visitas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 739
    Height = 145
    Visible = True
    object pcFilter: TPageControl
      Left = 0
      Top = 0
      Width = 739
      Height = 145
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          731
          117)
        object Label2: TLabel
          Left = 5
          Top = 33
          Width = 46
          Height = 13
          Caption = 'Preventor'
        end
        object Label9: TLabel
          Left = 369
          Top = 33
          Width = 57
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Coordinador'
        end
        object Label1: TLabel
          Left = 5
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Per'#237'odo'
        end
        object Label44: TLabel
          Left = 369
          Top = 8
          Width = 61
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F.Alta Desde'
        end
        object Label46: TLabel
          Left = 527
          Top = 8
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta'
        end
        object Label5: TLabel
          Left = 369
          Top = 58
          Width = 65
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F.Emergentes'
        end
        object Label6: TLabel
          Left = 527
          Top = 58
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta'
        end
        object Label7: TLabel
          Left = 369
          Top = 82
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F.Bajas'
        end
        object Label8: TLabel
          Left = 527
          Top = 82
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta'
        end
        object Label10: TLabel
          Left = 1
          Top = 58
          Width = 59
          Height = 13
          Caption = 'T.Prev.Emp.'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 59
          Top = 28
          Width = 301
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          DesignSize = (
            301
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 234
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
          end
        end
        inline fraCoordinadorFiltro: TfraCodigoDescripcion
          Left = 435
          Top = 28
          Width = 295
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 5
          DesignSize = (
            295
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 228
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
          end
        end
        object chkSinPreventor: TCheckBox
          Left = 143
          Top = 5
          Width = 117
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Incluir Sin Preventor'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object edFechaAltaDesde: TDateComboBox
          Left = 436
          Top = 4
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edFechaAltaHasta: TDateComboBox
          Left = 563
          Top = 4
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 3
        end
        inline fraProcesoFiltro: TfraCodigoDescripcion
          Left = 59
          Top = 3
          Width = 78
          Height = 23
          TabOrder = 0
          DesignSize = (
            78
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 1
            Width = 75
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Left = 22
            Width = 17
            CharCase = ecNormal
            Visible = False
          end
        end
        object edFechaEmergentesDesde: TDateComboBox
          Left = 436
          Top = 54
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 7
        end
        object edFechaEmergentesHasta: TDateComboBox
          Left = 563
          Top = 54
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 8
        end
        object edFechaBajaDesde: TDateComboBox
          Left = 436
          Top = 78
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 9
        end
        object edFechaBajaHasta: TDateComboBox
          Left = 563
          Top = 78
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 10
        end
        object cmbTipoEmpresaPrev: TCheckCombo
          Left = 61
          Top = 54
          Width = 299
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
      end
      object tbAfiliaciones: TTabSheet
        Caption = 'Afiliaciones'
        ImageIndex = 2
        DesignSize = (
          731
          117)
        object Label47: TLabel
          Left = 4
          Top = 83
          Width = 67
          Height = 13
          Caption = 'Departamento'
        end
        object Label3: TLabel
          Left = 5
          Top = 9
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label4: TLabel
          Left = 5
          Top = 33
          Width = 30
          Height = 13
          Caption = 'Estab.'
        end
        inline fraLocalidad: TfraLocalidadEx
          Left = 4
          Top = 53
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
          Top = 78
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
            OnChange = fraDepartcmbDescripcionChange
            OnExit = fraDepartcmbDescripcionExit
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
          TabOrder = 2
          DesignSize = (
            646
            21)
          inherited lbContrato: TLabel
            Left = 542
          end
          inherited edContrato: TIntEdit
            Left = 589
          end
          inherited cmbRSocial: TArtComboBox
            Width = 407
          end
        end
        object edEstablecimiento: TPatternEdit
          Left = 77
          Top = 29
          Width = 645
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Pattern = '1234567890,'
        end
      end
      object tbTareas: TTabSheet
        Caption = 'Tareas'
        ImageIndex = 2
        DesignSize = (
          731
          117)
        object Label24: TLabel
          Left = 416
          Top = 11
          Width = 128
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Tareas seg'#250'n tipo empresa'
        end
        inline fraTareasSeleccion: TfraMultiSeleccion
          Left = 3
          Top = 0
          Width = 405
          Height = 115
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          inherited pnlFilterPanel: TPanel
            Width = 405
            inherited imgSearch: TImage
              Left = 382
            end
            inherited edSearch: TEdit
              Width = 380
            end
            inherited CoolBar: TCoolBar
              Width = 405
              Bands = <
                item
                  Control = fraTareasSeleccion.ToolBar
                  ImageIndex = -1
                  MinHeight = 27
                  Width = 401
                end>
              inherited ToolBar: TToolBar
                Width = 388
              end
            end
          end
          inherited lstMultiSeleccion: TARTCheckListBox
            Width = 405
            Height = 61
          end
        end
        object cmbTareasSegunTipoEmpresa: TCheckCombo
          Left = 550
          Top = 7
          Width = 177
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 145
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
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Detalle'
        Visible = True
        OnClick = tbPropiedadesClick
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
      object Panel1: TPanel
        Left = 370
        Top = 0
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
          Color = clBtnFace
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
          Color = clBtnFace
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
          Left = 222
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
    Top = 174
    Width = 739
    Height = 263
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'coordinador'
        Title.Caption = 'Coordinador'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Caption = 'Preventor'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioritaria'
        Title.Caption = 'Prioritarias'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'compensacion'
        Title.Caption = 'Compensatorias'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'compensacionotroperiodo'
        Title.Caption = 'Compensatorias otro Per'#237'odo'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'compensacionmanual'
        Title.Caption = 'Compensatorias Manual'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'emergentes'
        Title.Caption = 'Emergentes'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'emergentesfiltro'
        Title.Caption = 'Emergentes del D'#237'a'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'visitamax'
        Title.Caption = 'M'#225'x. por Mes'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'noprogramadas'
        Title.Caption = 'No Programadas'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bajas'
        Title.Caption = 'Bajas'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clRed
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioritariaotroperiodo'
        Title.Caption = 'Prioritarias Otro Per'#237'odo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioritariaotroperiodo2'
        Title.Caption = 'Prioritarias Otro Per'#237'odo 2'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioritariaotroperiodo3'
        Title.Caption = 'Prioritarias Otro Per'#237'odo 3'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioritariaotroperiodo4'
        Title.Caption = 'Prioritarias Otro Per'#237'odo 4'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioritariaotroperiodoresto'
        Title.Caption = 'Prioritarias Otro Per'#237'odo Resto'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'emergentesotroperiodo'
        Title.Caption = 'Emergentes Otro Per'#237'odo'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'emergentesfiltrootroper'
        Title.Caption = 'Emergentes D'#237'a Otro Per'#237'odo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diferencia'
        Title.Caption = 'Diferencia'
        Width = 0
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 208
    Top = 272
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   art.hys.get_nombre_preventor_coord(it_codigo) coordinad' +
        'or, ps_idpreventor, it_nombre,'
      '         SUM(CASE'
      '               WHEN ps_tipovisita = 1'
      '               AND ps_visitaemergente = '#39'N'#39' THEN 1'
      '               ELSE 0'
      
        '             END) prioritaria, SUM(DECODE(ps_tipovisita, 2, 1, 0' +
        ')) compensacion,'
      '         SUM(DECODE(ps_tipovisita, 3, 1, 0)) noprogramadas,'
      '         SUM(CASE'
      '               WHEN ps_tipovisita = 1'
      '               AND ps_visitaemergente = '#39'S'#39' THEN 1'
      '               ELSE 0'
      '             END) emergentes,'
      '         SUM(CASE'
      '               WHEN ps_tipovisita = 1'
      '               AND ps_visitaemergente = '#39'S'#39
      
        '               AND ps_fechaalta BETWEEN :fechaemdesde AND :fecha' +
        'emhasta THEN 1'
      '               ELSE 0'
      '             END) emergentesfiltro,'
      '         SUM(CASE'
      '               WHEN ps_tipovisita = 4'
      '               AND ps_visitaemergente = '#39'N'#39' THEN 1'
      '               ELSE 0'
      '             END) prioritariaotroperiodo,'
      '         SUM(CASE'
      '               WHEN ps_tipovisita = 4'
      '               AND ps_visitaemergente = '#39'S'#39' THEN 1'
      '               ELSE 0'
      '             END) emergentesotroperiodo,'
      '         SUM(CASE'
      '               WHEN ps_tipovisita = 4'
      '               AND ps_visitaemergente = '#39'S'#39
      
        '               AND ps_fechaalta BETWEEN :fechaemdesde AND :fecha' +
        'emhasta THEN 1'
      '               ELSE 0'
      '             END) emergentesfiltrootroper,'
      
        '         SUM(CASE WHEN TRUNC(ps_fechabaja) BETWEEN :fechabajades' +
        'de AND :fechabajahasta  THEN 1 ELSE 0 END) bajas, '
      '         COUNT(*) total'
      
        '    FROM art.pit_firmantes, hys.hps_planhys, hys.hpv_procesovisi' +
        'ta'
      '   WHERE ps_fechabaja IS NULL'
      '     AND pv_id = ps_idproceso'
      '     AND it_id = ps_idpreventor'
      '     AND it_fechabaja IS NULL'
      '     AND pv_id = 2'
      '     AND ps_estado IN(CHR(78), CHR(80))'
      'GROUP BY ps_idpreventor, it_codigo, it_nombre'
      'ORDER BY coordinador')
    ParamData = <
      item
        DataType = ftDate
        Name = 'fechaemdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechaemhasta'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechaemdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechaemhasta'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechabajadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechabajahasta'
        ParamType = ptInput
      end>
  end
  inherited ShortCutControl: TShortCutControl
    Enabled = False
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
