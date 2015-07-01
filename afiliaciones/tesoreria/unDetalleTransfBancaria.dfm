inherited frmDetalleTransfBancaria: TfrmDetalleTransfBancaria
  Left = 122
  Top = 99
  Width = 600
  Height = 450
  Caption = 'Detalle de la Transferencia'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 7
  end
  inherited CoolBar: TCoolBar
    Top = 7
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 36
    Width = 592
    Height = 387
    Columns = <
      item
        Expanded = False
        FieldName = 'NROCHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero de Cheque'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDENPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Orden de Pago'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GIRO'
        Title.Caption = 'Giro'
        Width = 217
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 162
    Width = 201
    Height = 77
    ActiveControl = edGiro
    Constraints.MaxHeight = 77
    Constraints.MaxWidth = 201
    Constraints.MinHeight = 77
    Constraints.MinWidth = 201
    inherited BevelAbm: TBevel
      Top = 41
      Width = 193
    end
    object Label13: TLabel [1]
      Left = 7
      Top = 13
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Giro:'
    end
    inherited btnAceptar: TButton
      Left = 43
      Top = 47
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 121
      Top = 47
      TabOrder = 2
    end
    object edGiro: TPatternEdit
      Left = 34
      Top = 10
      Width = 159
      Height = 21
      MaxLength = 20
      TabOrder = 0
      Pattern = '0123456789'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CE_NUMERO NROCHEQUE, CE_ORDENPAGO ORDENPAGO, CE_GIRO GIRO'
      '  FROM RCE_CHEQUEEMITIDO'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    Left = 79
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
    Left = 110
    Top = 200
  end
end
