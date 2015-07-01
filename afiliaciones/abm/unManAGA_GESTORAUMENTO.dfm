inherited frmManAGA_GESTORAUMENTO: TfrmManAGA_GESTORAUMENTO
  Left = 205
  Top = 103
  Width = 744
  Height = 488
  Caption = 'Mantenimiento de Gestores de Aumento'
  Constraints.MinHeight = 360
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
        FieldName = 'GA_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_CPOSTAL'
        Title.Caption = 'Calle'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_PISO'
        Title.Caption = 'Piso'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_DEPARTAMENTO'
        Title.Caption = 'Dto.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_LOCALIDAD'
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
        FieldName = 'GA_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_CPOSTALA'
        Title.Caption = 'C.P.A.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_CODAREATELEFONOS'
        Title.Caption = 'Cod.Area.Tel'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_CODAREAFAX'
        Title.Caption = 'Cod.Area.Fax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FAX'
        Title.Caption = 'Fax'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_DIRELECTRONICA'
        Title.Caption = 'E-Mail'
        Width = 193
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 112
    Width = 600
    Height = 220
    ActiveControl = edGA_NOMBRE
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
    object edGA_NOMBRE: TEdit
      Left = 282
      Top = 12
      Width = 310
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    object edGA_CODAREATELEFONOS: TIntEdit
      Left = 60
      Top = 96
      Width = 49
      Height = 21
      TabOrder = 4
      MaxLength = 5
    end
    object edGA_TELEFONOS: TPatternEdit
      Left = 112
      Top = 96
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 5
      Pattern = '0123456789()-/'
    end
    object edGA_CODAREAFAX: TIntEdit
      Left = 60
      Top = 124
      Width = 49
      Height = 21
      TabOrder = 6
      MaxLength = 5
    end
    object edGA_FAX: TPatternEdit
      Left = 112
      Top = 124
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 7
      Pattern = '0123456789()-/'
    end
    object edGA_ID: TEdit
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
    object edGA_CUIT: TMaskEdit
      Left = 154
      Top = 12
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
    object edGA_DIRELECTRONICA: TEdit
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
      Left = 4
      Top = 40
      Width = 740
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inherited lbCalle: TLabel
        Left = 4
        Caption = 'C&alle'
        FocusControl = fraDomicilio.cmbCalle
      end
      inherited lbNro: TLabel
        Left = 357
      end
      inherited lbPiso: TLabel
        Left = 437
      end
      inherited lbDto: TLabel
        Left = 521
      end
      inherited lbCPostal: TLabel
        Left = 4
        Caption = '&C.Postal'
        FocusControl = fraDomicilio.edCPostal
      end
      inherited lbCPA: TLabel
        Left = 112
      end
      inherited lbLocalidad: TLabel
        Left = 204
        Caption = '&Localidad'
        FocusControl = fraDomicilio.cmbLocalidad
      end
      inherited lbProvincia: TLabel
        Left = 426
      end
      inherited cmbCalle: TArtComboBox
        Left = 56
      end
      inherited edNumero: TEdit
        Left = 379
        Width = 48
      end
      inherited edPiso: TEdit
        Left = 463
        Width = 48
      end
      inherited edDto: TEdit
        Left = 543
      end
      inherited edCPostal: TIntEdit
        Left = 56
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 256
        Width = 161
      end
      inherited edProvincia: TEdit
        Left = 475
      end
      inherited edCPA: TPatternEdit
        Left = 138
        Width = 56
      end
      inherited btnBuscar: TButton
        Left = 202
        Top = 8
        Visible = False
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT GA_ID, GA_CUIT, GA_NOMBRE, GA_PROVINCIA,'
      '       GA_CALLE, GA_LOCALIDAD, GA_CPOSTAL, PV_DESCRIPCION,'
      '       GA_NUMERO, GA_PISO,  GA_DEPARTAMENTO, '
      
        '       GA_CPOSTALA,  GA_CODAREATELEFONOS, GA_TELEFONOS, GA_CODAR' +
        'EAFAX,'
      
        '       GA_FAX, GA_FECHABAJA, GA_DIRELECTRONICA FROM AFI.AGA_GEST' +
        'ORAUMENTO, CPV_PROVINCIAS'
      ' WHERE PV_CODIGO (+) = GA_PROVINCIA'
      ' '
      ' ')
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
