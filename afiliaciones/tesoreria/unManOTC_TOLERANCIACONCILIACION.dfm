inherited frmManOTC_TOLERANCIACONCILIACION: TfrmManOTC_TOLERANCIACONCILIACION
  Left = 347
  Top = 149
  Caption = 'Mantenimiento de Tolerancias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TC_MONTO'
        Title.Caption = 'Monto'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_PORCENTAJE'
        Title.Caption = 'Porcentaje'
        Width = 128
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 16
    Top = 96
    Width = 281
    Height = 97
    inherited BevelAbm: TBevel
      Top = 61
      Width = 273
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Monto'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 40
      Width = 51
      Height = 13
      Caption = 'Porcentaje'
    end
    inherited btnAceptar: TButton
      Left = 123
      Top = 67
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 201
      Top = 67
      TabOrder = 3
    end
    object edTC_MONTO: TCurrencyEdit
      Left = 154
      Top = 8
      Width = 121
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object edTC_PORCENTAJE: TCurrencyEdit
      Left = 154
      Top = 36
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 %;-,0.00 %'
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    Active = True
    SQL.Strings = (
      'SELECT TC_ID, TC_MONTO, TC_PORCENTAJE, TC_FECHABAJA'
      'FROM OTC_TOLERANCIACONCILIACION')
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
