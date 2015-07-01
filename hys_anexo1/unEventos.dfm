inherited frmEventos: TfrmEventos
  Left = 290
  Top = 184
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EE_FECHAEVENTO'
        Title.Caption = 'Fecha Evento'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_DESCRIPCION'
        Title.Caption = 'Tipo Evento'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_MUESTRACUIT'
        Title.Caption = 'Mostrar para todos los establecimientos'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_ESTABLECIMIENTO'
        Title.Caption = 'Estab.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 100
    Width = 425
    Height = 321
    inherited BevelAbm: TBevel
      Top = 285
      Width = 417
    end
    object Label3: TLabel [1]
      Left = 8
      Top = 41
      Width = 61
      Height = 13
      Caption = 'Tipo Evento:'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 15
      Width = 70
      Height = 13
      Caption = 'Fecha Evento:'
    end
    object Label2: TLabel [3]
      Left = 8
      Top = 195
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 94
      Width = 49
      Height = 13
      Caption = 'Preventor:'
    end
    object lblUsuario: TLabel [5]
      Left = 8
      Top = 122
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    inherited btnAceptar: TButton
      Left = 267
      Top = 291
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 345
      Top = 291
      TabOrder = 8
    end
    inline fraTipoEvento: TfraCodigoDescripcion
      Left = 83
      Top = 38
      Width = 332
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 267
        DataSource = nil
      end
    end
    object cbMuestraEstableci: TCheckBox
      Left = 181
      Top = 13
      Width = 212
      Height = 21
      Caption = 'Mostrar para todos los establecimientos'
      TabOrder = 1
    end
    object edFechaEvento: TDateComboBox
      Left = 84
      Top = 12
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object edObservacion: TRichEdit
      Left = 84
      Top = 145
      Width = 329
      Height = 113
      TabOrder = 6
    end
    inline fraUsuario: TfraUsuario
      Left = 84
      Top = 116
      Width = 330
      Height = 21
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 246
      end
    end
    object cbRegistrar: TCheckBox
      Left = 8
      Top = 65
      Width = 169
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Registrar Preventor o Usuario'
      TabOrder = 3
      OnClick = cbRegistrarClick
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 83
      Top = 84
      Width = 332
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 267
        CharCase = ecUpperCase
        OnDropDown = fraPreventorcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ee_observacion, ee_idtipoevento, te_descripcion, ee_fecha' +
        'evento,'
      
        '       se_nombre, it_nombre, ee_fechabaja, ee_muestracuit, ee_id' +
        ', te_manual,'
      
        '       te_muestracuit, ee_idpreventor, ee_usuario, ee_establecim' +
        'iento'
      '  FROM hys.hee_eventoempresa,'
      '       hys.hte_tipoevento,'
      '       art.pit_firmantes,'
      '       art.use_usuarios'
      ' WHERE ee_idtipoevento = te_id'
      '   AND ee_usuario = se_usuario(+)'
      '   AND ee_idpreventor = it_id(+)'
      '   AND ee_cuit = :cuit'
      '   AND ee_establecimiento = :estableci'
      '   AND ee_tipo = :tipo'
      '   AND ee_operativo = :operativo'
      'ORDER BY ee_fechaevento desc'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end>
  end
end
