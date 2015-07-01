inherited frmManAGC_GESTORCUENTA: TfrmManAGC_GESTORCUENTA
  Left = 200
  Top = 109
  Width = 760
  Height = 480
  Caption = 'Mantenimiento de Gestores de Cuentas'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 13
  end
  inherited CoolBar: TCoolBar
    Top = 13
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    inherited ToolBar: TToolBar
      Width = 735
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbComision: TToolButton
        Left = 370
        Top = 0
        Hint = 'Comisi'#243'n Gestor (Ctrl+G)'
        ImageIndex = 23
        Visible = False
        OnClick = tbComisionClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 42
    Width = 752
    Height = 411
    Columns = <
      item
        Expanded = False
        FieldName = 'GC_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_CALLE'
        Title.Caption = 'Calle'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_PISO'
        Title.Caption = 'Piso'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_DEPARTAMENTO'
        Title.Caption = 'Dto.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_LOCALIDAD'
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
        FieldName = 'GC_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_CPOSTALA'
        Title.Caption = 'C.P.A.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_CODAREATELEFONOS'
        Title.Caption = 'Cod.Area.Tel'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_CODAREAFAX'
        Title.Caption = 'Cod.Area.Fax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_FAX'
        Title.Caption = 'Fax'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_DIRELECTRONICA'
        Title.Caption = 'E-Mail'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_IVA'
        Title.Alignment = taCenter
        Title.Caption = 'IVA'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIOASOCIADO'
        Title.Caption = 'Estudio Asociado'
        Width = 137
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 110
    Top = 88
    Width = 600
    Height = 296
    BorderStyle = bsDialog
    ActiveControl = edGC_NOMBRE
    Constraints.MinHeight = 296
    Constraints.MinWidth = 600
    DesignSize = (
      600
      296)
    inherited BevelAbm: TBevel
      Top = 260
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
      Left = 6
      Top = 100
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 128
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label4: TLabel [4]
      Left = 6
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblUsuario: TLabel [5]
      Left = 6
      Top = 180
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object lbCUIT: TLabel [6]
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
    object lblDirElectronica: TLabel [7]
      Left = 6
      Top = 155
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object Label6: TLabel [8]
      Left = 510
      Top = 100
      Width = 33
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Interno'
    end
    object lblEstudioAsoc: TLabel [9]
      Left = 6
      Top = 232
      Width = 44
      Height = 26
      Caption = 'Estudio Asociado'
      WordWrap = True
    end
    object lblFRevision: TLabel [10]
      Left = 422
      Top = 238
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Revisi'#243'n'
      FocusControl = edFechaRevision
    end
    object lblRetGanancias: TLabel [11]
      Left = 6
      Top = 209
      Width = 52
      Height = 13
      AutoSize = False
      Caption = 'Ret. Gcias.:'
    end
    object lblSituacionIVA: TLabel [12]
      Left = 6
      Top = 181
      Width = 51
      Height = 13
      AutoSize = False
      Caption = 'Cond. IVA'
    end
    inherited btnAceptar: TButton
      Left = 448
      Top = 266
      Width = 72
      TabOrder = 16
    end
    inherited btnCancelar: TButton
      Left = 520
      Top = 266
      Width = 72
      TabOrder = 17
    end
    object edGC_NOMBRE: TEdit
      Left = 282
      Top = 12
      Width = 310
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    object edGC_CODAREATELEFONOS: TIntEdit
      Left = 60
      Top = 96
      Width = 49
      Height = 21
      TabOrder = 4
      MaxLength = 5
    end
    object edGC_TELEFONOS: TPatternEdit
      Left = 112
      Top = 96
      Width = 394
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 5
      Pattern = '0123456789()-/'
    end
    object edGC_CODAREAFAX: TIntEdit
      Left = 60
      Top = 124
      Width = 49
      Height = 21
      TabOrder = 7
      MaxLength = 5
    end
    object edGC_FAX: TPatternEdit
      Left = 112
      Top = 124
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 8
      Pattern = '0123456789()-/'
    end
    object edGC_ID: TEdit
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
    inline fraUsuariosGestor: TfraUsuarios
      Left = 59
      Top = 176
      Width = 534
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      DesignSize = (
        534
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 105
        Width = 428
      end
      inherited edCodigo: TPatternEdit
        Width = 101
      end
    end
    object edGC_CUIT: TMaskEdit
      Left = 154
      Top = 12
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
    object edGC_DIRELECTRONICA: TEdit
      Left = 60
      Top = 151
      Width = 531
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 120
      TabOrder = 9
    end
    inline fraDomicilio: TfraDomicilio
      Left = 2
      Top = 40
      Width = 590
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      DesignSize = (
        590
        51)
      inherited lbCalle: TLabel
        Left = 4
        Caption = 'C&alle'
        FocusControl = fraDomicilio.cmbCalle
      end
      inherited lbNro: TLabel
        Left = 375
      end
      inherited lbPiso: TLabel
        Left = 447
      end
      inherited lbDto: TLabel
        Left = 523
      end
      inherited lbCPostal: TLabel
        Left = 4
        Caption = '&C.Postal'
        FocusControl = fraDomicilio.edCPostal
      end
      inherited lbCPA: TLabel
        Left = 114
      end
      inherited lbLocalidad: TLabel
        Caption = '&Localidad'
        FocusControl = fraDomicilio.cmbLocalidad
      end
      inherited lbProvincia: TLabel
        Left = 428
      end
      inherited cmbCalle: TArtComboBox
        Left = 58
        Width = 284
      end
      inherited edNumero: TEdit
        Left = 397
      end
      inherited edPiso: TEdit
        Left = 473
      end
      inherited edDto: TEdit
        Left = 545
      end
      inherited edCPostal: TIntEdit
        Left = 58
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 158
      end
      inherited edProvincia: TEdit
        Left = 477
      end
      inherited edCPA: TPatternEdit
        Left = 139
        Width = 64
      end
      inherited btnBuscar: TButton
        Left = 344
        Visible = False
      end
    end
    object edInternoTel: TPatternEdit
      Left = 547
      Top = 96
      Width = 45
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 4
      TabOrder = 6
      Pattern = '0123456789'
    end
    inline fraEstudioAsociado: TfraStaticCodigoDescripcion
      Left = 58
      Top = 234
      Width = 356
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      inherited cmbDescripcion: TComboGrid [0]
        Left = 52
        Width = 303
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
      inherited edCodigo: TPatternEdit [1]
        Left = 2
        Width = 48
      end
    end
    object btnCuentasBancarias: TButton
      Left = 8
      Top = 266
      Width = 109
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cuentas &Bancarias'
      TabOrder = 15
      OnClick = btnCuentasBancariasClick
    end
    inline fraRetGanancias: TfraCtbTablas
      Left = 58
      Top = 206
      Width = 534
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      DesignSize = (
        534
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 482
      end
      inherited edCodigo: TPatternEdit
        Left = 2
      end
    end
    object edFechaRevision: TDateComboBox
      Left = 501
      Top = 235
      Width = 90
      Height = 21
      Color = clWhite
      Anchors = [akTop, akRight]
      TabOrder = 14
    end
    inline fraSituacionIVA: TfraStaticCTB_TABLAS
      Left = 58
      Top = 177
      Width = 533
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      DesignSize = (
        533
        23)
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 48
      end
      inherited cmbDescripcion: TComboGrid
        Left = 52
        Width = 482
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT gc_id, gc_cuit, gc_nombre, gc_provincia, gc_calle, gc_loc' +
        'alidad, gc_cpostal, pv_descripcion, gc_numero, gc_piso,'
      
        '       gc_departamento, gc_cpostala, gc_codareatelefonos, gc_tel' +
        'efonos, gc_codareafax, gc_fax, gc_fechabaja, gc_usuario,'
      '       gc_direlectronica, se_nombre, gc_estudio,'
      
        '       Decode(Instr(Upper(gc_telefonos), '#39' INT '#39'), 0, gc_telefon' +
        'os, Substr(gc_telefonos, 1, Instr(Upper(gc_telefonos), '#39' INT '#39'))' +
        ') telefonos,'
      
        '       Decode(Instr(Upper(gc_telefonos), '#39' INT '#39'), 0, '#39#39', Substr' +
        '(gc_telefonos, Instr(Upper(gc_telefonos), '#39' INT '#39')+5)) interno'
      '  FROM afi.agc_gestorcuenta, cpv_provincias, use_usuarios'
      ' WHERE pv_codigo(+) = gc_provincia'
      '   AND gc_usuario = se_usuario(+)'
      '')
    Left = 19
    Top = 100
  end
  inherited dsConsulta: TDataSource
    Left = 47
    Top = 100
  end
  inherited SortDialog: TSortDialog
    Left = 19
    Top = 128
  end
  inherited ExportDialog: TExportDialog
    Left = 47
    Top = 128
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 70
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 47
    Top = 156
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 18
    Top = 72
  end
  inherited FormStorage: TFormStorage
    Left = 47
    Top = 72
  end
  inherited PrintDialog: TPrintDialog
    Left = 19
    Top = 156
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
        LinkControl = tbSalir2
      end
      item
        Key = 16455
        LinkControl = tbComision
      end>
    Left = 75
    Top = 72
  end
  inherited FieldHider: TFieldHider
    Left = 75
    Top = 100
  end
end
