inherited frmManAcreedores: TfrmManAcreedores
  Left = 163
  Top = 121
  Width = 725
  Height = 570
  Caption = 'Mantenimiento de Acreedores'
  Constraints.MinHeight = 570
  Constraints.MinWidth = 725
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 30
    Top = 282
    Width = 49
    Height = 13
    Caption = 'Localidad:'
  end
  inherited pnlFiltros: TPanel
    Top = 31
    Width = 717
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 31
    Width = 717
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 713
      end>
    inherited ToolBar: TToolBar
      Width = 700
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 60
    Width = 717
    Height = 483
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pa_cuitcuil'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT/CUIL'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pa_denomina'
        Title.Caption = 'Acreedor'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipoacre'
        Title.Caption = 'Tipo acreedor'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formacobro'
        Title.Caption = 'Forma cobro'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'retganancias'
        Title.Caption = 'Ret. ganancias'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'retib'
        Title.Caption = 'Ret. I.B.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'domicilio'
        Title.Caption = 'Domicilio'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'provincia'
        Title.Caption = 'Provincia'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pa_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 64
    Top = 75
    Width = 637
    Height = 431
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    DesignSize = (
      637
      431)
    inherited BevelAbm: TBevel
      Left = 7
      Top = 395
      Width = 623
    end
    object lblFechaImpr: TLabel [1]
      Left = 14
      Top = 372
      Width = 119
      Height = 13
      Caption = 'Fecha Impr.Form.Inscrip.:'
      FocusControl = edFechaImpr
    end
    object Label1: TLabel [2]
      Left = 14
      Top = 309
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Ret.Ganancias:'
    end
    object Label2: TLabel [3]
      Left = 14
      Top = 336
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Ret.Ing.Brutos:'
    end
    object Label3: TLabel [4]
      Left = 15
      Top = 126
      Width = 63
      Height = 13
      Caption = 'Forma Cobro:'
    end
    object Label4: TLabel [5]
      Left = 15
      Top = 45
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Bevel1: TBevel [6]
      Left = 7
      Top = 271
      Width = 629
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel [7]
      Left = 7
      Top = 152
      Width = 623
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lblCuitCuil: TLabel [8]
      Left = 15
      Top = 18
      Width = 57
      Height = 13
      Caption = 'CUIT/CUIL:'
    end
    object Bevel3: TBevel [9]
      Left = 7
      Top = 68
      Width = 623
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel4: TBevel [10]
      Left = 7
      Top = 362
      Width = 623
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label5: TLabel [11]
      Left = 9
      Top = 165
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label6: TLabel [12]
      Left = 11
      Top = 190
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label27: TLabel [13]
      Left = 14
      Top = 282
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Condici'#243'n IVA:'
    end
    object Label7: TLabel [14]
      Left = 237
      Top = 372
      Width = 77
      Height = 13
      Caption = 'Fecha Revisi'#243'n:'
      FocusControl = edFechaRevision
    end
    inherited btnAceptar: TButton
      Left = 479
      Top = 403
      TabOrder = 16
    end
    inherited btnCancelar: TButton
      Left = 557
      Top = 403
      TabOrder = 17
    end
    object edFechaImpr: TDateComboBox
      Left = 137
      Top = 369
      Width = 90
      Height = 21
      Color = clWhite
      TabOrder = 13
    end
    inline fraFormaCobro: TfraCtbTablas
      Left = 83
      Top = 123
      Width = 543
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        543
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 57
        Width = 485
      end
      inherited edCodigo: TPatternEdit
        Width = 51
      end
    end
    inline fraRetGanancias: TfraCtbTablas
      Left = 95
      Top = 306
      Width = 404
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      DesignSize = (
        404
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Width = 358
      end
      inherited edCodigo: TPatternEdit
        Width = 39
      end
    end
    inline fraRetIB: TfraCodigoDescripcionExt
      Left = 95
      Top = 333
      Width = 404
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      DesignSize = (
        404
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Width = 358
      end
      inherited edCodigo: TPatternEdit
        Width = 39
      end
    end
    object rgbTipoAcreedor: TRadioGroup
      Left = 12
      Top = 78
      Width = 476
      Height = 37
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de Acreedor '
      Columns = 2
      Items.Strings = (
        'Persona Autorizada'
        'Otros Acreedores')
      TabOrder = 2
    end
    object chbConcertado: TCheckBox
      Left = 549
      Top = 90
      Width = 75
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Concertado'
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 84
      Top = 42
      Width = 542
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 1
    end
    object chbCajaMedicos: TCheckBox
      Left = 516
      Top = 336
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Ret. Caja M'#233'dicos'
      TabOrder = 12
    end
    object edCuitCuil: TMaskEdit
      Left = 84
      Top = 15
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edTelefono: TEdit
      Left = 92
      Top = 161
      Width = 85
      Height = 21
      MaxLength = 8
      TabOrder = 6
    end
    object edCodArea: TEdit
      Left = 56
      Top = 161
      Width = 33
      Height = 21
      MaxLength = 5
      TabOrder = 5
    end
    object edDomicilio: TEdit
      Left = 55
      Top = 186
      Width = 316
      Height = 21
      Color = clBtnFace
      MaxLength = 35
      ReadOnly = True
      TabOrder = 7
    end
    inline fraDomicilio: TfraDomicilio
      Left = 7
      Top = 214
      Width = 616
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      inherited lbNro: TLabel
        Left = 401
      end
      inherited lbPiso: TLabel
        Left = 473
      end
      inherited lbDto: TLabel
        Left = 549
      end
      inherited lbProvincia: TLabel
        Left = 454
      end
      inherited cmbCalle: TArtComboBox
        Width = 316
      end
      inherited edNumero: TEdit
        Left = 423
      end
      inherited edPiso: TEdit
        Left = 499
      end
      inherited edDto: TEdit
        Left = 571
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 184
      end
      inherited edProvincia: TEdit
        Left = 503
      end
      inherited btnBuscar: TButton
        Left = 366
      end
    end
    object btnCuentasBancarias: TButton
      Left = 8
      Top = 403
      Width = 109
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cuentas &Bancarias'
      TabOrder = 15
      OnClick = btnCuentasBancariasClick
    end
    inline fraSituacionIVA: TfraStaticCTB_TABLAS
      Left = 95
      Top = 278
      Width = 404
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      DesignSize = (
        404
        23)
      inherited edCodigo: TPatternEdit
        Width = 39
      end
      inherited cmbDescripcion: TComboGrid
        Left = 45
        Width = 358
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
    object edFechaRevision: TDateComboBox
      Left = 319
      Top = 369
      Width = 90
      Height = 21
      Color = clWhite
      TabOrder = 14
    end
  end
  object Panel1: TPanel [5]
    Left = 0
    Top = 0
    Width = 717
    Height = 31
    Align = alTop
    TabOrder = 4
    DesignSize = (
      717
      31)
    object Label10: TLabel
      Left = 6
      Top = 8
      Width = 57
      Height = 13
      Caption = 'CUIT/CUIL:'
    end
    object Label11: TLabel
      Left = 168
      Top = 8
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object edCUITFiltro: TMaskEdit
      Left = 69
      Top = 5
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edDescripcionFiltro: TEdit
      Left = 231
      Top = 5
      Width = 370
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 1
    end
    object chbExclBajas: TCheckBox
      Left = 627
      Top = 7
      Width = 79
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Excluir bajas'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT * FROM art.spa_pagoacre'
      'ORDER BY pa_denomina')
    Top = 119
  end
  inherited dsConsulta: TDataSource
    Top = 119
  end
  inherited SortDialog: TSortDialog
    Top = 147
  end
  inherited ExportDialog: TExportDialog
    Top = 147
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Top = 175
  end
  inherited Seguridad: TSeguridad
    Top = 91
  end
  inherited FormStorage: TFormStorage
    Top = 91
  end
  inherited PrintDialog: TPrintDialog
    Top = 175
  end
  inherited ShortCutControl: TShortCutControl
    Top = 91
  end
  inherited FieldHider: TFieldHider
    Top = 119
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
    Left = 108
    Top = 91
  end
end
