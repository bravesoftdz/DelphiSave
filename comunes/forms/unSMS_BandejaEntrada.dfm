inherited frmSMS_BandejaEntrada: TfrmSMS_BandejaEntrada
  Caption = 'SMS | Bandeja de entrada'
  ClientHeight = 518
  ClientWidth = 708
  Font.Name = 'Tahoma'
  ExplicitWidth = 716
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 708
    Height = 57
    ExplicitWidth = 708
    ExplicitHeight = 57
    object Label1: TLabel
      Left = 201
      Top = 8
      Width = 106
      Height = 13
      Caption = 'N'#250'mero del Remitente'
    end
    object Label2: TLabel
      Left = 96
      Top = 31
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 10
      Width = 73
      Height = 13
      Caption = 'Fecha de Env'#237'o'
    end
    object edFECHAHasta: TDateComboBox
      Left = 109
      Top = 27
      Width = 86
      Height = 21
      TabOrder = 0
    end
    object edFECHADesde: TDateComboBox
      Left = 9
      Top = 27
      Width = 86
      Height = 21
      TabOrder = 1
    end
    object edREMITENTE_FULL_LIKE: TPatternEdit
      Left = 201
      Top = 27
      Width = 141
      Height = 21
      MaxLength = 11
      TabOrder = 2
      Pattern = '0123456789'
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 708
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 702
      end>
    ExplicitTop = 57
    ExplicitWidth = 708
    inherited ToolBar: TToolBar
      Left = 9
      Width = 695
      ExplicitLeft = 9
      ExplicitWidth = 695
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 708
    Height = 294
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA_RECEPCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMITENTE'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENSAJE'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSIBLE_SMS_ENVIADO'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISOR'
        Width = 47
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 380
    Width = 708
    Height = 138
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      708
      138)
    object Label4: TLabel
      Left = 13
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Mensaje'
    end
    object Label5: TLabel
      Left = 319
      Top = 10
      Width = 117
      Height = 13
      Caption = 'Posible mensaje enviado'
    end
    object edMensaje: TDBMemo
      Left = 13
      Top = 29
      Width = 300
      Height = 100
      Anchors = [akLeft, akTop, akBottom]
      DataField = 'MENSAJE'
      DataSource = dsConsulta
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object edPosibleEnviado: TDBMemo
      Left = 319
      Top = 29
      Width = 378
      Height = 100
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'POSIBLE_SMS_ENVIADO'
      DataSource = dsConsulta
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM (  SELECT MIN(fecha) fecha,'
      '                 MIN(fecha_recepcion) fecha_recepcion,'
      '                 remitente,'
      
        '                 listagg(mensaje, '#39' '#39')  WITHIN GROUP (ORDER BY u' +
        'dh2)  AS mensaje,'
      '                 posible_sms_enviado,'
      '                 emisor'
      '            FROM (SELECT id,'
      '                         --receivingdatetime,'
      
        '                         TO_DATE(TO_CHAR(receivingdatetime, '#39'dd/' +
        'mm/yyyy hh24:mi:ss'#39'), '#39'dd/mm/yyyy hh24:mi:ss'#39') fecha,'
      
        '                         TO_CHAR(receivingdatetime, '#39'dd/mm/yyyy ' +
        'hh24:mi'#39') fecha_recepcion,'
      '                         SUBSTR(udh, 1, 10) udh1,'
      '                         SUBSTR(udh, 10, 2) udh2,'
      '                         sendernumber remitente,'
      '                         textdecoded mensaje,'
      '                         (SELECT MAX(sm_mensaje)'
      '                            FROM comunes.csm_sms'
      '                           WHERE sm_fechaenvio ='
      '                                   (SELECT MAX(sm_fechaenvio)'
      
        '                                      FROM comunes.csd_smsdetall' +
        'e'
      '                                     WHERE sd_idsms = sm_id'
      
        '                                       AND sendernumber <> '#39'QUAM' +
        #39
      
        '                                       AND (art.utiles.strright(' +
        'sendernumber, 7) = art.utiles.strright(sd_telefono,'
      
        '                                                                ' +
        '                   7)'
      
        '                                         OR sd_telefono LIKE '#39'%'#39 +
        ' || art.utiles.strright(sendernumber, 7) || '#39',%'#39') --AND TO_DATE(' +
        'receivingdatetime, '#39'dd/mm/yyyy hh:mi:ss'#39') BETWEEN sd_fechaenvio ' +
        'AND SYSDATE'
      
        '                                                                ' +
        '                                                  --AND sd_fecha' +
        'envio > TO_DATE(receivingdatetime, '#39'dd/mm/yyyy hh:mi:ss'#39') - 7'
      '                                 ))'
      '                           posible_sms_enviado,'
      '                         recipientid emisor'
      '                    FROM comunes.v_sms_inbox@partdesa)'
      '           WHERE 1 = 1'
      '        GROUP BY remitente, udh1, posible_sms_enviado, emisor)'
      ' WHERE 1 = 1')
    object sdqConsultaFECHA_RECEPCION: TStringField
      DisplayLabel = 'Fecha de Recepci'#243'n'
      FieldName = 'FECHA_RECEPCION'
      Size = 16
    end
    object sdqConsultaREMITENTE: TStringField
      DisplayLabel = 'Remitente'
      FieldName = 'REMITENTE'
      Required = True
      Size = 60
    end
    object sdqConsultaMENSAJE: TStringField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Required = True
      Size = 1020
    end
    object sdqConsultaPOSIBLE_SMS_ENVIADO: TStringField
      DisplayLabel = 'Posible mensaje enviado'
      FieldName = 'POSIBLE_SMS_ENVIADO'
      Size = 4000
    end
    object sdqConsultaEMISOR: TStringField
      DisplayLabel = 'Emisor'
      FieldName = 'EMISOR'
      Required = True
      Size = 1020
    end
    object sdqConsultaFECHA: TDateTimeField
      FieldName = 'FECHA'
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
    Left = 80
    Top = 200
  end
end
