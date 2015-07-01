inherited frmManSituacionesCheques: TfrmManSituacionesCheques
  Left = 108
  Top = 134
  Width = 615
  Height = 400
  Caption = 'Situaciones de Cheques'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 607
  end
  inherited CoolBar: TCoolBar
    Width = 607
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 603
      end>
    inherited ToolBar: TToolBar
      Width = 590
    end
  end
  inherited Grid: TArtDBGrid
    Width = 607
    Height = 339
  end
  inherited fpAbm: TFormPanel
    Left = 172
    Top = 108
    Width = 409
    Height = 168
    BorderStyle = bsSingle
    Constraints.MaxHeight = 0
    Constraints.MinHeight = 0
    Constraints.MinWidth = 0
    DesignSize = (
      409
      168)
    inherited BevelAbm: TBevel
      Top = 133
      Width = 401
    end
    inherited lbEspecial2: TLabel
      Top = 151
      Visible = False
    end
    inherited btnAceptar: TButton
      Left = 254
      Top = 138
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 329
      Top = 138
      TabOrder = 6
    end
    inherited edCodigo: TPatternEdit
      Width = 88
    end
    inherited edDescripcion: TEdit
      Width = 324
    end
    inherited edEspecial: TEdit
      Left = 64
      Top = 124
      Width = 137
      Color = clRed
      TabOrder = 4
      Visible = False
    end
    inline fraEspecial: TfraCtbTablas [10]
      Left = 72
      Top = 64
      Width = 326
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        326
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 273
      end
    end
    inherited edEspecial2: TEdit
      Left = 63
      Top = 147
      Width = 137
      Color = clRed
      TabOrder = 7
      Visible = False
    end
    object rgSectorAsignado: TRadioGroup
      Left = 72
      Top = 89
      Width = 239
      Height = 38
      Caption = 'Sector Asignado'
      Columns = 3
      Items.Strings = (
        'BAPRO'
        'Tesorer'#237'a'
        'Delegaci'#243'n')
      TabOrder = 3
    end
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
      end
      item
        DataField = 'TB_DESCRIPCION'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end>
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
