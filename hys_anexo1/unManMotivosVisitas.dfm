inherited frmManMotivosVisitas: TfrmManMotivosVisitas
  Caption = 'Mantenimiento Motivos Visitas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MO_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 261
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 87
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 99
    Width = 448
    Height = 99
    inherited BevelAbm: TBevel
      Top = 63
      Width = 440
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
      Left = 290
      Top = 69
    end
    inherited btnCancelar: TButton
      Left = 368
      Top = 69
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
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT mo_codigo, mo_descripcion, mo_fechabaja, mo_usubaja, mo_i' +
        'd'
      '  FROM art.pmo_motivos')
  end
end
