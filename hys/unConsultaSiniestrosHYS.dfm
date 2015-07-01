inherited frmConsultaSiniestros: TfrmConsultaSiniestros
  Left = 266
  Top = 178
  Width = 712
  Height = 405
  Caption = 'Consulta de Siniestros'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 704
    Height = 58
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label3: TLabel
      Left = 8
      Top = 34
      Width = 55
      Height = 13
      Caption = 'Fecha Acc.'
    end
    object Label4: TLabel
      Left = 162
      Top = 34
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 39
      Top = 6
      Width = 658
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
        Left = 554
      end
      inherited edContrato: TIntEdit
        Left = 601
      end
      inherited cmbRSocial: TArtComboBox
        Width = 419
      end
    end
    object edFechaAccDesde: TDateComboBox
      Left = 70
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edFechaAccHasta: TDateComboBox
      Left = 196
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 58
    Width = 704
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 700
      end>
    inherited ToolBar: TToolBar
      Width = 687
    end
  end
  inherited Grid: TArtDBGrid
    Top = 87
    Width = 704
    Height = 291
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Caption = 'CUIT'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Caption = 'F.Accidente'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA'
        Title.Caption = 'Forma'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGENTE'
        Title.Caption = 'Agente'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NATURALEZA'
        Title.Caption = 'Naturaleza'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZONA'
        Title.Caption = 'Zona'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAUSAFIN'
        Title.Caption = 'Causa Fin'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOACCIDENTE'
        Title.Caption = 'Tipo de Accidente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        Title.Caption = 'Gravedad'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CatDiasCaidos'
        Title.Caption = 'Cat. D'#237'as Ca'#237'dos'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_HORAACCIDENTE'
        Title.Caption = 'Hora Acc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BREVEDESCRIPCION'
        Title.Caption = 'Breve descripci'#243'n'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_POSIBLEEEPP'
        Title.Alignment = taCenter
        Title.Caption = 'Posible enf. prof'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRSECTOR'
        Title.Caption = 'Sector Empresa'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nroEstableci'
        Title.Caption = 'Nro. Establecimiento'
        Visible = False
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ex_id, ex_siniestro, ex_orden, ex_recaida, art.utiles.arm' +
        'ar_siniestro(ex_siniestro, ex_orden, ex_recaida, '#39'-'#39') siniestro,'
      
        '       ex_cuil, tj_nombre, ex_cuit, em_nombre, ex_fechaaccidente' +
        ', ex_fecharecaida, ex_bajamedica, ex_altamedica,'
      
        '       ex_fechareasignacion f_reasignacion, lg_nombre, ex_diagno' +
        'sticooms, ex_fechaalta,'
      
        '       art.siniestro.get_motivorechazo(ex_siniestro, ex_orden, e' +
        'x_recaida) motivorechazo,'
      
        '       art.SIN.get_cantdiascaidos(ex_siniestro, ex_orden, ex_rec' +
        'aida) diascaidos,'
      
        '       art.varios.get_regionsanitaria(tj_cpostal, tj_localidad) ' +
        'regionsanitaria, NULL categoria, ex_horaaccidente,'
      
        '       ex_brevedescripcion, NVL(ex_posiblerecupero, '#39'N'#39') posrecu' +
        'pero,'
      
        '       art.amebpba.get_denunciasrt(ex_siniestro, ex_orden, ex_re' +
        'caida) denunciasrt,'
      
        '       NVL(ex_fecharecaida, ex_fechaaccidente) fechaaccidente, l' +
        'f_descripcion forma, la_descripcion agente,'
      
        '       ln_descripcion naturaleza, lz_descripcion zona, dg_descri' +
        'pcion, ex_fecharecepcion, ex_diagnostico,'
      
        '       DECODE(ex_estado, '#39'01'#39', '#39'Activo'#39', '#39'02'#39', '#39'Suspend. Plazos'#39 +
        ', '#39'03'#39', '#39'Cerrado'#39') estado, causaf.tb_descripcion causafin,'
      '       DECODE(ex_tipo,'
      '              '#39'1'#39', '#39'LUGAR DE TRABAJO'#39','
      '              '#39'2'#39', '#39'IN ITINERE'#39','
      '              '#39'3'#39', '#39'ENFERMEDAD PROFESIONAL'#39','
      '              '#39'LUGAR DE TRABAJO'#39') tipoaccidente,'
      '       DECODE(ex_gravedad,'
      '              '#39'1'#39', '#39'LEVE'#39','
      '              '#39'2'#39', '#39'MODERADO SIN INTERNACION'#39','
      '              '#39'3'#39', '#39'MODERADO CON INTERNACION'#39','
      '              '#39'4'#39', '#39'GRAVE'#39','
      '              '#39'5'#39', '#39'MORTAL'#39','
      '              '#39'LEVE'#39') gravedad,'
      
        '       ex_posibleeepp, NVL(ex_tipo, '#39'1'#39') tiposin, co_contrato, e' +
        'x_siniestrored, sect.tb_descripcion descrsector,'
      
        '       ex_liberatrabajo, ex_gtrabajo, NVL(ex_gravedad, '#39'1'#39') ex_g' +
        'ravedad, ex_usuliberatrabajo, ex_fechaliberatrabajo,'
      
        '       SUBSTR(art.inca.get_descripcioninca(ex_siniestro, ex_orde' +
        'n, '#39'M'#39'), 15, 7) por_inca,'
      
        '       SUBSTR(art.inca.get_descripcioninca(ex_siniestro, ex_orde' +
        'n, '#39'M'#39'), 31) eve_inca,'
      
        '       SUBSTR(art.inca.get_descripcioninca(ex_siniestro, ex_orde' +
        'n, '#39'M'#39'), 1, 10) fec_inca,'
      
        '       art.inca.is_dictamencommed(ex_siniestro, ex_orden) commed' +
        ','
      
        '       DECODE(ex_estadocronico, '#39'A'#39', '#39'Activo'#39', '#39'S'#39', '#39'Sin actuali' +
        'zaci'#243'n'#39', '#39'I'#39', '#39'Inactivo'#39', NULL) estadocron,'
      
        '       CASE WHEN NVL(art.SIN.get_cantdiascaidos(ex_siniestro, ex' +
        '_orden, ex_recaida) , 11) > 10 THEN '#39'>10'#39' ELSE '#39'<=10'#39' END CatDia' +
        'sCaidos,'
      '       null nroEstableci'
      
        '  FROM art.ctb_tablas causaf, art.ctb_tablas sect, aco_contrato,' +
        ' art.dlg_delegaciones, aem_empresa, ctj_trabajador,'
      
        '       art.sex_expedientes, art.cdg_diagnostico, SIN.slf_lesionf' +
        'orma, SIN.sla_lesionagente, SIN.sln_lesionnaturaleza,'
      '       SIN.slz_lesionzona'
      ' WHERE ex_cuil = tj_cuil'
      '   AND ex_cuit = em_cuit'
      '   AND co_idempresa = em_id'
      '   AND co_contrato = ex_contrato'
      '   AND NVL(ex_causafin, '#39'0'#39') NOT IN('#39'99'#39', '#39'95'#39')'
      '   AND ex_delegacion = lg_codigo'
      '   AND dg_codigo(+) = ex_diagnosticooms'
      '   AND lf_id(+) = ex_idforma'
      '   AND la_id(+) = ex_idagente'
      '   AND ln_id(+) = ex_idnaturaleza'
      '   AND lz_id(+) = ex_idzona'
      '   AND sect.tb_clave = '#39'SECT'#39
      '   AND sect.tb_codigo = em_sector'
      '   AND causaf.tb_clave(+) = '#39'CATER'#39
      '   AND causaf.tb_codigo(+) = ex_causafin'
      '   AND ex_recaida = 0'
      '   AND NVL(ex_causafin, '#39'0'#39') NOT IN('#39'02'#39', '#39'95'#39', '#39'99'#39')')
  end
  inherited ExportDialog: TExportDialog
    BeforeExport = ExportDialogBeforeExport
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    OnReportEnd = QueryPrintReportEnd
  end
  inherited PrintDialog: TPrintDialog
    OnShow = PrintDialogShow
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
end
