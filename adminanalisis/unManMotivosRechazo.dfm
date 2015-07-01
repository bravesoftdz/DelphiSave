inherited frmManMotivosRechazo: TfrmManMotivosRechazo
  Left = 265
  Top = 108
  Width = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 526
    Height = 22
    Visible = True
    object dbiBusqueda: TDBIncrementalSearch
      Left = 0
      Top = 0
      Width = 525
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      MinSearchLength = 1
      KeyField = 'mr_id'
      ListField = 'mr_descripcion'
      ListSource = dsConsulta
    end
  end
  inherited CoolBar: TCoolBar
    Top = 22
    Width = 526
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 522
      end>
    inherited ToolBar: TToolBar
      Width = 509
    end
  end
  inherited Grid: TArtDBGrid
    Top = 51
    Width = 526
    Height = 388
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'MR_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 429
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'mr_cartadocumento'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Caption = 'Carta Doc.'
        Width = 60
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 48
    Top = 138
    Width = 440
    Height = 100
    Caption = 'Motivo'
    Constraints.MaxHeight = 100
    Constraints.MinHeight = 100
    Constraints.MinWidth = 205
    inherited BevelAbm: TBevel
      Top = 64
      Width = 432
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 17
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    inherited btnAceptar: TButton
      Left = 282
      Top = 70
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 70
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 13
      Width = 356
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 0
    end
    object cbCartaDoc: TCheckBox
      Left = 6
      Top = 42
      Width = 151
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Genera Carta Documento'
      TabOrder = 3
    end
    object cbRegeneraLote: TCheckBox
      Left = 186
      Top = 42
      Width = 163
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Causa Regeneración de lote'
      TabOrder = 4
      Visible = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hmr_motivorechazo'
      ' WHERE mr_tiporechazo = :tipo')
    ParamData = <
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
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
  end
end
