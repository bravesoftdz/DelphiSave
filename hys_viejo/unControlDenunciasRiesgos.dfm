inherited frmControlDenunciasRiesgos: TfrmControlDenunciasRiesgos
  Left = 541
  Top = 242
  Width = 901
  Height = 465
  Caption = 'Control de Envio Notas Denuncia Riesgos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 893
    Height = 136
    Visible = True
    object Label1: TLabel
      Left = 570
      Top = 32
      Width = 54
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Alta:'
    end
    object lblCUIT: TLabel
      Left = 8
      Top = 5
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel
      Left = 6
      Top = 32
      Width = 60
      Height = 13
      Caption = 'Usuario Alta:'
    end
    object Label3: TLabel
      Left = 570
      Top = 61
      Width = 62
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Modif:'
    end
    object Label4: TLabel
      Left = 6
      Top = 61
      Width = 68
      Height = 13
      Caption = 'Usuario Modif:'
    end
    object Label5: TLabel
      Left = 638
      Top = 32
      Width = 29
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'desde'
    end
    object Label6: TLabel
      Left = 763
      Top = 32
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label7: TLabel
      Left = 637
      Top = 61
      Width = 29
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'desde'
    end
    object Label8: TLabel
      Left = 763
      Top = 61
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label9: TLabel
      Left = 570
      Top = 92
      Width = 63
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Envio:'
    end
    object Label10: TLabel
      Left = 6
      Top = 92
      Width = 69
      Height = 13
      Caption = 'Usuario Envio:'
    end
    object Label11: TLabel
      Left = 637
      Top = 92
      Width = 29
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'desde'
    end
    object Label12: TLabel
      Left = 763
      Top = 92
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 671
      Top = 28
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    inline fraUsuarioAlta: TfraCodigoDescripcion
      Left = 89
      Top = 28
      Width = 477
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 412
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 90
      Top = 2
      Width = 793
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      DesignSize = (
        793
        22)
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 689
      end
      inherited edContrato: TIntEdit
        Left = 736
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 543
        Height = 22
      end
    end
    object edFechaModifHasta: TDateComboBox
      Left = 792
      Top = 58
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    inline fraUsuarioModif: TfraCodigoDescripcion
      Left = 89
      Top = 57
      Width = 476
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 411
      end
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 794
      Top = 28
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object edFechaModifDesde: TDateComboBox
      Left = 671
      Top = 58
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
    end
    object edFechaEnvioHasta: TDateComboBox
      Left = 792
      Top = 89
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 7
    end
    inline fraUsuarioEnvio: TfraCodigoDescripcion
      Left = 89
      Top = 88
      Width = 476
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      inherited cmbDescripcion: TArtComboBox
        Width = 411
      end
    end
    object edFechaEnvioDesde: TDateComboBox
      Left = 671
      Top = 89
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 9
    end
  end
  inherited CoolBar: TCoolBar
    Top = 136
    Width = 893
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 889
      end>
    inherited ToolBar: TToolBar
      Width = 876
      inherited tbNuevo: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      object tbMarcarComoEnviado: TToolButton
        Left = 370
        Top = 0
        Hint = 'Marcar como Enviado'
        Caption = 'tbMarcarComoEnviado'
        ImageIndex = 32
        OnClick = tbMarcarComoEnviadoClick
      end
      object tbCopiarArchivo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Copiar Archivo'
        Caption = 'tbCopiarArchivo'
        ImageIndex = 22
        OnClick = tbCopiarArchivoClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 439
        Top = 0
        Hint = 'Seleccionar Todos'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
      object tbReprocesar: TToolButton
        Left = 462
        Top = 0
        Hint = 'Reprocesar Archivos'
        Caption = 'Reprocesar'
        ImageIndex = 47
        OnClick = tbReprocesarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 165
    Width = 893
    Height = 273
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_ID'
        Title.Caption = 'ID'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_FECHAENVIO'
        Title.Caption = 'F.Envio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_USUENVIO'
        Title.Caption = 'Usuario Envio'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_FECHAMODIF'
        Title.Caption = 'F.Modif.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_FECHABAJA'
        Title.Caption = 'F. Baja'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 74
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 184
  end
  object fpCopiarArchivo: TFormPanel [4]
    Left = 228
    Top = 256
    Width = 461
    Height = 77
    Caption = 'Destino donde copiar el archivo'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poMainFormCenter
    DesignSize = (
      461
      77)
    object lbDirectorio: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Directorio'
      FocusControl = edDirectorio
    end
    object edDirectorio: TDirectoryEdit
      Left = 61
      Top = 10
      Width = 394
      Height = 21
      DialogKind = dkWin32
      DialogText = 'Directorio'
      DialogOptions = [sdAllowCreate, sdPerformCreate]
      NumGlyphs = 1
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object Button1: TButton
      Left = 381
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnAceptarCopiarArchivo: TButton
      Left = 303
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarCopiarArchivoClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT a.*, b.*, c.*, TRUNC(nr_fechaalta) fechaalta'
      
        '  FROM hys.hnr_notasdenunciariesgo a, afi.aco_contrato b, afi.ae' +
        'm_empresa c'
      ' WHERE nr_contrato = co_contrato'
      '   AND co_idempresa = em_id')
    object sdqConsultaNR_ID: TFloatField
      FieldName = 'NR_ID'
      Required = True
    end
    object sdqConsultaNR_CONTRATO: TFloatField
      FieldName = 'NR_CONTRATO'
    end
    object sdqConsultaNR_FECHAENVIO: TDateTimeField
      FieldName = 'NR_FECHAENVIO'
    end
    object sdqConsultaNR_USUENVIO: TStringField
      FieldName = 'NR_USUENVIO'
    end
    object sdqConsultaNR_FECHAALTA: TDateTimeField
      FieldName = 'NR_FECHAALTA'
      Required = True
    end
    object sdqConsultaNR_USUALTA: TStringField
      FieldName = 'NR_USUALTA'
      Required = True
    end
    object sdqConsultaNR_FECHAMODIF: TDateTimeField
      FieldName = 'NR_FECHAMODIF'
    end
    object sdqConsultaNR_USUMODIF: TStringField
      FieldName = 'NR_USUMODIF'
    end
    object sdqConsultaNR_FECHABAJA: TDateTimeField
      FieldName = 'NR_FECHABAJA'
    end
    object sdqConsultaNR_USUBAJA: TStringField
      FieldName = 'NR_USUBAJA'
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqConsultaFECHAALTA: TDateTimeField
      FieldName = 'FECHAALTA'
    end
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
    Left = 80
    Top = 296
  end
end
