inherited frmManActividades: TfrmManActividades
  Caption = 'Mantenimiento Actividades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'Codigo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 304
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 124
    Height = 105
    inherited BevelAbm: TBevel
      Top = 69
    end
    object lbCodigo: TLabel [1]
      Left = 8
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Codigo:'
    end
    object lbDescripcion: TLabel [2]
      Left = 8
      Top = 39
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    inherited btnAceptar: TButton
      Top = 75
    end
    inherited btnCancelar: TButton
      Top = 75
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
      Width = 369
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT AC_CODIGO, AC_DESCRIPCION, AC_FECHABAJA'
      '  FROM pac_actcapacit')
  end
end
