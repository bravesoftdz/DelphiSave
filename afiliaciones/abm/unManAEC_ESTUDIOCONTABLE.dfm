inherited frmManAEC_ESTUDIOCONTABLE: TfrmManAEC_ESTUDIOCONTABLE
  Left = 202
  Top = 111
  Width = 744
  Height = 488
  Caption = 'Mantenimiento de Estudios Contables'
  Constraints.MinHeight = 320
  Constraints.MinWidth = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 736
    Height = 13
  end
  inherited CoolBar: TCoolBar
    Top = 13
    Width = 736
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 732
      end>
    inherited ToolBar: TToolBar
      Width = 719
    end
  end
  inherited Grid: TArtDBGrid
    Top = 42
    Width = 736
    Height = 419
    Columns = <
      item
        Expanded = False
        FieldName = 'EC_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CPOSTAL'
        Title.Caption = 'Calle'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_PISO'
        Title.Caption = 'Piso'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_DEPARTAMENTO'
        Title.Caption = 'Dto.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CPOSTALA'
        Title.Caption = 'C.P.A.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CODAREATELEFONOS'
        Title.Caption = 'Cod.Area.Tel'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CODAREAFAX'
        Title.Caption = 'Cod.Area.Fax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_FAX'
        Title.Caption = 'Fax'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_DIRELECTRONICA'
        Title.Caption = 'E-Mail'
        Width = 193
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Width = 600
    Height = 220
    ActiveControl = edEC_NOMBRE
    Constraints.MaxHeight = 220
    Constraints.MinHeight = 220
    Constraints.MinWidth = 600
    inherited BevelAbm: TBevel
      Top = 184
      Width = 592
    end
    object Label1: TLabel [1]
      Left = 242
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 100
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 128
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbCUIT: TLabel [5]
      Left = 132
      Top = 16
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cuit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDirElectronica: TLabel [6]
      Left = 8
      Top = 155
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    inherited btnAceptar: TButton
      Left = 448
      Top = 190
      Width = 72
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Left = 520
      Top = 190
      Width = 72
      TabOrder = 10
    end
    object edEC_NOMBRE: TEdit
      Left = 282
      Top = 12
      Width = 310
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    object edEC_CODAREATELEFONOS: TIntEdit
      Left = 60
      Top = 96
      Width = 49
      Height = 21
      TabOrder = 4
      MaxLength = 5
    end
    object edEC_TELEFONOS: TPatternEdit
      Left = 112
      Top = 96
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 5
      Pattern = '0123456789()-/'
    end
    object edEC_CODAREAFAX: TIntEdit
      Left = 60
      Top = 124
      Width = 49
      Height = 21
      TabOrder = 6
      MaxLength = 5
    end
    object edEC_FAX: TPatternEdit
      Left = 112
      Top = 124
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 7
      Pattern = '0123456789()-/'
    end
    object edEC_ID: TEdit
      Left = 60
      Top = 12
      Width = 64
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 60
      ReadOnly = True
      TabOrder = 0
    end
    object edEC_CUIT: TMaskEdit
      Left = 154
      Top = 12
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
    object edEC_DIRELECTRONICA: TEdit
      Left = 60
      Top = 151
      Width = 531
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 120
      TabOrder = 8
    end
    inline fraDomicilio: TfraDomicilio
      Left = 12
      Top = 40
      Width = 747
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inherited lbCalle: TLabel
        Left = 20
        Caption = 'C&alle'
        FocusControl = fraDomicilio.cmbCalle
      end
      inherited lbNro: TLabel
        Left = 364
      end
      inherited lbPiso: TLabel
        Left = 436
      end
      inherited lbDto: TLabel
        Left = 512
      end
      inherited lbCPostal: TLabel
        Left = 2
        Caption = '&C.Postal'
        FocusControl = fraDomicilio.edCPostal
      end
      inherited lbLocalidad: TLabel
        Left = 196
        Caption = '&Localidad'
        FocusControl = fraDomicilio.cmbLocalidad
      end
      inherited lbProvincia: TLabel
        Left = 417
      end
      inherited cmbCalle: TArtComboBox
        Width = 296
      end
      inherited edNumero: TEdit
        Left = 386
      end
      inherited edPiso: TEdit
        Left = 462
      end
      inherited edDto: TEdit
        Left = 534
      end
      inherited edCPostal: TIntEdit
        Width = 48
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 248
        Width = 160
      end
      inherited edProvincia: TEdit
        Left = 466
        Width = 112
      end
      inherited edCPA: TPatternEdit
        Width = 56
      end
      inherited btnBuscar: TButton
        Left = 337
        Top = 8
        Visible = False
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT EC_ID, EC_CUIT, EC_NOMBRE, EC_PROVINCIA,'
      '       EC_CALLE, EC_LOCALIDAD, EC_CPOSTAL, PV_DESCRIPCION,'
      '       EC_NUMERO, EC_PISO,  EC_DEPARTAMENTO, '
      
        '       EC_CPOSTALA,  EC_CODAREATELEFONOS, EC_TELEFONOS, EC_CODAR' +
        'EAFAX,'
      
        '       EC_FAX, EC_FECHABAJA, EC_DIRELECTRONICA FROM AEC_ESTUDIOC' +
        'ONTABLE, CPV_PROVINCIAS'
      ' WHERE PV_CODIGO (+) = EC_PROVINCIA')
    Left = 12
    Top = 304
  end
  inherited dsConsulta: TDataSource
    Left = 40
    Top = 304
  end
  inherited SortDialog: TSortDialog
    Left = 12
    Top = 332
  end
  inherited ExportDialog: TExportDialog
    Left = 40
    Top = 332
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 70
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 40
    Top = 360
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 11
    Top = 276
  end
  inherited FormStorage: TFormStorage
    Left = 40
    Top = 276
  end
  inherited PrintDialog: TPrintDialog
    Left = 12
    Top = 360
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
      end
      item
        Key = 16455
      end>
    Left = 68
    Top = 276
  end
  inherited FieldHider: TFieldHider
    Left = 68
    Top = 304
  end
end
