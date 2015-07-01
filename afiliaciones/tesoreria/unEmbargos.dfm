inherited frmEmbargos: TfrmEmbargos
  Left = 175
  Top = 185
  Width = 808
  Height = 608
  Caption = 'Embargos - Administraci'#243'n'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 794
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 160
    Visible = True
    DesignSize = (
      800
      160)
    object lbBanco: TLabel
      Left = 27
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object lbCuenta: TLabel
      Left = 21
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object Label22: TLabel
      Left = 241
      Top = 104
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. Carpeta'
    end
    object Label1: TLabel
      Left = 394
      Top = 6
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demandante'
    end
    object label2: TLabel
      Left = 397
      Top = 30
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demandado'
    end
    object label3: TLabel
      Left = 15
      Top = 104
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Car'#225'tula'
    end
    object lbJurisdiccion: TLabel
      Left = 1
      Top = 56
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jurisdicci'#243'n'
    end
    object Label18: TLabel
      Left = 428
      Top = 54
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fuero'
    end
    object Label19: TLabel
      Left = 16
      Top = 77
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Juzgado'
    end
    object Label20: TLabel
      Left = 405
      Top = 79
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Secretar'#237'a'
    end
    object Label4: TLabel
      Left = 24
      Top = 129
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label5: TLabel
      Left = 396
      Top = 129
      Width = 97
      Height = 13
      Caption = 'Motivo Regularizado'
    end
    inline fraCuentaBancaria: TfraStaticCodigoDescripcion
      Left = 60
      Top = 26
      Width = 330
      Height = 24
      TabOrder = 1
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TComboGrid
        Width = 267
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
    end
    inline fraBanco: TfraStaticCodigoDescripcion
      Left = 60
      Top = 2
      Width = 330
      Height = 24
      TabOrder = 0
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TComboGrid
        Width = 267
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
    end
    object edCarpeta: TIntEdit
      Left = 305
      Top = 100
      Width = 84
      Height = 21
      TabOrder = 9
      MaxLength = 8
      MaxValue = 99999999
    end
    object edDemandante: TEdit
      Left = 460
      Top = 2
      Width = 336
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDemandado: TEdit
      Left = 460
      Top = 26
      Width = 336
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edCaratula: TEdit
      Left = 61
      Top = 100
      Width = 175
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 60
      Top = 50
      Width = 330
      Height = 24
      TabOrder = 4
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
    inline fraFuero: TfraCodigoDescripcion
      Left = 459
      Top = 50
      Width = 339
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        339
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 274
      end
    end
    inline fraJuzgado: TfraCodigoDescripcion
      Left = 60
      Top = 75
      Width = 330
      Height = 24
      TabOrder = 6
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
    inline fraSecretaria: TfraCodigoDescripcion
      Left = 459
      Top = 75
      Width = 339
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DesignSize = (
        339
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 274
      end
    end
    object checkSoloActivos: TCheckBox
      Left = 393
      Top = 104
      Width = 80
      Height = 17
      Alignment = taLeftJustify
      Caption = 'S'#243'lo Activos'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object dcbEstado: TDBCheckCombo
      Left = 61
      Top = 125
      Width = 330
      Height = 21
      TabOrder = 11
      DataSource = dsEstados
      KeyField = 'EE_ID'
      ListField = 'ee_descripcion'
    end
    object dcbMotivoRegularizado: TDBCheckCombo
      Left = 498
      Top = 125
      Width = 298
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      DataSource = dsMotivosRegularizado
      KeyField = 'RE_ID'
      ListField = 're_descripcion'
    end
  end
  inherited CoolBar: TCoolBar
    Top = 160
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbSaldoEmbargos: TToolButton
        Left = 393
        Top = 0
        Hint = 'Saldo de Embargos'
        ImageIndex = 9
        OnClick = tbSaldoEmbargosClick
      end
      object tbLevantamiento: TToolButton
        Left = 416
        Top = 0
        Hint = 'Levantamiento'
        ImageIndex = 22
        OnClick = tbLevantamientoClick
      end
      object ToolButton1: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 189
    Width = 800
    Height = 392
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CARPETA'
        Title.Caption = 'Carpeta'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDANTE'
        Title.Caption = 'Demandante'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDADO'
        Title.Caption = 'Demandado'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOEMBARGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Embargado'
        Width = 99
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Retenido'
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OFICIO'
        Title.Caption = 'Oficio'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REPETIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Repetido'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_REGULARIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Regularizado'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_REGULARIZADO'
        Title.Caption = 'Motivo Regularizado'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 211
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'APLICADO'
        Title.Alignment = taCenter
        Title.Caption = 'Aplicado'
        Width = 69
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 69
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'INTERESES'
        Title.Alignment = taCenter
        Title.Caption = 'Intereses'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOJUICIO'
        Title.Caption = 'Tipo de Juicio '
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GPBA'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MALA_PRAXIS'
        Title.Alignment = taCenter
        Title.Caption = 'Mala Praxis'
        Width = 62
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 200
    Top = 232
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DE' +
        'MANDADO DEMANDADO, JT_CARATULA CARATULA,'
      
        '       JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DES' +
        'CRIPCION JUZGADO,'
      '       IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETARIA, '
      
        '       BA_NOMBRE BANCO, CB_NUMERO CUENTA, EM_IMPORTE IMPORTE, EM' +
        '_FECHA FECHA, '
      
        '       EM_OFICIO OFICIO, EE_DESCRIPCION ESTADO, EM_REPETIDO REPE' +
        'TIDO,'
      
        '       EM_FECHAREGULARIZADO FECHA_REGULARIZADO, RE_DESCRIPCION M' +
        'OTIVO_REGULARIZADO,'
      '       EM_OBSERVACIONES OBSERVACIONES'
      
        '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICIOENTRAMIT' +
        'E, LEGALES.LJU_JURISDICCION,'
      
        '       LEGALES.LFU_FUERO, LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTA' +
        'NCIA, LEGALES.LSC_SECRETARIA,'
      '       LRE_REGULARIZACIONEMBARGO, LEE_ESTADOEMBARGO, LEM_EMBARGO'
      ' WHERE EE_ID    = EM_IDESTADO'
      '   AND CB_ID(+) = EM_IDCUENTABANCARIA'
      '   AND BA_ID(+) = CB_IDBANCO'
      '   AND RE_ID(+) = EM_IDREGULARIZADO'
      '   AND JT_ID(+) = EM_IDJUICIO'
      '   AND IN_ID    = JZ_IDINSTANCIA'
      '   AND JU_ID    = NVL(JT_IDJURISDICCION,EM_IDJURISDICCION)'
      '   AND FU_ID    = NVL(JT_IDFUERO,EM_IDFUERO)'
      '   AND JZ_ID    = NVL(JT_IDJUZGADO,EM_IDJUZGADO)'
      '   AND SC_ID    = NVL(JT_IDSECRETARIA,EM_IDSECRETARIA)'
      '   AND 1 = 2')
    Top = 261
  end
  inherited dsConsulta: TDataSource
    Top = 261
  end
  inherited SortDialog: TSortDialog
    Top = 289
  end
  inherited ExportDialog: TExportDialog
    Top = 289
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Top = 317
  end
  inherited Seguridad: TSeguridad
    Top = 233
  end
  inherited FormStorage: TFormStorage
    Top = 233
  end
  inherited PrintDialog: TPrintDialog
    Top = 317
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end>
    Top = 233
  end
  inherited FieldHider: TFieldHider
    Top = 261
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ee_descripcion, ee_id'
      '    FROM lee_estadoembargo'
      'ORDER BY ee_descripcion')
    Left = 156
    Top = 120
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 188
    Top = 120
  end
  object sdqMotivosRegularizado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   re_descripcion, re_id'
      '    FROM lre_regularizacionembargo'
      'ORDER BY re_descripcion')
    Left = 612
    Top = 120
  end
  object dsMotivosRegularizado: TDataSource
    DataSet = sdqMotivosRegularizado
    Left = 644
    Top = 120
  end
end
