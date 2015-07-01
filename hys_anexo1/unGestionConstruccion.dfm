inherited frmGestionConstruccion: TfrmGestionConstruccion
  Left = 313
  Top = 129
  Width = 692
  Height = 545
  ActiveControl = edFechaReclamoDesde
  Caption = 'Gesti'#243'n Construcci'#243'n'
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 684
    Height = 132
    Visible = True
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 684
      Height = 132
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'B'#250'squeda'
        DesignSize = (
          676
          104)
        object lblRiesgos: TLabel
          Left = 349
          Top = 11
          Width = 55
          Height = 13
          Caption = 'Resoluci'#243'n:'
        end
        object Label6: TLabel
          Left = 351
          Top = 37
          Width = 64
          Height = 13
          Caption = 'Observaci'#243'n:'
        end
        object rgAvisodeObra: TRadioGroup
          Left = 4
          Top = 2
          Width = 339
          Height = 50
          Caption = ' Falta de '
          Columns = 2
          Items.Strings = (
            'Programa de Seguridad'
            'Aviso de Inicio de Obra')
          TabOrder = 0
          OnClick = rgAvisodeObraClick
        end
        inline fraResolucion: TfraCodigoDescripcion
          Left = 428
          Top = 7
          Width = 245
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DesignSize = (
            245
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 180
            DataSource = nil
          end
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 56
          Width = 338
          Height = 48
          Caption = ' Fecha Reclamo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label4: TLabel
            Left = 102
            Top = 24
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object edFechaReclamoDesde: TDateComboBox
            Left = 8
            Top = 20
            Width = 88
            Height = 21
            TabOrder = 0
          end
          object edFechaReclamoHasta: TDateComboBox
            Left = 124
            Top = 20
            Width = 88
            Height = 21
            DialogTitle = 'Seleccione Fecha '
            TabOrder = 1
          end
        end
        object cbSinReclamos: TCheckBox
          Left = 584
          Top = 72
          Width = 84
          Height = 21
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Sin Reclamos'
          TabOrder = 5
        end
        inline fraObservacionFiltro: TfraCodigoDescripcion
          Left = 428
          Top = 31
          Width = 245
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          DesignSize = (
            245
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 180
            DataSource = nil
          end
          inherited edCodigo: TPatternEdit
            Width = 61
          end
        end
        object GroupBox2: TGroupBox
          Left = 347
          Top = 56
          Width = 218
          Height = 48
          Caption = ' Fecha Vencimiento '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object Label7: TLabel
            Left = 101
            Top = 23
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object edFechaVencimientoDesde: TDateComboBox
            Left = 7
            Top = 19
            Width = 88
            Height = 21
            TabOrder = 0
          end
          object edFechaVencimientoHasta: TDateComboBox
            Left = 121
            Top = 18
            Width = 88
            Height = 21
            DialogTitle = 'Seleccione Fecha '
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Filtros'
        ImageIndex = 1
        DesignSize = (
          676
          104)
        object Label19: TLabel
          Left = 6
          Top = 11
          Width = 24
          Height = 13
          Caption = 'CUIT'
        end
        object Label14: TLabel
          Left = 5
          Top = 36
          Width = 31
          Height = 13
          Caption = 'Estab.'
        end
        object Label16: TLabel
          Left = 231
          Top = 36
          Width = 71
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nombre Estab.'
        end
        object Label3: TLabel
          Left = 5
          Top = 60
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 73
          Top = 5
          Width = 596
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          inherited lbContrato: TLabel
            Left = 492
          end
          inherited edContrato: TIntEdit
            Left = 539
          end
          inherited cmbRSocial: TArtComboBox
            Width = 357
          end
        end
        object edEstablecimiento: TPatternEdit
          Left = 73
          Top = 32
          Width = 151
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Pattern = '1234567890-,'
        end
        object edNombreEstableci: TPatternEdit
          Left = 307
          Top = 32
          Width = 362
          Height = 21
          Anchors = [akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 2
        end
        inline fraTipoFiltroSRT: TfraCtbTablas
          Left = 72
          Top = 57
          Width = 271
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          DesignSize = (
            271
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 64
            Width = 205
          end
          inherited edCodigo: TPatternEdit
            Width = 59
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 132
    Width = 684
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 680
      end>
    inherited ToolBar: TToolBar
      Width = 667
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Hint = 'Imprimir(Ctrl+I)'
        DropdownMenu = pmnuOrden
        Style = tbsDropDown
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
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
      end
      object ToolButton1: TToolButton
        Left = 383
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 391
        Top = 0
        Hint = 'Invertir Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodos: TToolButton
        Left = 414
        Top = 0
        Hint = 'Seleccionar Todos'
        Caption = 'tbSeleccionarTodos'
        ImageIndex = 46
        OnClick = tbSeleccionarTodosClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 161
    Width = 684
    Height = 357
    Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
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
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro Establecimiento'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHARECLAMO'
        Title.Caption = 'Fecha Reclamo'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OR_DESCRIPCION'
        Title.Caption = 'Detalle Reclamo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAVENC'
        Title.Caption = 'Fecha Vencimiento Programa'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_TELEFONOS'
        Title.Caption = 'Tel'#233'fono Empresa'
        Width = 137
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 128
    Top = 200
    Width = 449
    Height = 235
    DesignSize = (
      449
      235)
    inherited BevelAbm: TBevel
      Top = 199
      Width = 441
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 17
      Width = 72
      Height = 13
      Caption = 'Fecha Reclamo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 43
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 294
      Top = 205
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 369
      Top = 205
      TabOrder = 5
    end
    object edFecha: TDateComboBox
      Left = 88
      Top = 12
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object edObservacion: TRichEdit
      Left = 88
      Top = 68
      Width = 354
      Height = 126
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
    end
    inline fraObservacion: TfraCodigoDescripcion
      Left = 87
      Top = 39
      Width = 355
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        355
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 290
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 61
      end
    end
    object cbImprimirReclamos: TCheckBox
      Left = 184
      Top = 12
      Width = 109
      Height = 21
      Caption = 'Imprimir Reclamos'
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT aem.em_nombre, es_nombre,'
      '       NVL (es_domicilio,'
      '            art.afi.armar_domicilio (es_calle,'
      '                                     es_numero,'
      '                                     es_piso,'
      '                                     es_departamento,'
      '                                     es_localidad'
      '                                    )'
      '           ) AS domicilio,'
      '       es_localidad, es_provincia, pv_descripcion, ao_id as id,'
      
        '       ao_fechareclamo AS fechareclamo, co_contrato, em_cuit, es' +
        '_nroestableci,'
      
        '       or_descripcion, ao_observacionesreclamo as observacion, A' +
        'O_FECHAVENCPROG as fechavenc,'
      '       dc_telefonos, ao_tipo tipo'
      '  FROM afi.aem_empresa aem,'
      '       afi.aco_contrato aco,'
      '       afi.aes_establecimiento aes,'
      '       afi.adc_domiciliocontrato,'
      '       art.pao_avisoobra,'
      '       art.cpv_provincias,'
      '       hys.hor_observacionreclamo'
      ' WHERE 1= 2')
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqConsultaES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaES_PROVINCIA: TStringField
      FieldName = 'ES_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqConsultaPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqConsultaFECHARECLAMO: TDateTimeField
      FieldName = 'FECHARECLAMO'
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaES_NROESTABLECI: TFloatField
      FieldName = 'ES_NROESTABLECI'
      Required = True
    end
    object sdqConsultaOR_DESCRIPCION: TStringField
      FieldName = 'OR_DESCRIPCION'
      Size = 150
    end
    object sdqConsultaOBSERVACION: TStringField
      FieldName = 'OBSERVACION'
      Size = 2000
    end
    object sdqConsultaFECHAVENC: TDateTimeField
      FieldName = 'FECHAVENC'
    end
    object sdqConsultaID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object sdqConsultaDC_TELEFONOS: TStringField
      FieldName = 'DC_TELEFONOS'
      Size = 60
    end
    object sdqConsultaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 5
    end
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object pmnuOrden: TPopupMenu
    Left = 80
    Top = 256
    object mnuOrdSinOrdenRec: TMenuItem
      Caption = 'Imprimir Grilla'
      OnClick = mnuOrdSinOrdenRecClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuOrdEmpresa: TMenuItem
      Tag = 2
      Caption = 'Imprimir Formularios Seleccionados'
      OnClick = mnuOrdEmpresaClick
    end
  end
end
