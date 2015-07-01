inherited frmManIncumplimientos: TfrmManIncumplimientos
  Left = 335
  Top = 165
  Width = 556
  Caption = 'Mantenimiento de Incumplimientos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 548
    Height = 22
    Visible = True
    object dbiBusqueda: TDBIncrementalSearch
      Left = 0
      Top = 0
      Width = 547
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      MinSearchLength = 1
      KeyField = 'CN_ID'
      ListField = 'CN_DESCRIPCION'
      ListSource = dsConsulta
    end
  end
  inherited CoolBar: TCoolBar
    Top = 22
    Width = 548
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 544
      end>
    inherited ToolBar: TToolBar
      Width = 531
    end
  end
  inherited Grid: TArtDBGrid
    Top = 51
    Width = 548
    Height = 388
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'CN_ID'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CN_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 445
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 39
    Top = 111
    Width = 440
    Height = 75
    Constraints.MaxHeight = 75
    Constraints.MinHeight = 75
    Constraints.MinWidth = 205
    inherited BevelAbm: TBevel
      Top = 39
      Width = 432
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 14
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    inherited btnAceptar: TButton
      Left = 282
      Top = 45
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 45
      TabOrder = 2
    end
    object edDESCRIPCION: TEdit
      Left = 76
      Top = 10
      Width = 356
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.pcn_canincumplimientos')
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
