inherited frmManPreventorConsultoras: TfrmManPreventorConsultoras
  Caption = 'Preventores Consultora'
  ClientHeight = 495
  ClientWidth = 911
  FormStyle = fsNormal
  ExplicitWidth = 919
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 911
  end
  inherited CoolBar: TCoolBar
    Width = 911
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 907
      end>
    inherited ToolBar: TToolBar
      Left = 9
      Width = 898
      ExplicitLeft = 9
      ExplicitWidth = 898
    end
  end
  inherited Grid: TArtDBGrid
    Width = 911
    Height = 421
    Columns = <
      item
        Expanded = False
        FieldName = 'PC_ID'
        Title.Caption = 'ID'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMATRICULA'
        Title.Caption = 'Tipo Matricula'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_TITULO'
        Title.Caption = 'Titulo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_INSTITUCIONOTORGANTE'
        Title.Caption = 'Instituci'#243'n otorgante'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_EMAIL'
        Title.Caption = 'Email'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_CALLE'
        Title.Caption = 'Calle'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_PISO'
        Title.Caption = 'Piso'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_CPOSTALA'
        Title.Caption = 'C'#243'digo Postal Argentino'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_CALLE'
        Title.Caption = 'Calle'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 93
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 164
    Top = 120
    Width = 561
    Height = 269
    ExplicitLeft = 164
    ExplicitTop = 120
    ExplicitWidth = 561
    ExplicitHeight = 269
    inherited BevelAbm: TBevel
      Top = 233
      Width = 553
    end
    object Label3: TLabel [1]
      Left = 10
      Top = 132
      Width = 70
      Height = 13
      Caption = 'Inst Otorgante:'
    end
    object Label4: TLabel [2]
      Left = 10
      Top = 107
      Width = 31
      Height = 13
      Caption = 'T'#237'tulo:'
    end
    object Label2: TLabel [3]
      Left = 10
      Top = 83
      Width = 71
      Height = 13
      Caption = 'Nro. Matr'#237'cula:'
    end
    object Label1: TLabel [4]
      Left = 10
      Top = 59
      Width = 72
      Height = 13
      Caption = 'Tipo Matr'#237'cula:'
    end
    object lblNombre: TLabel [5]
      Left = 10
      Top = 34
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object lblCodigo: TLabel [6]
      Left = 10
      Top = 10
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object Label15: TLabel [7]
      Left = 10
      Top = 151
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    inherited btnAceptar: TButton
      Left = 403
      Top = 239
    end
    inherited btnCancelar: TButton
      Left = 481
      Top = 239
    end
    object edCodigoPreventor: TPatternEdit
      Left = 89
      Top = 6
      Width = 107
      Height = 21
      Color = clGradientInactiveCaption
      ReadOnly = True
      TabOrder = 2
      Pattern = '0123456789'
    end
    object edNombre: TEdit
      Left = 89
      Top = 31
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 3
    end
    object cbTipoMatricula: TExComboBox
      Left = 89
      Top = 55
      Width = 462
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Items.Strings = (
        '1=RUGU'
        '2=RUTH'
        '3=Matr'#237'cula Profesional')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object edNroMatricula: TPatternEdit
      Left = 89
      Top = 80
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 15
      TabOrder = 5
    end
    object edTitulo: TEdit
      Left = 89
      Top = 104
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 30
      TabOrder = 6
    end
    object edInstOtorgante: TEdit
      Left = 89
      Top = 127
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 7
    end
    object edEmail: TEdit
      Left = 89
      Top = 148
      Width = 463
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 8
    end
    inline fraDomicilioGISPreventor: TfraDomicilioGIS
      Left = 1
      Top = 169
      Width = 557
      Height = 60
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      ExplicitLeft = 1
      ExplicitTop = 169
      ExplicitWidth = 557
      ExplicitHeight = 60
      inherited lbCalle: TLabel
        Left = 10
        ExplicitLeft = 10
      end
      inherited lbNro: TLabel
        Left = 380
        ExplicitLeft = 337
      end
      inherited lbPiso: TLabel
        Left = 444
        ExplicitLeft = 401
      end
      inherited lbDto: TLabel
        Left = 496
        ExplicitLeft = 453
      end
      inherited lbCPostal: TLabel
        Left = 10
        ExplicitLeft = 10
      end
      inherited lbCPA: TLabel
        Left = 112
        ExplicitLeft = 112
      end
      inherited lbLocalidad: TLabel
        Left = 213
        ExplicitLeft = 213
      end
      inherited cmbCalle: TArtComboBox
        Left = 86
        Width = 229
        ExplicitLeft = 86
        ExplicitWidth = 156
      end
      inherited edNumero: TEdit
        Left = 396
        ExplicitLeft = 353
      end
      inherited edPiso: TEdit
        Left = 468
        ExplicitLeft = 425
      end
      inherited edDto: TEdit
        Left = 520
        ExplicitLeft = 477
      end
      inherited edCPostal: TIntEdit
        Left = 56
        ExplicitLeft = 56
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 261
        Width = 125
        ExplicitLeft = 261
        ExplicitWidth = 125
      end
      inherited edProvincia: TEdit
        Left = 448
        ExplicitLeft = 405
      end
      inherited edCPA: TPatternEdit
        Left = 136
        ExplicitLeft = 136
      end
      inherited btnBuscar: TButton
        Left = 56
        Top = 5
        ExplicitLeft = 56
        ExplicitTop = 5
      end
      inherited btnBuscarGIS: TAdvGlowButton
        Left = 284
        ExplicitLeft = 241
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 330
        ExplicitLeft = 287
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT pc_id, pc_idpreventor, pc_nombre, pc_tipomatricula,'
      '       DECODE (pc_tipomatricula,'
      '               '#39'1'#39', '#39'RUGU'#39','
      '               2, '#39'RUTH'#39','
      '               3, '#39'Matr'#237'cula Profesional'#39
      '              ) tipomatricula,'
      
        '       pc_matricula, pc_institucionotorgante, pc_titulo, pc_emai' +
        'l, pc_calle,'
      
        '       pc_numero, pc_piso, pc_departamento, pc_cpostal, pc_cpost' +
        'ala,'
      '       pc_localidad, pc_provincia, (SELECT pv_descripcion'
      '                                      FROM art.cpv_provincias'
      
        '                                     WHERE pv_codigo = pc_provin' +
        'cia)'
      
        '                                                                ' +
        '    provincia, '
      '       pc_fechabaja'
      '  FROM hys.hpc_preventorconsultora'
      ' WHERE 1 = 2')
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
    Left = 82
    Top = 256
  end
end
