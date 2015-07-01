inherited frmManARS_RESPUESTA: TfrmManARS_RESPUESTA
  Left = 174
  Top = 162
  Width = 687
  Height = 404
  Caption = 'Mantenimiento de Respuestas de la AGENDA'
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
    Height = 291
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'rs_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_DESCRIPCION'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_USUALTA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_FECHAALTA'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_USUMODIF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_FECHAMODIF'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_USUBAJA'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_FECHABAJA'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 160
    Width = 349
    Height = 105
    Position = poScreenCenter
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
    object edrs_DESCRIPCION: TEdit
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
      'FROM AGENDA.ARS_RESPUESTA'
      'WHERE 1=1')
    object sdqConsultars_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'rs_ID'
      Required = True
    end
    object sdqConsultars_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'rs_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultars_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'rs_FECHAALTA'
      Required = True
    end
    object sdqConsultars_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'rs_USUALTA'
      Required = True
    end
    object sdqConsultars_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'rs_FECHAMODIF'
    end
    object sdqConsultars_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'rs_USUMODIF'
    end
    object sdqConsultars_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'rs_FECHABAJA'
    end
    object sdqConsultars_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'rs_USUBAJA'
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
