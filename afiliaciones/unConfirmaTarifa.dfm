inherited frmConfirmaTarifa: TfrmConfirmaTarifa
  Left = 568
  Top = 284
  Width = 792
  Height = 411
  Caption = 'Confirmaci'#243'n de Tarifas'
  Constraints.MinHeight = 411
  Constraints.MinWidth = 792
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 784
    Height = 224
    object rgCA_CODRECEPCION: TRadioGroup
      Left = 452
      Top = 40
      Width = 120
      Height = 88
      ItemIndex = 2
      Items.Strings = (
        'Recepcionadas'
        'No recepcionadas'
        'Ambas')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 784
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        784
        40)
      object lbRSocial: TLabel
        Left = 5
        Top = 16
        Width = 18
        Height = 13
        Caption = 'Cuit'
        FocusControl = fraEmpresa.cmbRSocial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inline fraEmpresa: TfraEmpresa
        Left = 27
        Top = 12
        Width = 749
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
        inherited lbContrato: TLabel
          Left = 647
        end
        inherited edContrato: TIntEdit
          Left = 692
        end
        inherited cmbRSocial: TArtComboBox
          Width = 510
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 40
      Width = 448
      Height = 88
      TabOrder = 1
      object Label1: TLabel
        Left = 21
        Top = 40
        Width = 104
        Height = 13
        Caption = 'Fecha Vigencia Tarifa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 16
        Width = 112
        Height = 13
        Caption = 'Fecha Impresi'#243'n Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 238
        Top = 16
        Width = 109
        Height = 13
        Caption = 'Fecha Impresi'#243'n Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 4
        Top = 64
        Width = 125
        Height = 13
        Caption = 'Fecha Autorizaci'#243'n Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 224
        Top = 64
        Width = 122
        Height = 13
        Caption = 'Fecha Autorizaci'#243'n Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cmbCA_FECHAIMPRESIONDesde: TDateComboBox
        Left = 132
        Top = 12
        Width = 88
        Height = 21
        MaxDateCombo = cmbCA_FECHAIMPRESIONHasta
        TabOrder = 0
      end
      object cmbET_VIGENCIATARIFA: TDateComboBox
        Left = 132
        Top = 36
        Width = 88
        Height = 21
        TabOrder = 1
      end
      object cmbCA_FECHAIMPRESIONHasta: TDateComboBox
        Left = 352
        Top = 12
        Width = 88
        Height = 21
        MinDateCombo = cmbCA_FECHAIMPRESIONDesde
        TabOrder = 2
      end
      object cmbET_FECHAAUTORIZADesde: TDateComboBox
        Left = 132
        Top = 60
        Width = 88
        Height = 21
        MaxDateCombo = cmbET_FECHAAUTORIZAHasta
        TabOrder = 3
      end
      object cmbET_FECHAAUTORIZAHasta: TDateComboBox
        Left = 352
        Top = 60
        Width = 88
        Height = 21
        MinDateCombo = cmbET_FECHAAUTORIZADesde
        TabOrder = 4
      end
    end
    object GroupBox10: TGroupBox
      Left = 1
      Top = 128
      Width = 400
      Height = 44
      Caption = 'M'#250'ltiples Contratos'
      TabOrder = 4
      DesignSize = (
        400
        44)
      object Label8: TLabel
        Left = 8
        Top = 18
        Width = 45
        Height = 13
        Caption = 'Contratos'
      end
      object edContratos: TEdit
        Left = 56
        Top = 13
        Width = 260
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
      end
      object ToolBar1: TToolBar
        Left = 316
        Top = 10
        Width = 82
        Height = 26
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object tAgregarTXT: TToolButton
          Left = 0
          Top = 0
          Hint = 'Agregar TXT'
          ImageIndex = 6
          OnClick = tAgregarTXTClick
        end
        object tbLimpiarTXT: TToolButton
          Left = 25
          Top = 0
          Hint = 'Limpiar TXT'
          ImageIndex = 8
          OnClick = tbLimpiarTXTClick
        end
        object tbFormatoContrato: TToolButton
          Left = 50
          Top = 0
          Hint = 'Ver Formato...'
          Caption = 'tbFormatoContrato'
          ImageIndex = 40
          OnClick = tbFormatoContratoClick
        end
      end
    end
    object Registros: TGroupBox
      Left = 404
      Top = 128
      Width = 168
      Height = 56
      Caption = 'Registros'
      TabOrder = 5
      object chkActivos: TCheckBox
        Left = 10
        Top = 14
        Width = 141
        Height = 17
        Caption = 'Mostrar solo Reg. activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkContratosActivos: TCheckBox
        Left = 10
        Top = 34
        Width = 141
        Height = 17
        Caption = 'Mostrar Contratos activos'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 172
      Width = 400
      Height = 48
      Caption = 'M'#250'ltiples Cartas Documento'
      TabOrder = 7
      DesignSize = (
        400
        48)
      object Label11: TLabel
        Left = 5
        Top = 22
        Width = 48
        Height = 13
        Caption = 'Nro. Carta'
      end
      object edCartas: TEdit
        Left = 56
        Top = 17
        Width = 260
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
      end
      object ToolBar2: TToolBar
        Left = 316
        Top = 14
        Width = 82
        Height = 26
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object tbAgregarCarta: TToolButton
          Left = 0
          Top = 0
          Hint = 'Agregar TXT'
          ImageIndex = 6
          OnClick = tbAgregarCartaClick
        end
        object tbEliminarCarta: TToolButton
          Left = 25
          Top = 0
          Hint = 'Limpiar TXT'
          ImageIndex = 8
          OnClick = tbEliminarCartaClick
        end
        object tbFormatoCarta: TToolButton
          Left = 50
          Top = 0
          Hint = 'Ver Formato...'
          Caption = 'tbFormatoCarta'
          ImageIndex = 40
          OnClick = tbFormatoCartaClick
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 576
      Top = 40
      Width = 208
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Motivo Endoso'
      TabOrder = 3
      DesignSize = (
        208
        48)
      inline fraMotivoEndoso: TfraStaticCTB_TABLAS
        Left = 12
        Top = 16
        Width = 188
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 124
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object rgLotes: TRadioGroup
      Left = 576
      Top = 88
      Width = 208
      Height = 96
      ItemIndex = 3
      Items.Strings = (
        'Aumento de Tarifa + Incumplimiento'
        'Solo Incumplimiento'
        'Solo Aumento'
        'Todos')
      TabOrder = 6
    end
    object GroupBox5: TGroupBox
      Left = 404
      Top = 184
      Width = 168
      Height = 36
      TabOrder = 8
      object chkRgrl: TCheckBox
        Left = 8
        Top = 12
        Width = 97
        Height = 17
        Caption = 'Presento RGRL'
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 224
    Width = 784
    Height = 32
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 780
      end>
    inherited ToolBar: TToolBar
      Width = 767
      inherited tbNuevo: TToolButton
        Hint = 'Genera Endoso (Ctrl+G)'
        Enabled = False
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Cuadro Tarifario (Ctrl-T)'
        Enabled = False
        ImageIndex = 25
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = popupImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
      end
      object tbNuevaCarta: TToolButton
        Left = 385
        Top = 0
        Hint = 'Generar cartas (Control+N)'
        Caption = 'tbNuevaCarta'
        ImageIndex = 31
        OnClick = tbNuevaCartaClick
      end
      object ToolButton1: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Label9: TLabel
        Left = 416
        Top = 0
        Width = 53
        Height = 22
        Caption = 'Selecci'#243'n: '
        Layout = tlCenter
      end
      object edSeleccion: TCardinalEdit
        Left = 469
        Top = 0
        Width = 31
        Height = 22
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
      object ToolButton2: TToolButton
        Left = 500
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbCalcularTotal: TToolButton
        Left = 508
        Top = 0
        Hint = 'Total Registros'
        Caption = 'tbCalcularTotal'
        ImageIndex = 39
        Style = tbsCheck
        OnClick = tbCalcularTotalClick
      end
      object Label10: TLabel
        Left = 531
        Top = 0
        Width = 30
        Height = 22
        Caption = 'Total: '
        Layout = tlCenter
      end
      object edTotal: TCardinalEdit
        Left = 561
        Top = 0
        Width = 31
        Height = 22
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 256
    Width = 784
    Height = 129
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OnCellClick = GridCellClick
    OnKeyUp = GridKeyUp
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Nro. Contrato'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_PORCMASA'
        Title.Caption = 'Proc. Masa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_SUMAFIJA'
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_VIGENCIATARIFA'
        Title.Caption = 'F. Vig. Tarifa'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHAAUTORIZA'
        Title.Caption = 'F. Autorizaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_USUARIOAUTORIZA'
        Title.Caption = 'U. Autorizaci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'Actividad'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Desc. Actividad'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Motivo Endoso'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_NROCARTADOC'
        Title.Caption = 'N'#250'm. Carta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAIMPRESION'
        Title.Caption = 'F. Imp. Carta'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORREO'
        Title.Caption = 'Correo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_RECEPCIONOK'
        Title.Caption = 'Notif. Correo'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Caption = 'F. Recep. Carta'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CODRECEPCION'
        Title.Caption = 'C'#243'd. Recep.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RECEPCION'
        Title.Caption = 'Desc. Recepci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIB'
        Title.Caption = 'Motivo de Baja del Contrato'
        Width = 151
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja del Contrato'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ET_INCUMPLIDO_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vig. Incumplimiento Desde'
        Width = 157
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ET_INCUMPLIDO_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vig. Incumplimiento Hasta'
        Width = 151
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ET_INCUMPLIDO_SUMAFIJA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Inc.'
        Width = 83
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ET_INCUMPLIDO_PORCMASA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porc. Masa Inc.'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RGRL'
        Title.Alignment = taCenter
        Width = 67
        Visible = True
      end>
  end
  object fpVigencia: TFormPanel [3]
    Left = 203
    Top = 72
    Width = 376
    Height = 128
    Caption = 'Vigencia del endoso'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    OnBeforeShow = fpVigenciaBeforeShow
    DesignSize = (
      376
      128)
    object Bevel1: TBevel
      Left = 4
      Top = 83
      Width = 368
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object Label7: TLabel
      Left = 216
      Top = 12
      Width = 53
      Height = 13
      Caption = 'F. Vigencia'
    end
    object Label3: TLabel
      Left = 216
      Top = 36
      Width = 64
      Height = 13
      Caption = 'F. Inc. Desde'
    end
    object btnAceptar: TButton
      Left = 218
      Top = 95
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 3
      OnClick = btnAceptarClick
    end
    object cmbEN_FECHAVIGENCIA: TDateComboBox
      Left = 284
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 298
      Top = 96
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object rgTipoAplicacion: TRadioGroup
      Left = 8
      Top = 4
      Width = 192
      Height = 72
      Items.Strings = (
        'Aplica Solo Aumento'
        'Aplica Aumento + Incumplimiento'
        'Aplica Solo Incumplimiento')
      TabOrder = 0
    end
    object edFechaIncumplimientoDesde: TDateComboBox
      Left = 284
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT'#9'ACO.CO_CONTRATO,'
      #9'AEM.EM_CUIT, '
      #9'AEM.EM_NOMBRE, '
      #9'TET.ET_PORCMASA, '
      #9'TET.ET_SUMAFIJA, '
      #9'TET.ET_VIGENCIATARIFA,'
      #9'TET.ET_FECHAAUTORIZA, '
      #9'TET.ET_USUARIOAUTORIZA, '
      #9'AC_CODIGO, '
      #9'AC_DESCRIPCION, '
      #9'MOTIVO.TB_DESCRIPCION,'
      #9'CCA.CA_NROCARTADOC, '
      #9'CCA.CA_FECHAIMPRESION, '
      #9'COR.TB_DESCRIPCION CORREO, '
      #9'CCA.CA_RECEPCIONOK,'
      #9'CCA.CA_FECHARECEPCION, '
      #9'CCA.CA_CODRECEPCION, '
      #9'REC.TB_DESCRIPCION DESC_RECEPCION, '
      #9'TET.ET_ID'
      
        '  FROM CAC_ACTIVIDAD, ACO_CONTRATO ACO, AEM_EMPRESA AEM, CCA_CAR' +
        'TA CCA, CTB_TABLAS COR, CTB_TABLAS REC,'
      '       CTB_TABLAS MOTIVO, TMP.TET_ENDOSOTARIFA TET')
    Left = 20
    Top = 264
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 264
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 292
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 292
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 320
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PermisoGenerarEliminar'
      end>
    Left = 21
    Top = 236
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 236
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 320
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16455
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
        Key = 16468
        LinkControl = tbPropiedades
      end
      item
        Key = 16462
        LinkControl = tbNuevaCarta
      end>
    Left = 76
    Top = 237
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 264
  end
  object OpenDialog: TOpenDialog
    Left = 92
    Top = 130
  end
  object popupImprimir: TPopupMenu
    Left = 76
    Top = 292
    object mnuEndoso: TMenuItem
      Caption = 'Endoso'
      OnClick = mnuEndosoClick
    end
    object mnuGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuGrillaClick
    end
  end
end
