inherited frmMedicamentosCronicos: TfrmMedicamentosCronicos
  Left = 267
  Top = 160
  Width = 852
  Height = 507
  Caption = 'Medicamentos de pacientes cr'#243'nicos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid [0]
    Top = 118
    Width = 844
    Height = 362
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accidente'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PC_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Paciente'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRIORIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Prior.'
        Width = 35
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
        FieldName = 'MEDIC'
        Title.Caption = 'Medicamentos'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'G. Trabajo'
        Width = 100
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [1]
    Width = 844
    Height = 89
    object GroupBox1: TGroupBox
      Left = 146
      Top = 0
      Width = 162
      Height = 43
      Caption = ' Rango siniestros '
      TabOrder = 1
      object Label5: TLabel
        Left = 74
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edSinHasta: TIntEdit
        Left = 90
        Top = 15
        Width = 64
        Height = 21
        TabOrder = 1
        AutoExit = True
      end
      object edSinDesde: TIntEdit
        Left = 5
        Top = 15
        Width = 66
        Height = 21
        TabOrder = 0
        OnExit = edSinDesdeExit
        AutoExit = True
      end
    end
    object gbFechaPostAlta: TGroupBox
      Left = 311
      Top = 0
      Width = 200
      Height = 43
      Caption = ' Fecha alta paciente '
      TabOrder = 2
      object Label7: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcMedDesde: TDateComboBox
        Left = 5
        Top = 15
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcMedHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcMedHasta: TDateComboBox
        Left = 108
        Top = 15
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcMedDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 43
      Width = 143
      Height = 43
      Caption = ' Prioridad entrega '
      TabOrder = 4
      object rbPrioNo: TRadioButton
        Left = 98
        Top = 19
        Width = 36
        Height = 17
        Caption = 'No'
        TabOrder = 2
      end
      object rbPrioSi: TRadioButton
        Left = 59
        Top = 19
        Width = 32
        Height = 17
        Caption = 'Si'
        TabOrder = 1
      end
      object rbPrioTodos: TRadioButton
        Left = 4
        Top = 19
        Width = 53
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 6
      Top = 0
      Width = 137
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 0
      object SinEdit: TSinEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object gbFecha: TGroupBox
      Left = 514
      Top = 0
      Width = 210
      Height = 43
      Caption = ' Fecha de accidente '
      TabOrder = 3
      object Label17: TLabel
        Left = 98
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcAcciDesde: TDateComboBox
        Left = 8
        Top = 15
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcAcciHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcAcciHasta: TDateComboBox
        Left = 114
        Top = 15
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcAcciDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object gbPeriodo: TGroupBox
      Left = 311
      Top = 43
      Width = 114
      Height = 43
      Caption = ' Per'#237'odo '
      TabOrder = 5
      object ppPerFiltro: TPeriodoPicker
        Left = 7
        Top = 16
        Width = 101
        Height = 21
        TabOrder = 0
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poMesAno
        Periodo.Separador = '/'
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '06/2050'
        Periodo.MinPeriodo = '06/1996'
        WidthMes = 22
        Separation = 1
        ShowButton = True
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
    end
    object GroupBox3: TGroupBox
      Left = 146
      Top = 43
      Width = 162
      Height = 43
      Caption = ' Per'#237'odo procesado '
      TabOrder = 6
      object rbProceNo: TRadioButton
        Left = 114
        Top = 19
        Width = 36
        Height = 17
        Caption = 'No'
        TabOrder = 2
      end
      object rbProceSi: TRadioButton
        Left = 67
        Top = 19
        Width = 32
        Height = 17
        Caption = 'Si'
        TabOrder = 1
      end
      object rbProceTodos: TRadioButton
        Left = 4
        Top = 19
        Width = 53
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
  end
  inherited CoolBar: TCoolBar [2]
    Top = 89
    Width = 844
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 840
      end>
    inherited ToolBar: TToolBar
      Width = 827
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Medicamentos'
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbBaseMedic: TToolButton
        Left = 378
        Top = 0
        Hint = 'Base de medicamentos'
        Caption = 'tbBaseMedic'
        ImageIndex = 18
        OnClick = tbBaseMedicClick
      end
      object tbGenPeriodo: TToolButton
        Left = 401
        Top = 0
        Hint = 'Per'#237'odos'
        Caption = 'tbGenPeriodo'
        ImageIndex = 16
        OnClick = tbGenPeriodoClick
      end
      object ToolButton9: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbProcesarPeriodos: TToolButton
        Left = 432
        Top = 0
        Hint = 'Procesar per'#237'odos'
        Caption = 'tbProcesarPeriodos'
        ImageIndex = 35
        OnClick = tbProcesarPeriodosClick
      end
      object ToolButton13: TToolButton
        Left = 455
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 463
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  object fpSelPeriodo: TFormPanel [3]
    Left = 51
    Top = 312
    Width = 279
    Height = 97
    Caption = 'Selecci'#243'n de per'#237'odo'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpSelPeriodoBeforeShow
    DesignSize = (
      279
      97)
    object Bevel6: TBevel
      Left = 3
      Top = 60
      Width = 273
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label18: TLabel
      Left = 8
      Top = 11
      Width = 164
      Height = 13
      Caption = 'Generar nuevo per'#237'odo en base a:'
    end
    object btnAceptarSel: TBitBtn
      Left = 113
      Top = 67
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarSelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelarSel: TBitBtn
      Left = 197
      Top = 67
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 2
      Kind = bkCancel
    end
    object ppSel: TPeriodoPicker
      Left = 175
      Top = 7
      Width = 97
      Height = 21
      TabOrder = 0
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poMesAno
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '06/2050'
      Periodo.MinPeriodo = '06/1996'
      WidthMes = 22
      Separation = 1
      ShowButton = True
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      OnChange = ppSelChange
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
    object edSel: TEdit
      Left = 9
      Top = 34
      Width = 263
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
  end
  object fpModifMedic: TFormPanel [4]
    Left = 155
    Top = 116
    Width = 426
    Height = 128
    Caption = 'Modificaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      426
      128)
    object Label20: TLabel
      Left = 4
      Top = 67
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Bevel4: TBevel
      Left = 3
      Top = 34
      Width = 420
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label21: TLabel
      Left = 4
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Producto:'
    end
    object Bevel8: TBevel
      Left = 3
      Top = 90
      Width = 420
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object chkSustituirMod: TCheckBox
      Left = 7
      Top = 41
      Width = 73
      Height = 17
      Caption = 'No sustituir'
      TabOrder = 0
    end
    object edObservMod: TEdit
      Left = 68
      Top = 63
      Width = 354
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
    end
    object btnAceptarMod: TBitBtn
      Left = 267
      Top = 96
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelarMod: TBitBtn
      Left = 347
      Top = 96
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 3
      Kind = bkCancel
    end
    object edMedicDrogaMod: TEdit
      Left = 56
      Top = 9
      Width = 366
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object fpComplementario: TFormPanel [5]
    Left = 171
    Top = 268
    Width = 426
    Height = 103
    Caption = 'Material complementario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpComplementarioBeforeShow
    DesignSize = (
      426
      103)
    object Label22: TLabel
      Left = 4
      Top = 15
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Bevel10: TBevel
      Left = 3
      Top = 65
      Width = 420
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object chkSustComp: TCheckBox
      Left = 7
      Top = 41
      Width = 73
      Height = 17
      Caption = 'No sustituir'
      TabOrder = 1
    end
    object edMaterialComp: TEdit
      Left = 48
      Top = 11
      Width = 374
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 0
    end
    object btnAceptarComp: TBitBtn
      Left = 267
      Top = 71
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarCompClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelarComp: TBitBtn
      Left = 347
      Top = 71
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 3
      Kind = bkCancel
    end
  end
  object fpMedicBase: TFormPanel [6]
    Left = 82
    Top = 217
    Width = 665
    Height = 388
    Caption = 'Base de medicamentos'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnClose = fpMedicBaseClose
    OnBeforeShow = fpMedicBaseBeforeShow
    Constraints.MinHeight = 320
    Constraints.MinWidth = 594
    DesignSize = (
      665
      388)
    object Label8: TLabel
      Left = 3
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label9: TLabel
      Left = 262
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Bevel2: TBevel
      Left = 3
      Top = 34
      Width = 659
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 10
      Top = 146
      Width = 161
      Height = 13
      Caption = 'Base de medicamentos asignados'
    end
    object Bevel3: TBevel
      Left = 3
      Top = 109
      Width = 659
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label11: TLabel
      Left = 292
      Top = 44
      Width = 62
      Height = 13
      Caption = 'Presentaci'#243'n'
    end
    object Label15: TLabel
      Left = 152
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Bevel1: TBevel
      Left = 3
      Top = 140
      Width = 659
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label19: TLabel
      Left = 8
      Top = 119
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object edSiniestroBase: TSinEdit
      Left = 48
      Top = 8
      Width = 100
      Height = 21
      OnExit = edSiniestroPacSelect
      TabOrder = 0
      OnSelect = edSiniestroPacSelect
      ReadOnly = True
      TabStop = False
      Color = clBtnFace
    end
    object edTrabajadorBase: TEdit
      Left = 318
      Top = 8
      Width = 341
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object btnCerrarBase: TBitBtn
      Left = 587
      Top = 357
      Width = 73
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      TabOrder = 11
      Kind = bkCancel
    end
    inline fraMedicBase: TfraCodigoDescripcion
      Left = 60
      Top = 64
      Width = 513
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 460
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    object btnAgregarBase: TBitBtn
      Left = 587
      Top = 160
      Width = 73
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Agregar'
      TabOrder = 9
      OnClick = btnAgregarBaseClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnQuitarBase: TBitBtn
      Left = 587
      Top = 197
      Width = 73
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Quitar'
      TabOrder = 10
      OnClick = btnQuitarBaseClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
        0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object chkSustBase: TCheckBox
      Left = 580
      Top = 67
      Width = 73
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No sustituir'
      TabOrder = 7
    end
    object rbDroga: TRadioButton
      Left = 6
      Top = 42
      Width = 53
      Height = 17
      Caption = 'Droga'
      TabOrder = 2
      OnClick = rbDrogaClick
    end
    object rbMedic: TRadioButton
      Left = 6
      Top = 67
      Width = 51
      Height = 17
      Caption = 'Medic.'
      TabOrder = 5
      OnClick = rbMedicClick
    end
    inline fraPresentBase: TfraCodigoDescripcion
      Left = 358
      Top = 39
      Width = 306
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Left = 36
        Width = 267
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 32
      end
    end
    inline fraDrogaBase: TfraCodDesc
      Left = 60
      Top = 39
      Width = 228
      Height = 23
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 175
        CharCase = ecUpperCase
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'dr_fechabaja'
        FieldCodigo = 'dr_codigo'
        FieldDesc = 'dr_descripcion'
        FieldID = 'dr_id'
        IdType = ctInteger
        OrderBy = 'dr_id'
        TableName = 'mdr_drogas'
        OnChange = fraDrogaBasePropiedadesChange
      end
    end
    object dgMedicBase: TArtDBGrid
      Left = 8
      Top = 162
      Width = 573
      Height = 221
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsBase
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dgMedicBaseDblClick
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'ma_medicdroga'
          Title.Caption = 'Medicamento/droga/material'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ma_presentacion'
          Title.Caption = 'Presentaci'#243'n'
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ma_observaciones'
          Title.Caption = 'Observaciones'
          Width = 130
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ma_sustituir'
          Title.Alignment = taCenter
          Title.Caption = 'Sust.'
          Width = 30
          Visible = True
        end>
    end
    object ppPerBase: TPeriodoPicker
      Left = 193
      Top = 8
      Width = 65
      Height = 21
      TabOrder = 13
      Color = clBtnFace
      Periodo.AllowNull = True
      Periodo.Orden = poMesAno
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '06/2050'
      Periodo.MinPeriodo = '06/1996'
      WidthMes = 22
      Separation = 1
      ShowButton = False
      ShowOrder = poMesAno
      ReadOnly = True
      Enabled = True
      OnChange = ppPeriodosChange
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
    object edObserBase: TEdit
      Left = 76
      Top = 115
      Width = 582
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 8
    end
    object rbDescartable: TRadioButton
      Left = 8
      Top = 91
      Width = 114
      Height = 15
      Caption = 'Material descartable'
      TabOrder = 14
      OnClick = rbDescartableClick
    end
  end
  object fpAltaPacientes: TFormPanel [7]
    Left = 59
    Top = 208
    Width = 612
    Height = 226
    Caption = 'Alta de paciente'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnBeforeShow = fpAltaPacientesBeforeShow
    Constraints.MinHeight = 187
    Constraints.MinWidth = 612
    DesignSize = (
      612
      226)
    object Label1: TLabel
      Left = 6
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label2: TLabel
      Left = 166
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Bevel7: TBevel
      Left = 3
      Top = 189
      Width = 606
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 127
      Width = 39
      Height = 13
      Caption = 'Area tel.'
    end
    object Label4: TLabel
      Left = 112
      Top = 127
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label6: TLabel
      Left = 8
      Top = 152
      Width = 37
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = 'Observ'#13#10'aciones'
    end
    object edSiniestroPac: TSinEdit
      Left = 53
      Top = 8
      Width = 100
      Height = 21
      OnExit = edSiniestroPacSelect
      TabOrder = 0
      OnSelect = edSiniestroPacSelect
    end
    object chkPrioridadPac: TCheckBox
      Left = 53
      Top = 37
      Width = 117
      Height = 17
      Caption = 'Prioridad de entrega'
      TabOrder = 1
    end
    inline fraDomicilioPac: TfraDomicilio
      Left = 4
      Top = 61
      Width = 601
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        601
        51)
      inherited lbNro: TLabel
        Left = 386
      end
      inherited lbPiso: TLabel
        Left = 458
      end
      inherited lbDto: TLabel
        Left = 534
      end
      inherited lbProvincia: TLabel
        Left = 439
      end
      inherited cmbCalle: TArtComboBox
        Width = 301
      end
      inherited edNumero: TEdit
        Left = 408
      end
      inherited edPiso: TEdit
        Left = 484
      end
      inherited edDto: TEdit
        Left = 556
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 169
      end
      inherited edProvincia: TEdit
        Left = 488
      end
      inherited btnBuscar: TButton
        Left = 351
      end
    end
    object edTrabajadorPac: TEdit
      Left = 224
      Top = 8
      Width = 381
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object btnAceptarPac: TBitBtn
      Left = 446
      Top = 196
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarPacClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelarPac: TBitBtn
      Left = 530
      Top = 196
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 8
      Kind = bkCancel
    end
    object edCodAreaPac: TEdit
      Left = 53
      Top = 122
      Width = 49
      Height = 21
      MaxLength = 5
      TabOrder = 3
    end
    object edTelefonoPac: TEdit
      Left = 160
      Top = 122
      Width = 443
      Height = 21
      MaxLength = 100
      TabOrder = 4
    end
    object edObservPac: TMemo
      Left = 53
      Top = 149
      Width = 552
      Height = 35
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 500
      TabOrder = 5
    end
  end
  object fpPeriodo: TFormPanel [8]
    Left = 694
    Top = 125
    Width = 450
    Height = 352
    Caption = 'Per'#237'odos'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnBeforeShow = fpPeriodoBeforeShow
    Constraints.MinHeight = 320
    Constraints.MinWidth = 450
    DesignSize = (
      450
      352)
    object Label12: TLabel
      Left = 6
      Top = 40
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label13: TLabel
      Left = 160
      Top = 40
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Bevel5: TBevel
      Left = 3
      Top = 62
      Width = 444
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label14: TLabel
      Left = 8
      Top = 73
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label16: TLabel
      Left = 8
      Top = 96
      Width = 274
      Height = 13
      Caption = 'Medicamentos / drogas / material descartable del per'#237'odo'
    end
    object edSiniestroPer: TSinEdit
      Left = 53
      Top = 36
      Width = 100
      Height = 21
      OnExit = edSiniestroPacSelect
      TabOrder = 0
      OnSelect = edSiniestroPacSelect
      ReadOnly = True
      TabStop = False
      Color = clBtnFace
    end
    object edTrabajadorPer: TEdit
      Left = 216
      Top = 36
      Width = 229
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object ppPeriodos: TPeriodoPicker
      Left = 53
      Top = 69
      Width = 94
      Height = 21
      TabOrder = 2
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poMesAno
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '06/2050'
      Periodo.MinPeriodo = '06/1996'
      WidthMes = 22
      Separation = 1
      ShowButton = True
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      OnChange = ppPeriodosChange
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
    object edMes: TEdit
      Left = 154
      Top = 69
      Width = 291
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object clbPeriodos: TARTCheckListBox
      Left = 6
      Top = 112
      Width = 439
      Height = 236
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 1
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnDblClick = clbPeriodosDblClick
      AutoAjustarColumnas = True
      Locked = False
    end
    object CoolBar1: TCoolBar
      Left = 0
      Top = 0
      Width = 450
      Height = 31
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 28
          Width = 446
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 433
        Height = 28
        Align = alClient
        AutoSize = True
        Caption = 'ToolBar1'
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        TabOrder = 0
        object tbNuevoPer: TToolButton
          Left = 0
          Top = 2
          Hint = 'Generar per'#237'odo'
          Caption = 'tbNuevoPer'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNuevoPerClick
        end
        object tbModificarPer: TToolButton
          Left = 23
          Top = 2
          Hint = 'Modificar per'#237'odo'
          Caption = 'tbModificarPer'
          ImageIndex = 24
          ParentShowHint = False
          ShowHint = True
          OnClick = tbModificarPerClick
        end
        object tbEliminarPer: TToolButton
          Left = 46
          Top = 2
          Hint = 'Eliminar per'#237'odo'
          Caption = 'tbEliminarPer'
          ImageIndex = 25
          ParentShowHint = False
          ShowHint = True
          OnClick = tbEliminarPerClick
        end
        object ToolButton2: TToolButton
          Left = 69
          Top = 2
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbGuardarPer: TToolButton
          Left = 77
          Top = 2
          Hint = 'Guardar datos'
          Caption = 'tbGuardarPer'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = tbGuardarPerClick
        end
        object tbCancelarPer: TToolButton
          Left = 100
          Top = 2
          Hint = 'Cancelar datos'
          Caption = 'tbCancelarPer'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbCancelarPerClick
        end
        object ToolButton7: TToolButton
          Left = 123
          Top = 2
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbComplementario: TToolButton
          Left = 131
          Top = 2
          Hint = 'Agregar complementario'
          Caption = 'tbComplementario'
          ImageIndex = 44
          ParentShowHint = False
          ShowHint = True
          OnClick = tbComplementarioClick
        end
        object ToolButton12: TToolButton
          Left = 154
          Top = 2
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbCerrarPeriodo: TToolButton
          Left = 162
          Top = 2
          Hint = 'Cerrar per'#237'odo'
          Caption = 'tbCerrarPeriodo'
          ImageIndex = 13
          ParentShowHint = False
          ShowHint = True
          OnClick = tbCerrarPeriodoClick
        end
        object tbProcesarPeriodo: TToolButton
          Left = 185
          Top = 2
          Hint = 'Procesar per'#237'odo'
          Caption = 'tbProcesarPeriodo'
          ImageIndex = 11
          ParentShowHint = False
          ShowHint = True
          OnClick = tbProcesarPeriodoClick
        end
        object ToolButton10: TToolButton
          Left = 208
          Top = 2
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbCerrarPer: TToolButton
          Left = 216
          Top = 2
          Hint = 'Cerrar'
          Caption = 'tbCerrarPer'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = tbCerrarPerClick
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, '
      
        '       art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre, gp_nombre' +
        ', '
      
        '       DECODE(pc_prioridad, 0, '#39'Si'#39', '#39'No'#39') prioridad, pc_observa' +
        'ciones,'
      
        '       art.utiles.armar_domicilio(pc_calle, pc_numero, pc_piso, ' +
        'pc_departamento, pc_localidad) domicilio, '
      
        '       pc_codareatel, pc_telefono, pc_id, ex_siniestro, ex_orden' +
        ', ex_recaida,'
      
        '       pc_calle, pc_cpostal, pc_localidad, pc_numero, pc_piso, p' +
        'c_departamento,'
      '       pc_provincia, pc_prioridad '
      
        '  FROM art.sex_expedientes, ctj_trabajador, art.mgp_gtrabajo, SI' +
        'N.spc_pacientescronicos'
      ' WHERE ex_id = pc_idexpediente'
      '   AND ex_cuil = tj_cuil'
      '   AND ex_gtrabajo = gp_codigo'
      '   AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'02'#39', '#39'99'#39', '#39'95'#39')'
      '   AND pc_fechabaja IS NULL')
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        MaxLength = 13
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'Domicilio'
        DataField = 'DOMICILIO'
        MaxLength = 40
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'TELEFONO'
        MaxLength = 25
      end
      item
        Title = 'Prioridad'
        TitleAlignment = taCenter
        DataField = 'PRIORIDAD'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Observaciones'
        DataField = 'PC_OBSERVACIONES'
        MaxLength = 40
      end
      item
        Title = 'Medicaci'#243'n e insumos descartables'
        DataField = 'MEDIC'
        MaxLength = 0
      end>
    DataSource = nil
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object dsBase: TDataSource
    DataSet = sdqBase
    Left = 52
    Top = 312
  end
  object sdqBase: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   ma_id, ma_medicdroga, ma_presentacion, ma_sustituir, ma' +
        '_idmedicamento, '
      
        '         ma_iddroga, ma_idpresentacion, ma_periodo, ma_observaci' +
        'ones, ma_descartable'
      '    FROM v_sma_medicamentosasignados'
      '   WHERE ma_idpaciente = :IdPac'
      '     AND ma_secuencia = 0'
      
        'ORDER BY ma_descartable,  ma_medicdroga, ma_nombre, ma_presentac' +
        'ion')
    Left = 24
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdPac'
        ParamType = ptInput
      end>
  end
end
