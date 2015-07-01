inherited frmDebitosAuditoria: TfrmDebitosAuditoria
  Left = 487
  Top = 163
  Width = 757
  Height = 499
  Caption = 'D'#233'bitos por auditor'#237'a'
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 747
  end
  inherited CoolBar: TCoolBar
    Width = 747
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 743
      end>
    inherited ToolBar: TToolBar
      Width = 730
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbFinAuditoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Finalizar auditor'#237'a (Ctrl+F)'
        Caption = 'tbFinAuditoria'
        ImageIndex = 18
        OnClick = tbFinAuditoriaClick
      end
      object ToolButton10: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbAvalarDebitos: TToolButton
        Left = 401
        Top = 0
        Hint = 'Avalar d'#233'bitos (Ctrl+A)'
        Caption = 'tbAvalarDebitos'
        ImageIndex = 23
        OnClick = tbAvalarDebitosClick
      end
      object tbRechazarDebitos: TToolButton
        Left = 424
        Top = 0
        Hint = 'Rechazar d'#233'bitos (Ctrl+R)'
        Caption = 'tbRechazarDebitos'
        ImageIndex = 24
        OnClick = tbRechazarDebitosClick
      end
      object ToolButton1: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAplicarDebito: TToolButton
        Left = 455
        Top = 0
        Hint = 'Aplicar d'#233'bito seleccionado (Ctrl+P)'
        Caption = 'tbAplicarDebito'
        ImageIndex = 25
        OnClick = tbAplicarDebitoClick
      end
      object ToolButton9: TToolButton
        Left = 478
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 486
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
      object ToolButton2: TToolButton
        Left = 509
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object pnlVolante: TPanel
        Left = 517
        Top = 0
        Width = 161
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 747
    Height = 396
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'siniestro'
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tj_nombre'
        Title.Caption = 'Trabajador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'Estado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ma_descripcion'
        Title.Caption = 'Motivo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'se_nombre'
        Title.Caption = 'Usuario auditor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_observacion'
        Title.Caption = 'D'#233'bito m'#233'dico auditor'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dv_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'F. baja'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dv_numpago'
        Title.Alignment = taCenter
        Title.Caption = 'Secuencia'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dv_observacioninterna'
        Title.Alignment = taCenter
        Title.Caption = 'Int.'
        Width = 20
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dv_fechaprestacion'
        Title.Alignment = taCenter
        Title.Caption = 'F. prestaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prestacion'
        Title.Caption = 'Codigo prestaci'#243'n'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dv_cantprestacion'
        Title.Alignment = taCenter
        Title.Caption = 'Cant.'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcionprest'
        Title.Caption = 'Descripci'#243'n prestaci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dv_valorprestacion'
        Title.Alignment = taCenter
        Title.Caption = 'Valor prestaci'#243'n'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_original'
        Title.Caption = 'D'#233'bito Original'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_codoriginal'
        Title.Caption = 'Cod. Original'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 121
    Width = 569
    Height = 331
    BorderStyle = bsSingle
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 295
      Width = 561
    end
    object Label1: TLabel [1]
      Left = 26
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label2: TLabel [2]
      Left = 34
      Top = 73
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label3: TLabel [3]
      Left = 35
      Top = 95
      Width = 31
      Height = 13
      Caption = 'D'#233'bito'
    end
    object lblDatSin: TLabel [4]
      Left = 177
      Top = 11
      Width = 251
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [5]
      Left = 5
      Top = 196
      Width = 61
      Height = 13
      Caption = 'F. prestaci'#243'n'
    end
    object lbPrestacion: TLabel [6]
      Left = 16
      Top = 245
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object Label5: TLabel [7]
      Left = 13
      Top = 269
      Width = 53
      Height = 13
      Caption = 'Valor prest.'
    end
    object Label6: TLabel [8]
      Left = 24
      Top = 221
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object Label7: TLabel [9]
      Left = 31
      Top = 46
      Width = 35
      Height = 13
      Caption = 'Original'
    end
    inherited btnAceptar: TButton
      Left = 411
      Top = 301
      TabOrder = 11
    end
    inherited btnCancelar: TButton
      Left = 489
      Top = 301
      TabOrder = 12
    end
    inline fraMotivoABM: TfraCodigoDescripcion
      Left = 71
      Top = 69
      Width = 497
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Left = 56
        Width = 440
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 52
      end
    end
    object edSiniestroABM: TSinEdit
      Left = 72
      Top = 8
      Width = 100
      Height = 21
      OnEnter = edSiniestroABMExit
      OnExit = edSiniestroABMExit
      TabOrder = 0
    end
    object edDebitoABM: TMemo
      Left = 72
      Top = 95
      Width = 493
      Height = 90
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 600
      TabOrder = 6
    end
    object chkObsIntABM: TCheckBox
      Left = 440
      Top = 10
      Width = 117
      Height = 17
      Caption = 'Observaci'#243'n interna'
      TabOrder = 1
      OnClick = chkObsIntABMClick
    end
    object dcFPrestacionABM: TDateComboBox
      Left = 72
      Top = 191
      Width = 88
      Height = 21
      Enabled = False
      TabOrder = 7
      OnEnter = dcFPrestacionABMEnter
      OnExit = dcFPrestacionABMExit
    end
    inline fraNomencladorABM: TfraNomenclador
      Left = 72
      Top = 240
      Width = 495
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      PopupMenu = fraNomencladorABM.PopupMenu
      TabOrder = 9
      DesignSize = (
        495
        24)
      inherited cmbDescripcion: TLookupComboDlg
        Width = 380
        OnButtonClick = fraNomencladorABMcmbDescripcionButtonClick
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Left = 42
      end
    end
    object edValorABM: TCurrencyEdit
      Left = 72
      Top = 265
      Width = 75
      Height = 21
      AutoSize = False
      Enabled = False
      MaxLength = 15
      MaxValue = 999999999999.990000000000000000
      TabOrder = 10
    end
    object edCantidadABM: TCurrencyEdit
      Left = 72
      Top = 216
      Width = 50
      Height = 21
      AutoSize = False
      Color = clWhite
      DisplayFormat = ',0.00;- ,0.00'
      Enabled = False
      MaxLength = 5
      MaxValue = 999.990000000000000000
      TabOrder = 8
      OnEnter = edCantidadABMEnter
      OnExit = edCantidadABMExit
    end
    object rgOriginal: TRadioGroup
      Left = 73
      Top = 34
      Width = 96
      Height = 30
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Si'
        'No')
      TabOrder = 2
      TabStop = True
      OnClick = rgOriginalClick
    end
    object btnVerOrig: TButton
      Left = 519
      Top = 41
      Width = 29
      Height = 21
      Caption = '>>'
      TabOrder = 4
      OnClick = btnVerOrigClick
    end
    object fpObsDebOriginal: TFormPanel
      Left = 176
      Top = 60
      Width = 269
      Height = 205
      FormWidth = 0
      FormHeigth = 0
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        269
        205)
      object Label8: TLabel
        Left = 11
        Top = 6
        Width = 156
        Height = 13
        Caption = 'Observaciones del d'#233'bito original'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 168
        Width = 253
        Height = 1
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object mObservDebOrig: TMemo
        Left = 12
        Top = 26
        Width = 245
        Height = 137
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 0
      end
      object Button1: TButton
        Left = 185
        Top = 174
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
    end
    object cmbOriginales: TArtComboBox
      Left = 176
      Top = 40
      Width = 335
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ReadOnly = True
      TabOrder = 3
      Columns = <
        item
          Expanded = False
          FieldName = 'dv_codigo'
          Title.Caption = 'C'#243'digo Original'
          Visible = True
        end>
      DataSource = dsOriginales
      FieldList = 'dv_codigo'
      FieldKey = 'dv_codigo'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT dv_id, dv_siniestro, dv_orden, dv_recaida, dv_observacion' +
        ','
      
        '       DECODE(dv_aplicado, '#39'S'#39', '#39'Aplicado'#39', '#39'Sin aplicar'#39') estad' +
        'o, ma_descripcion, '
      
        '       art.utiles.armar_siniestro(dv_siniestro, dv_orden, dv_rec' +
        'aida) siniestro,'
      
        '       dv_aplicado, se_nombre, ma_codigo, ma_id,  dv_fechabaja, ' +
        'tj_nombre, dv_numpago,'
      '       dv_original, dv_codoriginal'
      
        '  FROM SIN.sdv_debitosvolantes, SIN.sma_motivosdebitosauditoria,' +
        ' art.use_usuarios,'
      '       art.sex_expedientes, ctj_trabajador '
      ' WHERE dv_idmotivo = ma_id'
      '   AND dv_usualta = se_usuario'
      '   AND dv_siniestro = ex_siniestro'
      '   AND dv_orden = ex_orden'
      '   AND dv_recaida = ex_recaida'
      '   AND ex_idtrabajador = tj_id'
      '   AND dv_volante = :volante')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'volante'
        ParamType = ptInput
      end>
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoEspecialABM'
      end>
    DBLogin = frmPrincipal.DBLogin
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
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
        LinkControl = tbSalir2
      end
      item
        Key = 16454
        LinkControl = tbFinAuditoria
      end
      item
        Key = 16449
        LinkControl = tbAvalarDebitos
      end
      item
        Key = 16466
        LinkControl = tbRechazarDebitos
      end
      item
        Key = 16464
        LinkControl = tbAplicarDebito
      end>
    Left = 24
    Top = 172
  end
  object sdqOriginales: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT dv_codigo'
      '  FROM SIN.sdv_debitosvolantes'
      ' WHERE dv_fechabaja IS NULL'
      '   AND dv_siniestro = :siniestro'
      '   AND dv_orden = :orden'
      '   AND dv_recaida = :recaida'
      '   AND dv_original = '#39'S'#39
      'UNION ALL'
      'SELECT '#39'Sin original'#39' FROM DUAL'
      '')
    Left = 360
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'recaida'
        ParamType = ptInput
      end>
  end
  object dsOriginales: TDataSource
    DataSet = sdqOriginales
    Left = 396
    Top = 172
  end
end
