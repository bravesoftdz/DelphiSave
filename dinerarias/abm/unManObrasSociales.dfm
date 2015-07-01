inherited frmManObrasSociales: TfrmManObrasSociales
  Left = 330
  Top = 195
  Width = 651
  Caption = 'Mantenimiento de obras sociales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 643
    Height = 41
    Visible = True
    object gbEstado: TGroupBox
      Left = 3
      Top = 1
      Width = 134
      Height = 37
      Caption = ' Estado '
      TabOrder = 0
      object rbActivas: TRadioButton
        Left = 8
        Top = 16
        Width = 57
        Height = 17
        Caption = 'Activas'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbTodas: TRadioButton
        Left = 72
        Top = 16
        Width = 57
        Height = 17
        Caption = 'Todas'
        TabOrder = 1
      end
    end
    object gbTipo: TGroupBox
      Left = 140
      Top = 1
      Width = 202
      Height = 37
      Caption = ' Tipo '
      TabOrder = 1
      object rbSuss: TRadioButton
        Left = 8
        Top = 16
        Width = 53
        Height = 17
        Caption = 'SUSS'
        TabOrder = 0
      end
      object rbTipoTodas: TRadioButton
        Left = 144
        Top = 16
        Width = 53
        Height = 17
        Caption = 'Todas'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbNoSuss: TRadioButton
        Left = 64
        Top = 16
        Width = 69
        Height = 17
        Caption = 'No SUSS'
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 41
    Width = 643
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 639
      end>
    inherited ToolBar: TToolBar
      Width = 626
    end
  end
  inherited Grid: TArtDBGrid
    Top = 70
    Width = 643
    Height = 369
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_CALLE'
        Title.Caption = 'Calle'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_PISO'
        Title.Alignment = taCenter
        Title.Caption = 'Piso'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_DEPARTAMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Dpto.'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_CPOSTAL'
        Title.Alignment = taCenter
        Title.Caption = 'CP'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_CPOSTALA'
        Title.Alignment = taCenter
        Title.Caption = 'CPA'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_FAX'
        Title.Caption = 'Fax'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_DIRELECTRONICA'
        Title.Caption = 'E-mail'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OS_CONTACTOS'
        Title.Caption = 'Contactos'
        Width = 100
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 7
    Top = 111
    Width = 628
    Height = 280
    Constraints.MinHeight = 280
    Constraints.MinWidth = 628
    inherited BevelAbm: TBevel
      Top = 244
      Width = 620
    end
    object Label1: TLabel [1]
      Left = 20
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbRSocial: TLabel [2]
      Left = 13
      Top = 40
      Width = 40
      Height = 13
      Caption = 'R.Social'
    end
    object Bevel1: TBevel [3]
      Left = -2
      Top = 62
      Width = 630
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel [4]
      Left = 6
      Top = 124
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
    end
    object Label4: TLabel [5]
      Left = 33
      Top = 148
      Width = 20
      Height = 13
      Caption = 'FAX'
    end
    object Label5: TLabel [6]
      Left = 24
      Top = 172
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object Label2: TLabel [7]
      Left = 5
      Top = 196
      Width = 48
      Height = 13
      Caption = 'Contactos'
    end
    object Label6: TLabel [8]
      Left = 32
      Top = 219
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    inherited btnAceptar: TButton
      Left = 470
      Top = 250
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 548
      Top = 250
      TabOrder = 9
    end
    object edRSocial: TEdit
      Left = 58
      Top = 36
      Width = 566
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 255
      TabOrder = 1
    end
    object edTelefono: TEdit
      Left = 58
      Top = 120
      Width = 566
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 3
    end
    object edFAX: TEdit
      Left = 58
      Top = 144
      Width = 566
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 4
    end
    object edDirElectronica: TEdit
      Left = 58
      Top = 168
      Width = 566
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 5
    end
    object edCodigo: TPatternEdit
      Left = 59
      Top = 8
      Width = 67
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      Pattern = '0123456789'
    end
    object edContactos: TEdit
      Left = 58
      Top = 192
      Width = 566
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 6
    end
    inline fraDireccion: TfraDomicilio
      Left = 10
      Top = 67
      Width = 613
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inherited lbCalle: TLabel
        Left = 20
      end
      inherited lbNro: TLabel
        Left = 398
      end
      inherited lbPiso: TLabel
        Left = 470
      end
      inherited lbDto: TLabel
        Left = 546
      end
      inherited lbCPostal: TLabel
        Left = 4
      end
      inherited lbProvincia: TLabel
        Left = 451
      end
      inherited cmbCalle: TArtComboBox
        Width = 313
      end
      inherited edNumero: TEdit
        Left = 420
      end
      inherited edPiso: TEdit
        Left = 496
      end
      inherited edDto: TEdit
        Left = 568
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 181
      end
      inherited edProvincia: TEdit
        Left = 500
      end
      inherited btnBuscar: TButton
        Left = 363
      end
    end
    object pnlTipo: TPanel
      Left = 61
      Top = 215
      Width = 128
      Height = 23
      BevelOuter = bvNone
      TabOrder = 7
      object rbSussABM: TRadioButton
        Left = 0
        Top = 4
        Width = 53
        Height = 17
        Caption = 'SUSS'
        TabOrder = 0
      end
      object rbNoSussABM: TRadioButton
        Left = 56
        Top = 4
        Width = 69
        Height = 17
        Caption = 'No SUSS'
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT os_codigo, os_descripcion, os_calle, os_numero, os_piso, ' +
        'os_departamento, '
      
        '       os_localidad, os_cpostal, os_cpostala, os_provincia, pv_d' +
        'escripcion, os_telefonos, '
      
        '       os_fax, os_direlectronica, os_fechaalta, os_usualta, os_f' +
        'echamodif,'
      '       os_usumodif, os_fecbaja, os_usubaja, os_contactos'
      '  FROM cos_osocial, cpv_provincias'
      ' WHERE pv_codigo(+) = os_provincia')
    Left = 556
    Top = 28
  end
  inherited dsConsulta: TDataSource
    Left = 584
    Top = 28
  end
  inherited SortDialog: TSortDialog
    Left = 496
    Top = 0
  end
  inherited ExportDialog: TExportDialog
    Left = 524
    Top = 0
  end
  inherited QueryPrint: TQueryPrint
    Left = 524
    Top = 28
  end
  inherited Seguridad: TSeguridad
    Left = 556
    Top = 0
  end
  inherited FormStorage: TFormStorage
    Left = 584
    Top = 0
  end
  inherited PrintDialog: TPrintDialog
    Left = 496
    Top = 28
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
    Left = 612
    Top = 0
  end
  inherited FieldHider: TFieldHider
    Left = 612
    Top = 28
  end
end
