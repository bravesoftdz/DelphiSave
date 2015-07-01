inherited frmEnviosSRT: TfrmEnviosSRT
  Left = 329
  Top = 149
  Caption = 'Env'#237'os a la SRT'
  ClientHeight = 510
  ClientWidth = 772
  Constraints.MinHeight = 540
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  ExplicitLeft = 329
  ExplicitTop = 149
  ExplicitWidth = 780
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 177
    Visible = True
    ExplicitWidth = 772
    ExplicitHeight = 177
    DesignSize = (
      772
      177)
    object Label3: TLabel
      Left = 400
      Top = 44
      Width = 41
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Siniestro'
    end
    object Label17: TLabel
      Left = 504
      Top = 44
      Width = 34
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#176' SRT'
    end
    object Label8: TLabel
      Left = 400
      Top = 4
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Env'#237'o'
    end
    object Label9: TLabel
      Left = 488
      Top = 24
      Width = 12
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 400
      Top = 128
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Error'
    end
    object Label2: TLabel
      Left = 136
      Top = 124
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Trabajador'
    end
    object Label4: TLabel
      Left = 400
      Top = 88
      Width = 71
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'C'#243'digo de ART'
    end
    object rgBajas: TRadioGroup
      Left = 226
      Top = 72
      Width = 74
      Height = 69
      Hint = 'Registros dados de baja'
      Anchors = [akTop, akRight]
      Caption = ' Bajas '
      ItemIndex = 2
      Items.Strings = (
        'Todos'
        'Si'
        'No')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object edEX_ID: TSinEdit
      Left = 396
      Top = 60
      Width = 99
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 9
      OnSelect = tbRefrescarClick
    end
    object calDS_FENVIODesde: TJvMonthCalendar
      Left = 603
      Top = 0
      Width = 169
      Height = 177
      Hint = 'Fecha de env'#237'o (desde)'
      Align = alRight
      CalColors.BackColor = 16053492
      CalColors.TitleTextColor = 16053492
      CalColors.MonthBackColor = 16053492
      Date = 39602.468965115740000000
      FirstDayOfWeek = dowMonday
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = calDS_FENVIODesdeClick
    end
    object edDS_FENVIODesde: TDateComboBox
      Left = 396
      Top = 20
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 7
    end
    object edDS_FENVIOHasta: TDateComboBox
      Left = 504
      Top = 20
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 125
      Height = 177
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 0
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 121
        Height = 27
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Errores'
        TabOrder = 0
      end
      object cblTB_CODIGO: TARTCheckListBox
        Left = 2
        Top = 29
        Width = 121
        Height = 146
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        ItemHeight = 13
        TabOrder = 1
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          'SELECT TB_DESCRIPCION, TB_CODIGO FROM ART.CTB_TABLAS WHERE TB_CL' +
          'AVE = '#39'ERSRT'#39' AND TB_CODIGO > '#39'0'#39' ORDER BY TB_DESCRIPCION'
      end
    end
    object rgErrores: TRadioGroup
      Left = 132
      Top = 4
      Width = 91
      Height = 113
      Hint = 'Acerca de los errores'
      Anchors = [akTop, akRight]
      Caption = ' '#191'Errores? '
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Con errores'
        'Sin errores')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    inline fraTB_CODIGO: TfraCodDesc
      Left = 396
      Top = 144
      Width = 201
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 12
      ExplicitLeft = 396
      ExplicitTop = 144
      ExplicitWidth = 201
      DesignSize = (
        201
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 136
        ExplicitWidth = 136
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 'AND TB_CLAVE = '#39'ERSRT'#39' AND TB_CODIGO > '#39'0'#39
        FieldBaja = 'TB_FECHABAJA'
        FieldCodigo = 'TB_CODIGO'
        FieldDesc = 'TB_DESCRIPCION'
        FieldID = 'TB_CODIGO'
        OrderBy = 'TB_DESCRIPCION'
        TableName = 'ART.CTB_TABLAS'
        Left = 132
      end
    end
    inline fraTJ_ID: TfraTrabajador
      Left = 132
      Top = 144
      Width = 261
      Height = 22
      Anchors = [akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 132
      ExplicitTop = 144
      ExplicitWidth = 261
      DesignSize = (
        261
        22)
      inherited cmbNombre: TArtComboBox
        Width = 177
        ExplicitWidth = 177
      end
    end
    object edDS_NROSRT: TPatternEdit
      Left = 500
      Top = 60
      Width = 92
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 20
      TabOrder = 10
      Pattern = '0123456789'
    end
    object cmbDS_INDEXART: TComboBox
      Left = 396
      Top = 104
      Width = 201
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 11
      Items.Strings = (
        'Provincia ART'
        'Gobernaci'#243'n de Buenos Aires')
    end
    object rgReprocesar: TRadioGroup
      Left = 226
      Top = 4
      Width = 74
      Height = 69
      Hint = 'Sobre el estado de marcados para reprocesar'
      Anchors = [akTop, akRight]
      Caption = ' Reprocesar '
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Si'
        'No')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object rgSolucion: TRadioGroup
      Left = 303
      Top = 4
      Width = 90
      Height = 69
      Hint = 'Acerca del estado de la soluci'#243'n de los problemas'
      Anchors = [akTop, akRight]
      Caption = ' Solucionados '
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Si'
        'No')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object rgReproceso: TRadioGroup
      Left = 303
      Top = 72
      Width = 90
      Height = 69
      Hint = 
        'Discrimina los registros reprocesables de los que no son reproce' +
        'sables'
      Anchors = [akTop, akRight]
      Caption = ' Reprocesables '
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Si'
        'No')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 177
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 766
      end>
    ExplicitTop = 177
    ExplicitWidth = 772
    inherited ToolBar: TToolBar
      Width = 757
      ExplicitWidth = 757
      inherited tbNuevo: TToolButton
        Hint = 'Procesar respuesta SRT (Novedades)'
      end
      inherited tbModificar: TToolButton
        Hint = 'Generar env'#237'o SRT'
        ImageIndex = 35
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Reprocesar'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited ToolButton8: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Contar registros'
        Caption = 'Sumatoria'
        ImageIndex = 39
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbGenerarEnvio: TToolButton
        Left = 393
        Top = 0
        Hint = 'Generar env'#237'o SRT'
        Caption = 'Generar env'#237'o SRT'
        ImageIndex = 35
        OnClick = tbGenerarEnvioClick
      end
      object tbReproceso: TToolButton
        Left = 416
        Top = 0
        Hint = 'Generar reproceso SRT'
        Caption = 'tbReproceso'
        ImageIndex = 36
        OnClick = tbReprocesoClick
      end
      object tbRenumeracion: TToolButton
        Left = 439
        Top = 0
        Hint = 'Renumeraci'#243'n'
        Caption = 'Renumeraci'#243'n'
        ImageIndex = 22
        OnClick = tbRenumeracionClick
      end
      object tbEnvio: TToolButton
        Left = 462
        Top = 0
        Hint = 'Solicitar env'#237'o'
        ImageIndex = 23
        OnClick = tbEnvioClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 206
    Width = 772
    Height = 274
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ORDEN'
        Title.Caption = 'Orden'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_RECAIDA'
        Title.Caption = 'Recaida'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FACCI'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accidente / Reca'#237'da'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n del accidente'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHACARGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga Siniestro'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FENVIO'
        Title.Caption = 'Env'#237'o'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_ERROR'
        Title.Caption = 'C'#243'digo de Error'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ERROR'
        Title.Caption = 'Error'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_REPROCESAR'
        Title.Caption = 'Reprocesar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_DESCRIPCION'
        Title.Caption = 'Grupo de trabajo'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CODIGOART'
        Title.Caption = 'C'#243'digo ART'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NROSRT'
        Title.Caption = 'N'#176' SRT'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_OPERACION'
        Title.Caption = 'Operaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CUIT'
        Title.Caption = 'C.U.I.T.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TIPO_REG'
        Title.Caption = 'Tipo reg.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CUIT_OCURRE'
        Title.Caption = 'C.U.I.T. Ocurrencia'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_SRT_CATREG'
        Title.Caption = 'SRT Cat. Reg.'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_ESTABLECIMIENTO'
        Title.Caption = 'C'#243'digo Establecimiento'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CIIU_ESTABLECIMIENTO'
        Title.Caption = 'C.I.I.U. Establecimiento'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PROVINCIA'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_DOMICILIO_ESTABLECIMIENTO'
        Title.Caption = 'Domicilio del Establecimiento'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CUIL'
        Title.Caption = 'C.U.I.L.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TIPO_DOC'
        Title.Caption = 'Tipo Doc.'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_DOCUMENTO'
        Title.Caption = 'Documento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PUESTO_ACC'
        Title.Caption = 'Puesto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ANTIGUEDAD_PUESTO'
        Title.Caption = 'Antig'#252'edad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PUESTO_ANTERIOR'
        Title.Caption = 'Puesto anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ANTIGUEDAD_ANTERIOR'
        Title.Caption = 'Antig'#252'edad anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_SEXO'
        Title.Caption = 'Sexo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHA_NACIMIENTO'
        Title.Caption = 'Fecha de nacimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ESTADO_CIVIL'
        Title.Caption = 'Estado Civil'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NACIONALIDAD'
        Title.Caption = 'Nacionalidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TURNO'
        Title.Caption = 'Turno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_HORA_INICIO_JORNADA'
        Title.Caption = 'Inicio jornada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_HORA_FIN_JORNADA'
        Title.Caption = 'Fin jornada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_AGENTE_MATERIAL'
        Title.Caption = 'Agente material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FORMA'
        Title.Caption = 'Forma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CIE10_1'
        Title.Caption = 'CIE 10 (1)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NATU_1'
        Title.Caption = 'Naturaleza (1)'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ZONA_1'
        Title.Caption = 'Zona (1)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CIE10_2'
        Title.Caption = 'CIE 10 (2)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NATU_2'
        Title.Caption = 'Naturaleza (2)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ZONA_2'
        Title.Caption = 'Zona (2)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CIE10_3'
        Title.Caption = 'CIE 10 (3)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NATU_3'
        Title.Caption = 'Naturaleza'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ZONA_3'
        Title.Caption = 'Zona (3)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FEC_DIAGNOSTICO_1'
        Title.Caption = 'Diagn'#243'stico (1)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FEC_DIAGNOSTICO_2'
        Title.Caption = 'Diagn'#243'stico (2)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FEC_DIAGNOSTICO_3'
        Title.Caption = 'Diagn'#243'stico (3)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHA_ILT'
        Title.Caption = 'Fecha ILT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_EGRESO_ILT'
        Title.Caption = 'Egreso ILT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_DECLA_IPP'
        Title.Caption = 'Declaraci'#243'n IPP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_GRADO_INCA'
        Title.Caption = 'Grado Incapacidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FIN_IPP'
        Title.Caption = 'Fin IPP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PORC_INCAPACIDAD'
        Title.Caption = '% Incapacidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_GRAN_INVALIDEZ'
        Title.Caption = 'Gran invalidez'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHA_DICTAMEN'
        Title.Caption = 'Fecha dictamen'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NRO_EXPEDIENTE'
        Title.Caption = 'N'#176' Expediente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PATOLOGIA_TRAZADORA'
        Title.Caption = 'Patolog'#237'a trazadora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHA_ALTA'
        Title.Caption = 'Fecha de alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NRO_ROAM'
        Title.Caption = 'N'#176' ROAM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ANIO_ROAM'
        Title.Caption = 'A'#241'o ROAM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_OBSERVACION'
        Title.Caption = 'C'#243'digo observaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHA_SINIESTRO'
        Title.Caption = 'Fecha del siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHA_BAJA'
        Title.Caption = 'Fecha de baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_AGENTE'
        Title.Caption = 'Agente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TIEMPO_EXP'
        Title.Caption = 'Tiempo de exposici'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PERIODICO'
        Title.Caption = 'Peri'#243'dico'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FEC_PER'
        Title.Caption = 'Fecha peri'#243'dico'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_EXA_PER_1'
        Title.Caption = 'C'#243'digo ex'#225'men peri'#243'dico (1)'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_EXA_PER_2'
        Title.Caption = 'C'#243'digo ex'#225'men peri'#243'dico (2)'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_EXA_PER_3'
        Title.Caption = 'C'#243'digo ex'#225'men peri'#243'dico (3)'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_SOLUCIONADO'
        Title.Caption = 'Solucionado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_REPROCESABLE'
        Title.Caption = 'Reprocesable'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ENVIAPUBLICA'
        Title.Caption = 'En via p'#250'blica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHABAJA'
        Title.Caption = 'F. inicio inasistencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_SECUELASINC'
        Title.Caption = 'Secuelas incap.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHARECH'
        Title.Caption = 'Fecha rech.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_MOTIVORECH'
        Title.Caption = 'Motivo rech.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FECHAESTAM'
        Title.Caption = 'Fecha est. alta med.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CRONICO'
        Title.Caption = 'Cr'#243'nico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_RECALIFICACION'
        Title.Caption = 'Recalificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_INTERCURRENCIA'
        Title.Caption = 'Intercurrencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NROATINTER'
        Title.Caption = 'Nro . AT Intercurrencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_INGRESOBASE'
        Title.Caption = 'Ingreso base'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TRATPEND'
        Title.Caption = 'Tratamiento pendiente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ESP1'
        Title.Caption = 'Especialidad 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ESP2'
        Title.Caption = 'Especialidad 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ESP3'
        Title.Caption = 'Especialidad 3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_INICIO_TRANSI'
        Title.Caption = 'Inicio Transit.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FIN_TRANSI'
        Title.Caption = 'Fin Transit.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_MOTIVO_CESE_TRANSI'
        Title.Caption = 'Mot. Cese Tran.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FEC_TOMA_CONO'
        Title.Caption = 'F. Toma conocim.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PROV_OCURRE'
        Title.Caption = 'Provincia ocurrencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_COD_LOC_OCURRE'
        Title.Caption = 'Localidad ocurrencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CALLE_OCURRE'
        Title.Caption = 'Calle ocurrencia'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NUMERO_OCURRE'
        Title.Caption = 'N'#250'mero ocurrencia'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CPA_OCURRE'
        Title.Caption = 'CPA Ocurrencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ESTRES'
        Title.Caption = 'Estr'#233's postraum.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_EXPEDIENTE_JUD'
        Title.Caption = 'Exp. Jud.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 300
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 476
    Top = 240
    Width = 245
    Height = 213
    Caption = 'Datos de la baja'
    ExplicitLeft = 476
    ExplicitTop = 240
    ExplicitWidth = 245
    ExplicitHeight = 213
    DesignSize = (
      245
      213)
    inherited BevelAbm: TBevel
      Top = 177
      Width = 237
      ExplicitTop = 177
      ExplicitWidth = 237
    end
    object Label5: TLabel [1]
      Left = 12
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Motivo de baja'
    end
    object Label6: TLabel [2]
      Left = 12
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 90
      Top = 183
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 90
      ExplicitTop = 183
    end
    inherited btnCancelar: TButton
      Left = 165
      Top = 183
      TabOrder = 3
      ExplicitLeft = 165
      ExplicitTop = 183
    end
    inline fraDS_CODBAJA: TfraCodDesc
      Left = 8
      Top = 32
      Width = 229
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 32
      ExplicitWidth = 229
      inherited cmbDescripcion: TArtComboBox
        Width = 164
        ExplicitWidth = 164
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 'AND TB_CLAVE = '#39'BASRT'#39
        FieldBaja = 'TB_FECHABAJA'
        FieldCodigo = 'TB_CODIGO'
        FieldDesc = 'TB_DESCRIPCION'
        FieldID = 'TB_CODIGO'
        OrderBy = 'TB_DESCRIPCION'
        TableName = 'ART.CTB_TABLAS'
      end
    end
    object edDS_MOTIVOBAJA: TMemo
      Left = 8
      Top = 80
      Width = 225
      Height = 89
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 50
      TabOrder = 1
    end
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 480
    Width = 772
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    object pnl3: TPanel
      Left = 282
      Top = 2
      Width = 140
      Height = 26
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Con problemas'
      Color = 13425657
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnl2: TPanel
      Left = 142
      Top = 2
      Width = 140
      Height = 26
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Problema solucionado'
      Color = 14281943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 140
      Height = 26
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Sin problemas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnlInfo: TPanel
      Left = 422
      Top = 2
      Width = 348
      Height = 26
      Align = alClient
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object fpRenumeracion: TFormPanel [5]
    Left = 284
    Top = 248
    Width = 185
    Height = 97
    Caption = 'Renumeraci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      185
      97)
    object Bevel1: TBevel
      Left = 4
      Top = 61
      Width = 177
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 12
      Top = 12
      Width = 90
      Height = 13
      Caption = 'N'#250'mero de reca'#237'da'
    end
    object btnAceptarRenumeracion: TButton
      Left = 30
      Top = 67
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
      TabOrder = 1
      OnClick = btnAceptarRenumeracionClick
    end
    object btnCancelarRenumeracion: TButton
      Left = 105
      Top = 67
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edNroRecaida: TIntEdit
      Left = 12
      Top = 32
      Width = 161
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object fpEnvio: TFormPanel [6]
    Left = 252
    Top = 352
    Width = 217
    Height = 97
    Caption = 'Env'#237'o'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      217
      97)
    object Bevel2: TBevel
      Left = 4
      Top = 61
      Width = 209
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 12
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Siniestro'
    end
    object Label11: TLabel
      Left = 119
      Top = 12
      Width = 29
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
    end
    object btnAceptarEnvio: TButton
      Left = 62
      Top = 67
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
      TabOrder = 0
      OnClick = btnAceptarEnvioClick
    end
    object btnCancelarEnvio: TButton
      Left = 137
      Top = 67
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edSiniestroEnvio: TSinEdit
      Left = 12
      Top = 32
      Width = 100
      Height = 21
      TabOrder = 2
    end
    object edFechaEnvio: TDateComboBox
      Left = 117
      Top = 32
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM ('
      
        'SELECT '#39'AT'#39' AS tipo, a.rowid as id, ds_siniestro, ds_orden, ds_r' +
        'ecaida, ds_fenvio, ds_reprocesar, ds_codigoart, ds_nrosrt, ds_op' +
        'eracion,'
      
        '       ds_cuit, ds_tipo_reg, ds_cuit_ocurre, ds_srt_catreg, ds_c' +
        'od_establecimiento, ds_ciiu_establecimiento, ds_provincia,'
      
        '       ds_cpostal, ds_domicilio_establecimiento, ds_cuil, ds_tip' +
        'o_doc, ds_documento, ds_nombre, ds_puesto_acc,'
      
        '       ds_antiguedad_puesto, ds_sexo, ds_fecha_nacimiento, ds_es' +
        'tado_civil, ds_nacionalidad, ds_turno, ds_hora_inicio_jornada,'
      
        '       ds_hora_fin_jornada, ds_agente_material, ds_forma, ds_cie' +
        '10_1, ds_natu_1, ds_zona_1, ds_cie10_2, ds_natu_2, ds_zona_2,'
      
        '       ds_cie10_3, ds_natu_3, ds_zona_3, ds_fecha_ilt, ds_egreso' +
        '_ilt, ds_decla_ipp, ds_grado_inca, ds_fin_ipp,'
      
        '       ds_porc_incapacidad, ds_gran_invalidez, ds_fecha_dictamen' +
        ', ds_nro_expediente, ds_patologia_trazadora, ds_fecha_alta,'
      
        '       ds_nro_roam, ds_anio_roam, ds_cod_observacion, ds_cod_err' +
        'or, ds_fecha_siniestro, ds_fecha_baja,'
      
        '       NULL AS ds_fec_diagnostico_1, NULL AS ds_fec_diagnostico_' +
        '2, NULL AS ds_fec_diagnostico_3, NULL AS ds_puesto_anterior,'
      
        '       NULL AS ds_antiguedad_anterior, NULL AS ds_agente, NULL A' +
        'S ds_tiempo_exp, NULL AS ds_periodico, NULL AS ds_fec_per,'
      
        '       NULL AS ds_cod_exa_per_1, NULL AS ds_cod_exa_per_2, NULL ' +
        'AS ds_cod_exa_per_3,'
      '       --ds_periodo, ds_especial, ds_procesado,'
      
        '       tj_id, tb_codigo, tb_descripcion as error, ds_fbaja, ds_c' +
        'odbaja, ds_motivobaja, '
      '       CASE'
      '       WHEN ds_cod_error IS NOT NULL THEN'
      
        '         pau.is_solucionado(ds_siniestro, ds_orden, ds_recaida, ' +
        'ds_periodo, ds_cod_error)'
      '       ELSE'
      '         '#39'No aplica'#39
      '       END as is_solucionado,'
      
        '       gp_descripcion, lg_nombre, DECODE(ds_codigoart, '#39'00051'#39', ' +
        '0, '#39'50040'#39', 1, -1) as ds_indexart,'
      
        '       ex_fecharecepcion, NVL(ex_fecharecaida, ex_fechaaccidente' +
        ') facci,'
      
        '       ex_fechacarga, pau.is_reprocesable(ds_cod_error) ds_repro' +
        'cesable, DS_ENVIAPUBLICA, NULL AS DS_FECHABAJA, DS_SECUELASINC,'
      
        '       DS_FECHARECH, DS_MOTIVORECH, DS_FECHAESTAM, DS_CRONICO, D' +
        'S_RECALIFICACION, DS_INTERCURRENCIA,'
      
        '       DS_NROATINTER, DS_INGRESOBASE, DS_TRATPEND, DS_ESP1, DS_E' +
        'SP2, DS_ESP3, Ds_inicio_transi,'
      
        '       Ds_fin_transi, Ds_motivo_cese_transi, Ds_fec_toma_cono, D' +
        's_prov_ocurre, Ds_cod_loc_ocurre, Ds_calle_ocurre,'
      
        '       Ds_numero_ocurre, Ds_cpa_ocurre, Ds_estres, Ds_expediente' +
        '_jud, Ds_observaciones'
      
        '  FROM art.ctb_tablas, mgp_gtrabajo, dlg_delegaciones, ctj_traba' +
        'jador,'
      '       art.sex_expedientes, sin.sds_detalle_srt_at a'
      ' WHERE tb_clave(+) = '#39'ERSRT'#39
      '   AND tb_codigo(+) = ds_cod_error'
      '   AND ex_siniestro = ds_siniestro'
      '   AND ex_orden = ds_orden'
      '   AND ex_recaida = ds_recaida'
      '   AND ex_gtrabajo = gp_codigo'
      '   AND ex_delegacion = lg_codigo'
      '   AND ex_cuil = tj_cuil'
      'UNION ALL'
      
        'SELECT '#39'EP'#39' AS tipo, a.rowid as id, ds_siniestro, ds_orden, ds_r' +
        'ecaida, ds_fenvio, ds_reprocesar, ds_codigoart, ds_nrosrt, ds_op' +
        'eracion,'
      
        '       ds_cuit, ds_tipo_reg, ds_cuit_ocurre, ds_srt_catreg, ds_c' +
        'od_establecimiento, ds_ciiu_establecimiento, ds_provincia,'
      
        '       ds_cpostal, ds_domicilio_establecimiento, ds_cuil, ds_tip' +
        'o_doc, ds_documento, ds_nombre, ds_puesto_acc,'
      
        '       ds_antiguedad_puesto, ds_sexo, ds_fecha_nacimiento, ds_es' +
        'tado_civil, ds_nacionalidad, ds_turno, ds_hora_inicio_jornada,'
      
        '       ds_hora_fin_jornada, ds_agente_material, NULL AS ds_forma' +
        ', ds_cie10_1, NULL AS ds_natu_1, ds_zona_1, ds_cie10_2,'
      
        '       NULL AS ds_natu_2, ds_zona_2, ds_cie10_3, NULL AS ds_natu' +
        '_3, ds_zona_3, ds_fecha_ilt, ds_egreso_ilt, ds_decla_ipp,'
      
        '       ds_grado_inca, ds_fin_ipp, ds_porc_incapacidad, ds_gran_i' +
        'nvalidez, ds_fecha_dictamen, ds_nro_expediente,'
      
        '       ds_patologia_trazadora, ds_fecha_alta, ds_nro_roam, ds_an' +
        'io_roam, ds_cod_observacion, ds_cod_error, ds_fecha_siniestro,'
      
        '       NULL AS ds_fecha_baja, ds_fec_diagnostico_1, ds_fec_diagn' +
        'ostico_2, ds_fec_diagnostico_3, ds_puesto_anterior,'
      
        '       ds_antiguedad_anterior, ds_agente, ds_tiempo_exp, ds_peri' +
        'odico, ds_fec_per, ds_cod_exa_per_1, ds_cod_exa_per_2,'
      '       ds_cod_exa_per_3,'
      '       -- ds_periodo, ds_especial, '#39'S'#39' AS ds_procesado'
      
        '       tj_id, tb_codigo, tb_descripcion as error, ds_fbaja, ds_c' +
        'odbaja, ds_motivobaja,'
      '       CASE'
      '       WHEN ds_cod_error IS NOT NULL THEN'
      
        '         pau.is_solucionado_ep(ds_siniestro, ds_orden, ds_recaid' +
        'a, ds_periodo, ds_cod_error)'
      '       ELSE'
      '         '#39'No aplica'#39
      '       END as is_solucionado,'
      
        '       gp_descripcion, lg_nombre, DECODE(ds_codigoart, '#39'00051'#39', ' +
        '0, '#39'50040'#39', 1, -1) as ds_indexart,'
      
        '       ex_fecharecepcion, NVL(ex_fecharecaida, ex_fechaaccidente' +
        ') facci,'
      
        '       ex_fechacarga, pau.is_reprocesable(ds_cod_error) ds_repro' +
        'cesable, NULL AS DS_ENVIAPUBLICA, DS_FECHABAJA, DS_SECUELASINC,'
      
        '       DS_FECHARECH, DS_MOTIVORECH, DS_FECHAESTAM, DS_CRONICO, D' +
        'S_RECALIFICACION, NULL AS DS_INTERCURRENCIA,'
      
        '       NULL AS DS_NROATINTER, DS_INGRESOBASE, DS_TRATPEND, DS_ES' +
        'P1, DS_ESP2, DS_ESP3, Ds_inicio_transi,'
      
        '       Ds_fin_transi, Ds_motivo_cese_transi, Ds_fec_toma_cono, D' +
        's_prov_ocurre, Ds_cod_loc_ocurre, Ds_calle_ocurre,'
      
        '       Ds_numero_ocurre, Ds_cpa_ocurre, null Ds_estres, Ds_exped' +
        'iente_jud, Ds_observaciones'
      
        '  FROM art.ctb_tablas, mgp_gtrabajo, dlg_delegaciones, ctj_traba' +
        'jador,'
      '       art.sex_expedientes, SIN.sds_detalle_srt_ep a'
      ' WHERE tb_clave(+) = '#39'ERSRT'#39
      '   AND tb_codigo(+) = ds_cod_error'
      '   AND ex_siniestro = ds_siniestro'
      '   AND ex_orden = ds_orden'
      '   AND ex_recaida = ds_recaida'
      '   AND ex_gtrabajo = gp_codigo'
      '   AND ex_delegacion = lg_codigo'
      '   AND ex_cuil = tj_cuil'
      ') WHERE 1 = 1')
    Left = 16
    Top = 292
    object sdqConsultaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 2
    end
    object sdqConsultaID: TStringField
      FieldName = 'ID'
      Size = 18
    end
    object sdqConsultaDS_SINIESTRO: TFloatField
      FieldName = 'DS_SINIESTRO'
    end
    object sdqConsultaDS_ORDEN: TFloatField
      FieldName = 'DS_ORDEN'
    end
    object sdqConsultaDS_RECAIDA: TFloatField
      FieldName = 'DS_RECAIDA'
    end
    object sdqConsultaDS_FENVIO: TDateTimeField
      FieldName = 'DS_FENVIO'
    end
    object sdqConsultaDS_REPROCESAR: TStringField
      FieldName = 'DS_REPROCESAR'
      Size = 1
    end
    object sdqConsultaDS_CODIGOART: TStringField
      FieldName = 'DS_CODIGOART'
      Size = 5
    end
    object sdqConsultaDS_NROSRT: TStringField
      FieldName = 'DS_NROSRT'
    end
    object sdqConsultaDS_OPERACION: TStringField
      FieldName = 'DS_OPERACION'
      Size = 1
    end
    object sdqConsultaDS_CUIT: TStringField
      FieldName = 'DS_CUIT'
      Size = 11
    end
    object sdqConsultaDS_TIPO_REG: TStringField
      FieldName = 'DS_TIPO_REG'
      Size = 1
    end
    object sdqConsultaDS_CUIT_OCURRE: TStringField
      FieldName = 'DS_CUIT_OCURRE'
      Size = 11
    end
    object sdqConsultaDS_SRT_CATREG: TStringField
      FieldName = 'DS_SRT_CATREG'
      Size = 2
    end
    object sdqConsultaDS_COD_ESTABLECIMIENTO: TStringField
      FieldName = 'DS_COD_ESTABLECIMIENTO'
      Size = 5
    end
    object sdqConsultaDS_CIIU_ESTABLECIMIENTO: TStringField
      FieldName = 'DS_CIIU_ESTABLECIMIENTO'
      Size = 6
    end
    object sdqConsultaDS_PROVINCIA: TStringField
      FieldName = 'DS_PROVINCIA'
      Size = 2
    end
    object sdqConsultaDS_CPOSTAL: TStringField
      FieldName = 'DS_CPOSTAL'
      Size = 8
    end
    object sdqConsultaDS_DOMICILIO_ESTABLECIMIENTO: TStringField
      FieldName = 'DS_DOMICILIO_ESTABLECIMIENTO'
      Size = 100
    end
    object sdqConsultaDS_CUIL: TStringField
      FieldName = 'DS_CUIL'
      Size = 11
    end
    object sdqConsultaDS_TIPO_DOC: TStringField
      FieldName = 'DS_TIPO_DOC'
      Size = 2
    end
    object sdqConsultaDS_DOCUMENTO: TStringField
      FieldName = 'DS_DOCUMENTO'
      Size = 8
    end
    object sdqConsultaDS_NOMBRE: TStringField
      FieldName = 'DS_NOMBRE'
      Size = 40
    end
    object sdqConsultaDS_PUESTO_ACC: TStringField
      FieldName = 'DS_PUESTO_ACC'
      Size = 4
    end
    object sdqConsultaDS_ANTIGUEDAD_PUESTO: TStringField
      FieldName = 'DS_ANTIGUEDAD_PUESTO'
      Size = 3
    end
    object sdqConsultaDS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 1
    end
    object sdqConsultaDS_FECHA_NACIMIENTO: TStringField
      FieldName = 'DS_FECHA_NACIMIENTO'
      Size = 8
    end
    object sdqConsultaDS_ESTADO_CIVIL: TStringField
      FieldName = 'DS_ESTADO_CIVIL'
      Size = 1
    end
    object sdqConsultaDS_NACIONALIDAD: TStringField
      FieldName = 'DS_NACIONALIDAD'
      Size = 4
    end
    object sdqConsultaDS_TURNO: TStringField
      FieldName = 'DS_TURNO'
      Size = 1
    end
    object sdqConsultaDS_HORA_INICIO_JORNADA: TStringField
      FieldName = 'DS_HORA_INICIO_JORNADA'
      Size = 5
    end
    object sdqConsultaDS_HORA_FIN_JORNADA: TStringField
      FieldName = 'DS_HORA_FIN_JORNADA'
      Size = 5
    end
    object sdqConsultaDS_AGENTE_MATERIAL: TStringField
      FieldName = 'DS_AGENTE_MATERIAL'
      Size = 5
    end
    object sdqConsultaDS_FORMA: TStringField
      FieldName = 'DS_FORMA'
      Size = 3
    end
    object sdqConsultaDS_CIE10_1: TStringField
      FieldName = 'DS_CIE10_1'
      Size = 4
    end
    object sdqConsultaDS_NATU_1: TStringField
      FieldName = 'DS_NATU_1'
      Size = 2
    end
    object sdqConsultaDS_ZONA_1: TStringField
      FieldName = 'DS_ZONA_1'
      Size = 3
    end
    object sdqConsultaDS_CIE10_2: TStringField
      FieldName = 'DS_CIE10_2'
      Size = 4
    end
    object sdqConsultaDS_NATU_2: TStringField
      FieldName = 'DS_NATU_2'
      Size = 2
    end
    object sdqConsultaDS_ZONA_2: TStringField
      FieldName = 'DS_ZONA_2'
      Size = 3
    end
    object sdqConsultaDS_CIE10_3: TStringField
      FieldName = 'DS_CIE10_3'
      Size = 4
    end
    object sdqConsultaDS_NATU_3: TStringField
      FieldName = 'DS_NATU_3'
      Size = 2
    end
    object sdqConsultaDS_ZONA_3: TStringField
      FieldName = 'DS_ZONA_3'
      Size = 3
    end
    object sdqConsultaDS_FECHA_ILT: TStringField
      FieldName = 'DS_FECHA_ILT'
      Size = 8
    end
    object sdqConsultaDS_EGRESO_ILT: TStringField
      FieldName = 'DS_EGRESO_ILT'
      Size = 1
    end
    object sdqConsultaDS_DECLA_IPP: TStringField
      FieldName = 'DS_DECLA_IPP'
      Size = 8
    end
    object sdqConsultaDS_GRADO_INCA: TStringField
      FieldName = 'DS_GRADO_INCA'
      Size = 4
    end
    object sdqConsultaDS_FIN_IPP: TStringField
      FieldName = 'DS_FIN_IPP'
      Size = 3
    end
    object sdqConsultaDS_PORC_INCAPACIDAD: TStringField
      FieldName = 'DS_PORC_INCAPACIDAD'
      Size = 6
    end
    object sdqConsultaDS_GRAN_INVALIDEZ: TStringField
      FieldName = 'DS_GRAN_INVALIDEZ'
      Size = 1
    end
    object sdqConsultaDS_FECHA_DICTAMEN: TStringField
      FieldName = 'DS_FECHA_DICTAMEN'
      Size = 8
    end
    object sdqConsultaDS_NRO_EXPEDIENTE: TStringField
      FieldName = 'DS_NRO_EXPEDIENTE'
      Size = 16
    end
    object sdqConsultaDS_PATOLOGIA_TRAZADORA: TStringField
      FieldName = 'DS_PATOLOGIA_TRAZADORA'
      Size = 1
    end
    object sdqConsultaDS_FECHA_ALTA: TStringField
      FieldName = 'DS_FECHA_ALTA'
      Size = 8
    end
    object sdqConsultaDS_NRO_ROAM: TStringField
      FieldName = 'DS_NRO_ROAM'
      Size = 6
    end
    object sdqConsultaDS_ANIO_ROAM: TStringField
      FieldName = 'DS_ANIO_ROAM'
      Size = 4
    end
    object sdqConsultaDS_COD_OBSERVACION: TStringField
      FieldName = 'DS_COD_OBSERVACION'
      Size = 10
    end
    object sdqConsultaDS_COD_ERROR: TStringField
      FieldName = 'DS_COD_ERROR'
      Size = 10
    end
    object sdqConsultaDS_FECHA_SINIESTRO: TStringField
      FieldName = 'DS_FECHA_SINIESTRO'
      Size = 8
    end
    object sdqConsultaDS_FECHA_BAJA: TStringField
      FieldName = 'DS_FECHA_BAJA'
      Size = 8
    end
    object sdqConsultaDS_FEC_DIAGNOSTICO_1: TStringField
      FieldName = 'DS_FEC_DIAGNOSTICO_1'
      Size = 8
    end
    object sdqConsultaDS_FEC_DIAGNOSTICO_2: TStringField
      FieldName = 'DS_FEC_DIAGNOSTICO_2'
      Size = 8
    end
    object sdqConsultaDS_FEC_DIAGNOSTICO_3: TStringField
      FieldName = 'DS_FEC_DIAGNOSTICO_3'
      Size = 8
    end
    object sdqConsultaDS_PUESTO_ANTERIOR: TStringField
      FieldName = 'DS_PUESTO_ANTERIOR'
      Size = 4
    end
    object sdqConsultaDS_ANTIGUEDAD_ANTERIOR: TStringField
      FieldName = 'DS_ANTIGUEDAD_ANTERIOR'
      Size = 3
    end
    object sdqConsultaDS_AGENTE: TStringField
      FieldName = 'DS_AGENTE'
      Size = 5
    end
    object sdqConsultaDS_TIEMPO_EXP: TFloatField
      FieldName = 'DS_TIEMPO_EXP'
    end
    object sdqConsultaDS_PERIODICO: TStringField
      FieldName = 'DS_PERIODICO'
      Size = 1
    end
    object sdqConsultaDS_FEC_PER: TStringField
      FieldName = 'DS_FEC_PER'
      Size = 8
    end
    object sdqConsultaDS_COD_EXA_PER_1: TStringField
      FieldName = 'DS_COD_EXA_PER_1'
      Size = 5
    end
    object sdqConsultaDS_COD_EXA_PER_2: TStringField
      FieldName = 'DS_COD_EXA_PER_2'
      Size = 5
    end
    object sdqConsultaDS_COD_EXA_PER_3: TStringField
      FieldName = 'DS_COD_EXA_PER_3'
      Size = 5
    end
    object sdqConsultaTJ_ID: TFloatField
      FieldName = 'TJ_ID'
    end
    object sdqConsultaTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Size = 10
    end
    object sdqConsultaERROR: TStringField
      FieldName = 'ERROR'
      Size = 150
    end
    object sdqConsultaDS_FBAJA: TDateTimeField
      FieldName = 'DS_FBAJA'
    end
    object sdqConsultaDS_CODBAJA: TFloatField
      FieldName = 'DS_CODBAJA'
    end
    object sdqConsultaDS_MOTIVOBAJA: TStringField
      FieldName = 'DS_MOTIVOBAJA'
      Size = 50
    end
    object sdqConsultaIS_SOLUCIONADO: TStringField
      FieldName = 'IS_SOLUCIONADO'
      Size = 4000
    end
    object sdqConsultaGP_DESCRIPCION: TStringField
      FieldName = 'GP_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaLG_NOMBRE: TStringField
      FieldName = 'LG_NOMBRE'
      Size = 50
    end
    object sdqConsultaDS_INDEXART: TFloatField
      FieldName = 'DS_INDEXART'
    end
    object sdqConsultaEX_FECHARECEPCION: TDateTimeField
      FieldName = 'EX_FECHARECEPCION'
    end
    object sdqConsultaFACCI: TDateTimeField
      FieldName = 'FACCI'
    end
    object sdqConsultaEX_FECHACARGA: TDateTimeField
      FieldName = 'EX_FECHACARGA'
    end
    object sdqConsultaDS_REPROCESABLE: TStringField
      FieldName = 'DS_REPROCESABLE'
      Size = 4000
    end
    object sdqConsultaDS_ENVIAPUBLICA: TStringField
      FieldName = 'DS_ENVIAPUBLICA'
      Size = 1
    end
    object sdqConsultaDS_FECHABAJA: TStringField
      FieldName = 'DS_FECHABAJA'
      Size = 8
    end
    object sdqConsultaDS_SECUELASINC: TStringField
      FieldName = 'DS_SECUELASINC'
      Size = 1
    end
    object sdqConsultaDS_FECHARECH: TStringField
      FieldName = 'DS_FECHARECH'
      Size = 8
    end
    object sdqConsultaDS_MOTIVORECH: TStringField
      FieldName = 'DS_MOTIVORECH'
      Size = 1
    end
    object sdqConsultaDS_FECHAESTAM: TStringField
      FieldName = 'DS_FECHAESTAM'
      Size = 8
    end
    object sdqConsultaDS_CRONICO: TStringField
      FieldName = 'DS_CRONICO'
      Size = 1
    end
    object sdqConsultaDS_RECALIFICACION: TStringField
      FieldName = 'DS_RECALIFICACION'
      Size = 1
    end
    object sdqConsultaDS_INTERCURRENCIA: TStringField
      FieldName = 'DS_INTERCURRENCIA'
      Size = 1
    end
    object sdqConsultaDS_NROATINTER: TStringField
      FieldName = 'DS_NROATINTER'
    end
    object sdqConsultaDS_INGRESOBASE: TStringField
      FieldName = 'DS_INGRESOBASE'
      Size = 10
    end
    object sdqConsultaDS_TRATPEND: TStringField
      FieldName = 'DS_TRATPEND'
      Size = 1
    end
    object sdqConsultaDS_ESP1: TStringField
      FieldName = 'DS_ESP1'
      Size = 2
    end
    object sdqConsultaDS_ESP2: TStringField
      FieldName = 'DS_ESP2'
      Size = 2
    end
    object sdqConsultaDS_ESP3: TStringField
      FieldName = 'DS_ESP3'
      Size = 2
    end
    object sdqConsultaDS_INICIO_TRANSI: TStringField
      FieldName = 'DS_INICIO_TRANSI'
      Size = 8
    end
    object sdqConsultaDS_FIN_TRANSI: TStringField
      FieldName = 'DS_FIN_TRANSI'
      Size = 8
    end
    object sdqConsultaDS_MOTIVO_CESE_TRANSI: TStringField
      FieldName = 'DS_MOTIVO_CESE_TRANSI'
      Size = 1
    end
    object sdqConsultaDS_FEC_TOMA_CONO: TStringField
      FieldName = 'DS_FEC_TOMA_CONO'
      Size = 8
    end
    object sdqConsultaDS_PROV_OCURRE: TStringField
      FieldName = 'DS_PROV_OCURRE'
      Size = 2
    end
    object sdqConsultaDS_COD_LOC_OCURRE: TStringField
      FieldName = 'DS_COD_LOC_OCURRE'
      Size = 4
    end
    object sdqConsultaDS_CPA_OCURRE: TStringField
      FieldName = 'DS_CPA_OCURRE'
      Size = 8
    end
    object sdqConsultaDS_ESTRES: TStringField
      FieldName = 'DS_ESTRES'
      Size = 1
    end
    object sdqConsultaDS_EXPEDIENTE_JUD: TStringField
      FieldName = 'DS_EXPEDIENTE_JUD'
      Size = 18
    end
    object sdqConsultaDS_OBSERVACIONES: TStringField
      FieldName = 'DS_OBSERVACIONES'
      Size = 250
    end
    object sdqConsultaDS_CALLE_OCURRE: TStringField
      FieldName = 'DS_CALLE_OCURRE'
      Size = 100
    end
    object sdqConsultaDS_NUMERO_OCURRE: TFloatField
      FieldName = 'DS_NUMERO_OCURRE'
    end
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 292
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 320
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 320
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 348
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PermisoParaReprocesarInvalidos'
      end>
    Left = 16
    Top = 264
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 264
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 348
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 264
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 292
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 72
    Top = 320
  end
end
