inherited frmManFirmanteAfi: TfrmManFirmanteAfi
  Left = 257
  Top = 118
  Width = 508
  Height = 484
  Caption = 'En Car'#225'cter de'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 500
    Height = 13
    Visible = True
  end
  inherited CoolBar: TCoolBar
    Top = 13
    Width = 500
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 496
      end>
    inherited ToolBar: TToolBar
      Width = 483
    end
  end
  inherited Grid: TArtDBGrid
    Top = 42
    Width = 500
    Height = 415
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'CF_ID'
        Title.Caption = 'C'#243'digo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CF_CARACTER'
        Title.Caption = 'En car'#225'cter de'
        Width = 345
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 136
    Width = 360
    Height = 113
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 77
      Width = 352
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 20
      Width = 70
      Height = 13
      Caption = 'En car'#225'cter de'
    end
    inherited btnAceptar: TButton
      Left = 202
      Top = 83
      Width = 72
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 280
      Top = 83
      Width = 72
      TabOrder = 2
    end
    object edFirmante: TEdit
      Left = 16
      Top = 36
      Width = 329
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
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
