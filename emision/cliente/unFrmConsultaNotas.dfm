inherited frmConsultaNotas: TfrmConsultaNotas
  Left = 39
  Top = 91
  Width = 703
  Height = 442
  Caption = 'Consulta de Notas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 18
    Width = 695
    Height = 214
    object gbEmpresa: TGroupBox
      Left = 6
      Top = 0
      Width = 684
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        684
        44)
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
      inline fraEmpresaNota: TfraEmpresa
        Left = 39
        Top = 15
        Width = 639
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
          639
          21)
        inherited lbRSocial: TLabel
          Left = 87
        end
        inherited lbContrato: TLabel
          Left = 535
        end
        inherited edContrato: TIntEdit
          Left = 582
        end
        inherited cmbRSocial: TArtComboBox
          Left = 135
          Width = 396
        end
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 6
      Top = 45
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
    object gbUsuarioAlta: TGroupBox
      Left = 222
      Top = 45
      Width = 468
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario de Alta'
      TabOrder = 2
      DesignSize = (
        468
        41)
      object cmbUsuarioAlta: TCheckCombo
        Left = 6
        Top = 14
        Width = 456
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object gbFormulario: TGroupBox
      Left = 5
      Top = 86
      Width = 429
      Height = 41
      Caption = 'Formulario'
      TabOrder = 3
      object nbTipoFormulario: TNotebook
        Left = 3
        Top = 11
        Width = 422
        Height = 27
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Page1'
          DesignSize = (
            422
            27)
          inline fraTipoFormulario: TfraCodigoDescripcionExt
            Left = 4
            Top = 2
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
        object TPage
          Left = 0
          Top = 0
          Caption = 'Page2'
          object edTipoFormulario: TEdit
            Left = 5
            Top = 2
            Width = 412
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object gbEstado: TGroupBox
      Left = 437
      Top = 86
      Width = 253
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado'
      TabOrder = 4
      DesignSize = (
        253
        41)
      object cmbEstado: TCheckCombo
        Left = 6
        Top = 14
        Width = 241
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object gbTipoSolicitante: TGroupBox
      Left = 5
      Top = 127
      Width = 197
      Height = 40
      Caption = 'Tipo de Solicitante'
      TabOrder = 5
      object chkUsuario: TCheckBox
        Left = 7
        Top = 16
        Width = 57
        Height = 17
        Caption = 'Usuario'
        TabOrder = 0
        OnClick = chkUsuarioClick
      end
      object chkSector: TCheckBox
        Left = 70
        Top = 16
        Width = 51
        Height = 17
        Caption = 'Sector'
        TabOrder = 1
        OnClick = chkSectorClick
      end
      object chkOtroTipo: TCheckBox
        Left = 130
        Top = 16
        Width = 64
        Height = 17
        Caption = 'Otro Tipo'
        TabOrder = 2
        OnClick = chkOtroTipoClick
      end
    end
    object gbSolicitante: TGroupBox
      Left = 204
      Top = 127
      Width = 305
      Height = 40
      Caption = 'Solicitante'
      TabOrder = 6
      DesignSize = (
        305
        40)
      inline fraSolicitanteNota: TfraStaticCodigoDescripcion
        Left = 6
        Top = 13
        Width = 293
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          293
          23)
        inherited edCodigo: TPatternEdit
          Width = 82
        end
        inherited cmbDescripcion: TComboGrid
          Left = 85
          Width = 230
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
    end
    object gbEstadoBorrador: TGroupBox
      Left = 512
      Top = 127
      Width = 176
      Height = 40
      Caption = 'Estado Borrador'
      TabOrder = 7
      object chkAVerificar: TCheckBox
        Left = 11
        Top = 16
        Width = 86
        Height = 17
        Caption = 'A Verificar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object chkCorregidas: TCheckBox
        Left = 99
        Top = 16
        Width = 71
        Height = 17
        Caption = 'Corregida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object gbSecuencia: TGroupBox
      Left = 3
      Top = 168
      Width = 107
      Height = 41
      Caption = 'Secuencia'
      TabOrder = 8
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
    object gbBibliorato: TGroupBox
      Left = 113
      Top = 168
      Width = 69
      Height = 41
      Caption = 'Bibliorato'
      TabOrder = 9
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
      Left = 185
      Top = 168
      Width = 69
      Height = 41
      Caption = 'Per'#237'odo'
      TabOrder = 10
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
    object gbNivelSimulacion: TGroupBox
      Left = 257
      Top = 168
      Width = 434
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Nivel Simulaci'#243'n'
      TabOrder = 11
      DesignSize = (
        434
        41)
      inline fraNivelSimulacion: TfraCodigoDescripcionExt
        Left = 5
        Top = 13
        Width = 425
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          425
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 40
          Width = 381
        end
        inherited edCodigo: TPatternEdit
          Width = 36
        end
      end
    end
    object gbFechaRecepcionEmi: TGroupBox
      Left = 703
      Top = 131
      Width = 213
      Height = 41
      Caption = 'Fecha Recepci'#243'n'
      TabOrder = 12
      Visible = False
      object lblFechaHastaFIltro: TLabel
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
      object edFRecepcionEmisionDesde: TDateComboBox
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
      object edFRecepcionEmisionHasta: TDateComboBox
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
    object gbFechaRecepcionART: TGroupBox
      Left = 922
      Top = 132
      Width = 213
      Height = 41
      Caption = 'Fecha Recepci'#243'n ART'
      TabOrder = 13
      Visible = False
      object Label2: TLabel
        Left = 98
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
      object edFRecepcionARTDesde: TDateComboBox
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
      object edFRecepcionARTHasta: TDateComboBox
        Left = 119
        Top = 15
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
  end
  inherited CoolBar: TCoolBar
    Top = 232
    Width = 695
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 691
      end>
    inherited ToolBar: TToolBar
      Width = 678
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
        Hint = 'Ver Observaciones'
        Enabled = False
        Visible = True
        OnClick = tbPropiedadesClick
      end
      object tbObservacion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Observaci'#243'n'
        Caption = 'Observaci'#243'n'
        ImageIndex = 18
        OnClick = tbObservacionClick
      end
      object tbSimular: TToolButton
        Left = 393
        Top = 0
        Hint = 'Simular Nota'
        Caption = 'Simular'
        ImageIndex = 37
        OnClick = tbSimularClick
      end
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 18
        Caption = 'ToolButton1'
        ImageIndex = 6
        Wrap = True
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 0
        Top = 40
        Width = 663
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object lblReferenciaDiferenciaDevengado: TLabel
          Left = 29
          Top = 4
          Width = 48
          Height = 13
          Caption = 'A Verificar'
        end
        object Label1: TLabel
          Left = 107
          Top = 4
          Width = 45
          Height = 13
          Caption = 'Corregida'
        end
        object Label3: TLabel
          Left = 183
          Top = 4
          Width = 41
          Height = 13
          Caption = 'Aplicada'
        end
        object lblLeyendaPeriodoPendienteAprob: TLabel
          Left = 263
          Top = 4
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
        object lblSimulacion: TLabel
          Left = 351
          Top = 4
          Width = 81
          Height = 13
          Caption = 'En Simulaci'#243'n'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210816
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label31: TLabel
          Left = 459
          Top = 4
          Width = 49
          Height = 13
          Caption = 'Agendada'
        end
        object pnColorDiferenciaDevengado: TPanel
          Left = 9
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = clGray
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 86
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = 3794432
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 162
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = 14811135
          TabOrder = 2
        end
        object pnColorFOndoPendienteAprobacion: TPanel
          Left = 241
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 3
        end
        object Panel4: TPanel
          Left = 330
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 4
        end
        object pnColorSolicitudAgendada: TPanel
          Left = 439
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = clAqua
          TabOrder = 5
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 261
    Width = 695
    Height = 117
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'NO_ID'
        Title.Caption = 'Nro. Nota'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Title.Caption = 'Cuit'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_CONTRATO'
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
        Expanded = False
        FieldName = 'NO_BIBLIORATO'
        Title.Caption = 'Bibliorato'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SECUENCIA'
        Title.Caption = 'Secuencia'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_PERIODO'
        Title.Caption = 'Per'#237'odo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_IDTIPOFORMULARIO'
        Title.Caption = 'C'#243'digo Formulario'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOFORM'
        Title.Caption = 'Formulario'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADOFORM'
        Title.Caption = 'Est. Formulario'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Title.Caption = 'Estado'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SOLICITANTE'
        Title.Caption = 'Solicitante'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUALTA'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHARECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHARECEPCIONART'
        Title.Caption = 'Fecha Recepci'#243'n ART'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SOLICITANTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_IDMOTIVOSOLICITUDNOTA'
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
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDESTADONOTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_TIPOSOLICITANTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAAPLICACION'
        Title.Caption = 'Fecha Aplicaci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUARIOAPLICACION'
        Title.Caption = 'Usuario Aplicaci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAASIMULACION'
        Title.Caption = 'Fecha Simulaci'#243'n'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUARIOASIMULACION'
        Title.Caption = 'Usuario Simulaci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIVELAUTO'
        Title.Caption = 'Nivel Simulaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NP_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 120
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 378
    Width = 695
    Height = 37
    Align = alBottom
    TabOrder = 3
    Visible = False
    DesignSize = (
      695
      37)
    object btnSeleccionar: TButton
      Left = 534
      Top = 6
      Width = 79
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Seleccionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSeleccionarClick
    end
    object btnCancel: TButton
      Left = 615
      Top = 6
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object gbFiltro: TJvgGroupBox [4]
    Left = 0
    Top = 0
    Width = 695
    Height = 18
    Align = alTop
    Caption = 'Filtros'
    TabOrder = 4
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
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GroupIndex = 1
    GlyphCollapsed.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0012FA94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000D00012000012F90012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000487C92000016E70012F9C40005510000787C92000014070092056D00E770
      7C00500016000016E7001866AC00FBB80000000012000000000012F96400000E
      00008A000000003703000000460000000000450000007C92090092094E006688
      7C00240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C920500154C4000FA280000700012000012F9000000000005C8
      0000907C92000018660012FA3C0005510000D87C92000014070092056D0066AC
      7C0098001800001866000000000000000000800014000018640000000000012E
      0000370000000000000000000200006E0000050001000000000012F908000008
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00707C92000016E7000000380066AC
      0000000018007FFDF00012F9D80000000000340000000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001866AC006698
      0000000018000000000016F72000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF00000000000000000000800000000000100186698000000
      0000000000000000000012FA500064E00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C009800000000186600D1D4DE000000
      77002000000000000000B9F42A00BAFDED00FC01C500478D6C00C5BAFE004246
      0100FDEDC80001C5BA000000000000000000A80000000015220012FA8C00616D
      0000202E7300000001000003320000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DC0000D40015000016E6001522E00073E0
      0000FF004800FFFFFF001522A800C12E0000DC004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    GlyphExpanded.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000078000000
      0000000000000000000000000000000000000000000000000000140640000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000000012000000000012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000587C92000016E80012F9C40005510000787C92000014070092056D00E880
      7C00600016000016E80018680400FBB80000000012000000000014017800000E
      0000F0000000001867000000460000000000450000007C920900140178006798
      0000240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C92050014CA2000FA280000700012000012F9000000000005C8
      0000E87C92000018670012FA3C0005510000D87C92000014070092056D006804
      7C00F0001800001867000000000000000000900014000018650000000000010C
      000039000000000000000000020000720000050001000000000012F908000009
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00807C92000016E800000038006804
      0000000018007FFDF00012F9D80001780000340014000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001868040067F0
      0000000018000000000016F83000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF000000000000000000008000000000001001867F0000000
      0000000000000000000012FA500065F00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C00F000000000186700D1D4DE000000
      770020000000000000005CF47600BAFDE5004601C500E5700700C5BAFD000746
      0100FDE5700001C5BA000000000000000000A80000000015220012FA8C00656D
      0000206F6E00000001000000780000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DE0000E40015000016E7001522E20073E2
      0000FF004800FFFFFF001522A800C12E0000DE004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    OnCollapsed = gbFiltroCollapsed
    OnExpanded = gbFiltroExpanded
    FullHeight = 18
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT   ien.en_descripcion, ims.ms_descripcion, ino.no_id,'
      '         DECODE(TRIM(ino.no_tiposolicitante),'
      '                '#39'0'#39', (SELECT se_nombre'
      '                        FROM art.use_usuarios'
      '                       WHERE se_id = ino.no_solicitante),'
      '                '#39'1'#39', (SELECT sc_descripcion'
      '                        FROM art.usc_sectores'
      '                       WHERE sc_id = ino.no_solicitante),'
      '                '#39'2'#39', (SELECT sn_descripcion'
      '                        FROM emi.isn_solicitantesnota'
      '                       WHERE sn_id = ino.no_solicitante),'
      '                '#39'N/D'#39') solicitante,'
      
        '         ino.no_fecharecepcion, ino.no_fecharecepcionart, no_sol' +
        'icitante, ino.no_idmotivosolicitudnota, ino.no_contrato,'
      
        '         ino.no_bibliorato, ino.no_secuencia, ino.no_usualta, in' +
        'o.no_fechaalta, ino.no_usumodif, ino.no_fechamodif,'
      
        '         ino.no_fechabaja, ino.no_usubaja, ino.no_idestadonota, ' +
        'ino.no_tiposolicitante, ino.no_idmotivosolicitudnota,'
      
        '         ino.no_observacionescumplimiento, em_nombre empresa, no' +
        '_estadocorreccion, no_fechaaplicacion, no_usuarioaplicacion,'
      
        '         no_fechaasimulacion, no_usuarioasimulacion, na_descripc' +
        'ion nivelauto, em_cuit cuit, no_idnivelautorizacionsim,'
      
        '         np_periodo, tf_descripcion tipoform, ef_descripcion est' +
        'adoform, NO_OBSERVACIONES, np_observacion,'
      '         np_id, np_idsolicitudautorizacion, np_idtipoformulario'
      
        '    FROM afi.aem_empresa, afi.aco_contrato, emi.ino_nota ino, em' +
        'i.ien_estadonota ien, emi.ina_nivelautorizacion ina,'
      
        '         emi.ims_motivosolicitudnota ims, EMI.INP_NOTACONTRATOPE' +
        'RIODO inp, EMI.ITF_TIPOFORMULARIO ITF, '
      '         EMI.IEF_ESTADOFORMULARIO IEF'
      '   WHERE (    (ino.no_idestadonota = ien.en_id)'
      '          AND (ino.no_idmotivosolicitudnota = ims.ms_id))'
      '     AND ina.na_id(+) = no_idnivelautorizacionsim'
      '     AND co_contrato = no_contrato'
      '     AND co_idempresa = em_id'
      '     AND no_idestadonota <> 4'
      '     AND (INO.NO_ID = INP.NP_IDNOTA)'
      '     AND ITF.TF_ID = INP.NP_IDTIPOFORMULARIO'
      '     AND EF_ID = NP_IDESTADOFORMULARIO'
      '     AND 1 = 2'
      'ORDER BY no_id DESC')
    Left = 16
    Top = 292
    object sdqConsultaEN_DESCRIPCION: TStringField
      FieldName = 'EN_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqConsultaMS_DESCRIPCION: TStringField
      FieldName = 'MS_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqConsultaNO_ID: TFloatField
      FieldName = 'NO_ID'
      Required = True
    end
    object sdqConsultaSOLICITANTE: TStringField
      FieldName = 'SOLICITANTE'
      Size = 250
    end
    object sdqConsultaNO_FECHARECEPCION: TDateTimeField
      FieldName = 'NO_FECHARECEPCION'
      Required = True
    end
    object sdqConsultaNO_FECHARECEPCIONART: TDateTimeField
      FieldName = 'NO_FECHARECEPCIONART'
    end
    object sdqConsultaNO_SOLICITANTE: TFloatField
      FieldName = 'NO_SOLICITANTE'
      Required = True
    end
    object sdqConsultaNO_IDMOTIVOSOLICITUDNOTA: TFloatField
      FieldName = 'NO_IDMOTIVOSOLICITUDNOTA'
      Required = True
    end
    object sdqConsultaNO_CONTRATO: TFloatField
      FieldName = 'NO_CONTRATO'
    end
    object sdqConsultaNO_BIBLIORATO: TFloatField
      FieldName = 'NO_BIBLIORATO'
    end
    object sdqConsultaNO_SECUENCIA: TFloatField
      FieldName = 'NO_SECUENCIA'
    end
    object sdqConsultaNO_USUALTA: TStringField
      FieldName = 'NO_USUALTA'
      Required = True
    end
    object sdqConsultaNO_FECHAALTA: TDateTimeField
      FieldName = 'NO_FECHAALTA'
      Required = True
    end
    object sdqConsultaNO_USUMODIF: TStringField
      FieldName = 'NO_USUMODIF'
    end
    object sdqConsultaNO_FECHAMODIF: TDateTimeField
      FieldName = 'NO_FECHAMODIF'
    end
    object sdqConsultaNO_FECHABAJA: TDateTimeField
      FieldName = 'NO_FECHABAJA'
    end
    object sdqConsultaNO_USUBAJA: TStringField
      FieldName = 'NO_USUBAJA'
    end
    object sdqConsultaNO_IDESTADONOTA: TFloatField
      FieldName = 'NO_IDESTADONOTA'
      Required = True
    end
    object sdqConsultaNO_TIPOSOLICITANTE: TFloatField
      FieldName = 'NO_TIPOSOLICITANTE'
      Required = True
    end
    object sdqConsultaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 4000
    end
    object sdqConsultaNO_ESTADOCORRECCION: TStringField
      FieldName = 'NO_ESTADOCORRECCION'
      Size = 1
    end
    object sdqConsultaNO_FECHAAPLICACION: TDateTimeField
      FieldName = 'NO_FECHAAPLICACION'
    end
    object sdqConsultaNO_USUARIOAPLICACION: TStringField
      FieldName = 'NO_USUARIOAPLICACION'
    end
    object sdqConsultaNO_FECHAASIMULACION: TDateTimeField
      FieldName = 'NO_FECHAASIMULACION'
    end
    object sdqConsultaNO_USUARIOASIMULACION: TStringField
      FieldName = 'NO_USUARIOASIMULACION'
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
    object sdqConsultaNO_OBSERVACIONESCUMPLIMIENTO: TStringField
      FieldName = 'NO_OBSERVACIONESCUMPLIMIENTO'
      Size = 1024
    end
    object sdqConsultaNIVELAUTO: TStringField
      FieldName = 'NIVELAUTO'
      Size = 250
    end
    object sdqConsultaNO_IDNIVELAUTORIZACIONSIM: TFloatField
      FieldName = 'NO_IDNIVELAUTORIZACIONSIM'
    end
    object sdqConsultaNO_IDMOTIVOSOLICITUDNOTA_1: TFloatField
      FieldName = 'NO_IDMOTIVOSOLICITUDNOTA_1'
      Required = True
    end
    object sdqConsultaNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqConsultaTIPOFORM: TStringField
      FieldName = 'TIPOFORM'
      Required = True
      Size = 250
    end
    object sdqConsultaESTADOFORM: TStringField
      FieldName = 'ESTADOFORM'
      Required = True
      Size = 120
    end
    object sdqConsultaNO_OBSERVACIONES: TStringField
      FieldName = 'NO_OBSERVACIONES'
      Size = 1024
    end
    object sdqConsultaNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqConsultaNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqConsultaNP_IDSOLICITUDAUTORIZACION: TFloatField
      FieldName = 'NP_IDSOLICITUDAUTORIZACION'
    end
    object sdqConsultaNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
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
    Left = 44
    Top = 320
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 348
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = DmEmision.DBLogin
    Left = 16
    Top = 264
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
