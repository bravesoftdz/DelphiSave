object frmObras: TfrmObras
  Left = 966
  Top = 266
  BorderStyle = bsNone
  ClientHeight = 400
  ClientWidth = 801
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    801
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object tsAvisoObra: TPageControl
    Left = 0
    Top = 0
    Width = 801
    Height = 400
    ActivePage = tsProgramaDeSeg
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = tsAvisoObraChange
    object tsAvisoObraInt: TTabSheet
      Caption = 'Aviso Obra'
      object lvAnexo2_A: TListView
        Left = 0
        Top = 0
        Width = 793
        Height = 369
        Align = alClient
        Color = clBtnFace
        Columns = <
          item
            Caption = 'C'#243'digo'
            MaxWidth = 120
            MinWidth = 25
          end
          item
            AutoSize = True
            Caption = 'Descripci'#243'n'
          end
          item
            Caption = 'IDAnexo'
            Width = -1
            WidthType = (
              -1)
          end>
        IconOptions.WrapText = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object ScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 793
        Height = 369
        HorzScrollBar.Visible = False
        VertScrollBar.Position = 610
        Align = alClient
        TabOrder = 1
        OnMouseWheelDown = ScrollBoxMouseWheelDown
        OnMouseWheelUp = ScrollBoxMouseWheelUp
        DesignSize = (
          773
          365)
        object Label13: TLabel
          Left = 4
          Top = -603
          Width = 100
          Height = 13
          Caption = 'Fecha de Recepci'#243'n'
        end
        object Label14: TLabel
          Left = 4
          Top = -579
          Width = 82
          Height = 13
          Caption = 'Fecha Declarada'
        end
        object Label15: TLabel
          Left = 244
          Top = -603
          Width = 102
          Height = 13
          Caption = 'Superficie a Constru'#237'r'
        end
        object Label16: TLabel
          Left = 244
          Top = -579
          Width = 90
          Height = 13
          Caption = 'N'#250'mero de Plantas'
        end
        object Label17: TLabel
          Left = 4
          Top = 206
          Width = 228
          Height = 13
          Caption = 'Fecha de Finalizaci'#243'n de la Actividad en la Obra'
        end
        object Label18: TLabel
          Left = 4
          Top = 228
          Width = 144
          Height = 13
          Caption = 'Fecha de Suspensi'#243'n de Obra'
        end
        object Label19: TLabel
          Left = 4
          Top = 250
          Width = 186
          Height = 13
          Caption = 'Fecha de Reinicio de Obra Suspendida'
        end
        object Label20: TLabel
          Left = 481
          Top = -603
          Width = 11
          Height = 13
          Caption = 'm'#178
        end
        object Label1: TLabel
          Left = 4
          Top = 444
          Width = 29
          Height = 63
          AutoSize = False
          Caption = 'Obs.'
        end
        object Bevel1: TBevel
          Left = 4
          Top = 292
          Width = 766
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          ExplicitWidth = 911
        end
        object Label2: TLabel
          Left = 4
          Top = 271
          Width = 135
          Height = 13
          Caption = 'Fecha de Extensi'#243'n de Obra'
        end
        object lblRecep: TLabel
          Left = 5
          Top = -552
          Width = 52
          Height = 13
          Caption = 'Recepci'#243'n'
        end
        object Label3: TLabel
          Left = 182
          Top = -530
          Width = 86
          Height = 13
          Caption = 'Vencimiento Prog.'
        end
        object Bevel2: TBevel
          Left = 5
          Top = 436
          Width = 766
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          ExplicitWidth = 911
        end
        object Label24: TLabel
          Left = 244
          Top = -556
          Width = 53
          Height = 13
          Caption = 'Resoluci'#243'n'
        end
        object lblDescripcion: TLabel
          Left = 6
          Top = 513
          Width = 57
          Height = 13
          Caption = 'Usuario Alta'
        end
        object Label37: TLabel
          Left = 336
          Top = 514
          Width = 54
          Height = 13
          Caption = 'Fecha Alta:'
        end
        object Label51: TLabel
          Left = 646
          Top = -541
          Width = 127
          Height = 13
          Caption = 'F. Recep Formulario F'#237'sico'
        end
        object Label52: TLabel
          Left = 510
          Top = -517
          Width = 129
          Height = 13
          Caption = 'Usuario Recep Form F'#237'sico'
        end
        object chgObraOtras: TCheckGroup
          Left = 304
          Top = -277
          Width = 470
          Height = 125
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Otras Construcciones'
          TabOrder = 18
          Items.Strings = (
            'Excavaciones subterr'#225'neas'
            'Instalaciones Hidr'#225'ulicas, Sanitarias y de Gas'
            'Instalaciones Electromec'#225'nicas'
            'Instalaciones de Aire Acondicionado'
            'Reparaciones / Refacciones'
            'Otras obras no especificadas')
          TrueChar = 'S'
          FalseChar = 'N'
          Value = 'NNNNNN'
        end
        object chgObraRedes: TCheckGroup
          Left = 0
          Top = -277
          Width = 300
          Height = 125
          Caption = 'Redes'
          TabOrder = 17
          Items.Strings = (
            'Trans.El'#233'ctrica en Alto Voltaje'
            'Trans.El'#233'ctrica en Bajo Voltaje/Subestaciones'
            'Comunicaciones'
            'Otras obras de redes')
          TrueChar = 'S'
          FalseChar = 'N'
          Value = 'NNNN'
        end
        object chgObraDuctos: TCheckGroup
          Left = 681
          Top = -404
          Width = 93
          Height = 125
          Anchors = [akTop, akRight]
          Caption = 'Ductos'
          TabOrder = 16
          Items.Strings = (
            'Tuber'#237'as'
            'Estaciones'
            'Otras')
          TrueChar = 'S'
          FalseChar = 'N'
          Value = 'NNN'
        end
        object chgObraMontInd: TCheckGroup
          Left = 304
          Top = -404
          Width = 374
          Height = 125
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Montaje Industrial'
          TabOrder = 15
          Items.Strings = (
            'Destiler'#237'a, Refiner'#237'as, Petroq.'
            'Generaci'#243'n El'#233'ctrica'
            'Obras para la Miner'#237'a'
            'Industria Manufacturera Urbana'
            'Dem'#225's montajes Industriales')
          TrueChar = 'S'
          FalseChar = 'N'
          Value = 'NNNNN'
        end
        object chgObraArq: TCheckGroup
          Left = 0
          Top = -404
          Width = 301
          Height = 125
          Caption = 'Arquitectura'
          TabOrder = 14
          Columns = 2
          Items.Strings = (
            'Viviendas unifamiliares'
            'Edif. de Pisos M'#250'ltiples'
            'Obras Urbanizaci'#243'n'
            'Edificios Comerciales'
            'Edificios de Oficinas'
            'Escuelas'
            'Hospitales'
            'Otras Edific.Urbanas Def.')
          TrueChar = 'S'
          FalseChar = 'N'
          Value = 'NNNNNNNN'
        end
        object chgObraIngCivil: TCheckGroup
          Left = 0
          Top = -500
          Width = 773
          Height = 93
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Ingenier'#237'a Civil'
          TabOrder = 13
          OnClick = chgObraIngCivilClick
          Columns = 3
          Items.Strings = (
            'Caminos'
            'Calles'
            'Autopistas'
            'Puentes'
            'T'#250'neles'
            'Obras Ferroviarias'
            'Obras Hidr'#225'ulicas'
            'Alcantarillas/Trat.de Agua y Afl.'
            'Puertos'
            'Aeropuertos'
            'Otras')
          TrueChar = 'S'
          FalseChar = 'N'
          Value = 'NNNNNNNNNNN'
        end
        object edObraFechaRecepcion: TDateComboBox
          Left = 108
          Top = -607
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edObraFechaDeclaracion: TDateComboBox
          Left = 108
          Top = -583
          Width = 88
          Height = 21
          MaxDateCombo = edObraFechaFin
          TabOrder = 2
          OnExit = edObraFechaDeclaracionExit
        end
        object edObraNroPlantas: TIntEdit
          Left = 357
          Top = -583
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object edObraSuperficie: TIntEdit
          Left = 357
          Top = -607
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edObraFechaFin: TDateComboBox
          Left = 264
          Top = 202
          Width = 88
          Height = 21
          MinDateCombo = edObraFechaDeclaracion
          TabOrder = 20
        end
        object edObraFechaSusp: TDateComboBox
          Left = 264
          Top = 224
          Width = 88
          Height = 21
          MaxDateCombo = edObraFechaReinicio
          TabOrder = 21
        end
        object edObraFechaReinicio: TDateComboBox
          Left = 264
          Top = 246
          Width = 88
          Height = 21
          MinDateCombo = edObraFechaSusp
          TabOrder = 22
        end
        object grpObraActividad: TGroupBox
          Left = 0
          Top = -149
          Width = 773
          Height = 342
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Actividad'
          TabOrder = 19
          DesignSize = (
            773
            342)
          object Label21: TLabel
            Left = 4
            Top = 318
            Width = 25
            Height = 13
            Caption = 'Otros'
          end
          object Bevel3: TBevel
            Left = 4
            Top = 310
            Width = 766
            Height = 10
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
            ExplicitWidth = 911
          end
          object lbDenunciaSrt: TLabel
            Left = 174
            Top = 137
            Width = 131
            Height = 20
            Caption = 'Denuncia SRT'
            Color = clBtnFace
            Font.Charset = GREEK_CHARSET
            Font.Color = clMenuHighlight
            Font.Height = -17
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Visible = False
          end
          object chgObraActividad: TCheckGroup
            Left = 8
            Top = 15
            Width = 763
            Height = 121
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Actividad'
            TabOrder = 0
            OnClick = chgObraActividadClick
            Columns = 2
            Items.Strings = (
              'Excavaci'#243'n Res. 550'
              'Demolici'#243'n Res. 550'
              'Alba'#241'iler'#237'a'
              'H'#186'A'#186
              'Montajes Electromec'#225'nicos'
              'Instalaciones Varias'
              'Estructuras Met'#225'licas'
              'Electricidad'
              'Ascensores, montacargas o montapersonas'
              'Pintura'
              
                #191'Tiene la obra mas de 1000m'#178' de superficie cubierta o se trabaja' +
                ' a m'#225's de 4 mts. de altura?'
              'Silletas o Andamios Colgantes'
              'Medios de Izaje'
              'Alta y media Tensi'#243'n')
            BorderStyle = bsNone
            TrueChar = 'S'
            FalseChar = 'N'
            Value = 'NNNNNNNNNNNNNN'
          end
          object edObraActOtros: TEdit
            Left = 36
            Top = 315
            Width = 734
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 100
            TabOrder = 3
          end
          object gbExcavacion: TGroupBox
            Left = 0
            Top = 155
            Width = 891
            Height = 50
            Caption = ' Excavaci'#243'n Res. 550 '
            TabOrder = 1
            object Label30: TLabel
              Left = 8
              Top = 22
              Width = 65
              Height = 13
              Caption = 'Fecha desde:'
            end
            object Label31: TLabel
              Left = 185
              Top = 22
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object edFechaExcavacion: TDateComboBox
              Left = 85
              Top = 19
              Width = 86
              Height = 21
              TabOrder = 0
              OnExit = edFechaExcavacionExit
            end
            object edFechaExcavacionHasta: TDateComboBox
              Left = 219
              Top = 19
              Width = 87
              Height = 21
              TabOrder = 1
              OnExit = edFechaExcavacionExit
            end
            object cbSubmuraciones: TCheckBox
              Left = 325
              Top = 23
              Width = 95
              Height = 12
              Caption = 'Submuraciones'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object cbSubsuelos: TCheckBox
              Left = 438
              Top = 23
              Width = 69
              Height = 12
              Caption = 'Subsuelos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          object gbDemolicion: TGroupBox
            Left = -1
            Top = 205
            Width = 893
            Height = 50
            Caption = ' Demolici'#243'n Res. 550 '
            TabOrder = 2
            object Label32: TLabel
              Left = 8
              Top = 22
              Width = 65
              Height = 13
              Caption = 'Fecha desde:'
            end
            object Label33: TLabel
              Left = 185
              Top = 22
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object edFechaDemolicionHasta: TDateComboBox
              Left = 218
              Top = 19
              Width = 87
              Height = 21
              TabOrder = 1
              OnExit = edFechaDemolicionExit
            end
            object edFechaDemolicion: TDateComboBox
              Left = 85
              Top = 19
              Width = 87
              Height = 21
              TabOrder = 0
              OnExit = edFechaDemolicionExit
            end
            object cbTotal: TCheckBox
              Left = 320
              Top = 19
              Width = 52
              Height = 16
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object cbParcial: TCheckBox
              Left = 398
              Top = 20
              Width = 55
              Height = 12
              Caption = 'Parcial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 254
            Width = 892
            Height = 50
            Caption = 
              'Otras excavaciones con m'#225's de 1,2 mts de profundidad, no incluid' +
              'as en la Res.550/11, ni tuneles, galerias o mineria. '
            TabOrder = 4
            DesignSize = (
              892
              50)
            object Label40: TLabel
              Left = 152
              Top = 22
              Width = 65
              Height = 13
              Caption = 'Fecha desde:'
            end
            object Label41: TLabel
              Left = 329
              Top = 22
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object Label42: TLabel
              Left = 1004
              Top = 29
              Width = 25
              Height = 13
              Caption = 'Otros'
            end
            object lbDetalle: TLabel
              Left = 460
              Top = 21
              Width = 36
              Height = 13
              Caption = 'Detalle:'
            end
            object edFechaExc503Hasta: TDateComboBox
              Left = 362
              Top = 19
              Width = 87
              Height = 21
              TabOrder = 2
              OnExit = edFechaDemolicionExit
            end
            object edFechaExc503Desde: TDateComboBox
              Left = 229
              Top = 19
              Width = 87
              Height = 21
              TabOrder = 1
              OnExit = edFechaDemolicionExit
            end
            object cbExcavacion503: TCheckBox
              Left = 16
              Top = 21
              Width = 127
              Height = 16
              Caption = 'Excavaci'#243'n Res. 503'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = chgObraActividadClick
            end
            object edDetalleRes503: TEdit
              Left = 501
              Top = 19
              Width = 387
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 100
              TabOrder = 3
            end
          end
        end
        object edObraObservaciones: TMemo
          Left = 36
          Top = 443
          Width = 734
          Height = 60
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 2000
          TabOrder = 25
        end
        object btnAnexo2Copiar: TButton
          Left = 694
          Top = -606
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Copiar de ...'
          TabOrder = 26
          OnClick = btnAnexo2CopiarClick
        end
        object edObraFechaExtension: TDateComboBox
          Left = 264
          Top = 268
          Width = 88
          Height = 21
          TabOrder = 23
        end
        object edRecep: TIntEdit
          Left = 108
          Top = -558
          Width = 88
          Height = 21
          TabOrder = 4
        end
        object edFechaVenProg: TDateComboBox
          Left = 274
          Top = -535
          Width = 95
          Height = 21
          TabOrder = 8
        end
        object cbProgSeg: TCheckBox
          Left = 3
          Top = -533
          Width = 160
          Height = 20
          Alignment = taLeftJustify
          Caption = 'Requiere Programa Seguridad'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 7
          OnClick = cbProgSegClick
        end
        object pnl4: TPanel
          Left = 0
          Top = 294
          Width = 668
          Height = 139
          Align = alCustom
          BevelOuter = bvNone
          TabOrder = 24
          DesignSize = (
            668
            139)
          object Label6: TLabel
            Left = 11
            Top = 4
            Width = 125
            Height = 13
            Caption = 'Asignar Responsable HYS'
          end
          object grbContacto: TGroupBox
            Left = 6
            Top = 22
            Width = 646
            Height = 117
            Anchors = [akLeft, akRight, akBottom]
            Caption = ' Datos del Contacto '
            TabOrder = 1
            DesignSize = (
              646
              117)
            inline fraContactoObra: TfraContacto
              Left = 6
              Top = 15
              Width = 631
              Height = 97
              Anchors = [akLeft, akRight, akBottom]
              Constraints.MinHeight = 90
              Constraints.MinWidth = 480
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitLeft = 6
              ExplicitTop = 15
              ExplicitWidth = 631
              ExplicitHeight = 97
              DesignSize = (
                631
                97)
              inherited lbCAFAX: TLabel
                Left = 356
                ExplicitLeft = 356
              end
              inherited lbFAX: TLabel
                Left = 432
                ExplicitLeft = 432
              end
              inherited edContacto: TEdit
                Width = 580
                Color = cl3DLight
                ReadOnly = True
                ExplicitWidth = 580
              end
              inherited edAreaFax: TPatternEdit
                Left = 376
                Width = 48
                Color = cl3DLight
                ReadOnly = True
                ExplicitLeft = 376
                ExplicitWidth = 48
              end
              inherited edFax: TPatternEdit
                Left = 454
                Top = 47
                Width = 301
                Color = cl3DLight
                ReadOnly = True
                ExplicitLeft = 454
                ExplicitTop = 47
                ExplicitWidth = 301
              end
              inherited edEmail: TEdit
                Width = 468
                Color = cl3DLight
                ReadOnly = True
                ExplicitWidth = 468
              end
              inherited fraArea: TfraStaticCTB_TABLAS
                Width = 350
                Enabled = False
                ExplicitWidth = 350
                DesignSize = (
                  350
                  23)
                inherited edCodigo: TPatternEdit
                  Color = cl3DLight
                end
                inherited cmbDescripcion: TComboGrid
                  Width = 286
                  Color = cl3DLight
                  ExplicitWidth = 286
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
              inherited fraCargo: TfraStaticCTB_TABLAS
                Enabled = False
                inherited edCodigo: TPatternEdit
                  Color = cl3DLight
                end
                inherited cmbDescripcion: TComboGrid
                  Color = cl3DLight
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
              inherited fraTelefonos: TfraTelefono
                inherited btnABMTelefonos: TButton
                  Enabled = False
                end
                inherited cmbTelefonos: TComboGrid
                  Cells = ()
                  ColWidths = (
                    64
                    64)
                end
              end
              inherited chkRemitenteCarta: TCheckBox
                Left = 525
                Top = 72
                ExplicitLeft = 525
                ExplicitTop = 72
              end
              inherited sdqDatos: TSDQuery
                Left = 65520
                Top = 96
              end
              inherited dsDatos: TDataSource
                Left = 12
                Top = 96
              end
            end
          end
          object ToolBar1: TToolBar
            Left = 144
            Top = -3
            Width = 85
            Height = 26
            Align = alNone
            BorderWidth = 1
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ToolButton1: TToolButton
              Left = 0
              Top = 0
              Hint = 'Asignar Responsable HYS'
              Caption = 'tbDiagRefrescar'
              ImageIndex = 14
              OnClick = ToolButton1Click
            end
            object tbBuscarResponsableExistente: TToolButton
              Left = 23
              Top = 0
              Hint = 'Busca el Responsable existente'
              Caption = 'tbBuscarResponsableExistente'
              ImageIndex = 26
              OnClick = tbBuscarResponsableExistenteClick
            end
            object tbResposablesHys: TToolButton
              Left = 46
              Top = 0
              Hint = 'Resposables de HYS'
              Caption = 'tbResposablesHys'
              ImageIndex = 19
              OnClick = tbResposablesHysAOClick
            end
          end
        end
        object ToolBar2: TToolBar
          Left = 544
          Top = -586
          Width = 33
          Height = 26
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 27
        end
        inline fraResolucionAvisoObra: TfraCodigoDescripcion
          Left = 301
          Top = -561
          Width = 179
          Height = 23
          TabOrder = 5
          ExplicitLeft = 301
          ExplicitTop = -561
          ExplicitWidth = 179
          DesignSize = (
            179
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 114
            DataSource = nil
            ExplicitWidth = 114
          end
          inherited edCodigo: TPatternEdit
            Left = 2
            ExplicitLeft = 2
          end
        end
        object ToolBar7: TToolBar
          Left = 202
          Top = -561
          Width = 28
          Height = 26
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 28
          object tbCambioResolucion: TToolButton
            Left = 0
            Top = 0
            Hint = 'Cambio Nro. Recepci'#243'n'
            Caption = 'tbDiagRefrescar'
            ImageIndex = 14
            OnClick = tbCambioResolucionClick
          end
        end
        object edUsuAltaAO: TEdit
          Left = 79
          Top = 510
          Width = 202
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          ReadOnly = True
          TabOrder = 29
        end
        object edFechaAltaAO: TDateComboBox
          Left = 413
          Top = 511
          Width = 86
          Height = 21
          Enabled = False
          TabOrder = 30
          OnExit = edFechaExcavacionExit
        end
        object rgTipo: TRadioGroup
          Left = 509
          Top = -609
          Width = 327
          Height = 62
          Caption = 'Tipo '
          Columns = 2
          Items.Strings = (
            'Aviso de Obra'
            'Extensi'#243'n'
            'Suspensi'#243'n'
            'Suspensi'#243'n definitiva')
          TabOrder = 6
        end
        object GroupBox3: TGroupBox
          Left = 7
          Top = 532
          Width = 893
          Height = 45
          Caption = ' Comitente '
          TabOrder = 31
          DesignSize = (
            893
            45)
          object Label43: TLabel
            Left = 113
            Top = 21
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label45: TLabel
            Left = 242
            Top = 21
            Width = 66
            Height = 13
            Caption = 'Raz'#243'n Social:'
          end
          object edCuitComitente: TMaskEdit
            Left = 146
            Top = 16
            Width = 81
            Height = 21
            Hint = 'CUIT de la Empresa'
            EditMask = '99-99999999-9;0;'
            MaxLength = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object edRazonSocialComitente: TEdit
            Left = 318
            Top = 16
            Width = 569
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 200
            TabOrder = 2
          end
          object cbComitente: TCheckBox
            Left = 14
            Top = 22
            Width = 72
            Height = 12
            Caption = 'Comitente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 7
          Top = 580
          Width = 893
          Height = 45
          Caption = ' Contratista '
          TabOrder = 32
          DesignSize = (
            893
            45)
          object Label44: TLabel
            Left = 112
            Top = 21
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label46: TLabel
            Left = 242
            Top = 21
            Width = 66
            Height = 13
            Caption = 'Raz'#243'n Social:'
          end
          object edCuitContratista: TMaskEdit
            Left = 146
            Top = 16
            Width = 81
            Height = 21
            Hint = 'CUIT de la Empresa'
            EditMask = '99-99999999-9;0;'
            MaxLength = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object edRazonSocialContratista: TEdit
            Left = 318
            Top = 16
            Width = 568
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 200
            TabOrder = 2
          end
          object cbContratista: TCheckBox
            Left = 14
            Top = 22
            Width = 74
            Height = 12
            Caption = 'Contratista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 7
          Top = 629
          Width = 893
          Height = 45
          Caption = ' SubContratista '
          TabOrder = 33
          DesignSize = (
            893
            45)
          object Label47: TLabel
            Left = 111
            Top = 21
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label48: TLabel
            Left = 242
            Top = 21
            Width = 66
            Height = 13
            Caption = 'Raz'#243'n Social:'
          end
          object edCuitSubcontratista: TMaskEdit
            Left = 146
            Top = 16
            Width = 81
            Height = 21
            Hint = 'CUIT de la Empresa'
            EditMask = '99-99999999-9;0;'
            MaxLength = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object edRazonSocialSubContratista: TEdit
            Left = 318
            Top = 16
            Width = 566
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 200
            TabOrder = 2
          end
          object cbSubcontratista: TCheckBox
            Left = 14
            Top = 22
            Width = 90
            Height = 12
            Caption = 'Subcontratista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 7
          Top = 680
          Width = 893
          Height = 131
          Caption = ' Responsable de los Datos'
          TabOrder = 34
          DesignSize = (
            893
            131)
          object Label50: TLabel
            Left = 10
            Top = 21
            Width = 37
            Height = 13
            Caption = 'Nombre'
          end
          object lbApellido: TLabel
            Left = 418
            Top = 21
            Width = 37
            Height = 13
            Caption = 'Apellido'
          end
          object TLabel
            Left = 282
            Top = 49
            Width = 47
            Height = 13
            Caption = 'Cod. Area'
          end
          object lbTelefono: TLabel
            Left = 420
            Top = 49
            Width = 42
            Height = 13
            Caption = 'Telefono'
          end
          object Label53: TLabel
            Left = 10
            Top = 50
            Width = 42
            Height = 13
            Caption = 'Tipo Tel.'
          end
          object Label54: TLabel
            Left = 10
            Top = 79
            Width = 25
            Height = 13
            Caption = 'Email'
          end
          object Label55: TLabel
            Left = 10
            Top = 105
            Width = 79
            Height = 13
            Caption = 'Tipo Documento'
          end
          object Label56: TLabel
            Left = 418
            Top = 105
            Width = 95
            Height = 13
            Caption = 'Numero Documento'
          end
          object Label57: TLabel
            Left = 422
            Top = 77
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object edNombreResp: TEdit
            Left = 94
            Top = 16
            Width = 315
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 60
            TabOrder = 0
          end
          object edApellidoResp: TEdit
            Left = 518
            Top = 16
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 60
            TabOrder = 1
          end
          object edCodAreaResp: TEdit
            Left = 340
            Top = 44
            Width = 69
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 10
            TabOrder = 2
          end
          object edTelefonoResp: TEdit
            Left = 519
            Top = 44
            Width = 276
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 20
            TabOrder = 3
          end
          inline fraTipoTelResp: TfraCodigoDescripcion
            Left = 93
            Top = 44
            Width = 179
            Height = 23
            TabOrder = 4
            ExplicitLeft = 93
            ExplicitTop = 44
            ExplicitWidth = 179
            DesignSize = (
              179
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 114
              DataSource = nil
              ExplicitWidth = 114
            end
            inherited edCodigo: TPatternEdit
              Left = 2
              ExplicitLeft = 2
            end
          end
          object edEmailResp: TEdit
            Left = 94
            Top = 74
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 100
            TabOrder = 5
          end
          object edTipoDocumentoResp: TEdit
            Left = 94
            Top = 100
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 10
            TabOrder = 6
          end
          object edNumeroDocumentoResp: TEdit
            Left = 518
            Top = 100
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 8
            TabOrder = 7
          end
          object cbRespSexoMasc: TCheckBox
            Left = 520
            Top = 75
            Width = 97
            Height = 17
            Caption = 'Masculino'
            TabOrder = 8
          end
          object cbRespSexoFem: TCheckBox
            Left = 624
            Top = 75
            Width = 97
            Height = 17
            Caption = 'Femenino'
            TabOrder = 9
          end
        end
        object cbFaltaFisico: TCheckBox
          Left = 510
          Top = -543
          Width = 129
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Falta Formulario F'#237'sico'
          TabOrder = 10
        end
        object cbFormularioWeb: TCheckBox
          Left = 375
          Top = -533
          Width = 105
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Formulario Web'
          TabOrder = 9
          OnClick = cbFormularioWebClick
        end
        object edFechaRecepFormFisico: TDateComboBox
          Left = 790
          Top = -547
          Width = 95
          Height = 21
          TabOrder = 11
        end
        inline fraUsuarioRecepFormFisico: TfraUsuario
          Left = 644
          Top = -522
          Width = 241
          Height = 21
          TabOrder = 12
          ExplicitLeft = 644
          ExplicitTop = -522
          ExplicitWidth = 241
          inherited cmbDescripcion: TArtComboBox
            Width = 157
            ExplicitWidth = 157
          end
        end
      end
      object fpCopiarEstableci: TFormPanel
        Left = 1312
        Top = 212
        Width = 529
        Height = 97
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        OnBeforeShow = fpCopiarEstableciBeforeShow
        Constraints.MinHeight = 73
        Constraints.MinWidth = 163
        DesignSize = (
          529
          97)
        object BevelAbm: TBevel
          Left = 4
          Top = 61
          Width = 521
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object btnCopEstAceptar: TButton
          Left = 371
          Top = 67
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
          OnClick = btnCopEstAceptarClick
        end
        object btnCopEstCancelar: TButton
          Left = 449
          Top = 67
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        inline fraEstabCopia: TfraEstablecimientoDomic
          Left = 6
          Top = 8
          Width = 519
          Height = 47
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          ExplicitLeft = 6
          ExplicitTop = 8
          inherited lbLocalidad: TLabel
            Width = 46
            ExplicitWidth = 46
          end
          inherited lbEstableci: TLabel
            Width = 30
            ExplicitWidth = 30
          end
          inherited lbCPostal: TLabel
            Width = 20
            ExplicitWidth = 20
          end
          inherited lbDomicilio: TLabel
            Width = 42
            ExplicitWidth = 42
          end
          inherited lbProvincia: TLabel
            Width = 44
            ExplicitWidth = 44
          end
        end
      end
      object fpCambioRecepcion: TFormPanel
        Left = 1312
        Top = 364
        Width = 235
        Height = 73
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        OnBeforeShow = fpCopiarEstableciBeforeShow
        Constraints.MinHeight = 73
        Constraints.MinWidth = 163
        DesignSize = (
          235
          73)
        object Bevel4: TBevel
          Left = 4
          Top = 37
          Width = 227
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label27: TLabel
          Left = 5
          Top = 11
          Width = 55
          Height = 13
          Caption = 'Recepci'#243'n:'
        end
        object btnCopRecepAceptar: TButton
          Left = 77
          Top = 43
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
          OnClick = btnCopRecepAceptarClick
        end
        object btnCopRecepCancelar: TButton
          Left = 155
          Top = 43
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object edCambRecep: TIntEdit
          Left = 80
          Top = 8
          Width = 146
          Height = 21
          TabOrder = 2
        end
      end
    end
    object tsProgramaDeSeg: TTabSheet
      Caption = 'Programa de Seguridad'
      ImageIndex = 1
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 793
        Height = 369
        VertScrollBar.Position = 314
        Align = alClient
        TabOrder = 0
        DesignSize = (
          773
          365)
        object Label10: TLabel
          Left = 8
          Top = -151
          Width = 28
          Height = 13
          Caption = 'Retir'#243
        end
        object Label11: TLabel
          Left = 8
          Top = -125
          Width = 29
          Height = 65
          AutoSize = False
          Caption = 'Obs.'
        end
        object Label12: TLabel
          Left = 8
          Top = 176
          Width = 142
          Height = 13
          Caption = 'Periodicidad Visitas(en meses)'
        end
        object Label22: TLabel
          Left = 8
          Top = -284
          Width = 85
          Height = 13
          Caption = 'Fecha Recepci'#243'n'
        end
        object Label23: TLabel
          Left = 191
          Top = -284
          Width = 107
          Height = 13
          Caption = 'Cantidad Trabajadores'
        end
        object Label25: TLabel
          Left = 8
          Top = -177
          Width = 61
          Height = 13
          Caption = 'Fecha Retiro'
        end
        object Label5: TLabel
          Left = 8
          Top = 204
          Width = 125
          Height = 13
          Caption = 'Cantidad Visitas a Realizar'
        end
        object Label7: TLabel
          Left = 8
          Top = -310
          Width = 53
          Height = 13
          Caption = 'Resoluci'#243'n'
        end
        object Label8: TLabel
          Left = 8
          Top = -234
          Width = 79
          Height = 13
          Caption = 'Fecha Aprobado'
        end
        object Label9: TLabel
          Left = 10
          Top = -208
          Width = 34
          Height = 13
          Caption = 'Aprob'#243
        end
        object Label26: TLabel
          Left = 228
          Top = -233
          Width = 79
          Height = 13
          Caption = 'Fecha Extensi'#243'n'
        end
        object Label4: TLabel
          Left = 8
          Top = -258
          Width = 61
          Height = 13
          Caption = 'Fecha Inicio:'
        end
        object Label28: TLabel
          Left = 191
          Top = -260
          Width = 163
          Height = 13
          Caption = 'Fecha de Presentacion del Anexo:'
        end
        object Label29: TLabel
          Left = 8
          Top = -61
          Width = 29
          Height = 65
          AutoSize = False
          Caption = 'Desc.'#13#10'  de '#13#10'Obra'
        end
        object Label38: TLabel
          Left = 6
          Top = 146
          Width = 57
          Height = 13
          Caption = 'Usuario Alta'
        end
        object Label39: TLabel
          Left = 336
          Top = 147
          Width = 54
          Height = 13
          Caption = 'Fecha Alta:'
        end
        object edCantidadTrabajadores: TIntEdit
          Left = 358
          Top = -288
          Width = 70
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object edPeriodicidad: TIntEdit
          Left = 156
          Top = 173
          Width = 70
          Height = 21
          TabOrder = 12
          Text = '0'
        end
        object edObservaciones: TMemo
          Left = 40
          Top = -126
          Width = 729
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 2000
          TabOrder = 11
        end
        object edFechaRetiro: TDateComboBox
          Left = 97
          Top = -185
          Width = 88
          Height = 21
          TabOrder = 8
        end
        object edFechaRecepcion: TDateComboBox
          Left = 97
          Top = -288
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object edFechaAprobado: TDateComboBox
          Left = 97
          Top = -237
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object edCantidadVisitas: TIntEdit
          Left = 156
          Top = 200
          Width = 70
          Height = 21
          TabOrder = 13
          Text = '0'
        end
        inline fraResolucion: TfraCodigoDescripcion
          Left = 95
          Top = -314
          Width = 412
          Height = 23
          TabOrder = 0
          ExplicitLeft = 95
          ExplicitTop = -314
          ExplicitWidth = 412
          DesignSize = (
            412
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 347
            DataSource = nil
            ExplicitWidth = 347
          end
          inherited edCodigo: TPatternEdit
            Left = 2
            ExplicitLeft = 2
          end
        end
        object Grid: TArtDBGrid
          Left = 0
          Top = 223
          Width = 773
          Height = 142
          Align = alBottom
          DataSource = dsConsulta
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 14
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnGetCellParams = GridGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'Fecha'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Obligatorio'
              Title.Caption = 'Tipo Visita'
              Width = 102
              Visible = True
            end>
        end
        object ToolBar3: TToolBar
          Left = 510
          Top = -314
          Width = 28
          Height = 26
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          object tbLimpiar: TToolButton
            Left = 0
            Top = 0
            Hint = 'Limpiar Prog Seguridad'
            Caption = 'tbDiagRefrescar'
            ImageIndex = 1
            OnClick = tbLimpiarClick
          end
        end
        object ToolBar4: TToolBar
          Left = 230
          Top = 170
          Width = 155
          Height = 27
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          object tbGenerar: TToolButton
            Left = 0
            Top = 0
            Hint = 'Generar'
            Caption = 'Generar'
            ImageIndex = 15
            OnClick = btnGenerarClick
          end
          object ToolButton3: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object tbLimpiarVisita: TToolButton
            Left = 31
            Top = 0
            Hint = 'Limpiar Visita'
            Caption = 'tbLimpiarVisita'
            ImageIndex = 1
            OnClick = btnLimpiarClick
          end
          object ToolButton5: TToolButton
            Left = 54
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbMaxVisitas: TToolButton
            Left = 62
            Top = 0
            Hint = 'Cantidad M'#225'xima Visitas'
            Caption = 'tbMaxVisitas'
            ImageIndex = 16
            OnClick = btnMaxVisitasClick
          end
          object ToolButton2: TToolButton
            Left = 85
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 17
            Style = tbsSeparator
          end
          object tbEliminarFechas: TToolButton
            Left = 93
            Top = 0
            Hint = 'Eliminar Fecha visita seleccionada'
            Caption = 'tbEliminarFechas'
            ImageIndex = 8
            OnClick = tbEliminarFechasClick
          end
          object ToolButton8: TToolButton
            Left = 116
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tbInformeProg: TToolButton
            Left = 124
            Top = 0
            Hint = 'Informe Programa de Seguridad'
            Caption = 'tbInformeProg'
            ImageIndex = 44
            OnClick = tbInformeProgClick
          end
        end
        object ToolBar6: TToolBar
          Left = 192
          Top = -239
          Width = 28
          Height = 26
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          object btnCantPreventor: TToolButton
            Left = 0
            Top = 0
            Hint = 'Cantidad de Aprobados por Preventor'
            ImageIndex = 26
            OnClick = btnCantPreventorClick
          end
        end
        object rgAplicaProg: TRadioGroup
          Left = 639
          Top = -314
          Width = 125
          Height = 48
          Hint = 'f'
          Caption = 'Aplica Programa a:'
          Items.Strings = (
            'Empresa'
            'Establecimiento')
          TabOrder = 18
          Visible = False
        end
        object edFechaExtension: TDateComboBox
          Left = 359
          Top = -237
          Width = 95
          Height = 21
          TabOrder = 7
        end
        object edRetiro: TEdit
          Left = 96
          Top = -156
          Width = 409
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 10
        end
        object edFechaInicio: TDateComboBox
          Left = 97
          Top = -262
          Width = 88
          Height = 21
          TabOrder = 3
        end
        object cbFechaAnexo: TCheckBox
          Left = 463
          Top = -262
          Width = 198
          Height = 20
          Caption = 'Requiere Fecha Presentacion Anexo'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 5
          OnClick = cbFechaAnexoClick
        end
        object edFechaAnexo: TDateComboBox
          Left = 359
          Top = -263
          Width = 95
          Height = 21
          TabOrder = 4
        end
        inline fraAprobo: TfraCodigoDescripcion
          Left = 95
          Top = -210
          Width = 412
          Height = 23
          TabOrder = 9
          ExplicitLeft = 95
          ExplicitTop = -210
          ExplicitWidth = 412
          DesignSize = (
            412
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 347
            DataSource = nil
            ExplicitWidth = 347
          end
          inherited edCodigo: TPatternEdit
            Left = 2
            ExplicitLeft = 2
          end
        end
        object edDescObra: TMemo
          Left = 39
          Top = -62
          Width = 729
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 2000
          TabOrder = 19
        end
        object edFechaVisita: TDateComboBox
          Left = 233
          Top = 199
          Width = 95
          Height = 21
          TabOrder = 20
        end
        object ToolBar8: TToolBar
          Left = 336
          Top = 196
          Width = 52
          Height = 27
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 21
          object tbAgregarVisita: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbAgregarVisita'
            ImageIndex = 6
            OnClick = tbAgregarVisitaClick
          end
        end
        object cbDemolicion: TCheckBox
          Left = 376
          Top = 201
          Width = 97
          Height = 17
          Caption = 'Demolici'#243'n'
          TabOrder = 22
        end
        object cbExcavacion: TCheckBox
          Left = 472
          Top = 201
          Width = 97
          Height = 17
          Caption = 'Excavaci'#243'n'
          TabOrder = 23
        end
        object cbCopia: TCheckBox
          Left = 463
          Top = -285
          Width = 53
          Height = 20
          Caption = 'Copia'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 24
          OnClick = cbFechaAnexoClick
        end
        object edUsuAltaPS: TEdit
          Left = 84
          Top = 143
          Width = 202
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 50
          ReadOnly = True
          TabOrder = 25
        end
        object edFechaAltaPS: TDateComboBox
          Left = 413
          Top = 144
          Width = 86
          Height = 21
          Enabled = False
          TabOrder = 26
          OnExit = edFechaExcavacionExit
        end
        object Panel1: TPanel
          Left = 0
          Top = 1
          Width = 668
          Height = 139
          Align = alCustom
          BevelOuter = bvNone
          TabOrder = 27
          DesignSize = (
            668
            139)
          object Label58: TLabel
            Left = 11
            Top = 4
            Width = 125
            Height = 13
            Caption = 'Asignar Responsable HYS'
          end
          object GroupBox7: TGroupBox
            Left = 6
            Top = 22
            Width = 646
            Height = 117
            Anchors = [akLeft, akRight, akBottom]
            Caption = ' Datos del Contacto '
            TabOrder = 1
            DesignSize = (
              646
              117)
            inline fraContactoPS: TfraContacto
              Left = 6
              Top = 15
              Width = 631
              Height = 97
              Anchors = [akLeft, akRight, akBottom]
              Constraints.MinHeight = 90
              Constraints.MinWidth = 480
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitLeft = 6
              ExplicitTop = 15
              ExplicitWidth = 631
              ExplicitHeight = 97
              DesignSize = (
                631
                97)
              inherited lbCAFAX: TLabel
                Left = 356
                ExplicitLeft = 356
              end
              inherited lbFAX: TLabel
                Left = 432
                ExplicitLeft = 432
              end
              inherited edContacto: TEdit
                Width = 580
                Color = cl3DLight
                ReadOnly = True
                ExplicitWidth = 580
              end
              inherited edAreaFax: TPatternEdit
                Left = 376
                Width = 48
                Color = cl3DLight
                ReadOnly = True
                ExplicitLeft = 376
                ExplicitWidth = 48
              end
              inherited edFax: TPatternEdit
                Left = 454
                Top = 47
                Width = 301
                Color = cl3DLight
                ReadOnly = True
                ExplicitLeft = 454
                ExplicitTop = 47
                ExplicitWidth = 301
              end
              inherited edEmail: TEdit
                Width = 472
                Color = cl3DLight
                ReadOnly = True
                ExplicitWidth = 472
              end
              inherited fraArea: TfraStaticCTB_TABLAS
                Width = 350
                Enabled = False
                ExplicitWidth = 350
                DesignSize = (
                  350
                  23)
                inherited edCodigo: TPatternEdit
                  Color = cl3DLight
                end
                inherited cmbDescripcion: TComboGrid
                  Width = 286
                  Color = cl3DLight
                  ExplicitWidth = 286
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
              inherited fraCargo: TfraStaticCTB_TABLAS
                Enabled = False
                inherited edCodigo: TPatternEdit
                  Color = cl3DLight
                end
                inherited cmbDescripcion: TComboGrid
                  Color = cl3DLight
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
              inherited fraTelefonos: TfraTelefono
                inherited btnABMTelefonos: TButton
                  Enabled = False
                end
                inherited cmbTelefonos: TComboGrid
                  Cells = ()
                  ColWidths = (
                    64
                    64)
                end
              end
              inherited chkRemitenteCarta: TCheckBox
                Left = 527
                Top = 72
                ExplicitLeft = 527
                ExplicitTop = 72
              end
              inherited sdqDatos: TSDQuery
                Left = 65520
                Top = 96
              end
              inherited dsDatos: TDataSource
                Left = 12
                Top = 96
              end
            end
          end
          object ToolBar9: TToolBar
            Left = 144
            Top = -3
            Width = 85
            Height = 26
            Align = alNone
            BorderWidth = 1
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbAsignarResponsableHYSPS: TToolButton
              Left = 0
              Top = 0
              Hint = 'Asignar Responsable HYS'
              Caption = 'tbDiagRefrescar'
              ImageIndex = 14
              OnClick = tbAsignarResponsableHYSPSClick
            end
            object tbBuscaResponsableExistentePS: TToolButton
              Left = 23
              Top = 0
              Hint = 'Busca el Responsable existente'
              Caption = 'tbBuscarResponsableExistente'
              ImageIndex = 26
              OnClick = tbBuscaResponsableExistentePSClick
            end
            object tbResponsableHYSPS: TToolButton
              Left = 46
              Top = 0
              Hint = 'Resposables de HYS'
              Caption = 'tbResposablesHys'
              ImageIndex = 19
              OnClick = tbResposablesHysClick
            end
          end
        end
        object cbExcavacion503VsitasPS: TCheckBox
          Left = 568
          Top = 201
          Width = 97
          Height = 17
          Caption = 'Excavaci'#243'n 503'
          TabOrder = 28
        end
      end
    end
    object tsDomicilio319: TTabSheet
      Caption = 'Domicilio 319/99'
      ImageIndex = 2
    end
    object tsRechazo: TTabSheet
      Caption = 'Rechazo'
      ImageIndex = 3
      object gbRechazoAvisoObra: TGroupBox
        Left = 0
        Top = 0
        Width = 793
        Height = 129
        Align = alTop
        Caption = ' Aviso de Obra '
        TabOrder = 0
        DesignSize = (
          793
          129)
        object Label34: TLabel
          Left = 184
          Top = 62
          Width = 29
          Height = 63
          AutoSize = False
          Caption = 'Obs.'
        end
        object Label35: TLabel
          Left = 9
          Top = 17
          Width = 76
          Height = 13
          Caption = 'Fecha Rechazo'
        end
        object cbNoCorrespondePresentacion: TCheckBox
          Left = 184
          Top = 37
          Width = 164
          Height = 17
          Caption = 'No corresponde Presentaci'#243'n'
          TabOrder = 0
        end
        object edObservacionesRechazo: TMemo
          Left = 220
          Top = 56
          Width = 567
          Height = 62
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 2000
          TabOrder = 1
        end
        object cbRechazoAO: TCheckBox
          Left = 8
          Top = 40
          Width = 97
          Height = 14
          Caption = 'Rechazo'
          TabOrder = 2
          OnClick = cbRechazoAOClick
        end
        object cbIncompleto: TCheckBox
          Left = 8
          Top = 66
          Width = 97
          Height = 17
          Caption = 'Incompleto'
          TabOrder = 3
          OnClick = cbIncompletoClick
        end
        object cbFaltanFirmas: TCheckBox
          Left = 8
          Top = 82
          Width = 97
          Height = 17
          Caption = 'Faltan Firmas'
          TabOrder = 4
          OnClick = cbFaltanFirmasClick
        end
        object cbContratoInactivo: TCheckBox
          Left = 8
          Top = 98
          Width = 104
          Height = 17
          Caption = 'Contrato Inactivo'
          TabOrder = 5
          OnClick = cbContratoInactivoClick
        end
        object edFechaRechazoAO: TDateComboBox
          Left = 98
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 6
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 129
        Width = 793
        Height = 177
        Align = alTop
        Caption = ' Programa de Seguridad '
        TabOrder = 1
        DesignSize = (
          793
          177)
        object Label36: TLabel
          Left = 9
          Top = 19
          Width = 76
          Height = 13
          Caption = 'Fecha Rechazo'
        end
        object edFechaRechazoPS: TDateComboBox
          Left = 98
          Top = 15
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object cbRechazoPS: TCheckBox
          Left = 8
          Top = 41
          Width = 97
          Height = 17
          Caption = 'Rechazo'
          TabOrder = 1
          OnClick = cbRechazoPSClick
        end
        object clRechazosProgramaSeguridad: TARTCheckListBox
          Left = 10
          Top = 68
          Width = 764
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          BevelEdges = []
          Columns = 2
          ItemHeight = 13
          TabOrder = 2
          OnClick = clRechazosProgramaSeguridadClick
          AutoAjustarColumnas = False
          Locked = False
          SQL = 
            'SELECT tb_descripcion, tb_codigo FROM art.ctb_tablas WHERE tb_cl' +
            'ave = '#39'RECPS'#39' AND tb_codigo <> '#39'00'#39
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 384
    Top = -1
    Width = 210
    Height = 28
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object ToolBar5: TToolBar
      Left = 1
      Top = 1
      Width = 208
      Height = 26
      Align = alNone
      BorderWidth = 1
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevo: TToolButton
        Left = 0
        Top = 0
        Caption = 'tbNuevo'
        ImageIndex = 6
        OnClick = tbNuevoClick
      end
      object ToolButton7: TToolButton
        Left = 23
        Top = 0
        Width = 4
        Caption = 'ToolButton7'
        ImageIndex = 45
        Style = tbsSeparator
      end
      object tbEliminar: TToolButton
        Left = 27
        Top = 0
        Hint = 'Eliminar Aviso de Obra'
        Caption = 'tbDiagRefrescar'
        ImageIndex = 8
        OnClick = tbEliminarClick
      end
      object ToolButton4: TToolButton
        Left = 50
        Top = 0
        Width = 6
        Caption = 'ToolButton4'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbResolucion: TToolButton
        Left = 56
        Top = 0
        Hint = 'Formulario Resoluci'#243'n'
        Caption = 'tbResolucion'
        ImageIndex = 44
        OnClick = tbResolucionClick
      end
      object ToolButton6: TToolButton
        Left = 79
        Top = 0
        Width = 6
        Caption = 'ToolButton6'
        ImageIndex = 45
        Style = tbsSeparator
      end
      object tbProgramasSeguridad: TToolButton
        Left = 85
        Top = 0
        Hint = 'Todos los Programas de Seguridad'
        Caption = 'Todos los Programas de Seguridad'
        ImageIndex = 16
        OnClick = tbProgramasSeguridadClick
      end
      object ToolButton9: TToolButton
        Left = 108
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object tbActividades: TToolButton
        Left = 116
        Top = 0
        Hint = 'Actividades'
        Caption = 'tbActividades'
        ImageIndex = 13
        OnClick = tbActividadesClick
      end
      object tbImpresionFormularioAO: TToolButton
        Left = 139
        Top = 0
        Hint = 'Impresi'#243'n formulario de Aviso de Obra'
        Caption = 'tbImpresionFormularioAO'
        ImageIndex = 4
        OnClick = tbImpresionFormularioAOClick
      end
      object tbEnvioMailAO: TToolButton
        Left = 162
        Top = 0
        Hint = 'Envio Mail AO'
        Caption = 'tbEnvioMailAO'
        ImageIndex = 31
        OnClick = tbEnvioMailAOClick
      end
    end
  end
  object pnlboton: TPanel
    Left = 555
    Top = 1
    Width = 241
    Height = 25
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    DesignSize = (
      241
      25)
    object btnProcesar: TButton
      Left = 86
      Top = 0
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Procesar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnProcesarClick
    end
    object btnRechazar: TButton
      Left = 165
      Top = 0
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Rechazar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnRechazarClick
    end
  end
  object fpMotivoRechazo: TFormPanel
    Left = 437
    Top = 219
    Width = 443
    Height = 75
    Hint = 'Motivo Rechazo'
    Caption = 'Motivo Rechazo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      443
      75)
    object Bevel5: TBevel
      Left = 4
      Top = 39
      Width = 435
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label49: TLabel
      Left = 9
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Motivo Rechazo:'
    end
    object btnAceptarCambioTipoPrev: TButton
      Left = 281
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarCambioTipoPrevClick
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
    inline fraMotivoRechazo: TfraCodigoDescripcion
      Left = 96
      Top = 9
      Width = 341
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 96
      ExplicitTop = 9
      ExplicitWidth = 341
      DesignSize = (
        341
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 276
        ExplicitWidth = 276
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
  end
  object cdsRegistros: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end
      item
        Name = 'IdVisita'
        DataType = ftInteger
      end
      item
        Name = 'Obligatorio'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FechaDesde'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'cdsRegistrosIndex1'
        Fields = 'Fecha'
      end>
    IndexName = 'cdsRegistrosIndex1'
    Params = <>
    StoreDefs = True
    AfterPost = cdsRegistrosAfterPost
    AfterDelete = cdsRegistrosAfterDelete
    Left = 1324
    Top = 540
    object cdsRegistrosFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object cdsRegistrosIdVisita: TIntegerField
      FieldName = 'IdVisita'
    end
    object cdsRegistrosObligatorio: TStringField
      DisplayWidth = 10
      FieldName = 'Obligatorio'
      Size = 10
    end
    object cdsRegistrosFechaDesde: TDateTimeField
      FieldName = 'FechaDesde'
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsRegistros
    Left = 1324
    Top = 576
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 216
    Top = 576
  end
end
