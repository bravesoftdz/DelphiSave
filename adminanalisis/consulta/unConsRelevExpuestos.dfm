inherited frmConsExpuestos: TfrmConsExpuestos
  Left = 161
  Top = 204
  Width = 860
  Height = 587
  Caption = 'Consulta de Expuestos'
  Constraints.MinHeight = 429
  Constraints.MinWidth = 646
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 852
    Height = 202
    DesignSize = (
      852
      202)
    object Bevel2: TBevel
      Left = 0
      Top = 25
      Width = 872
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = 0
      Top = 81
      Width = 872
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel1: TBevel
      Left = 0
      Top = 113
      Width = 872
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Riesgo: TLabel
      Left = 8
      Top = 123
      Width = 33
      Height = 13
      Caption = 'Riesgo'
    end
    object Label1: TLabel
      Left = 552
      Top = 123
      Width = 30
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
    end
    object Label2: TLabel
      Left = 678
      Top = 123
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Bevel4: TBevel
      Left = 547
      Top = 119
      Width = 5
      Height = 23
      Anchors = [akTop, akRight]
      Shape = bsLeftLine
    end
    object Bevel5: TBevel
      Left = 0
      Top = 145
      Width = 872
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel6: TBevel
      Left = 547
      Top = 151
      Width = 4
      Height = 24
      Anchors = [akTop, akRight]
      Shape = bsLeftLine
    end
    object Label3: TLabel
      Left = 8
      Top = 155
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object Label4: TLabel
      Left = 554
      Top = 155
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Carga'
    end
    object Label5: TLabel
      Left = 726
      Top = 155
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object lbEstableci: TLabel
      Left = 7
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEstablecimiento.edCodigo
    end
    object lbCPostal: TLabel
      Left = 777
      Top = 7
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'C.P.'
    end
    object Label6: TLabel
      Left = 6
      Top = 91
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Bevel7: TBevel
      Left = -20
      Top = 177
      Width = 872
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 3
      Top = 32
      Width = 845
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        845
        47)
      inherited lbLocalidad: TLabel
        Left = 611
      end
      inherited lbCPostal: TLabel
        Left = 774
      end
      inherited lbProvincia: TLabel
        Left = 611
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 524
      end
      inherited edLocalidad: TEdit
        Left = 663
      end
      inherited edCPostal: TEdit
        Left = 798
      end
      inherited edDomicilio: TEdit
        Width = 554
      end
      inherited edProvincia: TEdit
        Left = 663
      end
    end
    object edFechaDesde: TDateComboBox
      Left = 587
      Top = 119
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHasta
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object edFechaHasta: TDateComboBox
      Left = 708
      Top = 119
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesde
      Anchors = [akTop, akRight]
      TabOrder = 6
    end
    object chkTodas: TCheckBox
      Left = 799
      Top = 121
      Width = 49
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Todas'
      TabOrder = 7
    end
    inline fraEstudio: TfraEstudio
      Left = 48
      Top = 151
      Width = 493
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      DesignSize = (
        493
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 416
      end
    end
    object edFechaCargaDesde: TDateComboBox
      Left = 635
      Top = 151
      Width = 88
      Height = 21
      MaxDateCombo = edFechaCargaHasta
      Anchors = [akTop, akRight]
      TabOrder = 9
    end
    object edFechaCargaHasta: TDateComboBox
      Left = 756
      Top = 151
      Width = 88
      Height = 21
      MinDateCombo = edFechaCargaDesde
      Anchors = [akTop, akRight]
      TabOrder = 10
    end
    inline fraRiesgo: TfraStaticCodigoDescripcion
      Left = 45
      Top = 118
      Width = 496
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        496
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 433
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
    inline fraEmpresa: TfraEmpresa
      Left = 39
      Top = 3
      Width = 725
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        725
        21)
      inherited lbContrato: TLabel
        Left = 623
      end
      inherited edContrato: TIntEdit
        Left = 668
      end
      inherited cmbRSocial: TArtComboBox
        Width = 486
      end
    end
    object edCPostalFiltro: TEdit
      Left = 801
      Top = 3
      Width = 45
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    inline fraTrabajador: TfraTrabajador
      Left = 63
      Top = 87
      Width = 784
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        784
        22)
      inherited cmbNombre: TArtComboBox
        Width = 700
      end
    end
    object cbEmpresasVIP: TCheckBox
      Left = 7
      Top = 181
      Width = 86
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Empresas VIP'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 11
    end
  end
  inherited CoolBar: TCoolBar
    Top = 202
    Width = 852
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 848
      end>
    inherited ToolBar: TToolBar
      Width = 835
      Align = alClient
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 16
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        Hint = 'Ordenar Establecimientos (Ctrl+O)'
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
        ImageIndex = 9
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 231
    Width = 852
    Height = 329
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnDblClick = nil
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'rs_fecha'
        Title.Caption = 'F.Relev.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_fechaalta'
        Title.Caption = 'F.Carga'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_cuit'
        Title.Caption = 'CUIT'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_nombre_empresa'
        Title.Caption = 'Raz'#243'n Social'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_estableci'
        Title.Caption = 'Estab.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_nombre_estableci'
        Title.Caption = 'Nombre Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_contrato'
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_domicilio'
        Title.Caption = 'Domicilio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_cpostal'
        Title.Caption = 'C.Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_provincia'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_nombre_trabajador'
        Title.Caption = 'Apellido y Nombre'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_fechaingreso'
        Title.Caption = 'F.Ingreso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_sector'
        Title.Caption = 'Sector'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rs_tarea'
        Title.Alignment = taCenter
        Title.Caption = 'Tarea'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_CODIGO_ESTUDIO'
        Title.Caption = 'Estudio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_descripcion_estudio'
        Title.Caption = 'Descripci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_fechainiexpo'
        Title.Caption = 'F.Inicio Exp.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_esop'
        Title.Caption = 'ESOP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_descripcion_riesgotrabajo'
        Title.Caption = 'Riesgo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_periodicidad'
        Title.Caption = 'Periodicidad'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterOpen = nil
    Left = 60
    Top = 348
  end
  inherited dsConsulta: TDataSource
    Left = 88
    Top = 348
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Fecha Relev.'
        DataField = 'RS_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha carga'
        DataField = 'RS_FECHAALTA'
        FieldIndex = 1
      end
      item
        Title = 'CUIT'
        DataField = 'RS_CUIT'
        FieldIndex = 2
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'RS_NOMBRE_EMPRESA'
        FieldIndex = 3
      end
      item
        Title = 'Contrato'
        DataField = 'RS_CONTRATO'
        FieldIndex = 4
      end
      item
        Title = 'Estab.'
        DataField = 'RS_ESTABLECI'
        FieldIndex = 5
      end
      item
        Title = 'Nombre Estab.'
        DataField = 'es_nombre'
        FieldIndex = 6
      end
      item
        Title = 'CIIU'
        DataField = 'ciiu'
        FieldIndex = 7
      end
      item
        Title = 'Domicilio'
        DataField = 'domicilio'
        FieldIndex = 8
      end
      item
        Title = 'Provincia'
        DataField = 'pv_descripcion'
        FieldIndex = 9
      end
      item
        Title = 'capitas'
        DataField = 'capitas'
        FieldIndex = 10
      end>
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Top = 317
  end
  inherited FormStorage: TFormStorage
    Left = 55
    Top = 314
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
        LinkControl = tbSalir
      end
      item
        Key = 16458
      end
      item
        Key = 16455
      end
      item
        Key = 119
      end>
    Left = 26
    Top = 347
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    SortDialog = nil
    Left = 116
    Top = 348
  end
end
