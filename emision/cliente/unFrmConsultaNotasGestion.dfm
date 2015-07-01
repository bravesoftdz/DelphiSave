inherited frmConsultaNotasGestion: TfrmConsultaNotasGestion
  Left = 49
  Top = 88
  Width = 700
  Height = 450
  Caption = 'Consulta de Notas para Gesti'#243'n'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 700
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 208
    AutoSize = True
    object gbGeneral: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 692
      Height = 208
      Align = alTop
      Caption = ' Filtros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvSpace
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      CaptionTextStyle = fstVolumetric
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 2
      DesignSize = (
        692
        208)
      FullHeight = 59
      object gbEmpresa: TGroupBox
        Left = 6
        Top = 21
        Width = 681
        Height = 66
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Empresa'
        TabOrder = 0
        DesignSize = (
          681
          66)
        object lblCuit: TLabel
          Left = 8
          Top = 19
          Width = 24
          Height = 13
          Caption = 'CUIT'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSUSS: TLabel
          Left = 8
          Top = 42
          Width = 25
          Height = 13
          Caption = 'SUSS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inline fraEmpresaNota: TfraEmpresa
          Left = 39
          Top = 15
          Width = 636
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          DesignSize = (
            636
            21)
          inherited lbRSocial: TLabel
            Left = 87
          end
          inherited lbContrato: TLabel
            Left = 532
          end
          inherited edContrato: TIntEdit
            Left = 577
          end
          inherited cmbRSocial: TArtComboBox
            Left = 135
            Width = 394
          end
        end
        inline fraSUSS: TfraCtbTablas
          Left = 38
          Top = 38
          Width = 637
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            637
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 583
          end
        end
      end
      object gbFormulario: TGroupBox
        Left = 5
        Top = 128
        Width = 429
        Height = 41
        Caption = 'Formulario'
        TabOrder = 3
        DesignSize = (
          429
          41)
        inline fraTipoFormulario: TfraCodigoDescripcionExt
          Left = 5
          Top = 13
          Width = 417
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            417
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 352
          end
        end
      end
      object gbBibliorato: TGroupBox
        Left = 547
        Top = 128
        Width = 69
        Height = 41
        Caption = 'Bibliorato'
        TabOrder = 5
        object edBibliorato: TIntEdit
          Left = 6
          Top = 15
          Width = 57
          Height = 21
          Hint = 'N'#250'mero de Bibliorato'
          OEMConvert = True
          TabOrder = 0
          MaxLength = 8
        end
      end
      object gbPeriodo: TGroupBox
        Left = 619
        Top = 128
        Width = 69
        Height = 41
        Caption = 'Per'#237'odo'
        TabOrder = 6
        object edPeriodo: TPeriodoPicker
          Left = 6
          Top = 15
          Width = 57
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
      end
      object gbSecuencia: TGroupBox
        Left = 437
        Top = 128
        Width = 107
        Height = 41
        Caption = 'Secuencia'
        TabOrder = 4
        object edSecuencia: TIntEdit
          Left = 6
          Top = 15
          Width = 94
          Height = 21
          Hint = 'N'#250'mero de Secuencia'
          OEMConvert = True
          TabOrder = 0
          MaxLength = 8
        end
      end
      object gbUsuarioAlta: TGroupBox
        Left = 222
        Top = 87
        Width = 465
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Usuario de Alta'
        TabOrder = 2
        DesignSize = (
          465
          41)
        object cmbUsuarioAlta: TCheckCombo
          Left = 6
          Top = 14
          Width = 453
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object gbFechaAlta: TGroupBox
        Left = 6
        Top = 87
        Width = 213
        Height = 41
        Caption = 'Fecha Alta'
        TabOrder = 1
        object Label4: TLabel
          Left = 97
          Top = 18
          Width = 16
          Height = 13
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edFechaAltaDesde: TDateComboBox
          Left = 6
          Top = 15
          Width = 88
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edFechaAltaHasta: TDateComboBox
          Left = 119
          Top = 14
          Width = 88
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object rgpGestiona: TRadioGroup
        Left = 4
        Top = 170
        Width = 290
        Height = 37
        Caption = ' Gestiona'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Emisi'#243'n'
          'Comercial'
          'Estudio Jur'#237'dico')
        TabOrder = 7
      end
      object gbGestionar: TGroupBox
        Left = 296
        Top = 170
        Width = 166
        Height = 37
        Caption = 'Gestionar'
        TabOrder = 8
        object cbNotas: TCheckBox
          Left = 4
          Top = 15
          Width = 53
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Notas'
          TabOrder = 0
        end
        object cbDDJJ: TCheckBox
          Left = 64
          Top = 15
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Caption = 'N'#243'minas Archivo'
          TabOrder = 1
        end
      end
      object gbGestionados: TGroupBox
        Left = 464
        Top = 170
        Width = 225
        Height = 37
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Gestionados'
        TabOrder = 9
        object chkGestionados: TCheckBox
          Left = 2
          Top = 15
          Width = 75
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Gestionados'
          TabOrder = 0
        end
        object chkNoGestionados: TCheckBox
          Left = 84
          Top = 15
          Width = 91
          Height = 17
          Alignment = taLeftJustify
          Caption = 'No Gestionados'
          TabOrder = 1
        end
        object chkBaja: TCheckBox
          Left = 182
          Top = 15
          Width = 39
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Baja'
          TabOrder = 2
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 208
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Eliminar Gesti'#243'n (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
      end
      object tbSelectAll: TToolButton
        Left = 370
        Top = 0
        Caption = 'Seleccionar Todos'
        ImageIndex = 46
        OnClick = tbSelectAllClick
      end
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Wrap = True
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 0
        Top = 30
        Caption = 'ToolButton2'
        ImageIndex = 6
        Visible = False
        OnClick = ToolButton2Click
      end
      object Panel1: TPanel
        Left = 23
        Top = 30
        Width = 455
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 237
    Width = 692
    Height = 115
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 16
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'Cuit'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJECUTIVO'
        Title.Caption = 'Ejecutivo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIO'
        Title.Caption = 'Estudio'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASESOREMISION'
        Title.Caption = 'Asesor Emisi'#243'n'
        Width = 106
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'secbibligestion'
        Title.Caption = 'Sec. Bibliorato Gesti'#243'n'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'textobs'
        Title.Caption = 'Observaci'#243'n'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_CALLE'
        Title.Caption = 'Calle Postal'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_NUMERO'
        Title.Caption = 'Nro.'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_PISO'
        Title.Caption = 'Piso'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_DEPARTAMENTO'
        Title.Caption = 'Depto.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_CPOSTAL'
        Title.Caption = 'C. Postal'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UsuBaja'
        Title.Caption = 'Us.Baja'
        Width = 120
        Visible = True
      end>
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 352
    Width = 692
    Height = 71
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object edObservacion: TMemo
      Left = 1
      Top = 1
      Width = 690
      Height = 69
      Align = alClient
      Color = 16051436
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT   ino.no_id, ino.no_contrato, ino.no_bibliorato, ino.no_s' +
        'ecuencia, ino.no_usualta, trunc(ino.no_fechaalta) fechaalta,'
      
        '         art.afiliacion.get_nombreempresa(art.afiliacion.get_cui' +
        'tempresa(ino.no_contrato)) empresa,'
      
        '         art.afiliacion.get_cuitempresa(ino.no_contrato) cuit, p' +
        'o_textoobservacion'
      
        '    FROM emi.ino_nota ino, emi.inp_notacontratoperiodo inp, emi.' +
        'ipo_notaperiodoobservacion ipo'
      '   WHERE inp.np_idnota = ino.no_id'
      '     AND inp.np_fechabaja IS NULL'
      '     AND ino.no_idestadonota = 2'
      '     AND inp.np_id = ipo.po_idnotacontratoperiodo'
      'ORDER BY no_contrato, no_secuencia, no_bibliorato')
    Left = 16
    Top = 292
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 292
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 320
  end
  inherited ExportDialog: TExportDialog
    BeforeExport = ExportDialogBeforeExport
    Left = 44
    Top = 320
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 44
    Top = 348
  end
  inherited Seguridad: TSeguridad
    Left = 72
    Top = 348
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 264
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 348
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
    Left = 72
    Top = 320
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 292
  end
  object ShortCutControlSinHerenciaDelOrto: TShortCutControl
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
    Top = 264
  end
end
