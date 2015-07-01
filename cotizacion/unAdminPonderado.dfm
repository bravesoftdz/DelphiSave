inherited frmAdminPonderado: TfrmAdminPonderado
  Left = 340
  Top = 108
  Width = 672
  Height = 530
  Caption = 'Administraci'#243'n de Cotizaciones Ponderadas'
  Constraints.MinHeight = 530
  Constraints.MinWidth = 671
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 2
    Top = 88
    Width = 67
    Height = 13
    Caption = 'Seleccionadas'
  end
  object Label3: TLabel [1]
    Left = 3
    Top = 245
    Width = 53
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Disponibles'
  end
  inherited pnlFiltros: TPanel
    Top = 29
    Width = 664
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 664
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 660
      end>
    inherited ToolBar: TToolBar
      Width = 647
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object tbGuardar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Guardar (Ctrl + G)'
        Caption = 'tbGuardar'
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Left = 2
    Top = 261
    Width = 661
    Height = 240
    Align = alNone
    Anchors = [akLeft, akRight, akBottom]
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_NROCOTIZACION'
        Title.Caption = 'Nro. Cotizaci'#243'n'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 312
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_SUMAFIJA'
        Title.Caption = 'Costo Fijo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_PORCVARIABLE'
        Title.Caption = 'Costo Variable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_COSTOFINAL'
        Title.Caption = 'Costo Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_MASASALARIAL'
        Title.Caption = 'Masa Salarial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_COSTOSINIESTRAL'
        Title.Caption = 'Costo Siniestral'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_TASAINCIDENCIA'
        Title.Caption = 'Inicidencia'
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox [5]
    Left = 2
    Top = 29
    Width = 140
    Height = 46
    Caption = 'Ponderado'
    TabOrder = 3
    object Label1: TLabel
      Left = 13
      Top = 21
      Width = 21
      Height = 13
      Caption = 'Nro.'
    end
    object edPO_NROPONDERADO: TCardinalEdit
      Left = 36
      Top = 17
      Width = 98
      Height = 21
      TabOrder = 0
      OnKeyPress = edPO_NROPONDERADOKeyPress
      MaxLength = 9
    end
  end
  object gbFecha: TGroupBox [6]
    Left = 148
    Top = 29
    Width = 114
    Height = 46
    Caption = 'Fecha de Vigencia'
    TabOrder = 4
    object cmbPO_FECHAVIGENCIA: TDateComboBox
      Left = 14
      Top = 17
      Width = 88
      Height = 21
      TabOrder = 0
    end
  end
  object GridSeleccionadas: TArtDBGrid [7]
    Left = 2
    Top = 106
    Width = 661
    Height = 136
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSeleccionadas
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridSeleccionadasDblClick
    IniStorage = FormStorage
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CP_NROCOTIZACION'
        Title.Caption = 'Nro. Cotizaci'#243'n'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 312
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_SUMAFIJA'
        Title.Caption = 'Costo Fijo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_PORCVARIABLE'
        Title.Caption = 'Costo Variable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_COSTOFINAL'
        Title.Caption = 'Costo Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_MASASALARIAL'
        Title.Caption = 'Masa Salarial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_COSTOSINIESTRAL'
        Title.Caption = 'Costo Siniestral'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_TASAINCIDENCIA'
        Title.Caption = 'Incidencia'
        Visible = True
      end>
  end
  object gbTarifa: TGroupBox [8]
    Left = 268
    Top = 29
    Width = 396
    Height = 71
    Caption = 'Tarifa Sugerida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Label13: TLabel
      Left = 31
      Top = 19
      Width = 48
      Height = 13
      Caption = 'Costo Fijo'
    end
    object Label14: TLabel
      Left = 9
      Top = 46
      Width = 69
      Height = 13
      Caption = 'Costo Variable'
    end
    object Label15: TLabel
      Left = 215
      Top = 34
      Width = 61
      Height = 13
      Caption = 'Costo Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel3: TBevel
      Left = 199
      Top = 25
      Width = 12
      Height = 31
      Shape = bsLeftLine
    end
    object edPO_SUMAFIJAFINAL: TCurrencyEdit
      Left = 81
      Top = 16
      Width = 112
      Height = 21
      AutoSize = False
      MaxLength = 12
      TabOrder = 0
    end
    object edPO_PORCVARIABLEFINAL: TCurrencyEdit
      Left = 81
      Top = 42
      Width = 112
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '% ,0.0000;% -,0.0000'
      MaxLength = 12
      TabOrder = 1
    end
    object edPO_COSTOFINAL: TCurrencyEdit
      Left = 284
      Top = 29
      Width = 105
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 12
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CO_ID, CO_NROCOTIZACION, CO_CUIT, CO_RAZONSOCIAL, TC_SUMA' +
        'FIJA, TC_PORCVARIABLE, TC_COSTOFINAL,'
      
        '              AC_CODIGO, AC_DESCRIPCION, CO_IDACTIVIDAD, CO_CANT' +
        'TRABAJADOR, CO_MASASALARIAL, CO_COSTOSINIESTRAL, CO_TASAINCIDENC' +
        'IA  '
      '  FROM ACO_COTIZACION, ATC_TARIFACOBRAR, CAC_ACTIVIDAD'
      ' WHERE TC_IDCOTIZACION = CO_ID'
      '   AND AC_ID = CO_IDACTIVIDAD'
      '   AND TC_ID IN ( SELECT MAX(TC_ID)'
      #9#9'  '#9'     FROM ATC_TARIFACOBRAR'
      #9#9#9' GROUP BY TC_IDCOTIZACION)')
    Top = 335
  end
  inherited dsConsulta: TDataSource
    Top = 335
  end
  inherited SortDialog: TSortDialog
    Top = 363
  end
  inherited ExportDialog: TExportDialog
    Top = 363
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Top = 391
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Top = 307
  end
  inherited FormStorage: TFormStorage
    Top = 307
  end
  inherited PrintDialog: TPrintDialog
    Top = 391
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
    Top = 307
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Top = 335
  end
  object sdqSeleccionadas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 23
    Top = 122
  end
  object dsSeleccionadas: TDataSource
    DataSet = sdqSeleccionadas
    Left = 51
    Top = 122
  end
end
