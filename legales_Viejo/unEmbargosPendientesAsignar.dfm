inherited frmEmbargosPendientesAsignar: TfrmEmbargosPendientesAsignar
  Left = 351
  Top = 430
  Width = 613
  Height = 370
  ActiveControl = checkSoloActivos
  Caption = 'Administraci'#243'n de Embargos'
  Constraints.MinHeight = 370
  Constraints.MinWidth = 613
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 605
    Height = 96
    DesignSize = (
      605
      96)
    object GroupBox1: TGroupBox
      Left = 5
      Top = 4
      Width = 120
      Height = 44
      TabOrder = 0
      object checkSoloActivos: TCheckBox
        Left = 8
        Top = 16
        Width = 96
        Height = 17
        Alignment = taLeftJustify
        Caption = 'S'#243'lo Sin Asignar'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 288
      Top = 4
      Width = 316
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Estado '
      TabOrder = 2
      DesignSize = (
        316
        44)
      object dcbEstado: TDBCheckCombo
        Left = 12
        Top = 16
        Width = 292
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstados
        KeyField = 'EE_ID'
        ListField = 'ee_descripcion'
      end
    end
    object GroupBox3: TGroupBox
      Left = 375
      Top = 48
      Width = 228
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Motivo Regularizado '
      TabOrder = 5
      DesignSize = (
        228
        44)
      object dcbMotivoRegularizado: TDBCheckCombo
        Left = 12
        Top = 16
        Width = 206
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsMotivosRegularizado
        KeyField = 'RE_ID'
        ListField = 're_descripcion'
      end
    end
    object GroupBox4: TGroupBox
      Left = 129
      Top = 4
      Width = 155
      Height = 44
      TabOrder = 1
      object checkNoDadosBaja: TCheckBox
        Left = 8
        Top = 16
        Width = 136
        Height = 17
        Alignment = taLeftJustify
        Caption = 'S'#243'lo No Dados de Baja'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 161
      Top = 48
      Width = 212
      Height = 44
      Caption = ' Fecha de Alta'
      TabOrder = 4
      object Label1: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFAltaDesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFAltaHasta
        TabOrder = 0
      end
      object edFAltaHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFAltaDesde
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 4
      Top = 48
      Width = 154
      Height = 44
      TabOrder = 3
      object lbNroJuicio: TLabel
        Left = 4
        Top = 20
        Width = 60
        Height = 13
        Caption = 'Nro Carpeta:'
      end
      object edNroCarpeta: TIntEdit
        Left = 68
        Top = 16
        Width = 81
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Alignment = taRightJustify
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 96
    Width = 605
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 601
      end>
    inherited ToolBar: TToolBar
      Width = 588
      inherited tbModificar: TToolButton
        Hint = 'Asignar (Ctrl+M)'
        DropdownMenu = pmuTipoJuicio
        ImageIndex = 26
        Style = tbsDropDown
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Left = 90
      end
      inherited ToolButton4: TToolButton
        Left = 113
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Left = 121
      end
      inherited ToolButton3: TToolButton
        Left = 144
      end
      inherited tbLimpiar: TToolButton
        Left = 152
      end
      inherited tbOrdenar: TToolButton
        Left = 175
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 198
      end
      inherited ToolButton6: TToolButton
        Left = 221
      end
      inherited tbImprimir: TToolButton
        Left = 229
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbEmbargoSinJuicio: TToolButton
        Left = 383
        Top = 0
        Hint = 'Embargo Sin Juicio'
        Caption = 'tbEmbargoSinJuicio'
        Enabled = False
        ImageIndex = 23
        OnClick = tbEmbargoSinJuicioClick
      end
      object tbModificar2: TToolButton
        Left = 406
        Top = 0
        Hint = 'Modificar'
        Caption = 'Modificar'
        Enabled = False
        ImageIndex = 7
        OnClick = tbModificar2Click
      end
      object tbSumatoria: TToolButton
        Left = 429
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 452
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 460
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 125
    Width = 605
    Height = 217
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnDblClick = tbModificar2Click
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CARPETA'
        Title.Caption = 'Carpeta'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDANTE'
        Title.Caption = 'Demandante'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDADO'
        Title.Caption = 'Demandado'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 75
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
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 89
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APLICADO'
        Title.Caption = 'Aplicado'
        Width = 244
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Saldo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OFICIO'
        Title.Caption = 'Oficio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPETIDO'
        Title.Caption = 'Repetido'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_REGULARIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Regularizado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_REGULARIZADO'
        Title.Caption = 'Motivo Regularizado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_JUICIO'
        Title.Caption = 'Tipo de Juicio'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Alta'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GPBA'
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end>
  end
  object fpModificar: TFormPanel [3]
    Left = 124
    Top = 124
    Width = 277
    Height = 205
    Caption = 'Modificar'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      277
      205)
    object Bevel1: TBevel
      Left = 4
      Top = 169
      Width = 269
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblRepetido: TLabel
      Left = 20
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Repetido'
    end
    object lblObservaciones: TLabel
      Left = 20
      Top = 49
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnAceptar: TButton
      Left = 119
      Top = 175
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 197
      Top = 175
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object mObservaciones: TMemo
      Left = 20
      Top = 67
      Width = 237
      Height = 89
      MaxLength = 399
      TabOrder = 2
    end
    object chkRepetido: TCheckBox
      Left = 76
      Top = 19
      Width = 97
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
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
      end>
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
        LinkControl = tbModificar2
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
        Key = 16449
        LinkControl = tbModificar
      end>
    Left = 108
    Top = 200
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ee_descripcion, ee_id'
      '    FROM lee_estadoembargo'
      'ORDER BY ee_descripcion')
    Left = 342
    Top = 16
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 370
    Top = 16
  end
  object sdqMotivosRegularizado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   re_descripcion, re_id'
      '    FROM lre_regularizacionembargo'
      'ORDER BY re_descripcion')
    Left = 342
    Top = 56
  end
  object dsMotivosRegularizado: TDataSource
    DataSet = sdqMotivosRegularizado
    Left = 370
    Top = 56
  end
  object pmuTipoJuicio: TPopupMenu
    Left = 28
    Top = 176
    object pmuParteActora: TMenuItem
      Caption = 'Parte Actora'
      OnClick = pmnParteDemandadaClick
    end
    object pmnParteDemandada: TMenuItem
      Caption = 'Parte Demandada'
      OnClick = pmnParteDemandadaClick
    end
  end
end
