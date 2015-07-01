inherited frmManEventos: TfrmManEventos
  Caption = 'Mantenimiento Eventos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TE_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_MUESTRACUIT'
        Title.Caption = 'Muestra para todos los establecimientos'
        Width = 198
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 453
    Height = 105
    inherited BevelAbm: TBevel
      Top = 69
      Width = 445
    end
    object lbDescripcion: TLabel [1]
      Left = 8
      Top = 15
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 295
      Top = 75
    end
    inherited btnCancelar: TButton
      Left = 373
      Top = 75
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 12
      Width = 369
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object cbMuestraEstableci: TCheckBox
      Left = 8
      Top = 43
      Width = 212
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Mostrar para todos los establecimientos'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT te_id, te_descripcion, te_muestracuit, te_fechabaja'
      '  FROM hys.hte_tipoevento'
      '  where not te_manual = '#39'N'#39)
  end
end
