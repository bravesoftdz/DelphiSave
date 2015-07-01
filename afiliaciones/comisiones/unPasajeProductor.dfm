inherited frmPasajeProductor: TfrmPasajeProductor
  Left = 325
  Top = 176
  Width = 798
  Height = 596
  Caption = 'Asignaci'#243'n de Comisi'#243'n'
  Constraints.MinHeight = 596
  Constraints.MinWidth = 798
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 790
    Height = 296
    Visible = True
    DesignSize = (
      790
      296)
    object gbEmpresa: TGroupBox
      Left = 3
      Top = 2
      Width = 784
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        784
        40)
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 8
        Top = 14
        Width = 767
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
          767
          21)
        inherited lbContrato: TLabel
          Left = 665
        end
        inherited edContrato: TIntEdit
          Left = 710
        end
        inherited cmbRSocial: TArtComboBox
          Width = 528
        end
      end
    end
    object gbFechaSolicitud: TGroupBox
      Left = 3
      Top = 239
      Width = 206
      Height = 53
      Caption = 'Fecha de Solicitud'
      TabOrder = 3
      object Label2: TLabel
        Left = 95
        Top = 22
        Width = 16
        Height = 13
        Caption = '>>'
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 5
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAltaHasta
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 113
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edFechaAltaDesde
        TabOrder = 1
      end
    end
    object gbEntVendAnt: TGroupBox
      Left = 3
      Top = 42
      Width = 785
      Height = 98
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad / Vendedor Anterior'
      TabOrder = 1
      DesignSize = (
        785
        98)
      object gbEntidadAnt: TGroupBox
        Left = 8
        Top = 12
        Width = 769
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Entidad'
        TabOrder = 0
        DesignSize = (
          769
          40)
        inline fraEntidadAnt: TfraEntidadCUIT
          Left = 2
          Top = 12
          Width = 760
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraEntidadAntExit
          DesignSize = (
            760
            23)
          inherited Label1: TLabel
            Left = 124
          end
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
            ParentFont = True
          end
          inherited Label3: TLabel
            Width = 59
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 268
            Width = 490
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
          inherited edEN_CODBANCO: TPatternEdit
            Left = 160
            Width = 60
          end
        end
      end
      object gbVendedorAnt: TGroupBox
        Left = 8
        Top = 52
        Width = 769
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Vendedor'
        TabOrder = 1
        DesignSize = (
          769
          40)
        inline fraVendedorAnt: TfraVendedoresCUIT
          Left = 3
          Top = 12
          Width = 756
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            756
            24)
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
          end
          inherited Label1: TLabel
            Left = 124
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 276
            Width = 480
          end
          inherited edCodigo: TPatternEdit
            Left = 160
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
        end
      end
    end
    object gbEntVendNue: TGroupBox
      Left = 3
      Top = 141
      Width = 785
      Height = 98
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad / Vendedor Nuevo'
      TabOrder = 2
      DesignSize = (
        785
        98)
      object gbEntidadNue: TGroupBox
        Left = 8
        Top = 12
        Width = 769
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Entidad'
        TabOrder = 0
        DesignSize = (
          769
          40)
        inline fraEntidadNue: TfraEntidadCUIT
          Left = 2
          Top = 12
          Width = 760
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraEntidadNueExit
          DesignSize = (
            760
            23)
          inherited Label1: TLabel
            Left = 124
          end
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
            ParentFont = True
          end
          inherited Label3: TLabel
            Width = 59
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 268
            Width = 490
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
          inherited edEN_CODBANCO: TPatternEdit
            Left = 160
            Width = 60
          end
        end
      end
      object gbVendedorNue: TGroupBox
        Left = 8
        Top = 52
        Width = 769
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Vendedor'
        TabOrder = 1
        DesignSize = (
          769
          40)
        inline fraVendedorNue: TfraVendedoresCUIT
          Left = 3
          Top = 12
          Width = 756
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            756
            24)
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
          end
          inherited Label1: TLabel
            Left = 124
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 276
            Width = 480
          end
          inherited edCodigo: TPatternEdit
            Left = 160
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
        end
      end
    end
    object rgSituacion: TRadioGroup
      Left = 607
      Top = 239
      Width = 181
      Height = 53
      Caption = 'Situaci'#243'n'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Aprobado'
        'No Aprobado'
        'Todos')
      TabOrder = 6
    end
    object gbFechaAprobado: TGroupBox
      Left = 212
      Top = 239
      Width = 206
      Height = 53
      Caption = 'Fecha de Aprobaci'#243'n'
      TabOrder = 4
      object Label1: TLabel
        Left = 95
        Top = 22
        Width = 16
        Height = 13
        Caption = '>>'
      end
      object edFechaAprobadoDesde: TDateComboBox
        Left = 5
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAprobadoHasta
        TabOrder = 0
      end
      object edFechaAprobadoHasta: TDateComboBox
        Left = 113
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edFechaAprobadoDesde
        TabOrder = 1
      end
    end
    object rgTipo: TRadioGroup
      Left = 421
      Top = 239
      Width = 182
      Height = 53
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 3
      Items.Strings = (
        'P. Individual'
        'P. Cartera'
        'Nuevo Conc.'
        'Todos')
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 296
    Width = 790
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    inherited ToolBar: TToolBar
      Width = 773
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
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
        Visible = False
      end
      object tbAprobar: TToolButton
        Left = 383
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 414
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 325
    Width = 790
    Height = 243
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Actividad'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descr. Actividad'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_VIGENCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde Contr.'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_CAPITAS'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_MASASALARIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Masa Salarial'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_SUMAFIJA'
        Title.Alignment = taCenter
        Title.Caption = 'Al'#237'cuota Fija'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_PORCMASA'
        Title.Alignment = taCenter
        Title.Caption = 'Al'#237'cuota Var.'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_VIGENCIATARIFA'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Tarifa'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_PRIMA'
        Title.Alignment = taCenter
        Title.Caption = 'Prima'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DEUDA'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL_ANT'
        Title.Caption = 'Canal Ant.'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD_ANT'
        Title.Caption = 'Entidad Ant.'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_ENTIDAD_ANT'
        Title.Caption = 'Nombre Entidad Ant.'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR_ANT'
        Title.Caption = 'Vendedor Ant.'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_VENDEDOR_ANT'
        Title.Caption = 'Nombre Vendedor Ant.'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION_ANT'
        Title.Alignment = taCenter
        Title.Caption = 'Comisi'#243'n Ant.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL_NVO'
        Title.Caption = 'Canal Nuevo'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD_NVO'
        Title.Caption = 'Entidad Nueva'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_ENTIDAD_NVO'
        Title.Caption = 'Nombre Entidad Nueva'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR_NVO'
        Title.Caption = 'Vendedor Nuevo'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_VENDEDOR_NVO'
        Title.Caption = 'Nombre Vendedor Nuevo'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION_NVO'
        Title.Caption = 'Comisi'#243'n Nueva'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_VIGENCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Nuevo Per. AFIP Desde'
        Width = 121
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_VIGENCIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Nuevo Per. AFIP Hasta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 336
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRCONCEPTO'
        Title.Caption = 'Concepto'
        Width = 214
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_NOMBRAMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Carta Nombramiento'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobaci'#243'n'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 301
    Top = 352
    Width = 733
    Height = 562
    Constraints.MaxHeight = 562
    Constraints.MaxWidth = 733
    Constraints.MinHeight = 562
    Constraints.MinWidth = 733
    DesignSize = (
      733
      562)
    inherited BevelAbm: TBevel
      Top = 526
      Width = 725
    end
    object lbRSocial: TLabel [1]
      Left = 132
      Top = 17
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Label3: TLabel [2]
      Left = 133
      Top = 42
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label4: TLabel [3]
      Left = 7
      Top = 74
      Width = 64
      Height = 13
      Caption = 'Vig. Contrato'
    end
    object Label17: TLabel [4]
      Left = 313
      Top = 74
      Width = 62
      Height = 13
      Caption = 'Masa Salarial'
    end
    object Label5: TLabel [5]
      Left = 173
      Top = 74
      Width = 36
      Height = 13
      Caption = 'C'#225'pitas'
    end
    object Label6: TLabel [6]
      Left = 163
      Top = 100
      Width = 46
      Height = 13
      Caption = 'Suma Fija'
    end
    object Label7: TLabel [7]
      Left = 304
      Top = 100
      Width = 74
      Height = 13
      Caption = 'Porc. Masa Sal.'
    end
    object Label8: TLabel [8]
      Left = 18
      Top = 100
      Width = 49
      Height = 13
      Caption = 'Vig. Tarifa'
    end
    object Label9: TLabel [9]
      Left = 472
      Top = 74
      Width = 26
      Height = 13
      Caption = 'Prima'
    end
    object Label10: TLabel [10]
      Left = 601
      Top = 74
      Width = 31
      Height = 13
      Caption = 'Deuda'
    end
    inherited btnAceptar: TButton
      Left = 578
      Top = 532
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 653
      Top = 532
      TabOrder = 5
    end
    object rgTipoAlta: TRadioGroup
      Left = 8
      Top = 2
      Width = 118
      Height = 65
      Caption = 'Tipo'
      Items.Strings = (
        'Pasaje Individual'
        'Pasaje Cartera'
        'Nuevo Concepto')
      TabOrder = 0
      OnClick = rgTipoAltaClick
    end
    inline fraEmpresaAlta: TfraEmpresa
      Left = 161
      Top = 12
      Width = 560
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
      TabOrder = 1
      DesignSize = (
        560
        21)
      inherited lbContrato: TLabel
        Left = 458
      end
      inherited edContrato: TIntEdit
        Left = 503
      end
      inherited cmbRSocial: TArtComboBox
        Width = 321
      end
    end
    inline fraActividadAlta: TfraStaticActividad
      Left = 181
      Top = 37
      Width = 541
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      DesignSize = (
        541
        24)
      inherited cmbDescripcion: TComboGrid
        Width = 478
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
    object edVigenciaDesdeAlta: TDateComboBox
      Left = 72
      Top = 71
      Width = 88
      Height = 21
      TabOrder = 7
    end
    object edMasaSalarialAlta: TCurrencyEdit
      Left = 381
      Top = 71
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 12
      TabOrder = 9
      ZeroEmpty = False
    end
    object edSumaFijaAlta: TCurrencyEdit
      Left = 212
      Top = 97
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 8
      TabOrder = 13
      ZeroEmpty = False
    end
    object edPorcMasaAlta: TCurrencyEdit
      Left = 381
      Top = 97
      Width = 85
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.0000;-0.0000'
      MaxLength = 12
      TabOrder = 14
      ZeroEmpty = False
    end
    object edVigenciaTarifaAlta: TDateComboBox
      Left = 72
      Top = 97
      Width = 88
      Height = 21
      TabOrder = 12
    end
    object edPrimaAlta: TCurrencyEdit
      Left = 505
      Top = 71
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 15
      TabOrder = 10
      ZeroEmpty = False
    end
    object edDeudaAlta: TCurrencyEdit
      Left = 638
      Top = 71
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 15
      TabOrder = 11
      ZeroEmpty = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 286
      Width = 717
      Height = 237
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cambios Solicitados'
      TabOrder = 3
      DesignSize = (
        717
        237)
      object Label12: TLabel
        Left = 369
        Top = 137
        Width = 46
        Height = 26
        Anchors = [akTop, akRight]
        Caption = 'Per. AFIP Desde'
        WordWrap = True
      end
      object Label13: TLabel
        Left = 9
        Top = 166
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Label14: TLabel
        Left = 579
        Top = 143
        Width = 70
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Porc. Comisi'#243'n'
      end
      object Label11: TLabel
        Left = 476
        Top = 137
        Width = 46
        Height = 26
        Anchors = [akTop, akRight]
        Caption = 'Per. AFIP Hasta'
        WordWrap = True
      end
      object Label15: TLabel
        Left = 9
        Top = 143
        Width = 49
        Height = 13
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'Concepto'
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 53
        Width = 701
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Entidad'
        TabOrder = 1
        DesignSize = (
          701
          40)
        inline fraEntidadCUITNuevo: TfraEntidadCUIT
          Left = 2
          Top = 12
          Width = 692
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraEntidadCUITNuevoExit
          DesignSize = (
            692
            23)
          inherited Label1: TLabel
            Left = 124
          end
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
            ParentFont = True
          end
          inherited Label3: TLabel
            Width = 59
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 268
            Width = 422
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
          inherited edEN_CODBANCO: TPatternEdit
            Left = 160
            Width = 60
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 93
        Width = 701
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Vendedor'
        TabOrder = 2
        DesignSize = (
          701
          40)
        inline fraVendedoresCUITNuevo: TfraVendedoresCUIT
          Left = 3
          Top = 12
          Width = 688
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            688
            24)
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
          end
          inherited Label1: TLabel
            Left = 124
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 276
            Width = 412
          end
          inherited edCodigo: TPatternEdit
            Left = 160
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
        end
      end
      object ppVigenciaDesdeAlta: TPeriodoPicker
        Left = 419
        Top = 140
        Width = 49
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 4
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edPorcComisionAlta: TCurrencyEdit
        Left = 653
        Top = 139
        Width = 55
        Height = 21
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Anchors = [akTop, akRight]
        MaxLength = 6
        MaxValue = 100.000000000000000000
        TabOrder = 6
        ZeroEmpty = False
      end
      object edObservacionesAlta: TMemo
        Left = 9
        Top = 183
        Width = 701
        Height = 48
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 240
        TabOrder = 8
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 13
        Width = 701
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Canal'
        TabOrder = 0
        DesignSize = (
          701
          40)
        inline fraCanalNuevo: TfraCanal
          Left = 10
          Top = 12
          Width = 683
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            683
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 620
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
      object ppVigenciaHastaAlta: TPeriodoPicker
        Left = 526
        Top = 140
        Width = 49
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 5
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      inline fraConceptoAlta: TfraCodigoDescripcion
        Left = 58
        Top = 139
        Width = 305
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        DesignSize = (
          305
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 240
        end
      end
      object chkCartaNombramiento: TCheckBox
        Left = 587
        Top = 163
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'Carta Nombramiento'
        TabOrder = 7
      end
    end
    object edCapitasAlta: TIntEdit
      Left = 212
      Top = 71
      Width = 85
      Height = 21
      TabOrder = 8
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 6
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 118
      Width = 717
      Height = 168
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Asignaci'#243'n Actual'
      TabOrder = 2
      DesignSize = (
        717
        168)
      object Label18: TLabel
        Left = 9
        Top = 142
        Width = 70
        Height = 13
        Caption = 'Porc. Comisi'#243'n'
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 53
        Width = 701
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Entidad'
        TabOrder = 1
        DesignSize = (
          701
          40)
        inline fraEntidadCUITViejo: TfraEntidadCUIT
          Left = 2
          Top = 12
          Width = 692
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraEntidadCUITViejoExit
          DesignSize = (
            692
            23)
          inherited Label1: TLabel
            Left = 124
          end
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
            ParentFont = True
          end
          inherited Label3: TLabel
            Width = 59
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 268
            Width = 422
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
          inherited edEN_CODBANCO: TPatternEdit
            Left = 160
            Width = 60
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 93
        Width = 701
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Vendedor'
        TabOrder = 2
        DesignSize = (
          701
          40)
        inline fraVendedoresCUITViejo: TfraVendedoresCUIT
          Left = 3
          Top = 12
          Width = 688
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            688
            24)
          inherited lbRSocial: TLabel
            Width = 24
            Caption = 'CUIT'
          end
          inherited Label1: TLabel
            Left = 124
          end
          inherited Label2: TLabel
            Left = 228
          end
          inherited cmbDescripcion: TArtComboBox
            Left = 276
            Width = 412
          end
          inherited edCodigo: TPatternEdit
            Left = 160
          end
          inherited mskCuit: TMaskEdit
            Left = 36
          end
        end
      end
      object edPorcComisionAct: TCurrencyEdit
        Left = 83
        Top = 139
        Width = 85
        Height = 21
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        MaxValue = 100.000000000000000000
        TabOrder = 3
        ZeroEmpty = False
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 13
        Width = 701
        Height = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Canal'
        TabOrder = 0
        DesignSize = (
          701
          40)
        inline fraCanalAlta: TfraCanal
          Left = 10
          Top = 12
          Width = 683
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            683
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 620
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
    end
    object fpDatosEntVend: TFormPanel
      Left = 80
      Top = 74
      Width = 581
      Height = 231
      Caption = 'Selecci'#243'n de la Entidad/Vendedor'
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      Constraints.MinHeight = 230
      Constraints.MinWidth = 495
      DesignSize = (
        581
        231)
      object Bevel1: TBevel
        Left = 4
        Top = 195
        Width = 573
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarEntVend: TButton
        Left = 423
        Top = 201
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancelarEntVend: TButton
        Left = 501
        Top = 201
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
      object GridEntVend: TArtDBGrid
        Left = 7
        Top = 5
        Width = 568
        Height = 185
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsEntVend
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ENTIDAD'
            Title.Caption = 'Entidad'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_ENTIDAD'
            Title.Caption = 'Nombre Entidad'
            Width = 157
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENDEDOR'
            Title.Caption = 'Vendedor'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_VENDEDOR'
            Title.Caption = 'Nombre Vendedor'
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VC_PORCCOMISION'
            Title.Alignment = taCenter
            Title.Caption = 'Comisi'#243'n'
            Width = 67
            Visible = True
          end>
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT DECODE(PV_TIPO, '#39'I'#39', '#39'Individual'#39', '#39'C'#39', '#39'Cartera'#39') TIPO,'
      
        '       EM_NOMBRE, EM_CUIT, CO_CONTRATO, AC_CODIGO, AC_DESCRIPCIO' +
        'N, CO_VIGENCIADESDE,'
      
        '       PV_CAPITAS, PV_MASASALARIAL, PV_SUMAFIJA, PV_PORCMASA, PV' +
        '_VIGENCIATARIFA, '
      '       PV_PRIMA, PV_DEUDA, '
      '       ACA_ANT.CA_DESCRIPCION CANAL_ANT, '
      
        '       XEN_ANT.EN_CODBANCO ENTIDAD_ANT, XEN_ANT.EN_NOMBRE NOMBRE' +
        '_ENTIDAD_ANT,  '
      
        '       XVE_ANT.VE_VENDEDOR VENDEDOR_ANT, XVE_ANT.VE_NOMBRE NOMBR' +
        'E_VENDEDOR_ANT,'
      '       VC_PORCCOMISION COMISION_ANT,'
      '       ACA_NVO.CA_DESCRIPCION CANAL_NVO, '
      
        '       XEN_NVO.EN_CODBANCO ENTIDAD_NVO, XEN_NVO.EN_NOMBRE NOMBRE' +
        '_ENTIDAD_NVO,  '
      
        '       XVE_NVO.VE_VENDEDOR VENDEDOR_NVO, XVE_NVO.VE_NOMBRE NOMBR' +
        'E_VENDEDOR_NVO,'
      
        '       PV_PORCCOMISION COMISION_NVO, PV_VIGENCIADESDE, PV_OBSERV' +
        'ACIONES'
      
        '  FROM XVE_VENDEDOR XVE_ANT, XEN_ENTIDAD XEN_ANT, XEV_ENTIDADVEN' +
        'DEDOR XEV_ANT, ACA_CANAL ACA_ANT, '
      
        '       XVE_VENDEDOR XVE_NVO, XEN_ENTIDAD XEN_NVO, XEV_ENTIDADVEN' +
        'DEDOR XEV_NVO, ACA_CANAL ACA_NVO, '
      
        '       AVC_VENDEDORCONTRATO, CAC_ACTIVIDAD, AEM_EMPRESA, ACO_CON' +
        'TRATO, XPV_PASAJEVENDEDOR'
      ' WHERE CO_CONTRATO = PV_CONTRATO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND AC_ID = CO_IDACTIVIDAD'#9'  '
      '   AND VC_ID(+) = PV_IDVENDEDORCONTRATO '
      '   AND XEV_ANT.EV_ID = PV_IDENTVEND'
      '   AND XEN_ANT.EN_ID = XEV_ANT.EV_IDENTIDAD'
      '   AND XVE_ANT.VE_ID = XEV_ANT.EV_IDVENDEDOR'
      '   AND ACA_ANT.CA_ID = XEN_ANT.EN_IDCANAL'
      '   AND XEV_NVO.EV_ID = PV_IDNUEVOENTVEND'
      '   AND XEN_NVO.EN_ID = XEV_NVO.EV_IDENTIDAD'
      '   AND XVE_NVO.VE_ID = XEV_NVO.EV_IDVENDEDOR'
      '   AND ACA_NVO.CA_ID = XEN_NVO.EN_IDCANAL'
      '   AND 1 = 2')
    Left = 8
    Top = 379
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 379
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 407
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 407
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 36
    Top = 435
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 351
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 351
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 435
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
        LinkControl = tbSalir2
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end>
    Left = 64
    Top = 351
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 379
  end
  object sdqEntVend: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqEntVendAfterScroll
    SQL.Strings = (
      'SELECT DECODE(PV_TIPO, '#39'I'#39', '#39'Individual'#39', '#39'C'#39', '#39'Cartera'#39') TIPO,'
      
        '       EM_NOMBRE, EM_CUIT, CO_CONTRATO, AC_CODIGO, AC_DESCRIPCIO' +
        'N, CO_VIGENCIADESDE,'
      
        '       PV_CAPITAS, PV_MASASALARIAL, PV_SUMAFIJA, PV_PORCMASA, PV' +
        '_VIGENCIATARIFA, '
      '       PV_PRIMA, PV_DEUDA, '
      '       ACA_ANT.CA_DESCRIPCION CANAL_ANT, '
      
        '       XEN_ANT.EN_CODBANCO ENTIDAD_ANT, XEN_ANT.EN_NOMBRE NOMBRE' +
        '_ENTIDAD_ANT,  '
      
        '       XVE_ANT.VE_VENDEDOR VENDEDOR_ANT, XVE_ANT.VE_NOMBRE NOMBR' +
        'E_VENDEDOR_ANT,'
      '       VC_PORCCOMISION COMISION_ANT,'
      '       ACA_NVO.CA_DESCRIPCION CANAL_NVO, '
      
        '       XEN_NVO.EN_CODBANCO ENTIDAD_NVO, XEN_NVO.EN_NOMBRE NOMBRE' +
        '_ENTIDAD_NVO,  '
      
        '       XVE_NVO.VE_VENDEDOR VENDEDOR_NVO, XVE_NVO.VE_NOMBRE NOMBR' +
        'E_VENDEDOR_NVO,'
      
        '       PV_PORCCOMISION COMISION_NVO, PV_VIGENCIADESDE, PV_OBSERV' +
        'ACIONES, VC_PORCCOMISION'
      
        '  FROM XVE_VENDEDOR XVE_ANT, XEN_ENTIDAD XEN_ANT, XEV_ENTIDADVEN' +
        'DEDOR XEV_ANT, ACA_CANAL ACA_ANT, '
      
        '       XVE_VENDEDOR XVE_NVO, XEN_ENTIDAD XEN_NVO, XEV_ENTIDADVEN' +
        'DEDOR XEV_NVO, ACA_CANAL ACA_NVO, '
      
        '       AVC_VENDEDORCONTRATO, CAC_ACTIVIDAD, AEM_EMPRESA, ACO_CON' +
        'TRATO, XPV_PASAJEVENDEDOR'
      ' WHERE CO_CONTRATO = PV_CONTRATO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND AC_ID = CO_IDACTIVIDAD'#9'  '
      '   AND VC_ID(+) = PV_IDVENDEDORCONTRATO '
      '   AND XEV_ANT.EV_ID = PV_IDENTVEND'
      '   AND XEN_ANT.EN_ID = XEV_ANT.EV_IDENTIDAD'
      '   AND XVE_ANT.VE_ID = XEV_ANT.EV_IDVENDEDOR'
      '   AND ACA_ANT.CA_ID = XEN_ANT.EN_IDCANAL'
      '   AND XEV_NVO.EV_ID = PV_IDNUEVOENTVEND'
      '   AND XEN_NVO.EN_ID = XEV_NVO.EV_IDENTIDAD'
      '   AND XVE_NVO.VE_ID = XEV_NVO.EV_IDVENDEDOR'
      '   AND ACA_NVO.CA_ID = XEN_NVO.EN_IDCANAL'
      '   AND 1 = 2')
    Left = 108
    Top = 351
  end
  object dsEntVend: TDataSource
    DataSet = sdqEntVend
    Left = 136
    Top = 351
  end
  object pmnuImprimir: TPopupMenu
    Left = 64
    Top = 435
    object mnuImpResultados: TMenuItem
      Caption = 'Resultados'
      OnClick = mnuImpResultadosClick
    end
    object mnuImpAsignacion: TMenuItem
      Caption = 'Asignaci'#243'n de Comisi'#243'n'
      OnClick = mnuImpAsignacionClick
    end
  end
end
