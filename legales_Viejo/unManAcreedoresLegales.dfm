inherited frmManAcreedoresLegales: TfrmManAcreedoresLegales
  Left = 425
  Top = 127
  Width = 809
  Height = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 801
    Height = 33
    Visible = True
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 57
      Height = 13
      Caption = 'CUIT/CUIL:'
    end
    object Label2: TLabel
      Left = 166
      Top = 8
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object edCUITFiltro: TMaskEdit
      Left = 67
      Top = 5
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edDescripcionFiltro: TEdit
      Left = 229
      Top = 5
      Width = 489
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 1
    end
    object chbExclBajas: TCheckBox
      Left = 720
      Top = 7
      Width = 79
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Excluir bajas'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 33
    Width = 801
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 797
      end>
    inherited ToolBar: TToolBar
      Width = 784
    end
  end
  inherited Grid: TArtDBGrid
    Top = 62
    Width = 801
    Height = 521
    Columns = <
      item
        Expanded = False
        FieldName = 'PA_CUITCUIL'
        Title.Caption = 'CUIT/CUIL'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_DENOMINA'
        Title.Caption = 'Acreedor'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOACRE'
        Title.Caption = 'Tipo acreedor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMACOBRO'
        Title.Caption = 'Forma cobro'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETGANANCIAS'
        Title.Caption = 'Ret. ganancias'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETIB'
        Title.Caption = 'Ret. I.B.'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_FECHABAJA'
        Title.Caption = 'F. Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 88
    Width = 637
    Height = 496
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 460
      Width = 629
    end
    inherited btnAceptar: TButton
      Left = 479
      Top = 466
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 557
      Top = 466
      TabOrder = 2
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 637
      Height = 457
      ActivePage = TabSheet2
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dtos Grales'
        DesignSize = (
          629
          429)
        object Label3: TLabel
          Left = 11
          Top = 113
          Width = 63
          Height = 13
          Caption = 'Forma Cobro:'
        end
        object Label4: TLabel
          Left = 11
          Top = 32
          Width = 59
          Height = 13
          Caption = 'Descripci'#243'n:'
        end
        object Bevel1: TBevel
          Left = 2
          Top = 139
          Width = 622
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object lblCuitCuil: TLabel
          Left = 11
          Top = 5
          Width = 57
          Height = 13
          Caption = 'CUIT/CUIL:'
        end
        object Bevel2: TBevel
          Left = 2
          Top = 55
          Width = 622
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label5: TLabel
          Left = 5
          Top = 152
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
        end
        object Label6: TLabel
          Left = 7
          Top = 177
          Width = 42
          Height = 13
          Caption = 'Domicilio'
        end
        object Bevel4: TBevel
          Left = -1
          Top = 259
          Width = 622
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object lbFAX: TLabel
          Left = 6
          Top = 273
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object lblEmailJuzgado: TLabel
          Left = 6
          Top = 299
          Width = 32
          Height = 13
          Caption = 'E-Mail:'
        end
        object Label11: TLabel
          Left = 6
          Top = 323
          Width = 24
          Height = 13
          Caption = 'Tipo '
        end
        object Label12: TLabel
          Left = 11
          Top = 346
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        inline fraFormaCobro: TfraCtbTablas
          Left = 79
          Top = 110
          Width = 540
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          DesignSize = (
            540
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 57
            Width = 481
          end
          inherited edCodigo: TPatternEdit
            Width = 51
          end
        end
        object rgbTipoAcreedor: TRadioGroup
          Left = 8
          Top = 65
          Width = 475
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Tipo de Acreedor '
          Columns = 2
          Items.Strings = (
            'Persona Autorizada'
            'Otros Acreedores')
          TabOrder = 2
        end
        object chbConcertado: TCheckBox
          Left = 545
          Top = 77
          Width = 74
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Concertado'
          TabOrder = 3
        end
        object edDescripcion: TEdit
          Left = 80
          Top = 29
          Width = 541
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 40
          TabOrder = 1
        end
        object edCuitCuil: TMaskEdit
          Left = 80
          Top = 2
          Width = 81
          Height = 21
          Hint = 'CUIT de la Empresa'
          EditMask = '99-99999999-9;0;'
          MaxLength = 13
          TabOrder = 0
        end
        object edTelefono: TEdit
          Left = 88
          Top = 148
          Width = 85
          Height = 21
          MaxLength = 8
          TabOrder = 6
        end
        object edCodArea: TEdit
          Left = 52
          Top = 148
          Width = 33
          Height = 21
          MaxLength = 5
          TabOrder = 5
        end
        object edDomicilio: TEdit
          Left = 51
          Top = 173
          Width = 316
          Height = 21
          Color = clBtnFace
          MaxLength = 35
          ReadOnly = True
          TabOrder = 8
        end
        inline fraDomicilioGral: TfraDomicilio
          Left = 3
          Top = 201
          Width = 616
          Height = 51
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          inherited lbNro: TLabel
            Left = 401
          end
          inherited lbPiso: TLabel
            Left = 473
          end
          inherited lbDto: TLabel
            Left = 549
          end
          inherited lbProvincia: TLabel
            Left = 454
          end
          inherited cmbCalle: TArtComboBox
            Width = 316
          end
          inherited edNumero: TEdit
            Left = 423
          end
          inherited edPiso: TEdit
            Left = 499
          end
          inherited edDto: TEdit
            Left = 571
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 184
          end
          inherited edProvincia: TEdit
            Left = 503
          end
          inherited btnBuscar: TButton
            Left = 366
          end
        end
        object btnCuentasBancarias: TButton
          Left = 512
          Top = 146
          Width = 109
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Cuentas &Bancarias'
          TabOrder = 7
          OnClick = btnCuentasBancariasClick
        end
        object edFax: TPatternEdit
          Left = 51
          Top = 270
          Width = 310
          Height = 21
          MaxLength = 60
          TabOrder = 10
          Pattern = '0123456789()-/'
        end
        object edEmail: TEdit
          Left = 51
          Top = 295
          Width = 310
          Height = 21
          TabOrder = 11
        end
        inline fraTipoPrestador: TfraCodigoDescripcion
          Left = 50
          Top = 319
          Width = 357
          Height = 23
          TabOrder = 12
        end
        object edObservaciones: TMemo
          Left = 11
          Top = 368
          Width = 614
          Height = 56
          TabOrder = 13
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Dtos Economicos'
        ImageIndex = 1
        DesignSize = (
          629
          429)
        object lblFechaImpr: TLabel
          Left = 9
          Top = 100
          Width = 119
          Height = 13
          Caption = 'Fecha Impr.Form.Inscrip.:'
          FocusControl = edFechaImpr
        end
        object Label7: TLabel
          Left = 9
          Top = 37
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Ret.Ganancias:'
        end
        object Label8: TLabel
          Left = 9
          Top = 64
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Ret.Ing.Brutos:'
        end
        object Bevel3: TBevel
          Left = 1
          Top = 90
          Width = 623
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label10: TLabel
          Left = 9
          Top = 10
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Condici'#243'n IVA:'
        end
        object Label9: TLabel
          Left = 232
          Top = 100
          Width = 77
          Height = 13
          Caption = 'Fecha Revisi'#243'n:'
          FocusControl = edFechaRevision
        end
        object Label13: TLabel
          Left = 9
          Top = 127
          Width = 113
          Height = 13
          Caption = 'Domicilio de Prestaci'#243'n:'
        end
        object Label14: TLabel
          Left = 8
          Top = 208
          Width = 98
          Height = 13
          Caption = 'Vto. Exclusi'#243'n gcias:'
        end
        object Label15: TLabel
          Left = 8
          Top = 232
          Width = 93
          Height = 13
          Caption = 'Vto. Exclusion IIBB:'
        end
        object Label16: TLabel
          Left = 8
          Top = 256
          Width = 43
          Height = 13
          Caption = 'Nro IIBB:'
        end
        object Label17: TLabel
          Left = 8
          Top = 280
          Width = 91
          Height = 13
          Caption = 'Act. seg'#250'n Rentas:'
        end
        object Label18: TLabel
          Left = 8
          Top = 304
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object edFechaImpr: TDateComboBox
          Left = 132
          Top = 97
          Width = 90
          Height = 21
          Color = clWhite
          TabOrder = 4
        end
        inline fraRetGanancias: TfraCtbTablas
          Left = 90
          Top = 34
          Width = 393
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            393
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 45
            Width = 340
          end
          inherited edCodigo: TPatternEdit
            Width = 39
          end
        end
        inline fraRetIB: TfraCodigoDescripcionExt
          Left = 90
          Top = 61
          Width = 404
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DesignSize = (
            404
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 45
            Width = 339
          end
          inherited edCodigo: TPatternEdit
            Width = 39
          end
        end
        object chbCajaMedicos: TCheckBox
          Left = 511
          Top = 64
          Width = 108
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Ret. Caja M'#233'dicos'
          TabOrder = 3
        end
        inline fraSituacionIVA: TfraStaticCTB_TABLAS
          Left = 90
          Top = 6
          Width = 404
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            404
            23)
          inherited edCodigo: TPatternEdit
            Width = 39
          end
          inherited cmbDescripcion: TComboGrid
            Left = 45
            Width = 340
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja'
              'TB_CLAVE'
              'TB_ESPECIAL1')
            ColWidths = (
              40
              300
              -1
              -1
              -1
              -1)
          end
        end
        object edFechaRevision: TDateComboBox
          Left = 314
          Top = 97
          Width = 90
          Height = 21
          Color = clWhite
          TabOrder = 5
        end
        inline fraDomicilioPrestacion: TfraDomicilio
          Left = 3
          Top = 148
          Width = 616
          Height = 51
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          inherited lbNro: TLabel
            Left = 401
          end
          inherited lbPiso: TLabel
            Left = 473
          end
          inherited lbDto: TLabel
            Left = 549
          end
          inherited lbProvincia: TLabel
            Left = 454
          end
          inherited cmbCalle: TArtComboBox
            Width = 316
          end
          inherited edNumero: TEdit
            Left = 423
          end
          inherited edPiso: TEdit
            Left = 499
          end
          inherited edDto: TEdit
            Left = 571
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 184
          end
          inherited edProvincia: TEdit
            Left = 503
          end
          inherited btnBuscar: TButton
            Left = 366
          end
        end
        object ToolBar1: TToolBar
          Left = 131
          Top = 120
          Width = 31
          Height = 27
          Align = alNone
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          object tbCopiar: TToolButton
            Left = 0
            Top = 0
            Hint = 'Copiar Domicilio Prestador'
            Caption = 'tbCopiar'
            ImageIndex = 14
            OnClick = tbCopiarClick
          end
        end
        object edObservacionesEconomico: TMemo
          Left = 8
          Top = 323
          Width = 614
          Height = 71
          TabOrder = 12
        end
        object edVtoExclusionGcias: TDateComboBox
          Left = 116
          Top = 202
          Width = 90
          Height = 21
          Color = clWhite
          TabOrder = 8
        end
        object edVtoExclusionIIBB: TDateComboBox
          Left = 116
          Top = 226
          Width = 90
          Height = 21
          Color = clWhite
          TabOrder = 9
        end
        object edNroIIBB: TMaskEdit
          Left = 212
          Top = 250
          Width = 80
          Height = 21
          Hint = 'CUIT o Clave del Prestador'
          Anchors = [akTop, akRight]
          EditMask = '###-######-#;0;_'
          MaxLength = 12
          TabOrder = 10
        end
        object edActSegunRentas: TIntEdit
          Left = 116
          Top = 275
          Width = 65
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 11
          MaxLength = 6
        end
        object ToolBarIngresosBrutos: TToolBar
          Left = 116
          Top = 250
          Width = 91
          Height = 21
          Align = alNone
          Anchors = [akTop, akRight]
          ButtonHeight = 21
          ButtonWidth = 75
          Caption = 'ToolBarIngresosBrutos'
          EdgeBorders = []
          Flat = True
          ShowCaptions = True
          TabOrder = 13
          object tbIngresoBrutos: TToolButton
            Left = 0
            Top = 0
            Caption = 'Nro.Ing.Brutos'
            DropdownMenu = pmnuIngBrutos
            ImageIndex = 0
            Style = tbsDropDown
            OnClick = tbIngresoBrutosClick
          end
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT pa_cuitcuil, pa_acreedor, pa_denomina, pa_concertado, pa_' +
        'formacobro, pa_fechaalta, pa_domicilio, pa_telcod, pa_telnum,'
      
        '       pa_localidad, pa_codpostal, pa_provincia, pa_pais, pa_ori' +
        'gen, pa_retganancias, pa_retingresosbrutos, pa_codpostala,'
      
        '       pa_telprefijo, pa_retencajamed, TRUNC(pa_fechabaja) pa_fe' +
        'chabaja, pa_fechaimpresionforminscr,'
      
        '       tacre.tb_descripcion tipoacre, fcobro.tb_descripcion form' +
        'acobro, retga.tb_descripcion retganancias,'
      
        '       retib.tb_descripcion retib, pv_descripcion provincia, pa_' +
        'calle, pa_numero, pa_piso, pa_departamento, pa_cpostal, pa_id,'
      
        '       pa_iva, pa_fecharevision, utiles.armar_domicilio(pa_calle' +
        ', pa_numero, pa_piso, pa_departamento, pa_localidad) domicilio,'
      
        '       pa_modulo, pa_fax, pa_email, pa_idtipoprestador, pa_obser' +
        'vacion, pa_calleprestacion, pa_numeroprestacion,'
      
        '       pa_pisoprestacion, pa_departamentoprestacion, pa_cpostalp' +
        'restacion, pa_cpaprestacion, pa_localidadprestacion,'
      
        '       pa_provinciaprestacion, pa_usualta, pa_usubaja, pa_fecham' +
        'odif, pa_usumodif, pa_vtoexclusiongcias, pa_vtoexclusioniibb,'
      '       pa_nroiibb, pa_actsegunrentas, pa_observacioneseconomicos'
      
        '  FROM spa_pagoacre, ctb_tablas tacre, ctb_tablas fcobro, ctb_ta' +
        'blas retga, ctb_tablas retib, cpv_provincias'
      ' WHERE pa_acreedor = tacre.tb_codigo'
      '   AND tacre.tb_clave = '#39'TACRE'#39
      '   AND pa_formacobro = fcobro.tb_codigo'
      '   AND fcobro.tb_clave = '#39'COBRO'#39
      '   AND pa_retganancias = retga.tb_codigo(+)'
      '   AND retga.tb_clave(+) = '#39'RETGA'#39
      '   AND pa_retingresosbrutos = retib.tb_codigo(+)'
      '   AND retib.tb_clave(+) = '#39'RETIB'#39
      '   AND pa_provincia = pv_codigo(+)'
      '   AND pa_acreedor IN('#39'OA'#39', '#39'PA'#39')'
      '   AND pa_modulo = '#39'L'#39)
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
        LinkControl = tbSalir
      end>
    Left = 108
    Top = 91
  end
  object pmnuIngBrutos: TPopupMenu
    Left = 81
    Top = 260
    object mnuNroIngBrutos: TMenuItem
      Caption = 'Nro.Ing.Brutos'
      OnClick = mnuNroIngBrutosClick
    end
    object mnuCUIT: TMenuItem
      Tag = 1
      Caption = 'CUIT/CUIL     '
      OnClick = mnuNroIngBrutosClick
    end
  end
end
