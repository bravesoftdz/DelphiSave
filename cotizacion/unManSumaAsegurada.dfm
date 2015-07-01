inherited frmManSumaAsegurada: TfrmManSumaAsegurada
  Left = 201
  Top = 121
  Width = 792
  Height = 430
  Caption = 'Suma Asegurada'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 784
  end
  inherited CoolBar: TCoolBar
    Width = 784
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 780
      end>
    inherited ToolBar: TToolBar
      Width = 767
    end
  end
  inherited Grid: TArtDBGrid
    Width = 784
    Height = 329
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RS_DESDE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Desde'
        Width = 165
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RS_HASTA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Hasta'
        Width = 176
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RS_VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 153
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 112
    Width = 169
    Height = 125
    Caption = 'Zona Geogr'#225'fica'
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 89
      Width = 161
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 36
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 60
      Width = 30
      Height = 13
      Caption = 'Factor'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 12
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    inherited btnAceptar: TButton
      Left = 9
      Top = 95
      Width = 72
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 89
      Top = 95
      Width = 72
      TabOrder = 4
    end
    object edValorRC: TCurrencyEdit
      Left = 68
      Top = 56
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      MaxValue = 2147483647.000000000000000000
      MinValue = -100.000000000000000000
      TabOrder = 2
      ZeroEmpty = False
    end
    object edHasta: TCurrencyEdit
      Left = 68
      Top = 32
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0'
      MaxValue = 99999999.000000000000000000
      TabOrder = 1
      ZeroEmpty = False
    end
    object edDesde: TCurrencyEdit
      Left = 68
      Top = 8
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0'
      MaxValue = 99999999.000000000000000000
      TabOrder = 0
      ZeroEmpty = False
    end
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
