inherited FrmRecepcionNota: TFrmRecepcionNota
  Left = 79
  Top = 95
  Width = 816
  Height = 620
  Caption = 'Solicitudes de Revisi'#243'n'
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 808
    Height = 278
    Visible = True
    DesignSize = (
      808
      278)
    object Bevel3: TBevel
      Left = 4
      Top = 248
      Width = 797
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object gbGeneral: TJvgGroupBox
      Left = 3
      Top = 2
      Width = 803
      Height = 110
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Datos Generales'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      FullHeight = 59
      object lblSolicitudFiltro: TLabel
        Left = 6
        Top = 32
        Width = 43
        Height = 13
        Caption = 'Solicitud:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSolicitanteFiltro: TLabel
        Left = 6
        Top = 58
        Width = 53
        Height = 13
        Caption = 'Solicitante:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFechaDesdeFiltro: TLabel
        Left = 383
        Top = 83
        Width = 33
        Height = 13
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFechaHastaFIltro: TLabel
        Left = 513
        Top = 81
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
      object lblNivelRequeridoFiltro: TLabel
        Left = 365
        Top = 58
        Width = 54
        Height = 13
        Caption = 'Autor.Req:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblEstadoFiltro: TLabel
        Left = 6
        Top = 83
        Width = 37
        Height = 13
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      inline fraSolicitud: TfraCodigoDescripcionExt
        Left = 79
        Top = 28
        Width = 281
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          281
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 216
        end
      end
      inline fraSolicitante: TfraCodigoDescripcionExt
        Left = 79
        Top = 53
        Width = 281
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          281
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 216
        end
        inherited edCodigo: TPatternEdit
          Width = 59
        end
      end
      inline fraAutorizacionRequerimiento: TfraCodigoDescripcionExt
        Left = 420
        Top = 53
        Width = 281
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          281
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 216
        end
      end
      object edtFechaDesde: TDateComboBox
        Left = 421
        Top = 78
        Width = 88
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtFechaHasta: TDateComboBox
        Left = 530
        Top = 78
        Width = 88
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      inline fraEstadoNota: TfraCodigoDescripcionExt
        Left = 79
        Top = 78
        Width = 281
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        DesignSize = (
          281
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 216
        end
      end
    end
    object gbEmpresaPeriodos: TJvgGroupBox
      Left = 1
      Top = 112
      Width = 805
      Height = 127
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Datos Generales'
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
      FullHeight = 59
      object lblEmpresa: TLabel
        Left = 8
        Top = 57
        Width = 45
        Height = 13
        Caption = 'Empresa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPeriodosFiltro: TLabel
        Left = 463
        Top = 29
        Width = 45
        Height = 13
        Caption = 'Periodos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblHastaPeriodosFiltro: TLabel
        Left = 563
        Top = 29
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
      object lblBiblioratoFiltro: TLabel
        Left = 179
        Top = 29
        Width = 48
        Height = 13
        Caption = 'Bibliorato:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSecuenciaFiltro: TLabel
        Left = 308
        Top = 29
        Width = 52
        Height = 13
        Caption = 'Secuencia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNroNotaFiltro: TLabel
        Left = 8
        Top = 29
        Width = 47
        Height = 13
        Caption = 'Nro Nota:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNroEvento: TLabel
        Left = 7
        Top = 84
        Width = 57
        Height = 13
        Caption = 'Nro.Evento:'
        FocusControl = fraEmpresaNota.edContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbRSocial: TLabel
        Left = 7
        Top = 109
        Width = 74
        Height = 13
        Caption = 'Observaciones:'
        FocusControl = fraEmpresaNota.cmbRSocial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inline fraEmpresaNota: TfraEmpresa
        Left = 93
        Top = 55
        Width = 534
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          534
          21)
        inherited lbRSocial: TLabel
          Left = 87
        end
        inherited lbContrato: TLabel
          Left = 432
        end
        inherited edContrato: TIntEdit
          Left = 477
        end
        inherited cmbRSocial: TArtComboBox
          Left = 135
          Width = 285
        end
      end
      object ppPeriodosDesde: TPeriodoPicker
        Left = 511
        Top = 26
        Width = 49
        Height = 21
        TabOrder = 1
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
      object ppPeriodosHasta: TPeriodoPicker
        Left = 579
        Top = 26
        Width = 49
        Height = 21
        TabOrder = 2
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
      object edtBibliorato: TIntEdit
        Left = 228
        Top = 26
        Width = 74
        Height = 21
        Hint = 'Bibliorato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        MaxLength = 8
      end
      object edtSecuencia: TIntEdit
        Left = 366
        Top = 26
        Width = 74
        Height = 21
        Hint = 'N'#250'mero de Secuencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        MaxLength = 8
      end
      object edtNroNota: TIntEdit
        Left = 93
        Top = 26
        Width = 81
        Height = 21
        Hint = 'N'#250'mero de Nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        MaxLength = 8
      end
      object chkNotaDelaEmpresa: TCheckBox
        Left = 313
        Top = 82
        Width = 115
        Height = 17
        Caption = 'Nota de la Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = chkNotaDelaEmpresaClick
      end
      object chkSGC: TCheckBox
        Left = 190
        Top = 82
        Width = 118
        Height = 17
        Caption = 'Gestion de Clientes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = chkNotaDelaEmpresaClick
      end
      object edtEvento: TIntEdit
        Left = 93
        Top = 81
        Width = 82
        Height = 21
        Hint = 'N'#250'mero de Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        MaxLength = 8
      end
      object edtObservacionesEvento: TEdit
        Left = 91
        Top = 106
        Width = 540
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object gbEstado: TGroupBox
        Left = 633
        Top = 21
        Width = 112
        Height = 106
        TabOrder = 10
        object chkCerrada: TCheckBox
          Left = 11
          Top = 43
          Width = 71
          Height = 17
          Caption = 'Cerrado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = chkCerradaClick
        end
        object chkDerivada: TCheckBox
          Left = 11
          Top = 61
          Width = 76
          Height = 17
          Caption = 'Derivada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object chkNoAsignada: TCheckBox
          Left = 11
          Top = 8
          Width = 86
          Height = 17
          Caption = 'No Asignada'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 2
        end
        object chkAbiertas: TCheckBox
          Left = 11
          Top = 26
          Width = 71
          Height = 17
          Caption = 'Abiertas'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          OnClick = chkAbiertasClick
        end
      end
    end
    object Panel2: TPanel
      Left = 8
      Top = 252
      Width = 617
      Height = 23
      BevelOuter = bvNone
      TabOrder = 2
      object lblColorCerrado: TLabel
        Left = 21
        Top = 4
        Width = 39
        Height = 13
        Caption = 'Cerrada'
      end
      object lblColorPendienteAsignar: TLabel
        Left = 94
        Top = 4
        Width = 102
        Height = 13
        Caption = 'Pendiente de Asignar'
      end
      object lblDerivado: TLabel
        Left = 228
        Top = 4
        Width = 43
        Height = 13
        Caption = 'Derivado'
      end
      object Bevel4: TBevel
        Left = 280
        Top = 0
        Width = 2
        Height = 20
      end
      object Label3: TLabel
        Left = 317
        Top = 5
        Width = 51
        Height = 13
        Caption = 'En Gesti'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 421
        Top = 5
        Width = 120
        Height = 13
        Caption = 'Pendiente de Aprobaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnColorCerrada: TPanel
        Left = 0
        Top = 3
        Width = 16
        Height = 14
        BevelOuter = bvNone
        Color = 15663103
        TabOrder = 0
      end
      object pnColorPendienteAsignar: TPanel
        Left = 72
        Top = 3
        Width = 16
        Height = 14
        BevelOuter = bvNone
        Color = 16771818
        TabOrder = 1
      end
      object pnColorDerivado: TPanel
        Left = 206
        Top = 2
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 13557759
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 294
        Top = 3
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 3
      end
      object Panel4: TPanel
        Left = 398
        Top = 3
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 4
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 278
    Width = 808
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 804
      end
      item
        Control = Panel1
        ImageIndex = -1
        Width = 804
      end>
    inherited ToolBar: TToolBar
      Width = 791
      inherited tbPropiedades: TToolButton
        Hint = 'Dar Curso'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Enabled = True
        ImageIndex = 30
      end
      object tbDerivacionNota: TToolButton
        Left = 370
        Top = 0
        Hint = 'Derivaci'#243'n Nota'
        Caption = 'Derivaci'#243'n Nota'
        ImageIndex = 22
        OnClick = tbDerivacionNotaClick
      end
      object tbAsignarmotivoEvento: TToolButton
        Left = 393
        Top = 0
        Hint = 'Asigna Motivo y Localizaci'#243'n de Nota por Evento  SGC'
        Caption = 'tbAsignarmotivoEvento'
        ImageIndex = 23
        OnClick = tbAsignarmotivoEventoClick
      end
      object TToolButton
        Left = 416
        Top = 0
        Width = 8
        ImageIndex = 23
        Style = tbsSeparator
      end
      object tbCerrar: TToolButton
        Left = 424
        Top = 0
        Caption = 'tbCerrar'
        ImageIndex = 23
      end
    end
    object Panel1: TPanel
      Left = 9
      Top = 29
      Width = 791
      Height = 25
      Caption = 'Panel1'
      TabOrder = 1
    end
  end
  object fpDerivacionNota: TFormPanel [2]
    Left = 738
    Top = 286
    Width = 497
    Height = 372
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpDerivacionNotaShow
    DesignSize = (
      497
      372)
    object bvSeparador: TBevel
      Left = 4
      Top = 336
      Width = 489
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarDerivacion: TButton
      Left = 339
      Top = 342
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarDerivacionClick
    end
    object btnCancelarDeriviacion: TButton
      Left = 417
      Top = 342
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object gbDerivacionNota: TJvgGroupBox
      Left = 6
      Top = 8
      Width = 476
      Height = 323
      Caption = ' Derivaci'#243'n de Nota  '
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
        476
        323)
      FullHeight = 59
      object lblSector: TLabel
        Left = 12
        Top = 149
        Width = 56
        Height = 13
        Caption = 'Derivado a:'
      end
      object lblFechaDerivacionNota: TLabel
        Left = 12
        Top = 32
        Width = 33
        Height = 13
        Caption = 'Fecha:'
      end
      object lblObservaciones: TLabel
        Left = 12
        Top = 201
        Width = 75
        Height = 13
        Caption = 'Observaciones:'
      end
      object Label2: TLabel
        Left = 12
        Top = 62
        Width = 74
        Height = 13
        Caption = 'Detalle Evento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      inline fraDerivador: TfraCodigoDescripcionExt
        Left = 102
        Top = 170
        Width = 370
        Height = 23
        TabOrder = 2
        DesignSize = (
          370
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 85
          Width = 284
          TabOrder = 0
        end
        inherited edCodigo: TPatternEdit
          Width = 80
          TabOrder = 1
        end
      end
      object edtFechaDerivacion: TDateComboBox
        Left = 102
        Top = 30
        Width = 88
        Height = 21
        Color = 16775673
        TabOrder = 0
      end
      object mObservacionesDerivacion: TMemo
        Left = 103
        Top = 198
        Width = 367
        Height = 124
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
      end
      object mDetalleEventoDerivacion: TMemo
        Left = 101
        Top = 56
        Width = 367
        Height = 81
        TabStop = False
        Color = 16775673
        Enabled = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object rgpTipoDerivacion: TRadioGroup
        Left = 103
        Top = 135
        Width = 367
        Height = 34
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Usuario'
          'Sector')
        TabOrder = 4
        OnClick = rgpTipoDerivacionClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 307
    Width = 808
    Height = 286
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'NO_ID'
        Title.Caption = 'Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Title.Caption = 'Motivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_DESCRIPCION'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOLICITANTE'
        Title.Caption = 'Solicitante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHARECEPCION'
        Title.Caption = 'F.Recepcion'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHARECEPCIONART'
        Title.Caption = 'F.Recep.ART'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDTIPOFORMULARIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_DERIVADO'
        Title.Caption = 'Derivado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHADERIVADO'
        Title.Caption = 'F.Derivado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_BIBLIORATO'
        Title.Caption = 'Bibliorato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SECUENCIA'
        Title.Caption = 'Secuencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHACUMPLIMIENTO'
        Title.Caption = 'F.Cumplimiento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUARIOCUMPLIMIENTO'
        Title.Caption = 'Usuario.Cumplimiento'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDEVENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_IDMOTIVOSOLICITUDNOTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_OBSERVACIONESCUMPLIMIENTO'
        Title.Caption = 'Observaciones Cumplimiento'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDESTADONOTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_NOTAEMPRESA'
        Title.Caption = 'Nota Empresa'
        Visible = True
      end>
  end
  object fpDetalleEvento: TFormPanel [4]
    Left = 643
    Top = 75
    Width = 561
    Height = 484
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      561
      484)
    object Bevel1: TBevel
      Left = 4
      Top = 448
      Width = 553
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnSalir: TButton
      Left = 470
      Top = 454
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalirClick
    end
    object gbDatosEventos: TJvgGroupBox
      Left = 10
      Top = 6
      Width = 536
      Height = 434
      Caption = ' Datos del Evento '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
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
      Options = [fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
      FullHeight = 173
      object spDatosEventos: TShape
        Left = 2
        Top = 16
        Width = 532
        Height = 1
        Align = alTop
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
      end
      object lblFechaEvento: TLabel
        Left = 10
        Top = 28
        Width = 29
        Height = 13
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblDescripcionEvento: TLabel
        Left = 13
        Top = 78
        Width = 34
        Height = 13
        Caption = 'Evento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFechaCarga: TLabel
        Left = 349
        Top = 28
        Width = 76
        Height = 13
        Caption = 'Fecha de Carga'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSectorInterviniente: TLabel
        Left = 14
        Top = 193
        Width = 96
        Height = 13
        Caption = 'Sector Interviniente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuarioInterviniente: TLabel
        Left = 154
        Top = 192
        Width = 101
        Height = 13
        Caption = 'Usuario Interviniente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblContacto: TLabel
        Left = 197
        Top = 153
        Width = 44
        Height = 13
        Caption = 'Contacto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCargo: TLabel
        Left = 13
        Top = 154
        Width = 29
        Height = 13
        Caption = 'Cargo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbNroEvento: TLabel
        Left = 236
        Top = 28
        Width = 12
        Height = 13
        Caption = 'N'#186
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblIngreso: TLabel
        Left = 373
        Top = 75
        Width = 37
        Height = 13
        Caption = 'Ingreso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMotivoEvento: TLabel
        Left = 219
        Top = 76
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Motivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFechaVencimiento: TLabel
        Left = 15
        Top = 115
        Width = 104
        Height = 13
        Caption = 'Fecha de Vencimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFechaRealizado: TLabel
        Left = 332
        Top = 116
        Width = 100
        Height = 13
        Caption = 'Fecha de Realizaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNombreEmpresa: TLabel
        Left = 11
        Top = 55
        Width = 525
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Nombre de la Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUsuarioDerivacion: TLabel
        Left = 306
        Top = 192
        Width = 105
        Height = 13
        Caption = 'Usuario de Derivaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPrioridad: TLabel
        Left = 135
        Top = 116
        Width = 42
        Height = 13
        Caption = 'Prioridad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblObservacionesEvento: TLabel
        Left = 12
        Top = 233
        Width = 71
        Height = 13
        Caption = 'Observaciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblEvento: TLabel
        Left = 252
        Top = 28
        Width = 44
        Height = 13
        Caption = 'lblEvento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object edtFechaEvento: TDateComboBox
        Left = 46
        Top = 24
        Width = 139
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtFechaCarga: TDateComboBox
        Left = 432
        Top = 24
        Width = 88
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtDescripcionEvento: TEdit
        Left = 11
        Top = 92
        Width = 201
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = 'edtDescripcionEvento'
      end
      object edtDescripcionMotivoEvento: TEdit
        Left = 216
        Top = 91
        Width = 149
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = 'edtDescripcionMotivoEvento'
      end
      object edtDescripcionIngreso: TEdit
        Left = 370
        Top = 91
        Width = 149
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = 'edtDescripcionIngreso'
      end
      object edtDescripcionSectorInterviniente: TEdit
        Left = 11
        Top = 207
        Width = 137
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = 'edtDescripcionSectorInterviniente'
      end
      object edtDescripcionUsuarioInterviniente: TEdit
        Left = 152
        Top = 207
        Width = 149
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = 'edtDescripcionUsuarioInterviniente'
      end
      object edtFechaVencimiento: TDateComboBox
        Left = 11
        Top = 131
        Width = 113
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object chkNotificado: TCheckBox
        Left = 449
        Top = 130
        Width = 71
        Height = 17
        Caption = 'Notificado'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object edtFechaRealizacion: TDateComboBox
        Left = 328
        Top = 130
        Width = 113
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtUsuarioDerivacion: TEdit
        Left = 304
        Top = 207
        Width = 149
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = 'edtUsuarioDerivacion'
      end
      object edtDescripcionCargo: TEdit
        Left = 11
        Top = 168
        Width = 178
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = 'edtDescripcionCargo'
      end
      object edtDescripcionContacto: TEdit
        Left = 193
        Top = 167
        Width = 149
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = 'edtDescripcionContacto'
      end
      object edtDescripcionPrioridadEvento: TEdit
        Left = 130
        Top = 131
        Width = 194
        Height = 21
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = 'edtDescripcionPrioridadEvento'
      end
      object pcDetalle: TJvPageControl
        Left = 8
        Top = 248
        Width = 521
        Height = 184
        ActivePage = tsObservaciones
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 13
        TabPosition = tpBottom
        ClientBorderWidth = 0
        ParentColor = False
        Color = clBtnFace
        object tsObservaciones: TTabSheet
          Caption = 'Observaciones'
          object edtObservaciones: TMemo
            Left = 0
            Top = 0
            Width = 521
            Height = 166
            Align = alClient
            Color = 16775673
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tsDetalleEvento: TTabSheet
          Caption = 'Detalle de Evento'
          ImageIndex = 1
          object dbcgStatus: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 521
            Height = 166
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            DataSource = dsEvolucion
            PanelHeight = 55
            PanelWidth = 505
            TabOrder = 0
            object lblFechaAlta: TLabel
              Left = 325
              Top = 9
              Width = 33
              Height = 13
              Caption = 'Fecha:'
            end
            object lblUsuarioAlta: TLabel
              Left = 325
              Top = 33
              Width = 40
              Height = 13
              Caption = 'Usuario:'
            end
            object dbTextoObservaciones: TDBMemo
              Left = 0
              Top = 0
              Width = 315
              Height = 48
              Color = 16775673
              DataField = 'SS_TEXTO'
              DataSource = dsEvolucion
              ReadOnly = True
              TabOrder = 0
            end
            object dbdFechaAlta: TJvDBDateEdit
              Left = 371
              Top = 6
              Width = 121
              Height = 21
              DataField = 'SS_FECHAALTA'
              DataSource = dsEvolucion
              ReadOnly = True
              TabOrder = 1
            end
            object dbedtUsuarioAlta: TDBEdit
              Left = 370
              Top = 29
              Width = 121
              Height = 21
              DataField = 'SS_USUALTA'
              DataSource = dsEvolucion
              ReadOnly = True
              TabOrder = 2
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Observaciones de Cumplimiento'
          ImageIndex = 2
          object mObservacionesCumplimiento: TMemo
            Left = 0
            Top = 0
            Width = 521
            Height = 166
            Align = alClient
            Color = 16775673
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object fpSolicitudAutorizacion: TFormPanel [5]
    Left = 692
    Top = 344
    Width = 497
    Height = 233
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpDerivacionNotaShow
    DesignSize = (
      497
      233)
    object Bevel5: TBevel
      Left = 4
      Top = 197
      Width = 489
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 9
      Top = 36
      Width = 86
      Height = 13
      Caption = 'Tipo Autorizaci'#243'n:'
    end
    object Label7: TLabel
      Left = 9
      Top = 88
      Width = 75
      Height = 13
      Caption = 'Observaciones:'
    end
    object Label6: TLabel
      Left = 9
      Top = 62
      Width = 89
      Height = 13
      Caption = 'Nivel Autorizaci'#243'n:'
    end
    object btnAceptarSolicitudAutorizacion: TButton
      Left = 339
      Top = 203
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAceptarSolicitudAutorizacionClick
    end
    object btnCancelarSolicitudAutorizacion: TButton
      Left = 417
      Top = 203
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object gbSolicitudAutorizacion: TJvgGroupBox
      Left = 8
      Top = 6
      Width = 482
      Height = 25
      Caption = ' Solicitud Autorizaci'#243'n '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
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
      FullHeight = 59
    end
    inline fraTipoAutorizacion: TfraCodigoDescripcionExt
      Left = 101
      Top = 30
      Width = 372
      Height = 23
      TabOrder = 0
      DesignSize = (
        372
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 85
        Width = 287
        TabOrder = 0
      end
      inherited edCodigo: TPatternEdit
        Width = 80
        TabOrder = 1
      end
    end
    object mObservacionesSolicitudAutorizacion: TMemo
      Left = 102
      Top = 84
      Width = 370
      Height = 106
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
    end
    inline fraNivelAutorizacion: TfraCodigoDescripcionExt
      Left = 101
      Top = 57
      Width = 372
      Height = 23
      TabOrder = 1
      DesignSize = (
        372
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 85
        Width = 287
        TabOrder = 0
      end
      inherited edCodigo: TPatternEdit
        Width = 80
        TabOrder = 1
      end
    end
  end
  object fpAsignacionNota: TFormPanel [6]
    Left = 583
    Top = 347
    Width = 497
    Height = 337
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpDerivacionNotaShow
    DesignSize = (
      497
      337)
    object Bevel2: TBevel
      Left = 4
      Top = 301
      Width = 489
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarAsignacion: TButton
      Left = 339
      Top = 307
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarAsignacionClick
    end
    object btnCancelarAsignacion: TButton
      Left = 417
      Top = 307
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarAsignacionClick
    end
    object gbAsignacionNotaEventoSGC: TJvgGroupBox
      Left = 7
      Top = 7
      Width = 482
      Height = 284
      Caption = 'Asignaci'#243'n de Nota de Sistema de Gesti'#243'n de Clientes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
        482
        284)
      FullHeight = 59
      object lblBiblioratoNotaAsignacion: TLabel
        Left = 14
        Top = 130
        Width = 48
        Height = 13
        Caption = 'Bibliorato:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSecuenciaNotaAsignacion: TLabel
        Left = 259
        Top = 131
        Width = 52
        Height = 13
        Caption = 'Secuencia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMotivoSolicitudNotaAsignacion: TLabel
        Left = 14
        Top = 105
        Width = 57
        Height = 13
        Caption = 'Motivo Sol.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblObservacionNotaAsignacion: TLabel
        Left = 14
        Top = 155
        Width = 75
        Height = 13
        Caption = 'Observaciones:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 14
        Top = 30
        Width = 74
        Height = 13
        Caption = 'Detalle Evento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtBiblioratoNotaAsignacion: TIntEdit
        Left = 109
        Top = 127
        Width = 74
        Height = 21
        Hint = 'Bibliorato'
        Anchors = [akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        MaxLength = 3
      end
      object edtSecuenciaNotaAsignacion: TIntEdit
        Left = 318
        Top = 127
        Width = 74
        Height = 21
        Hint = 'N'#250'mero de Secuencia'
        Anchors = [akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        MaxLength = 8
      end
      inline fraMotivoSolicitudNotaAsignacion: TfraCodigoDescripcionExt
        Left = 108
        Top = 101
        Width = 288
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          288
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 223
        end
      end
      object mObservacionNotaAsignacion: TMemo
        Left = 109
        Top = 152
        Width = 340
        Height = 123
        Anchors = [akLeft, akTop, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object tbMostrarDetalleEvento: TToolBar
        Left = 454
        Top = 21
        Width = 34
        Height = 26
        Align = alNone
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object btnDetalleEventoAsignacion: TToolButton
          Left = 0
          Top = 0
          Caption = 'tbDetalleEvento'
          ImageIndex = 15
          OnClick = btnDetalleEventoAsignacionClick
        end
      end
      object mDetalleEvento: TMemo
        Left = 109
        Top = 24
        Width = 340
        Height = 73
        TabStop = False
        Color = 16775673
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 5
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 61
    Top = 63
    Width = 525
    Height = 537
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    Constraints.MinHeight = 445
    Constraints.MinWidth = 525
    DesignSize = (
      525
      537)
    inherited BevelAbm: TBevel
      Top = 502
      Width = 517
    end
    object lblNroEventoAsociado: TLabel [1]
      Left = 238
      Top = 267
      Width = 3
      Height = 13
      Alignment = taCenter
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object pgNotas: TPageControl [2]
      Left = 4
      Top = 32
      Width = 515
      Height = 463
      ActivePage = tbNota
      TabOrder = 6
      object tbNota: TTabSheet
        Caption = 'Nota'
        DesignSize = (
          507
          435)
        object lblSolicitanteSolicitud: TLabel
          Left = 12
          Top = 54
          Width = 53
          Height = 13
          Caption = 'Solicitante:'
        end
        object lblFechaSolicitud: TLabel
          Left = 12
          Top = 79
          Width = 33
          Height = 13
          Caption = 'Fecha:'
        end
        object lblFechaRecepcionART: TLabel
          Left = 189
          Top = 79
          Width = 90
          Height = 13
          Caption = 'Fecha Recep.ART:'
        end
        object lblSolicitudSolicitud: TLabel
          Left = 12
          Top = 106
          Width = 57
          Height = 13
          Caption = 'Motivo Sol.:'
        end
        object lbContrato: TLabel
          Left = 5
          Top = 265
          Width = 57
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nro.Evento:'
          FocusControl = fraEmpresaSolicitud.edContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblObservacionesSolicitud: TLabel
          Left = 6
          Top = 290
          Width = 43
          Height = 13
          Caption = 'Observ.:'
        end
        object bvSeparador1: TBevel
          Left = 6
          Top = 253
          Width = 494
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object lblBibliorato: TLabel
          Left = 6
          Top = 351
          Width = 48
          Height = 13
          Caption = 'Bibliorato:'
        end
        object lblSecuencia: TLabel
          Left = 174
          Top = 352
          Width = 52
          Height = 13
          Caption = 'Secuencia:'
        end
        object Bevel6: TBevel
          Left = 6
          Top = 340
          Width = 494
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label8: TLabel
          Left = 11
          Top = 186
          Width = 45
          Height = 13
          Caption = 'Per'#237'odos:'
        end
        object Label9: TLabel
          Left = 126
          Top = 185
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object rgpTipoSolicitante: TRadioGroup
          Left = 9
          Top = 3
          Width = 485
          Height = 37
          Caption = ' Tipo de Solicitante '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Usuario'
            'Sector'
            'Otro tipo')
          TabOrder = 0
          OnClick = rgpTipoSolicitanteClick
        end
        inline fraSolicitanteNota: TfraCodigoDescripcionExt
          Left = 75
          Top = 50
          Width = 421
          Height = 23
          TabOrder = 1
          DesignSize = (
            421
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 96
            Width = 326
          end
          inherited edCodigo: TPatternEdit
            Width = 92
          end
        end
        object edtFechaSolicitud: TDateComboBox
          Left = 76
          Top = 77
          Width = 88
          Height = 21
          TabOrder = 2
        end
        object edtFechaRecepcionART: TDateComboBox
          Left = 291
          Top = 77
          Width = 88
          Height = 21
          TabOrder = 3
        end
        object chkNotaProvieneEmpresa: TCheckBox
          Left = 376
          Top = 105
          Width = 115
          Height = 17
          Caption = 'Nota de la Empresa'
          TabOrder = 5
        end
        inline fraSolicitudAbm: TfraCodigoDescripcionExt
          Left = 74
          Top = 102
          Width = 288
          Height = 23
          TabOrder = 4
          DesignSize = (
            288
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 223
          end
        end
        inline fraEmpresaSolicitud: TfraEmpresa
          Left = 5
          Top = 130
          Width = 508
          Height = 53
          TabOrder = 7
          DesignSize = (
            508
            53)
          inherited lbRSocial: TLabel
            Left = 171
            Top = 3
          end
          inherited lbContrato: TLabel
            Left = 6
            Top = 30
          end
          inherited mskCUIT: TMaskEdit
            Left = 70
            Width = 80
          end
          inherited edContrato: TIntEdit
            Left = 70
            Top = 26
            Width = 80
          end
          inherited cmbRSocial: TArtComboBox
            Left = 219
            Width = 269
          end
          inherited sdqDatos: TSDQuery
            SQL.Strings = (
              '')
            Left = 272
            Top = 8
          end
          inherited dsDatos: TDataSource
            Left = 300
            Top = 8
          end
        end
        object edtEventoNota: TIntEdit
          Left = 75
          Top = 261
          Width = 89
          Height = 21
          Hint = 'N'#250'mero de Contrato'
          TabOrder = 12
          MaxLength = 8
        end
        object tbBotonesEventos: TToolBar
          Left = 170
          Top = 259
          Width = 57
          Height = 26
          Align = alNone
          BorderWidth = 1
          ButtonWidth = 25
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          object tbBuscarEvento: TToolButton
            Left = 0
            Top = 0
            Hint = 'Detalle del Evento'
            ImageIndex = 14
            OnClick = tbBuscarEventoClick
          end
          object tbMostrarDetalle: TToolButton
            Left = 25
            Top = 0
            Caption = 'tbDetalleEvento'
            ImageIndex = 34
            OnClick = tbMostrarDetalleClick
          end
        end
        object mObservacion: TMemo
          Left = 75
          Top = 286
          Width = 416
          Height = 50
          TabOrder = 15
        end
        object edtBiblioratoNota: TIntEdit
          Left = 76
          Top = 349
          Width = 87
          Height = 21
          Hint = 'Bibliorato'
          TabOrder = 16
          OnExit = edtBiblioratoNotaExit
          MaxLength = 3
        end
        object edtSecuenciaNota: TIntEdit
          Left = 229
          Top = 349
          Width = 86
          Height = 21
          Hint = 'N'#250'mero de Secuencia'
          Anchors = [akTop, akRight]
          TabOrder = 17
          OnExit = edtSecuenciaNotaExit
          MaxLength = 8
        end
        object tbMostrarImagen: TToolBar
          Left = 320
          Top = 347
          Width = 57
          Height = 27
          Align = alNone
          BorderWidth = 1
          ButtonWidth = 25
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          object tbMostrarImagenBank: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbDetalleEvento'
            ImageIndex = 34
            OnClick = tbMostrarImagenBankClick
          end
        end
        object pnDetalleAutorizacion: TPanel
          Left = 2
          Top = 389
          Width = 502
          Height = 74
          BevelOuter = bvNone
          TabOrder = 18
          Visible = False
          object tbAprobacion: TToolBar
            Left = 2
            Top = 9
            Width = 494
            Height = 49
            Align = alNone
            BorderWidth = 1
            ButtonWidth = 25
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = DmEmision.ilByN
            Images = DmEmision.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            DesignSize = (
              490
              45)
            object lblNroAutorizacion: TLabel
              Left = 0
              Top = 0
              Width = 65
              Height = 22
              Alignment = taCenter
              Caption = 'Autoriz. Sol:  '
              Layout = tlCenter
            end
            object edtNroAutorizacion: TIntEdit
              Left = 65
              Top = 0
              Width = 87
              Height = 22
              Hint = 'N'#250'mero de Secuencia'
              Anchors = [akTop, akRight]
              ReadOnly = True
              TabOrder = 0
              MaxLength = 8
            end
            object ToolButton2: TToolButton
              Left = 152
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 16
              Style = tbsSeparator
            end
            object ToolButton1: TToolButton
              Left = 160
              Top = 0
              Caption = 'tbDetalleEvento'
              ImageIndex = 34
              OnClick = tbMostrarDetalleClick
            end
            object lblDetalleAutorizacion: TLabel
              Left = 185
              Top = 0
              Width = 303
              Height = 22
              Alignment = taCenter
              AutoSize = False
              Caption = 'Descripci'#243'n de la Autorizaci'#243'n'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object tbGestion: TToolBar
          Left = 1
          Top = 372
          Width = 381
          Height = 28
          Align = alNone
          BorderWidth = 1
          ButtonWidth = 25
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          Visible = False
          DesignSize = (
            377
            24)
          object lblGestion: TLabel
            Left = 0
            Top = 0
            Width = 64
            Height = 22
            Alignment = taCenter
            Caption = 'Nro.Gesti'#243'n: '
            Layout = tlCenter
          end
          object edtNroGestion: TIntEdit
            Left = 64
            Top = 0
            Width = 87
            Height = 22
            Hint = 'N'#250'mero de Secuencia'
            Anchors = [akTop, akRight]
            ReadOnly = True
            TabOrder = 0
            MaxLength = 8
          end
          object ToolButton7: TToolButton
            Left = 151
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 16
            Style = tbsSeparator
          end
          object tbMostrarGestion: TToolButton
            Left = 159
            Top = 0
            Caption = 'tbDetalleEvento'
            ImageIndex = 34
            OnClick = tbMostrarDetalleClick
          end
        end
        object lblCUIT: TStaticText
          Left = 12
          Top = 131
          Width = 28
          Height = 17
          Caption = 'CUIT'
          TabOrder = 6
        end
        object ppPeriodoDesdeSolicitud: TPeriodoPicker
          Left = 75
          Top = 182
          Width = 49
          Height = 21
          TabOrder = 8
          Color = clWindow
          Periodo.AllowNull = False
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 6
          Periodo.Ano = 2005
          Periodo.Valor = '200506'
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
        object ppPeriodoHastaSolicitud: TPeriodoPicker
          Left = 145
          Top = 181
          Width = 49
          Height = 21
          TabOrder = 9
          Color = clWindow
          Periodo.AllowNull = False
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 6
          Periodo.Ano = 2005
          Periodo.Valor = '200506'
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
        object tbComnadosNota: TToolBar
          Left = 199
          Top = 178
          Width = 55
          Height = 27
          Align = alNone
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          object tbAddPeriodo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nuevo (Ctrl+N)'
            ImageIndex = 28
            OnClick = tbAddPeriodoClick
          end
          object tbDeletePeriodo: TToolButton
            Left = 23
            Top = 0
            Hint = 'Modificar (Ctrl+M)'
            ImageIndex = 27
            OnClick = tbDeletePeriodoClick
          end
        end
        object dblPeriodosSeleccionados: TListBox
          Left = 74
          Top = 207
          Width = 415
          Height = 42
          Columns = 5
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          Sorted = True
          TabOrder = 11
        end
      end
      object tbPresentaciones: TTabSheet
        Caption = 'Presentaciones'
        ImageIndex = 1
        DesignSize = (
          507
          435)
        object gbGrupoMultiperiodo: TGroupBox
          Left = 3
          Top = 1
          Width = 502
          Height = 342
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            502
            342)
          object lblTipoFormularioMultiperiodo: TLabel
            Left = 8
            Top = 17
            Width = 73
            Height = 13
            Caption = 'Tipo Formulario'
          end
          object lblEmpleadosMultiperiodo: TLabel
            Left = 8
            Top = 126
            Width = 57
            Height = 15
            AutoSize = False
            Caption = 'Empleados'
            WordWrap = True
          end
          object lblMasaSalarialMultiperiodo: TLabel
            Left = 192
            Top = 125
            Width = 65
            Height = 17
            AutoSize = False
            Caption = 'Masa Salarial'
            WordWrap = True
          end
          object lblEnCeroMultiperiodo: TLabel
            Left = 347
            Top = 125
            Width = 38
            Height = 13
            Caption = 'En Cero'
            WordWrap = True
          end
          object lblFechaPresentacionMultiperiodo: TLabel
            Left = 8
            Top = 102
            Width = 77
            Height = 13
            Caption = 'Fecha Present.:'
          end
          object BvSeparador4: TBevel
            Left = 8
            Top = 67
            Width = 488
            Height = 2
          end
          object lblTipoNomina: TLabel
            Left = 8
            Top = 41
            Width = 62
            Height = 13
            Caption = 'Tipo Nomina:'
          end
          object lblCodigoRectificativaMultiperiodo: TLabel
            Left = 192
            Top = 102
            Width = 89
            Height = 13
            Caption = 'C'#243'd. Rectificativa:'
          end
          object lblPeriodosSolicitud: TLabel
            Left = 8
            Top = 77
            Width = 45
            Height = 13
            Caption = 'Per'#237'odos:'
          end
          object lblHastaPeriodos: TLabel
            Left = 145
            Top = 76
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object lblTrabajadorActivo: TLabel
            Left = 305
            Top = 320
            Width = 30
            Height = 13
            Caption = 'Activa'
          end
          object lbl: TLabel
            Left = 368
            Top = 320
            Width = 123
            Height = 13
            Caption = 'No Corresponde\Rechazo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLeyendaPeriodoPendienteAprob: TLabel
            Left = 29
            Top = 320
            Width = 61
            Height = 13
            Caption = 'Pend.Aprob.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          inline fraTipoFormulario: TfraStaticCodigoDescripcion
            Left = 93
            Top = 12
            Width = 404
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            inherited cmbDescripcion: TComboGrid
              Width = 341
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
          object edtCantidadEmpleados: TIntEdit
            Left = 93
            Top = 123
            Width = 83
            Height = 21
            TabOrder = 7
            Text = '0'
            Alignment = taRightJustify
            MaxLength = 6
            MaxValue = 999999
          end
          object edtMasaSalarial: TCurrencyEdit
            Left = 258
            Top = 123
            Width = 80
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00 $;-,0.00 $'
            MaxLength = 12
            MaxValue = 999999999.000000000000000000
            TabOrder = 8
            ZeroEmpty = False
          end
          object edtSalariosEnCero: TIntEdit
            Left = 391
            Top = 122
            Width = 69
            Height = 21
            TabOrder = 9
            Text = '0'
            Alignment = taRightJustify
            MaxLength = 6
            MaxValue = 999999
          end
          object edtFechaPresentacion: TDateEditor
            Left = 93
            Top = 98
            Width = 83
            Height = 21
            TabOrder = 5
          end
          object dbgMultiperiodo: TArtDBGrid
            Left = 6
            Top = 152
            Width = 489
            Height = 164
            DataSource = dsDDJJ
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 10
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            ClearSelection = False
            IniStorage = FormStorage
            OnGetCellParams = dbgMultiperiodoGetCellParams
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'Periodo'
                Title.Caption = 'Per'#237'odo'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Empleados'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Masa'
                Title.Caption = 'Masa Salarial'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ImpCeros'
                Title.Caption = 'Importes Cero'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FechaPresentacion'
                Title.Caption = 'F.Present.'
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Rectificativa'
                Title.Caption = 'Rect.'
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Estado'
                Title.Caption = 'Estado Aceptaci'#243'n'
                Width = 148
                Visible = True
              end>
          end
          inline fraTipoNomina: TfraStaticCodigoDescripcion
            Left = 93
            Top = 37
            Width = 403
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            inherited cmbDescripcion: TComboGrid
              Width = 340
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
          object edtCodigoRectificativa: TIntEdit
            Left = 288
            Top = 97
            Width = 25
            Height = 21
            Hint = 'C'#243'digo de la Rectificativa'
            TabOrder = 6
            MaxLength = 2
          end
          object ppPeriodoDesdeDDJJ: TPeriodoPicker
            Left = 93
            Top = 73
            Width = 49
            Height = 21
            TabOrder = 2
            Color = clWindow
            Periodo.AllowNull = False
            Periodo.Orden = poAnoMes
            Periodo.Separador = #0
            Periodo.Mes = 6
            Periodo.Ano = 2005
            Periodo.Valor = '200506'
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
          object ppPeriodoHastaDDJJ: TPeriodoPicker
            Left = 165
            Top = 73
            Width = 49
            Height = 21
            TabOrder = 3
            Color = clWindow
            Periodo.AllowNull = False
            Periodo.Orden = poAnoMes
            Periodo.Separador = #0
            Periodo.Mes = 6
            Periodo.Ano = 2005
            Periodo.Valor = '200506'
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
          object tbComandosDDJJ: TToolBar
            Left = 221
            Top = 70
            Width = 76
            Height = 27
            Align = alNone
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = DmEmision.ilByN
            Images = DmEmision.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            object tbAddDDJJ: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 28
              OnClick = tbAddDDJJClick
            end
            object tbDeleteDDJJ: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              ImageIndex = 27
              OnClick = tbDeleteDDJJClick
            end
            object tbLimpiarPres: TToolButton
              Left = 46
              Top = 0
              Hint = 'Limpiar (Ctrl+L)'
              ImageIndex = 1
              OnClick = tbLimpiarPresClick
            end
          end
          object Panel5: TPanel
            Left = 281
            Top = 321
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 11
          end
          object Panel6: TPanel
            Left = 344
            Top = 321
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 12
          end
          object pnColorFOndoPendienteAprobacion: TPanel
            Left = 7
            Top = 320
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 13
          end
        end
        object gbObservacionesMultiperiodo: TGroupBox
          Left = 3
          Top = 344
          Width = 502
          Height = 84
          TabOrder = 1
          DesignSize = (
            502
            84)
          object lblObservacionesMultiperiodo: TLabel
            Left = 9
            Top = 15
            Width = 49
            Height = 13
            Caption = 'Observar:'
          end
          object lblDetalleObservacion: TLabel
            Left = 10
            Top = 42
            Width = 64
            Height = 26
            Caption = 'Detalle Observaci'#243'n:'
            WordWrap = True
          end
          inline fraObservacion: TfraStaticCodigoDescripcion
            Left = 100
            Top = 13
            Width = 394
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            inherited cmbDescripcion: TComboGrid
              Width = 331
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
          object mObservacionDDJJ: TMemo
            Left = 101
            Top = 39
            Width = 392
            Height = 38
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
          end
        end
      end
    end
    object gbCargaNotas: TJvgGroupBox [3]
      Left = 6
      Top = 7
      Width = 514
      Height = 22
      Caption = ' Nota '
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
      FullHeight = 59
    end
    inherited btnAceptar: TButton
      Left = 367
      Top = 507
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 445
      Top = 507
      TabOrder = 5
      OnClick = btnCancelarClick
    end
    object btnSimulacion: TButton
      Left = 287
      Top = 507
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Simulaci'#243'n'
      TabOrder = 3
      OnClick = btnSimulacionClick
    end
    object btnGestionar: TButton
      Left = 207
      Top = 507
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Gestionar'
      TabOrder = 2
      OnClick = btnGestionarClick
    end
    object btnAutorizacion: TButton
      Left = 127
      Top = 507
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Autorizaci'#243'n'
      TabOrder = 1
      OnClick = btnAutorizacionClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ien.en_descripcion, ims.ms_descripcion, ino.no_id,'
      '       DECODE (TRIM (ino.no_tiposolicitante),'
      '               '#39'0'#39', (SELECT se_nombre'
      '                       FROM art.use_usuarios'
      '                      WHERE se_id = ino.no_solicitante),'
      '               '#39'1'#39', (SELECT sc_descripcion'
      '                       FROM art.usc_sectores'
      '                      WHERE sc_id = ino.no_solicitante),'
      '               '#39'2'#39', (SELECT sn_descripcion'
      '                       FROM emi.isn_solicitantesnota'
      '                      WHERE sn_id = ino.no_solicitante),'
      '               '#39'N/D'#39
      '              ) solicitante,'
      
        '       ino.no_fecharecepcion, ino.no_fecharecepcionart, no_solic' +
        'itante,'
      
        '       ino.no_idmotivosolicitudnota, ino.no_contrato, ino.no_der' +
        'ivado,'
      
        '       ino.no_fechaderivado, ino.no_observaciones, ino.no_biblio' +
        'rato,'
      
        '       ino.no_secuencia, ino.no_fechacumplimiento, ino.no_usuari' +
        'ocumplimiento,'
      
        '       ino.no_idevento, ino.no_usualta, ino.no_fechaalta, ino.no' +
        '_usumodif,'
      '       ino.no_fechamodif, ino.no_fechabaja, ino.no_usubaja,'
      
        '       ino.no_idmotivosolicitudnota, ino.no_observacionescumplim' +
        'iento,'
      
        '       ino.no_idestadonota, ino.no_tiposolicitante, ino.no_notae' +
        'mpresa,'
      '       ino.no_idloteddjj, no_idsolicitudautorizacion'
      '  FROM emi.ino_nota ino,'
      '       emi.ien_estadonota ien,'
      '       emi.ims_motivosolicitudnota ims'
      ' WHERE ((ino.no_idestadonota = ien.en_id(+))'
      '        AND (ino.no_idmotivosolicitudnota = ims.ms_id(+))'
      '       )'
      '')
    Left = 79
    Top = 497
  end
  inherited dsConsulta: TDataSource
    Left = 51
    Top = 496
  end
  inherited SortDialog: TSortDialog
    Left = 160
    Top = 592
  end
  inherited ExportDialog: TExportDialog
    Left = 188
    Top = 592
  end
  inherited QueryPrint: TQueryPrint
    Left = 188
    Top = 620
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 23
    Top = 496
  end
  inherited FormStorage: TFormStorage
    Left = 160
    Top = 650
  end
  inherited PrintDialog: TPrintDialog
    Left = 160
    Top = 620
  end
  inherited ShortCutControl: TShortCutControl
    Left = 216
    Top = 624
  end
  inherited FieldHider: TFieldHider
    Left = 192
    Top = 651
  end
  object cdsPeriodos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NP_ID'
        DataType = ftInteger
      end
      item
        Name = 'NP_PERIODO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NP_FECHABAJA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'InxPeriodo'
        DescFields = 'NP_PERIODO'
        Fields = 'NP_PERIODO'
        Options = [ixPrimary, ixUnique, ixDescending]
      end>
    IndexName = 'InxPeriodo'
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 685
  end
  object sdqEvolucion: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT * FROM COMUNES.CSS_STATUSEVENTO'
      
        'WHERE ss_idseguimientoevento = :id AND ss_idsubevento = :idsubev' +
        'ento')
    Left = 472
    Top = 548
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'idsubevento'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsEvolucion: TDataSource
    DataSet = sdqEvolucion
    Left = 507
    Top = 548
  end
  object cdsDDJJ: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Periodo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Empleados'
        DataType = ftInteger
      end
      item
        Name = 'Masa'
        DataType = ftFloat
      end
      item
        Name = 'ImpCeros'
        DataType = ftInteger
      end
      item
        Name = 'FechaPresentacion'
        DataType = ftDate
      end
      item
        Name = 'Rectificativa'
        DataType = ftInteger
      end
      item
        Name = 'IdDDJJ'
        DataType = ftInteger
      end
      item
        Name = 'Estado'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IdAutorizacion'
        DataType = ftInteger
      end
      item
        Name = 'IdEstado'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cdsDDJJIndex'
        Fields = 'Periodo;FechaPresentacion'
        Options = [ixPrimary]
      end>
    IndexName = 'cdsDDJJIndex'
    Params = <>
    StoreDefs = True
    Left = 456
    Top = 178
    Data = {
      E80000009619E0BD01000000180000000A000000000003000000E80007506572
      696F646F010049000000010005574944544802000200140009456D706C656164
      6F730400010000000000044D617361080004000000000008496D704365726F73
      040001000000000011466563686150726573656E746163696F6E040006000000
      00000D52656374696669636174697661040001000000000006496444444A4A04
      000100000000000645737461646F010049000000010005574944544802000200
      64000E49644175746F72697A6163696F6E040001000000000008496445737461
      646F04000100000000000000}
  end
  object dsDDJJ: TDataSource
    DataSet = cdsDDJJ
    Left = 488
    Top = 178
  end
end
