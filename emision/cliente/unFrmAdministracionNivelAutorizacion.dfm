inherited FrmAdministracionNivelesAutorizacion: TFrmAdministracionNivelesAutorizacion
  Left = 194
  Top = 95
  Width = 683
  Height = 607
  Caption = 'Mantenimiento de Niveles de Autorizaci'#243'n Requerido'
  PixelsPerInch = 96
  TextHeight = 13
  object fpAsignacionUsuarios: TFormPanel [0]
    Left = 108
    Top = 56
    Width = 501
    Height = 289
    Caption = 'Asignaci'#243'n de Usuarios'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnClose = fpAsignacionUsuariosClose
    DesignSize = (
      501
      289)
    object TBevel
      Left = 4
      Top = 253
      Width = 493
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblNivelAsignacionUsuario: TLabel
      Left = 10
      Top = 17
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object btnAceptarAsignacionUsuario: TButton
      Left = 343
      Top = 259
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarAsignacionUsuarioClick
    end
    object btnCancelarAsignacionUsuario: TButton
      Left = 421
      Top = 259
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarAsignacionUsuarioClick
    end
    object edtNivelAutorizacion: TEdit
      Left = 48
      Top = 14
      Width = 441
      Height = 21
      BiDiMode = bdLeftToRight
      Color = 14795201
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object btnAgregar: TButton
      Left = 203
      Top = 80
      Width = 75
      Height = 25
      Caption = '>'
      TabOrder = 3
      OnClick = btnAgregarClick
    end
    object btnQuitar: TButton
      Left = 203
      Top = 136
      Width = 75
      Height = 25
      Caption = '<'
      TabOrder = 4
      OnClick = btnQuitarClick
    end
    object lstUsuariosAsignados: TListView
      Left = 288
      Top = 53
      Width = 188
      Height = 193
      Columns = <>
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      SortType = stText
      TabOrder = 5
      ViewStyle = vsList
    end
    object btnEliminarTodosUsuarios: TButton
      Left = 203
      Top = 164
      Width = 75
      Height = 25
      Caption = '<<'
      TabOrder = 6
      OnClick = btnEliminarTodosUsuariosClick
    end
    object btnAgregarTodosUsuarios: TButton
      Left = 203
      Top = 108
      Width = 75
      Height = 25
      Caption = '>>'
      TabOrder = 7
      OnClick = btnAgregarTodosUsuariosClick
    end
    object lstUsuariosDisponibles: TListView
      Left = 8
      Top = 53
      Width = 188
      Height = 193
      Columns = <>
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      SortType = stText
      TabOrder = 8
      ViewStyle = vsList
    end
  end
  inherited pnlFiltros: TPanel
    Width = 675
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 675
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 671
      end>
    inherited ToolBar: TToolBar
      Width = 658
      Hint = 'Mantenimiento de Niveles de Autorizaci'#243'n'
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 22
        Visible = True
        OnClick = tbPropiedadesClick
      end
      object btnVerificacion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Verificaci'#243'n'
        Caption = 'Verificacion'
        ImageIndex = 13
        Visible = False
        OnClick = btnVerificacionClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 675
    Height = 550
    Columns = <
      item
        Expanded = False
        FieldName = 'AplicaA'
        Title.Caption = 'Aplica A'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoNomina'
        Title.Caption = 'Tipo N'#243'mina'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NA_DESCRIPCION'
        Title.Caption = 'Nivel'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODOSDESDE'
        Title.Caption = 'Cant.Min.Periodos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODOSHASTA'
        Title.Caption = 'Cant.Max.Periodos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_MONTODESDE'
        Title.Caption = 'Monto Dif.Min.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_MONTOHASTA'
        Title.Caption = 'Monto Dif.Max.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_FECHAANTERIOR'
        Title.Caption = 'F.Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_FECHAPOSTERIOR'
        Title.Caption = 'F.Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PORCENTAJEVARIACIONDESDE'
        Title.Caption = 'Porcentaje Variaci'#243'n Dev.Desde'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PORCENTAJEVARIACIONHASTA'
        Title.Caption = 'Porcentaje Variaci'#243'n Dev.Hasta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_VARIACIONTRABAJADORDESDE'
        Title.Caption = 'Porcentaje Variaci'#243'n Emp.Desde'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_VARIACIONTRABAJADORHASTA'
        Title.Caption = 'Porcentaje Variaci'#243'n Emp.Hasta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_VARIACIONMASADESDE'
        Title.Caption = 'Porcentaje Variaci'#243'n Masa Desde'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_VARIACIONMASAHASTA'
        Title.Caption = 'Porcentaje Variaci'#243'n Masa Hasta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODOVIGENCIADESDE'
        Title.Caption = 'Per'#237'odo de Vigencia Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODOVIGENCIAHASTA'
        Title.Caption = 'Per'#237'odo de Vigencia Hasta'
        Visible = True
      end>
  end
  object fpVerificacionCondiciones: TFormPanel [4]
    Left = 72
    Top = 228
    Width = 597
    Height = 277
    Caption = 'Verificar Impacto'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnClose = fpAsignacionUsuariosClose
    DesignSize = (
      597
      277)
    object TBevel
      Left = 4
      Top = 241
      Width = 589
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnSalirVerificacion: TButton
      Left = 435
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
    end
    object JvDBGrid1: TJvDBGrid
      Left = 7
      Top = 48
      Width = 586
      Height = 189
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsVerificacion
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'RP_CONTRATO'
          Title.Caption = 'Contrato'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EM_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 179
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RP_IDNIVELAUTORIZACION'
          Title.Caption = 'Nivel'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NA_DESCRIPCION'
          Title.Caption = 'Desc.Nivel'
          Visible = True
        end>
    end
    object gbVerificacionPeriodos: TGroupBox
      Left = 6
      Top = 5
      Width = 587
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object lblPeriodosFiltro: TLabel
        Left = 25
        Top = 15
        Width = 44
        Height = 13
        Caption = 'Periodos:'
      end
      object ppPeriodos: TPeriodoPicker
        Left = 80
        Top = 12
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205506'
        Periodo.MinPeriodo = '195506'
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
      object ToolBar1: TToolBar
        Left = 137
        Top = 10
        Width = 47
        Height = 26
        Hint = 'Mantenimiento de Niveles de Autorizaci'#243'n'
        Align = alNone
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilColor
        Images = DmEmision.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object tbRefrescarVerificacion: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          ImageIndex = 0
          OnClick = tbRefrescarVerificacionClick
        end
      end
    end
    object btnCancelarVerificacion: TButton
      Left = 518
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 136
    Width = 517
    Height = 321
    Caption = 'Nivel de Autorizaci'#243'n'
    DesignSize = (
      517
      321)
    inherited BevelAbm: TBevel
      Top = 285
      Width = 509
    end
    object lblNivel: TLabel [1]
      Left = 10
      Top = 10
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object lblMontoMinimo: TLabel [2]
      Left = 10
      Top = 36
      Width = 58
      Height = 13
      Caption = 'Monto M'#237'n.:'
    end
    object lblMontoMaximo: TLabel [3]
      Left = 316
      Top = 36
      Width = 59
      Height = 13
      Caption = 'Monto M'#225'x.:'
    end
    object lblPeriodosDesde: TLabel [4]
      Left = 10
      Top = 61
      Width = 93
      Height = 13
      Caption = 'Cant.Per'#237'odos M'#237'n:'
    end
    object lblPeriodoHasta: TLabel [5]
      Left = 316
      Top = 61
      Width = 94
      Height = 13
      Caption = 'Cant.Per'#237'odos M'#225'x:'
    end
    object lblVigenciaDesde: TLabel [6]
      Left = 0
      Top = 292
      Width = 78
      Height = 13
      Caption = 'Vigencia Desde:'
      Visible = False
    end
    object lblVigenciaHasta: TLabel [7]
      Left = 178
      Top = 292
      Width = 75
      Height = 13
      Caption = 'Vigencia Hasta:'
      Visible = False
    end
    object Label1: TLabel [8]
      Left = 10
      Top = 85
      Width = 115
      Height = 13
      Caption = '% Variaci'#243'n Dev.Desde:'
    end
    object Label2: TLabel [9]
      Left = 304
      Top = 85
      Width = 112
      Height = 13
      Caption = '% Variaci'#243'n Dev.Hasta:'
    end
    object Label3: TLabel [10]
      Left = 11
      Top = 226
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lblPerVigenciaDesde: TLabel [11]
      Left = 11
      Top = 156
      Width = 77
      Height = 13
      Caption = 'Per. Vig. Desde:'
    end
    object Label5: TLabel [12]
      Left = 317
      Top = 156
      Width = 68
      Height = 13
      Caption = 'Per.Vig.Hasta:'
    end
    object lblAplicaA: TLabel [13]
      Left = 11
      Top = 180
      Width = 41
      Height = 13
      Caption = 'Aplica a:'
    end
    object lblTipoNomina: TLabel [14]
      Left = 11
      Top = 204
      Width = 75
      Height = 13
      Caption = 'Tipo de N'#243'mina'
    end
    object Label4: TLabel [15]
      Left = 10
      Top = 109
      Width = 116
      Height = 13
      Caption = '% Variaci'#243'n Emp.Desde:'
    end
    object Label6: TLabel [16]
      Left = 304
      Top = 109
      Width = 113
      Height = 13
      Caption = '% Variaci'#243'n Emp.Hasta:'
    end
    object Label7: TLabel [17]
      Left = 10
      Top = 133
      Width = 121
      Height = 13
      Caption = '% Variaci'#243'n Masa Desde:'
    end
    object Label8: TLabel [18]
      Left = 299
      Top = 133
      Width = 118
      Height = 13
      Caption = '% Variaci'#243'n Masa Hasta:'
    end
    inherited btnAceptar: TButton
      Left = 359
      Top = 291
      TabOrder = 18
    end
    inherited btnCancelar: TButton
      Left = 437
      Top = 291
      TabOrder = 19
    end
    object edtMontoMinimo: TCurrencyEdit
      Left = 105
      Top = 31
      Width = 88
      Height = 21
      AutoSize = False
      TabOrder = 1
    end
    object edtMontoMaximo: TCurrencyEdit
      Left = 419
      Top = 31
      Width = 88
      Height = 21
      AutoSize = False
      TabOrder = 2
    end
    object edtCantidadPeriodosMin: TIntEdit
      Left = 105
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 3
      Alignment = taRightJustify
    end
    object edtCantidadPeriodosMax: TIntEdit
      Left = 419
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 4
      Alignment = taRightJustify
    end
    object edtFechaVigenciaDesdexxx: TDateComboBox
      Left = 87
      Top = 288
      Width = 88
      Height = 21
      TabOrder = 7
      Visible = False
    end
    object edtFechaVigenciaHastaxxx: TDateComboBox
      Left = 265
      Top = 288
      Width = 88
      Height = 21
      TabOrder = 8
      Visible = False
    end
    inline fraNivelAutorizacion: TfraCodigoDescripcionExt
      Left = 105
      Top = 5
      Width = 407
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 61
        Width = 342
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 57
        Alignment = taRightJustify
      end
    end
    object edPorcentajeVariacionDevDesde: TIntEdit
      Left = 132
      Top = 80
      Width = 88
      Height = 21
      TabOrder = 5
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edPorcentajeVariacionDevHasta: TIntEdit
      Left = 419
      Top = 80
      Width = 88
      Height = 21
      TabOrder = 6
      Alignment = taRightJustify
      MaxLength = 3
    end
    object mDescripcion: TMemo
      Left = 105
      Top = 226
      Width = 401
      Height = 45
      TabOrder = 17
    end
    object edtPeriodoDesde: TPeriodoPicker
      Left = 105
      Top = 152
      Width = 49
      Height = 21
      TabOrder = 13
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205511'
      Periodo.MinPeriodo = '195512'
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
    object edtPeriodoHasta: TPeriodoPicker
      Left = 420
      Top = 152
      Width = 49
      Height = 21
      TabOrder = 14
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205511'
      Periodo.MinPeriodo = '195512'
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
    object cbAplicaA: TExComboBox
      Left = 105
      Top = 176
      Width = 237
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 15
      Text = 'D=Declaraci'#243'n Jurada'
      OnChange = cbAplicaAChange
      Items.Strings = (
        'D=Declaraci'#243'n Jurada'
        'R=Rec'#225'lculo'
        'S=Simulaci'#243'n')
      ItemIndex = 0
      Options = [coGridLines]
      ValueWidth = 64
    end
    object cbTipoNomina: TExComboBox
      Left = 105
      Top = 201
      Width = 237
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 16
      Text = 'R=Rectificativa'
      Items.Strings = (
        'R=Rectificativa'
        'O=Original'
        'T=Todas')
      ItemIndex = 0
      Options = [coGridLines]
      ValueWidth = 64
    end
    object edPorcentajeVariacionEmpDesde: TIntEdit
      Left = 132
      Top = 104
      Width = 88
      Height = 21
      TabOrder = 9
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edPorcentajeVariacionEmpHasta: TIntEdit
      Left = 419
      Top = 104
      Width = 88
      Height = 21
      TabOrder = 10
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edPorcentajeVariacionMasaDesde: TIntEdit
      Left = 132
      Top = 128
      Width = 88
      Height = 21
      TabOrder = 11
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edPorcentajeVariacionMasaHasta: TIntEdit
      Left = 419
      Top = 128
      Width = 88
      Height = 21
      TabOrder = 12
      Alignment = taRightJustify
      MaxLength = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT INA.NA_ID,'
      
        '       INP.NP_ID, INP.NP_PERIODOSDESDE, INP.NP_PERIODOSHASTA, IN' +
        'P.NP_IDNIVELAUTORIZACION,'
      
        '       INP.NP_FECHAANTERIOR, INP.NP_FECHAPOSTERIOR, INP.NP_MONTO' +
        'DESDE,'
      
        '       INP.NP_MONTOHASTA, INA.NA_DESCRIPCION, INP.NP_PORCENTAJEV' +
        'ARIACIONDESDE, INP.NP_PORCENTAJEVARIACIONHASTA,'
      
        '       INP.NP_FECHABAJA, NP_DESCRIPCION, NP_PERIODOVIGENCIAHASTA' +
        ', NP_PERIODOVIGENCIADESDE,'
      '       INP.NP_VARIACIONTRABAJADORDESDE,'
      '       INP.NP_VARIACIONTRABAJADORHASTA,'
      '       INP.NP_VARIACIONMASADESDE,'
      '       INP.NP_VARIACIONMASAHASTA,'
      
        '       NP_TIPO, DECODE(NP_TIPO, '#39'D'#39', '#39'Declaraci'#243'n Jurada'#39', '#39'R'#39', ' +
        #39'Rec'#225'lculo'#39', '#39'S'#39', '#39'Simulaci'#243'n'#39') AplicaA,'
      
        '       NP_TIPONOMINA, DECODE(NP_TIPONOMINA, '#39'O'#39', '#39'Original'#39', '#39'R'#39 +
        ', '#39'Rectificativa'#39', '#39'T'#39', '#39'Todas'#39')  TipoNomina'
      
        '  FROM EMI.INP_NIVELAUTORIZACIONPERIODOS INP, EMI.INA_NIVELAUTOR' +
        'IZACION INA'
      ' WHERE ((INA.NA_ID = INP.NP_IDNIVELAUTORIZACION))'
      ' order by NP_TIPO, NP_TIPONOMINA')
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqUsuariosDisponibles: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT us.se_usuario,'
      
        '       us.se_nombre || '#39' ('#39' || usc.sc_descripcion || '#39')'#39' usuario' +
        'sector'
      '  FROM art.use_usuarios us, art.usc_sectores usc'
      ' WHERE us.se_sector = usc.sc_codigo'
      '   AND se_fechabaja is null'
      '   AND usc.sc_codigo IN('#39'EMI'#39')'
      '   AND SE_USUARIOGENERICO <> '#39'S'#39
      '   AND NOT EXISTS('
      '          SELECT 1'
      '            FROM emi.inu_nivelautorizacionusuario inu'
      '           WHERE inu.nu_usuario = us.se_usuario'
      '             AND inu.nu_fechabaja is null '
      
        '             AND inu.nu_idnivelautorizacion = :idnivelautorizaci' +
        'on)')
    Left = 140
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idnivelautorizacion'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object sdqUsuariosAsignados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT INU.NU_USUARIO, US.SE_NOMBRE || '#39' ('#39' || USC.sc_descripcio' +
        'n || '#39')'#39' UsuarioSector, INU.nu_id'
      '  FROM EMI.INU_NIVELAUTORIZACIONUSUARIO INU,'
      '       ART.USE_USUARIOS US,'
      '       ART.USC_SECTORES USC'
      ' WHERE US.SE_USUARIO = INU.NU_USUARIO'
      '   AND INU.NU_IDNIVELAUTORIZACION = :IDNIVELAUTORIZACION'
      '   AND inu.nu_fechabaja is null '
      '   AND  us.se_sector = usc.sc_codigo'
      '   AND  se_fechabaja is null')
    Left = 172
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDNIVELAUTORIZACION'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object sdqVerificacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT rp_contrato,'
      '       rp_periodo,'
      '       em_nombre,'
      '       rp_idnivelautorizacion,'
      '       na_descripcion'
      '  FROM (SELECT rp_contrato,'
      '               rp_periodo,'
      '               rp_cuit,'
      
        '               emi.utiles.get_calcularnivelautoriz (rp_contrato,' +
        ' rp_periodo)'
      
        '                                                       rp_idnive' +
        'lautorizacion'
      '          FROM emi.irp_resumenperiodo'
      '         WHERE rp_periodo = :periodo) irp,'
      '       afi.aem_empresa aem,'
      '       emi.ina_nivelautorizacion ina'
      
        ' WHERE irp.rp_cuit = aem.em_cuit AND ina.na_id = rp_idnivelautor' +
        'izacion'
      '')
    Left = 368
    Top = 420
    ParamData = <
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = '200305'
      end>
  end
  object dsVerificacion: TDataSource
    DataSet = sdqVerificacion
    Left = 344
    Top = 420
  end
end
