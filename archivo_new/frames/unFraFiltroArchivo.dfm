inherited fraFiltroArchivo: TfraFiltroArchivo
  Width = 526
  Height = 102
  VertScrollBar.Visible = False
  Font.Charset = ANSI_CHARSET
  ParentFont = False
  OnExit = FrameExit
  ExplicitWidth = 526
  ExplicitHeight = 102
  object pcFormulario: TJvPageControl
    Left = 0
    Top = 24
    Width = 526
    Height = 102
    ActivePage = tsNone
    Align = alTop
    TabOrder = 1
    TabPosition = tpBottom
    TabStop = False
    ClientBorderWidth = 0
    HideAllTabs = True
    ExplicitWidth = 1920
    object tsNone: TTabSheet
      ImageIndex = 4
    end
    object tsCuit: TTabSheet
      Caption = 'tsCuit'
      ImageIndex = 7
      DesignSize = (
        526
        84)
      object Label5: TLabel
        Left = 24
        Top = 8
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaCUIT: TfraEmpresa
        Left = 52
        Top = 5
        Width = 472
        Height = 21
        VertScrollBar.Visible = False
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
        TabStop = True
        ExplicitLeft = 52
        ExplicitTop = 5
        ExplicitWidth = 472
        ExplicitHeight = 21
        DesignSize = (
          472
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 377
          ExplicitLeft = 377
        end
        inherited edContrato: TIntEdit
          Left = 422
          Width = 49
          ExplicitLeft = 422
          ExplicitWidth = 49
        end
        inherited cmbRSocial: TArtComboBox
          Width = 242
          ExplicitWidth = 242
        end
      end
    end
    object tsSiniestro: TTabSheet
      Caption = 'tsSiniestro'
      ImageIndex = 1
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        526
        84)
      object lblSiniestro: TLabel
        Left = 4
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Siniestro'
      end
      object lblOrden: TLabel
        Left = 148
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Orden'
      end
      object lblFechaSiniestro: TLabel
        Left = 354
        Top = 57
        Width = 73
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Fecha Siniestro'
      end
      object Label3: TLabel
        Left = 20
        Top = 34
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lbCUIL: TLabel
        Left = 20
        Top = 56
        Width = 23
        Height = 13
        Caption = 'CUIL'
      end
      object lbRSocial: TLabel
        Left = 227
        Top = 8
        Width = 31
        Height = 13
        Caption = 'Juicios'
        FocusControl = fraEmpresaSiniestro.cmbRSocial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSiniestro: TIntEdit
        Left = 52
        Top = 4
        Width = 88
        Height = 21
        TabOrder = 0
        OnExit = edSiniestroExit
        OnKeyPress = edSiniestroKeyPress
      end
      object edOrden: TIntEdit
        Left = 183
        Top = 4
        Width = 34
        Height = 21
        TabOrder = 1
        Text = '1'
        OnExit = edOrdenExit
        OnKeyPress = edOrdenKeyPress
        Value = 1
      end
      inline fraEmpresaSiniestro: TfraEmpresa
        Left = 52
        Top = 28
        Width = 471
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ExplicitLeft = 52
        ExplicitTop = 28
        ExplicitWidth = 471
        ExplicitHeight = 21
        DesignSize = (
          471
          21)
        inherited lbRSocial: TLabel
          Left = 87
          ExplicitLeft = 87
        end
        inherited lbContrato: TLabel
          Left = 367
          ExplicitLeft = 367
        end
        inherited mskCUIT: TMaskEdit
          Color = 15724780
        end
        inherited edContrato: TIntEdit
          Left = 413
          Color = 15724780
          ExplicitLeft = 413
        end
        inherited cmbRSocial: TArtComboBox
          Width = 232
          Color = 15724780
          ExplicitWidth = 232
        end
      end
      object edFechaSiniestro: TDateComboBox
        Left = 429
        Top = 53
        Width = 94
        Height = 21
        Color = 15724780
        Enabled = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 4
      end
      inline fraTrabajadorSiniestro: TfraTrabajador
        Left = 52
        Top = 53
        Width = 297
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 3
        ExplicitLeft = 52
        ExplicitTop = 53
        ExplicitWidth = 297
        DesignSize = (
          297
          22)
        inherited mskCUIL: TMaskEdit
          Color = 15724780
        end
        inherited cmbNombre: TArtComboBox
          Width = 213
          Color = 15724780
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 213
        end
      end
      object edJuicio: TEdit
        Left = 263
        Top = 4
        Width = 224
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15724780
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
      end
      object ToolBarSiniestro: TToolBar
        Left = 495
        Top = 3
        Width = 26
        Height = 24
        Align = alNone
        Anchors = [akTop, akRight]
        Images = ImageList
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        object tbBuscarSiniestro: TToolButton
          Left = 0
          Top = 0
          Hint = 'Buscar siniestros'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = tbBuscarSiniestroClick
        end
      end
    end
    object tsTipoNumero: TTabSheet
      Caption = 'tsTipoNumero'
      ImageIndex = 2
      DesignSize = (
        526
        84)
      object Label1: TLabel
        Left = 12
        Top = 8
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label2: TLabel
        Left = 148
        Top = 8
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object edNumero: TIntEdit
        Left = 52
        Top = 4
        Width = 89
        Height = 21
        TabOrder = 0
        OnExit = edNumeroExit
        OnKeyPress = edNumeroKeyPress
      end
      inline fraCodDescTipo: TfraCodigoDescripcion
        Left = 172
        Top = 4
        Width = 351
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = True
        ExplicitLeft = 172
        ExplicitTop = 4
        ExplicitWidth = 351
        DesignSize = (
          351
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 286
          ExplicitWidth = 286
        end
      end
    end
    object tsNumero: TTabSheet
      Caption = 'tsNumero'
      ImageIndex = 5
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        526
        84)
      object lblNumero: TLabel
        Left = 11
        Top = 7
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object edNumNumeroDesde: TPatternEdit
        Left = 52
        Top = 3
        Width = 121
        Height = 21
        MaxLength = 16
        TabOrder = 0
        OnExit = edNumNumeroDesdeExit
        OnKeyPress = edNumNumeroDesdeKeyPress
        Pattern = '0123456789'
      end
      object edInfoAdicionalNro: TMemo
        Left = 52
        Top = 27
        Width = 469
        Height = 50
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15724780
        ReadOnly = True
        TabOrder = 1
      end
    end
    object tsJuicio: TTabSheet
      Caption = 'tsJuicio'
      ImageIndex = 3
      DesignSize = (
        526
        84)
      object Juicio: TLabel
        Left = 22
        Top = 9
        Width = 26
        Height = 13
        Caption = 'Juicio'
      end
      object lblContra: TLabel
        Left = 252
        Top = 37
        Width = 11
        Height = 13
        Caption = 'C/'
      end
      inline fraJuicio: TfraArchJuicio
        Left = 50
        Top = 4
        Width = 475
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 50
        ExplicitTop = 4
        ExplicitWidth = 475
        DesignSize = (
          475
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 410
          ExplicitWidth = 410
        end
      end
      object edDemandante: TEdit
        Left = 51
        Top = 30
        Width = 196
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 15724780
        Enabled = False
        TabOrder = 1
      end
      object edDemandado: TEdit
        Left = 266
        Top = 30
        Width = 257
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = 15724780
        Enabled = False
        TabOrder = 2
      end
    end
    object tsCuitEstableci: TTabSheet
      Caption = 'tsCuitEstableci'
      DesignSize = (
        526
        84)
      object lbEmprCuitEstableci: TLabel
        Left = 22
        Top = 8
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaEmpresa: TfraEmpresa
        Left = 52
        Top = 4
        Width = 470
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
        TabStop = True
        ExplicitLeft = 52
        ExplicitTop = 4
        ExplicitWidth = 470
        ExplicitHeight = 21
        DesignSize = (
          470
          21)
        inherited lbContrato: TLabel
          Left = 368
          ExplicitLeft = 368
        end
        inherited edContrato: TIntEdit
          Left = 413
          ExplicitLeft = 413
        end
        inherited cmbRSocial: TArtComboBox
          Width = 231
          ExplicitWidth = 231
        end
      end
    end
    object tsBiblioratoNota: TTabSheet
      Caption = 'tsBiblioratoNota'
      ImageIndex = 6
      DesignSize = (
        526
        84)
      object lblBilbliorato: TLabel
        Left = 5
        Top = 8
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bibliorato'
      end
      object lblNota: TLabel
        Left = 186
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Secuencia'
      end
      object lbCUIT: TLabel
        Left = 10
        Top = 60
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observ.'
        FocusControl = fraEmpresaNota.mskCUIT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 25
        Top = 33
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object edBibliorato: TIntEdit
        Left = 52
        Top = 4
        Width = 129
        Height = 21
        TabOrder = 0
        OnExit = edNotaExit
        OnKeyPress = edNotaKeyPress
        MaxLength = 8
      end
      object edNota: TIntEdit
        Left = 238
        Top = 4
        Width = 129
        Height = 21
        TabOrder = 1
        OnExit = edNotaExit
        OnKeyPress = edNotaKeyPress
        MaxLength = 8
      end
      inline fraEmpresaNota: TfraEmpresa
        Left = 52
        Top = 28
        Width = 472
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
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 52
        ExplicitTop = 28
        ExplicitWidth = 472
        ExplicitHeight = 21
        DesignSize = (
          472
          21)
        inherited lbContrato: TLabel
          Left = 370
          ExplicitLeft = 370
        end
        inherited edContrato: TIntEdit
          Left = 414
          ExplicitLeft = 414
        end
        inherited cmbRSocial: TArtComboBox
          Width = 235
          ExplicitWidth = 235
        end
      end
      object edObservaciones: TEdit
        Left = 52
        Top = 56
        Width = 472
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15724780
        ReadOnly = True
        TabOrder = 3
      end
    end
    object tsFecha: TTabSheet
      Caption = 'tsFecha'
      ImageIndex = 8
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblFecha: TLabel
        Left = 19
        Top = 8
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object edFecha: TDateComboBox
        Left = 52
        Top = 5
        Width = 88
        Height = 21
        TabOrder = 0
        OnExit = edFechaExit
        OnKeyPress = edFechaKeyPress
      end
    end
    object tsProveedor: TTabSheet
      Caption = 'tsProveedor'
      ImageIndex = 9
      DesignSize = (
        526
        84)
      inline fraProveedor: TfraProveedor
        Left = 16
        Top = 3
        Width = 509
        Height = 25
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 3
        ExplicitWidth = 509
        DesignSize = (
          509
          25)
        inherited cmbDescripcion: TArtComboBox
          Width = 212
          ExplicitWidth = 212
        end
      end
    end
    object tsEntidadVendedor: TTabSheet
      Caption = 'tsEntidadVendedor'
      ImageIndex = 10
      DesignSize = (
        526
        84)
      inline fraEntidadCUIT: TfraEntidadCUIT
        Left = 2
        Top = 3
        Width = 522
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraEntidadCUITExit
        ExplicitLeft = 2
        ExplicitTop = 3
        ExplicitWidth = 522
        DesignSize = (
          522
          24)
        inherited Label1: TLabel
          Left = 138
          ExplicitLeft = 138
        end
        inherited lbRSocial: TLabel
          Left = 2
          Width = 36
          Caption = 'Entidad'
          ExplicitLeft = 2
          ExplicitWidth = 36
        end
        inherited Label2: TLabel
          Left = 242
          ExplicitLeft = 242
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 291
          Width = 231
          ExplicitLeft = 291
          ExplicitWidth = 231
        end
        inherited mskCuit: TMaskEdit
          Left = 50
          ExplicitLeft = 50
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 173
          Width = 60
          ExplicitLeft = 173
          ExplicitWidth = 60
        end
      end
      inline fraVendedorCUIT: TfraVendedoresCUIT
        Left = 2
        Top = 30
        Width = 523
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = fraVendedorCUITExit
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 523
        DesignSize = (
          523
          24)
        inherited lbRSocial: TLabel
          Left = 2
          Width = 46
          Caption = 'Vendedor'
          ExplicitLeft = 2
          ExplicitWidth = 46
        end
        inherited Label1: TLabel
          Left = 138
          ExplicitLeft = 138
        end
        inherited Label2: TLabel
          Left = 242
          ExplicitLeft = 242
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 291
          Width = 231
          ExplicitLeft = 291
          ExplicitWidth = 231
        end
        inherited edCodigo: TPatternEdit
          Left = 174
          ExplicitLeft = 174
        end
        inherited mskCuit: TMaskEdit
          Left = 50
          ExplicitLeft = 50
        end
      end
    end
    object tsVendedor: TTabSheet
      Caption = 'tsVendedor'
      ImageIndex = 11
      DesignSize = (
        526
        84)
      inline fraVendedoresCUIT: TfraVendedoresCUIT
        Left = 25
        Top = 3
        Width = 500
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 25
        ExplicitTop = 3
        ExplicitWidth = 500
        DesignSize = (
          500
          24)
        inherited lbRSocial: TLabel
          Left = 1
          Width = 24
          Caption = 'CUIT'
          ExplicitLeft = 1
          ExplicitWidth = 24
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 227
          ExplicitWidth = 227
        end
      end
    end
    object tsTrabajador: TTabSheet
      Caption = 'tsTrabajador'
      ImageIndex = 12
      DesignSize = (
        526
        84)
      object Label8: TLabel
        Left = 26
        Top = 8
        Width = 23
        Height = 13
        Caption = 'CUIL'
      end
      inline fraTrabajad: TfraTrabajador
        Left = 52
        Top = 4
        Width = 472
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 52
        ExplicitTop = 4
        ExplicitWidth = 472
        DesignSize = (
          472
          22)
        inherited cmbNombre: TArtComboBox
          Width = 388
          ExplicitWidth = 388
        end
      end
    end
    object tsEmpresaTrab: TTabSheet
      Caption = 'tsEmpresaTrab'
      ImageIndex = 13
      DesignSize = (
        526
        84)
      object CUIL: TLabel
        Left = 25
        Top = 33
        Width = 23
        Height = 13
        Caption = 'CUIL'
      end
      object Label9: TLabel
        Left = 25
        Top = 7
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaTrab: TfraEmpresa
        Left = 52
        Top = 4
        Width = 470
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
        TabStop = True
        ExplicitLeft = 52
        ExplicitTop = 4
        ExplicitWidth = 470
        ExplicitHeight = 21
        DesignSize = (
          470
          21)
        inherited lbContrato: TLabel
          Left = 366
          ExplicitLeft = 366
        end
        inherited edContrato: TIntEdit
          Left = 413
          ExplicitLeft = 413
        end
        inherited cmbRSocial: TArtComboBox
          Width = 231
          ExplicitWidth = 231
        end
      end
      inline fraTrabajadorTrab: TfraTrabajador
        Left = 52
        Top = 30
        Width = 472
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 52
        ExplicitTop = 30
        ExplicitWidth = 472
        DesignSize = (
          472
          22)
        inherited cmbNombre: TArtComboBox
          Width = 388
          ExplicitWidth = 388
        end
      end
    end
    object tsExtractoBanc: TTabSheet
      Caption = 'tsExtractoBanc'
      ImageIndex = 14
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        526
        84)
      object lbBanco: TLabel
        Left = 9
        Top = 8
        Width = 40
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Banco'
      end
      object lbCuenta: TLabel
        Left = 9
        Top = 34
        Width = 40
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cuenta'
      end
      object Label10: TLabel
        Left = 9
        Top = 60
        Width = 40
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fecha'
      end
      inline fraBancoExtracto: TfraStaticCodigoDescripcion
        Left = 51
        Top = 4
        Width = 473
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 51
        ExplicitTop = 4
        ExplicitWidth = 473
        DesignSize = (
          473
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 410
          ExplicitWidth = 410
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
      inline fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
        Left = 51
        Top = 30
        Width = 473
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 51
        ExplicitTop = 30
        ExplicitWidth = 473
        DesignSize = (
          473
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 410
          ExplicitWidth = 410
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
      object edFechaExtracto: TDateComboBox
        Left = 52
        Top = 57
        Width = 88
        Height = 21
        TabOrder = 2
      end
    end
    object tsAnioPeriodo: TTabSheet
      Caption = 'tsAnioPeriodo'
      ImageIndex = 15
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label11: TLabel
        Left = 11
        Top = 7
        Width = 36
        Height = 13
        Caption = 'Periodo'
      end
      object edAnioPeriodo: TPeriodoPicker
        Left = 52
        Top = 4
        Width = 54
        Height = 22
        OnExit = edAnioPeriodoExit
        TabOrder = 0
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '209606'
        Periodo.MinPeriodo = '199606'
        WidthMes = 19
        Separation = 2
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
    object tsCBU: TTabSheet
      Caption = 'tsCBU'
      ImageIndex = 16
      DesignSize = (
        526
        84)
      object Label12: TLabel
        Left = 1
        Top = 7
        Width = 51
        Height = 13
        Caption = 'CUIT/CUIL'
      end
      inline fraCuentaPago: TfraCodigoDescripcion
        Left = 51
        Top = 4
        Width = 473
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 51
        ExplicitTop = 4
        ExplicitWidth = 473
        DesignSize = (
          473
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 80
          Width = 392
          CharCase = ecUpperCase
          ExplicitLeft = 80
          ExplicitWidth = 392
        end
        inherited edCodigo: TPatternEdit
          Width = 76
          MaxLength = 11
          ExplicitWidth = 76
        end
      end
    end
    object tsPrestador: TTabSheet
      Caption = 'tsPrestador'
      ImageIndex = 17
      DesignSize = (
        526
        84)
      inline fraPrestador: TfraPrestador
        Left = 16
        Top = 3
        Width = 509
        Height = 50
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 3
        ExplicitWidth = 509
        DesignSize = (
          509
          50)
        inherited lbCPostal: TLabel
          Left = 437
          ExplicitLeft = 437
        end
        inherited lbTelefono: TLabel
          Left = 349
          ExplicitLeft = 349
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 54
          ExplicitWidth = 54
        end
        inherited cmbPrestador: TArtComboBox
          Width = 179
          ExplicitWidth = 179
        end
        inherited edPresLocalidad: TEdit
          Width = 83
          ExplicitWidth = 83
        end
        inherited edPresCPostal: TEdit
          Left = 454
          ExplicitLeft = 454
        end
        inherited edPresTelefono: TEdit
          Left = 369
          ExplicitLeft = 369
        end
      end
    end
    object tsTexto: TTabSheet
      Caption = 'tsTexto'
      ImageIndex = 18
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 11
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object edTexto: TEdit
        Left = 52
        Top = 3
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 0
      end
    end
    object tsTipo: TTabSheet
      Caption = 'tsTipo'
      ImageIndex = 19
      DesignSize = (
        526
        84)
      object lblCodTipo: TLabel
        Left = 11
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      inline fraCodTipo: TfraCodigoDescripcion
        Left = 52
        Top = 4
        Width = 469
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 52
        ExplicitTop = 4
        ExplicitWidth = 469
        DesignSize = (
          469
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 404
          ExplicitWidth = 404
        end
      end
    end
  end
  object pnSeleccionArchivo: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      526
      24)
    object lbTipoArchivo: TLabel
      Left = 13
      Top = 5
      Width = 36
      Height = 13
      Caption = 'Archivo'
    end
    object btnCargarCodigoBarras: TJvXPButton
      Left = 429
      Top = 1
      Width = 95
      Caption = 'C'#243'd. Barras'
      TabOrder = 1
      Spacing = 4
      WordWrap = False
      Anchors = [akTop, akRight]
      OnClick = btnCargarCodigoBarrasClick
    end
    inline fraTipoArchivo: TfraCodDesc
      Left = 51
      Top = 0
      Width = 373
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 51
      ExplicitWidth = 373
      DesignSize = (
        373
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 310
        ExplicitWidth = 310
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraFields = ', TA_FORMULARIO, TA_TABLA'
        FieldBaja = 'TA_FECHABAJA'
        FieldCodigo = 'TA_CODIGO'
        FieldDesc = 'TA_DESCRIPCION'
        FieldID = 'TA_ID'
        TableName = 'RTA_TIPOARCHIVO'
        OnChange = OnArchivoChange
      end
    end
  end
  object ImageList: TImageList
    Left = 68
    Top = 164
    Bitmap = {
      494C010101004000400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      00000000000000000000000000000000000000000000BD7739673967DE7B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F8E2DCE391352EF3DDE7B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F6D2DEA7EC7653452CF39
      DE7B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F9C73F75E6B310A7FC7653452
      CF39DE7B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F504190D5C199E25502D0A7FC765
      3556734E7B6FD65AD75A7B6FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018097D21BF2DFF31BB21F03D0A7F
      0D566F25D435DA4A3C5B143EF03DDE7B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001509BF291F325F3A9C3A5F537625
      F339DD4AFF67FF6BFF6FFF773C63CE39FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B6F39113F3A370D1F4B3F4B5715
      7946FF67DF5FFF6FFF77FF7FFF7BF5397B6F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FD65A8B00203481402034F00C
      5E5B9F57BF5FFF6BFF77FF77FF6F5D5BB5560000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000082121040000E25002550251842C
      7E5F7F57BF5BFF67FF6BFF6FFF6B5D5794520000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004208630CE244635D636163612351
      DB4EFF77BF679F5BBF5FDF5FFF6758425A6B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008410A514434DC46DE571C56DA469
      2C25DF77FF7F9F5F7F53DF635F574B29FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A514E71C400C667E667E667E257A
      ED498F2DBA4E9E5B7F5BFD526C2DBD7700000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000210429254A29630C813043694351
      3967DE7B5A6BD65AD65A7B6FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018630821AD353146F75EAD352104
      DE7B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FF75E630CEF3D6B2D21047B6F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C3FF00000000000081FF000000000000
      80FF000000000000007F00000000000000030000000000000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000000000003000000000000
      00FF00000000000001FF00000000000000000000000000000000000000000000
      000000000000}
  end
end
