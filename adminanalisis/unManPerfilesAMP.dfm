inherited frmManPerfilesAMP: TfrmManPerfilesAMP
  Left = 265
  Top = 108
  Caption = 'Perfiles de Estudios AMP'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 22
    Visible = True
    object dbiBusqueda: TDBIncrementalSearch
      Left = 0
      Top = 0
      Width = 620
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      MinSearchLength = 1
      KeyField = 'pa_id'
      ListField = 'pa_descripcion'
      ListSource = dsConsulta
    end
  end
  inherited CoolBar: TCoolBar
    Top = 22
  end
  inherited Grid: TArtDBGrid
    Top = 51
    Height = 388
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'pa_ID'
        Title.Caption = 'C'#243'digo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pa_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 126
    Top = 195
    Width = 440
    Height = 105
    Constraints.MaxHeight = 105
    Constraints.MinHeight = 105
    Constraints.MinWidth = 205
    inherited BevelAbm: TBevel
      Top = 69
      Width = 432
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 44
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 282
      Top = 75
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 75
      TabOrder = 3
    end
    object edCodigo: TPatternEdit
      Left = 76
      Top = 12
      Width = 93
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clInactiveBorder
      MaxLength = 15
      ReadOnly = True
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 40
      Width = 356
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hpa_perfilamp')
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
