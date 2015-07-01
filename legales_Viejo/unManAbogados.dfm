inherited frmManAbogados: TfrmManAbogados
  Left = 509
  Top = 268
  Caption = 'Mantenimiento de Abogados'
  ClientHeight = 504
  ClientWidth = 727
  Constraints.MinHeight = 450
  Constraints.MinWidth = 580
  ExplicitWidth = 735
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 29
    Width = 727
    Height = 28
    Visible = True
    ExplicitTop = 29
    ExplicitWidth = 727
    ExplicitHeight = 28
    object lblTipo: TLabel
      Left = 8
      Top = 6
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object cmbTipoAbogado: TComboBox
      Left = 38
      Top = 3
      Width = 164
      Height = 21
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 0
      Text = 
        'PARTE                                                           ' +
        '                                                                ' +
        '                                                                ' +
        '              P'
      OnChange = cmbTipoAbogadoChange
      Items.Strings = (
        
          'MEDIADOR                                                        ' +
          '                                                                ' +
          '                                                                ' +
          '         M'
        
          'OPONENTE                                                        ' +
          '                                                                ' +
          '                                                                ' +
          '         O'
        
          'PARTE                                                           ' +
          '                                                                ' +
          '                                                                ' +
          '              P'
        
          'SUMARIANTE                                                      ' +
          '                                                                ' +
          '                                                                ' +
          '       S')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 727
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 721
      end>
    ExplicitTop = 0
    ExplicitWidth = 727
    inherited ToolBar: TToolBar
      Left = 9
      Width = 714
      ExplicitLeft = 9
      ExplicitWidth = 714
    end
  end
  inherited Grid: TArtDBGrid
    Top = 57
    Width = 727
    Height = 418
    Columns = <
      item
        Expanded = False
        FieldName = 'BO_ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Nombre Completo'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_APELLIDO'
        Title.Caption = 'Apellido'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBREINDIVIDUAL'
        Title.Caption = 'Nombre'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_CODAREATELEFONO'
        Title.Caption = 'C'#243'd. Area'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_PREFIJOTELEFONO'
        Title.Caption = 'Prefijo'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_DIRELECTRONICA'
        Title.Caption = 'Correo Electr'#243'nico'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_PROVINCIART'
        Title.Caption = 'Pertenece a ART'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_PARTE'
        Title.Caption = 'Parte Actuante'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BO_CUITCUIL'
        Title.Alignment = taCenter
        Title.Caption = 'Cuit/Cuil'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 89
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 121
    Top = 79
    Width = 497
    Height = 356
    BorderStyle = bsDialog
    ExplicitLeft = 121
    ExplicitTop = 79
    ExplicitWidth = 497
    ExplicitHeight = 356
    inherited BevelAbm: TBevel
      Top = 320
      Width = 489
      ExplicitTop = 320
      ExplicitWidth = 489
    end
    object lblDescripcion: TLabel [1]
      Left = 6
      Top = 32
      Width = 84
      Height = 13
      Caption = 'Nombre Completo'
    end
    object lblDireccion: TLabel [2]
      Left = 6
      Top = 109
      Width = 45
      Height = 13
      Caption = 'Direcci'#243'n'
    end
    object lblTelefono: TLabel [3]
      Left = 6
      Top = 138
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object lblEmail: TLabel [4]
      Left = 6
      Top = 165
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object lblParte: TLabel [5]
      Left = 6
      Top = 190
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object lblCuil: TLabel [6]
      Left = 8
      Top = 10
      Width = 57
      Height = 13
      Caption = 'CUIL/CUIT:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbEstudioJuridico: TLabel [7]
      Left = 6
      Top = 217
      Width = 51
      Height = 13
      Caption = 'E. Jur'#237'dico'
    end
    object lbUsuarioWeb: TLabel [8]
      Left = 6
      Top = 244
      Width = 62
      Height = 13
      Caption = 'Usuario Web'
    end
    object Label1: TLabel [9]
      Left = 6
      Top = 272
      Width = 54
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    object lbNombre: TLabel [10]
      Left = 9
      Top = 87
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lbApellido: TLabel [11]
      Left = 9
      Top = 61
      Width = 37
      Height = 13
      Caption = 'Apellido'
    end
    object lblArchivosAsociados: TLabel [12]
      Left = 6
      Top = 298
      Width = 64
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Asociar Doc.:'
    end
    inherited btnAceptar: TButton
      Left = 339
      Top = 326
      TabOrder = 14
      ExplicitLeft = 339
      ExplicitTop = 326
    end
    inherited btnCancelar: TButton
      Left = 417
      Top = 326
      TabOrder = 15
      ExplicitLeft = 417
      ExplicitTop = 326
    end
    object edBO_NOMBRE: TEdit
      Left = 99
      Top = 30
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
    object edBO_DIRECCION: TEdit
      Left = 99
      Top = 107
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 4
    end
    object edBO_TELEFONO: TEdit
      Left = 99
      Top = 134
      Width = 173
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 400
      TabOrder = 5
    end
    object edBO_DIRELECTRONICA: TEdit
      Left = 99
      Top = 161
      Width = 290
      Height = 21
      MaxLength = 120
      TabOrder = 6
    end
    object edCuilCuit: TMaskEdit
      Left = 98
      Top = 5
      Width = 85
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edCuilCuitExit
    end
    object cmbParteAbogado: TComboBox
      Left = 99
      Top = 188
      Width = 164
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      Items.Strings = (
        
          'MEDIADOR                                                        ' +
          '                                                                ' +
          '                                                                ' +
          '         M'
        
          'OPONENTE                                                        ' +
          '                                                                ' +
          '                                                                ' +
          '         O'
        
          'PARTE                                                           ' +
          '                                                                ' +
          '                                                                ' +
          '              P'
        
          'SUMARIANTE                                                      ' +
          '                                                                ' +
          '                                                                ' +
          '       S')
    end
    inline fraEstudioJuridico: TfraCodigoDescripcionExt
      Left = 98
      Top = 214
      Width = 302
      Height = 23
      TabOrder = 8
      ExplicitLeft = 98
      ExplicitTop = 214
      ExplicitWidth = 302
      inherited cmbDescripcion: TArtComboBox
        Width = 237
        ExplicitWidth = 237
      end
    end
    object edUsuarioWeb: TEdit
      Left = 99
      Top = 242
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 10
    end
    object tbEdicionAbogado: TToolBar
      Left = 404
      Top = 212
      Width = 29
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      object tbNuevoEstudio: TToolButton
        Left = 0
        Top = 0
        Hint = 'Modificar'
        ImageIndex = 14
        OnClick = tbNuevoEstudioClick
      end
    end
    inline fraBO_IDDELEGACION: TfraDelegacion
      Left = 99
      Top = 268
      Width = 327
      Height = 23
      TabOrder = 11
      ExplicitLeft = 99
      ExplicitTop = 268
      ExplicitWidth = 327
      inherited cmbDescripcion: TArtComboBox
        Width = 262
        ExplicitWidth = 262
      end
    end
    object edApellido: TEdit
      Left = 99
      Top = 56
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object edNombre: TEdit
      Left = 99
      Top = 82
      Width = 325
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    object edtArchivosAsociados: TEdit
      Left = 100
      Top = 295
      Width = 326
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      Color = 16776176
      ReadOnly = True
      TabOrder = 12
    end
    object tbrVerArchivosAsociados: TToolBar
      Left = 438
      Top = 292
      Width = 55
      Height = 27
      Align = alNone
      Anchors = [akBottom]
      BorderWidth = 1
      ButtonWidth = 25
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccionar Archivos'
        ImageIndex = 26
        OnClick = tbSeleccionArchivosAsociarClick
      end
      object tbAsignarDoc: TToolButton
        Left = 25
        Top = 0
        Hint = 'Asignar Doc.'
        ImageIndex = 23
        OnClick = tbAsignarDocClick
      end
    end
    object ToolBar1: TToolBar
      Left = 279
      Top = 129
      Width = 27
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object ToolBar2: TToolBar
      Left = 404
      Top = 158
      Width = 31
      Height = 28
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = 'Celular/e-mail'
        ImageIndex = 35
        OnClick = Button3Click
      end
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 475
    Width = 727
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      727
      29)
    object Button1: TButton
      Left = 574
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
      Left = 650
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
      Width = 570
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited ShortCutControl: TShortCutControl
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
  end
  object cdsArchivosAsociados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PATHARCHIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 256
    Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F000B444553
      4352495043494F4E01004900000001000557494454480200020064000B504154
      484152434849564F010049000000010005574944544802000200640002494404
      0001000000000005535441544501004900000001000557494454480200020001
      000000}
  end
  object sdqArchivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT aa_descripcion, aa_patharchivo, aa_id'
      '  FROM legales.laa_archivoabogado'
      ' WHERE aa_idabogado = :idabogado'
      '   AND aa_fechabaja IS NULL')
    Left = 80
    Top = 285
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idabogado'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = sdqArchivosAsociados
    Left = 80
    Top = 314
  end
end
