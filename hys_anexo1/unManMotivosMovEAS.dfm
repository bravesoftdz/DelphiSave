inherited frmManMotivosMovEAS: TfrmManMotivosMovEAS
  Left = 194
  Top = 158
  Width = 476
  Height = 347
  Caption = 'Mantenimiento de Motivos de Movs. de EAS'
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
    Columns = <
      item
        Expanded = False
        FieldName = 'MV_ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_DESCRIPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MV_TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 53
    Top = 132
    Width = 389
    Height = 145
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 109
      Width = 381
    end
    object Label2: TLabel [1]
      Left = 15
      Top = 60
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 228
      Top = 115
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 115
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 15
      Top = 78
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object rgTipo: TRadioGroup
      Left = 15
      Top = 15
      Width = 361
      Height = 40
      Caption = ' Tipo de Movimiento '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ingreso'
        'Egreso')
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   *'
      '    FROM hys.hmv_motivomoveas'
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
