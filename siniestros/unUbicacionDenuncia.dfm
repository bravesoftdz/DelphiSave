inherited frmUbicacionDenuncia: TfrmUbicacionDenuncia
  Left = 305
  Top = 186
  Width = 760
  Height = 274
  AutoSize = True
  BorderIcons = []
  Caption = 'Localizaci'#243'n del accidente'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object gbUbicacion: TJvgGroupBox [0]
    Left = 0
    Top = 60
    Width = 752
    Height = 187
    Align = alTop
    Caption = ' Ubicaci'#243'n de la denuncia '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = True
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    DesignSize = (
      752
      187)
    FullHeight = 157
    object Label29: TLabel
      Left = 11
      Top = 126
      Width = 131
      Height = 26
      Alignment = taRightJustify
      Caption = 'Colocar  el n'#250'mero de CUIT'#13#10'si es distinto del empleador'
    end
    object lbValidacionCUIT: TLabel
      Left = 236
      Top = 132
      Width = 134
      Height = 13
      Caption = 'Esto se cambia en ejecuci'#243'n'
    end
    object Label1: TLabel
      Left = 97
      Top = 154
      Width = 44
      Height = 26
      Hint = 
        'Es tenido en cuenta para la liquidaci'#243'n de las asignaciones fami' +
        'liares'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Localidad'#13#10'/ Partido'
      ParentShowHint = False
      ShowHint = True
    end
    object rgEstablecimiento: TDBRadioGroup
      Left = 8
      Top = 24
      Width = 737
      Height = 98
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Domicilio de ocurrencia del accidente '
      DataField = 'UBICACION_DENUNCIA'
      DataSource = dsDatos
      Items.Strings = (
        'Est. &Propio'
        '&Otro Lugar'
        'Sin &Datos'
        'Est. &Terceros')
      TabOrder = 0
      Values.Strings = (
        'P'
        'O'
        'S'
        'T')
      OnChange = rgEstablecimientoChange
      OnClick = rgEstablecimientoClick
    end
    object pnlEstablecimientoExtra: TPanel
      Left = 101
      Top = 40
      Width = 639
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      DesignSize = (
        639
        23)
      object Label18: TLabel
        Left = 221
        Top = 5
        Width = 47
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Tel'#233'fonos'
      end
      object Label26: TLabel
        Left = 383
        Top = 5
        Width = 19
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Pa'#237's'
      end
      object Label28: TLabel
        Left = 13
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object edUD_TELEFONOS: TDBEdit
        Left = 307
        Top = 1
        Width = 69
        Height = 21
        Anchors = [akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'UD_TELEFONOS'
        DataSource = dsDatos
        TabOrder = 2
      end
      object edUD_CODAREATELEFONOS: TDBEdit
        Left = 271
        Top = 1
        Width = 33
        Height = 21
        Anchors = [akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'UD_CODAREATELEFONOS'
        DataSource = dsDatos
        TabOrder = 1
      end
      inline fraUD_PAIS: TfraCPA_PAISES
        Left = 407
        Top = 0
        Width = 231
        Height = 23
        Anchors = [akTop, akRight]
        TabOrder = 3
        TabStop = True
        DesignSize = (
          231
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 168
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
        inherited Propiedades: TPropiedadesFrame
          DataField = sdqDatosUD_PAIS
          DataSource = dsDatos
          OrderBy = 'PA_DESCRIPCION'
          Left = 92
        end
      end
      object edUD_NOMBRE: TDBEdit
        Left = 53
        Top = 1
        Width = 163
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'UD_NOMBRE'
        DataSource = dsDatos
        TabOrder = 0
      end
    end
    inline fraDomicilioEstablecimiento: TfraDomicilio
      Left = 108
      Top = 67
      Width = 631
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        631
        47)
      inherited lbCalle: TLabel
        Left = 17
      end
      inherited lbNro: TLabel
        Left = 416
      end
      inherited lbPiso: TLabel
        Left = 488
        Width = 19
      end
      inherited lbDto: TLabel
        Left = 564
        Width = 21
      end
      inherited lbCPostal: TLabel
        Top = 30
        Width = 40
      end
      inherited lbCPA: TLabel
        Left = 102
        Top = 30
        Width = 20
      end
      inherited lbLocalidad: TLabel
        Left = 210
        Top = 30
        Width = 44
      end
      inherited lbProvincia: TLabel
        Left = 469
        Top = 30
        Width = 43
      end
      inherited cmbCalle: TArtComboBox
        Left = 46
        Width = 331
      end
      inherited edNumero: TEdit
        Left = 438
      end
      inherited edPiso: TEdit
        Left = 514
      end
      inherited edDto: TEdit
        Left = 586
        Width = 44
      end
      inherited edCPostal: TIntEdit
        Left = 46
        Top = 26
        OnChange = fraDomicilioEstablecimientoedCPostalChange
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 262
        Top = 26
        Width = 199
      end
      inherited edProvincia: TEdit
        Left = 518
        Top = 26
        Width = 112
      end
      inherited edCPA: TPatternEdit
        Left = 128
        Top = 26
      end
      inherited btnBuscar: TButton
        Left = 381
      end
    end
    object edUD_CUITOCURRE: TJvDBMaskEdit
      Left = 148
      Top = 130
      Width = 82
      Height = 21
      Hint = 'CUIT o Clave del Prestador'
      BevelWidth = 0
      CharCase = ecUpperCase
      DataField = 'UD_CUITOCURRE'
      DataSource = dsDatos
      TabOrder = 3
      OnChange = edUD_CUITOCURREChange
    end
    object btnCancelar: TButton
      Left = 670
      Top = 155
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object btnAceptar: TButton
      Left = 594
      Top = 155
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnAceptarClick
    end
    inline fraUD_SECUENCIA_PARTIDOLOCALIDAD: TfraCCO_PARTIDOS_CODIGOSPOSTALES
      Left = 147
      Top = 157
      Width = 302
      Height = 23
      TabOrder = 4
      inherited edCodigo: TPatternEdit [0]
      end
      inherited cmbDescripcion: TArtComboBox [1]
        Width = 237
        DataSource = nil
      end
      inherited Propiedades: TPropiedadesFrame
        DataField = sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD
        DataSource = dsDatos
        Left = 88
        Top = 65532
      end
    end
    object btnRecuperar: TButton
      Left = 8
      Top = 156
      Width = 77
      Height = 25
      Hint = 'Recuperar datos del siniestro original'
      Caption = 'Recuperar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnRecuperarClick
    end
    object fpEstableciTemporales: TFormPanel
      Left = 405
      Top = -158
      Width = 456
      Height = 193
      Caption = 'Establecimientos Temporales del Empleador'
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpEstableciTemporalesBeforeShow
      DesignSize = (
        456
        193)
      object Bevel18: TBevel
        Left = 3
        Top = 162
        Width = 449
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
      end
      object lblTitulo: TLabel
        Left = 20
        Top = 5
        Width = 6
        Height = 13
        Caption = '  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnAceptarEstTemp: TBitBtn
        Left = 374
        Top = 166
        Width = 77
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 0
        OnClick = btnAceptarEstTempClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object dbgEstableciTemporales: TArtDBGrid
        Left = 3
        Top = 3
        Width = 450
        Height = 157
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsEstableciTemporales
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgEstableciTemporalesDblClick
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
        Columns = <
          item
            Expanded = False
            FieldName = 'ET_NROESTABLECI'
            Title.Caption = 'Nro. Estab.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_NOMBRE'
            Title.Caption = 'Nombre'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_CUIT_TEMPORAL'
            Title.Caption = 'CUIT Temporal'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_CALLE'
            Title.Caption = 'Calle'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_NUMERO'
            Title.Caption = 'Nro.'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_PISO'
            Title.Caption = 'Piso'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_DEPARTAMENTO'
            Title.Caption = 'Depto.'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_LOCALIDAD'
            Title.Caption = 'Localidad'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ET_CPOSTAL'
            Title.Caption = 'Cod.Postal'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVINCIA'
            Title.Caption = 'Provincia'
            Width = 75
            Visible = True
          end>
      end
    end
  end
  object pnlFiltros: TPanel [1]
    Left = 0
    Top = 0
    Width = 752
    Height = 60
    Hint = 'pnlFiltros'
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object lbTitulo: TLabel
      Left = 16
      Top = 12
      Width = 138
      Height = 13
      Caption = 'Ubicaci'#243'n de la denuncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSubtitulo: TLabel
      Left = 28
      Top = 32
      Width = 261
      Height = 13
      Caption = 'Esta es la ubicaci'#243'n de la denuncia de este expediente'
    end
  end
  inherited FormStorage: TFormStorage
    Top = 252
  end
  inherited XPMenu: TXPMenu
    Top = 252
  end
  inherited ilByN: TImageList
    Top = 260
  end
  inherited ilColor: TImageList
    Top = 260
  end
  inherited IconosXP: TImageList
    Top = 260
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      'SELECT UD_TIPO_ESTAB AS UBICACION_DENUNCIA,'
      
        '       UD_ESTABLECIMIENTO, UD_NOMBRE, UD_CALLE, UD_NUMERO, UD_PI' +
        'SO, UD_DEPARTAMENTO,'
      
        '       UD_LOCALIDAD, UD_CPOSTAL, UD_CPOSTALA, UD_PROVINCIA, UD_T' +
        'ELEFONOS, UD_PAIS,'
      
        '       UD_CODAREATELEFONOS, UD_CUITOCURRE, PV_DESCRIPCION PROVIN' +
        'CIA, UD_IDEXPEDIENTE,'
      
        '       UD_SECUENCIA_PARTIDOLOCALIDAD, UD_USUALTA, UD_FECHAALTA, ' +
        'UD_USUMODIF, UD_FECHAMODIF,'
      
        '       EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, UD_ESTABLECIMIENTO_TE' +
        'MP'
      
        '  FROM ART.CPV_PROVINCIAS, ART.SEX_EXPEDIENTES, SIN.SUD_UBICACIO' +
        'NDENUNCIA'
      ' WHERE UD_IDEXPEDIENTE = :UD_IDEXPEDIENTE'
      '   AND EX_ID = UD_IDEXPEDIENTE'
      '   AND PV_CODIGO (+) = UD_PROVINCIA')
    UpdateObject = sduDatos
    Left = 492
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UD_IDEXPEDIENTE'
        ParamType = ptInput
      end>
    object sdqDatosUBICACION_DENUNCIA: TStringField
      FieldName = 'UBICACION_DENUNCIA'
      Size = 1
    end
    object sdqDatosUD_ESTABLECIMIENTO: TFloatField
      FieldName = 'UD_ESTABLECIMIENTO'
    end
    object sdqDatosUD_NOMBRE: TStringField
      FieldName = 'UD_NOMBRE'
      Size = 100
    end
    object sdqDatosUD_CALLE: TStringField
      FieldName = 'UD_CALLE'
      Size = 60
    end
    object sdqDatosUD_NUMERO: TStringField
      FieldName = 'UD_NUMERO'
    end
    object sdqDatosUD_PISO: TStringField
      FieldName = 'UD_PISO'
    end
    object sdqDatosUD_DEPARTAMENTO: TStringField
      FieldName = 'UD_DEPARTAMENTO'
    end
    object sdqDatosUD_LOCALIDAD: TStringField
      FieldName = 'UD_LOCALIDAD'
      Size = 60
    end
    object sdqDatosUD_CPOSTAL: TStringField
      FieldName = 'UD_CPOSTAL'
      Size = 5
    end
    object sdqDatosUD_CPOSTALA: TStringField
      FieldName = 'UD_CPOSTALA'
      Size = 8
    end
    object sdqDatosUD_PROVINCIA: TStringField
      FieldName = 'UD_PROVINCIA'
      Size = 2
    end
    object sdqDatosUD_TELEFONOS: TStringField
      FieldName = 'UD_TELEFONOS'
      Size = 60
    end
    object sdqDatosUD_PAIS: TStringField
      FieldName = 'UD_PAIS'
      Size = 3
    end
    object sdqDatosUD_CODAREATELEFONOS: TStringField
      FieldName = 'UD_CODAREATELEFONOS'
      Size = 5
    end
    object sdqDatosUD_CUITOCURRE: TStringField
      FieldName = 'UD_CUITOCURRE'
      Size = 11
    end
    object sdqDatosPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object sdqDatosUD_IDEXPEDIENTE: TFloatField
      FieldName = 'UD_IDEXPEDIENTE'
      Required = True
    end
    object sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD: TFloatField
      FieldName = 'UD_SECUENCIA_PARTIDOLOCALIDAD'
    end
    object sdqDatosUD_USUALTA: TStringField
      FieldName = 'UD_USUALTA'
    end
    object sdqDatosUD_FECHAALTA: TDateTimeField
      FieldName = 'UD_FECHAALTA'
    end
    object sdqDatosUD_USUMODIF: TStringField
      FieldName = 'UD_USUMODIF'
    end
    object sdqDatosUD_FECHAMODIF: TDateTimeField
      FieldName = 'UD_FECHAMODIF'
    end
    object sdqDatosEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
    end
    object sdqDatosEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
    end
    object sdqDatosEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
    end
    object sdqDatosUD_ESTABLECIMIENTO_TEMP: TFloatField
      FieldName = 'UD_ESTABLECIMIENTO_TEMP'
    end
  end
  object sduDatos: TSDUpdateSQL
    ModifySQL.Strings = (
      'update SIN.SUD_UBICACIONDENUNCIA'
      'set'
      '  UD_IDEXPEDIENTE = :UD_IDEXPEDIENTE,'
      '  UD_ESTABLECIMIENTO = :UD_ESTABLECIMIENTO,'
      '  UD_NOMBRE = :UD_NOMBRE,'
      '  UD_CALLE = :UD_CALLE,'
      '  UD_NUMERO = :UD_NUMERO,'
      '  UD_PISO = :UD_PISO,'
      '  UD_DEPARTAMENTO = :UD_DEPARTAMENTO,'
      '  UD_LOCALIDAD = :UD_LOCALIDAD,'
      '  UD_CPOSTAL = :UD_CPOSTAL,'
      '  UD_CPOSTALA = :UD_CPOSTALA,'
      '  UD_PROVINCIA = :UD_PROVINCIA,'
      '  UD_TELEFONOS = :UD_TELEFONOS,'
      '  UD_PAIS = :UD_PAIS,'
      '  UD_CODAREATELEFONOS = :UD_CODAREATELEFONOS,'
      '  UD_CUITOCURRE = :UD_CUITOCURRE,'
      '  UD_USUMODIF = :UD_USUMODIF,'
      '  UD_FECHAMODIF = :UD_FECHAMODIF,'
      
        '  UD_SECUENCIA_PARTIDOLOCALIDAD = :UD_SECUENCIA_PARTIDOLOCALIDAD' +
        ','
      '  UD_TIPO_ESTAB = :UBICACION_DENUNCIA,'
      '  UD_ESTABLECIMIENTO_TEMP = :UD_ESTABLECIMIENTO_TEMP'
      'where'
      '  UD_IDEXPEDIENTE = :OLD_UD_IDEXPEDIENTE')
    InsertSQL.Strings = (
      'insert into SIN.SUD_UBICACIONDENUNCIA'
      
        '  (UD_IDEXPEDIENTE, UD_ESTABLECIMIENTO, UD_NOMBRE, UD_CALLE, UD_' +
        'NUMERO, UD_PISO,'
      
        '   UD_DEPARTAMENTO, UD_LOCALIDAD, UD_CPOSTAL, UD_CPOSTALA, UD_PR' +
        'OVINCIA, UD_TELEFONOS, UD_PAIS,'
      
        '   UD_CODAREATELEFONOS, UD_CUITOCURRE, UD_USUALTA, UD_FECHAALTA,' +
        ' UD_SECUENCIA_PARTIDOLOCALIDAD,'
      '   UD_TIPO_ESTAB, UD_ESTABLECIMIENTO_TEMP)'
      'values'
      
        '  (:UD_IDEXPEDIENTE, :UD_ESTABLECIMIENTO, :UD_NOMBRE, :UD_CALLE,' +
        ' :UD_NUMERO, :UD_PISO,'
      
        '   :UD_DEPARTAMENTO, :UD_LOCALIDAD, :UD_CPOSTAL, :UD_CPOSTALA, :' +
        'UD_PROVINCIA, :UD_TELEFONOS, :UD_PAIS,'
      
        '   :UD_CODAREATELEFONOS, :UD_CUITOCURRE, :UD_USUALTA, :UD_FECHAA' +
        'LTA, :UD_SECUENCIA_PARTIDOLOCALIDAD,'
      '   :UBICACION_DENUNCIA, :UD_ESTABLECIMIENTO_TEMP)')
    DeleteSQL.Strings = (
      'delete from SIN.SUD_UBICACIONDENUNCIA'
      'where'
      '  UD_IDEXPEDIENTE = :OLD_UD_IDEXPEDIENTE')
    Left = 548
    Top = 16
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    OnUpdateData = dsDatosUpdateData
    Left = 520
    Top = 16
  end
  object sdqEstableciTemporales: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT et_id, et_nroestableci, et_nombre, et_cuit_temporal, et_c' +
        'alle, et_numero, '
      
        '       et_piso, et_departamento, et_localidad, et_cpostal, et_pr' +
        'ovincia, '
      
        '       pv_descripcion provincia, et_cpostala, et_telefonos, et_c' +
        'uit_temporal '
      '  FROM sin.set_establecimiento_temporal, art.cpv_provincias '
      ' WHERE et_provincia = pv_codigo '
      '   AND et_cuit = (SELECT ex_cuit FROM art.sex_expedientes '
      '                   WHERE ex_id = :idexp)')
    Left = 504
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexp'
        ParamType = ptInput
      end>
  end
  object dsEstableciTemporales: TDataSource
    DataSet = sdqEstableciTemporales
    Left = 532
    Top = 200
  end
end
