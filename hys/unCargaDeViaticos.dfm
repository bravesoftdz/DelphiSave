inherited frmCargaDeViaticos: TfrmCargaDeViaticos
  Left = 250
  Top = 210
  Width = 780
  Height = 581
  Caption = 'Carga de Viaticos'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
  end
  inherited CoolBar: TCoolBar
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
    end
  end
  inherited Grid: TArtDBGrid
    Width = 772
    Height = 480
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CV_NUMEROVIATICO'
        Title.Caption = 'N'#250'mero de Vi'#225'tico'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHADESDE'
        Title.Caption = 'Fecha Desde'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAHASTA'
        Title.Caption = 'Fecha Hasta'
        Width = 134
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 60
    Top = 152
    Width = 708
    Height = 463
    inherited BevelAbm: TBevel
      Top = 427
      Width = 700
    end
    inherited btnAceptar: TButton
      Left = 550
      Top = 433
    end
    inherited btnCancelar: TButton
      Left = 628
      Top = 433
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 708
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lbNroViatico: TLabel
        Left = 8
        Top = 16
        Width = 86
        Height = 13
        Caption = 'N'#250'mero de Viatico'
      end
      object lbFechaViatico: TLabel
        Left = 164
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Fecha Viatico'
      end
      object lbHasta: TLabel
        Left = 332
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object lbFechaSeleccionada: TLabel
        Left = 488
        Top = 16
        Width = 98
        Height = 13
        Caption = 'Fecha Seleccionada:'
      end
      object edNumerodeViatico: TEdit
        Left = 100
        Top = 12
        Width = 57
        Height = 21
        TabOrder = 0
      end
      object edFechaViaticoDesde: TDateComboBox
        Left = 232
        Top = 12
        Width = 93
        Height = 21
        TabOrder = 1
        OnChange = edFechaViaticoDesdeChange
      end
      object edFechaViaticoHasta: TDateComboBox
        Left = 368
        Top = 12
        Width = 93
        Height = 21
        TabOrder = 2
      end
      object edFechaSeleccionada: TDateComboBox
        Left = 588
        Top = 12
        Width = 93
        Height = 21
        TabOrder = 3
        OnChange = edFechaSeleccionadaChange
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 35
      Width = 708
      Height = 169
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        708
        169)
      object lbCUITAfiliada: TLabel
        Left = 136
        Top = 16
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lbEstablecimiento: TLabel
        Left = 136
        Top = 48
        Width = 74
        Height = 13
        Caption = 'Establecimiento'
      end
      object lbCUITNoAfiliada: TLabel
        Left = 136
        Top = 80
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaAfiliada: TfraEmpresa
        Left = 212
        Top = 12
        Width = 487
        Height = 21
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
          Left = 383
        end
        inherited edContrato: TIntEdit
          Left = 430
        end
        inherited cmbRSocial: TArtComboBox
          Width = 248
        end
      end
      inline fraEstablecimientoAfiliada: TfraEstablecimiento
        Left = 212
        Top = 44
        Width = 379
        Height = 23
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 314
        end
      end
      object rgLugarDestino: TRadioGroup
        Left = 8
        Top = 4
        Width = 125
        Height = 104
        Caption = ' Lugar Destino '
        Items.Strings = (
          'Empresa Afiliada'
          'Empresa No Afiliada'
          'Domicilio Particular'
          'Hotel')
        TabOrder = 2
        OnClick = rgLugarDestinoClick
      end
      object edCUITNoAfiliada: TMaskEdit
        Left = 212
        Top = 76
        Width = 81
        Height = 21
        Hint = 'CUIT de la Empresa'
        EditMask = '99-99999999-9;0;'
        MaxLength = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      inline fraDomicilioGISVisita: TfraDomicilioGIS
        Left = 8
        Top = 108
        Width = 698
        Height = 59
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        inherited lbNro: TLabel
          Left = 521
        end
        inherited lbPiso: TLabel
          Left = 585
        end
        inherited lbDto: TLabel
          Left = 637
        end
        inherited lbProvincia: TLabel
          Left = 541
        end
        inherited cmbCalle: TArtComboBox
          Width = 370
        end
        inherited edNumero: TEdit
          Left = 537
        end
        inherited edPiso: TEdit
          Left = 609
        end
        inherited edDto: TEdit
          Left = 661
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 266
        end
        inherited edProvincia: TEdit
          Left = 589
        end
        inherited btnBuscar: TButton
          Left = 237
        end
        inherited btnBuscarGIS: TAdvGlowButton
          Left = 425
        end
        inherited btnMapaGIS: TAdvGlowButton
          Left = 471
        end
      end
      object btnAgregar: TAdvGlowButton
        Left = 344
        Top = 72
        Width = 85
        Height = 27
        Hint = 'Agrega una Visita Nueva'
        Anchors = [akTop, akRight]
        Caption = 'Agregar'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnAgregarClick
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object cbSinViatico: TCheckBox
        Left = 596
        Top = 44
        Width = 100
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sin Viatico'
        TabOrder = 6
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 204
      Width = 708
      Height = 184
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object ArtDBGrid1: TArtDBGrid
        Left = 0
        Top = 0
        Width = 708
        Height = 184
        Align = alClient
        DataSource = dsVisitas
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GridDblClick
        OnKeyDown = GridKeyDown
        IniStorage = FormStorage
        OnGetCellParams = GridGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'VV_FECHA'
            Title.Caption = 'Fecha'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_CUIT'
            Title.Caption = 'CUIT'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_ESTABLECI'
            Title.Caption = 'Nro. Establecimiento'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_LOCALIDAD'
            Title.Caption = 'Localidad'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_CALLE'
            Title.Caption = 'Calle'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_NUMERO'
            Title.Caption = 'N'#250'mero'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_PISO'
            Title.Caption = 'Piso'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_DEPARTAMENTO'
            Title.Caption = 'Departamento'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_CPOSTAL'
            Title.Caption = 'Cod. Postal'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_CPOSTALA'
            Title.Caption = 'CPA'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_PROVINCIA'
            Title.Caption = 'Provincia'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_ORDEN'
            Title.Caption = 'Orden'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VV_SINVIATICO'
            Title.Caption = 'Sin Vi'#225'tico'
            Width = 91
            Visible = True
          end>
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT cv_id, cv_idpreventor, cv_idestado, cv_usualta, cv_fechaa' +
        'lta,'
      
        '       cv_usumodif, cv_fechamodif, cv_usubaja, cv_fechabaja, cv_' +
        'numeroviatico,'
      '       cv_ultfechaimpresion, cv_fechaviatico AS fechadesde,'
      '       cv_fechaviatico + 4 AS fechahasta, ev_descripcion'
      '  FROM hys.hev_estadoviatico, hys.hcv_cabeceraviaticos a'
      ' WHERE cv_idpreventor = :preventor AND cv_idestado = ev_id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'preventor'
        ParamType = ptInput
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object cdVisitas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVisitas'
    Left = 300
    Top = 8
    object cdVisitasVV_ID: TFloatField
      FieldName = 'VV_ID'
      Required = True
    end
    object cdVisitasVV_IDCABECERAVIATICO: TFloatField
      FieldName = 'VV_IDCABECERAVIATICO'
    end
    object cdVisitasVV_CUIT: TStringField
      FieldName = 'VV_CUIT'
      Size = 11
    end
    object cdVisitasVV_ESTABLECI: TFloatField
      FieldName = 'VV_ESTABLECI'
    end
    object cdVisitasVV_LOCALIDAD: TStringField
      FieldName = 'VV_LOCALIDAD'
      Size = 60
    end
    object cdVisitasVV_CALLE: TStringField
      FieldName = 'VV_CALLE'
      Size = 60
    end
    object cdVisitasVV_NUMERO: TStringField
      FieldName = 'VV_NUMERO'
    end
    object cdVisitasVV_PISO: TStringField
      FieldName = 'VV_PISO'
    end
    object cdVisitasVV_DEPARTAMENTO: TStringField
      FieldName = 'VV_DEPARTAMENTO'
    end
    object cdVisitasVV_CPOSTAL: TStringField
      FieldName = 'VV_CPOSTAL'
      Size = 5
    end
    object cdVisitasVV_CPOSTALA: TStringField
      FieldName = 'VV_CPOSTALA'
      Size = 8
    end
    object cdVisitasVV_PROVINCIA: TStringField
      FieldName = 'VV_PROVINCIA'
      Size = 2
    end
    object cdVisitasVV_EMPRESAAFILIADA: TStringField
      FieldName = 'VV_EMPRESAAFILIADA'
      Size = 1
    end
    object cdVisitasVV_ORDEN: TFloatField
      FieldName = 'VV_ORDEN'
    end
    object cdVisitasVV_SINVIATICO: TStringField
      FieldName = 'VV_SINVIATICO'
      Size = 1
    end
    object cdVisitasVV_FECHA: TDateTimeField
      FieldName = 'VV_FECHA'
    end
    object cdVisitasVV_USUALTA: TStringField
      FieldName = 'VV_USUALTA'
    end
    object cdVisitasVV_FECHAALTA: TDateTimeField
      FieldName = 'VV_FECHAALTA'
    end
    object cdVisitasVV_USUMODIF: TStringField
      FieldName = 'VV_USUMODIF'
    end
    object cdVisitasVV_FECHAMODIF: TDateTimeField
      FieldName = 'VV_FECHAMODIF'
    end
    object cdVisitasVV_USUBAJA: TStringField
      FieldName = 'VV_USUBAJA'
    end
    object cdVisitasVV_FECHABAJA: TDateTimeField
      FieldName = 'VV_FECHABAJA'
    end
  end
  object dspVisitas: TDataSetProvider
    DataSet = sdqVisitas
    Left = 328
    Top = 8
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM hys.hvv_visitaviatico')
    UpdateObject = sduVisita
    Left = 356
    Top = 8
    object sdqVisitasVV_ID: TFloatField
      FieldName = 'VV_ID'
      Required = True
    end
    object sdqVisitasVV_IDCABECERAVIATICO: TFloatField
      FieldName = 'VV_IDCABECERAVIATICO'
    end
    object sdqVisitasVV_CUIT: TStringField
      FieldName = 'VV_CUIT'
      Size = 11
    end
    object sdqVisitasVV_ESTABLECI: TFloatField
      FieldName = 'VV_ESTABLECI'
    end
    object sdqVisitasVV_LOCALIDAD: TStringField
      FieldName = 'VV_LOCALIDAD'
      Size = 60
    end
    object sdqVisitasVV_CALLE: TStringField
      FieldName = 'VV_CALLE'
      Size = 60
    end
    object sdqVisitasVV_NUMERO: TStringField
      FieldName = 'VV_NUMERO'
    end
    object sdqVisitasVV_PISO: TStringField
      FieldName = 'VV_PISO'
    end
    object sdqVisitasVV_DEPARTAMENTO: TStringField
      FieldName = 'VV_DEPARTAMENTO'
    end
    object sdqVisitasVV_CPOSTAL: TStringField
      FieldName = 'VV_CPOSTAL'
      Size = 5
    end
    object sdqVisitasVV_CPOSTALA: TStringField
      FieldName = 'VV_CPOSTALA'
      Size = 8
    end
    object sdqVisitasVV_PROVINCIA: TStringField
      FieldName = 'VV_PROVINCIA'
      Size = 2
    end
    object sdqVisitasVV_EMPRESAAFILIADA: TStringField
      FieldName = 'VV_EMPRESAAFILIADA'
      Size = 1
    end
    object sdqVisitasVV_ORDEN: TFloatField
      FieldName = 'VV_ORDEN'
    end
    object sdqVisitasVV_SINVIATICO: TStringField
      FieldName = 'VV_SINVIATICO'
      Size = 1
    end
    object sdqVisitasVV_FECHA: TDateTimeField
      FieldName = 'VV_FECHA'
    end
    object sdqVisitasVV_USUALTA: TStringField
      FieldName = 'VV_USUALTA'
    end
    object sdqVisitasVV_FECHAALTA: TDateTimeField
      FieldName = 'VV_FECHAALTA'
    end
    object sdqVisitasVV_USUMODIF: TStringField
      FieldName = 'VV_USUMODIF'
    end
    object sdqVisitasVV_FECHAMODIF: TDateTimeField
      FieldName = 'VV_FECHAMODIF'
    end
    object sdqVisitasVV_USUBAJA: TStringField
      FieldName = 'VV_USUBAJA'
    end
    object sdqVisitasVV_FECHABAJA: TDateTimeField
      FieldName = 'VV_FECHABAJA'
    end
  end
  object dsVisitas: TDataSource
    DataSet = cdVisitas
    Left = 272
    Top = 8
  end
  object sduVisita: TSDUpdateSQL
    ModifySQL.Strings = (
      'update hys.hvv_visitaviatico'
      'set'
      '  VV_DEPARTAMENTO = :VV_DEPARTAMENTO,'
      '  VV_CPOSTAL = :VV_CPOSTAL,'
      '  VV_CPOSTALA = :VV_CPOSTALA,'
      '  VV_PROVINCIA = :VV_PROVINCIA,'
      '  VV_EMPRESAAFILIADA = :VV_EMPRESAAFILIADA,'
      '  VV_ORDEN = :VV_ORDEN,'
      '  VV_SINVIATICO = :VV_SINVIATICO,'
      '  VV_FECHA = :VV_FECHA,'
      '  VV_USUALTA = :VV_USUALTA,'
      '  VV_FECHAALTA = :VV_FECHAALTA,'
      '  VV_USUMODIF = :VV_USUMODIF,'
      '  VV_FECHAMODIF = :VV_FECHAMODIF,'
      '  VV_USUBAJA = :VV_USUBAJA,'
      '  VV_FECHABAJA = :VV_FECHABAJA,'
      '  VV_ID = :VV_ID,'
      '  VV_IDCABECERAVIATICO = :VV_IDCABECERAVIATICO,'
      '  VV_CUIT = :VV_CUIT,'
      '  VV_ESTABLECI = :VV_ESTABLECI,'
      '  VV_LOCALIDAD = :VV_LOCALIDAD,'
      '  VV_CALLE = :VV_CALLE,'
      '  VV_NUMERO = :VV_NUMERO,'
      '  VV_PISO = :VV_PISO'
      'where'
      '  VV_ID = :OLD_VV_ID')
    InsertSQL.Strings = (
      'insert into hys.hvv_visitaviatico'
      
        '  (VV_DEPARTAMENTO, VV_CPOSTAL, VV_CPOSTALA, VV_PROVINCIA, VV_EM' +
        'PRESAAFILIADA, VV_ORDEN, VV_SINVIATICO, VV_FECHA, VV_USUALTA, VV' +
        '_FECHAALTA, VV_USUMODIF, VV_FECHAMODIF, VV_USUBAJA, VV_FECHABAJA' +
        ', VV_ID, VV_IDCABECERAVIATICO, VV_CUIT, VV_ESTABLECI, VV_LOCALID' +
        'AD, VV_CALLE, VV_NUMERO, VV_PISO)'
      'values'
      
        '  (:VV_DEPARTAMENTO, :VV_CPOSTAL, :VV_CPOSTALA, :VV_PROVINCIA, :' +
        'VV_EMPRESAAFILIADA, :VV_ORDEN, :VV_SINVIATICO, :VV_FECHA, :VV_US' +
        'UALTA, :VV_FECHAALTA, :VV_USUMODIF, :VV_FECHAMODIF, :VV_USUBAJA,' +
        ' :VV_FECHABAJA, :VV_ID, :VV_IDCABECERAVIATICO, :VV_CUIT, :VV_EST' +
        'ABLECI, :VV_LOCALIDAD, :VV_CALLE, :VV_NUMERO, :VV_PISO)')
    DeleteSQL.Strings = (
      'delete from hys.hvv_visitaviatico'
      'where'
      '  VV_ID = :OLD_VV_ID')
    Left = 384
    Top = 8
  end
end
