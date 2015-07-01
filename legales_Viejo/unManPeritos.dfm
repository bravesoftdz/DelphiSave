inherited FrmManPeritos: TFrmManPeritos
  Left = 1056
  Top = 299
  Width = 749
  Height = 463
  Caption = 'Mantenimiento de Peritos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 741
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 741
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 737
      end>
    inherited ToolBar: TToolBar
      Width = 724
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 741
    Height = 377
    Columns = <
      item
        Expanded = False
        FieldName = 'PE_ID'
        Title.Caption = 'C'#243'd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_DESCRIPCION'
        Title.Caption = 'Tipo'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_NOMBRE'
        Title.Caption = 'Nombre Completo'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_APELLIDO'
        Title.Caption = 'Apellido'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_NOMBREINDIVIDUAL'
        Title.Caption = 'Nombre'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_FECHAALTA'
        Title.Caption = 'F.Alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_USUALTA'
        Title.Caption = 'Usuario Alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_FECHAMODIF'
        Title.Caption = 'F.Modificaci'#243'n'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_USUMODIF'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_PARTEOFICIO'
        Title.Caption = 'Pate/Oficio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CUITCUIL'
        Title.Caption = 'Cuit/Cuil'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_IDTIPOPERITO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PE_DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 112
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 64
    Width = 397
    Height = 280
    inherited BevelAbm: TBevel
      Top = 244
      Width = 389
    end
    object lblDescripcion: TLabel [1]
      Left = 10
      Top = 95
      Width = 87
      Height = 13
      Caption = 'Nombre Completo:'
    end
    object lblTipoPerito: TLabel [2]
      Left = 10
      Top = 42
      Width = 54
      Height = 13
      Caption = 'Tipo Perito:'
    end
    object lblDesignacion: TLabel [3]
      Left = 10
      Top = 67
      Width = 59
      Height = 13
      Caption = 'Designacion'
    end
    object lblCuitCuil: TLabel [4]
      Left = 10
      Top = 19
      Width = 43
      Height = 13
      Caption = 'Cuit/Cuil:'
    end
    object Label1: TLabel [5]
      Left = 10
      Top = 169
      Width = 48
      Height = 13
      Caption = 'Direcci'#243'n:'
    end
    object lbNombre: TLabel [6]
      Left = 13
      Top = 146
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lbApellido: TLabel [7]
      Left = 13
      Top = 120
      Width = 37
      Height = 13
      Caption = 'Apellido'
    end
    object lblMail: TLabel [8]
      Left = 10
      Top = 194
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lblTelefono: TLabel [9]
      Left = 10
      Top = 219
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    inherited btnAceptar: TButton
      Left = 239
      Top = 250
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Left = 317
      Top = 250
      TabOrder = 10
    end
    object edNombrePerito: TEdit
      Left = 101
      Top = 90
      Width = 286
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    inline fraTipoPerito: TfraCodigoDescripcion
      Left = 100
      Top = 37
      Width = 288
      Height = 25
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 224
      end
    end
    object edCuitCuil: TMaskEdit
      Left = 100
      Top = 11
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edCuitCuilExit
    end
    object cboDesignacion: TComboBox
      Left = 102
      Top = 64
      Width = 286
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Parte'
        'Oficio'
        'Parte Opositora')
    end
    object edDireccion: TEdit
      Left = 100
      Top = 165
      Width = 283
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 6
    end
    object edApellido: TEdit
      Left = 100
      Top = 115
      Width = 287
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 4
    end
    object edNombre: TEdit
      Left = 100
      Top = 141
      Width = 287
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 5
    end
    object edMail: TPatternEdit
      Left = 100
      Top = 190
      Width = 283
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 7
    end
    object edTelefono: TEdit
      Left = 100
      Top = 215
      Width = 200
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 400
      TabOrder = 8
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 407
    Width = 741
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      741
      29)
    object Button1: TButton
      Left = 588
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 664
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 584
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT lpe.pe_id, lpe.pe_nombre, lpe.pe_fechaalta, lpe.pe_usualt' +
        'a,pe_direccion,'
      
        '       lpe.pe_fechamodif, lpe.pe_usumodif, lpe.pe_fechabaja, lpe' +
        '.pe_usubaja,'
      '       lpe.pe_parteoficio, lpe.pe_cuitcuil,'
      
        '       ltp.tp_descripcion, lpe.pe_idtipoperito,pe_nombreindividu' +
        'al, pe_apellido, '
      '       PE_DIRECCIONELECTRONICA, PE_TELEFONO'
      '  FROM legales.lpe_perito lpe, legales.ltp_tipopericia ltp'
      ' WHERE ((ltp.tp_id = lpe.pe_idtipoperito))')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
      end>
  end
end
