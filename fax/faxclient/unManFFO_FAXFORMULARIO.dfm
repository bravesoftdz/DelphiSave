inherited frmManFFO_FAXFORMULARIO: TfrmManFFO_FAXFORMULARIO
  Left = 262
  Top = 177
  Caption = 'Mantenimiento de Formularios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 617
      end>
    inherited ToolBar: TToolBar
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 19
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Height = 405
    Columns = <
      item
        Expanded = False
        FieldName = 'FO_ID'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 419
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 60
    Width = 462
    Height = 101
    inherited BevelAbm: TBevel
      Top = 65
      Width = 454
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    inherited btnAceptar: TButton
      Left = 304
      Top = 71
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 382
      Top = 71
      TabOrder = 3
    end
    object edFO_ID: TIntEdit
      Left = 72
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      MaxLength = 8
    end
    object edFO_DESCRIPCION: TEdit
      Left = 72
      Top = 36
      Width = 385
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT FO_ID, FO_DESCRIPCION, FO_FECHABAJA'
      'FROM FFO_FAXFORMULARIO'
      'ORDER BY FO_DESCRIPCION')
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
