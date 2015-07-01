inherited frmManCVS_VISITA: TfrmManCVS_VISITA
  Left = 174
  Top = 162
  Caption = 'Mantenimiento de Visitas'
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
    object edVS_DESCRIPCION_FULL_LIKE: TEdit
      Left = 8
      Top = 30
      Width = 889
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
        FieldName = 'VS_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_DESCRIPCION'
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
        FieldName = 'VS_USUALTA'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_FECHAALTA'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_USUMODIF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_FECHAMODIF'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_USUBAJA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_FECHABAJA'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 175
    Top = 108
    Width = 606
    Height = 409
    ExplicitLeft = 175
    ExplicitTop = 108
    ExplicitWidth = 606
    ExplicitHeight = 409
    inherited BevelAbm: TBevel
      Top = 373
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
      Top = 211
      Width = 586
      Height = 142
      Version = '1.3.2.0'
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tarea '
      ParentBackground = False
      TabOrder = 4
      Ellipsis = False
    end
    inherited btnAceptar: TButton
      Left = 451
      Top = 379
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 451
      ExplicitTop = 379
    end
    inherited btnCancelar: TButton
      Left = 526
      Top = 379
      TabOrder = 2
      ExplicitLeft = 526
      ExplicitTop = 379
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
      Top = 137
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
      Left = 12
      Top = 225
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
        Left = 11
        Top = 31
        Width = 542
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 31
        ExplicitWidth = 542
        ExplicitHeight = 22
        DesignSize = (
          542
          22)
        inherited cmbDescripcion: TArtComboBox
          Left = 38
          Top = 0
          Width = 506
          ExplicitLeft = 38
          ExplicitTop = 0
          ExplicitWidth = 506
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
          Left = 124
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
          Width = 506
          ExplicitLeft = 38
          ExplicitWidth = 506
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
    object rgDestinatario: TAdvOfficeRadioGroup
      Left = 8
      Top = 64
      Width = 586
      Height = 68
      Version = '1.3.2.0'
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Destinatario '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 6
      TabStop = True
      OnClick = rgAccionClick
      Items.Strings = (
        'Empresa/Establecimiento/Contacto'
        'Entidad/Vendedor')
      Ellipsis = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT comercial.cvs_visita.*,'
      '       te_descripcion,'
      '       mi_descripcion'
      
        '  FROM comercial.cvs_visita, agenda.ate_tipoevento, agenda.ami_m' +
        'otivoingreso'
      ' WHERE 1 = 1'
      '   AND vs_idtipoevento = te_id(+)'
      '   AND vs_idmotivoingreso = mi_id(+)')
    object sdqConsultaVS_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'VS_ID'
      Required = True
    end
    object sdqConsultaVS_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'VS_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVS_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'VS_FECHAALTA'
      Required = True
    end
    object sdqConsultaVS_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'VS_USUALTA'
      Required = True
    end
    object sdqConsultaVS_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'VS_FECHAMODIF'
    end
    object sdqConsultaVS_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'VS_USUMODIF'
    end
    object sdqConsultaVS_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'VS_FECHABAJA'
    end
    object sdqConsultaVS_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'VS_USUBAJA'
    end
    object sdqConsultaVS_IDTIPOEVENTO: TFloatField
      FieldName = 'VS_IDTIPOEVENTO'
    end
    object sdqConsultaVS_IDMOTIVOINGRESO: TFloatField
      FieldName = 'VS_IDMOTIVOINGRESO'
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
    object sdqConsultaVS_DESTINATARIO: TFloatField
      FieldName = 'VS_DESTINATARIO'
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
