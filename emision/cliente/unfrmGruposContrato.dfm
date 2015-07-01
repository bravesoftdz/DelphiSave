inherited FrmGruposContrato: TFrmGruposContrato
  Left = 230
  Top = 183
  Width = 710
  Caption = 'Grupos de Contratos Emisi'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 702
    Height = 69
    Visible = True
    DesignSize = (
      702
      69)
    object gbFiltros: TGroupBox
      Left = 2
      Top = -2
      Width = 699
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object lblFiltroGrupo: TLabel
        Left = 9
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Grupo:'
      end
      object lblFiltroPeriodo: TLabel
        Left = 344
        Top = 17
        Width = 117
        Height = 13
        Caption = 'Vigentes entre Per'#237'odos:'
      end
      object lblPeriodoHasta: TLabel
        Left = 516
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      inline fraGrupo: TfraCodigoDescripcionExt
        Left = 44
        Top = 14
        Width = 281
        Height = 23
        TabOrder = 0
        DesignSize = (
          281
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 216
        end
      end
      object ppPeriodoVigenciaDesde: TPeriodoPicker
        Left = 463
        Top = 13
        Width = 49
        Height = 20
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '2055/06'
        Periodo.MinPeriodo = '1955/06'
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
      object ppPeriodoVigenciaHasta: TPeriodoPicker
        Left = 530
        Top = 13
        Width = 49
        Height = 20
        TabOrder = 2
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '2055/06'
        Periodo.MinPeriodo = '1955/06'
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
      inline fraContrato: TfraEmpresa
        Left = 44
        Top = 38
        Width = 584
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        DesignSize = (
          584
          26)
        inherited lbRSocial: TLabel
          Left = 84
        end
        inherited lbContrato: TLabel
          Left = 392
        end
        inherited mskCUIT: TMaskEdit
          Left = 1
          Width = 77
        end
        inherited edContrato: TIntEdit
          Left = 437
          Top = 2
          Width = 77
        end
        inherited cmbRSocial: TArtComboBox
          Left = 128
          Width = 253
          DataSource = nil
        end
        inherited sdqDatos: TSDQuery
          Left = 200
          Top = 0
        end
        inherited dsDatos: TDataSource
          Left = 244
          Top = 0
        end
      end
      object lblFiltroCuit: TStaticText
        Left = 9
        Top = 41
        Width = 29
        Height = 17
        Caption = 'CUIT'
        TabOrder = 4
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 69
    Width = 702
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 698
      end>
    inherited ToolBar: TToolBar
      Width = 685
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
      inherited tbPropiedades: TToolButton
        Hint = 'Administraci'#243'n de Grupos'
        Caption = 'Administrar Grupos'
        ImageIndex = 35
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbDevengado: TToolButton
        Left = 370
        Top = 0
        Caption = 'tbDevengado'
        ImageIndex = 19
        OnClick = tbDevengadoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 98
    Width = 702
    Height = 341
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Grupo'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_PERIODOVIGENCIADESDE'
        Title.Caption = 'Period.Vig.Desde'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_PERIODOVIGENCIAHASTA'
        Title.Caption = 'Period.Vig.Hasta'
        Width = 90
        Visible = True
      end>
  end
  object fpDevengadoMensual: TFormPanel [3]
    Left = 382
    Top = 232
    Width = 413
    Height = 169
    Caption = 'Proceso Devengado Mensual'
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      413
      169)
    object lblPeriodo: TLabel
      Left = 8
      Top = 44
      Width = 99
      Height = 13
      Caption = 'Periodo A Devengar:'
    end
    object lblObservacionesDevengado: TLabel
      Left = 10
      Top = 66
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblNota: TLabel
      Left = 10
      Top = 218
      Width = 357
      Height = 26
      Caption = 
        'Nota: Se generar'#225' Devengado Mensual, Real y Estimado para los pe' +
        'riodos anteriores a Per'#237'odo'
      WordWrap = True
    end
    object Bevel1: TBevel
      Left = 4
      Top = 211
      Width = 402
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 32
      Height = 13
      Caption = 'Grupo:'
    end
    object btnAceptarDevengadoMensual: TButton
      Left = 242
      Top = 119
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
    end
    object btnCancelarDevengadoMensual: TButton
      Left = 325
      Top = 119
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object ppPeriodoDevengadoMensual: TPeriodoPicker
      Left = 116
      Top = 41
      Width = 49
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 6
      Periodo.Ano = 2005
      Periodo.Valor = '2005/06'
      Periodo.MaxPeriodo = '2055/06'
      Periodo.MinPeriodo = '1955/06'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
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
    object mObservacionesProcesoDevengado: TMemo
      Left = 115
      Top = 66
      Width = 278
      Height = 41
      TabOrder = 3
    end
    object sbDevengadoMensual: TStatusBar
      Left = 0
      Top = 150
      Width = 413
      Height = 19
      Panels = <>
      SimpleText = ' Nivel Requerido: Supervisor o superior'
    end
    object edtGrupo: TEdit
      Left = 115
      Top = 16
      Width = 283
      Height = 21
      Color = 10930928
      TabOrder = 5
    end
  end
  object fpGrupo: TFormPanel [4]
    Left = 104
    Top = 104
    Width = 481
    Height = 169
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      481
      169)
    object Bevel2: TBevel
      Left = 4
      Top = 133
      Width = 473
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarGrupo: TButton
      Left = 323
      Top = 139
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelarGrupo: TButton
      Left = 401
      Top = 139
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarGrupoClick
    end
    object GroupBox1: TGroupBox
      Left = 230
      Top = 4
      Width = 241
      Height = 123
      Caption = ' Detalle  de Grupo '
      TabOrder = 2
      object chkEmisionInmediata: TCheckBox
        Left = 11
        Top = 24
        Width = 224
        Height = 17
        Caption = 'Emisi'#243'n Inmediata (Al llegar una novedad)'
        TabOrder = 0
        OnClick = chkEmisionInmediataClick
      end
      object chkGeneraFondo: TCheckBox
        Left = 11
        Top = 52
        Width = 227
        Height = 22
        Caption = 'Genera Fondo (560)'
        TabOrder = 1
        OnClick = chkGeneraFondoClick
      end
      object chkPermiteDevengarIndividual: TCheckBox
        Left = 11
        Top = 79
        Width = 226
        Height = 33
        Caption = 'Permite Devengar Individualmente Contratos'
        TabOrder = 2
        WordWrap = True
        OnClick = chkPermiteDevengarIndividualClick
      end
    end
    object lvGrupos: TListView
      Left = 14
      Top = 10
      Width = 209
      Height = 116
      Columns = <
        item
          Caption = 'Nombre Grupo'
          Width = 200
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ShowWorkAreas = True
      TabOrder = 3
      ViewStyle = vsReport
      OnChange = lvGruposChange
      OnClick = lvGruposClick
    end
  end
  inherited fpAbm: TFormPanel
    Left = 176
    Top = 68
    Width = 481
    Height = 169
    DesignSize = (
      481
      169)
    inherited BevelAbm: TBevel
      Top = 133
      Width = 473
    end
    object lblVigencia: TLabel [1]
      Left = 10
      Top = 88
      Width = 44
      Height = 13
      Caption = 'Vigencia:'
    end
    object lblVigenciaHasta: TLabel [2]
      Left = 127
      Top = 88
      Width = 29
      Height = 13
      Caption = 'hasta:'
    end
    inherited btnAceptar: TButton
      Left = 323
      Top = 139
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 401
      Top = 139
      TabOrder = 7
    end
    inline fraContratoAsignar: TfraEmpresa
      Left = 65
      Top = 33
      Width = 434
      Height = 45
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      DesignSize = (
        434
        45)
      inherited lbRSocial: TLabel
        Left = 91
      end
      inherited lbContrato: TLabel
        Left = -124
        Top = 26
      end
      inherited mskCUIT: TMaskEdit
        Left = 3
        Width = 85
      end
      inherited edContrato: TIntEdit
        Left = 3
        Top = 24
        Width = 85
      end
      inherited cmbRSocial: TArtComboBox
        Left = 135
        Width = 268
        DataSource = nil
      end
      inherited sdqDatos: TSDQuery
        Left = 200
        Top = 0
      end
      inherited dsDatos: TDataSource
        Left = 244
        Top = 0
      end
    end
    object lblCUIT: TStaticText
      Left = 9
      Top = 36
      Width = 29
      Height = 17
      Caption = 'CUIT'
      TabOrder = 0
    end
    object lblContrato: TStaticText
      Left = 9
      Top = 60
      Width = 47
      Height = 17
      Caption = 'Contrato:'
      TabOrder = 1
    end
    object ppVigenciaPertenciaDesde: TPeriodoPicker
      Left = 68
      Top = 85
      Width = 49
      Height = 20
      TabOrder = 4
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 1
      Periodo.Ano = 1996
      Periodo.Valor = '199601'
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '199601'
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
    object ppVigenciaPertenciaHasta: TPeriodoPicker
      Left = 165
      Top = 85
      Width = 49
      Height = 20
      TabOrder = 5
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '199601'
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
    inline fraGrupoAsignar: TfraCodigoDescripcionExt
      Left = 68
      Top = 7
      Width = 401
      Height = 23
      TabOrder = 2
      DesignSize = (
        401
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 336
        DataSource = nil
      end
    end
    object StaticText1: TStaticText
      Left = 9
      Top = 12
      Width = 33
      Height = 17
      Caption = 'Grupo'
      TabOrder = 8
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT * FROM emi.igc_grupoemisioncontrato igc, emi.ige_grupoemi' +
        'sion ige'
      'WHERE igc.gc_idgrupoemision = ige.ge_id AND 1 = 2'
      '')
    Top = 284
  end
  inherited dsConsulta: TDataSource
    Top = 284
  end
  inherited SortDialog: TSortDialog
    Top = 312
  end
  inherited ExportDialog: TExportDialog
    Top = 312
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Top = 340
  end
  inherited Seguridad: TSeguridad
    Top = 256
  end
  inherited FormStorage: TFormStorage
    Top = 256
  end
  inherited PrintDialog: TPrintDialog
    Top = 340
  end
  inherited ShortCutControl: TShortCutControl
    Top = 256
  end
  inherited FieldHider: TFieldHider
    Top = 284
  end
end
