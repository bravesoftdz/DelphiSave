inherited frmServiciosAEmpresas: TfrmServiciosAEmpresas
  Left = 383
  Top = 201
  Width = 576
  Height = 404
  Caption = 'Listado de Servicios a Empresas'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 568
    Height = 34
    object Label1: TLabel
      Left = 5
      Top = 12
      Width = 57
      Height = 13
      Caption = 'Prestadora:'
    end
    inline fraES_IDPRESTADORA: TfraCodigoDescripcion
      Left = 66
      Top = 4
      Width = 497
      Height = 23
      TabOrder = 0
      DesignSize = (
        497
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 432
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 34
    Width = 568
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 564
      end>
    inherited ToolBar: TToolBar
      Width = 551
      inherited tbPropiedades: TToolButton
        Hint = 'Generar Reportes'
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 63
    Width = 568
    Height = 265
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_DESCRIPCION'
        Title.Caption = 'Prestadora'
        Width = 200
        Visible = True
      end>
  end
  object fpSeleccionarPeriodo: TFormPanel [3]
    Left = 128
    Top = 212
    Width = 165
    Height = 86
    Caption = 'Seleccione el Per'#237'odo'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpSeleccionarPeriodoBeforeShow
    DesignSize = (
      165
      86)
    object BevelAbm: TBevel
      Left = 4
      Top = 50
      Width = 157
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 22
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Per'#237'odo:'
    end
    object btnAceptarPeriodo: TButton
      Left = 26
      Top = 56
      Width = 63
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarPeriodoClick
    end
    object btnCancelarPeriodo: TButton
      Left = 95
      Top = 56
      Width = 63
      Height = 22
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object ppPeriodo: TPeriodoPicker
      Left = 68
      Top = 17
      Width = 61
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 1
      Periodo.Ano = 2013
      Periodo.Valor = '2013/01'
      Periodo.MaxPeriodo = '2063/01'
      Periodo.MinPeriodo = '1963/01'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  object pnlEspere: TPanel [4]
    Left = 0
    Top = 328
    Width = 568
    Height = 23
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object ProgressBar: TProgressBar [5]
    Left = 0
    Top = 351
    Width = 568
    Height = 23
    Align = alBottom
    Max = 1000
    Position = 50
    Smooth = True
    TabOrder = 5
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT es_id, es_idempresa, es_idprestadora, ep_descripcion, '
      '       es_fechabaja, em_nombre, em_cuit '
      
        '  FROM art.aes_empresaservicio, art.aep_empresaprestadora, afi.a' +
        'em_empresa'
      ' WHERE es_idprestadora = ep_id '
      '   AND em_id = es_idempresa'
      '   AND es_fechabaja is null'
      '')
    object sdqConsultaES_ID: TFloatField
      FieldName = 'ES_ID'
      Required = True
    end
    object sdqConsultaES_IDEMPRESA: TFloatField
      FieldName = 'ES_IDEMPRESA'
      Required = True
    end
    object sdqConsultaES_IDPRESTADORA: TFloatField
      FieldName = 'ES_IDPRESTADORA'
      Required = True
    end
    object sdqConsultaEP_DESCRIPCION: TStringField
      FieldName = 'EP_DESCRIPCION'
      Required = True
      Size = 300
    end
    object sdqConsultaES_FECHABAJA: TDateTimeField
      FieldName = 'ES_FECHABAJA'
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
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
  object ShortCutControlHijo: TShortCutControl
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
    Left = 80
    Top = 200
  end
end
