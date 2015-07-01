inherited frmListExamenesPreocupacionales: TfrmListExamenesPreocupacionales
  Left = 281
  Top = 129
  Width = 722
  Height = 453
  Caption = 'Examenes preocupacionales'
  OldCreateOrder = True
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 714
    Height = 154
    object GroupBox1: TGroupBox
      Left = 1
      Top = -1
      Width = 712
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Prestador '
      TabOrder = 0
      DesignSize = (
        712
        41)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 13
        Width = 705
        Height = 25
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 633
        end
        inherited lbTelefono: TLabel
          Left = 545
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 250
        end
        inherited cmbPrestador: TArtComboBox
          Width = 375
        end
        inherited edPresLocalidad: TEdit
          Width = 279
        end
        inherited edPresCPostal: TEdit
          Left = 650
        end
        inherited edPresTelefono: TEdit
          Left = 565
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 110
      Top = 40
      Width = 603
      Height = 72
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa / Establecimiento '
      TabOrder = 2
      DesignSize = (
        603
        72)
      object lbCUIT: TLabel
        Left = 10
        Top = 24
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 40
        Top = 20
        Width = 557
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
        DesignSize = (
          557
          21)
        inherited lbContrato: TLabel
          Left = 453
        end
        inherited mskCUIT: TMaskEdit
          Font.Name = 'Tahoma'
          ParentFont = False
        end
        inherited edContrato: TIntEdit
          Left = 500
          Font.Name = 'Tahoma'
          ParentFont = False
        end
        inherited cmbRSocial: TArtComboBox
          Width = 318
          Font.Name = 'Tahoma'
          ParentFont = False
        end
      end
      inline fraEstablecimiento: TfraEstablecimiento
        Left = 4
        Top = 45
        Width = 595
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          579
          22)
        inherited lbLocalidad: TLabel
          Left = 345
        end
        inherited lbCPostal: TLabel
          Left = 508
        end
        inherited lbProvincia: TLabel
          Left = 345
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 258
        end
        inherited edLocalidad: TEdit
          Left = 397
        end
        inherited edCPostal: TEdit
          Left = 532
        end
        inherited edDomicilio: TEdit
          Width = 288
        end
        inherited edProvincia: TEdit
          Left = 397
        end
        inherited sdqDatos: TSDQuery
          Top = 52
        end
        inherited dsDatos: TDataSource
          Top = 52
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 40
      Width = 109
      Height = 72
      Caption = 'Fecha Autorizaci'#243'n'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 34
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object dcFecAutorizDesde: TDateComboBox
        Left = 7
        Top = 14
        Width = 95
        Height = 21
        MaxDateCombo = dcFecAutorizHasta
        TabOrder = 0
      end
      object dcFecAutorizHasta: TDateComboBox
        Left = 7
        Top = 46
        Width = 95
        Height = 21
        MinDateCombo = dcFecAutorizDesde
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 112
      Width = 280
      Height = 41
      Caption = 'Tipo de Estudio del Prestador'
      TabOrder = 3
      inline fraTipoEstudioPrest: TfraCodigoDescripcion
        Left = 5
        Top = 13
        Width = 271
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 206
          OnDropDown = fraTipoEstudioPrestcmbDescripcionDropDown
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 283
      Top = 112
      Width = 430
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Lote, DNI y Nombre Empleado'
      TabOrder = 4
      DesignSize = (
        430
        41)
      inline fraEmpleado: TfraCodigoDescripcion
        Left = 56
        Top = 13
        Width = 371
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = fraEmpleadoExit
        inherited cmbDescripcion: TArtComboBox
          Left = 97
          Width = 273
          CharCase = ecUpperCase
        end
        inherited edCodigo: TPatternEdit
          Width = 94
        end
      end
      object edLote: TEdit
        Left = 5
        Top = 14
        Width = 49
        Height = 21
        TabOrder = 0
        OnExit = edLoteExit
        OnKeyDown = edLoteKeyDown
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 154
    Width = 714
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 710
      end>
    inherited ToolBar: TToolBar
      Width = 697
      inherited tbPropiedades: TToolButton
        Hint = 'Personas del Lote...'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 183
    Width = 714
    Height = 243
    Columns = <
      item
        Expanded = False
        FieldName = 'EXAMEN_PREOCUP'
        Title.Caption = 'Examen Preocup.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIG_DESDE'
        Title.Caption = 'Vig. Desde'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIG_HASTA'
        Title.Caption = 'Vig. Hasta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE'
        Title.Caption = 'Lote'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_PERSONAS'
        Title.Caption = 'Personas'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUT'
        Title.Caption = 'Aut.'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAAUT'
        Title.Caption = 'F.Autoriz.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_IDPRESTADOR'
        Title.Caption = 'Id. Prest.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCPRESTADOR'
        Title.Caption = 'Prestador'
        Width = 150
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
        Expanded = False
        FieldName = 'CUIT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROESTABLECI'
        Title.Caption = 'N'#176' Est.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTABLECIMIENTO'
        Title.Caption = 'Establecimiento'
        Width = 200
        Visible = True
      end>
  end
  object fpPersonasLote: TFormPanel [3]
    Left = 339
    Top = 235
    Width = 368
    Height = 293
    Caption = 'Personas del Lote'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpPersonasLoteBeforeShow
    DesignSize = (
      368
      293)
    object btnExportarPersonas: TSpeedButton
      Left = 201
      Top = 265
      Width = 74
      Height = 23
      Caption = 'Exportar'
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
        0000AAA88888888888888A000000A8888800000088880A777778888887777800
        0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
        FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
        7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
        FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
        FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
        9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
        F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
        8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
        FFF778016E02AA88888888888888AAA77777777777777A006701}
      NumGlyphs = 2
      OnClick = btnExportarPersonasClick
    end
    object Bevel1: TBevel
      Left = 280
      Top = 266
      Width = 2
      Height = 21
    end
    object Bevel2: TBevel
      Left = 5
      Top = 261
      Width = 359
      Height = 2
    end
    object btnCerrar: TButton
      Left = 287
      Top = 265
      Width = 76
      Height = 23
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    object dbgPersonasLote: TArtDBGrid
      Left = 3
      Top = 4
      Width = 362
      Height = 255
      DataSource = dsPersonasLote
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'PL_DNI'
          Title.Caption = 'DNI'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PL_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 200
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ep_id, ep_descripcion examen_preocup, ep_valor valor,  ep' +
        '_vigenciadesde Vig_desde, '
      
        '       ep_vigenciahasta Vig_hasta,  le_id Lote, le_cantidad Cant' +
        '_personas, le_autorizado Aut,  '
      
        '       le_fechaaut FechaAut, em_cuit CUIT, em_nombre Empresa,  e' +
        's_contrato Contrato, '
      
        '       es_nroestableci NroEstableci,  es_nombre Establecimiento,' +
        ' le_idempresa, le_establecimiento  '
      
        '  FROM aem_empresa, aco_contrato, aes_establecimiento,  comunes.' +
        'cle_lotesexamenes, '
      '       comunes.cep_examenespreocupacionales  '
      ' WHERE le_idexamen = ep_id  '
      '   AND le_establecimiento = es_id  '
      '   AND es_contrato = co_contrato  '
      '   AND le_idempresa = em_id  '
      '   AND le_fechabaja IS NULL  '
      '   AND ep_fechabaja IS NULL  '
      '   AND ep_idprestador = 11900')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Examen Preocup.'
        DataField = 'EXAMEN_PREOCUP'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'Valor'
        DataField = 'VALOR'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Vig.Desde'
        DataField = 'VIG_DESDE'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Vig.Hasta'
        DataField = 'VIG_HASTA'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'Lote'
        DataField = 'LOTE'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Personas'
        DataField = 'CANT_PERSONAS'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Aut.'
        DataField = 'AUT'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'F.Autoriz.'
        DataField = 'FECHAAUT'
        Width = 150
        MaxLength = 0
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Contrato'
        DataField = 'CONTRATO'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'N'#176'Est.'
        DataField = 'NROESTABLECI'
        Width = 100
        MaxLength = 0
      end
      item
        Title = 'Establecimiento'
        DataField = 'ESTABLECIMIENTO'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Id.Prest'
        DataField = 'Ep_IDPRESTADOR'
        Width = 80
        MaxLength = 0
      end
      item
        Title = 'Prestador'
        DataField = 'DESCPRESTADOR'
        Width = 300
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
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
  object sdqPersonasLote: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      '')
    Left = 232
    Top = 304
  end
  object dsPersonasLote: TDataSource
    DataSet = sdqPersonasLote
    Left = 260
    Top = 304
  end
  object ExportDialog_PersonasLote: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqPersonasLote
    Fields = <>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 288
    Top = 304
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16452
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
      end
      item
        Key = 16453
        LinkControl = tbEliminar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16464
      end>
    Left = 96
    Top = 272
  end
end
