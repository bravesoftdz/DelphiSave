inherited frmReportePorAuditor: TfrmReportePorAuditor
  Left = 519
  Top = 211
  Caption = 'Reporte por auditor'
  ClientWidth = 650
  ExplicitLeft = 519
  ExplicitTop = 211
  ExplicitWidth = 658
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 650
    Height = 41
    ExplicitWidth = 650
    ExplicitHeight = 41
    DesignSize = (
      650
      41)
    object gbFecha: TGroupBox
      Left = 0
      Top = -1
      Width = 192
      Height = 42
      Caption = 'Fecha de pago'
      TabOrder = 0
      object Label1: TLabel
        Left = 90
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcFecDesde: TDateComboBox
        Left = 3
        Top = 16
        Width = 85
        Height = 21
        MaxDateCombo = dcFecHasta
        TabOrder = 0
      end
      object dcFecHasta: TDateComboBox
        Left = 104
        Top = 15
        Width = 85
        Height = 21
        MinDateCombo = dcFecDesde
        TabOrder = 1
      end
    end
    object gbUsuario: TGroupBox
      Left = 193
      Top = -1
      Width = 334
      Height = 42
      Caption = 'Usuario Auditor'
      TabOrder = 1
      DesignSize = (
        334
        42)
      inline fraUsuario: TfraUsuario
        Left = 6
        Top = 15
        Width = 322
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 15
        ExplicitWidth = 322
        inherited cmbDescripcion: TArtComboBox
          Width = 238
          ExplicitWidth = 238
        end
      end
    end
    object gbConPago: TGroupBox
      Left = 528
      Top = -1
      Width = 120
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Concepto Pago'
      TabOrder = 2
      DesignSize = (
        120
        42)
      inline fraConPago: TfraCodigoDescripcion
        Left = 3
        Top = 14
        Width = 112
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 14
        ExplicitWidth = 112
        inherited cmbDescripcion: TArtComboBox
          Width = 47
          ExplicitWidth = 47
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 41
    Width = 650
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 644
      end>
    ExplicitTop = 41
    ExplicitWidth = 650
    inherited ToolBar: TToolBar
      Width = 635
      ExplicitWidth = 635
    end
  end
  inherited Grid: TArtDBGrid
    Top = 70
    Width = 650
    Height = 236
    Columns = <
      item
        Expanded = False
        FieldName = 'USUARIOAUD'
        Title.Caption = 'Auditor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MESPAGO'
        Title.Caption = 'Mes Pago'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUDITADO'
        Title.Caption = 'Auditado'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITADO'
        Title.Caption = 'Debitado'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = '% Deb/Aud'
        Width = 64
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT usuarioaud, mespago, SUBSTR(ROUND(TRUNC(auditado), -3), 1' +
        ', LENGTH(TRUNC(auditado)) - 3) auditado,'
      
        '       SUBSTR(ROUND(TRUNC(debitado), -3), 1, LENGTH(TRUNC(debita' +
        'do)) - 3) debitado,'
      '       ROUND((debitado * 100) / auditado, 1) || '#39'%'#39' "% Deb/Aud"'
      
        '  FROM (SELECT   usuarioaud, TO_CHAR(vo_fechapago, '#39'MM-YYYY'#39') me' +
        'spago, '
      '                 SUM(iv_impfacturado) auditado,'
      
        '                 SUM(DECODE(iv_motivodebito, '#39'06'#39',(iv_impfactura' +
        'do - iv_imppagconret), 0)) debitado'
      
        '            FROM (SELECT hv_usualta usuarioaud, vo_fechapago, vo' +
        '_volante, iv_impfacturado, '
      
        '                         iv_imppagconret, iv_numvolante, iv_moti' +
        'vodebito'
      
        '                    FROM art.svo_volantes a, art.siv_itemvolante' +
        ' b, '
      
        '                         art.cpr_prestador c, art.mtp_tipopresta' +
        'dor d,'
      
        '                         art.scp_conpago e, art.shv_historicovol' +
        'ante f'
      '                   WHERE cp_conpago = iv_conpago'
      '                     AND vo_volante = iv_volante'
      '                     AND ca_identificador = vo_prestador'
      '                     AND tp_codigo = ca_especialidad'
      '                     AND vo_volante = hv_volante'
      '                     AND hv_id = (SELECT MIN(hv_id)'
      
        '                                    FROM art.shv_historicovolant' +
        'e g, art.use_usuarios'
      '                                   WHERE hv_usualta = se_usuario'
      '                                     AND se_sector = '#39'AUDILIQ'#39
      
        '                                     AND g.hv_volante = vo_volan' +
        'te'
      
        '                                     AND g.hv_estado IN('#39'P'#39', '#39'PV' +
        #39')'
      
        '                                     AND g.hv_fechaalta >= vo_fe' +
        'charecepaudit)'
      
        '                     AND iv_estado IN('#39'A1'#39', '#39'A2'#39', '#39'A3'#39', '#39'A4'#39', '#39'A' +
        '5'#39', '#39'A6'#39', '#39'A7'#39', '#39'A'#39')'
      '                     AND iv_auditado = '#39'S'#39
      '                     AND vo_estado IN('#39'E'#39', '#39'EG'#39', '#39'EM'#39')'
      '                     AND cp_indicadoramf = '#39'S'#39
      '                     AND tp_indicadoramf = '#39'S'#39
      '                     AND iv_impfacturado > 0'
      '                     AND vo_fechapago BETWEEN :desde AND :hasta'
      '                 )'
      '           WHERE 1 = 1'
      '        GROUP BY usuarioaud, TO_CHAR(vo_fechapago, '#39'MM-YYYY'#39'))')
    ParamData = <
      item
        DataType = ftDate
        Name = 'desde'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'hasta'
        ParamType = ptInput
      end>
    object sdqConsultaUSUARIOAUD: TStringField
      FieldName = 'USUARIOAUD'
    end
    object sdqConsultaMESPAGO: TStringField
      FieldName = 'MESPAGO'
      Size = 7
    end
    object sdqConsultaAUDITADO: TStringField
      FieldName = 'AUDITADO'
      Size = 40
    end
    object sdqConsultaDEBITADO: TStringField
      FieldName = 'DEBITADO'
      Size = 40
    end
    object sdqConsultaDebAud: TStringField
      FieldName = '% Deb/Aud'
      Size = 41
    end
  end
  inherited QueryPrint: TQueryPrint
    Footer.Font.Height = -11
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'CambiarUsuario'
      end>
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
      end>
    Left = 80
    Top = 260
  end
end
