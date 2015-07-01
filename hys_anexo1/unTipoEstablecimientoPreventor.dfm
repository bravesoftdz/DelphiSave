inherited frmAbmTipoEstablecimientoPreventor: TfrmAbmTipoEstablecimientoPreventor
  Left = 174
  Top = 181
  Width = 694
  Height = 473
  Caption = 'Establecimientos por Preventor'
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  OnCloseQuery = FSFormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 686
    Height = 108
    Visible = True
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 686
      Height = 108
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          678
          80)
        object Label4: TLabel
          Left = 3
          Top = 56
          Width = 48
          Height = 13
          Caption = 'Preventor'
        end
        object Label14: TLabel
          Left = 6
          Top = 33
          Width = 31
          Height = 13
          Caption = 'Estab.'
        end
        object Label16: TLabel
          Left = 204
          Top = 33
          Width = 71
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nombre Estab.'
        end
        object Label19: TLabel
          Left = 6
          Top = 9
          Width = 24
          Height = 13
          Caption = 'CUIT'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 51
          Top = 52
          Width = 307
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          inherited cmbDescripcion: TArtComboBox
            Width = 165
            CharCase = ecUpperCase
            OnDropDown = fraPreventorFiltrocmbDescripcionDropDown
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            CharCase = ecNormal
          end
        end
        object cbSinPreventor: TCheckBox
          Left = 485
          Top = 56
          Width = 87
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Sin Preventor'
          TabOrder = 5
          OnClick = cbSinPreventorClick
        end
        object cbEmpresasSinAsignar: TCheckBox
          Left = 538
          Top = 31
          Width = 124
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Empresas sin Asignar'
          TabOrder = 3
        end
        object edEstablecimiento: TPatternEdit
          Left = 52
          Top = 29
          Width = 145
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Pattern = '1234567890-,'
        end
        object edNombreEstableci: TPatternEdit
          Left = 280
          Top = 29
          Width = 245
          Height = 21
          Anchors = [akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 6
        end
        object cbPreventorReferente: TCheckBox
          Left = 407
          Top = 56
          Width = 67
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Referente'
          TabOrder = 7
          OnClick = cbPreventorReferenteClick
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 53
          Top = 3
          Width = 508
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
          OnExit = fraEmpresaFiltroExit
          inherited lbContrato: TLabel
            Left = 406
          end
          inherited edContrato: TIntEdit
            Left = 451
          end
          inherited cmbRSocial: TArtComboBox
            Width = 269
          end
        end
        object cbListarCoordinados: TCheckBox
          Left = 290
          Top = 56
          Width = 106
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Listar Coordinados'
          TabOrder = 8
          OnClick = cbPreventorReferenteClick
        end
        object cbCtosActivos: TCheckBox
          Left = 580
          Top = 6
          Width = 82
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Ctos. Activos'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbPreventorReferenteClick
        end
        object cbTercerizado: TCheckBox
          Left = 585
          Top = 56
          Width = 77
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Tercerizado'
          TabOrder = 9
          OnClick = cbSinPreventorClick
        end
      end
      object tbVarios: TTabSheet
        Caption = 'Varios'
        ImageIndex = 1
        DesignSize = (
          678
          80)
        object lbAct: TLabel
          Left = 9
          Top = 33
          Width = 22
          Height = 13
          Caption = 'CIIU'
        end
        object Label8: TLabel
          Left = 109
          Top = 33
          Width = 91
          Height = 13
          Caption = 'Cant. Trab. M'#237'nimo'
        end
        object Label12: TLabel
          Left = 274
          Top = 33
          Width = 24
          Height = 13
          Caption = 'M'#225'x.'
        end
        object Label15: TLabel
          Left = 9
          Top = 60
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        object Label21: TLabel
          Left = 422
          Top = 60
          Width = 38
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Ranking'
        end
        object Label22: TLabel
          Left = 167
          Top = 60
          Width = 38
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'SubTipo'
        end
        inline fraLocalidad: TfraLocalidadEx
          Left = 6
          Top = 5
          Width = 663
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          inherited lbCPostal: TLabel
            Width = 40
          end
          inherited lbLocalidad: TLabel
            Width = 44
          end
          inherited lbProvincia: TLabel
            Left = 445
            Width = 43
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 283
          end
          inherited cmbProvincia: TCheckCombo
            Left = 494
            Width = 168
          end
        end
        object edActividad: TIntEdit
          Left = 52
          Top = 30
          Width = 51
          Height = 21
          TabOrder = 1
          MaxLength = 8
        end
        object edCantTrabajadoresMin: TIntEdit
          Left = 205
          Top = 30
          Width = 59
          Height = 21
          TabOrder = 2
          MaxLength = 8
        end
        object edCantTrabajadoresMax: TIntEdit
          Left = 301
          Top = 30
          Width = 59
          Height = 21
          TabOrder = 3
          MaxLength = 8
        end
        inline fraTipoFiltro: TfraCtbTablas
          Left = 51
          Top = 54
          Width = 109
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          inherited cmbDescripcion: TArtComboBox
            Left = 64
            Width = 45
          end
          inherited edCodigo: TPatternEdit
            Width = 59
          end
        end
        object cbExcluirBajas: TCheckBox
          Left = 374
          Top = 32
          Width = 92
          Height = 17
          Caption = 'Excluir Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        inline fraRanking: TfraCodigoDescripcion
          Left = 466
          Top = 54
          Width = 206
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 7
          inherited cmbDescripcion: TArtComboBox
            Width = 141
          end
        end
        inline fraSubTipoFiltro: TfraCodigoDescripcion
          Left = 215
          Top = 54
          Width = 199
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 6
          inherited cmbDescripcion: TArtComboBox
            Width = 134
          end
        end
        object cbEventual: TCheckBox
          Left = 473
          Top = 32
          Width = 92
          Height = 17
          Caption = 'Eventuales'
          TabOrder = 8
        end
      end
      object tbOperativo: TTabSheet
        Caption = 'Operativo'
        ImageIndex = 2
        object Label18: TLabel
          Left = 8
          Top = 10
          Width = 48
          Height = 13
          Caption = 'Operativo'
        end
        inline fraOperativo: TfraCodigoDescripcion
          Left = 59
          Top = 6
          Width = 406
          Height = 23
          TabOrder = 0
          inherited cmbDescripcion: TArtComboBox
            Width = 341
          end
        end
        object cbAnexoI: TCheckBox
          Left = 7
          Top = 35
          Width = 74
          Height = 17
          Caption = 'Anexo I/III'
          TabOrder = 2
        end
        object cbPrs: TCheckBox
          Left = 177
          Top = 35
          Width = 79
          Height = 17
          Caption = 'PRS/PAPE'
          TabOrder = 3
        end
        object cbPrsIdentico: TCheckBox
          Left = 177
          Top = 61
          Width = 88
          Height = 17
          Caption = 'PRS Id'#233'ntico'
          TabOrder = 4
        end
        object cbAnexoII: TCheckBox
          Left = 7
          Top = 61
          Width = 81
          Height = 17
          Caption = 'Anexo II/IV'
          TabOrder = 5
        end
        object cbDenuncias: TCheckBox
          Left = 346
          Top = 35
          Width = 76
          Height = 17
          Caption = 'Denuncias'
          TabOrder = 6
        end
        object cbAvisoObra: TCheckBox
          Left = 346
          Top = 61
          Width = 75
          Height = 17
          Caption = 'Aviso Obra'
          TabOrder = 7
        end
        object cmbAnexoI: TExComboBox
          Left = 87
          Top = 31
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 8
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbAnexoII: TExComboBox
          Left = 87
          Top = 58
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 9
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbPrs: TExComboBox
          Left = 263
          Top = 31
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 10
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbPrsIdentico: TExComboBox
          Left = 263
          Top = 58
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 11
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbDenuncias: TExComboBox
          Left = 423
          Top = 31
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 12
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbAvisoObra: TExComboBox
          Left = 423
          Top = 58
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 13
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cbAnexoFicticio: TCheckBox
          Left = 478
          Top = 61
          Width = 90
          Height = 17
          Caption = 'Anexo Ficticio'
          TabOrder = 14
        end
        object cmbAnexoFicticio: TExComboBox
          Left = 567
          Top = 58
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 15
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cbOperativoActual: TCheckBox
          Left = 478
          Top = 8
          Width = 118
          Height = 17
          Caption = 'Operativo Actual'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbOperativoActualClick
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 108
    Width = 686
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 682
      end>
    inherited ToolBar: TToolBar
      Width = 669
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCambiarPreventor: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cambiar Preventor'
        Caption = 'tbCambiarPreventor'
        Enabled = False
        ImageIndex = 19
        Visible = False
        OnClick = tbCambiarPreventorClick
      end
      object tbNoAsignadas: TToolButton
        Left = 393
        Top = 0
        Hint = 'No asignadas'
        Caption = 'Asignar Empresas'
        ImageIndex = 22
        Visible = False
        OnClick = tbNoAsignadasClick
      end
      object tbCP: TToolButton
        Left = 416
        Top = 0
        Hint = 'Consulta de CP asignados'
        Caption = 'tbCP'
        ImageIndex = 49
        OnClick = tbCPClick
      end
      object tbAfiliaciones: TToolButton
        Left = 439
        Top = 0
        Hint = 'Afiliaciones'
        Caption = 'tbAfiliaciones'
        ImageIndex = 15
        OnClick = tbAfiliacionesClick
      end
      object ToolButton2: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 470
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'ToolButton1'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 137
    Width = 686
    Height = 273
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnDrawColumnCell = GridDrawColumnCell
    RowColor2 = clBlack
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro. Estab.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre Establecimiento'
        Width = 182
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Empresa'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_descripcion'
        Title.Caption = 'Subtipo'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_ACTIVIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Actividad'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_REFERENTE'
        Title.Caption = 'Referente'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_coordinador'
        Title.Caption = 'Coordinador'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'C.Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTALA'
        Title.Caption = 'C. Postal Arg.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RELACION'
        Title.Caption = 'CIUU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_EMPLEADOS'
        Title.Caption = 'Cant. Trab. Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONOEMP'
        Title.Caption = 'Tel. Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAXEMP'
        Title.Caption = 'Fax Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONOSESTAB'
        Title.Caption = 'Tel. Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAXESTAB'
        Title.Caption = 'Fax Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEANEXO1'
        Title.Caption = 'Tiene Anexo I/III'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEANEXO2'
        Title.Caption = 'Tiene Anexo II/IV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEANEXOFICTICIO'
        Title.Caption = 'Tiene Anexo Fict.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEPRS'
        Title.Caption = 'Tiene PRS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEPRSIDENTICO'
        Title.Caption = 'Tiene Prs Id'#233'ntico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEDENUNCIAS'
        Title.Caption = 'Tiene Denuncias'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEAVISOOBRA'
        Title.Caption = 'Aviso de Obra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAULTVISITA'
        Title.Caption = 'Fecha Ult.Visita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rk_descripcion'
        Title.Caption = 'Condici'#243'n EAS'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'es_eventual'
        Title.Alignment = taCenter
        Title.Caption = 'Enventual'
        Visible = True
      end>
  end
  object pnlGuardar: TPanel [3]
    Left = 0
    Top = 410
    Width = 686
    Height = 36
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      686
      36)
    object btnGuardar: TButton
      Left = 528
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Guardar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object btnCancelarCambios: TButton
      Left = 603
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarCambiosClick
    end
  end
  object fpEmpresasNoAsignadas: TFormPanel [4]
    Left = 155
    Top = 453
    Width = 641
    Height = 130
    Caption = 'Alta de Empresas no asignadas'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      641
      130)
    object Bevel2: TBevel
      Left = 4
      Top = 94
      Width = 632
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label9: TLabel
      Left = 14
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Preventor'
    end
    object Label10: TLabel
      Left = 20
      Top = 63
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label11: TLabel
      Left = 20
      Top = 38
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object btnAceptarEmpNoAsig: TButton
      Left = 475
      Top = 100
      Width = 76
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarEmpNoAsigClick
    end
    object btnCancelarEmpNoAsig: TButton
      Left = 553
      Top = 100
      Width = 76
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    inline fraPreventorEmpNoAsignadas: TfraCodigoDescripcion
      Left = 68
      Top = 12
      Width = 456
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 389
        CharCase = ecUpperCase
        OnDropDown = fraPreventorEmpNoAsignadascmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    inline fraTipoEmpNoAsignadas: TfraCtbTablas
      Left = 68
      Top = 36
      Width = 561
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 494
      end
      inherited edCodigo: TPatternEdit
        Width = 59
      end
    end
    object cmbActividadEmpNoAsignadas: TExComboBox
      Left = 69
      Top = 61
      Width = 556
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'A=Agro'
        'I=Industria'
        'C=Construcci'#243'n')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cbReferenteNoAsignadas: TCheckBox
      Left = 530
      Top = 15
      Width = 92
      Height = 17
      Caption = 'Referente Emp.'
      TabOrder = 1
    end
  end
  object fpMotivoCambio: TFormPanel [5]
    Left = 83
    Top = 493
    Width = 517
    Height = 108
    Caption = 'Motivo Cambio'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnClose = fpMotivoCambioClose
    OnBeforeShow = fpMotivoCambioBeforeShow
    DesignSize = (
      517
      108)
    object Bevel3: TBevel
      Left = 4
      Top = 72
      Width = 509
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label17: TLabel
      Left = 14
      Top = 15
      Width = 87
      Height = 13
      Caption = 'Motivo del Cambio'
    end
    object btnAceptarMotivo: TButton
      Left = 357
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object edMotivoCambioSolicitado: TRichEdit
      Left = 113
      Top = 12
      Width = 389
      Height = 48
      TabOrder = 1
    end
    object btnTodos: TButton
      Left = 435
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Todos'
      TabOrder = 2
      OnClick = btnTodosClick
    end
  end
  object fpCambiarPreventor: TFormPanel [6]
    Left = 16
    Top = 257
    Width = 639
    Height = 156
    Caption = 'Cambio de Preventor'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      639
      156)
    object Bevel1: TBevel
      Left = 4
      Top = 120
      Width = 632
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 13
      Top = 16
      Width = 81
      Height = 13
      Caption = 'Preventor Actual'
    end
    object Label6: TLabel
      Left = 14
      Top = 42
      Width = 82
      Height = 13
      Caption = 'Preventor Nuevo'
    end
    object Label13: TLabel
      Left = 14
      Top = 68
      Width = 87
      Height = 13
      Caption = 'Motivo del Cambio'
    end
    object btnAceptarCambioPreventor: TButton
      Left = 485
      Top = 126
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
      TabOrder = 2
      OnClick = btnAceptarCambioPreventorClick
    end
    object btnCancelarCambioPreventor: TButton
      Left = 560
      Top = 126
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraPreventorActual: TfraCodigoDescripcion
      Left = 112
      Top = 12
      Width = 517
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 452
        CharCase = ecUpperCase
        OnDropDown = fraPreventorActualcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    inline fraPreventorNuevo: TfraCodigoDescripcion
      Left = 112
      Top = 38
      Width = 415
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 350
        CharCase = ecUpperCase
        OnDropDown = fraPreventorNuevocmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object edMotivoCambio: TRichEdit
      Left = 113
      Top = 65
      Width = 513
      Height = 48
      TabOrder = 5
    end
    object cbReferenteCambio: TCheckBox
      Left = 532
      Top = 41
      Width = 92
      Height = 17
      Caption = 'Referente Emp.'
      TabOrder = 4
    end
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 152
    Width = 570
    Height = 225
    Constraints.MinHeight = 225
    Constraints.MinWidth = 570
    inherited BevelAbm: TBevel
      Top = 189
      Width = 562
    end
    object Label1: TLabel [1]
      Left = 13
      Top = 164
      Width = 48
      Height = 13
      Caption = 'Preventor'
    end
    object Label2: TLabel [2]
      Left = 13
      Top = 114
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label3: TLabel [3]
      Left = 13
      Top = 139
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label7: TLabel [4]
      Left = 471
      Top = 140
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'CIUU'
    end
    object btnInfoEstableci: TSpeedButton [5]
      Left = 519
      Top = 87
      Width = 23
      Height = 22
      Hint = 'Tel'#233'fonos'
      Anchors = [akTop, akRight]
      Caption = '('
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Wingdings'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnInfoEstableciClick
    end
    object Label20: TLabel [6]
      Left = 15
      Top = 24
      Width = 40
      Height = 13
      Caption = 'C.U.I.T.'
    end
    inherited btnAceptar: TButton
      Left = 415
      Top = 195
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 490
      Top = 195
      TabOrder = 7
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 61
      Top = 160
      Width = 401
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 337
        CharCase = ecUpperCase
        OnDropDown = fraPreventorcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    inline fraEstablecimiento: TfraEstablecimientoDomic
      Left = 9
      Top = 64
      Width = 506
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited lbLocalidad: TLabel
        Left = 297
        Width = 44
      end
      inherited lbEstableci: TLabel
        Width = 31
      end
      inherited lbCPostal: TLabel
        Left = 435
        Width = 21
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbProvincia: TLabel
        Left = 297
        Width = 43
      end
      inherited edCodigo: TIntEdit
        Left = 53
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 100
        Width = 185
      end
      inherited edLocalidad: TEdit
        Left = 345
        Width = 87
      end
      inherited edCPostal: TEdit
        Left = 459
      end
      inherited edDomicilio: TEdit
        Width = 230
      end
      inherited edProvincia: TEdit
        Left = 345
        Width = 159
      end
      inherited sdqDatos: TSDQuery
        Left = 471
        Top = 28
      end
      inherited dsDatos: TDataSource
        Left = 532
        Top = 16
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 57
      Top = 19
      Width = 507
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
      inherited lbRSocial: TLabel
        Left = 97
      end
      inherited lbContrato: TLabel
        Left = 403
      end
      inherited mskCUIT: TMaskEdit
        Left = 5
      end
      inherited edContrato: TIntEdit
        Left = 447
      end
      inherited cmbRSocial: TArtComboBox
        Left = 144
        Width = 246
      end
    end
    inline fraTipoEmpresa: TfraCtbTablas
      Left = 61
      Top = 112
      Width = 233
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 169
      end
      inherited edCodigo: TPatternEdit
        Width = 59
      end
    end
    object cmbActividad: TExComboBox
      Left = 62
      Top = 137
      Width = 400
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 4
      Items.Strings = (
        'A=Agro'
        'I=Industria'
        'C=Construcci'#243'n')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cbTodosEstab: TCheckBox
      Left = 14
      Top = 43
      Width = 161
      Height = 17
      Caption = 'Todos los Establecimientos'
      TabOrder = 1
      OnClick = cbTodosEstabClick
    end
    object edCiuu: TIntEdit
      Left = 504
      Top = 137
      Width = 57
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      MaxLength = 8
    end
    object tbCambios: TToolBar
      Left = 519
      Top = 62
      Width = 24
      Height = 23
      Align = alNone
      Anchors = [akTop, akRight]
      EdgeBorders = []
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 9
      object tbHistorico: TToolButton
        Left = 0
        Top = 2
        Caption = 'Ver Cambios'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = tbHistoricoClick
      end
    end
    object cbReferente: TCheckBox
      Left = 469
      Top = 163
      Width = 90
      Height = 17
      Anchors = [akTop]
      Caption = 'Referente Emp.'
      TabOrder = 10
    end
    object edSubtipo: TEdit
      Left = 299
      Top = 113
      Width = 262
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
  end
  inherited sdqConsulta: TSDQuery
    Left = 16
    Top = 332
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 332
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 360
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 360
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 388
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 304
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 304
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 388
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
      end>
    Left = 72
    Top = 304
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 332
  end
  object sdqConSupervisor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT it_id'
      '  FROM art.pit_firmantes'
      ' WHERE it_id <> :idconsulta AND NOT (it_idsupervisor IS NULL)'
      '')
    Left = 118
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idconsulta'
        ParamType = ptInput
      end>
  end
end
