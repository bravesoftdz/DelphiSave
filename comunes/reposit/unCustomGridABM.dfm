inherited frmCustomGridABM: TfrmCustomGridABM
  Left = 214
  Top = 201
  Width = 629
  Height = 466
  Constraints.MinHeight = 240
  Constraints.MinWidth = 377
  OldCreateOrder = True
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 621
    Height = 45
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 45
    Width = 621
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 617
      end>
    inherited ToolBar: TToolBar
      Width = 604
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Dar de Baja (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 74
    Width = 621
    Height = 365
    OnGetCellParams = GridGetCellParams
  end
  object fpAbm: TFormPanel [3]
    Left = 100
    Top = 144
    Width = 461
    Height = 261
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      461
      261)
    object BevelAbm: TBevel
      Left = 4
      Top = 225
      Width = 453
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptar: TButton
      Left = 303
      Top = 231
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 381
      Top = 231
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inherited QueryPrint: TQueryPrint
    OnGetCellParams = QueryPrintGetCellParams
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
