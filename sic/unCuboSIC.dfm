inherited frmCuboSIC: TfrmCuboSIC
  Left = 219
  Top = 183
  Width = 936
  Height = 680
  Caption = 'Estad'#237'sticas'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBPivotGrid: TcxDBPivotGrid [0]
    Left = 0
    Top = 30
    Width = 928
    Height = 623
    Align = alClient
    BorderWidth = 1
    DataSource = dsConsulta
    Groups = <>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    OptionsData.AnsiSort = True
    OptionsDataField.IsCaptionAssigned = True
    OptionsDataField.Caption = 'Datos'
    OptionsView.ColumnGrandTotalText = 'Total'
    OptionsView.RowGrandTotalText = 'Total'
    TabOrder = 0
    object Cantidad: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Cantidad'
      DataBinding.ValueType = 'Float'
      DataBinding.FieldName = 'CANTIDAD'
      DisplayFormat = '#'
      Visible = True
    end
    object Estado: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Estado'
      DataBinding.FieldName = 'ESTADO'
      Visible = True
    end
    object Motivo: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Motivo'
      DataBinding.FieldName = 'MOTIVO'
      SortBySummaryInfo.Field = Cantidad
      SortOrder = soDescending
      Visible = True
      Width = 200
    end
    object Usuario: TcxDBPivotGridField
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Usuario'
      DataBinding.FieldName = 'USUARIO'
      SortBySummaryInfo.Field = Cantidad
      SortOrder = soDescending
      Visible = True
    end
    object UsuarioGenerico: TcxDBPivotGridField
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Usuario gen'#233'rico'
      DataBinding.FieldName = 'USUARIOGENERICO'
      GroupExpanded = False
      Visible = True
    end
    object MotivoIngreso: TcxDBPivotGridField
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Motivo de Ingreso'
      DataBinding.FieldName = 'MOTIVO_INGRESO'
      Visible = True
      Width = 200
    end
    object Respuesta: TcxDBPivotGridField
      AreaIndex = 3
      IsCaptionAssigned = True
      Caption = 'Respuesta tabulada'
      DataBinding.FieldName = 'RESPUESTA'
      Visible = True
      Width = 300
    end
    object Prestador: TcxDBPivotGridField
      AreaIndex = 4
      IsCaptionAssigned = True
      Caption = 'Prestador'
      DataBinding.FieldName = 'PRESTADOR'
      Visible = True
    end
  end
  inline fraTituloCubo: TfraTitulo [1]
    Left = 0
    Top = 0
    Width = 928
    Height = 30
    Align = alTop
    AutoSize = True
    TabOrder = 1
    inherited AdvToolBarPager: TAdvToolBarPager
      Width = 928
      Caption.Caption = 'Estad'#237'sticas avanzadas'
    end
  end
  inherited FormStorage: TFormStorage [2]
    Left = 40
    Top = 144
  end
  inherited XPMenu: TXPMenu [3]
    Left = 68
    Top = 144
  end
  inherited ilByN: TImageList [4]
    Left = 40
    Top = 172
  end
  inherited ilColor: TImageList [5]
    Left = 68
    Top = 172
  end
  inherited IconosXP: TImageList
    Left = 96
    Top = 172
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 68
    Top = 200
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT estado,'
      '         COUNT ( * ) AS cantidad,'
      '         motivo,'
      '         motivo_ingreso,'
      '         usuariogenerico,'
      '         usuario,'
      '         respuesta,'
      '         NULL AS tareas,'
      '         prestador'
      '    FROM (  SELECT at_id,'
      '                   CASE at_estado'
      '                     WHEN 1'
      '                     THEN'
      '                       CASE'
      '                         WHEN (propia IN ('#39'S'#39', '#39'I'#39')'
      '                           AND at_fechavencimiento >= SYSDATE)'
      '                         THEN'
      '                           '#39'Pendientes en t'#233'rmino'#39
      '                         WHEN (propia IN ('#39'S'#39', '#39'I'#39')'
      '                           AND at_fechavencimiento < SYSDATE)'
      '                         THEN'
      '                           '#39'Pendientes vencidas'#39
      '                         WHEN (propia IN ('#39'S'#39', '#39'I'#39')'
      '                           AND at_fechavencimiento IS NULL)'
      '                         THEN'
      '                           '#39'Pendientes sin fecha'#39
      '                         ELSE'
      '                           '#39'Derivadas a'#250'n pendientes'#39
      '                       END'
      '                     WHEN 5'
      '                     THEN'
      '                       CASE'
      '                         WHEN at_ideventotarea IS NULL'
      '                         THEN'
      '                           '#39'Sin resoluci'#243'n'#39
      '                         ELSE'
      '                           (SELECT CASE'
      '                                     WHEN propia IN ('#39'S'#39', '#39'I'#39')'
      '                                     THEN'
      '                                       CASE ae_estado'
      '                                         WHEN 1'
      '                                         THEN'
      '                                           CASE'
      
        '                                             WHEN at_fechavencim' +
        'iento < ae_fechahorainicio'
      '                                             THEN'
      
        '                                               '#39'Pendientes venci' +
        'das (agendadas vencidas)'#39
      
        '                                             WHEN at_fechavencim' +
        'iento > SYSDATE'
      '                                             THEN'
      
        '                                               '#39'Pendientes en t'#233 +
        'rmino (agendadas)'#39
      '                                             ELSE'
      
        '                                               '#39'Pendientes venci' +
        'das (agendadas en t'#233'rmino)'#39
      '                                           END'
      '                                         WHEN 5'
      '                                         THEN'
      '                                           CASE'
      
        '                                             WHEN ae_fechatermin' +
        'ado < at_fechavencimiento THEN '#39'Resueltas en t'#233'rmino'#39
      
        '                                             ELSE '#39'Resueltas pos' +
        't vencimiento'#39
      '                                           END'
      '                                         ELSE'
      '                                           '#39'Resueltas sin fecha'#39
      '                                       END'
      '                                     ELSE'
      '                                       '#39'Derivadas ya resueltas'#39
      '                                   END'
      '                              FROM agenda.aae_agendaevento aae'
      
        '                             WHERE ae_fechaalta > TRUNC (TRUNC (' +
        'SYSDATE, '#39'MM'#39') - 1, '#39'MM'#39') --AND TRUNC (TRUNC (SYSDATE, '#39'MM'#39'), '#39'M' +
        'M'#39')'
      '                               AND ae_id = at_ideventotarea'
      '                               AND 1 = 1)'
      '                       END'
      '                     ELSE'
      '                       '#39'Otro estado'#39
      '                   END'
      '                     AS estado,'
      '                   motivo,'
      '                   motivo_ingreso,'
      '                   se_usuariogenerico usuariogenerico,'
      '                   usuario,'
      '                   respuesta,'
      '                   prestador'
      '              FROM (  SELECT DISTINCT at_id,'
      '                                      at_estado,'
      '                                      at_fechavencimiento,'
      '                                      at_ideventotarea,'
      '                                      at_idagendaevento,'
      '                                      CASE'
      
        '                                        WHEN ( (1 = 1 --%filtro_' +
        'por_usuario%'
      '                                                     )'
      
        '                                          AND st_estado IN ('#39'D'#39')' +
        ')'
      '                                        THEN'
      '                                          '#39'N'#39
      
        '                                        WHEN ( (1 = 1 --%filtro_' +
        'por_usuario%'
      '                                                     )'
      
        '                                          AND st_estado NOT IN (' +
        #39'D'#39'))'
      '                                        THEN'
      '                                          '#39'S'#39
      '                                        ELSE'
      '                                          '#39'I'#39
      '                                      END'
      '                                        AS propia,'
      '                                      te_descripcion AS motivo,'
      
        '                                      mi_descripcion AS motivo_i' +
        'ngreso,'
      '                                      usu.se_usuariogenerico,'
      '                                      usu.se_nombre usuario,'
      '                                      /*'
      '                                      CASE'
      
        '                                        WHEN rs_descripcion IS N' +
        'ULL'
      '                                        THEN'
      
        '                                          CASE WHEN ra_observaci' +
        'on IS NULL THEN NULL ELSE ra_observacion END'
      '                                        ELSE'
      '                                          CASE'
      
        '                                            WHEN ra_observacion ' +
        'IS NULL THEN rs_descripcion'
      
        '                                            ELSE rs_descripcion ' +
        '|| CHR (13) || CHR (10) || ra_observacion'
      '                                          END'
      '                                      END'
      '                                        AS respuesta'
      '                                      */'
      
        '                                      rs_descripcion AS respuest' +
        'a,'
      '                                      ca_descripcion prestador'
      '                        FROM art.cpr_prestador,'
      '                             computos.cse_sector sec,'
      '                             agenda.ars_respuesta,'
      '                             agenda.ara_respuestaagendaevento,'
      '                             art.use_usuarios usu,'
      '                             agenda.ast_seguimientotarea,'
      '                             agenda.ate_tipoevento,'
      '                             agenda.ami_motivoingreso,'
      '                             agenda.aat_agendatarea'
      
        '                       WHERE at_fechaalta BETWEEN TRUNC (TRUNC (' +
        'SYSDATE, '#39'MM'#39') - 1, '#39'MM'#39')'
      
        '                                              AND  TRUNC (TRUNC ' +
        '(SYSDATE, '#39'MM'#39'), '#39'MM'#39')'
      
        '                         AND usu.se_id = NVL (DECODE (st_estado,' +
        ' '#39'D'#39', st_idusuario, at_idusuario), st_idusuario)'
      '                         AND at_idtipoevento = te_id'
      '                         AND at_idmotivoingreso = mi_id'
      '                         AND st_idtarea = at_id'
      '                         AND st_estado NOT IN ('#39'C'#39')'
      
        '                         AND at_ideventotarea = ra_idagendaevent' +
        'o(+)'
      '                         AND ra_idrespuesta = rs_id(+)'
      
        '                         AND at_idprestador = ca_identificador(+' +
        ')'
      
        '                         AND NVL (usu.se_idsector, 89163) = sec.' +
        'se_id(+)'
      '                         AND ( (1 = 1 --%filtro_por_usuario%'
      '                                     )'
      '                           OR st_estado NOT IN ('#39'D'#39'))'
      '                    GROUP BY at_id,'
      '                             at_estado,'
      '                             at_fechavencimiento,'
      '                             at_ideventotarea,'
      '                             at_idagendaevento,'
      '                             te_descripcion,'
      '                             mi_descripcion,'
      '                             usu.se_usuariogenerico,'
      '                             usu.se_nombre,'
      '                             rs_descripcion,'
      '                             ca_descripcion,'
      '                             CASE'
      
        '                               WHEN ( (1 = 1 --%filtro_por_usuar' +
        'io%'
      '                                            )'
      '                                 AND st_estado IN ('#39'D'#39'))'
      '                               THEN'
      '                                 '#39'N'#39
      
        '                               WHEN ( (1 = 1 --%filtro_por_usuar' +
        'io%'
      '                                            )'
      '                                 AND st_estado NOT IN ('#39'D'#39'))'
      '                               THEN'
      '                                 '#39'S'#39
      '                               ELSE'
      '                                 '#39'I'#39
      '                             END)'
      '          GROUP BY at_id,'
      '                   at_estado,'
      '                   at_fechavencimiento,'
      '                   at_ideventotarea,'
      '                   at_idagendaevento,'
      '                   propia,'
      '                   motivo,'
      '                   motivo_ingreso,'
      '                   se_usuariogenerico,'
      '                   usuario,'
      '                   respuesta,'
      '                   prestador)'
      'GROUP BY estado,'
      '         motivo,'
      '         motivo_ingreso,'
      '         usuariogenerico,'
      '         usuario,'
      '         respuesta,'
      '         prestador'
      'ORDER BY 2 DESC')
    Left = 40
    Top = 200
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 42
    end
    object sdqConsultaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object sdqConsultaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 250
    end
    object sdqConsultaTAREAS: TStringField
      FieldName = 'TAREAS'
      Size = 0
    end
    object sdqConsultaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
    object sdqConsultaMOTIVO_INGRESO: TStringField
      FieldName = 'MOTIVO_INGRESO'
      Required = True
      Size = 255
    end
    object sdqConsultaRESPUESTA: TStringField
      FieldName = 'RESPUESTA'
      Size = 2252
    end
    object sdqConsultaUSUARIOGENERICO: TStringField
      FieldName = 'USUARIOGENERICO'
      FixedChar = True
      Size = 1
    end
    object sdqConsultaPRESTADOR: TStringField
      FieldName = 'PRESTADOR'
      Size = 150
    end
  end
end
