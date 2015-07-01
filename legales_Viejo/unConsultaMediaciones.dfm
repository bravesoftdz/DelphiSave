inherited frmConsultaMediaciones: TfrmConsultaMediaciones
  Left = 222
  Top = 171
  Width = 801
  Height = 628
  Caption = 'Busqueda...(Administraci'#243'n de Mediaciones)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 793
    Height = 245
    object pcFiltrosBusqueda: TPageControl
      Left = 0
      Top = 0
      Width = 793
      Height = 245
      ActivePage = tsGeneral
      Align = alClient
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        object gbJuicio: TGroupBox
          Left = 0
          Top = 0
          Width = 785
          Height = 217
          Align = alClient
          Caption = 'Juicio'
          TabOrder = 0
          DesignSize = (
            785
            217)
          object lbNroJuicio: TLabel
            Left = 13
            Top = 24
            Width = 45
            Height = 13
            Caption = 'Nro Folio:'
          end
          object lblTipoJuicio: TLabel
            Left = 12
            Top = 48
            Width = 76
            Height = 13
            Caption = 'Tipo Mediaci'#243'n:'
          end
          object lblCaratula: TLabel
            Left = 14
            Top = 72
            Width = 42
            Height = 13
            Caption = 'Car'#225'tula:'
          end
          object lblEstado: TLabel
            Left = 13
            Top = 97
            Width = 41
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Estado: '
          end
          object lblContra: TLabel
            Left = 410
            Top = 72
            Width = 12
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'C/'
          end
          object CUIL: TLabel
            Left = 12
            Top = 122
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          object lblExpediente: TLabel
            Left = 412
            Top = 97
            Width = 39
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'N'#186' Exp.:'
          end
          object lbAbogado: TLabel
            Left = 13
            Top = 140
            Width = 46
            Height = 26
            Caption = 'Estudio/'#13#10'Abogado:'
          end
          object Label1: TLabel
            Left = 359
            Top = 145
            Width = 79
            Height = 13
            Caption = 'Usuario Legales:'
          end
          object Label2: TLabel
            Left = 14
            Top = 172
            Width = 50
            Height = 13
            Caption = 'Audiencia:'
          end
          object Label3: TLabel
            Left = 560
            Top = 172
            Width = 83
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            Caption = 'Fecha Audiencia:'
          end
          object lblFechaAsignacion: TLabel
            Left = 14
            Top = 196
            Width = 33
            Height = 13
            Caption = 'F. Alta:'
          end
          object Label4: TLabel
            Left = 193
            Top = 196
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object edNroFolio: TIntEdit
            Left = 91
            Top = 19
            Width = 81
            Height = 21
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Alignment = taRightJustify
          end
          inline fraEstado: TfraCodigoDescripcion
            Left = 90
            Top = 93
            Width = 316
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            DesignSize = (
              316
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 251
            end
          end
          object chkGPBA: TCheckBox
            Left = 184
            Top = 21
            Width = 56
            Height = 17
            Alignment = taLeftJustify
            Caption = 'GPBA'
            TabOrder = 1
          end
          object edDemandante: TEdit
            Left = 91
            Top = 70
            Width = 313
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 3
          end
          object edDemandado: TEdit
            Left = 434
            Top = 70
            Width = 304
            Height = 21
            Anchors = [akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 4
          end
          inline fraTipoMediacion: TfraCodigoDescripcion
            Left = 90
            Top = 43
            Width = 660
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DesignSize = (
              660
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 53
              Width = 595
            end
            inherited edCodigo: TPatternEdit
              Width = 50
              MaxLength = 8
              Pattern = '0123456789'
            end
          end
          inline fraTrabajador: TfraTrabajadorSiniestro
            Left = 91
            Top = 118
            Width = 645
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            TabStop = True
            DesignSize = (
              645
              22)
            inherited lbSiniestro: TLabel
              Left = 454
              Top = 4
            end
            inherited cmbNombre: TArtComboBox
              Width = 366
            end
            inherited ToolBar: TToolBar [4]
              Left = 621
              Top = 0
              Visible = False
            end
            inherited edSiniestro: TSinEdit [5]
              Left = 498
              Width = 117
              Hint = 'C'#243'digo de Siniestro'
            end
          end
          object edExpediente: TPatternEdit
            Left = 465
            Top = 94
            Width = 81
            Height = 21
            Anchors = [akTop, akRight]
            MaxLength = 10
            TabOrder = 7
          end
          inline fraAbogadosPropios: TfraAbogadosLegales
            Left = 90
            Top = 142
            Width = 267
            Height = 23
            TabOrder = 8
            DesignSize = (
              267
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 53
              Width = 212
              DataSource = nil
            end
            inherited edCodigo: TPatternEdit
              Width = 50
              Pattern = '0123456789'
            end
            inherited dsDatos: TDataSource
              Left = 15
            end
          end
          inline fraUsuarioLegal: TfraCodigoDescripcion
            Left = 442
            Top = 141
            Width = 298
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
            DesignSize = (
              298
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 63
              Width = 233
              DataSource = nil
            end
          end
          inline fraTipoEvento: TfraCodigoDescripcion
            Left = 91
            Top = 167
            Width = 463
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
            DesignSize = (
              463
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 398
              DataSource = nil
            end
            inherited edCodigo: TPatternEdit
              Pattern = '0123456789'
            end
          end
          object edFechaAudiencia: TDateComboBox
            Left = 651
            Top = 168
            Width = 87
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 11
          end
          object edFechaAltaDesde: TDateComboBox
            Left = 92
            Top = 192
            Width = 88
            Height = 21
            ErrorMessage = 
              'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
              'o'
            DialogTitle = 'Seleccione una fecha'
            Weekends = [Sun, Sat]
            TabOrder = 12
          end
          object edFechaAltaHasta: TDateComboBox
            Left = 236
            Top = 191
            Width = 88
            Height = 21
            ErrorMessage = 
              'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
              'o'
            DialogTitle = 'Seleccione una fecha'
            Weekends = [Sun, Sat]
            TabOrder = 13
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 245
    Width = 793
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 789
      end>
    inherited ToolBar: TToolBar
      Width = 776
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
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 274
    Width = 793
    Height = 296
    Columns = <
      item
        Expanded = False
        FieldName = 'ME_NUMEROFOLIO'
        Title.Caption = 'Nro.Folio'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_FECHAINICIO'
        Title.Caption = 'Fecha Inicio'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_DESCRIPCION'
        Title.Caption = 'Tipo Mediaci'#243'n'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_DEMANDANTE'
        Title.Caption = 'Demandante'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_DEMANDADO'
        Title.Caption = 'Demandado'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Abogado'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_FECHAASIGNACION'
        Title.Caption = 'Fecha Asignaci'#243'n'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_EXPEDIENTE'
        Title.Caption = 'N'#186' Exp.'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_GPBA'
        Title.Caption = 'GPBA'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_FECHAFIN'
        Title.Caption = 'Fecha Fin'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_NUMEROCAJA'
        Title.Caption = 'Nro.Caja'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_SEMESTRE'
        Title.Caption = 'Semestre'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'md_nombre'
        Title.Caption = 'Nombre Mediador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIOMEDIADOR'
        Title.Caption = 'Domicilio Mediador'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_DESCRIPCION'
        Title.Caption = 'Motivo Reclamo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DESCRIPCION'
        Title.Caption = 'Diagn'#243'stico'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_DESCRIPCION'
        Title.Caption = 'Objeto del Reclamo'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_INCAPINDETERMINADA'
        Title.Caption = 'Incap. Indeterminada'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_INCAPACIDAD'
        Title.Caption = 'Incap. Demandada'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_INCAPREVISACIONMED'
        Title.Caption = 'Incap. seg'#250'n Peritos'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_ID'
        Title.Caption = 'Proceso'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'primera_audiencia'
        Title.Caption = 'F. Primera Audiencia'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'segunda_audiencia'
        Title.Caption = 'F. Segunda Audiencia'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tercera_audiencia'
        Title.Caption = 'F. Tercera Audiencia'
        Width = 108
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 570
    Width = 793
    Height = 31
    Align = alBottom
    TabOrder = 3
    object lbCantidad: TLabel
      Left = 10
      Top = 10
      Width = 45
      Height = 13
      Caption = 'Cantidad:'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT me_id, me_numerofolio, me_expediente, me_demandante, me_d' +
        'emandado,'
      
        '       me_idexpediente, me_fechaingreso, me_fechaegreso, me_sala' +
        'rio, me_tarea,'
      '       me_fechanacimiento, me_demandaempleador, me_aseguradoart,'
      
        '       me_idmotivoreclamo, me_iddiagnostico, me_hecho, me_idrecl' +
        'amo,'
      
        '       me_incapacidad, me_incapindeterminada, me_idabogadoactora' +
        ','
      
        '       me_idabogado, me_idabogadoempresa, me_aceptarevisacionmed' +
        ','
      
        '       me_fecharevisacionmed, me_idmediador, me_incaprevisacionm' +
        'ed,'
      
        '       me_idestado, me_fechainicio, me_fechafin, me_idtipo, me_g' +
        'pba,'
      
        '       me_numerocaja, me_semestre, me_fechaalta, me_usualta, me_' +
        'fechamodif,'
      
        '       me_usumodif, me_fechabaja, me_usubaja, me_fechaasignacion' +
        ','
      '       me_montoofrecido, me_fechaofrecimiento,'
      
        '       NVL (lbo.bo_nombre, UPPER (se_nombre)) bo_nombre, ltm.tm_' +
        'descripcion,'
      '       lej.ej_descripcion, lmd.md_nombre,'
      '       art.utiles.armar_domicilio (lmd.md_calle,'
      '                                   lmd.md_numero,'
      '                                   lmd.md_piso,'
      '                                   lmd.md_departamento,'
      '                                   lmd.md_localidad'
      '                                  ) domiciliomediador,'
      
        '       lmr.mr_descripcion, cdg.dg_descripcion, lrc.rc_descripcio' +
        'n'
      '  FROM legales.lme_mediacion lme,'
      '       art.sex_expedientes sex,'
      '       legales.lrc_reclamo lrc,'
      '       legales.lbo_abogado lbo,'
      '       legales.lbo_abogado lbe,'
      '       legales.lbo_abogado lba,'
      '       legales.ltm_tipomediacion ltm,'
      '       legales.lej_estadojuicio lej,'
      '       legales.lmd_mediador lmd,'
      '       art.use_usuarios,'
      '       art.cdg_diagnostico cdg,'
      '       legales.lmr_motivoreclamo lmr'
      ' WHERE lme.me_idexpediente = sex.ex_id(+)'
      '   AND lme.me_idmotivoreclamo = lmr.mr_id(+)'
      '   AND lme.me_iddiagnostico = cdg.dg_id(+)'
      '   AND lme.me_idreclamo = lrc.rc_id(+)'
      '   AND lme.me_idabogado = lbo.bo_id(+)'
      '   AND lme.me_idusuariolegal = se_id(+)'
      '   AND lme.me_idabogadoactora = lba.bo_id(+)'
      '   AND lme.me_idabogadoempresa = lbe.bo_id(+)'
      '   AND lme.me_idmediador = lmd.md_id(+)'
      '   AND lme.me_idestado = lej.ej_id'
      '   AND lme.me_idtipo = ltm.tm_id(+)')
    Top = 276
  end
  inherited dsConsulta: TDataSource
    Top = 276
  end
  inherited SortDialog: TSortDialog
    Top = 304
  end
  inherited ExportDialog: TExportDialog
    Top = 304
  end
  inherited QueryPrint: TQueryPrint
    Top = 332
  end
  inherited Seguridad: TSeguridad
    Top = 248
  end
  inherited FormStorage: TFormStorage
    Top = 248
  end
  inherited PrintDialog: TPrintDialog
    Top = 332
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
    Top = 248
  end
  inherited FieldHider: TFieldHider
    Top = 276
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.lme_mediacion'
      'WHERE me_id = :me_id')
    Left = 80
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'me_id'
        ParamType = ptInput
      end>
  end
  object sdqConsultaRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.lme_mediacion'
      'WHERE me_id = :me_id')
    Left = 80
    Top = 332
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'me_id'
        ParamType = ptInput
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
    Left = 156
    Top = 328
  end
end
