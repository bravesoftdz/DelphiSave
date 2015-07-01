inherited frmManMedico: TfrmManMedico
  Caption = 'Mantenimiento M'#233'dicos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MD_ID'
        Title.Caption = 'ID'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_CUITCUIL'
        Title.Caption = 'CUIT/CUIL'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_APELLIDO'
        Title.Caption = 'Apellido'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 82
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 142
    inherited BevelAbm: TBevel
      Top = 106
    end
    object lbApellido: TLabel [1]
      Left = 8
      Top = 33
      Width = 40
      Height = 13
      Caption = 'Apellido:'
    end
    object lbNombre: TLabel [2]
      Left = 8
      Top = 57
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object lbDomicilio: TLabel [3]
      Left = 8
      Top = 81
      Width = 45
      Height = 13
      Caption = 'Domicilio:'
    end
    object lblCuitCuil: TLabel [4]
      Left = 9
      Top = 12
      Width = 43
      Height = 13
      Caption = 'Cuit/Cuil:'
    end
    inherited btnAceptar: TButton
      Top = 112
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 112
      TabOrder = 5
    end
    object edApellido: TEdit
      Left = 72
      Top = 30
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object edNombre: TEdit
      Left = 72
      Top = 54
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object edDomicilio: TEdit
      Left = 72
      Top = 78
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
    end
    object edCuitCuil: TMaskEdit
      Left = 75
      Top = 4
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edCuitCuilExit
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM legales.lmd_medico ')
  end
end
