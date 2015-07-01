inherited frmUpdateTarifaCarta: TfrmUpdateTarifaCarta
  Left = 323
  Top = 197
  Width = 456
  Caption = 'Actualizaci'#243'n de las tarifas '
  Constraints.MinHeight = 344
  Constraints.MinWidth = 456
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 448
    Height = 23
    object chkDifieren: TCheckBox
      Left = 4
      Top = 2
      Width = 159
      Height = 17
      Caption = 'Mostrar Tarifas que difieren'
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 23
    Width = 448
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 444
      end>
    inherited ToolBar: TToolBar
      Width = 431
      inherited tbNuevo: TToolButton
        Hint = 'Actualizar con Valor Delphi (Ctrl+N)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Hint = 'Update (Ctrl+M)'
        Enabled = True
        Visible = True
        OnClick = tbModificarClick
      end
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbImprimir: TToolButton
        Left = 0
        Top = 30
      end
      inherited tbExportar: TToolButton
        Left = 23
        Top = 30
      end
      inherited tbEnviarMail: TToolButton
        Left = 46
        Top = 30
      end
      inherited ToolButton8: TToolButton
        Left = 69
        Top = 30
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 77
        Top = 30
      end
      inherited tbMaxRegistros: TToolButton
        Left = 100
        Top = 30
      end
      inherited ToolButton11: TToolButton
        Left = 123
        Top = 30
      end
      inherited tbSalir: TToolButton
        Left = 131
        Top = 30
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 52
    Width = 448
    Height = 265
    OnGetCellParams = GridGetCellParams
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM MLF.TMP_TARIFAS')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
end
