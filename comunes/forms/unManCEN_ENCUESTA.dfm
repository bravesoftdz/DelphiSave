inherited frmManCEN_ENCUESTA: TfrmManCEN_ENCUESTA
  Left = 174
  Top = 162
  Caption = 'Mantenimiento de Encuestas'
  ClientHeight = 547
  ClientWidth = 905
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  ExplicitWidth = 913
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 905
    Height = 61
    Visible = True
    ExplicitWidth = 905
    ExplicitHeight = 61
    object lblDescripcionFiltro: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object edEN_DESCRIPCION_FULL_LIKE: TEdit
      Left = 8
      Top = 30
      Width = 555
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 905
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 899
      end>
    ExplicitTop = 61
    ExplicitWidth = 905
    inherited ToolBar: TToolBar
      Left = 9
      Width = 892
      ExplicitLeft = 9
      ExplicitWidth = 892
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 90
    Width = 905
    Height = 457
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EN_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_DESCRIPCION'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_DESCRIPCION'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MI_DESCRIPCION'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_USUALTA'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_FECHAALTA'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_USUMODIF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_FECHAMODIF'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_USUBAJA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_FECHABAJA'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 167
    Top = 124
    Width = 606
    Height = 333
    Constraints.MaxHeight = 333
    Constraints.MinHeight = 333
    ExplicitLeft = 167
    ExplicitTop = 124
    ExplicitWidth = 606
    ExplicitHeight = 333
    inherited BevelAbm: TBevel
      Top = 297
      Width = 598
      ExplicitTop = 69
      ExplicitWidth = 341
    end
    object lblDescripcion: TLabel [1]
      Left = 12
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object gbTarea: TAdvOfficeRadioGroup [2]
      Left = 8
      Top = 139
      Width = 586
      Height = 146
      Version = '1.3.2.0'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Tarea '
      ParentBackground = False
      TabOrder = 4
      Ellipsis = False
    end
    inherited btnAceptar: TButton
      Left = 451
      Top = 303
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 451
      ExplicitTop = 303
    end
    inherited btnCancelar: TButton
      Left = 526
      Top = 303
      TabOrder = 2
      ExplicitLeft = 526
      ExplicitTop = 303
    end
    object edDescripcion: TEdit
      Left = 8
      Top = 32
      Width = 586
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object rgAccion: TAdvOfficeRadioGroup
      Left = 8
      Top = 65
      Width = 586
      Height = 68
      Version = '1.3.2.0'
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Generar tarea en el SIC '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 3
      TabStop = True
      OnClick = rgAccionClick
      Items.Strings = (
        'Si'
        'No')
      Ellipsis = False
    end
    object pnlTarea: TPanel
      Left = 20
      Top = 153
      Width = 553
      Height = 118
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        553
        118)
      object lblMotivoIngreso: TLabel
        Left = 12
        Top = 64
        Width = 85
        Height = 13
        Caption = 'Motivo de ingreso'
      end
      object lblTarea: TLabel
        Left = 12
        Top = 15
        Width = 192
        Height = 13
        Caption = 'Seleccione la nueva tarea que se crear'#225
        Transparent = True
      end
      inline fraNuevaTarea: TfraCodDesc
        Left = 10
        Top = 31
        Width = 545
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 10
        ExplicitTop = 31
        ExplicitWidth = 545
        ExplicitHeight = 22
        DesignSize = (
          545
          22)
        inherited cmbDescripcion: TArtComboBox
          Left = 38
          Top = 0
          Width = 495
          ExplicitLeft = 38
          ExplicitTop = 0
          ExplicitWidth = 495
        end
        inherited edCodigo: TPatternEdit
          Top = 0
          Width = 36
          ExplicitTop = 0
          ExplicitWidth = 36
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND te_tipoevento = '#39'T'#39' '
          FieldBaja = 'te_fechabaja'
          FieldCodigo = 'te_id'
          FieldDesc = 'te_descripcion'
          FieldID = 'te_id'
          FullLikeComparison = True
          OrderBy = 'te_descripcion'
          ShowBajas = True
          TableName = 'agenda.ate_tipoevento'
          OnChange = fraNuevaTareaPropiedadesChange
          Left = 152
        end
      end
      inline fraTC_IDMOTIVOINGRESO: TfraCodDesc
        Left = 10
        Top = 80
        Width = 548
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 10
        ExplicitTop = 80
        ExplicitWidth = 548
        inherited cmbDescripcion: TArtComboBox
          Left = 38
          Width = 495
          ExplicitLeft = 38
          ExplicitWidth = 495
        end
        inherited edCodigo: TPatternEdit
          Width = 36
          ExplicitWidth = 36
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'BAJA'
          FieldCodigo = 'ID'
          FieldDesc = 'DESCRIPCION'
          FieldID = 'ID'
          OrderBy = 'DESCRIPCION'
          TableName = 'tabla'
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT comercial.cen_encuesta.*,'
      '       te_descripcion,'
      '       mi_descripcion'
      
        '  FROM comercial.cen_encuesta, agenda.ate_tipoevento, agenda.ami' +
        '_motivoingreso'
      ' WHERE 1 = 1'
      '   AND en_idtipoevento = te_id(+)'
      '   AND en_idmotivoingreso = mi_id(+)')
    object sdqConsultaEN_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EN_ID'
      Required = True
    end
    object sdqConsultaEN_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'EN_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaEN_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'EN_FECHAALTA'
      Required = True
    end
    object sdqConsultaEN_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'EN_USUALTA'
      Required = True
    end
    object sdqConsultaEN_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'EN_FECHAMODIF'
    end
    object sdqConsultaEN_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'EN_USUMODIF'
    end
    object sdqConsultaEN_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'EN_FECHABAJA'
    end
    object sdqConsultaEN_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'EN_USUBAJA'
    end
    object sdqConsultaEN_IDTIPOEVENTO: TFloatField
      FieldName = 'EN_IDTIPOEVENTO'
    end
    object sdqConsultaEN_IDMOTIVOINGRESO: TFloatField
      FieldName = 'EN_IDMOTIVOINGRESO'
    end
    object sdqConsultaTE_DESCRIPCION: TStringField
      DisplayLabel = 'Tipo de evento'
      FieldName = 'TE_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaMI_DESCRIPCION: TStringField
      DisplayLabel = 'Motivo de ingreso'
      FieldName = 'MI_DESCRIPCION'
      Size = 255
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
  object sdqMotivosDeIngreso: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT id,'
      '       codigo,'
      '       descripcion,'
      '       baja,'
      '       idtipoevento'
      '  FROM (SELECT mi_id id,'
      '               mi_id codigo,'
      '               mi_descripcion descripcion,'
      '               ti_idtipoevento idtipoevento,'
      '               mi_fechabaja baja'
      
        '          FROM agenda.ami_motivoingreso, agenda.ati_tipoeventomo' +
        'tivoingreso'
      '         WHERE ti_idmotivoingreso = mi_id'
      '           AND ti_fechabaja IS NULL) tabla'
      ' WHERE 1 = 1')
    Left = 52
    Top = 336
  end
end
