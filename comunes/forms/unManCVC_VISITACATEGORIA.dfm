inherited frmManCVC_VISITACATEGORIA: TfrmManCVC_VISITACATEGORIA
  Left = 174
  Top = 162
  Caption = 'Mantenimiento de Categor'#237'as de Visitas'
  ClientHeight = 418
  ClientWidth = 904
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  ExplicitWidth = 912
  ExplicitHeight = 448
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
    object lbVisitaFiltro: TLabel
      Left = 11
      Top = 4
      Width = 25
      Height = 13
      Caption = 'Visita'
    end
    object edVC_DESCRIPCION_FULL_LIKE: TEdit
      Left = 343
      Top = 23
      Width = 554
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    inline fraVC_IDVISITA: TfraCodDesc
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
        FieldCodigo = 'VS_ID'
        FieldDesc = 'VS_DESCRIPCION'
        FieldID = 'VS_ID'
        OrderBy = 'VS_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVS_VISITA'
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
    Height = 328
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'VC_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_DESCRIPCION'
        Title.Caption = 'Visita'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_DESCRIPCION'
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
        FieldName = 'VC_USUALTA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_FECHAALTA'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_USUMODIF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_FECHAMODIF'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_USUBAJA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_FECHABAJA'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 192
    Width = 521
    Height = 217
    ExplicitLeft = 192
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
      Width = 25
      Height = 13
      Caption = 'Visita'
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
    inline fraVisita: TfraCodDesc
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
        FieldCodigo = 'VS_ID'
        FieldDesc = 'VS_DESCRIPCION'
        FieldID = 'VS_ID'
        OrderBy = 'VS_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVS_VISITA'
        OnChange = fraVisitaPropiedadesChange
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
        FieldCodigo = 'VC_ID'
        FieldDesc = 'VC_DESCRIPCION'
        FieldID = 'VC_ID'
        OrderBy = 'VC_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVC_VISITACATEGORIA'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT cec1.*,'
      '               cVS_VISITA.*,'
      '               cec2.VC_descripcion catpadre'
      
        '          FROM COMERCIAL.CVC_VISITACATEGORIA cec1, comercial.cVS' +
        '_VISITA, COMERCIAL.CVC_VISITACATEGORIA cec2'
      '         WHERE cec1.VC_idvisita = VS_id'
      '           AND cec1.VC_idpadre = cec2.VC_id(+))'
      ' WHERE 1 = 1')
    object sdqConsultaVC_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'VC_ID'
      Required = True
    end
    object sdqConsultaVC_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'VC_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaCATPADRE: TStringField
      DisplayLabel = 'Categor'#237'a Padre'
      FieldName = 'CATPADRE'
      Size = 255
    end
    object sdqConsultaVC_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'VC_FECHAALTA'
      Required = True
    end
    object sdqConsultaVC_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'VC_USUALTA'
      Required = True
    end
    object sdqConsultaVC_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'VC_FECHAMODIF'
    end
    object sdqConsultaVC_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'VC_USUMODIF'
    end
    object sdqConsultaVC_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'VC_FECHABAJA'
    end
    object sdqConsultaVC_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'VC_USUBAJA'
    end
    object sdqConsultaVC_IDVISITA: TFloatField
      FieldName = 'VC_IDVISITA'
      Required = True
    end
    object sdqConsultaVS_ID: TFloatField
      FieldName = 'VS_ID'
      Required = True
    end
    object sdqConsultaVS_DESCRIPCION: TStringField
      DisplayLabel = 'Encuesta'
      FieldName = 'VS_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVS_USUALTA: TStringField
      FieldName = 'VS_USUALTA'
      Required = True
    end
    object sdqConsultaVS_FECHAALTA: TDateTimeField
      FieldName = 'VS_FECHAALTA'
      Required = True
    end
    object sdqConsultaVS_USUMODIF: TStringField
      FieldName = 'VS_USUMODIF'
    end
    object sdqConsultaVS_FECHAMODIF: TDateTimeField
      FieldName = 'VS_FECHAMODIF'
    end
    object sdqConsultaVS_USUBAJA: TStringField
      FieldName = 'VS_USUBAJA'
    end
    object sdqConsultaVS_FECHABAJA: TDateTimeField
      FieldName = 'VS_FECHABAJA'
    end
    object sdqConsultaVC_IDPADRE: TFloatField
      FieldName = 'VC_IDPADRE'
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
