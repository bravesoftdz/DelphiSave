inherited frmProcesosRecepcion: TfrmProcesosRecepcion
  Left = 409
  Top = 193
  Width = 711
  Height = 450
  Caption = 'Procesos Recepci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 703
    Height = 29
    Visible = True
    object lbProceso: TLabel
      Left = 8
      Top = 7
      Width = 75
      Height = 13
      Caption = 'Fecha Proceso:'
    end
    object lbHasta: TLabel
      Left = 200
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object edFechaProcesoDesde: TDateEdit
      Left = 93
      Top = 3
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edFechaProcesoHasta: TDateEdit
      Left = 233
      Top = 3
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 29
    Width = 703
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 699
      end>
    inherited ToolBar: TToolBar
      Width = 686
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Hint = 'Previsualizar'
        ImageIndex = 16
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 370
        Top = 0
        Hint = 'Invertir Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 37
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 38
        OnClick = tbSeleccionarTodoClick
      end
      object tbSeparator: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'tbSeparator'
        ImageIndex = 32
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 58
    Width = 703
    Height = 336
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LR_ID'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LR_FECHA'
        Title.Caption = 'Fecha Proceso'
        Width = 154
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 394
    Width = 703
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      703
      29)
    object btnAceptarSel: TButton
      Left = 550
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarSelClick
    end
    object Button2: TButton
      Left = 626
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 546
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited fpAbm: TFormPanel
    Left = 128
    Top = 88
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 461
      Height = 225
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object GridListado: TArtDBGrid
        Left = 0
        Top = 0
        Width = 461
        Height = 225
        Align = alClient
        DataSource = dsListadoRecepcion
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridCellClick
        OnDrawColumnCell = GridDrawColumnCell
        OnDblClick = GridDblClick
        OnKeyDown = GridKeyDown
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Empresa'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_NROESTABLECI'
            Title.Caption = 'Nro. Establecimiento'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EL_IDLOTE'
            Title.Caption = 'Lote'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIVO'
            Title.Caption = 'Operativo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OS_FECHA'
            Title.Caption = 'Fecha de Recibido'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_IDENTIFICADOR'
            Title.Caption = 'Codigo Prestador'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_DESCRIPCION'
            Title.Caption = 'Prestador'
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OS_FECHARECEPCIONUCAP'
            Title.Caption = 'Fecha Recep. UCAP'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RES'
            Title.Caption = 'Res'
            Width = 35
            Visible = True
          end>
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT *'
      '    FROM hys.hlr_listadorecepcion'
      ' WHERE 1 = 2')
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaLR_ID: TFloatField
      FieldName = 'LR_ID'
      Required = True
    end
    object sdqConsultaLR_FECHA: TDateTimeField
      FieldName = 'LR_FECHA'
    end
    object sdqConsultaLR_USUALTA: TStringField
      FieldName = 'LR_USUALTA'
    end
    object sdqConsultaLR_FECHAALTA: TDateTimeField
      FieldName = 'LR_FECHAALTA'
    end
    object sdqConsultaLR_USUMODIF: TStringField
      FieldName = 'LR_USUMODIF'
    end
    object sdqConsultaLR_FECHAMODIF: TDateTimeField
      FieldName = 'LR_FECHAMODIF'
    end
    object sdqConsultaLR_USUBAJA: TStringField
      FieldName = 'LR_USUBAJA'
    end
    object sdqConsultaLR_FECHABAJA: TDateTimeField
      FieldName = 'LR_FECHABAJA'
    end
  end
  object dsListadoRecepcion: TDataSource
    DataSet = sdqListadoRecepcion
    Left = 52
    Top = 172
  end
  object sdqListadoRecepcion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT em_nombre, el_idlote,'
      
        '       el_operativo || '#39' '#39' || TO_CHAR (le_fechanotificacion, '#39'YY' +
        #39') operativo,'
      
        '       os_fecha, os_id, es_nroestableci, ca_identificador, ca_de' +
        'scripcion,'
      '       os_fecharecepcionucap,'
      '       DECODE (os_idtipoobservacion, 6, '#39'R'#39', '#39#39') res'
      '  FROM hys.hel_estadolote,'
      '       afi.aem_empresa,'
      '       afi.aco_contrato,'
      '       afi.aes_establecimiento,'
      '       hys.hle_loteestudio,'
      '       art.cpr_prestador,'
      '       hys.hos_observacionessublote'
      ' WHERE el_idlote = os_idlote'
      '   AND os_idtipoobservacion + 0 IN (8, 6)'
      '   AND em_id = co_idempresa'
      '   AND es_contrato = co_contrato'
      '   AND es_id = os_idestableci'
      '   AND le_id = el_idlote'
      '   AND ca_identificador = le_idprestador'
      '   AND NVL (el_operativo, '#39' '#39') <> '#39'R'#39
      '   AND os_idproceso = :idproceso'
      ''
      '')
    Left = 24
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idproceso'
        ParamType = ptInput
      end>
  end
end
