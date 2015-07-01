inherited frmManTipoGasto: TfrmManTipoGasto
  Caption = 'Tipo de Gasto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TG_ID'
        Title.Caption = 'C'#243'digo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 270
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 445
    Height = 97
    inherited BevelAbm: TBevel
      Top = 61
      Width = 437
    end
    object lbDescripcion: TLabel [1]
      Left = 8
      Top = 39
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lbCodigo: TLabel [2]
      Left = 8
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Codigo:'
    end
    inherited btnAceptar: TButton
      Left = 287
      Top = 67
    end
    inherited btnCancelar: TButton
      Left = 365
      Top = 67
    end
    object edCodigo: TEdit
      Left = 72
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 36
      Width = 367
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT tg_id, tg_descripcion, '
      '       tg_fechabaja'
      '  FROM legales.ltg_tipogasto ')
  end
end
