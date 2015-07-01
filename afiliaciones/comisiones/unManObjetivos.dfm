inherited frmManObjetivos: TfrmManObjetivos
  Left = 128
  Top = 38
  Width = 651
  Height = 498
  Caption = 'Mantenimiento de Objetivos'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 643
  end
  inherited CoolBar: TCoolBar
    Width = 643
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 639
      end>
    inherited ToolBar: TToolBar
      Width = 626
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 643
    Height = 397
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'objetivo'
        Title.Caption = 'Objetivo'
        Width = 173
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'capitasdesde'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas Desde'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'capitashasta'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas Hasta'
        Width = 97
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'porccomisionprivado'
        Title.Alignment = taCenter
        Title.Caption = '% Comisi'#243'n Privado'
        Width = 106
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'porccomisionpublico'
        Title.Alignment = taCenter
        Title.Caption = '% Comisi'#243'n P'#250'blico'
        Width = 112
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'primadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Prima Desde'
        Width = 89
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'primahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Prima Hasta'
        Width = 84
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 116
    Width = 433
    Height = 270
    BorderStyle = bsDialog
    ActiveControl = edObjetivo
    inherited BevelAbm: TBevel
      Top = 234
      Width = 425
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 21
      Width = 42
      Height = 13
      Caption = 'Objetivo:'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 53
      Width = 132
      Height = 13
      Caption = 'Cantidad de C'#225'pitas Desde:'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 85
      Width = 129
      Height = 13
      Caption = 'Cantidad de C'#225'pitas Hasta:'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 117
      Width = 118
      Height = 13
      Caption = 'Comisi'#243'n Sector Privado:'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 149
      Width = 117
      Height = 13
      Caption = 'Comisi'#243'n Sector P'#250'blico:'
    end
    object Label6: TLabel [6]
      Left = 8
      Top = 179
      Width = 63
      Height = 13
      Caption = 'Prima Desde:'
    end
    object Label7: TLabel [7]
      Left = 8
      Top = 210
      Width = 60
      Height = 13
      Caption = 'Prima Hasta:'
    end
    inherited btnAceptar: TButton
      Left = 273
      Top = 240
      Width = 72
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 353
      Top = 240
      Width = 72
      TabOrder = 8
    end
    object edObjetivo: TEdit
      Left = 152
      Top = 16
      Width = 274
      Height = 21
      MaxLength = 60
      TabOrder = 0
    end
    object ceCapitasHasta: TCurrencyEdit
      Left = 152
      Top = 80
      Width = 96
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 99999999.000000000000000000
      TabOrder = 2
    end
    object ceComisionSectorPublico: TCurrencyEdit
      Left = 152
      Top = 144
      Width = 96
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 4
    end
    object ceComisionSectorPrivado: TCurrencyEdit
      Left = 152
      Top = 112
      Width = 96
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 3
    end
    object ceCapitasDesde: TCurrencyEdit
      Left = 152
      Top = 48
      Width = 96
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 99999999.000000000000000000
      TabOrder = 1
    end
    object cePrimaDesde: TCurrencyEdit
      Left = 152
      Top = 176
      Width = 96
      Height = 21
      AutoSize = False
      MaxLength = 15
      MaxValue = 99999999999.000000000000000000
      TabOrder = 5
    end
    object cePrimaHasta: TCurrencyEdit
      Left = 152
      Top = 207
      Width = 96
      Height = 21
      AutoSize = False
      MaxLength = 15
      MaxValue = 99999999999.000000000000000000
      TabOrder = 6
    end
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
