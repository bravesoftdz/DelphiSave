inherited frmInvPrevision: TfrmInvPrevision
  Caption = 'Previsiones'
  ClientHeight = 370
  ClientWidth = 517
  Constraints.MinHeight = 400
  Constraints.MinWidth = 525
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 525
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 517
    Height = 1
    ExplicitWidth = 517
    ExplicitHeight = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 517
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 511
      end>
    inherited ToolBar: TToolBar
      Width = 502
      ExplicitWidth = 502
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object pnlBajas: TPanel
        Left = 370
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 517
    Height = 340
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porcentaje'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 82
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 161
    Top = 132
    Width = 182
    Height = 96
    Constraints.MaxHeight = 96
    Constraints.MaxWidth = 182
    Constraints.MinHeight = 96
    Constraints.MinWidth = 182
    ExplicitLeft = 161
    ExplicitTop = 132
    ExplicitWidth = 182
    ExplicitHeight = 96
    DesignSize = (
      182
      96)
    inherited BevelAbm: TBevel
      Top = 60
      Width = 174
      ExplicitTop = 60
      ExplicitWidth = 174
    end
    object Label12: TLabel [1]
      Left = 13
      Top = 13
      Width = 63
      Height = 13
      AutoSize = False
      Caption = 'Fecha'
    end
    object Label7: TLabel [2]
      Left = 13
      Top = 38
      Width = 63
      Height = 13
      AutoSize = False
      Caption = 'Porcentaje'
    end
    inherited btnAceptar: TButton
      Left = 24
      Top = 66
      TabOrder = 2
      ExplicitLeft = 24
      ExplicitTop = 66
    end
    inherited btnCancelar: TButton
      Left = 102
      Top = 66
      TabOrder = 3
      ExplicitLeft = 102
      ExplicitTop = 66
    end
    object edFechaAltaModif: TDateComboBox
      Left = 80
      Top = 9
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object edPorcAltaModif: TCurrencyEdit
      Left = 80
      Top = 35
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      TabOrder = 1
    end
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 113
    Top = 200
  end
end
