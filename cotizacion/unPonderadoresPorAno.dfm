inherited frmPonderadoresPorAno: TfrmPonderadoresPorAno
  Left = 247
  Top = 189
  Width = 480
  Height = 296
  Caption = 'Ponderadores por A'#241'o'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 472
  end
  inherited CoolBar: TCoolBar
    Width = 472
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 468
      end>
    inherited ToolBar: TToolBar
      Width = 455
    end
  end
  inherited Grid: TArtDBGrid
    Width = 472
    Height = 195
    FooterBand = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PO_ANO'
        Title.Alignment = taCenter
        Title.Caption = 'A'#241'o'
        Width = 87
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PO_PONDERADOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador'
        Width = 123
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PO_IBNR'
        Title.Alignment = taRightJustify
        Title.Caption = 'IBNR'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAMODIF'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 119
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 204
    Top = 64
    Width = 168
    Height = 120
    Caption = 'Ponderador'
    BorderStyle = bsDialog
    ActiveControl = edAno
    inherited BevelAbm: TBevel
      Top = 84
      Width = 160
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 36
      Width = 55
      Height = 13
      Caption = 'Ponderador'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 60
      Width = 26
      Height = 13
      Caption = 'IBNR'
    end
    inherited btnAceptar: TButton
      Left = 8
      Top = 90
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 88
      Top = 90
      Width = 72
    end
    object edAno: TIntEdit
      Left = 72
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edPonderador: TCurrencyEdit
      Left = 72
      Top = 32
      Width = 88
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = ',0.0000;-,0.0000'
      TabOrder = 3
    end
    object edIBNR: TCurrencyEdit
      Left = 72
      Top = 56
      Width = 88
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = ',0.0000;-,0.0000'
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    Top = 172
  end
  inherited dsConsulta: TDataSource
    Top = 172
  end
  inherited SortDialog: TSortDialog
    Top = 200
  end
  inherited ExportDialog: TExportDialog
    Top = 200
  end
  inherited QueryPrint: TQueryPrint
    Top = 228
  end
  inherited Seguridad: TSeguridad
    Top = 144
  end
  inherited FormStorage: TFormStorage
    Top = 144
  end
  inherited PrintDialog: TPrintDialog
    Top = 228
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
    Top = 144
  end
  inherited FieldHider: TFieldHider
    Top = 172
  end
end
