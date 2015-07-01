inherited frmListSiniestrosConInternacion: TfrmListSiniestrosConInternacion
  Left = 355
  Top = 179
  Width = 657
  Height = 419
  Caption = 'Listado de Siniestros con Internaci'#243'n'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 650
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 649
    Height = 180
    object GroupBox2: TGroupBox
      Left = 0
      Top = 1
      Width = 647
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = ' &Prestador '
      TabOrder = 0
      DesignSize = (
        647
        47)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 15
        Width = 637
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCUIT: TLabel
          Left = 0
        end
        inherited lbSec: TLabel
          Left = 112
        end
        inherited lbIdentif: TLabel
          Left = 184
        end
        inherited lbRSocial: TLabel
          Left = 269
        end
        inherited lbCPostal: TLabel
          Left = 549
        end
        inherited lbTelefono: TLabel
          Left = 461
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 247
          DataSource = nil
        end
        inherited mskPrestCUIT: TMaskEdit
          Left = 28
        end
        inherited cmbPrestador: TArtComboBox
          Left = 313
          Width = 305
          DataSource = nil
        end
        inherited edPresLocalidad: TEdit
          Width = 203
        end
        inherited edPresCPostal: TEdit
          Left = 566
        end
        inherited edPrestIdentif: TIntEdit
          Left = 220
        end
        inherited edPrestSecuencia: TIntEdit
          Left = 136
        end
        inherited edPresTelefono: TEdit
          Left = 481
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 0
      Top = 49
      Width = 278
      Height = 43
      Caption = ' &Delegaci'#243'n '
      TabOrder = 1
      DesignSize = (
        278
        43)
      inline fraDelegacion: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 262
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 199
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object gbInternados: TGroupBox
      Left = 0
      Top = 133
      Width = 647
      Height = 41
      Caption = ' &Internados '
      TabOrder = 2
      object Label2: TLabel
        Left = 219
        Top = 17
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rbIntActualmente: TRadioButton
        Left = 491
        Top = 16
        Width = 137
        Height = 17
        Caption = 'Internados actualmente'
        Checked = True
        Color = clRed
        ParentColor = False
        TabOrder = 0
        TabStop = True
        Visible = False
        OnClick = rbIntActualmenteClick
      end
      object rbIntHistorico: TRadioButton
        Left = 8
        Top = 16
        Width = 121
        Height = 17
        Caption = 'Internados hist'#243'ricos'
        TabOrder = 1
        OnClick = rbIntHistoricoClick
      end
      object dcIntHasta: TDateComboBox
        Left = 234
        Top = 13
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcIntDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object dcIntDesde: TDateComboBox
        Left = 129
        Top = 13
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcIntHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object rbIntMultiples: TRadioButton
        Left = 342
        Top = 16
        Width = 116
        Height = 17
        Caption = 'Internados M'#250'ltiples'
        TabOrder = 4
        OnClick = rbIntMultiplesClick
      end
    end
    object gbGestor: TGroupBox
      Left = 522
      Top = 50
      Width = 124
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario gestor '
      TabOrder = 3
      DesignSize = (
        124
        42)
      object cmbGestor: TArtComboBox
        Left = 8
        Top = 14
        Width = 108
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
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
      Left = 282
      Top = 50
      Width = 236
      Height = 42
      Caption = ' Grupo de Trabajo '
      TabOrder = 4
      DesignSize = (
        236
        42)
      object cmbGtrabajo: TDBCheckCombo
        Left = 7
        Top = 14
        Width = 224
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnCloseUp = cmbGtrabajoCloseUp
        DataSource = dsGtrabajo
        KeyField = 'GP_CODIGO'
        ListField = 'GP_NOMBRE'
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 92
      Width = 119
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 5
      object edSiniestro: TSinEdit
        Left = 7
        Top = 15
        Width = 105
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 121
      Top = 92
      Width = 202
      Height = 43
      TabOrder = 6
      object chkCronicos: TCheckBox
        Left = 128
        Top = 8
        Width = 65
        Height = 17
        Caption = 'Cr'#243'nicos'
        TabOrder = 0
      end
      object chkSRT: TCheckBox
        Left = 12
        Top = 24
        Width = 49
        Height = 17
        Caption = 'SRT'
        TabOrder = 1
      end
      object chkComisionMedica: TCheckBox
        Left = 12
        Top = 9
        Width = 105
        Height = 17
        Caption = 'Comisi'#243'n M'#233'dica'
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 325
      Top = 92
      Width = 322
      Height = 43
      Caption = ' Informe Social '
      TabOrder = 7
      object rbTodosInfoSoc: TRadioButton
        Left = 8
        Top = 19
        Width = 52
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbConInfoSoc: TRadioButton
        Left = 85
        Top = 19
        Width = 111
        Height = 17
        Caption = 'Con Informe Social'
        TabOrder = 1
      end
      object rbSinInfoSoc: TRadioButton
        Left = 207
        Top = 19
        Width = 107
        Height = 17
        Caption = 'Sin Informe Social'
        TabOrder = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 180
    Width = 649
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 645
      end>
    inherited ToolBar: TToolBar
      Width = 632
      inherited tbModificar: TToolButton
        Hint = 'Modificar Fechas (Ctrl+M)'
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
    Top = 209
    Width = 649
    Height = 183
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PACIENTE'
        Title.Caption = 'Paciente'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_SEXO'
        Title.Caption = 'Sexo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_FNACIMIENTO'
        Title.Caption = 'Fecha Nacimiento'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'F_SINI'
        Title.Alignment = taCenter
        Title.Caption = 'F.Siniestro'
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'CIE10'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INTER_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Int. Desde'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INTER_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Int. Hasta'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DIASINTERN'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as Intern.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OPER_PROG'
        Title.Alignment = taCenter
        Title.Caption = 'Oper.Prog'
        Width = 55
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
        FieldName = 'GRUPO_ACTUAL'
        Title.Caption = 'Grupo Actual'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_ANTERIOR'
        Title.Caption = 'Grupo Anterior'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ALTA_PME'
        Title.Alignment = taCenter
        Title.Caption = 'Alta PME'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SI_GASTOTRASLADO'
        Title.Caption = '$ Traslados'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SI_GASTOORTOPEDIA'
        Title.Caption = '$ Ortopedia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SI_GASTOFARMACIA'
        Title.Caption = '$ Farmacia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SI_GASTOMEDICO'
        Title.Caption = '$ Prest.Med.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SI_GASTOTOTAL'
        Title.Caption = '$Total'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECPARTE'
        Title.Caption = 'Fecha Parte'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUPARTE'
        Title.Caption = 'Usuario Parte'
        Width = 80
        Visible = True
      end>
  end
  object fpABM: TFormPanel [3]
    Left = 236
    Top = 218
    Width = 193
    Height = 155
    Caption = 'Fechas Intrernaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      193
      155)
    object Label7: TLabel
      Left = 11
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object lblDatSin: TLabel
      Left = 177
      Top = 7
      Width = 3
      Height = 13
    end
    object Label3: TLabel
      Left = 11
      Top = 44
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label1: TLabel
      Left = 11
      Top = 75
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Bevel3: TBevel
      Left = 8
      Top = 104
      Width = 175
      Height = 2
      Anchors = [akTop]
    end
    object edSiniestroABM: TSinEdit
      Left = 63
      Top = 12
      Width = 100
      Height = 21
      TabOrder = 4
      Enabled = False
    end
    object btnAceptar: TButton
      Left = 18
      Top = 117
      Width = 75
      Height = 24
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 101
      Top = 117
      Width = 75
      Height = 24
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object dcIntHastaABM: TDateComboBox
      Left = 63
      Top = 72
      Width = 88
      Height = 21
      Hint = 'Hasta Fecha'
      MinDateCombo = dcIntDesdeABM
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dcIntDesdeABM: TDateComboBox
      Left = 63
      Top = 42
      Width = 88
      Height = 21
      Hint = 'Desde Fecha'
      MaxDateCombo = dcIntHastaABM
      DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    OnCalcFields = sdqConsultaCalcFields
    SQL.Strings = (
      
        'SELECT si_siniestro || '#39'-'#39' || si_orden || '#39'-'#39' || si_recaida Sini' +
        'estro,'
      
        '       ex_cuil Cuil, tj_nombre Paciente, ex_cuit Cuit, em_nombre' +
        ' Empresa,'
      
        '       nvl(ex_fecharecaida,ex_fechaaccidente) F_Sini, ex_diagnos' +
        'tico Diagnostico,'
      '      ex_diagnosticooms CIE10, si_internadodesde Inter_Desde, '
      
        '      ca_descripcion Prestador, si_operprog Oper_Prog, lg_nombre' +
        ' Delegacion, '
      
        '      grupo_actual.gp_nombre Grupo_Actual, grupo_anterior.gp_nom' +
        'bre Grupo_Anterior,  siniestro.get_usuariogestor(ex_id) USUGESTO' +
        'R, '
      '      si_internadohasta Inter_Hasta, si_altaegreso Alta_PME,'
      '      si_internadohasta-si_internadodesde DiasIntern,'
      '      si_gastofarmacia, si_gastoortopedia, si_gastotraslado, '
      '      si_gastomedico, si_gastototal'
      
        'FROM   SEX_EXPEDIENTES, AEM_EMPRESA, CTJ_TRABAJADOR, DLG_DELEGAC' +
        'IONES, '
      '       MGP_GTRABAJO grupo_actual, MGP_GTRABAJO grupo_anterior,  '
      '       CPR_PRESTADOR, MSI_SINIESTRO_INTERNADO A'
      ' WHERE ex_siniestro = si_siniestro'
      '   AND ex_orden = si_orden'
      '   AND ex_recaida = si_recaida'
      '   AND ex_cuil = tj_cuil'
      '   AND ex_cuit = em_cuit'
      '   AND si_idprestador = ca_identificador'
      '   AND ex_delegacion = lg_codigo'
      '   AND ex_gtrabajo = grupo_actual.gp_codigo'
      '   AND si_gtrabajo = grupo_anterior.gp_codigo'
      '   AND si_fechabaja IS NULL')
    Left = 80
    Top = 276
  end
  inherited dsConsulta: TDataSource
    Left = 108
    Top = 276
  end
  inherited SortDialog: TSortDialog
    Left = 80
    Top = 304
  end
  inherited ExportDialog: TExportDialog
    Title = 'Listado de Siniestros con Internaci'#243'n'
    Left = 108
    Top = 304
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        MaxLength = 9
      end
      item
        Title = 'Paciente'
        DataField = 'PACIENTE'
        MaxLength = 14
      end
      item
        Title = 'Sexo'
        DataField = 'TJ_SEXO'
        MaxLength = 4
      end
      item
        Title = 'F.Nacim.'
        DataField = 'TJ_FNACIMIENTO'
        MaxLength = 8
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        MaxLength = 10
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        MaxLength = 20
      end
      item
        Title = 'F.Siniest.'
        TitleAlignment = taCenter
        DataField = 'F_SINI'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        MaxLength = 25
      end
      item
        Title = 'Cie10'
        TitleAlignment = taCenter
        DataField = 'CIE10'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Int.Desd.'
        TitleAlignment = taCenter
        DataField = 'INTER_DESDE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Int.Hast.'
        TitleAlignment = taCenter
        DataField = 'INTER_HASTA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 21
      end
      item
        Title = 'Op.Prog'
        TitleAlignment = taCenter
        DataField = 'OPER_PROG'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        MaxLength = 11
      end
      item
        Title = 'Gr.Actual'
        DataField = 'GRUPO_ACTUAL'
        MaxLength = 9
      end
      item
        Title = 'Gr.Anterior'
        DataField = 'GRUPO_ANTERIOR'
        MaxLength = 11
      end
      item
        Title = 'Usu Gest.'
        DataField = 'USUGESTOR'
        MaxLength = 9
      end
      item
        Title = 'Alta PME'
        TitleAlignment = taCenter
        DataField = 'ALTA_PME'
        Alignment = taCenter
        MaxLength = 8
      end>
    Title.Text = 'Listado de Siniestros con Internaci'#243'n'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 108
    Top = 332
  end
  inherited Seguridad: TSeguridad
    Left = 80
    Top = 248
  end
  inherited FormStorage: TFormStorage
    Left = 108
    Top = 248
  end
  inherited PrintDialog: TPrintDialog
    Left = 80
    Top = 332
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
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
        Key = 16430
        LinkControl = tbEliminar
      end>
    Left = 136
    Top = 248
  end
  inherited FieldHider: TFieldHider
    Left = 136
    Top = 276
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   gp_codigo, gp_nombre, gp_fax, gp_email'
      '    FROM art.mgp_gtrabajo'
      '   WHERE gp_fbaja IS NULL'
      'ORDER BY gp_nombre')
    Left = 406
    Top = 59
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 434
    Top = 59
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
    Left = 558
    Top = 55
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 586
    Top = 55
  end
end
