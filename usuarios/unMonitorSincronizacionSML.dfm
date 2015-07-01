inherited frmMonitorSincronizacionSML: TfrmMonitorSincronizacionSML
  Left = 238
  Top = 230
  Width = 690
  Height = 406
  Caption = 'Monitor de Transacciones SML'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 682
    Height = 105
    object lblTransaccion: TLabel
      Left = 228
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Transacci'#243'n'
    end
    object lblEstado: TLabel
      Left = 228
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lblFecha: TLabel
      Left = 384
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object lblHasta: TLabel
      Left = 472
      Top = 28
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inline fraNOMBRE: TfraCodDesc
      Left = 224
      Top = 24
      Width = 153
      Height = 23
      TabOrder = 2
      DesignSize = (
        153
        23)
      inherited edCodigo: TPatternEdit [0]
        Enabled = False
      end
      inherited cmbDescripcion: TArtComboBox [1]
        Left = 0
        Width = 148
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'CODIGO'
        OrderBy = 'DESCRIPCION'
        ShowBajas = True
        Sql = 
          'SELECT DISTINCT tin_nombre as id, tin_nombre as codigo, tin_nomb' +
          're as descripcion, null as baja FROM sml.transaction_in UNION SE' +
          'LECT DISTINCT tout_nombre as id, tout_nombre as codigo, tout_nom' +
          'bre as descripcion, null as baja FROM sml.transaction_out WHERE ' +
          '1 = 1 '
        OnChange = tbRefrescarClick
        Left = 88
        Top = 2
      end
    end
    inline fraESTADO: TfraCodDesc
      Left = 224
      Top = 68
      Width = 153
      Height = 23
      TabOrder = 3
      DesignSize = (
        153
        23)
      inherited edCodigo: TPatternEdit [0]
        Enabled = False
      end
      inherited cmbDescripcion: TArtComboBox [1]
        Left = 0
        Width = 148
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'CODIGO'
        OrderBy = 'DESCRIPCION'
        ShowBajas = True
        Sql = 
          'SELECT DISTINCT tin_estado as id, tin_estado as codigo, tin_esta' +
          'do as descripcion, null as baja FROM sml.transaction_in UNION SE' +
          'LECT DISTINCT tout_estado as id, tout_estado as codigo, tout_est' +
          'ado as descripcion, null as baja FROM sml.transaction_out WHERE ' +
          '1 = 1 '
        OnChange = tbRefrescarClick
        Left = 88
      end
    end
    object edFECHADesde: TDateEdit
      Left = 380
      Top = 24
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object edFECHAHasta: TDateEdit
      Left = 488
      Top = 24
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 5
    end
    object rgTIPO: TAdvOfficeRadioGroup
      Left = 8
      Top = 8
      Width = 97
      Height = 89
      Version = '1.2.1.0'
      Caption = ' Transacciones '
      ParentBackground = False
      TabOrder = 0
      OnClick = tbRefrescarClick
      Ellipsis = False
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Entrantes'
        'Salientes')
    end
    object rgERRORES: TAdvOfficeRadioGroup
      Left = 112
      Top = 8
      Width = 105
      Height = 89
      Version = '1.2.1.0'
      Caption = ' Errores '
      ParentBackground = False
      TabOrder = 1
      OnClick = tbRefrescarClick
      Ellipsis = False
      ItemIndex = 0
      Items.Strings = (
        'No importa'
        'S'#243'lo con error'
        'Exitosas')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 105
    Width = 682
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 678
      end>
    inherited ToolBar: TToolBar
      Width = 665
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Enabled = True
      end
      object tbReprocesar: TToolButton
        Left = 370
        Top = 0
        Caption = 'tbReprocesar'
        ImageIndex = 35
        OnClick = tbReprocesarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 134
    Width = 682
    Height = 134
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECUENCIA'
        Title.Caption = 'Secuencia'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIORIDAD'
        Title.Caption = 'Prioridad'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XML_ERROR'
        Title.Caption = 'Error'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'XML_CONTENT'
        Title.Caption = 'Contenido'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SALIDA'
        Title.Caption = 'Salida'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'Referencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REENVIO'
        Title.Caption = 'Reenvio'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODIFICADO'
        Title.Caption = 'Modificado'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ERROR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Error'
        Width = 28
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 268
    Width = 682
    Height = 111
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      682
      111)
    object lblError: TLabel
      Left = 4
      Top = 4
      Width = 24
      Height = 13
      Caption = 'Error'
    end
    object lblXML: TLabel
      Left = 4
      Top = 44
      Width = 19
      Height = 13
      Caption = 'XML'
    end
    object edXML_ERROR: TDBEdit
      Left = 4
      Top = 20
      Width = 669
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      DataField = 'XML_ERROR'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edXML_CONTENT: TDBMemo
      Left = 4
      Top = 60
      Width = 669
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      DataField = 'XML_CONTENT'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT '#39'ENTRANTE'#39' AS tipo,'
      '               tin_secuencia AS secuencia,'
      '               tin_fecha AS fecha,'
      '               tin_nombre AS nombre,'
      '               tin_prioridad AS prioridad,'
      '               tin_estado AS estado,'
      '               tin_xml_error AS xml_error,'
      
        '               CASE tin_estado WHEN 100 THEN '#39#252#39' ELSE '#39#251#39' END AS' +
        ' error,'
      '               tin_xml AS xml_content,'
      '               tin_salida AS salida,'
      '               TO_NUMBER (NULL) AS referencia,'
      '               tin_reenvio AS reenvio,'
      '               tin_siniestro AS siniestro,'
      '               TO_CHAR (NULL) AS modificado'
      '          FROM sml.transaction_in'
      '        UNION ALL'
      '        SELECT '#39'SALIENTE'#39' AS tipo,'
      '               tout_secuencia AS secuencia,'
      '               tout_fecha AS fecha,'
      '               tout_nombre AS nombre,'
      '               tout_prioridad AS prioridad,'
      '               tout_estado AS estado,'
      '               tout_xml_error AS xml_error,'
      
        '               CASE tout_estado WHEN 100 THEN '#39#252#39' ELSE '#39#251#39' END A' +
        'S error,'
      '               tout_xml AS xml_content,'
      '               TO_DATE (NULL) AS salida,'
      '               tout_referencia AS referencia,'
      '               TO_NUMBER (NULL) AS reenvio,'
      '               tout_siniestro AS siniestro,'
      '               tout_modificado AS modificado'
      '          FROM sml.transaction_out'
      '        ORDER BY fecha DESC)'
      ' WHERE 1 = 1')
    Left = 44
    Top = 188
  end
  inherited dsConsulta: TDataSource
    Left = 72
    Top = 188
  end
  inherited SortDialog: TSortDialog
    Left = 44
    Top = 216
  end
  inherited ExportDialog: TExportDialog
    Left = 72
    Top = 216
  end
  inherited QueryPrint: TQueryPrint
    Left = 72
    Top = 244
  end
  inherited Seguridad: TSeguridad
    Left = 44
    Top = 160
  end
  inherited FormStorage: TFormStorage
    Left = 72
    Top = 160
  end
  inherited PrintDialog: TPrintDialog
    Left = 44
    Top = 244
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
    Left = 100
    Top = 160
  end
  inherited FieldHider: TFieldHider
    Left = 100
    Top = 188
  end
  object ilGrid: TImageList
    Left = 100
    Top = 216
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D55E
      D55ED55ED55E0000000000000000000000000000000000000000000000007A6F
      7A6F7A6F7A6F000000000000000000000000000000000000000000000000F65E
      F65EF65EF65E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D55ED55EAD4A
      AD4AAD4AAD4AD55ED55E000000000000000000000000000000007A6F7A6F9842
      9842984298427A6F7A6F00000000000000000000000000000000F65EF65E2955
      295529552955F65EF65E00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000D55EAD4AAD4A305B
      B36BB36B305BAD4AAD4AD55E0000000000000000000000007A6F98429842DA4E
      3D5B3D5BDA4E984298427A6F000000000000000000000000F65E29552955CD65
      72767276CD6529552955F65E0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000AD4A315BB26B9067
      8F678F679067B26B315BAD4A0000000000000000000000009842FA4E3C571C4F
      FC4AFC4A1C4F3C57FA4E98420000000000000000000000002955CE6551760F76
      EE75EE750F765176CE6529550000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D55EAD4AB26B8F678D63
      8D638D638D638F67B26BAD4AD55E00000000000000007A6F98423C57FC4ADB46
      DB42DB42DB46FC4A3C5798427A6F0000000000000000F65E29555176EE75AC71
      AC71AC71AC71EE7551762955F65E000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4A305B90678D638D63
      8C638C638D638D639067305BAD4A00000000000000009842DA4E1C4FDB46BB3E
      BA3ABA3ABB3EDB461C4FDA4E984200000000000000002955CD650F76AC718C71
      8B718B718C71AC710F76CD652955000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4AB36B8F678D638C63
      8C638C638C638D638F67B36BAD4A000000000000000098423D5BFC4ADB42BA3A
      9A3A9A3ABA3ADB42FC4A3D5B9842000000000000000029557276EE75AC718B71
      8B718B718B71AC71EE7572762955000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4ADA77B873B76FB76F
      B76FB76FB76FB76FB873DA77AD4A000000000000000098429E6B7D635D5F3D5B
      3D5B3D5B3D5B5D5F7D639E6B984200000000000000002955397BF67AD576B576
      B576B576B576D576F67A397B2955000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4A335FBA77B973B973
      B973B973B973B973BA77335FAD4A000000000000000098421A579E6B7E677D63
      7D637D637D637E679E6B1A579842000000000000000029551066397B187BF77A
      F77AF77AF77A187B397B10662955000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000AD4ADC7BDC77DB77
      DB77DB77DB77DC77DC7BAD4A0000000000000000000000009842BF73BE6F9E6F
      9E6F9E6F9E6FBE6FBF73984200000000000000000000000029557B7F7A7B5A7B
      5A7B5A7B5A7B7A7B7B7F29550000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000AD4A345FFE7BFD7B
      FD7BFD7BFD7BFE7B345FAD4A00000000000000000000000098421B5BDF7BDF77
      DF77DF77DF77DF7B1B5B984200000000000000000000000029555266BD7FBD7F
      BC7FBC7FBD7FBD7F526629550000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD4AAD4A345F
      FF7FFF7F345FAD4AAD4A00000000000000000000000000000000984298423B5B
      FF7FFF7F3B5B9842984200000000000000000000000000000000295529555266
      FE7FFE7F52662955295500000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD4A
      AD4AAD4AAD4A0000000000000000000000000000000000000000000000009842
      9842984298420000000000000000000000000000000000000000000000002955
      2955295529550000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FC3FFC3FFC3F0000
      F00FF00FF00F0000E007E007E0070000E007E007E0070000C003C003C0030000
      C003C003C0030000C003C003C0030000C003C003C0030000C003C003C0030000
      E007E007E0070000E007E007E0070000F00FF00FF00F0000FC3FFC3FFC3F0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
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
    Left = 100
    Top = 160
  end
  object sdqReprocesar: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'DECLARE'
      '  sec       INTEGER;'
      '  fecha     DATE;'
      '  nombre    VARCHAR2 (100);'
      '  xml       VARCHAR2 (4000);'
      '  prioridad INTEGER;'
      '  estado    INTEGER;'
      '  error     VARCHAR2 (4000);'
      'BEGIN'
      '  SELECT secuencia,'
      '         fecha,'
      '         nombre,'
      '         prioridad,'
      '         xml,'
      '         estado,'
      '         xml_error'
      '    INTO sec,'
      '         fecha,'
      '         nombre,'
      '         prioridad,'
      '         xml,'
      '         estado,'
      '         error'
      '    FROM (SELECT t.tin_secuencia secuencia,'
      '                 '#39'ENTRANTE'#39' tipo,'
      '                 t.tin_fecha fecha,'
      '                 t.tin_nombre nombre,'
      '                 t.tin_prioridad prioridad,'
      '                 t.tin_xml xml,'
      '                 t.tin_estado estado,'
      '                 t.tin_xml_error xml_error'
      '            FROM sml.transaction_in t'
      '           WHERE t.tin_secuencia = :secuencia'
      '           UNION'
      '          SELECT t.tout_secuencia,'
      '                 '#39'SALIENTE'#39' tipo,'
      '                 t.tout_fecha,'
      '                 t.tout_nombre,'
      '                 t.tout_prioridad,'
      '                 t.tout_xml,'
      '                 t.tout_estado,'
      '                 t.tout_xml_error'
      '            FROM sml.transaction_out t'
      '           WHERE t.tout_secuencia = :secuencia)'
      '   WHERE tipo = :tipo;'
      ''
      '  sml.ap_art_launcher (sec,'
      '                       fecha,'
      '                       xml,'
      '                       nombre,'
      '                       prioridad,'
      '                       estado,'
      '                       error);'
      '--sml.ap_art_int_a_observ(nombre, xml, estado, error);'
      '--DBMS_OUTPUT.put_line (estado);'
      '--DBMS_OUTPUT.put_line (error);'
      
        '  :mensaje := '#39'Estado: '#39' || estado || chr(13) || chr(10) || '#39'Err' +
        'or: '#39' || error;'
      'END;')
    Left = 100
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'secuencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'secuencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'mensaje'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        ParamType = ptInput
      end>
  end
end
