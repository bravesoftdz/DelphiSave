inherited frmManami_motivoingreso: TfrmManami_motivoingreso
  Top = 159
  Width = 687
  Height = 404
  Caption = 'Mantenimiento de Motivos de Eventos y Tareas de la AGENDA'
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 679
    Height = 57
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 679
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 675
      end>
    inherited ToolBar: TToolBar
      Width = 662
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 679
    Height = 284
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EV_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_DESCRIPCION'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_USUALTA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAALTA'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_USUMODIF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAMODIF'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_USUBAJA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHABAJA'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 160
    Width = 349
    Height = 105
    inherited BevelAbm: TBevel
      Top = 69
      Width = 341
    end
    object Label3: TLabel [1]
      Left = 12
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 194
      Top = 75
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 269
      Top = 75
      TabOrder = 2
    end
    object edEV_DESCRIPCION: TEdit
      Left = 8
      Top = 32
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM AGENDA.ami_motivoingreso'
      'WHERE 1=1')
    object sdqConsultaEV_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EV_ID'
      Required = True
    end
    object sdqConsultaEV_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'EV_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaEV_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'EV_FECHAALTA'
      Required = True
    end
    object sdqConsultaEV_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'EV_USUALTA'
      Required = True
    end
    object sdqConsultaEV_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'EV_FECHAMODIF'
    end
    object sdqConsultaEV_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'EV_USUMODIF'
    end
    object sdqConsultaEV_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'EV_FECHABAJA'
    end
    object sdqConsultaEV_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'EV_USUBAJA'
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
