inherited frmSeguimientoCasosLiquidar: TfrmSeguimientoCasosLiquidar
  Left = 268
  Top = 189
  Width = 791
  Height = 500
  Caption = 'Seguimiento de casos para liquidar'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 783
    Height = 145
    DesignSize = (
      783
      145)
    object chkFechaSin: TCheckPanel
      Left = 329
      Top = 97
      Width = 194
      Height = 45
      Caption = 'Fecha carga siniestro'
      TabOrder = 9
      Checked = False
      OnChange = chkFechaSinChange
      object Label1: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcCargaDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcCargaHasta
        TabOrder = 0
      end
      object dcCargaHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcCargaDesde
        TabOrder = 1
      end
    end
    object chkFechaAccid: TCheckPanel
      Left = 526
      Top = 97
      Width = 194
      Height = 45
      Caption = 'Fecha de accidente'
      TabOrder = 10
      Checked = False
      OnChange = chkFechaAccidChange
      object Label2: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcAccidDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcAccidHasta
        TabOrder = 0
      end
      object dcAccidHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcAccidDesde
        TabOrder = 1
      end
    end
    object chkTipoCaso: TCheckPanel
      Left = 1
      Top = 2
      Width = 303
      Height = 45
      Caption = 'Origen del caso'
      TabOrder = 0
      OnChange = chkTipoCasoChange
      DesignSize = (
        303
        45)
      inline fraOrigen: TfraCodDesc
        Left = 4
        Top = 16
        Width = 296
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          296
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 36
          Width = 259
        end
        inherited edCodigo: TPatternEdit
          Width = 32
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND oc_manual = '#39'S'#39
          ExtraFields = ', oc_automatico'
          FieldBaja = 'oc_fechabaja'
          FieldCodigo = 'oc_codigo'
          FieldDesc = 'oc_descripcion'
          FieldID = 'oc_id'
          OrderBy = 'oc_codigo'
          TableName = 'sin.soc_origencasosdocum'
          OnChange = fraOrigenPropiedadesChange
          Left = 100
        end
      end
    end
    object chkAccion: TCheckPanel
      Left = 307
      Top = 2
      Width = 124
      Height = 45
      Caption = 'Acci'#243'n realizada'
      TabOrder = 1
      object rbAccionSi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbAccionNo: TRadioButton
        Left = 35
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbAccionTodos: TRadioButton
        Left = 71
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    object chkFechaCaso: TCheckPanel
      Left = 132
      Top = 97
      Width = 194
      Height = 45
      Caption = 'Fecha del caso'
      TabOrder = 8
      Checked = False
      OnChange = chkFechaCasoChange
      object Label5: TLabel
        Left = 91
        Top = 23
        Width = 13
        Height = 11
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dcCasoDesde: TDateComboBox
        Left = 4
        Top = 19
        Width = 87
        Height = 21
        MaxDateCombo = dcCasoHasta
        TabOrder = 0
      end
      object dcCasoHasta: TDateComboBox
        Left = 104
        Top = 19
        Width = 87
        Height = 21
        MinDateCombo = dcCasoDesde
        TabOrder = 1
      end
    end
    object chkAccionRealizada: TCheckPanel
      Left = 433
      Top = 2
      Width = 349
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Acci'#243'n realizada'
      TabOrder = 2
      Checked = False
      OnChange = chkAccionRealizadaChange
      DesignSize = (
        349
        45)
      inline fraAccionRealizada: TfraCodDesc
        Left = 4
        Top = 16
        Width = 341
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          341
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 40
          Width = 300
        end
        inherited edCodigo: TPatternEdit
          Width = 36
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'td_fechabaja'
          FieldCodigo = 'td_codigo'
          FieldDesc = 'td_descripcion'
          FieldID = 'td_id'
          OrderBy = 'td_codigo'
          TableName = 'sin.std_tipodocumento'
          Left = 100
        end
      end
    end
    object chkEmpresa: TCheckPanel
      Left = 433
      Top = 49
      Width = 349
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa con pago directo'
      TabOrder = 6
      Checked = False
      OnChange = chkEmpresaChange
      DesignSize = (
        349
        45)
      inline fraEmpresa: TfraEmpresa
        Left = 3
        Top = 18
        Width = 343
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
          343
          21)
        inherited lbContrato: TLabel
          Left = 248
        end
        inherited mskCUIT: TMaskEdit
          Left = 2
        end
        inherited edContrato: TIntEdit
          Left = 293
          Width = 48
        end
        inherited cmbRSocial: TArtComboBox
          Left = 127
          Width = 119
        end
      end
    end
    object chkCorresponde: TCheckPanel
      Left = 1
      Top = 49
      Width = 125
      Height = 45
      Caption = 'Activos'
      TabOrder = 3
      object rbActivoSi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbActivoNo: TRadioButton
        Left = 34
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbActivoTodos: TRadioButton
        Left = 71
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    object chkTipoEmpresa: TCheckPanel
      Left = 129
      Top = 49
      Width = 176
      Height = 45
      Caption = 'Tipo de empresa'
      TabOrder = 4
      Checked = False
      OnChange = chkTipoEmpresaChange
      object rbSussSi: TRadioButton
        Left = 5
        Top = 20
        Width = 50
        Height = 17
        Caption = 'SUSS'
        TabOrder = 0
      end
      object rbSussNo: TRadioButton
        Left = 55
        Top = 20
        Width = 68
        Height = 17
        Caption = 'No SUSS'
        TabOrder = 1
      end
      object rbSussTodas: TRadioButton
        Left = 123
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object chkSiniestro: TCheckPanel
      Left = 1
      Top = 97
      Width = 128
      Height = 45
      Caption = 'Siniestro'
      TabOrder = 7
      Checked = False
      OnChange = chkSiniestroChange
      object edSiniestro: TSinEdit
        Left = 6
        Top = 19
        Width = 115
        Height = 21
        TabOrder = 0
      end
    end
    object chkAltaManual: TCheckPanel
      Left = 307
      Top = 49
      Width = 124
      Height = 45
      Caption = 'Alta manual'
      TabOrder = 5
      Checked = False
      OnChange = chkAltaManualChange
      object rbManualSi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbManualNo: TRadioButton
        Left = 35
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbManualTodos: TRadioButton
        Left = 71
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 145
    Width = 783
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 779
      end>
    inherited ToolBar: TToolBar
      Width = 766
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'No corresponde (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCantRegistros: TToolButton
        Left = 370
        Top = 0
        Caption = 'tbCantRegistros'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbCantRegistrosClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
      object tbSepTotal: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'tbSepTotal'
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object pnlTotal: TPanel
        Left = 432
        Top = 0
        Width = 165
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 174
    Width = 783
    Height = 296
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. accidente'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'Baja m'#233'dica'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'Alta m'#233'dica'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHARECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'F. recaida'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FBAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. proceso baja'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HL_FECHAEGRESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. egreso trab.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CL_OBSERVACIONES'
        Title.Caption = 'Obsevaciones'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAINGRESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. del caso'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. carga sin.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACCIONREALIZADA'
        Title.Alignment = taCenter
        Title.Caption = 'Con acci'#243'n'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCIONES'
        Title.Caption = 'Acciones realizadas'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Origen del caso'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOEMP'
        Title.Caption = 'Tipo empresa'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CL_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. baja caso'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOBAJA'
        Title.Caption = 'Motivo egreso trabajador'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'F. dictamen'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. carga dictamen'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Caption = 'Comisi'#243'n m'#233'dica'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_EXPEDINCAPACIDAD'
        Title.Caption = 'Exped. incapacidad'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. rec. dictamen'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CL_ALTAMANUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Alta manual'
        Width = 65
        Visible = True
      end>
  end
  object fpAcciones: TFormPanel [3]
    Left = 193
    Top = 198
    Width = 447
    Height = 332
    Caption = 'Acciones realizadas'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpAccionesBeforeShow
    DesignSize = (
      447
      332)
    object BevelAbm: TBevel
      Left = 4
      Top = 296
      Width = 439
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 7
      Top = 252
      Width = 37
      Height = 13
      Caption = 'Observ.'
    end
    object Label8: TLabel
      Left = 7
      Top = 231
      Width = 33
      Height = 13
      Caption = 'Acci'#243'n'
    end
    object btnAceptar: TButton
      Left = 289
      Top = 302
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 367
      Top = 302
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 3
    end
    object GroupBox4: TGroupBox
      Left = 5
      Top = 1
      Width = 438
      Height = 222
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        438
        222)
      object Label4: TLabel
        Left = 4
        Top = 13
        Width = 40
        Height = 13
        Caption = 'Siniestro'
      end
      object Label6: TLabel
        Left = 4
        Top = 60
        Width = 31
        Height = 13
        Caption = 'Origen'
      end
      object Label7: TLabel
        Left = 4
        Top = 81
        Width = 47
        Height = 26
        Caption = 'Acciones'#13#10'realizadas'
      end
      object Label12: TLabel
        Left = 4
        Top = 37
        Width = 47
        Height = 13
        Caption = 'G.Trabajo'
      end
      object edSinABM: TSinEdit
        Left = 55
        Top = 10
        Width = 116
        Height = 21
        TabOrder = 0
        ReadOnly = True
        Color = 15262169
      end
      object edAccionesABM: TMemo
        Left = 55
        Top = 80
        Width = 379
        Height = 136
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 15262169
        ReadOnly = True
        TabOrder = 1
      end
      inline fraOrigenABM: TfraCodDesc
        Left = 54
        Top = 55
        Width = 381
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          381
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 40
          Width = 341
          Color = 15262169
        end
        inherited edCodigo: TPatternEdit
          Width = 36
          Color = 15262169
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND oc_manual = '#39'S'#39
          ExtraFields = ', oc_automatico'
          FieldBaja = 'oc_fechabaja'
          FieldCodigo = 'oc_codigo'
          FieldDesc = 'oc_descripcion'
          FieldID = 'oc_id'
          OrderBy = 'oc_codigo'
          TableName = 'sin.soc_origencasosdocum'
          Left = 100
        end
      end
      object edGTrabajo: TEdit
        Left = 55
        Top = 33
        Width = 379
        Height = 21
        Color = 15262169
        ReadOnly = True
        TabOrder = 3
      end
    end
    object edObservacionesABM: TMemo
      Left = 48
      Top = 251
      Width = 394
      Height = 42
      Anchors = [akLeft, akRight, akBottom]
      MaxLength = 250
      TabOrder = 1
    end
    inline fraAccionABM: TfraCodDesc
      Left = 48
      Top = 226
      Width = 397
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        397
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Width = 355
      end
      inherited edCodigo: TPatternEdit
        Width = 36
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'td_fechabaja'
        FieldCodigo = 'td_codigo'
        FieldDesc = 'td_descripcion'
        FieldID = 'td_id'
        OrderBy = 'td_codigo'
        TableName = 'sin.std_tipodocumento'
        Left = 100
      end
    end
  end
  object fpAlta: TFormPanel [4]
    Left = 220
    Top = 228
    Width = 388
    Height = 142
    Caption = 'Alta de caso'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpAltaBeforeShow
    DesignSize = (
      388
      142)
    object Bevel1: TBevel
      Left = 4
      Top = 106
      Width = 380
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label9: TLabel
      Left = 4
      Top = 57
      Width = 37
      Height = 13
      Caption = 'Observ.'
    end
    object Label10: TLabel
      Left = 4
      Top = 36
      Width = 31
      Height = 13
      Caption = 'Origen'
    end
    object Label11: TLabel
      Left = 4
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object lblTrabajador: TLabel
      Left = 152
      Top = 12
      Width = 228
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '-'
    end
    object btnAceptarAlta: TButton
      Left = 230
      Top = 112
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarAltaClick
    end
    object btnCancelarAlta: TButton
      Left = 308
      Top = 112
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edObservacionesAlta: TMemo
      Left = 47
      Top = 58
      Width = 335
      Height = 43
      Anchors = [akLeft, akRight, akBottom]
      MaxLength = 250
      TabOrder = 2
    end
    inline fraOrigenAlta: TfraCodDesc
      Left = 47
      Top = 32
      Width = 337
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        337
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Width = 297
      end
      inherited edCodigo: TPatternEdit
        Width = 36
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 'AND oc_manual = '#39'S'#39
        ExtraFields = ', oc_automatico'
        FieldBaja = 'oc_fechabaja'
        FieldCodigo = 'oc_codigo'
        FieldDesc = 'oc_descripcion'
        FieldID = 'oc_id'
        OrderBy = 'oc_codigo'
        TableName = 'sin.soc_origencasosdocum'
        Left = 100
      end
    end
    object edSinAlta: TSinEdit
      Left = 48
      Top = 8
      Width = 100
      Height = 21
      TabOrder = 0
      OnSelect = edSinAltaSelect
    end
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'F. Accid.'
        TitleAlignment = taCenter
        DataField = 'EX_FECHAACCIDENTE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Baja m'#233'd.'
        TitleAlignment = taCenter
        DataField = 'EX_BAJAMEDICA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Alta m'#233'd.'
        TitleAlignment = taCenter
        DataField = 'EX_ALTAMEDICA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'F. recaida'
        TitleAlignment = taCenter
        DataField = 'EX_FECHARECAIDA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Carga Sin.'
        TitleAlignment = taCenter
        DataField = 'EX_FECHAALTA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        MaxLength = 26
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        MaxLength = 40
      end
      item
        Title = 'T. emp.'
        DataField = 'TIPOEMP'
        MaxLength = 7
      end
      item
        Title = 'Acciones realizadas'
        DataField = 'ACCIONES'
        MaxLength = 40
      end
      item
        Title = 'Motivo Egreso'
        DataField = 'motivobaja'
        MaxLength = 15
      end
      item
        Title = 'Fecha caso'
        DataField = 'cl_fechaalta'
        MaxLength = 0
      end>
    Title.Text = 'Seguimiento de casos para liquidar'
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
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
        LinkControl = tbSalir2
      end>
    Left = 80
    Top = 256
  end
  object qpOrigen1: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'F. Accid.'
        TitleAlignment = taCenter
        DataField = 'EX_FECHAACCIDENTE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Baja m'#233'd.'
        TitleAlignment = taCenter
        DataField = 'EX_BAJAMEDICA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Alta m'#233'd.'
        TitleAlignment = taCenter
        DataField = 'EX_ALTAMEDICA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'F. egreso trab.'
        TitleAlignment = taCenter
        DataField = 'HL_FECHAEGRESO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        MaxLength = 26
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        MaxLength = 50
      end
      item
        Title = 'Tipo emp.'
        DataField = 'TIPOEMP'
        MaxLength = 11
      end
      item
        Title = 'F. dictamen'
        TitleAlignment = taCenter
        DataField = 'EV_FECHA'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'F. carga dic.'
        TitleAlignment = taCenter
        DataField = 'EV_FECHAALTA'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Exped. incap.'
        DataField = 'EV_EXPEDINCAPACIDAD'
        MaxLength = 13
      end
      item
        Title = 'Comisi'#243'n medica'
        DataField = 'COMISION'
        MaxLength = 0
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Seguimiento de casos para liquidar'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
    PrinterOptions.PrintDialog = PrintDialog
    Left = 80
    Top = 284
  end
end
