inherited frmManRanking: TfrmManRanking
  Left = 464
  Top = 169
  Width = 476
  Height = 347
  Caption = 'Mantenimiento de Tipos de Ranking'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 468
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 468
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 464
      end>
    inherited ToolBar: TToolBar
      Width = 451
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 468
    Height = 290
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'RK_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RK_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 26
    Top = 93
    Width = 389
    Height = 109
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 73
      Width = 381
    end
    object Label2: TLabel [1]
      Left = 15
      Top = 18
      Width = 112
      Height = 13
      Caption = 'Descripci'#243'n del Ranking'
    end
    inherited btnAceptar: TButton
      Left = 228
      Top = 79
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 79
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 15
      Top = 36
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   *'
      '    FROM hys.hrk_ranking'
      '')
    Left = 16
    Top = 76
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 76
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 104
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 104
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 132
  end
  inherited Seguridad: TSeguridad
    Left = 15
    Top = 48
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 48
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 132
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
    Left = 72
    Top = 48
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 76
  end
end
