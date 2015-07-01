inherited frmRiesgos: TfrmRiesgos
  Left = 277
  Top = 128
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  ClientWidth = 736
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 29
    Width = 736
    Height = 53
    Visible = True
    object lblRiesgos: TLabel
      Left = 384
      Top = 29
      Width = 41
      Height = 13
      Caption = 'Riesgos:'
    end
    object lblCUIL: TLabel
      Left = 384
      Top = 7
      Width = 27
      Height = 13
      Caption = 'CUIL:'
    end
    object lblRelevamiento: TLabel
      Left = 12
      Top = 7
      Width = 69
      Height = 13
      Caption = 'Relevamiento:'
    end
    inline fraRiesgosFiltro: TfraCodigoDescripcion
      Left = 428
      Top = 25
      Width = 307
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 239
      end
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 59
      end
    end
    object clbRelevamiento: TJvCheckListBox
      Left = 85
      Top = 3
      Width = 291
      Height = 43
      ItemHeight = 13
      TabOrder = 0
    end
    inline fraTrabajadorFiltro: TfraTrabajador
      Left = 430
      Top = 3
      Width = 301
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbNombre: TArtComboBox
        Width = 217
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 736
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 732
      end>
    inherited ToolBar: TToolBar
      Width = 719
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
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
        Enabled = False
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 383
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        OnClick = tbSumatoriaClick
      end
      object tbBajaCabecera: TToolButton
        Left = 406
        Top = 0
        Hint = 'Eliminar Cabecera'
        Caption = 'tbBajaCabecera'
        ImageIndex = 39
        OnClick = tbBajaCabeceraClick
      end
      object tbCargaMultiple: TToolButton
        Left = 429
        Top = 0
        Hint = 'Carga Multiple'
        Caption = 'tbCargaMultiple'
        ImageIndex = 19
        OnClick = tbCargaMultipleClick
      end
      object tbAsociarRelev: TToolButton
        Left = 452
        Top = 0
        Hint = 'Asociar Relevamiento'
        Caption = 'Asociar Relevamiento'
        ImageIndex = 22
        OnClick = tbAsociarRelevClick
      end
      object tbCargarIncumplido: TToolButton
        Left = 475
        Top = 0
        Hint = 'Cargar Incumplido'
        Caption = 'tbCargarIncumplido'
        ImageIndex = 18
        OnClick = tbCargarIncumplidoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 736
    Height = 357
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'RT_FECHA'
        Title.Caption = 'Fecha'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_FECHAINIEXPO'
        Title.Caption = 'Ini.Exposici'#243'n'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_RIESGONUEVO'
        Title.Caption = 'ESOP'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_RIESGO'
        Title.Caption = 'Riesgo Viejo'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_CUIL'
        Title.Caption = 'CUIL'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREA'
        Title.Caption = 'Tarea'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAINGRESO'
        Title.Caption = 'F. Ingreso'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecharecepprev'
        Title.Caption = 'Fecha de rececpcion del preventor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecharecepcord'
        Title.Caption = 'Fecha de rececpcion del coordinador'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 118
    Top = 130
    Width = 481
    Height = 177
    inherited BevelAbm: TBevel
      Top = 141
      Width = 473
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblFechaInicioExp: TLabel [2]
      Left = 158
      Top = 65
      Width = 129
      Height = 13
      Caption = 'Fecha Inicio de Exposici'#243'n:'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 116
      Width = 41
      Height = 13
      Caption = 'Riesgos:'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 41
      Width = 27
      Height = 13
      Caption = 'CUIL:'
    end
    object lblFechaIngreso: TLabel [5]
      Left = 8
      Top = 65
      Width = 51
      Height = 13
      Caption = 'F.Ingreso:'
    end
    object lblSector: TLabel [6]
      Left = 8
      Top = 92
      Width = 35
      Height = 13
      Caption = 'Sector:'
    end
    object lblTarea: TLabel [7]
      Left = 240
      Top = 92
      Width = 32
      Height = 13
      Caption = 'Tarea:'
    end
    inherited btnAceptar: TButton
      Left = 326
      Top = 147
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 401
      Top = 147
      TabOrder = 9
    end
    object edFecha: TDateComboBox
      Left = 63
      Top = 12
      Width = 90
      Height = 21
      TabOrder = 0
    end
    object cbSinExpuestos: TCheckBox
      Left = 156
      Top = 12
      Width = 90
      Height = 21
      Caption = 'Sin Expuestos'
      TabOrder = 1
      OnClick = cbSinExpuestosClick
    end
    object edFechaInicio: TDateComboBox
      Left = 290
      Top = 62
      Width = 90
      Height = 21
      TabOrder = 4
    end
    inline fraTrabajador: TfraTrabajador
      Left = 63
      Top = 37
      Width = 411
      Height = 22
      TabOrder = 2
      inherited cmbNombre: TArtComboBox
        Width = 327
      end
    end
    inline fraRiesgos: TfraCodigoDescripcion
      Left = 62
      Top = 113
      Width = 411
      Height = 23
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 347
        DataSource = nil
      end
    end
    object edFechaIngreso: TDateComboBox
      Left = 63
      Top = 62
      Width = 90
      Height = 21
      TabOrder = 3
    end
    object edSector: TEdit
      Left = 63
      Top = 88
      Width = 162
      Height = 21
      MaxLength = 50
      TabOrder = 5
    end
    object edTarea: TEdit
      Left = 280
      Top = 88
      Width = 192
      Height = 21
      MaxLength = 50
      TabOrder = 6
    end
  end
  object fpRelevamientoImpresion: TFormPanel [4]
    Left = 356
    Top = 156
    Width = 354
    Height = 125
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    DesignSize = (
      354
      125)
    object Bevel4: TBevel
      Left = 4
      Top = 89
      Width = 346
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label27: TLabel
      Left = 5
      Top = 11
      Width = 69
      Height = 13
      Caption = 'Relevamiento:'
    end
    object btnCopRecepAceptar: TButton
      Left = 196
      Top = 95
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnCopRecepAceptarClick
    end
    object btnCopRecepCancelar: TButton
      Left = 274
      Top = 95
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object clbrelevamientoimpresion: TJvCheckListBox
      Left = 75
      Top = 7
      Width = 273
      Height = 78
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object fpAsociarRelev: TFormPanel [5]
    Left = 160
    Top = 183
    Width = 421
    Height = 186
    Caption = 'Asociar Relevamiento'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      421
      186)
    object Bevel8: TBevel
      Left = 4
      Top = 150
      Width = 414
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblestablecimientos: TLabel
      Left = 12
      Top = 8
      Width = 83
      Height = 13
      Caption = 'Establecimientos:'
    end
    object btnAceptarCambioPreventor: TButton
      Left = 264
      Top = 156
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancelarCambioPreventor: TButton
      Left = 342
      Top = 156
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object clbestablecimientos: TARTCheckListBox
      Left = 12
      Top = 25
      Width = 401
      Height = 119
      Anchors = [akLeft, akTop, akRight]
      Columns = 1
      ItemHeight = 13
      TabOrder = 2
      AutoAjustarColumnas = True
      Locked = False
      SQL = 'SELECT 1,2 from dual'
    end
    object Button3: TButton
      Left = 12
      Top = 155
      Width = 101
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = 'Seleccionar Todo'
      TabOrder = 3
    end
  end
  object fpCargaRelevamientoInvalido: TFormPanel [6]
    Left = 273
    Top = 252
    Width = 222
    Height = 119
    Caption = 'Carga Relevamiento Invalido'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poScreenCenter
    Constraints.MinWidth = 200
    DesignSize = (
      222
      119)
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 84
      Height = 13
      Caption = 'Fecha Recepci'#243'n '
    end
    object Bevel1: TBevel
      Left = 5
      Top = 84
      Width = 213
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnFRecepAceptar: TButton
      Left = 63
      Top = 90
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnFRecepAceptarClick
    end
    object Button1: TButton
      Left = 143
      Top = 90
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edFechaRecepcionInvalido: TDateEdit
      Left = 118
      Top = 6
      Width = 94
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object cbNoCorrespondeESSOP: TCheckBox
      Left = 6
      Top = 33
      Width = 204
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'No corresponde ESSOP'
      ParentBiDiMode = False
      TabOrder = 3
      OnClick = cbNoCorrespondeESSOPClick
    end
    object cbFormularioInvalido: TCheckBox
      Left = 6
      Top = 57
      Width = 204
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Formulario Inv'#225'lido'
      ParentBiDiMode = False
      TabOrder = 4
      OnClick = cbFormularioInvalidoClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   rt_id, rt_fecha, '#39'CON RIESGO'#39' tipo, rt_riesgo,'
      
        '         TRIM ((NVL (rg_esop, '#39#39') || NVL (rg_sufijoesop, '#39#39'))) r' +
        't_riesgonuevo,'
      '         rg_descripcion, rt_cuil, rt_fechainiexpo,'
      
        '         NVL (tj_nombre, rt_nombre) nombre, TO_CHAR (NULL) secto' +
        'r,'
      '         TO_CHAR (NULL) tarea, TO_DATE (NULL) fechaingreso,'
      
        '         art.afiliacion.get_contratovigente (rt_cuit, rt_fecha) ' +
        'AS contrato,'
      '         rt_fechaalta AS fechaalta, rt_usualta AS usualta'
      '    FROM ctj_trabajador, art.prg_riesgos, art.prt_riestrab'
      '   WHERE rt_riesgo = rg_codigo'
      '     AND rt_cuil = tj_cuil(+)'
      '     AND rt_cuit = :cuit'
      '     AND rt_estableci = :estableci'
      '     AND NOT EXISTS ('
      '           SELECT 1'
      '             FROM crl_relacionlaboral'
      '            WHERE rl_contrato ='
      
        '                        art.afiliacion.get_contratovigente (rt_c' +
        'uit, rt_fecha)'
      '              AND rl_idtrabajador = tj_id)'
      'UNION'
      'SELECT   rt_id, rt_fecha, '#39'CON RIESGO'#39' tipo, rt_riesgo,'
      
        '         TRIM ((NVL (rg_esop, '#39#39') || NVL (rg_sufijoesop, '#39#39'))) r' +
        't_riesgonuevo,'
      '         rg_descripcion, rt_cuil, rt_fechainiexpo,'
      
        '         NVL (tj_nombre, rt_nombre) nombre, rl_sector sector, rl' +
        '_tarea tarea,'
      '         rl_fechaingreso fechaingreso, rl_contrato AS contrato,'
      '         rt_fechaalta AS fechaalta, rt_usualta AS usualta'
      
        '    FROM crl_relacionlaboral, ctj_trabajador, art.prg_riesgos, a' +
        'rt.prt_riestrab'
      '   WHERE rt_riesgo = rg_codigo'
      '     AND rt_cuil = tj_cuil(+)'
      '     AND rt_cuit = :cuit'
      '     AND rt_estableci = :estableci'
      
        '     AND rl_contrato = art.afiliacion.get_contratovigente (rt_cu' +
        'it, rt_fecha)'
      '     AND rl_idtrabajador = tj_id'
      'UNION ALL'
      
        'SELECT   NULL rt_id, sr_fecha, '#39'SIN RIESGO '#39' tipo, NULL rt_riesg' +
        'o,'
      '         NULL rt_riesgonuevo, NULL rg_descripcion, NULL rt_cuil,'
      
        '         NULL rt_fechainiexpo, NULL nombre, NULL sector, NULL ta' +
        'rea,'
      '         NULL fechaingreso,'
      
        '         art.afiliacion.get_contratovigente (sr_cuit, sr_fecha) ' +
        'AS contrato,'
      '         NULL AS fechaalta, NULL AS usualta'
      '    FROM art.psr_sinriesgo'
      '   WHERE sr_cuit = :cuit AND sr_estableci = :estableci'
      'ORDER BY rt_riesgo, rt_cuil, nombre')
    Left = 25
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
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
  end
  object pmnuOrden: TPopupMenu
    Left = 80
    Top = 256
    object mnuOrdSinOrdenRec: TMenuItem
      Caption = 'Imprimir Grilla'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuOrdEmpresa: TMenuItem
      Tag = 2
      Caption = 'Imprimir Formulario'
      OnClick = mnuOrdEmpresaClick
    end
  end
  object sdqExportacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 25
    Top = 312
  end
end
