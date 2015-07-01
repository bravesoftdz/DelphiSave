inherited frmManACR_CENTROREGIONAL: TfrmManACR_CENTROREGIONAL
  Left = 359
  Top = 199
  Width = 442
  Height = 386
  Caption = 'Mantenimiento de Centros Regionales'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 434
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 434
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 430
      end>
    inherited ToolBar: TToolBar
      Width = 417
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 434
    Height = 330
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CR_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_DESCRIPCION'
        Title.Caption = 'Nombre'
        Width = 349
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 46
    Top = 122
    Width = 372
    Height = 67
    Caption = 'Ingrese los datos'
    Constraints.MaxHeight = 67
    Constraints.MaxWidth = 372
    Constraints.MinHeight = 67
    Constraints.MinWidth = 372
    inherited BevelAbm: TBevel
      Top = 31
      Width = 364
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 110
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    inherited btnAceptar: TButton
      Left = 217
      Top = 37
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 289
      Top = 37
      Width = 72
      TabOrder = 3
    end
    object edCodigo: TEdit
      Left = 44
      Top = 4
      Width = 60
      Height = 21
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 151
      Top = 4
      Width = 214
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CR_ID, CR_CODIGO, CR_DESCRIPCION'
      '  FROM ACR_CENTROREGIONAL')
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
