inherited frmManCTS_TEXTOSMS: TfrmManCTS_TEXTOSMS
  Left = 351
  Top = 123
  Width = 719
  Height = 532
  Caption = 'Mantenimiento de Textos de los SMS'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 711
    Height = 57
    Visible = True
    object Label2: TLabel
      Left = 172
      Top = 8
      Width = 110
      Height = 13
      Caption = 'Formato del Telegrama'
    end
    object Label6: TLabel
      Left = 12
      Top = 8
      Width = 34
      Height = 13
      Caption = 'M'#243'dulo'
    end
    inline fraTS_IDFORMATOTELEGRAMA: TfraCodDesc
      Left = 168
      Top = 24
      Width = 280
      Height = 23
      TabOrder = 0
      DesignSize = (
        280
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 215
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'FT_FECHABAJA'
        FieldCodigo = 'FT_CODIGO'
        FieldDesc = 'FT_DESCRIPCION'
        FieldID = 'FT_ID'
        OrderBy = 'FT_DESCRIPCION'
        ShowBajas = True
        TableName = 'TFT_FORMATOTELEGRAMA'
        OnChange = tbRefrescarClick
      end
    end
    inline fraTS_MODULO: TfraCodDesc
      Left = 8
      Top = 24
      Width = 157
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 18
        Width = 139
      end
      inherited edCodigo: TPatternEdit
        Width = 17
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'ID'
        OrderBy = 'DESCRIPCION'
        Sql = 
          'SELECT id, codigo, descripcion, baja FROM(SELECT '#39'CC'#39' as id, '#39'CC' +
          #39' AS codigo, '#39'Citaci'#243'n a Consultorio'#39' AS descripcion, NULL AS ba' +
          'ja FROM dual UNION SELECT '#39'TE'#39' as id, '#39'TE'#39' AS codigo, '#39'Telegrama' +
          's'#39' AS descripcion, NULL AS baja FROM dual) tabla WHERE 1 = 1 '
        TableName = 'TABLA'
        Left = 56
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 711
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 707
      end>
    inherited ToolBar: TToolBar
      Width = 694
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 711
    Height = 330
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'MODULO'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_DESCRIPCION'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LARGO'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 248
    Top = 136
    Width = 445
    Height = 337
    DesignSize = (
      445
      337)
    inherited BevelAbm: TBevel
      Top = 301
      Width = 437
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 256
      Width = 110
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Formato del Telegrama'
    end
    object Label3: TLabel [2]
      Left = 172
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [3]
      Left = 12
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Texto'
    end
    object Label5: TLabel [4]
      Left = 12
      Top = 8
      Width = 34
      Height = 13
      Caption = 'M'#243'dulo'
    end
    object lbCaracteres: TLabel [5]
      Left = 428
      Top = 256
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 290
      Top = 307
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 365
      Top = 307
      TabOrder = 5
    end
    inline fraFormatoTelegrama: TfraCodDesc
      Left = 12
      Top = 272
      Width = 425
      Height = 23
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 3
      DesignSize = (
        425
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 360
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 63
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'FT_FECHABAJA'
        FieldCodigo = 'FT_CODIGO'
        FieldDesc = 'FT_DESCRIPCION'
        FieldID = 'FT_ID'
        OrderBy = 'FT_DESCRIPCION'
        ShowBajas = True
        TableName = 'TFT_FORMATOTELEGRAMA'
        OnChange = fraFormatoTelegramaPropiedadesChange
      end
    end
    object edDescripcion: TEdit
      Left = 172
      Top = 28
      Width = 261
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
    object edTexto: TMemo
      Left = 12
      Top = 76
      Width = 421
      Height = 177
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4000
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
      OnChange = edTextoChange
    end
    inline fraModulo: TfraCodDesc
      Left = 12
      Top = 27
      Width = 157
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 18
        Width = 138
      end
      inherited edCodigo: TPatternEdit
        Width = 17
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'ID'
        OrderBy = 'DESCRIPCION'
        Sql = 
          'SELECT id, codigo, descripcion, baja FROM(SELECT '#39'CC'#39' as id, '#39'CC' +
          #39' AS codigo, '#39'Citaci'#243'n a Consultorio'#39' AS descripcion, NULL AS ba' +
          'ja FROM dual UNION SELECT '#39'TE'#39' as id, '#39'TE'#39' AS codigo, '#39'Telegrama' +
          's'#39' AS descripcion, NULL AS baja FROM dual) tabla WHERE 1 = 1 '
        TableName = 'TABLA'
        Left = 56
      end
    end
  end
  object edTextoConsulta: TDBMemo [4]
    Left = 0
    Top = 416
    Width = 711
    Height = 89
    Align = alBottom
    DataField = 'TS_TEXTO'
    DataSource = dsConsulta
    TabOrder = 4
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT cts.*, CASE ts_modulo'
      '                WHEN '#39'CC'#39' THEN '#39'Citaci'#243'n a Consultorio'#39
      '                WHEN '#39'TE'#39' THEN '#39'Telegramas'#39
      '              END'
      '                AS modulo, LENGTH (ts_texto) AS largo'
      '  FROM comunes.cts_textosms cts'
      ' WHERE 1 = 1')
    object sdqConsultaTS_ID: TFloatField
      FieldName = 'TS_ID'
      Required = True
    end
    object sdqConsultaTS_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TS_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqConsultaTS_TEXTO: TStringField
      DisplayLabel = 'Texto'
      FieldName = 'TS_TEXTO'
      Required = True
      Size = 4000
    end
    object sdqConsultaTS_MODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'TS_MODULO'
      Required = True
      Size = 2
    end
    object sdqConsultaTS_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'TS_USUALTA'
      Required = True
    end
    object sdqConsultaTS_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'TS_FECHAALTA'
      Required = True
    end
    object sdqConsultaTS_USUMODIF: TStringField
      DisplayLabel = 'Usuario de Modificaci'#243'n'
      FieldName = 'TS_USUMODIF'
    end
    object sdqConsultaTS_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de Modificaci'#243'n'
      FieldName = 'TS_FECHAMODIF'
    end
    object sdqConsultaTS_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'TS_USUBAJA'
    end
    object sdqConsultaTS_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'TS_FECHABAJA'
    end
    object sdqConsultaTS_IDFORMATOTELEGRAMA: TFloatField
      FieldName = 'TS_IDFORMATOTELEGRAMA'
    end
    object sdqConsultaMODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'MODULO'
      FixedChar = True
      Size = 22
    end
    object sdqConsultaLARGO: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LARGO'
    end
  end
end
