inherited frmManCEC_ENCUESTACATEGORIA: TfrmManCEC_ENCUESTACATEGORIA
  Left = 174
  Top = 162
  Caption = 'Mantenimiento de Categor'#237'as de Encuestas'
  ClientHeight = 416
  ClientWidth = 904
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  ExplicitWidth = 912
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 904
    Height = 61
    Visible = True
    ExplicitWidth = 904
    ExplicitHeight = 61
    object lblDescripcionFiltro: TLabel
      Left = 343
      Top = 4
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lbEncuestaFiltro: TLabel
      Left = 11
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Encuesta'
    end
    object edEC_DESCRIPCION_FULL_LIKE: TEdit
      Left = 343
      Top = 23
      Width = 554
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    inline fraEC_IDENCUESTA: TfraCodDesc
      Left = 11
      Top = 21
      Width = 309
      Height = 23
      TabOrder = 0
      TabStop = True
      ExplicitLeft = 11
      ExplicitTop = 21
      ExplicitWidth = 309
      inherited cmbDescripcion: TArtComboBox
        Width = 244
        ExplicitWidth = 244
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'EN_ID'
        FieldDesc = 'EN_DESCRIPCION'
        FieldID = 'EN_ID'
        OrderBy = 'EN_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CEN_ENCUESTA'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 904
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 898
      end>
    ExplicitTop = 61
    ExplicitWidth = 904
    inherited ToolBar: TToolBar
      Left = 9
      Width = 891
      ExplicitLeft = 9
      ExplicitWidth = 891
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 90
    Width = 904
    Height = 326
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EC_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_DESCRIPCION'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_DESCRIPCION'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATPADRE'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUALTA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_FECHAALTA'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUMODIF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_FECHAMODIF'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUBAJA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_FECHABAJA'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 212
    Width = 521
    Height = 217
    ExplicitLeft = 212
    ExplicitWidth = 521
    ExplicitHeight = 217
    inherited BevelAbm: TBevel
      Top = 181
      Width = 513
      ExplicitTop = 69
      ExplicitWidth = 341
    end
    object lblDescripcion: TLabel [1]
      Left = 13
      Top = 63
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label1: TLabel [2]
      Left = 13
      Top = 11
      Width = 44
      Height = 13
      Caption = 'Encuesta'
    end
    object Label2: TLabel [3]
      Left = 12
      Top = 111
      Width = 123
      Height = 13
      Caption = 'Categor'#237'a Padre (si tiene)'
    end
    inherited btnAceptar: TButton
      Left = 366
      Top = 187
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 366
      ExplicitTop = 187
    end
    inherited btnCancelar: TButton
      Left = 441
      Top = 187
      TabOrder = 4
      ExplicitLeft = 441
      ExplicitTop = 187
    end
    object edDescripcion: TEdit
      Left = 12
      Top = 82
      Width = 498
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    inline fraEncuesta: TfraCodDesc
      Left = 12
      Top = 31
      Width = 501
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      TabStop = True
      ExplicitLeft = 12
      ExplicitTop = 31
      ExplicitWidth = 501
      inherited cmbDescripcion: TArtComboBox
        Width = 436
        ExplicitWidth = 436
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'EN_ID'
        FieldDesc = 'EN_DESCRIPCION'
        FieldID = 'EN_ID'
        OrderBy = 'EN_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CEN_ENCUESTA'
        OnChange = fraEncuestaPropiedadesChange
      end
    end
    inline fraCategoriaPadre: TfraCodDesc
      Left = 11
      Top = 130
      Width = 501
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      TabStop = True
      ExplicitLeft = 11
      ExplicitTop = 130
      ExplicitWidth = 501
      inherited cmbDescripcion: TArtComboBox
        Width = 436
        ExplicitWidth = 436
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'EC_ID'
        FieldDesc = 'EC_DESCRIPCION'
        FieldID = 'EC_ID'
        OrderBy = 'EC_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CEC_ENCUESTACATEGORIA'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT cec1.*,'
      '               cen_encuesta.*,'
      '               cec2.ec_descripcion catpadre'
      
        '          FROM comercial.cec_encuestacategoria cec1, comercial.c' +
        'en_encuesta, comercial.cec_encuestacategoria cec2'
      '         WHERE cec1.ec_idencuesta = en_id'
      '           AND cec1.ec_idpadre = cec2.ec_id(+))'
      ' WHERE 1 = 1')
    object sdqConsultaEC_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EC_ID'
      Required = True
    end
    object sdqConsultaEC_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'EC_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaCATPADRE: TStringField
      DisplayLabel = 'Categor'#237'a Padre'
      FieldName = 'CATPADRE'
      Size = 255
    end
    object sdqConsultaEC_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'EC_FECHAALTA'
      Required = True
    end
    object sdqConsultaEC_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'EC_USUALTA'
      Required = True
    end
    object sdqConsultaEC_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'EC_FECHAMODIF'
    end
    object sdqConsultaEC_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'EC_USUMODIF'
    end
    object sdqConsultaEC_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'EC_FECHABAJA'
    end
    object sdqConsultaEC_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'EC_USUBAJA'
    end
    object sdqConsultaEC_IDENCUESTA: TFloatField
      FieldName = 'EC_IDENCUESTA'
      Required = True
    end
    object sdqConsultaEN_ID: TFloatField
      FieldName = 'EN_ID'
      Required = True
    end
    object sdqConsultaEN_DESCRIPCION: TStringField
      DisplayLabel = 'Encuesta'
      FieldName = 'EN_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaEN_USUALTA: TStringField
      FieldName = 'EN_USUALTA'
      Required = True
    end
    object sdqConsultaEN_FECHAALTA: TDateTimeField
      FieldName = 'EN_FECHAALTA'
      Required = True
    end
    object sdqConsultaEN_USUMODIF: TStringField
      FieldName = 'EN_USUMODIF'
    end
    object sdqConsultaEN_FECHAMODIF: TDateTimeField
      FieldName = 'EN_FECHAMODIF'
    end
    object sdqConsultaEN_USUBAJA: TStringField
      FieldName = 'EN_USUBAJA'
    end
    object sdqConsultaEN_FECHABAJA: TDateTimeField
      FieldName = 'EN_FECHABAJA'
    end
    object sdqConsultaEC_IDPADRE: TFloatField
      FieldName = 'EC_IDPADRE'
    end
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
