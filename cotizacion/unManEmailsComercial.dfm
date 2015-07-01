inherited frmManEmailsComercial: TfrmManEmailsComercial
  Left = 327
  Top = 191
  Caption = 'Mantenimiento de E-mails de Comercial'
  PixelsPerInch = 96
  TextHeight = 13
  object sGrid: TStringGrid [0]
    Left = 0
    Top = 74
    Width = 621
    Height = 365
    Align = alClient
    ColCount = 1
    DefaultColWidth = 320
    DefaultRowHeight = 17
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColMoving, goEditing, goRowSelect, goThumbTracking]
    TabOrder = 4
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbOrdenar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Left = 144
    Top = 296
    Align = alNone
    Visible = False
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Width = 464
    Height = 89
    ActiveControl = edEmail
    inherited BevelAbm: TBevel
      Top = 53
      Width = 456
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 21
      Width = 31
      Height = 13
      Caption = 'E-mail:'
    end
    inherited btnAceptar: TButton
      Left = 307
      Top = 59
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 387
      Top = 59
      Width = 72
    end
    object edEmail: TEdit
      Left = 56
      Top = 16
      Width = 240
      Height = 21
      TabOrder = 2
      Text = 'edEmail'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TB_ESPECIAL1'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'DIREL'#39
      '   AND TB_CODIGO = '#39'04'#39
      '')
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
