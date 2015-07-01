inherited frmRelevResponsable: TfrmRelevResponsable
  Left = 452
  Top = 244
  Caption = 'Relevamiento Responsable'
  FormStyle = fsNormal
  Position = poScreenCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'RR_VALIDO'
        Title.Caption = 'V'#225'lido'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_CUITCUIL'
        Title.Caption = 'CUIT/CUIL'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_TITULO'
        Title.Caption = 'Titulo'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_MATRICULA'
        Title.Caption = 'Matricula'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_ENTIDAD'
        Title.Caption = 'Entidad'
        Width = 121
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 84
    Top = 124
    object lbCargo: TLabel [1]
      Left = 8
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Cargo :'
    end
    object lbRepresentacion: TLabel [2]
      Left = 8
      Top = 36
      Width = 78
      Height = 13
      Caption = 'Representaci'#243'n:'
    end
    object lbRelacion: TLabel [3]
      Left = 8
      Top = 64
      Width = 48
      Height = 13
      Caption = 'Relaci'#243'n :'
    end
    object lbCuitCuil: TLabel [4]
      Left = 8
      Top = 88
      Width = 60
      Height = 13
      Caption = 'CUIT/CUIL :'
    end
    object lbNombre: TLabel [5]
      Left = 8
      Top = 112
      Width = 43
      Height = 13
      Caption = 'Nombre :'
    end
    object lbTitulo: TLabel [6]
      Left = 8
      Top = 136
      Width = 43
      Height = 13
      Caption = 'T'#237'tulo :   '
    end
    object lbMatricula: TLabel [7]
      Left = 8
      Top = 160
      Width = 45
      Height = 13
      Caption = 'Matr'#237'cula'
    end
    object lbEntidad: TLabel [8]
      Left = 8
      Top = 180
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    inherited btnAceptar: TButton
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      TabOrder = 10
    end
    inline fraRepresentacion: TfraCodigoDescripcion
      Left = 92
      Top = 28
      Width = 365
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        365
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 300
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object mskCUIT: TMaskEdit
      Left = 92
      Top = 80
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 3
    end
    object edNombre: TEdit
      Left = 92
      Top = 104
      Width = 363
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edTitulo: TEdit
      Left = 92
      Top = 128
      Width = 363
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edMatricula: TEdit
      Left = 92
      Top = 152
      Width = 363
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edEntidad: TEdit
      Left = 92
      Top = 176
      Width = 363
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 7
    end
    object cbResponsableFormulario: TCheckBox
      Left = 7
      Top = 200
      Width = 133
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Responsable Formulario'
      TabOrder = 8
    end
    inline fraCargo: TfraCodigoDescripcion
      Left = 92
      Top = 4
      Width = 365
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        365
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 300
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    inline fraRelacion: TfraCodigoDescripcion
      Left = 92
      Top = 53
      Width = 365
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        365
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 300
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hrr_responsablerelev'
      ' WHERE rr_idrelevriesgolaboral = :idrelev')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idrelev'
        ParamType = ptInput
      end>
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
    Left = 80
    Top = 256
  end
end
