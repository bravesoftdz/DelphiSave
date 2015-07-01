inherited frmMotivosBajaPrest: TfrmMotivosBajaPrest
  Caption = 'Motivos de Baja'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'mp_codigo'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 100
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 113
    BorderStyle = bsSingle
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 77
    end
    object lblMotivo: TLabel [1]
      Left = 13
      Top = 47
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label1: TLabel [2]
      Left = 13
      Top = 18
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited btnAceptar: TButton
      Top = 83
    end
    inherited btnCancelar: TButton
      Top = 83
    end
    object edMotivo: TEdit
      Left = 53
      Top = 43
      Width = 393
      Height = 21
      MaxLength = 249
      TabOrder = 3
    end
    object edCodigo: TEdit
      Left = 53
      Top = 14
      Width = 46
      Height = 21
      MaxLength = 3
      TabOrder = 2
    end
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
