inherited frmManEstadoErgonomia: TfrmManEstadoErgonomia
  Caption = 'Mantenimiento de Estado de Ergonomia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EE_ID'
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 100
    inherited BevelAbm: TBevel
      Top = 64
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
      Top = 70
    end
    inherited btnCancelar: TButton
      Top = 70
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
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hee_estadoergonomia')
  end
end
