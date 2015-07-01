inherited frmGestionEmpresasPreventor: TfrmGestionEmpresasPreventor
  Left = 321
  Top = 83
  Caption = 'Gesti'#243'n de Empresas'
  ClientHeight = 569
  ClientWidth = 793
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 801
  ExplicitHeight = 599
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter [0]
    Left = 0
    Top = 482
    Width = 793
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Color = clSilver
    ParentColor = False
    ExplicitTop = 485
  end
  inherited pnlFiltros: TPanel
    Width = 793
    Height = 169
    Visible = True
    ExplicitWidth = 793
    ExplicitHeight = 169
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 793
      Height = 169
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          785
          141)
        object Label4: TLabel
          Left = 0
          Top = 57
          Width = 46
          Height = 13
          Caption = 'Preventor'
        end
        object Label14: TLabel
          Left = 0
          Top = 33
          Width = 30
          Height = 13
          Caption = 'Estab.'
        end
        object Label19: TLabel
          Left = 0
          Top = 9
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label43: TLabel
          Left = 0
          Top = 80
          Width = 53
          Height = 13
          Caption = 'Resoluci'#243'n'
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 55
          Top = 53
          Width = 293
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          ExplicitLeft = 55
          ExplicitTop = 53
          ExplicitWidth = 293
          DesignSize = (
            293
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Width = 221
            CharCase = ecUpperCase
            OnDropDown = fraPreventorFiltrocmbDescripcionDropDown
            ExplicitLeft = 68
            ExplicitWidth = 221
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            CharCase = ecNormal
            ExplicitWidth = 64
          end
        end
        object cbSinPreventor: TCheckBox
          Left = 564
          Top = 56
          Width = 83
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Sin Preventor'
          TabOrder = 7
          OnClick = cbSinPreventorClick
        end
        object edEstablecimiento: TPatternEdit
          Left = 56
          Top = 29
          Width = 618
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Pattern = '1234567890-,'
        end
        object cbPreventorReferente: TCheckBox
          Left = 496
          Top = 56
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Referente'
          TabOrder = 6
          OnClick = cbPreventorReferenteClick
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 57
          Top = 3
          Width = 616
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
          OnExit = fraEmpresaFiltroExit
          ExplicitLeft = 57
          ExplicitTop = 3
          ExplicitWidth = 616
          ExplicitHeight = 21
          DesignSize = (
            616
            21)
          inherited lbContrato: TLabel
            Left = 514
            ExplicitLeft = 514
          end
          inherited edContrato: TIntEdit
            Left = 559
            ExplicitLeft = 559
          end
          inherited cmbRSocial: TArtComboBox
            Width = 377
            ExplicitWidth = 377
          end
        end
        object cbListarCoordinados: TCheckBox
          Left = 417
          Top = 56
          Width = 77
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Coordinados'
          TabOrder = 5
          OnClick = cbListarCoordinadosClick
        end
        object cbCtosActivos: TCheckBox
          Left = 690
          Top = 6
          Width = 92
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Ctos. Activos'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbExcluirBajas: TCheckBox
          Left = 672
          Top = 33
          Width = 110
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Excluir Bajas Estab.'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object cmbVerPreventorExclusivo: TCheckBox
          Left = 653
          Top = 55
          Width = 62
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Exclusivo'
          TabOrder = 8
          OnClick = cmbVerPreventorExclusivoClick
        end
        object cmbPreventorUltVisita: TCheckBox
          Left = 719
          Top = 56
          Width = 63
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Ult. Visita'
          TabOrder = 9
          OnClick = cmbPreventorUltVisitaClick
        end
        object cbVerPreventorSugerido: TCheckBox
          Left = 655
          Top = 80
          Width = 127
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Ver Preventor Sugerido'
          TabOrder = 13
        end
        object cmbResolucion: TCheckCombo
          Left = 56
          Top = 79
          Width = 358
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
        end
        object cbSinReferente: TCheckBox
          Left = 564
          Top = 80
          Width = 83
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Sin Referente'
          TabOrder = 12
        end
        object chkEstabConCPPrev: TCheckBox
          Left = 433
          Top = 80
          Width = 128
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Estab.con CP del Prev.'
          TabOrder = 11
          OnClick = chkEstabConCPPrevClick
        end
        object tbComandosSel: TToolBar
          Left = 343
          Top = 50
          Width = 73
          Height = 28
          Align = alNone
          Anchors = [akTop, akRight]
          BorderWidth = 1
          Caption = 'ToolBar'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Transparent = False
          object tbAddPrev: TToolButton
            Left = 0
            Top = 0
            Hint = 'Agregar a lista'
            ImageIndex = 51
            OnClick = tbAddPrevClick
          end
          object tbDeletePrev: TToolButton
            Left = 23
            Top = 0
            Hint = 'Eliminar de Lista'
            ImageIndex = 52
            OnClick = tbDeletePrevClick
          end
          object tbViewPrev: TToolButton
            Left = 46
            Top = 0
            Hint = 'Ver Lista'
            ImageIndex = 9
            OnClick = tbViewPrevClick
          end
        end
        object cbPreventorProvisorioFiltro: TCheckBox
          Left = 670
          Top = 103
          Width = 112
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Preventor Provisorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          OnClick = cbPreventorProvisorioFiltroClick
        end
      end
      object tbAfiliacion: TTabSheet
        Caption = 'Afiliaciones'
        ImageIndex = 3
        DesignSize = (
          785
          141)
        object Label8: TLabel
          Left = 4
          Top = 8
          Width = 91
          Height = 13
          Caption = 'Cant. Trab. M'#237'nimo'
        end
        object Label12: TLabel
          Left = 172
          Top = 8
          Width = 23
          Height = 13
          Caption = 'M'#225'x.'
        end
        object lbAct: TLabel
          Left = 4
          Top = 64
          Width = 21
          Height = 13
          Caption = 'CIIU'
        end
        object Label10: TLabel
          Left = 4
          Top = 32
          Width = 31
          Height = 13
          Caption = 'Sector'
        end
        object Label38: TLabel
          Left = 473
          Top = 36
          Width = 36
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Holding'
        end
        object lbCategoriaRiesgo: TLabel
          Left = 424
          Top = 64
          Width = 83
          Height = 13
          Caption = 'Categor'#237'a Riesgo'
        end
        object Label45: TLabel
          Left = 573
          Top = 92
          Width = 25
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Zona'
        end
        object Label47: TLabel
          Left = 4
          Top = 116
          Width = 35
          Height = 13
          Caption = 'Depart:'
        end
        object edCantTrabajadoresMin: TIntEdit
          Left = 100
          Top = 4
          Width = 59
          Height = 21
          TabOrder = 0
          MaxLength = 8
        end
        object edCantTrabajadoresMax: TIntEdit
          Left = 196
          Top = 4
          Width = 59
          Height = 21
          TabOrder = 1
          MaxLength = 8
        end
        object cbEventual: TCheckBox
          Left = 152
          Top = 64
          Width = 73
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Eventuales'
          TabOrder = 3
        end
        object edActividad: TIntEdit
          Left = 100
          Top = 60
          Width = 47
          Height = 21
          TabOrder = 2
          MaxLength = 8
        end
        inline fraLocalidad: TfraLocalidadEx
          Left = 4
          Top = 88
          Width = 517
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 4
          ExplicitTop = 88
          ExplicitWidth = 517
          ExplicitHeight = 25
          DesignSize = (
            517
            25)
          inherited lbCPostal: TLabel
            Left = 0
            Width = 39
            ExplicitLeft = 0
            ExplicitWidth = 39
          end
          inherited lbLocalidad: TLabel
            Left = 150
            Width = 46
            ExplicitLeft = 150
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 329
            Width = 44
            ExplicitLeft = 329
            ExplicitWidth = 44
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 199
            Width = 129
            ExplicitLeft = 199
            ExplicitWidth = 129
          end
          inherited cmbProvincia: TCheckCombo
            Left = 375
            Width = 139
            ExplicitLeft = 375
            ExplicitWidth = 139
          end
          inherited edCPostal: TPatternEdit
            Left = 95
            Width = 47
            ExplicitLeft = 95
            ExplicitWidth = 47
          end
          inherited sdqDatos: TSDQuery
            Left = 162
            Top = 19
          end
          inherited dsDatos: TDataSource
            Left = 321
            Top = 22
          end
        end
        object chkGBA: TCheckBox
          Left = 525
          Top = 92
          Width = 42
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'GBA'
          TabOrder = 6
        end
        object cmbHolding: TCheckCombo
          Left = 517
          Top = 32
          Width = 263
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 7
        end
        object cmbSector: TCheckCombo
          Left = 100
          Top = 32
          Width = 318
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
        end
        object cmbCategoriaRiesgo: TCheckCombo
          Left = 516
          Top = 60
          Width = 264
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
        end
        object cmbZona: TCheckCombo
          Left = 601
          Top = 88
          Width = 179
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 10
        end
        object cmbEstabTiposEventual: TCheckCombo
          Left = 232
          Top = 60
          Width = 185
          Height = 21
          TabOrder = 4
        end
        inline fraDepart: TfraCodDesc
          Left = 98
          Top = 113
          Width = 496
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 11
          ExplicitLeft = 98
          ExplicitTop = 113
          ExplicitWidth = 496
          DesignSize = (
            496
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 0
            Width = 422
            OnChange = fraDepartcmbDescripcionChange
            OnExit = fraDepartcmbDescripcionExit
            ExplicitLeft = 0
            ExplicitWidth = 422
          end
          inherited edCodigo: TPatternEdit
            Left = 426
            Anchors = [akTop, akRight]
            Visible = False
            ExplicitLeft = 426
          end
          inherited sdqDatos: TSDQuery
            SQL.Strings = (
              '  SELECT  ROWNUM AS ID,'
              '          ROWNUM AS codigo,'
              '          cp_departamento AS descripcion,'
              '          '#39#39' AS baja'
              '    FROM  (SELECT  DISTINCT cp_departamento'
              '             FROM  art.ccp_codigopostal'
              '            WHERE  cp_departamento IS NOT NULL) depto'
              'ORDER BY  cp_departamento')
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'rownum'
            FieldDesc = 'cp_departamento'
            FieldID = 'rownum'
            IdType = ctInteger
            OrderBy = 'cp_departamento'
            TableName = 'art.ccp_codigopostal'
          end
        end
        object cbEmpresaVip: TCheckBox
          Left = 604
          Top = 119
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Empresas VIP'
          TabOrder = 12
        end
      end
      object tbVarios: TTabSheet
        Caption = 'Prevenci'#243'n'
        ImageIndex = 1
        DesignSize = (
          785
          141)
        object Label15: TLabel
          Left = 4
          Top = 7
          Width = 76
          Height = 13
          Caption = 'Tipo Prev. Emp.'
        end
        object Label21: TLabel
          Left = 356
          Top = 7
          Width = 40
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Ranking'
        end
        object Label22: TLabel
          Left = 4
          Top = 55
          Width = 40
          Height = 13
          Caption = 'SubTipo'
        end
        object Label23: TLabel
          Left = 4
          Top = 31
          Width = 79
          Height = 13
          Caption = 'Tipo SRT Estab.'
        end
        object Label11: TLabel
          Left = 356
          Top = 33
          Width = 66
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Estado Estab.'
        end
        object Label25: TLabel
          Left = 356
          Top = 55
          Width = 51
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Perfil Prev.'
        end
        object Label31: TLabel
          Left = 4
          Top = 77
          Width = 52
          Height = 26
          Caption = 'Motivo '#13#10'Asignaci'#243'n'
        end
        object Label32: TLabel
          Left = 357
          Top = 77
          Width = 52
          Height = 26
          Anchors = [akTop, akRight]
          Caption = 'Vigencia '#13#10'Asignaci'#243'n'
        end
        object Label33: TLabel
          Left = 569
          Top = 82
          Width = 31
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta:'
        end
        object Label34: TLabel
          Left = 437
          Top = 82
          Width = 34
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Desde:'
        end
        inline fraRanking: TfraCodigoDescripcion
          Left = 422
          Top = 3
          Width = 267
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 3
          ExplicitLeft = 422
          ExplicitTop = 3
          ExplicitWidth = 267
          DesignSize = (
            267
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 203
            ExplicitWidth = 203
          end
        end
        inline fraSubTipoFiltro: TfraCodigoDescripcion
          Left = 82
          Top = 50
          Width = 265
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 82
          ExplicitTop = 50
          ExplicitWidth = 265
          DesignSize = (
            265
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 200
            ExplicitWidth = 200
          end
        end
        inline fraTipoFiltroSRT: TfraCtbTablas
          Left = 82
          Top = 26
          Width = 264
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 82
          ExplicitTop = 26
          ExplicitWidth = 264
          DesignSize = (
            264
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 64
            Width = 200
            ExplicitLeft = 64
            ExplicitWidth = 200
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            ExplicitWidth = 59
          end
        end
        object cmbTipoEmpresaPrev: TCheckCombo
          Left = 83
          Top = 3
          Width = 263
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
        end
        object cmbEstadoEstab: TCheckCombo
          Left = 423
          Top = 28
          Width = 266
          Height = 21
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 4
        end
        inline fraPerfil: TfraCodigoDescripcion
          Left = 422
          Top = 50
          Width = 267
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 422
          ExplicitTop = 50
          ExplicitWidth = 267
          DesignSize = (
            267
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 203
            ExplicitWidth = 203
          end
        end
        inline fraMotivoAsignacionFiltro: TfraCodigoDescripcion
          Left = 82
          Top = 78
          Width = 265
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          ExplicitLeft = 82
          ExplicitTop = 78
          ExplicitWidth = 265
          DesignSize = (
            265
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 200
            CharCase = ecUpperCase
            ExplicitWidth = 200
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            CharCase = ecNormal
            ExplicitWidth = 59
          end
        end
        object edVigenciaAsigFiltro: TDateComboBox
          Left = 474
          Top = 79
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 7
        end
        object edVigenciaAsigFiltro2: TDateComboBox
          Left = 602
          Top = 79
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 8
        end
      end
      object tbOperativo: TTabSheet
        Caption = 'Operativo'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cbAnexoI: TCheckBox
          Left = 7
          Top = 8
          Width = 74
          Height = 17
          Caption = 'Anexo I/III'
          TabOrder = 0
        end
        object cbPrs: TCheckBox
          Left = 157
          Top = 8
          Width = 79
          Height = 17
          Caption = 'PRS/PAPE'
          TabOrder = 8
        end
        object cbAnexoII: TCheckBox
          Left = 7
          Top = 33
          Width = 81
          Height = 17
          Caption = 'Anexo II/IV'
          TabOrder = 2
        end
        object cbDenunciasGrales: TCheckBox
          Left = 157
          Top = 33
          Width = 105
          Height = 17
          Caption = 'Denuncias Grales.'
          TabOrder = 10
        end
        object cbAvisoObra: TCheckBox
          Left = 312
          Top = 8
          Width = 75
          Height = 17
          Caption = 'Aviso Obra'
          TabOrder = 14
        end
        object cmbAnexoI: TExComboBox
          Left = 96
          Top = 4
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbAnexoII: TExComboBox
          Left = 96
          Top = 30
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 3
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbPrs: TExComboBox
          Left = 264
          Top = 4
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 9
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbDenunciasGrales: TExComboBox
          Left = 264
          Top = 30
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 11
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cmbAvisoObra: TExComboBox
          Left = 389
          Top = 4
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 15
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cbAnexoFicticio: TCheckBox
          Left = 7
          Top = 58
          Width = 90
          Height = 17
          Caption = 'Anexo Ficticio'
          TabOrder = 4
        end
        object cmbAnexoFicticio: TExComboBox
          Left = 96
          Top = 55
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 5
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cbOtrasDenuncias: TCheckBox
          Left = 157
          Top = 58
          Width = 105
          Height = 17
          Caption = 'Otras Denuncias'
          TabOrder = 12
        end
        object cmbOtrasDenuncias: TExComboBox
          Left = 264
          Top = 55
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 13
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cbUltimoOperativo: TCheckBox
          Left = 312
          Top = 32
          Width = 105
          Height = 17
          Caption = 'Ultimo Operativo'
          TabOrder = 16
        end
        object cmbEmpresaSinPreventorExclusivo: TCheckBox
          Left = 452
          Top = 9
          Width = 180
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Empresa sin Preventor Exclusivo'
          TabOrder = 19
          OnClick = cbPreventorReferenteClick
        end
        object cmbEmpresaPreventorExclusivo: TCheckBox
          Left = 452
          Top = 30
          Width = 180
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Empresa con Preventor Exclusivo'
          TabOrder = 20
          OnClick = cbPreventorReferenteClick
        end
        object cbTercerizado: TCheckBox
          Left = 311
          Top = 56
          Width = 114
          Height = 17
          Caption = 'Estab de Terceros'
          TabOrder = 17
          OnClick = cbSinPreventorClick
        end
        object cbPAL: TCheckBox
          Left = 6
          Top = 80
          Width = 79
          Height = 17
          Caption = 'PAL'
          TabOrder = 6
        end
        object cmbPAL: TExComboBox
          Left = 96
          Top = 79
          Width = 41
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 7
          Text = 'S=Si'
          Items.Strings = (
            'S=Si'
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
        object cbNoTercerizado: TCheckBox
          Left = 311
          Top = 77
          Width = 90
          Height = 17
          Caption = 'Estab Propio'
          TabOrder = 18
          OnClick = cbSinPreventorClick
        end
      end
      object tbVisitas: TTabSheet
        Caption = 'Visitas'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label44: TLabel
          Left = 8
          Top = 11
          Width = 62
          Height = 13
          Caption = 'Visita Desde:'
        end
        object Label46: TLabel
          Left = 164
          Top = 11
          Width = 31
          Height = 13
          Caption = 'Hasta:'
        end
        object edVisitaDesde: TDateComboBox
          Left = 73
          Top = 7
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edVisitaHasta: TDateComboBox
          Left = 200
          Top = 7
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object chkSinVisita: TCheckBox
          Left = 296
          Top = 11
          Width = 67
          Height = 17
          Caption = 'Sin Visita'
          TabOrder = 2
          OnClick = chkSinVisitaClick
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Resoluci'#243'n 463'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object chkCancerigenos: TCheckBox
          Left = 8
          Top = 0
          Width = 219
          Height = 17
          Caption = 'Dentro de la Res. 415/02 (Cancer'#237'genos)'
          TabOrder = 0
        end
        object chkDifenilos: TCheckBox
          Left = 8
          Top = 20
          Width = 217
          Height = 17
          Caption = 'Dentro de la Res. 497/03 (Difenilos)'
          TabOrder = 1
        end
        object chkAccMayores: TCheckBox
          Left = 8
          Top = 40
          Width = 220
          Height = 17
          Caption = 'Dentro de la Res. 743/03 (Acc. Mayores)'
          TabOrder = 2
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 169
    Width = 793
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 787
      end>
    ExplicitTop = 169
    ExplicitWidth = 793
    inherited ToolBar: TToolBar
      Width = 780
      ExplicitWidth = 780
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      object tbCambiarPreventor: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cambiar Preventor'
        Caption = 'tbCambiarPreventor'
        ImageIndex = 19
        OnClick = tbCambiarPreventorClick
      end
      object tbCP: TToolButton
        Left = 393
        Top = 0
        Hint = 'Consulta de CP asignados'
        Caption = 'tbCP'
        ImageIndex = 49
        OnClick = tbCPClick
      end
      object tbAfiliaciones: TToolButton
        Left = 416
        Top = 0
        Hint = 'Afiliaciones'
        Caption = 'tbAfiliaciones'
        ImageIndex = 15
        OnClick = tbAfiliacionesClick
      end
      object tbDomicilioMiRegistro: TToolButton
        Left = 439
        Top = 0
        Hint = 'Domicilio Mi Registro'
        ImageIndex = 16
        OnClick = tbDomicilioMiRegistroClick
      end
      object tbExclusionEmpresas: TToolButton
        Left = 462
        Top = 0
        Hint = 'Solicitud de Exclusi'#243'n de empresas'
        Caption = 'tbExclusionEmpresas'
        ImageIndex = 20
        OnClick = tbExclusionEmpresasClick
      end
      object ToolButton2: TToolButton
        Left = 485
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbAplicarSugerido: TToolButton
        Left = 493
        Top = 0
        Hint = 'Aplicar Preventor Sugerido'
        Caption = 'tbAplicarSugerido'
        ImageIndex = 47
        OnClick = tbAplicarSugeridoClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 516
        Top = 0
        Hint = 'Invertir Selecci'#243'n'
        Caption = 'Invertir Selecci'#243'n'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodos: TToolButton
        Left = 539
        Top = 0
        Hint = 'Seleccionar Todos'
        Caption = 'Seleccionar Todos'
        ImageIndex = 46
        OnClick = tbSeleccionarTodosClick
      end
      object tbCambioVista: TToolButton
        Left = 562
        Top = 0
        Hint = 'Cambiar modo'
        Caption = 'tbCambioVista'
        ImageIndex = 22
        OnClick = tbCambioVistaClick
      end
      object tbCambioTipoPrev: TToolButton
        Left = 585
        Top = 0
        Hint = 'Cambio Tipo Prevenci'#243'n'
        Caption = 'tbCambioTipoPrev'
        ImageIndex = 49
        OnClick = tbCambioTipoPrevClick
      end
      object tbCambioPeriodicidad: TToolButton
        Left = 608
        Top = 0
        Hint = 'Cambio de Periodicidad'
        Caption = 'tbCambioPeriodicidad'
        ImageIndex = 50
        OnClick = tbCambioPeriodicidadClick
      end
      object tbConsSiniestros: TToolButton
        Left = 631
        Top = 0
        Hint = 'Consulta de Siniestros'
        Caption = 'Consulta de Siniestros'
        ImageIndex = 53
        OnClick = tbConsSiniestrosClick
      end
      object tbEstimacionVisitasAnual: TToolButton
        Left = 654
        Top = 0
        Hint = 'Estimaci'#243'n de Visitas Anual'
        Caption = 'tbEstimacionVisitasAnual'
        ImageIndex = 44
        OnClick = tbEstimacionVisitasAnualClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 218
    Width = 793
    Height = 237
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    RowColor2 = clBlack
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ESTABLECI'
        Title.Caption = 'Nro. Estab.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre Establecimiento'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPREVENCION'
        Title.Caption = 'Tipo Prevenci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPREVEMPRESA'
        Title.Caption = 'Tipo Prevenci'#243'n Empresa'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPOSRT'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo SRT'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_ACTIVIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Actividad'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_COORDINADOR'
        Title.Caption = 'Coordinador'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'C.Postal'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        Title.Caption = 'Provincia'
        Width = 150
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
        FieldName = 'AC_RELACION'
        Title.Caption = 'CIUU'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_EMPLEADOS'
        Title.Caption = 'Cant. Trab. Empresa'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ANEXO1'
        Title.Caption = 'Tiene Anexo I/III'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ANEXO2'
        Title.Caption = 'Tiene Anexo II/IV'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ANEXO1FICTICIO'
        Title.Caption = 'Tiene Anexo Fict.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEPRS'
        Title.Caption = 'Tiene PRS'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEPAL'
        Title.Caption = 'Tiene PAL'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEDENUNCIAGRAL'
        Title.Caption = 'Tiene Denuncias Grales.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIENEDENUNCIA'
        Title.Caption = 'Tiene Otras Denuncias'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTVISITA'
        Title.Caption = 'Fecha Ult.Visita'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTRELEV'
        Title.Caption = 'Fecha Ult. Relev.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAULTCAP'
        Title.Caption = 'Fecha Ult. Cap.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ES_EVENTUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Eventual'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAINICIOOBRA'
        Title.Caption = 'Inicio Obra'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAEXTENSIONOBRA'
        Title.Caption = 'Extensi'#243'n Obra'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAFINOBRA'
        Title.Caption = 'Fin Obra'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVULTVISITA'
        Title.Caption = 'Prev.Ult. Visita'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVSUGERIDO'
        Title.Caption = 'Prev. Sugerido'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CANTVISITAS'
        Title.Caption = 'Visitas Operativo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CANTCAPACIT'
        Title.Caption = 'Capacit.Oper.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CANTRELEV'
        Title.Caption = 'Relev.Operativo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        Title.Caption = 'Motivo Asignaci'#243'n'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAVENCIMIENTOASIG'
        Title.Caption = 'F.Vencimiento Asignaci'#243'n'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_TELEFONOS'
        Title.Caption = 'Tel'#233'fono'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Holding'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Categor'#237'a Riesgo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZC_DESCRIPCION'
        Title.Caption = 'Zona'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ep_pramet'
        Title.Caption = 'Ingreso p/ PRAM'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIPORELEV'
        Title.Caption = 'Tipo Relevamiento'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESAVIP'
        Title.Caption = 'Empresa VIP'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECUENCIAVISITAPERS'
        Title.Caption = 'Frecuencia Personalizada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sector'
        Title.Caption = 'Sector'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGOACTUAL'
        Title.Caption = 'CIUU Actual'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALIDO463'
        Title.Caption = 'RGRL Valido'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVENTORPROVISORIO'
        Title.Caption = 'Prreventor Provisorio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FDESDEPREVPROVISORIO'
        Title.Caption = 'Fecha desde Preventor Provisorio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FHASTAPREVPROVISORIO'
        Title.Caption = 'Fecha Hasta Preventor Provisorio'
        Visible = True
      end>
  end
  object fpMotivoCambio: TFormPanel [4]
    Left = 427
    Top = 249
    Width = 517
    Height = 108
    Caption = 'Motivo Cambio'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnClose = fpMotivoCambioClose
    OnBeforeShow = fpMotivoCambioBeforeShow
    DesignSize = (
      517
      108)
    object Bevel3: TBevel
      Left = 4
      Top = 72
      Width = 509
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label17: TLabel
      Left = 14
      Top = 15
      Width = 87
      Height = 13
      Caption = 'Motivo del Cambio'
    end
    object btnAceptarMotivo: TButton
      Left = 275
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object edMotivoCambioSolicitado: TRichEdit
      Left = 113
      Top = 12
      Width = 389
      Height = 48
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnTodos: TButton
      Left = 353
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Todos'
      TabOrder = 2
      OnClick = btnTodosClick
    end
    object Button3: TButton
      Left = 435
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
  end
  object dbgEmpresa: TArtDBGrid [5]
    Left = 0
    Top = 487
    Width = 793
    Height = 82
    Align = alBottom
    DataSource = dsDatosEmpresa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgEmpresaCellClick
    OnDrawColumnCell = dbgEmpresaDrawColumnCell
    OnDblClick = dbgEmpresaDblClick
    OnKeyDown = dbgEmpresaKeyDown
    IniStorage = FormStorage
    OnGetCellParams = dbgEmpresaGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CUIT'
        Title.Caption = 'CUIT'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_OPERATIVO'
        Title.Caption = 'Operativo'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPREVENCION'
        Title.Caption = 'Tipo Prevenci'#243'n'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOSTR'
        Title.Caption = 'Tipo SRT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBTIPO'
        Title.Caption = 'SubTipo'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INCID'
        Title.Caption = 'Incidencia'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENTE'
        Title.Caption = 'Prev. Referente'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONOEMP'
        Title.Caption = 'Tel'#233'fono'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_RIGEDESDE'
        Title.Caption = 'Vig. Desde'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_RIGEHASTA'
        Title.Caption = 'Vig. Hasta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor Notif Programa'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHANOTIFICACION'
        Title.Caption = 'Fecha Notificaci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Holding'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_FECHA'
        Title.Caption = 'Fecha de Incidencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia Actual'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 1 mes atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 2 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 3 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 4 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 5 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 6 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 7 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 8 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 9 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 10 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Incidencia 11 meses atras'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVEX'
        Title.Caption = 'Preventor Exclusivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIAHASTA'
        Title.Caption = 'Vigencia hasta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_PRAMET'
        Title.Caption = 'Ingreso p/ PRAM'
        Width = 90
        Visible = True
      end>
  end
  object tbEmpresas: TToolBar [6]
    Left = 0
    Top = 455
    Width = 793
    Height = 27
    Align = alBottom
    BorderWidth = 1
    ButtonHeight = 25
    Caption = 'ToolBar'
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    object ToolButton7: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object tbRefrescarEmpresa: TToolButton
      Left = 8
      Top = 0
      Hint = 'Refrescar (Ctrl + F5)'
      ImageIndex = 0
      OnClick = tbRefrescarEmpresaClick
    end
    object tbModificarEmpresa: TToolButton
      Left = 31
      Top = 0
      Hint = 'Modificar'
      Enabled = False
      ImageIndex = 7
      OnClick = tbModificarEmpresaClick
    end
    object ToolButton13: TToolButton
      Left = 54
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
      Visible = False
    end
    object tbOcultarGridEmpresa: TToolButton
      Left = 62
      Top = 0
      Hint = 'Ocultar'
      Caption = 'Ocultar'
      ImageIndex = 10
      Style = tbsCheck
      OnClick = tbOcultarGridEmpresaClick
    end
    object tbLimpiarEmpresa: TToolButton
      Left = 85
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'Limpiar'
      ImageIndex = 1
      OnClick = tbLimpiarEmpresaClick
    end
    object tbSalirEmpresa: TToolButton
      Left = 108
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      Caption = 'Salir'
      ImageIndex = 5
      OnClick = tbSalirEmpresaClick
    end
    object ToolButton1: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbImprimirEmpresa: TToolButton
      Left = 139
      Top = 0
      Hint = 'Imprimir Empresa'
      Caption = 'tbImprimirEmpresa'
      ImageIndex = 4
      OnClick = tbImprimirEmpresaClick
    end
    object tbExportarEmpresa: TToolButton
      Left = 162
      Top = 0
      Caption = 'tbExportarEmpresa'
      ImageIndex = 3
      OnClick = tbExportarEmpresaClick
    end
    object ToolButton9: TToolButton
      Left = 185
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object tbBorrarMarcas: TToolButton
      Left = 193
      Top = 0
      Hint = 'Desmarcar Todos'
      Caption = 'tbBorrarMarcas'
      ImageIndex = 45
      OnClick = tbBorrarMarcasClick
    end
    object tbMarcarTodas: TToolButton
      Left = 216
      Top = 0
      Hint = 'Seleccionar Todo'
      Caption = 'tbMarcarTodas'
      ImageIndex = 46
      OnClick = tbMarcarTodasClick
    end
    object tbCambiarPrevRef: TToolButton
      Left = 239
      Top = 0
      Hint = 'Cambio Preventor Referente'
      Caption = 'Cambiopreventor'
      ImageIndex = 19
      OnClick = tbCambiarPrevRefClick
    end
    object tbCambiarPrevExclusivo: TToolButton
      Left = 262
      Top = 0
      Hint = 'Cambiar Preventor Exclusivo'
      Caption = 'tbCambiarPrevExclusivo'
      ImageIndex = 47
      OnClick = tbCambiarPrevExclusivoClick
    end
  end
  object fpCambioPreventorRef: TFormPanel [7]
    Left = 342
    Top = 349
    Width = 517
    Height = 77
    Caption = 'Cambio Preventor Referente'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      517
      77)
    object Bevel4: TBevel
      Left = 4
      Top = 41
      Width = 509
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label37: TLabel
      Left = 8
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Prev Ref.'
    end
    object btnAceptarCambioprev: TButton
      Left = 355
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarCambioprevClick
    end
    inline fraCambioPrevRef: TfraCodigoDescripcion
      Left = 56
      Top = 10
      Width = 448
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 56
      ExplicitTop = 10
      ExplicitWidth = 448
      DesignSize = (
        448
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 383
        CharCase = ecUpperCase
        ExplicitWidth = 383
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object btnCancel: TButton
      Left = 434
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpCambioPrevExclusivo: TFormPanel [8]
    Left = 814
    Top = 605
    Width = 517
    Height = 77
    Caption = 'Cambio Preventor Exclusivo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      517
      77)
    object Bevel5: TBevel
      Left = 4
      Top = 41
      Width = 509
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label42: TLabel
      Left = 8
      Top = 9
      Width = 48
      Height = 26
      Caption = '   Prev '#13#10'Exclusivo.'
    end
    object btnAceptarCambioprevExclusivo: TButton
      Left = 355
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarCambioprevExclusivoClick
    end
    inline fraCambioPrevExclusivo: TfraCodigoDescripcion
      Left = 56
      Top = 10
      Width = 448
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 56
      ExplicitTop = 10
      ExplicitWidth = 448
      DesignSize = (
        448
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 383
        CharCase = ecUpperCase
        ExplicitWidth = 383
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object btnCancelPrevExclusivo: TButton
      Left = 434
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpEmpresaModif: TFormPanel [9]
    Left = -50
    Top = 351
    Width = 682
    Height = 267
    Caption = 'Modificaci'#243'n de Empresa'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MinHeight = 133
    Constraints.MinWidth = 570
    DesignSize = (
      682
      267)
    object Bevel2: TBevel
      Left = 4
      Top = 231
      Width = 674
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 13
      Top = 74
      Width = 45
      Height = 13
      Caption = 'Prev Ref.'
    end
    object Label9: TLabel
      Left = 12
      Top = 49
      Width = 49
      Height = 13
      Caption = 'Tipo Prev.'
    end
    object Label18: TLabel
      Left = 15
      Top = 23
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object Label24: TLabel
      Left = 409
      Top = 48
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo Srt'
    end
    object Label35: TLabel
      Left = 9
      Top = 123
      Width = 51
      Height = 26
      Hint = 'Preventor Notif Programa'
      Caption = '   Notif '#13#10'Programa:.'
    end
    object Label36: TLabel
      Left = 14
      Top = 156
      Width = 34
      Height = 13
      Caption = 'F.Notif:'
    end
    object Label41: TLabel
      Left = 10
      Top = 95
      Width = 48
      Height = 26
      Caption = '   Prev '#13#10'Exclusivo:'
    end
    object Label16: TLabel
      Left = 162
      Top = 156
      Width = 46
      Height = 13
      Hint = 'Preventor Notif Programa'
      Caption = 'Sub Tipo:'
    end
    object Button1: TButton
      Left = 524
      Top = 237
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 8
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 602
      Top = 237
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 9
    end
    inline fraPreventorRef: TfraCodigoDescripcion
      Left = 61
      Top = 70
      Width = 613
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 61
      ExplicitTop = 70
      ExplicitWidth = 613
      DesignSize = (
        613
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 548
        CharCase = ecUpperCase
        OnDropDown = fraPreventorRefcmbDescripcionDropDown
        ExplicitWidth = 548
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    inline fraTipoEmpresaModif: TfraCodigoDescripcion
      Left = 61
      Top = 44
      Width = 345
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 61
      ExplicitTop = 44
      ExplicitWidth = 345
      DesignSize = (
        345
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 280
        ExplicitWidth = 280
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
    object edTipoEmpresaSrtModif: TEdit
      Left = 450
      Top = 45
      Width = 223
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    inline fraEmpresaModif: TfraEmpresa
      Left = 62
      Top = 19
      Width = 498
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 62
      ExplicitTop = 19
      ExplicitWidth = 498
      ExplicitHeight = 21
      DesignSize = (
        498
        21)
      inherited lbContrato: TLabel
        Left = 396
        ExplicitLeft = 396
      end
      inherited edContrato: TIntEdit
        Left = 441
        ExplicitLeft = 441
      end
      inherited cmbRSocial: TArtComboBox
        Width = 259
        ExplicitWidth = 259
      end
    end
    inline fraPreventorNotif: TfraCodigoDescripcion
      Left = 61
      Top = 124
      Width = 436
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 61
      ExplicitTop = 124
      ExplicitWidth = 436
      DesignSize = (
        436
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 371
        CharCase = ecUpperCase
        ExplicitWidth = 371
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edFNotif: TDateComboBox
      Left = 62
      Top = 153
      Width = 93
      Height = 21
      TabOrder = 5
    end
    inline fraPreventorExclusivo: TfraCodigoDescripcion
      Left = 61
      Top = 97
      Width = 436
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 61
      ExplicitTop = 97
      ExplicitWidth = 436
      DesignSize = (
        436
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 371
        CharCase = ecUpperCase
        ExplicitWidth = 371
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    inline fraEstablecimientoModif: TfraEstablecimientoDomic
      Left = 10
      Top = 178
      Width = 663
      Height = 54
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 10
      ExplicitTop = 178
      ExplicitWidth = 663
      ExplicitHeight = 54
      DesignSize = (
        663
        54)
      inherited lbLocalidad: TLabel
        Left = 441
        Width = 46
        ExplicitLeft = 441
        ExplicitWidth = 46
      end
      inherited lbEstableci: TLabel
        Left = 3
        Width = 30
        ExplicitLeft = 3
        ExplicitWidth = 30
      end
      inherited lbCPostal: TLabel
        Left = 592
        Width = 20
        ExplicitLeft = 592
        ExplicitWidth = 20
      end
      inherited lbDomicilio: TLabel
        Left = 3
        Width = 42
        ExplicitLeft = 3
        ExplicitWidth = 42
      end
      inherited lbProvincia: TLabel
        Left = 441
        Width = 44
        ExplicitLeft = 441
        ExplicitWidth = 44
      end
      inherited edCodigo: TIntEdit
        Left = 52
        Width = 44
        ExplicitLeft = 52
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 99
        Width = 334
        ExplicitLeft = 99
        ExplicitWidth = 334
      end
      inherited edLocalidad: TEdit
        Left = 492
        Width = 91
        ExplicitLeft = 492
        ExplicitWidth = 91
      end
      inherited edCPostal: TEdit
        Left = 616
        ExplicitLeft = 616
      end
      inherited edDomicilio: TEdit
        Left = 52
        Width = 381
        ExplicitLeft = 52
        ExplicitWidth = 381
      end
      inherited edProvincia: TEdit
        Left = 492
        Width = 169
        ExplicitLeft = 492
        ExplicitWidth = 169
      end
      inherited sdqDatos: TSDQuery
        Left = 450
        Top = 18
      end
      inherited dsDatos: TDataSource
        Left = 485
        Top = 16
      end
    end
    inline fraSubTipo: TfraCodigoDescripcion
      Left = 213
      Top = 152
      Width = 460
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      ExplicitLeft = 213
      ExplicitTop = 152
      ExplicitWidth = 460
      DesignSize = (
        460
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 395
        ExplicitWidth = 395
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
    object cbReferenteExclusivo: TCheckBox
      Left = 499
      Top = 100
      Width = 173
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Prev. Referente = Prev. Exlusivo'
      TabOrder = 11
      OnClick = cbReferenteExclusivoClick
    end
    object cbReferenteNotif: TCheckBox
      Left = 495
      Top = 126
      Width = 176
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Prev. Referente = Notif.Programa'
      TabOrder = 12
      OnClick = cbReferenteNotifClick
    end
  end
  object fpPreventoresSel: TFormPanel [10]
    Left = 46
    Top = 296
    Width = 351
    Height = 270
    Caption = 'Preventores seleccionados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      351
      270)
    object Bevel6: TBevel
      Left = 4
      Top = 234
      Width = 343
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnPreventoresClose: TButton
      Left = 268
      Top = 241
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
    object lstPrev: TListBox
      Left = 8
      Top = 9
      Width = 336
      Height = 218
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object fpCambiarPreventor: TFormPanel [11]
    Left = 20
    Top = 586
    Width = 637
    Height = 129
    Caption = 'Cambio de Preventor'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      637
      129)
    object Bevel1: TBevel
      Left = 4
      Top = 93
      Width = 630
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 14
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Preventor Nuevo'
    end
    object Label13: TLabel
      Left = 14
      Top = 61
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Label26: TLabel
      Left = 14
      Top = 39
      Width = 87
      Height = 13
      Caption = 'Motivo Asignaci'#243'n'
    end
    object Label27: TLabel
      Left = 438
      Top = 39
      Width = 96
      Height = 13
      Caption = 'Vigencia Asignaci'#243'n'
    end
    object btnAceptarCambioPreventor: TButton
      Left = 480
      Top = 99
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btnAceptarCambioPreventorClick
    end
    object btnCancelarCambioPreventor: TButton
      Left = 558
      Top = 99
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    inline fraPreventorNuevo: TfraCodigoDescripcion
      Left = 112
      Top = 10
      Width = 324
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 112
      ExplicitTop = 10
      ExplicitWidth = 324
      DesignSize = (
        324
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 249
        CharCase = ecUpperCase
        OnDropDown = fraPreventorNuevocmbDescripcionDropDown
        ExplicitWidth = 249
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edMotivoCambio: TRichEdit
      Left = 113
      Top = 59
      Width = 513
      Height = 31
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cbReferenteCambio: TCheckBox
      Left = 440
      Top = 13
      Width = 92
      Height = 17
      Caption = 'Referente Emp.'
      TabOrder = 1
    end
    inline fraMotivoAsignacion: TfraCodigoDescripcion
      Left = 112
      Top = 34
      Width = 311
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 112
      ExplicitTop = 34
      ExplicitWidth = 311
      DesignSize = (
        311
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 249
        CharCase = ecUpperCase
        ExplicitWidth = 249
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edVigenciaAsig: TDateComboBox
      Left = 540
      Top = 35
      Width = 86
      Height = 21
      TabOrder = 3
    end
    object cbExclusivoCambio: TCheckBox
      Left = 536
      Top = 13
      Width = 92
      Height = 17
      Caption = 'Prev Exclusivo'
      TabOrder = 7
    end
  end
  object pnlColorRef: TPanel [12]
    Left = 0
    Top = 198
    Width = 793
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 12
    object Label40: TLabel
      Left = 24
      Top = 4
      Width = 96
      Height = 13
      AutoSize = False
      Caption = 'Con Resoluci'#243'n 319'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label39: TLabel
      Left = 143
      Top = 4
      Width = 94
      Height = 13
      Caption = 'Preventor Exclusivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 11
      Top = 5
      Width = 12
      Height = 12
      Color = 16772801
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 128
      Top = 5
      Width = 12
      Height = 12
      Color = clMoneyGreen
      TabOrder = 1
    end
  end
  object fpCambioTipoPrevencion: TFormPanel [13]
    Left = 39
    Top = 225
    Width = 443
    Height = 75
    Hint = 'Cambio Tipo Prevenci'#243'n'
    Caption = 'Motivo Cambio'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      443
      75)
    object Bevel7: TBevel
      Left = 4
      Top = 39
      Width = 435
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label48: TLabel
      Left = 14
      Top = 15
      Width = 49
      Height = 13
      Caption = 'Tipo Prev:'
    end
    object btnAceptarCambioTipoPrev: TButton
      Left = 281
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancelarCambioTipoPrev: TButton
      Left = 361
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraTipoEmpresaCambioTipoPrev: TfraCodigoDescripcion
      Left = 72
      Top = 9
      Width = 363
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 72
      ExplicitTop = 9
      ExplicitWidth = 363
      DesignSize = (
        363
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 298
        ExplicitWidth = 298
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
  end
  object fpMotivoReasignacion: TFormPanel [14]
    Left = 16
    Top = 444
    Width = 377
    Height = 133
    Caption = 'Reasignaci'#243'n Tareas'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      377
      133)
    object Bevel8: TBevel
      Left = 4
      Top = 97
      Width = 369
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label49: TLabel
      Left = 12
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label50: TLabel
      Left = 12
      Top = 39
      Width = 60
      Height = 13
      Caption = 'Observacion'
    end
    object Button4: TButton
      Left = 219
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = Button4Click
    end
    object btnCancelarMotivo: TButton
      Left = 297
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivoReasignacion: TfraCodigoDescripcion
      Left = 53
      Top = 10
      Width = 311
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 53
      ExplicitTop = 10
      ExplicitWidth = 311
      DesignSize = (
        311
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 246
        CharCase = ecUpperCase
        ExplicitWidth = 246
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edObservacionReasignacion: TRichEdit
      Left = 78
      Top = 38
      Width = 282
      Height = 53
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4000
      ParentFont = False
      TabOrder = 3
    end
  end
  object fpFrecuenciaVisita: TFormPanel [15]
    Left = 878
    Top = 481
    Width = 223
    Height = 77
    Caption = 'Cambio Frecuencia de Visita'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      223
      77)
    object Bevel9: TBevel
      Left = 4
      Top = 41
      Width = 215
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label53: TLabel
      Left = 9
      Top = 14
      Width = 81
      Height = 13
      Caption = 'Frecuencia Visita'
    end
    object Label54: TLabel
      Left = 147
      Top = 14
      Width = 60
      Height = 13
      Caption = 'en 12 meses'
    end
    object btnAceptarCambioFrecuencia: TButton
      Left = 61
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancelarCambioFrecuencia: TButton
      Left = 140
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edCantVisitasMulti: TIntEdit
      Left = 94
      Top = 11
      Width = 50
      Height = 21
      TabOrder = 2
      AutoExit = True
      MaxLength = 4
    end
  end
  inherited fpAbm: TFormPanel
    Left = 193
    Top = 175
    Width = 581
    Height = 352
    OnShow = fpAbmShow
    Constraints.MinHeight = 225
    Constraints.MinWidth = 570
    ExplicitLeft = 193
    ExplicitTop = 175
    ExplicitWidth = 581
    ExplicitHeight = 352
    DesignSize = (
      581
      352)
    inherited BevelAbm: TBevel
      Top = 316
      Width = 573
      ExplicitTop = 277
      ExplicitWidth = 573
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 164
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 114
      Width = 49
      Height = 13
      Caption = 'Tipo Prev.'
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 139
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label7: TLabel [4]
      Left = 485
      Top = 140
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'CIUU'
    end
    object btnInfoEstableci: TSpeedButton [5]
      Left = 530
      Top = 87
      Width = 23
      Height = 22
      Hint = 'Tel'#233'fonos'
      Anchors = [akTop, akRight]
      Caption = '('
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Wingdings'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnInfoEstableciClick
    end
    object Label20: TLabel [6]
      Left = 10
      Top = 24
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object lbTipoSrt: TLabel [7]
      Left = 445
      Top = 116
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo Srt'
    end
    object Label28: TLabel [8]
      Left = 6
      Top = 256
      Width = 52
      Height = 26
      Caption = 'Motivo Asignaci'#243'n'
      WordWrap = True
    end
    object Label29: TLabel [9]
      Left = 376
      Top = 261
      Width = 96
      Height = 13
      Caption = 'Vigencia Asignaci'#243'n'
    end
    object Label30: TLabel [10]
      Left = 6
      Top = 286
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Label52: TLabel [11]
      Left = 310
      Top = 190
      Width = 60
      Height = 13
      Caption = 'en 12 meses'
    end
    object Label51: TLabel [12]
      Left = 173
      Top = 190
      Width = 81
      Height = 13
      Caption = 'Frecuencia Visita'
    end
    object Label55: TLabel [13]
      Left = 5
      Top = 204
      Width = 49
      Height = 26
      Caption = 'Preventor '#13#10'Provisorio'
    end
    object Label56: TLabel [14]
      Left = 75
      Top = 237
      Width = 67
      Height = 13
      Caption = 'Fecha Desde '
    end
    object Label57: TLabel [15]
      Left = 238
      Top = 237
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label58: TLabel [16]
      Left = 5
      Top = 231
      Width = 66
      Height = 26
      Caption = 'Vigencia Prev'#13#10'   Provisorio'
    end
    inherited btnAceptar: TButton
      Left = 423
      Top = 322
      TabOrder = 6
      ExplicitLeft = 423
      ExplicitTop = 322
    end
    inherited btnCancelar: TButton
      Left = 501
      Top = 322
      TabOrder = 7
      ExplicitLeft = 501
      ExplicitTop = 322
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 67
      Top = 160
      Width = 378
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 67
      ExplicitTop = 160
      ExplicitWidth = 378
      DesignSize = (
        378
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 314
        CharCase = ecUpperCase
        OnDropDown = fraPreventorcmbDescripcionDropDown
        ExplicitWidth = 314
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    inline fraEstablecimiento: TfraEstablecimientoDomic
      Left = 4
      Top = 64
      Width = 567
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 4
      ExplicitTop = 64
      ExplicitWidth = 567
      DesignSize = (
        567
        47)
      inherited lbLocalidad: TLabel
        Left = 357
        Width = 46
        ExplicitLeft = 357
        ExplicitWidth = 46
      end
      inherited lbEstableci: TLabel
        Left = 3
        Width = 30
        ExplicitLeft = 3
        ExplicitWidth = 30
      end
      inherited lbCPostal: TLabel
        Left = 473
        Width = 20
        ExplicitLeft = 473
        ExplicitWidth = 20
      end
      inherited lbDomicilio: TLabel
        Left = 3
        Width = 42
        ExplicitLeft = 3
        ExplicitWidth = 42
      end
      inherited lbProvincia: TLabel
        Left = 359
        Width = 44
        ExplicitLeft = 359
        ExplicitWidth = 44
      end
      inherited edCodigo: TIntEdit
        Left = 64
        Width = 44
        ExplicitLeft = 64
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 111
        Width = 245
        ExplicitLeft = 111
        ExplicitWidth = 245
      end
      inherited edLocalidad: TEdit
        Left = 406
        Width = 66
        ExplicitLeft = 406
        ExplicitWidth = 66
      end
      inherited edCPostal: TEdit
        Left = 495
        ExplicitLeft = 495
      end
      inherited edDomicilio: TEdit
        Left = 64
        Width = 291
        ExplicitLeft = 64
        ExplicitWidth = 291
      end
      inherited edProvincia: TEdit
        Left = 406
        Width = 159
        ExplicitLeft = 406
        ExplicitWidth = 159
      end
      inherited sdqDatos: TSDQuery
        Left = 459
      end
      inherited dsDatos: TDataSource
        Left = 488
        Top = 28
      end
    end
    inline fraEmpresaEstab: TfraEmpresa
      Left = 57
      Top = 19
      Width = 518
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
      ExplicitLeft = 57
      ExplicitTop = 19
      ExplicitWidth = 518
      ExplicitHeight = 21
      DesignSize = (
        518
        21)
      inherited lbRSocial: TLabel
        Left = 97
        ExplicitLeft = 97
      end
      inherited lbContrato: TLabel
        Left = 410
        ExplicitLeft = 410
      end
      inherited mskCUIT: TMaskEdit
        Left = 10
        ExplicitLeft = 10
      end
      inherited edContrato: TIntEdit
        Left = 454
        ExplicitLeft = 454
      end
      inherited cmbRSocial: TArtComboBox
        Left = 144
        Width = 257
        ExplicitLeft = 144
        ExplicitWidth = 257
      end
    end
    inline fraTipoEmpresa: TfraCodigoDescripcion
      Left = 67
      Top = 112
      Width = 292
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 67
      ExplicitTop = 112
      ExplicitWidth = 292
      DesignSize = (
        292
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 228
        ExplicitWidth = 228
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
    object cmbActividad: TExComboBox
      Left = 68
      Top = 137
      Width = 403
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Items.Strings = (
        'A=Agro'
        'I=Industria'
        'C=Construcci'#243'n')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cbTodosEstab: TCheckBox
      Left = 6
      Top = 43
      Width = 161
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Todos los Establecimientos'
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = cbTodosEstabClick
    end
    object edCiuu: TIntEdit
      Left = 518
      Top = 137
      Width = 51
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      MaxLength = 8
    end
    object tbCambios: TToolBar
      Left = 545
      Top = 62
      Width = 24
      Height = 23
      Align = alNone
      Anchors = [akTop, akRight]
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 9
      object tbHistorico: TToolButton
        Left = 0
        Top = 0
        Caption = 'Ver Cambios'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = tbHistoricoClick
      end
    end
    object cbReferente: TCheckBox
      Left = 479
      Top = 163
      Width = 92
      Height = 17
      Anchors = [akTop]
      Caption = 'Referente Emp.'
      TabOrder = 10
    end
    object edTipoSrt: TEdit
      Left = 484
      Top = 113
      Width = 85
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object cbVerPreventorSugeridoABM: TCheckBox
      Left = 6
      Top = 187
      Width = 125
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Preventores Sugeridos'
      TabOrder = 12
      OnClick = cbVerPreventorSugeridoABMClick
    end
    inline fraMotivoAsignacionModif: TfraCodigoDescripcion
      Left = 67
      Top = 257
      Width = 308
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      ExplicitLeft = 67
      ExplicitTop = 257
      ExplicitWidth = 308
      DesignSize = (
        308
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 243
        CharCase = ecUpperCase
        ExplicitWidth = 243
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edVigenciaAsigModif: TDateComboBox
      Left = 480
      Top = 257
      Width = 88
      Height = 21
      TabOrder = 15
    end
    object edObservacionModif: TRichEdit
      Left = 68
      Top = 283
      Width = 500
      Height = 31
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object ToolBar3: TToolBar
      Left = 137
      Top = 183
      Width = 29
      Height = 26
      Align = alNone
      BorderWidth = 1
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      object tbPreventorPerfil: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccion de preventor mediante el perfil'
        Caption = 'tbDiagRefrescar'
        ImageIndex = 26
        OnClick = tbPreventorPerfilClick
      end
    end
    object cbPreventorExclusivo: TCheckBox
      Left = 479
      Top = 186
      Width = 95
      Height = 17
      Caption = 'Prev. Exclusivo'
      TabOrder = 18
      OnClick = cbVerPreventorSugeridoABMClick
    end
    object chkMarcarPram: TCheckBox
      Left = 362
      Top = 115
      Width = 74
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop]
      Caption = 'PRAM (ET)'
      TabOrder = 19
    end
    object edCantVisitas: TIntEdit
      Left = 257
      Top = 187
      Width = 50
      Height = 21
      TabOrder = 13
      AutoExit = True
      MaxLength = 4
    end
    object ToolBar1: TToolBar
      Left = 448
      Top = 160
      Width = 25
      Height = 23
      Align = alNone
      Anchors = [akTop, akRight]
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 20
      object tbEstimacionVisitasAnualPrev: TToolButton
        Left = 0
        Top = 0
        Hint = 'Estimaci'#243'n de Visitas Anual'
        Caption = 'tbEstimacionVisitasAnual'
        ImageIndex = 44
        ParentShowHint = False
        ShowHint = True
        OnClick = tbEstimacionVisitasAnualPrevClick
      end
    end
    inline fraPreventorProvisorio: TfraCodigoDescripcion
      Left = 67
      Top = 206
      Width = 378
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 21
      ExplicitLeft = 67
      ExplicitTop = 206
      ExplicitWidth = 378
      DesignSize = (
        378
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 313
        CharCase = ecUpperCase
        ExplicitWidth = 313
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
        ExplicitWidth = 59
      end
    end
    object edFDesdeVigenciaPrevProvisorio: TDateComboBox
      Left = 145
      Top = 234
      Width = 88
      Height = 21
      TabOrder = 22
    end
    object edFHastaVigenciaPrevProvisorio: TDateComboBox
      Left = 308
      Top = 234
      Width = 88
      Height = 21
      TabOrder = 23
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT /*+ first_rows */'
      
        '       ep_id, ep_cuit, ep_idempresa, aem.em_nombre, ep_estableci' +
        ', aes.es_nombre, ep_tipo tiposrt,'
      
        '       tipoestab.te_codigo tipoprevencion, tipoestab.te_cargaman' +
        'ual, tipoemp.te_codigo tipoprevempresa,'
      
        '       art.hys.get_preventor_referente(hco.co_cuit) idreferente,' +
        ' ep_actividad, ep_idfirmante, ep_itcodigo, pit.it_nombre,'
      
        '       NVL(es_eventual, '#39'N'#39') es_eventual, art.hys.get_nombre_pre' +
        'ventor_coord(pit.it_codigo) it_coordinador,'
      
        '       NVL(co_totempleadosactual, co_totempleados) AS rc_emplead' +
        'os, dc_telefonos,'
      
        '       art.afi.armar_domicilio(es_calle, es_numero, es_piso, es_' +
        'departamento, es_localidad)'
      
        '       || NVL2(es_telefonos, '#39' Tel.'#39' ||(NVL(es_codareatelefonos,' +
        ' '#39#39') || es_telefonos), '#39#39') AS domicilio,'
      
        '       es_localidad, es_cpostal, cac.ac_relacion, es_cpostala, c' +
        'o_contrato, ge_descripcion, ca_id, ca_descripcion,'
      
        '       ac_idcategoriariesgo, art.getdescripcionprovincia(es_prov' +
        'incia) AS prov, es_provincia, ep_motivoasignacion,'
      
        '       ep_fechavencimientoasig, ep_observacion, hma.ma_descripci' +
        'on, ep_fechabaja, ep_usubaja, es_fechabaja, ep_anexo1,'
      
        '       ep_anexo2, ep_anexo1ficticio, ep_tienedenunciagral, ep_ti' +
        'enedenuncia, ep_tieneprs, ep_tienepal, ep_fechaultvisita,'
      
        '       ep_fechaultrelev, ep_fechaultcap, pit2.it_nombre prevultv' +
        'isita, ee_descripcion, co_estab_evento, ep_fechainicioobra,'
      
        '       ep_fechaextensionobra, ep_fechafinobra, ep_cantvisitas, e' +
        'p_cantcapacit, ep_cantrelev, pit.it_id, ep_nroresolucion,'
      '       (SELECT pe_preventorid'
      '          FROM hys.hpe_preventorexclusivo'
      '         WHERE pe_idempresa = em_id'
      
        '           AND pe_fechabaja IS NULL) pe_preventorid, ep_cancerig' +
        'enos, ep_difenilos, ep_accmayores, zc_descripcion, ep_pramet,'
      
        '       ep_tiporelev, DECODE(art.afiliacion.is_empresavip(co_cont' +
        'rato), '#39'S'#39', '#39'VIP'#39', '#39'N'#39', NULL) empresavip,'
      
        '       hys.get_frecuenciapersonalizada(ep_idempresa, ep_establec' +
        'i) frecuenciavisitapers, ac_codigo ac_codigoactual, art.hys.get_' +
        'validorelev463(co_contrato,ep_estableci) valido463,'
      
        '       ep_idpreventorprovisorio, ep_fdesdeprevprovisorio, ep_fha' +
        'staprevprovisorio , pit3.it_nombre preventorprovisorio'
      
        '  FROM afi.adc_domiciliocontrato ahdl, hys.hep_estabporpreventor' +
        ' hep, afi.aem_empresa aem, afi.aco_contrato aco,'
      
        '       afi.aes_establecimiento aes, comunes.cac_actividad cac, a' +
        'fi.age_grupoeconomico age, hys.hte_tipoempresaprev tipoestab,'
      
        '       hys.hte_tipoempresaprev tipoemp, art.ccp_codigopostal, hy' +
        's.hzc_zonacodigopostal, hys.hco_cuitoperativo hco,'
      
        '       hys.hee_estadoestab, hys.hca_categoriariesgo hca, art.pit' +
        '_firmantes pit, art.pit_firmantes pit2, art.pit_firmantes pit3,'
      '       hys.hma_motivoasigprev hma'
      ' WHERE co_contrato = art.get_vultcontrato(em_cuit)'
      '   AND ahdl.dc_contrato(+) = aco.co_contrato'
      '   AND ahdl.dc_tipo(+) = '#39'L'#39
      '   AND cac.ac_idcategoriariesgo = hca.ca_id(+)'
      '   AND aem.em_idgrupoeconomico = ge_id(+)'
      '   AND hep.ep_idempresa = aem.em_id'
      '   AND aem.em_id = aco.co_idempresa'
      '   AND aes.es_nroestableci = hep.ep_estableci'
      '   AND aco.co_contrato = aes.es_contrato'
      '   AND cac.ac_id = aes.es_idactividad'
      '   AND co_idtipoempresaprev = tipoestab.te_id(+)'
      '   AND co_idtipoempresaprev = tipoemp.te_id(+)'
      '   AND hco.co_id(+) = ep_idcooperativo'
      '   AND hep.ep_idestado = ee_id'
      '   AND es_cpostal = cp_codigo(+)'
      '   AND es_provincia = cp_provincia(+)'
      '   AND es_localidad = cp_localidad(+)'
      '   AND cp_zonaucap = zc_id(+)'
      '   AND hep.ep_idfirmante = pit.it_id(+)'
      '   AND hma.ma_id(+) = hep.ep_motivoasignacion'
      '   AND pit2.it_id(+) = hep.ep_preventorultvisita'
      '   and pit3.it_id(+) = hep.ep_idpreventorprovisorio')
    Left = 16
    Top = 332
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      OnGetText = sdqConsultaSELECTEDGetText
      Size = 1
      Calculated = True
    end
    object sdqConsultaEP_ID: TFloatField
      FieldName = 'EP_ID'
    end
    object sdqConsultaEP_CUIT: TStringField
      FieldName = 'EP_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaEP_IDEMPRESA: TFloatField
      FieldName = 'EP_IDEMPRESA'
      Required = True
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaEP_ESTABLECI: TFloatField
      FieldName = 'EP_ESTABLECI'
      Required = True
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaTIPOSRT: TStringField
      FieldName = 'TIPOSRT'
      Required = True
      Size = 2
    end
    object sdqConsultaTIPOPREVENCION: TStringField
      FieldName = 'TIPOPREVENCION'
      Required = True
      Size = 10
    end
    object sdqConsultaEP_ACTIVIDAD: TStringField
      FieldName = 'EP_ACTIVIDAD'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_IDFIRMANTE: TFloatField
      FieldName = 'EP_IDFIRMANTE'
    end
    object sdqConsultaEP_ITCODIGO: TStringField
      FieldName = 'EP_ITCODIGO'
      Size = 12
    end
    object sdqConsultaIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Size = 255
    end
    object sdqConsultaES_EVENTUAL: TStringField
      FieldName = 'ES_EVENTUAL'
      Size = 1
    end
    object sdqConsultaIT_COORDINADOR: TStringField
      FieldName = 'IT_COORDINADOR'
      Size = 4000
    end
    object sdqConsultaRC_EMPLEADOS: TFloatField
      FieldName = 'RC_EMPLEADOS'
    end
    object sdqConsultaDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqConsultaES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaES_CPOSTAL: TStringField
      FieldName = 'ES_CPOSTAL'
      Size = 5
    end
    object sdqConsultaAC_RELACION: TStringField
      FieldName = 'AC_RELACION'
      Size = 6
    end
    object sdqConsultaES_CPOSTALA: TStringField
      FieldName = 'ES_CPOSTALA'
      Size = 8
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaPROV: TStringField
      FieldName = 'PROV'
      Size = 4000
    end
    object sdqConsultaEP_FECHABAJA: TDateTimeField
      FieldName = 'EP_FECHABAJA'
    end
    object sdqConsultaEP_USUBAJA: TStringField
      FieldName = 'EP_USUBAJA'
    end
    object sdqConsultaES_FECHABAJA: TDateTimeField
      FieldName = 'ES_FECHABAJA'
    end
    object sdqConsultaEP_ANEXO1: TStringField
      FieldName = 'EP_ANEXO1'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_ANEXO2: TStringField
      FieldName = 'EP_ANEXO2'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_ANEXO1FICTICIO: TStringField
      FieldName = 'EP_ANEXO1FICTICIO'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_TIENEDENUNCIAGRAL: TStringField
      FieldName = 'EP_TIENEDENUNCIAGRAL'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_TIENEDENUNCIA: TStringField
      FieldName = 'EP_TIENEDENUNCIA'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_TIENEPRS: TStringField
      FieldName = 'EP_TIENEPRS'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_FECHAULTVISITA: TDateTimeField
      FieldName = 'EP_FECHAULTVISITA'
    end
    object sdqConsultaEP_FECHAULTRELEV: TDateTimeField
      FieldName = 'EP_FECHAULTRELEV'
    end
    object sdqConsultaEP_FECHAULTCAP: TDateTimeField
      FieldName = 'EP_FECHAULTCAP'
    end
    object sdqConsultaPREVULTVISITA: TStringField
      FieldName = 'PREVULTVISITA'
      Size = 255
    end
    object sdqConsultaPREVSUGERIDO: TStringField
      FieldName = 'PREVSUGERIDO'
      Size = 255
    end
    object sdqConsultaIDPREVSUGERIDO: TFloatField
      FieldName = 'IDPREVSUGERIDO'
    end
    object sdqConsultaEE_DESCRIPCION: TStringField
      FieldName = 'EE_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaEP_FECHAINICIOOBRA: TDateTimeField
      FieldName = 'EP_FECHAINICIOOBRA'
    end
    object sdqConsultaEP_FECHAEXTENSIONOBRA: TDateTimeField
      FieldName = 'EP_FECHAEXTENSIONOBRA'
    end
    object sdqConsultaEP_FECHAFINOBRA: TDateTimeField
      FieldName = 'EP_FECHAFINOBRA'
    end
    object sdqConsultaES_PROVINCIA: TStringField
      FieldName = 'ES_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqConsultaEP_CANTVISITAS: TFloatField
      FieldName = 'EP_CANTVISITAS'
    end
    object sdqConsultaEP_CANTCAPACIT: TFloatField
      FieldName = 'EP_CANTCAPACIT'
    end
    object sdqConsultaEP_CANTRELEV: TFloatField
      FieldName = 'EP_CANTRELEV'
    end
    object sdqConsultaEP_MOTIVOASIGNACION: TFloatField
      FieldName = 'EP_MOTIVOASIGNACION'
    end
    object sdqConsultaEP_FECHAVENCIMIENTOASIG: TDateTimeField
      FieldName = 'EP_FECHAVENCIMIENTOASIG'
    end
    object sdqConsultaEP_OBSERVACION: TStringField
      FieldName = 'EP_OBSERVACION'
      Size = 255
    end
    object sdqConsultaMA_DESCRIPCION: TStringField
      FieldName = 'MA_DESCRIPCION'
      Size = 100
    end
    object sdqConsultaDC_TELEFONOS: TStringField
      FieldName = 'DC_TELEFONOS'
      Size = 60
    end
    object sdqConsultaGE_DESCRIPCION: TStringField
      FieldName = 'GE_DESCRIPCION'
      Size = 100
    end
    object sdqConsultaPE_PREVENTORID: TFloatField
      FieldName = 'PE_PREVENTORID'
    end
    object sdqConsultaIT_ID: TFloatField
      FieldName = 'IT_ID'
    end
    object sdqConsultaIDREFERENTE: TStringField
      FieldName = 'IDREFERENTE'
      Size = 4000
    end
    object sdqConsultaEP_NRORESOLUCION: TFloatField
      FieldName = 'EP_NRORESOLUCION'
    end
    object sdqConsultaAC_IDCATEGORIARIESGO: TFloatField
      FieldName = 'AC_IDCATEGORIARIESGO'
    end
    object sdqConsultaCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaCA_ID: TFloatField
      FieldName = 'CA_ID'
    end
    object sdqConsultaEP_CANCERIGENOS: TStringField
      FieldName = 'EP_CANCERIGENOS'
      Size = 1
    end
    object sdqConsultaEP_DIFENILOS: TStringField
      FieldName = 'EP_DIFENILOS'
      Size = 1
    end
    object sdqConsultaEP_ACCMAYORES: TStringField
      FieldName = 'EP_ACCMAYORES'
      Size = 1
    end
    object sdqConsultaEP_TIENEPAL: TStringField
      FieldName = 'EP_TIENEPAL'
      Required = True
      Size = 1
    end
    object sdqConsultaCO_ESTAB_EVENTO: TFloatField
      FieldName = 'CO_ESTAB_EVENTO'
    end
    object sdqConsultaZC_DESCRIPCION: TStringField
      FieldName = 'ZC_DESCRIPCION'
      Size = 200
    end
    object sdqConsultaCO_VIGENCIAHASTA: TDateTimeField
      FieldName = 'CO_VIGENCIAHASTA'
    end
    object sdqConsultaCP_DEPARTAMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DEPARTAMENTO'
      Size = 60
    end
    object sdqConsultaTE_CARGAMANUAL: TStringField
      FieldName = 'TE_CARGAMANUAL'
      Size = 1
    end
    object sdqConsultaep_pramet: TStringField
      FieldName = 'ep_pramet'
      Size = 1
    end
    object sdqConsultaEP_TIPORELEV: TStringField
      FieldName = 'EP_TIPORELEV'
      Size = 1
    end
    object sdqConsultaEMPRESAVIP: TStringField
      FieldName = 'EMPRESAVIP'
      Size = 3
    end
    object sdqConsultaFRECUENCIAVISITAPERS: TFloatField
      FieldName = 'FRECUENCIAVISITAPERS'
    end
    object sdqConsultasector: TStringField
      DisplayWidth = 255
      FieldName = 'sector'
    end
    object sdqConsultaAC_CODIGOACTUAL: TStringField
      FieldName = 'AC_CODIGOACTUAL'
      Required = True
      Size = 6
    end
    object sdqConsultaTIPOPREVEMPRESA: TStringField
      FieldName = 'TIPOPREVEMPRESA'
      Size = 10
    end
    object sdqConsultaVALIDO463: TStringField
      FieldName = 'VALIDO463'
      Size = 4000
    end
    object sdqConsultaEP_IDPREVENTORPROVISORIO: TFloatField
      FieldName = 'EP_IDPREVENTORPROVISORIO'
    end
    object sdqConsultaEP_FDESDEPREVPROVISORIO: TDateTimeField
      FieldName = 'EP_FDESDEPREVPROVISORIO'
    end
    object sdqConsultaEP_FHASTAPREVPROVISORIO: TDateTimeField
      FieldName = 'EP_FHASTAPREVPROVISORIO'
    end
    object sdqConsultaPREVENTORPROVISORIO: TStringField
      FieldName = 'PREVENTORPROVISORIO'
      Size = 255
    end
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 332
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 360
  end
  inherited ExportDialog: TExportDialog
    Title = 'Gesti'#243'n de Empresas (Establecimientos)'
    Left = 44
    Top = 360
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Gesti'#243'n de Empresas (Establecimientos)'
    PageOrientation = pxLandscape
    Left = 44
    Top = 388
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 304
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 304
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 388
  end
  inherited FieldHider: TFieldHider [25]
    Left = 72
    Top = 332
  end
  inherited ShortCutControl: TShortCutControl [26]
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
      end
      item
        Key = 16500
        LinkControl = tbRefrescarEmpresa
      end>
    Left = 72
    Top = 304
  end
  object sdqConSupervisor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT it_id'
      '  FROM art.pit_firmantes'
      ' WHERE it_id <> :idconsulta AND NOT (it_idsupervisor IS NULL)'
      '')
    Left = 118
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idconsulta'
        ParamType = ptInput
      end>
  end
  object dsDatosEmpresa: TDataSource
    DataSet = sdqDatosEmpresa
    Left = 36
    Top = 460
  end
  object sdqDatosEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqDatosEmpresaAfterScroll
    SQL.Strings = (
      'SELECT   /*+ RULE */'
      '         co_cuit, em_nombre, co_operativo, co_tipo tipostr,'
      '         te_codigo tipoprevencion, st_descripcion subtipo,'
      
        '         art.hys.get_nombre_preventor_ref (co_cuit) referente, c' +
        'o_idempresa,'
      
        '         te_id, art.hys.get_preventor_referente (co_cuit) idrefe' +
        'rente, co_id,'
      
        '         co_idpreventornotif, co_fechanotificacion, co_fechabaja' +
        ','
      
        '         (NVL (dc_codareatelefonos, '#39#39') || dc_telefonos) telefon' +
        'oemp,'
      '         pit.it_nombre, pit.it_codigo, pit.it_id,co_idsubtipo,'
      
        '         hys.get_ultimaincidenciaempresa (em_id) incid, co_riged' +
        'esde,'
      
        '         co_rigehasta, tb_descripcion sector, ge_descripcion, pe' +
        '_preventorid,'
      '         (SELECT cp_fecha'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa) cp_fecha,'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          0'
      '                                         )'
      '                             )) AS "Incidencia Actual",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -1'
      '                                         )'
      '                             )) AS "Incidencia 1 mes atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -2'
      '                                         )'
      '                             )) AS "Incidencia 2 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -3'
      '                                         )'
      '                             )) AS "Incidencia 3 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -4'
      '                                         )'
      '                             )) AS "Incidencia 4 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -5'
      '                                         )'
      '                             )) AS "Incidencia 5 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -6'
      '                                         )'
      '                             )) AS "Incidencia 6 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -7'
      '                                         )'
      '                             )) AS "Incidencia 7 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -8'
      '                                         )'
      '                             )) AS "Incidencia 8 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -9'
      '                                         )'
      '                             )) AS "Incidencia 9 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -10'
      '                                         )'
      '                             )) AS "Incidencia 10 meses atras",'
      '         (SELECT cp_incidencia'
      '            FROM hys.hcp_carteraprevencion'
      '           WHERE cp_idempresa = co_idempresa'
      '             AND cp_fecha ='
      '                    LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha)'
      
        '                                             FROM hys.hcp_carter' +
        'aprevencion'
      
        '                                            WHERE cp_idempresa =' +
        ' co_idempresa),'
      '                                          -11'
      '                                         )'
      '                             )) AS "Incidencia 11 meses atras",'
      '         pex.it_nombre prevex,'
      '         co_estab_evento'
      '    FROM afi.age_grupoeconomico age,'
      '         art.ctb_tablas tbsector,'
      '         hys.hst_subtipo,'
      '         hys.hte_tipoempresaprev,'
      '         hys.hco_cuitoperativo,'
      '         hys.hpe_preventorexclusivo,'
      '         art.pit_firmantes pex,'
      '         afi.adc_domiciliocontrato ahdl,'
      '         prt_riestrab,'
      '         art.pit_firmantes pit,'
      '         afi.aem_empresa'
      '   WHERE te_id = co_idtipoempresaprev'
      '     AND co_idpreventornotif = pit.it_id(+)'
      '     AND em_id = co_idempresa'
      '     AND em_idgrupoeconomico = ge_id(+)'
      '     AND tbsector.tb_clave = '#39'SECT'#39
      '     AND tbsector.tb_codigo = em_sector'
      '     AND st_id(+) = co_idsubtipo'
      '     AND co_idempresa = :idempresa'
      '     AND ahdl.dc_contrato(+) = art.get_vultcontrato (em_cuit)'
      '     AND ahdl.dc_tipo(+) = '#39'L'#39
      'ORDER BY co_operativo DESC, co_rigehasta DESC, co_fechabaja DESC')
    Left = 8
    Top = 460
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
    object sdqDatosEmpresaCO_CUIT: TStringField
      FieldName = 'CO_CUIT'
      Required = True
      Size = 11
    end
    object sdqDatosEmpresaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqDatosEmpresaCO_OPERATIVO: TStringField
      FieldName = 'CO_OPERATIVO'
      Required = True
      Size = 6
    end
    object sdqDatosEmpresaTIPOSTR: TStringField
      FieldName = 'TIPOSTR'
      Required = True
      Size = 2
    end
    object sdqDatosEmpresaTIPOPREVENCION: TStringField
      FieldName = 'TIPOPREVENCION'
      Required = True
      Size = 10
    end
    object sdqDatosEmpresaSUBTIPO: TStringField
      FieldName = 'SUBTIPO'
      Size = 30
    end
    object sdqDatosEmpresaREFERENTE: TStringField
      FieldName = 'REFERENTE'
      Size = 4000
    end
    object sdqDatosEmpresaCO_IDEMPRESA: TFloatField
      FieldName = 'CO_IDEMPRESA'
      Required = True
    end
    object sdqDatosEmpresaTE_ID: TFloatField
      FieldName = 'TE_ID'
      Required = True
    end
    object sdqDatosEmpresaIDREFERENTE: TStringField
      FieldName = 'IDREFERENTE'
      Size = 4000
    end
    object sdqDatosEmpresaCO_ID: TFloatField
      FieldName = 'CO_ID'
      Required = True
    end
    object sdqDatosEmpresaCO_IDPREVENTORNOTIF: TFloatField
      FieldName = 'CO_IDPREVENTORNOTIF'
    end
    object sdqDatosEmpresaCO_FECHANOTIFICACION: TDateTimeField
      FieldName = 'CO_FECHANOTIFICACION'
    end
    object sdqDatosEmpresaTELEFONOEMP: TStringField
      FieldName = 'TELEFONOEMP'
      Size = 65
    end
    object sdqDatosEmpresaIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Size = 255
    end
    object sdqDatosEmpresaIT_CODIGO: TStringField
      FieldName = 'IT_CODIGO'
      Size = 12
    end
    object sdqDatosEmpresaINCID: TFloatField
      FieldName = 'INCID'
    end
    object sdqDatosEmpresaCO_RIGEDESDE: TDateTimeField
      FieldName = 'CO_RIGEDESDE'
      Required = True
    end
    object sdqDatosEmpresaCO_RIGEHASTA: TDateTimeField
      FieldName = 'CO_RIGEHASTA'
    end
    object sdqDatosEmpresaSECTOR: TStringField
      FieldName = 'SECTOR'
      Size = 150
    end
    object sdqDatosEmpresaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqDatosEmpresaGE_DESCRIPCION: TStringField
      FieldName = 'GE_DESCRIPCION'
      Size = 100
    end
    object sdqDatosEmpresaCP_FECHA: TDateTimeField
      FieldName = 'CP_FECHA'
    end
    object sdqDatosEmpresaIncidenciaActual: TFloatField
      FieldName = 'Incidencia Actual'
    end
    object sdqDatosEmpresaIncidencia1mesatras: TFloatField
      FieldName = 'Incidencia 1 mes atras'
    end
    object sdqDatosEmpresaIncidencia2mesesatras: TFloatField
      FieldName = 'Incidencia 2 meses atras'
    end
    object sdqDatosEmpresaIncidencia3mesesatras: TFloatField
      FieldName = 'Incidencia 3 meses atras'
    end
    object sdqDatosEmpresaIncidencia4mesesatras: TFloatField
      FieldName = 'Incidencia 4 meses atras'
    end
    object sdqDatosEmpresaIncidencia5mesesatras: TFloatField
      FieldName = 'Incidencia 5 meses atras'
    end
    object sdqDatosEmpresaIncidencia6mesesatras: TFloatField
      FieldName = 'Incidencia 6 meses atras'
    end
    object sdqDatosEmpresaIncidencia7mesesatras: TFloatField
      FieldName = 'Incidencia 7 meses atras'
    end
    object sdqDatosEmpresaIncidencia8mesesatras: TFloatField
      FieldName = 'Incidencia 8 meses atras'
    end
    object sdqDatosEmpresaIncidencia9mesesatras: TFloatField
      FieldName = 'Incidencia 9 meses atras'
    end
    object sdqDatosEmpresaIncidencia10mesesatras: TFloatField
      FieldName = 'Incidencia 10 meses atras'
    end
    object sdqDatosEmpresaIncidencia11mesesatras: TFloatField
      FieldName = 'Incidencia 11 meses atras'
    end
    object sdqDatosEmpresaPE_PREVENTORID: TFloatField
      FieldName = 'PE_PREVENTORID'
    end
    object sdqDatosEmpresaPREVEX: TStringField
      FieldName = 'PREVEX'
      Size = 255
    end
    object sdqDatosEmpresaIT_ID: TFloatField
      FieldName = 'IT_ID'
    end
    object sdqDatosEmpresaCO_FECHABAJA: TDateTimeField
      FieldName = 'CO_FECHABAJA'
    end
    object sdqDatosEmpresaCO_ESTAB_EVENTO: TFloatField
      FieldName = 'CO_ESTAB_EVENTO'
    end
    object sdqDatosEmpresaCO_IDSUBTIPO: TFloatField
      FieldName = 'CO_IDSUBTIPO'
    end
    object sdqDatosEmpresaCO_VIGENCIAHASTA: TDateTimeField
      FieldName = 'CO_VIGENCIAHASTA'
    end
    object sdqDatosEmpresaCO_PRAMET: TStringField
      FieldName = 'CO_PRAMET'
      Size = 1
    end
  end
  object sdqListaPrevSugeridos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterClose = sdqListaPrevSugeridosAfterClose
    ParamCheck = False
    Left = 72
    Top = 388
  end
  object PrintDialogEmpresa: TPrintDialog
    Options = [poPageNums]
    Left = 70
    Top = 429
  end
  object QueryPrintEmpresa: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsDatosEmpresa
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Gesti'#243'n de Empresas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
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
    PrinterOptions.PrintDialog = PrintDialogEmpresa
    Left = 41
    Top = 437
  end
  object ExportDialogEmpresa: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatosEmpresa
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Title = 'Gesti'#243'n de Empresas'
    Left = 9
    Top = 425
  end
end
