inherited frmMotivosCancelacionRevisionPrecios: TfrmMotivosCancelacionRevisionPrecios
  Left = 221
  Top = 161
  Caption = 'Motivos de Cancelaci'#243'n de Revisiones de Precio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MC_DETALLE'
        Title.Caption = 'Motivo'
        Width = 225
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MC_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 158
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 120
    Width = 336
    Height = 88
    Caption = 'Motivo de Cancelaci'#243'n'
    BorderStyle = bsDialog
    ActiveControl = edDetalle
    inherited BevelAbm: TBevel
      Top = 52
      Width = 328
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motivo'
    end
    inherited btnAceptar: TButton
      Left = 176
      Top = 58
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 256
      Top = 58
      Width = 72
    end
    object edDetalle: TEdit
      Left = 48
      Top = 8
      Width = 280
      Height = 21
      TabOrder = 2
      Text = 'edDetalle'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM amc_motivocancelsolicreafi')
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
