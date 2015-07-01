inherited frmListadoRecepcion: TfrmListadoRecepcion
  Width = 799
  Height = 599
  Caption = 'Listado Recepci'#243'n'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 791
    Height = 57
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Fecha Recibido'
    end
    object Label2: TLabel
      Left = 208
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 42
      Height = 13
      Caption = 'Proceso:'
    end
    object edFechaRecibido: TDateComboBox
      Left = 100
      Top = 4
      Width = 99
      Height = 21
      TabOrder = 0
    end
    object edFechaHasta: TDateComboBox
      Left = 244
      Top = 4
      Width = 99
      Height = 21
      TabOrder = 1
    end
    inline fraProceso: TfraCodigoDescripcion
      Left = 100
      Top = 28
      Width = 343
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 278
        DataSource = nil
      end
    end
    object tbEdicionAbogado: TToolBar
      Left = 453
      Top = 26
      Width = 31
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      object tbNuevoAbogado: TToolButton
        Left = 0
        Top = 0
        Hint = 'Modificar'
        ImageIndex = 15
        OnClick = tbNuevoAbogadoClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 791
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 787
      end>
    inherited ToolBar: TToolBar
      Width = 774
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
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
      object tbImprimirRecepcion: TToolButton
        Left = 416
        Top = 0
        Hint = 'Imprimir Recepci'#243'n'
        Caption = 'tbImprimirRecepcion'
        ImageIndex = 31
        OnClick = tbImprimirRecepcionClick
      end
      object tbListadoRecepcion: TToolButton
        Left = 439
        Top = 0
        Hint = 'Ingreso Fecha Recepci'#243'n UCAP'
        Caption = 'tbListadoRecepcion'
        ImageIndex = 24
        OnClick = tbListadoRecepcionClick
      end
      object tbsalir2: TToolButton
        Left = 462
        Top = 0
        Hint = 'Salir'
        Caption = 'tbsalir2'
        ImageIndex = 10
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 791
    Height = 486
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 20
        Visible = True
      end
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
  object fpListadoRecepcion: TFormPanel [3]
    Left = 274
    Top = 197
    Width = 257
    Height = 71
    Hint = 'Ingreso Fecha Recepci'#243'n UCAP'
    Caption = 'Cambio Estado Terminado'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      257
      71)
    object Bevel1: TBevel
      Left = 4
      Top = 35
      Width = 249
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 11
      Width = 138
      Height = 13
      Caption = 'Fecha de Recepcion(UCAP):'
    end
    object btnAceptarCambioTerminado: TButton
      Left = 95
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnAceptarCambioTerminadoClick
    end
    object btnCancel: TButton
      Left = 174
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edFechaRecepcionUcap: TDateEdit
      Left = 153
      Top = 7
      Width = 97
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
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
      '   AND os_fecha = TO_DATE ('#39'10/06/2009'#39', '#39'DD/MM/YYYY'#39')'
      '   AND os_idproceso IS NULL'
      '   AND 1 = 2')
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
        LinkControl = tbsalir2
      end>
    Left = 80
    Top = 260
  end
end
