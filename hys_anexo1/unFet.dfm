object frmFet: TfrmFet
  Left = 465
  Top = 150
  Caption = ' '
  ClientHeight = 681
  ClientWidth = 936
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object panComandosFET: TPanel
    Left = 0
    Top = 650
    Width = 936
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      936
      31)
    object lblModoConsulta: TLabel
      Left = 519
      Top = 2
      Width = 251
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 
        'El operativo no es el '#250'ltimo - Modo Consulta     (los cambios no' +
        ' podr'#225'n ser guardados)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      WordWrap = True
      ExplicitLeft = 383
    end
    object btnEliminar: TButton
      Left = 89
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Eliminar'
      Enabled = False
      TabOrder = 1
      OnClick = btnEliminarClick
    end
    object btnGuardar: TButton
      Left = 777
      Top = 3
      Width = 75
      Height = 25
      Hint = 'Ctrl + G'
      Anchors = [akRight, akBottom]
      Caption = '&Guardar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnGuardarClick
    end
    object btnLimpiar: TButton
      Left = 857
      Top = 3
      Width = 75
      Height = 25
      Hint = 'Ctrl + L'
      Anchors = [akRight, akBottom]
      Caption = '&Limpiar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnLimpiarClick
    end
    object btnExportado: TButton
      Left = 6
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'No E&xportar'
      Enabled = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnExportadoClick
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 168
    Width = 936
    Height = 482
    ActivePage = tsVisitas
    Align = alClient
    TabOrder = 1
    OnChange = PageControlChange
    object tsAnexo1: TTabSheet
      Caption = 'Anexo 1'
      object pnlGrupoBasico: TPanel
        Left = 0
        Top = 0
        Width = 928
        Height = 454
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 1
        Visible = False
        object Label1: TLabel
          Left = 4
          Top = 8
          Width = 216
          Height = 13
          Caption = 'Cantidad de Trabajadores del Establecimiento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edGBasCantTrab: TIntEdit
          Left = 232
          Top = 4
          Width = 121
          Height = 21
          TabOrder = 0
        end
      end
      object ScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 928
        Height = 454
        Align = alClient
        TabOrder = 0
        object pnl1: TPanel
          Left = 0
          Top = 98
          Width = 907
          Height = 56
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object lbItem1: TLabel
            Left = 4
            Top = 10
            Width = 428
            Height = 13
            Caption = 
              '1 - Cantidad de visitas realizadas por la ART al Establecimiento' +
              ' (en materia de prevenci'#243'n):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edItem1: TIntEdit
            Left = 24
            Top = 28
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 6
          end
        end
        object pnl100: TPanel
          Left = 0
          Top = 203
          Width = 907
          Height = 96
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          OnClick = btnAceptarConstanciaClick
          object lbItem4: TLabel
            Left = 4
            Top = 1
            Width = 430
            Height = 13
            Caption = 
              '4 - '#191'Cu'#225'ntas personas trabajaron en promedio los '#250'ltimos seis me' +
              'ses en el establecimiento?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbItem5: TLabel
            Left = 4
            Top = 53
            Width = 435
            Height = 13
            Caption = 
              '5 - '#191'C'#250'antas enfermedades profesionales han denunciado a la ART ' +
              'durante el a'#241'o anterior?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object nbItem4: TNotebook
            Left = 16
            Top = 16
            Width = 259
            Height = 36
            TabOrder = 0
            object TPage
              Left = 0
              Top = 0
              Caption = 'Anexo 1'
              object lblTotalTrabajadores: TLabel
                Left = 7
                Top = 0
                Width = 24
                Height = 13
                Caption = 'Total'
              end
              object lblItem4_1: TLabel
                Left = 95
                Top = 0
                Width = 35
                Height = 13
                Caption = 'Propios'
              end
              object lblItem4_2: TLabel
                Left = 183
                Top = 0
                Width = 42
                Height = 13
                Caption = 'Terceros'
              end
              object edItem4: TIntEdit
                Left = 8
                Top = 13
                Width = 68
                Height = 21
                TabOrder = 0
                AutoExit = True
                MaxLength = 6
              end
              object edItem4_1: TIntEdit
                Left = 96
                Top = 13
                Width = 68
                Height = 21
                TabOrder = 1
                AutoExit = True
                MaxLength = 6
              end
              object edItem4_2: TIntEdit
                Left = 184
                Top = 13
                Width = 68
                Height = 21
                TabOrder = 2
                AutoExit = True
                MaxLength = 6
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Anexo 3'
              object rbGroupItem4: TRadioGroup
                Left = 4
                Top = -3
                Width = 113
                Height = 35
                Columns = 2
                Items.Strings = (
                  'Si'
                  'No')
                TabOrder = 0
                TabStop = True
              end
            end
          end
          object edItem5: TIntEdit
            Left = 24
            Top = 74
            Width = 68
            Height = 21
            TabOrder = 1
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl7: TPanel
          Left = 0
          Top = 606
          Width = 907
          Height = 98
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 12
          object lblItem7: TLabel
            Left = 4
            Top = 10
            Width = 599
            Height = 26
            Caption = 
              '7 - Indique la cantidad de horas hombres trabajadas, la cantidad' +
              ' de d'#237'as no trabajados por accidentes de trabajo (sin incluir la' +
              's acciones in itinere), la cantidad de trabajadoras y trabajador' +
              'es en el a'#241'o calendario anterior.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label2: TLabel
            Left = 40
            Top = 44
            Width = 121
            Height = 13
            Caption = 'Horas hombre trabajadas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 40
            Top = 68
            Width = 81
            Height = 26
            Caption = 'Cantidad de d'#237'as no trabajados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label4: TLabel
            Left = 248
            Top = 44
            Width = 153
            Height = 13
            Caption = 'Cantidad de trabajadoras (Fem.):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 248
            Top = 75
            Width = 156
            Height = 13
            Caption = 'Cantidad de trabajadores(Masc.):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edHorasHombre: TIntEdit
            Left = 168
            Top = 41
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 6
          end
          object edCantidadDiasNoTrabajados: TIntEdit
            Left = 168
            Top = 72
            Width = 68
            Height = 21
            TabOrder = 1
            AutoExit = True
            MaxLength = 6
          end
          object edCantidadtrabajadorasMujeres: TIntEdit
            Left = 406
            Top = 41
            Width = 68
            Height = 21
            TabOrder = 2
            AutoExit = True
            MaxLength = 6
          end
          object edCantidadtrabajadoresHombres: TIntEdit
            Left = 406
            Top = 72
            Width = 68
            Height = 21
            TabOrder = 3
            AutoExit = True
            MaxLength = 6
          end
        end
        object pnlFicticio: TPanel
          Left = 0
          Top = 0
          Width = 907
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            907
            24)
          object Label17: TLabel
            Left = 789
            Top = 6
            Width = 86
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Establecer Ficticio'
            ExplicitLeft = 653
          end
          object tbarFicticio: TToolBar
            Left = 879
            Top = 0
            Width = 29
            Height = 26
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object btnFicticio: TToolButton
              Left = 0
              Top = 0
              Hint = 'Cargar ficticio'
              Caption = 'Cargar ficticio'
              ImageIndex = 13
              OnClick = btnFicticioClick
            end
          end
        end
        object pnl4: TPanel
          Left = 0
          Top = 61
          Width = 907
          Height = 37
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object lbFecharecepcion: TLabel
            Left = 4
            Top = 1
            Width = 55
            Height = 26
            Caption = '  Fecha '#13#10'Recepci'#243'n:'
          end
          object edFechaRecepcion: TDateEdit
            Left = 66
            Top = 4
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 0
          end
          object rgOrigen: TRadioGroup
            Left = 165
            Top = -2
            Width = 268
            Height = 33
            Caption = 'Origen'
            Columns = 4
            TabOrder = 1
          end
        end
        object pnl5: TPanel
          Left = 0
          Top = 24
          Width = 907
          Height = 37
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lbFechaDeNotificacion: TLabel
            Left = 4
            Top = 1
            Width = 59
            Height = 26
            Caption = ' Fecha de'#13#10'Notificaci'#243'n:'
          end
          object lbFechaInicioActividad: TLabel
            Left = 166
            Top = 1
            Width = 73
            Height = 39
            Caption = 'Fecha de Inicio'#13#10'  de Actividad'#13#10':'
          end
          object lblEmail: TLabel
            Left = 554
            Top = 8
            Width = 29
            Height = 13
            Caption = 'E-Mail'
          end
          object lblTelefono: TLabel
            Left = 345
            Top = 8
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object edFechaNotificacionAnexo: TDateEdit
            Left = 66
            Top = 4
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 0
          end
          object edFechaInicioActividad: TDateEdit
            Left = 248
            Top = 4
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
          end
          object edEMail: TEdit
            Left = 587
            Top = 4
            Width = 169
            Height = 21
            MaxLength = 100
            TabOrder = 2
            OnChange = edEMailChange
          end
          object edTelefono: TEdit
            Left = 366
            Top = 4
            Width = 177
            Height = 21
            MaxLength = 15
            TabOrder = 3
            OnChange = edTelefonoChange
          end
        end
        object pnl2: TPanel
          Left = 0
          Top = 154
          Width = 907
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object lbItem2: TLabel
            Left = 4
            Top = 5
            Width = 352
            Height = 13
            Caption = 
              '2 - '#191'Hace cu'#225'nto que se encuentra en funcionamiento el estableci' +
              'miento?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbMeses: TLabel
            Left = 168
            Top = 28
            Width = 31
            Height = 13
            Caption = 'Meses'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chkItem2: TCheckBox
            Left = 24
            Top = 26
            Width = 109
            Height = 17
            Caption = 'Menos de un A'#241'o :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = chkItem2Click
          end
          object edItem2: TIntEdit
            Left = 139
            Top = 23
            Width = 25
            Height = 21
            TabOrder = 1
            AutoExit = True
            MaxLength = 2
            MaxValue = 12
          end
        end
        object pnl6: TPanel
          Left = 0
          Top = 299
          Width = 907
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 6
          object lbItem6: TLabel
            Left = 4
            Top = 3
            Width = 534
            Height = 13
            Caption = 
              '6 - Cu'#225'ntos trabajadores siniestrados pertencientes al estableci' +
              'miento denunci'#243' a la ART durante el a'#241'o anterior?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edItem6: TIntEdit
            Left = 24
            Top = 19
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl6_1: TPanel
          Left = 0
          Top = 341
          Width = 907
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 7
          object lbItem6_1: TLabel
            Left = 24
            Top = 3
            Width = 383
            Height = 13
            Caption = 
              '6.1 - '#191'Cu'#225'ntos de ellos se encontraban trabajando en el momento ' +
              'del accidente?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edItem6_1: TIntEdit
            Left = 60
            Top = 19
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl6_1_1: TPanel
          Left = 0
          Top = 383
          Width = 907
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 8
          object lbItem6_1_1: TLabel
            Left = 60
            Top = 1
            Width = 551
            Height = 13
            Caption = 
              '6.1.1 - '#191'Cu'#225'ntos de estos trabajadores se ausentaron de su puest' +
              'o de trabajo al menos un d'#237'a y cu'#225'ntos fallecieron?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbItem6_1_1_A: TLabel
            Left = 96
            Top = 25
            Width = 135
            Height = 13
            Caption = 'A - Siniestros con Ausencia :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbItem6_1_1_B: TLabel
            Left = 96
            Top = 49
            Width = 69
            Height = 13
            Caption = 'B - Fallecidos :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edItem6_1_A: TIntEdit
            Left = 232
            Top = 21
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 4
          end
          object edItem6_1_B: TIntEdit
            Left = 232
            Top = 45
            Width = 68
            Height = 21
            TabOrder = 1
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl6_2: TPanel
          Left = 0
          Top = 492
          Width = 907
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 9
          object lbItem6_2: TLabel
            Left = 24
            Top = 4
            Width = 441
            Height = 13
            Caption = 
              '6.2 - De ellos, '#191'cu'#225'ntos se encontraban en el trayecto entre el ' +
              'domicilo y su lugar del trabajo?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edItem6_2: TIntEdit
            Left = 60
            Top = 20
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl6_2_1: TPanel
          Left = 0
          Top = 540
          Width = 907
          Height = 66
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 10
          object lbItem6_2_1: TLabel
            Left = 60
            Top = 3
            Width = 551
            Height = 13
            Caption = 
              '6.2.1 - '#191'Cu'#225'ntos de estos trabajadores se ausentaron de su puest' +
              'o de trabajo al menos un d'#237'a y cu'#225'ntos fallecieron?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbItem6_2_1_A: TLabel
            Left = 96
            Top = 25
            Width = 135
            Height = 13
            Caption = 'A - Siniestros con Ausencia :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbItem6_2_1_B: TLabel
            Left = 96
            Top = 48
            Width = 69
            Height = 13
            Caption = 'B - Fallecidos :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edItem6_2_A: TIntEdit
            Left = 232
            Top = 21
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 4
          end
          object edItem6_2_B: TIntEdit
            Left = 232
            Top = 45
            Width = 68
            Height = 21
            TabOrder = 1
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl6_1_2: TPanel
          Left = 0
          Top = 451
          Width = 907
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 11
          object lbl6_1_2: TLabel
            Left = 60
            Top = 3
            Width = 461
            Height = 13
            Caption = 
              '6.1.2 - '#191'Cu'#225'ntos de estos trabajadores se ausentaron de su puest' +
              'o de trabajo diez d'#237'as o menos?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbl6_1_2_A: TLabel
            Left = 96
            Top = 24
            Width = 121
            Height = 13
            Caption = 'A - Siniestros <= 10 d'#237'as :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object editem6_1_2_A: TIntEdit
            Left = 232
            Top = 19
            Width = 68
            Height = 21
            TabOrder = 0
            AutoExit = True
            MaxLength = 4
          end
        end
        object pnl8: TPanel
          Left = 0
          Top = 704
          Width = 907
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 13
          object gbAmeriraPRS: TGroupBox
            Left = 23
            Top = 5
            Width = 201
            Height = 42
            Caption = 'PRS'
            TabOrder = 0
            object chkNoAmeritaPRS: TCheckBox
              Left = 100
              Top = 16
              Width = 78
              Height = 17
              Alignment = taLeftJustify
              Caption = 'No Amerita'
              TabOrder = 0
              OnClick = chkNoAmeritaPRSClick
            end
            object chkAmeritaPRS: TCheckBox
              Left = 17
              Top = 16
              Width = 64
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Amerita'
              TabOrder = 1
              OnClick = chkAmeritaPRSClick
            end
          end
          object gbAmeritaPAL: TGroupBox
            Left = 233
            Top = 5
            Width = 201
            Height = 42
            Caption = 'PAL'
            Enabled = False
            TabOrder = 1
            object chkNoAmeritaPAL: TCheckBox
              Left = 100
              Top = 16
              Width = 78
              Height = 17
              Alignment = taLeftJustify
              Caption = 'No Amerita'
              TabOrder = 0
              OnClick = chkNoAmeritaPALClick
            end
            object chkAmeritaPAL: TCheckBox
              Left = 17
              Top = 16
              Width = 64
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Amerita'
              TabOrder = 1
              OnClick = chkAmeritaPALClick
            end
          end
        end
      end
    end
    object tsAnexo2: TTabSheet
      Caption = 'Anexo 2'
      ImageIndex = 1
      DesignSize = (
        928
        454)
      object tsAnexos: TPageControl
        Left = 0
        Top = 0
        Width = 928
        Height = 389
        ActivePage = tsAnexoB
        Align = alClient
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 0
        OnChange = tsAnexosChange
        object tsAnexoA: TTabSheet
          Caption = 'Anexo A'
          object lvAnexo2_A: TListView
            Left = 0
            Top = 0
            Width = 920
            Height = 358
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
            SmallImages = ImageList
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = lvAnexo2Click
            OnCustomDrawItem = lvAnexo2CustomDrawItem
            OnKeyPress = lvAnexo2KeyPress
          end
        end
        object tsAnexoB: TTabSheet
          Caption = 'Anexo B'
          ImageIndex = 1
          object lvAnexo2_B: TListView
            Tag = 1
            Left = 0
            Top = 0
            Width = 920
            Height = 358
            Align = alClient
            Color = clBtnFace
            Columns = <
              item
                Caption = 'C'#243'digo'
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
            SmallImages = ImageList
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = lvAnexo2Click
            OnCustomDrawItem = lvAnexo2CustomDrawItem
            OnKeyPress = lvAnexo2KeyPress
          end
        end
        object tsAnexoC: TTabSheet
          Caption = 'Anexo C'
          ImageIndex = 2
          object lvAnexo2_C: TListView
            Tag = 2
            Left = 0
            Top = 0
            Width = 920
            Height = 358
            Align = alClient
            Color = clBtnFace
            Columns = <
              item
                Caption = 'C'#243'digo'
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
            SmallImages = ImageList
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = lvAnexo2Click
            OnCustomDrawItem = lvAnexo2CustomDrawItem
            OnKeyPress = lvAnexo2KeyPress
          end
        end
      end
      object btnAnexo2Copiar: TButton
        Left = 849
        Top = 0
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Copiar de ...'
        TabOrder = 1
        OnClick = btnAnexo2CopiarClick
      end
      object fpCopiarEstableci: TFormPanel
        Left = 24
        Top = 36
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
          Left = 4
          Top = 6
          Width = 519
          Height = 47
          TabOrder = 2
          ExplicitLeft = 4
          ExplicitTop = 6
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
      object ToolBar3: TToolBar
        Left = 235
        Top = 0
        Width = 89
        Height = 26
        Align = alNone
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        object tbAnexo2Vacio: TToolButton
          Left = 0
          Top = 0
          Hint = 'Impresi'#243'n Anexo II/IV Vacio'
          Caption = 'Impresi'#243'n Anexo II/IV Vacio'
          ImageIndex = 27
          OnClick = tbAnexo2VacioClick
        end
        object tbAnexo2: TToolButton
          Left = 23
          Top = 0
          Hint = 'Impresi'#243'n Anexo II/IV'
          Caption = 'Impresi'#243'n Anexo II/IV'
          ImageIndex = 44
          OnClick = tbAnexo2Click
        end
        object tbLimpiar: TToolButton
          Left = 46
          Top = 0
          Caption = 'tbLimpiar'
          ImageIndex = 1
          OnClick = tbLimpiarClick
        end
      end
      object pnFechaRecepcionAnexo2: TPanel
        Left = 332
        Top = 0
        Width = 255
        Height = 26
        BevelOuter = bvNone
        TabOrder = 4
        object lbFechaRecepcionAnexo2: TLabel
          Left = 2
          Top = 5
          Width = 88
          Height = 13
          Caption = 'Fecha Recepci'#243'n:'
        end
        object edFechaRecepcionAnexo2: TDateEdit
          Left = 97
          Top = 2
          Width = 98
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object pnNivelFirmaAnexo2: TPanel
        Left = 0
        Top = 389
        Width = 928
        Height = 65
        Align = alBottom
        TabOrder = 5
        Visible = False
        object Label21: TLabel
          Left = 6
          Top = 7
          Width = 67
          Height = 13
          Caption = 'Nivel de Firma'
        end
        object chkNivelFirmas: TCheckListBox
          Left = 3
          Top = 26
          Width = 771
          Height = 29
          OnClickCheck = chkNivelFirmasClickCheck
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
        end
        object cbSinFirmasAnexo2: TCheckBox
          Left = 84
          Top = 5
          Width = 97
          Height = 17
          Caption = 'Sin Firmas'
          TabOrder = 1
          OnClick = cbSinFirmasAnexo2Click
        end
      end
    end
    object tsPRS: TTabSheet
      Caption = 'PRS'
      ImageIndex = 2
      object fpConstancias: TFormPanel
        Left = 234
        Top = 15
        Width = 268
        Height = 120
        Caption = 'Generar Constancia'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderStyle = bsToolWindow
        Position = poMainFormCenter
        DesignSize = (
          268
          120)
        object Bevel6: TBevel
          Left = 4
          Top = 77
          Width = 258
          Height = 7
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label19: TLabel
          Left = 108
          Top = 53
          Width = 58
          Height = 13
          Caption = 'Fecha Visita'
        end
        object chkMedidas: TCheckBox
          Left = 18
          Top = 12
          Width = 211
          Height = 17
          Caption = 'Medidas'
          TabOrder = 0
        end
        object chkPRSPAPE: TCheckBox
          Left = 18
          Top = 36
          Width = 79
          Height = 17
          Caption = 'PRS/PAPE'
          TabOrder = 1
        end
        object btnAceptarConstancia: TButton
          Left = 103
          Top = 87
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnAceptarConstanciaClick
        end
        object btnCancelaConstancia: TButton
          Left = 184
          Top = 87
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object dedFechaVisita: TDateEdit
          Left = 171
          Top = 50
          Width = 88
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
        end
        object chkPal: TCheckBox
          Left = 18
          Top = 56
          Width = 89
          Height = 17
          Caption = 'PAL'
          TabOrder = 2
        end
      end
    end
    object tsPAL: TTabSheet
      Caption = 'PAL'
      ImageIndex = -1
    end
    object tsVisitas: TTabSheet
      Caption = 'Visitas'
      ImageIndex = 5
      object pnlHeaderVisitas: TPanel
        Left = 0
        Top = 0
        Width = 928
        Height = 34
        Align = alTop
        TabOrder = 0
        DesignSize = (
          928
          34)
        object chkTodosOps: TCheckBox
          Left = 8
          Top = 9
          Width = 125
          Height = 17
          Caption = 'Todos los Operativos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object btCambioVisita: TButton
          Left = 847
          Top = 5
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Cambio Visita'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnClick = btCambioVisitaClick
        end
      end
      object tbarVisitas: TToolBar
        Left = 0
        Top = 34
        Width = 928
        Height = 26
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object btnRefrescarVisitas: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          Caption = 'tbDiagRefrescar'
          ImageIndex = 0
          OnClick = btnRefrescarVisitasClick
        end
        object ToolButton3: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnNuevaVisita: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          Caption = 'tbDiagAgregar'
          ImageIndex = 6
          OnClick = btnNuevaVisitaClick
        end
        object btnModifVisita: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          ImageIndex = 7
          OnClick = btnModifVisitaClick
        end
        object btnDeleteVisita: TToolButton
          Left = 77
          Top = 0
          Hint = 'Eliminar (Del)'
          Caption = 'tbDiagQuitar'
          ImageIndex = 8
          OnClick = btnDeleteVisitaClick
        end
        object ToolButton9: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton10: TToolButton
          Left = 108
          Top = 0
          Hint = 'Ordenar (Ctrl+O)'
          Caption = 'tbDiagOrdenar'
          ImageIndex = 2
        end
        object ToolButton11: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object ToolButton12: TToolButton
          Left = 139
          Top = 0
          Hint = 'Exportar (Ctrl+E)'
          Caption = 'tbDiagExportar'
          ImageIndex = 3
        end
        object ToolButton13: TToolButton
          Left = 162
          Top = 0
          Hint = 'Imprimir (Ctrl+I)'
          Caption = 'tbDiagImprimir'
          ImageIndex = 4
        end
        object ToolButton1: TToolButton
          Left = 185
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object tbCambioTipoOperativo: TToolButton
          Left = 193
          Top = 0
          Hint = 'Cambio Tipo y Operativo'
          ImageIndex = 18
          OnClick = btCambioVisitaClick
        end
      end
      object dbgMotivos: TRxDBGrid
        Left = 648
        Top = 60
        Width = 280
        Height = 300
        Align = alRight
        DataSource = dsMotivos
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        RowColor2 = 16776176
        OnGetCellParams = dbgMotivosGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'motivo'
            Title.Alignment = taCenter
            Title.Caption = 'N'#250'mero'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descripcion'
            Title.Alignment = taCenter
            Title.Caption = 'Motivo'
            Width = 697
            Visible = True
          end>
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 60
        Width = 648
        Height = 300
        Align = alClient
        DataSource = dsVisitas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = btnModifVisitaClick
        IniStorage = FormStorage
        RowColor2 = 16776176
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'rv_id'
            Title.Alignment = taCenter
            Title.Caption = 'Visita'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rv_idvisitaasociada'
            Title.Alignment = taCenter
            Title.Caption = 'Visita Asoc.'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'estvisitaasoc'
            Title.Alignment = taCenter
            Title.Caption = 'Estab.'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'rv_fecha'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'it_nombre'
            Title.Alignment = taCenter
            Title.Caption = 'Preventor'
            Width = 206
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'rv_operativo'
            Title.Alignment = taCenter
            Title.Caption = 'Operativo'
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'rv_tipo'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo Empresa'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RV_FECHANOTIFICACION'
            Title.Caption = 'Fecha Notificaci'#243'n'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RV_FECHAVIATICOS'
            Title.Caption = 'F.Recepci'#243'n Visita'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RV_FECHAALTA'
            Title.Caption = 'Fecha de Alta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RV_USUALTA'
            Title.Caption = 'Usuario de Alta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fechadig'
            Title.Caption = 'Fecha Digitalizaci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rv_traspaso'
            Title.Caption = 'Traspaso'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rv_usuauditado'
            Title.Caption = 'Usuario de auditoria'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rv_fechaauditado'
            Title.Caption = 'Fecha de auditoria'
            Visible = True
          end>
      end
      object panObservaciones: TPanel
        Left = 0
        Top = 360
        Width = 928
        Height = 94
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        object Label10: TLabel
          Left = 0
          Top = 0
          Width = 928
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Observaciones'
          Layout = tlCenter
          ExplicitWidth = 71
        end
        object redObservaciones: TRichEdit
          Left = 0
          Top = 13
          Width = 928
          Height = 47
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object redObservacionesInterna: TRichEdit
          Left = 0
          Top = 60
          Width = 928
          Height = 30
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
      object fpAsociarVisita: TFormPanel
        Left = 125
        Top = 64
        Width = 421
        Height = 383
        Caption = 'Asociar Visita'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = []
        Position = poOwnerFormCenter
        DesignSize = (
          421
          383)
        object Bevel8: TBevel
          Left = 4
          Top = 347
          Width = 414
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object lblestablecimientos: TLabel
          Left = 12
          Top = 8
          Width = 82
          Height = 13
          Caption = 'Establecimientos:'
        end
        object Label20: TLabel
          Left = 16
          Top = 147
          Width = 40
          Height = 13
          Caption = 'Motivos:'
        end
        object btnAceptarCambioPreventor: TButton
          Left = 264
          Top = 353
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
          OnClick = btnAceptarCambioPreventorClick
        end
        object btnCancelarCambioPreventor: TButton
          Left = 342
          Top = 353
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
          OnClick = btnCancelarCambioPreventorClick
        end
        object clbestablecimientos: TARTCheckListBox
          Left = 12
          Top = 25
          Width = 401
          Height = 119
          Anchors = [akLeft, akTop, akRight]
          Columns = 1
          ItemHeight = 13
          TabOrder = 2
          AutoAjustarColumnas = True
          Locked = False
          SQL = 'SELECT 1,2 from dual'
        end
        object Button3: TButton
          Left = 12
          Top = 352
          Width = 101
          Height = 26
          Anchors = [akLeft, akBottom]
          Caption = 'Seleccionar Todo'
          TabOrder = 3
          OnClick = Button3Click
        end
        object cbCopiarMotivosVisita: TButton
          Left = 292
          Top = 145
          Width = 118
          Height = 19
          Caption = 'Copiar motivos visita'
          TabOrder = 4
          TabStop = False
          OnClick = cbCopiarMotivosVisitaClick
        end
        object cbMotivosAsociarVisita: TARTCheckListBox
          Left = 12
          Top = 161
          Width = 401
          Height = 182
          OnClickCheck = cbMotivosClickCheck
          Anchors = [akLeft, akTop, akRight]
          Columns = 2
          ItemHeight = 13
          TabOrder = 5
          AutoAjustarColumnas = False
          Locked = False
          SQL = 'SELECT 1,2 from dual'
        end
      end
      object fpVisita: TFormPanel
        Left = 228
        Top = -40
        Width = 573
        Height = 506
        Caption = 'Carga de Visitas'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poScreenCenter
        KeyPreview = True
        OnKeyDown = fpVisitaKeyDown
        DesignSize = (
          573
          506)
        object Bevel4: TBevel
          Left = 4
          Top = 467
          Width = 565
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
          ExplicitTop = 442
        end
        object Label18: TLabel
          Left = 8
          Top = 352
          Width = 60
          Height = 26
          Caption = 'Observaci'#243'n     Interna:'
          WordWrap = True
        end
        object lbArchivoOrigen: TLabel
          Left = 17
          Top = 413
          Width = 39
          Height = 26
          Caption = 'Archivo '#13#10' Origen'
        end
        object btnAceptarVisita: TButton
          Left = 415
          Top = 474
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnAceptarVisitaClick
        end
        object btnCancelar: TButton
          Left = 492
          Top = 474
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object pnlDatos: TPanel
          Left = 0
          Top = 0
          Width = 573
          Height = 355
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            573
            355)
          object Label9: TLabel
            Left = 8
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Fecha Visita:'
          end
          object Label8: TLabel
            Left = 8
            Top = 56
            Width = 49
            Height = 13
            Caption = 'Preventor:'
          end
          object Label15: TLabel
            Left = 8
            Top = 114
            Width = 40
            Height = 13
            Caption = 'Motivos:'
          end
          object Label16: TLabel
            Left = 8
            Top = 299
            Width = 63
            Height = 13
            Caption = 'Observaci'#243'n:'
          end
          object lbFechaNotificacion: TLabel
            Left = 163
            Top = 8
            Width = 68
            Height = 13
            Caption = 'F.Notificaci'#243'n:'
          end
          object Label14: TLabel
            Left = 8
            Top = 77
            Width = 62
            Height = 29
            AutoSize = False
            Caption = 'F.Recepci'#243'n Visita:'
            WordWrap = True
          end
          object lbFechaViaticos: TLabel
            Left = 8
            Top = 25
            Width = 43
            Height = 26
            Caption = ' Fecha'#13#10'Vi'#225'ticos :'
          end
          object lbFechaViaticosHasta: TLabel
            Left = 178
            Top = 32
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          inline fraPreventorVisita: TfraCodigoDescripcionExt
            Left = 71
            Top = 51
            Width = 339
            Height = 23
            TabOrder = 6
            ExplicitLeft = 71
            ExplicitTop = 51
            ExplicitWidth = 339
            DesignSize = (
              339
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 274
              CharCase = ecUpperCase
              OnDropDown = fraPreventorVisitacmbDescripcionDropDown
              ExplicitWidth = 274
            end
            inherited edCodigo: TPatternEdit
              CharCase = ecNormal
            end
          end
          object edObservacion: TMemo
            Left = 72
            Top = 297
            Width = 489
            Height = 53
            TabOrder = 10
          end
          object edFechaVisita: TDateEdit
            Left = 72
            Top = 4
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 0
            OnChange = edFechaVisitaChange
          end
          object edFechaNotificacion: TDateEdit
            Left = 235
            Top = 4
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
          end
          object ToolBar2: TToolBar
            Left = 176
            Top = 76
            Width = 29
            Height = 26
            Align = alNone
            BorderWidth = 1
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            object btnFechaViaticos: TToolButton
              Left = 0
              Top = 0
              Hint = 'Ult.F.Recepci'#243'n Visita(Ctrl+R)'
              Caption = 'tbDiagRefrescar'
              ImageIndex = 14
              OnClick = btnFechaViaticosClick
            end
          end
          object edFechaViaticos: TDateEdit
            Left = 72
            Top = 79
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 8
          end
          object edFechaInicioViaticos: TDateEdit
            Left = 72
            Top = 28
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 3
          end
          object edFechaFinViaticos: TDateEdit
            Left = 236
            Top = 28
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 4
          end
          object cbAnclarViaticos: TCheckBox
            Left = 329
            Top = 29
            Width = 92
            Height = 17
            Caption = 'Anclar Vi'#225'ticos'
            TabOrder = 5
          end
          object cbVerificarPreventor: TCheckBox
            Left = 413
            Top = 53
            Width = 110
            Height = 17
            Caption = 'Verificar Preventor'
            TabOrder = 7
          end
          object chkVerTodas: TCheckBox
            Left = 452
            Top = 88
            Width = 69
            Height = 19
            TabStop = False
            Alignment = taLeftJustify
            Caption = 'Ver &Todas'
            TabOrder = 11
            OnClick = chkVerTodasClick
          end
          object cbMotivos: TARTCheckListBox
            Left = 72
            Top = 112
            Width = 489
            Height = 182
            OnClickCheck = cbMotivosClickCheck
            Anchors = [akLeft, akTop, akRight]
            Columns = 2
            ItemHeight = 13
            TabOrder = 12
            AutoAjustarColumnas = False
            Locked = False
            SQL = 'SELECT 1,2 from dual'
          end
          object chkTraspaso: TCheckBox
            Left = 329
            Top = 5
            Width = 68
            Height = 17
            Caption = 'Traspaso'
            TabOrder = 2
            OnClick = chkTraspasoClick
          end
        end
        object edObservacionInterna: TMemo
          Left = 72
          Top = 356
          Width = 489
          Height = 53
          TabOrder = 1
        end
        object tbVisitaAsoc: TToolBar
          Left = 9
          Top = 386
          Width = 61
          Height = 26
          Align = alNone
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object btnAsociarVisita: TToolButton
            Left = 0
            Top = 0
            Hint = 'Asociar visitas'
            Caption = 'tbDiagRefrescar'
            ImageIndex = 22
            OnClick = btnAsociarVisitaClick
          end
          object ToolButton5: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnLimpiarVisita: TToolButton
            Left = 31
            Top = 0
            Hint = 'Limpiar visitas'
            ImageIndex = 1
            OnClick = btnLimpiarVisitaClick
          end
        end
        object edOrigen: TFilenameEdit
          Left = 73
          Top = 417
          Width = 488
          Height = 21
          AcceptFiles = True
          Filter = 'Archivos Excel y Texto|*.xls;*.txt;*.log'
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 2
          Visible = False
        end
        object cbAuditado: TCheckBox
          Left = 9
          Top = 445
          Width = 78
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Auditado'
          TabOrder = 6
        end
      end
    end
    object tbEmpleadores: TTabSheet
      Caption = 'Empleadores Contratantes'
      ImageIndex = 4
      object dbgEmpresasContratantes: TRxDBGrid
        Left = 0
        Top = 26
        Width = 928
        Height = 428
        Align = alClient
        DataSource = dsEmpresasContratantes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        RowColor2 = 16776176
        OnGetCellParams = dbgEmpresasContratantesGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'EC_CUITCONTRATANTE'
            Title.Caption = 'CUIT'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EC_NOMBRE'
            Title.Caption = 'Nombre'
            Width = 634
            Visible = True
          end>
      end
      object fpEmpresasContratantes: TFormPanel
        Left = 191
        Top = 58
        Width = 377
        Height = 99
        Caption = 'Agregar Detalles de Denuncia'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poScreenCenter
        DesignSize = (
          377
          99)
        object lbNombre: TLabel
          Left = 8
          Top = 40
          Width = 40
          Height = 13
          Caption = 'Nombre:'
        end
        object Bevel3: TBevel
          Left = 4
          Top = 66
          Width = 369
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label7: TLabel
          Left = 8
          Top = 12
          Width = 28
          Height = 13
          Caption = 'CUIT:'
        end
        object btnDetDenAceptar: TButton
          Left = 219
          Top = 70
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
          OnClick = btnDetDenAceptarClick
        end
        object btnDetDenCancelar: TButton
          Left = 296
          Top = 70
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object mskCUITContrante: TMaskEdit
          Left = 57
          Top = 8
          Width = 81
          Height = 21
          EditMask = '99-99999999-c;0;'
          MaxLength = 13
          TabOrder = 2
        end
        object edNombreContratante: TEdit
          Left = 57
          Top = 36
          Width = 304
          Height = 21
          MaxLength = 60
          TabOrder = 3
        end
      end
      object tBarDiagEstableci: TToolBar
        Left = 0
        Top = 0
        Width = 928
        Height = 26
        BorderWidth = 1
        Caption = 'tBarEmpleContratantes'
        HotImages = ilToolBar_Color
        Images = ilToolBar_BN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object tbDiagRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          Caption = 'tbDiagRefrescar'
          ImageIndex = 0
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbAgregarEmp: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          Caption = 'tbAgregarEmp'
          ImageIndex = 1
          OnClick = tbAgregarEmpClick
        end
        object tbModificarEmp: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          ImageIndex = 2
          OnClick = tbModificarEmpClick
        end
        object tbEmpQuitar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Eliminar (Del)'
          Caption = 'tbEmpQuitar'
          ImageIndex = 3
          OnClick = tbEmpQuitarClick
        end
        object ToolButton4: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbDiagOrdenar: TToolButton
          Left = 108
          Top = 0
          Hint = 'Ordenar (Ctrl+O)'
          Caption = 'tbDiagOrdenar'
          ImageIndex = 4
        end
        object ToolButton6: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbDiagExportar: TToolButton
          Left = 139
          Top = 0
          Hint = 'Exportar (Ctrl+E)'
          Caption = 'tbDiagExportar'
          ImageIndex = 5
        end
        object tbDiagImprimir: TToolButton
          Left = 162
          Top = 0
          Hint = 'Imprimir (Ctrl+I)'
          Caption = 'tbDiagImprimir'
          ImageIndex = 6
        end
      end
    end
    object tsPlanMej: TTabSheet
      Caption = 'Medidas Correctivas'
      ImageIndex = 6
    end
    object tsDenIncumplimiento: TTabSheet
      Caption = 'Denuncia de Incumplimiento'
      ImageIndex = 4
    end
    object tsObras: TTabSheet
      Caption = 'Aviso Obra'
      ImageIndex = 7
    end
    object tsCapacitacion: TTabSheet
      Caption = 'Capacitaci'#243'n'
      ImageIndex = 8
    end
    object tsRiesgos: TTabSheet
      Caption = 'Riesgos'
      ImageIndex = 9
    end
    object tsEventos: TTabSheet
      Caption = 'Eventos'
      ImageIndex = 10
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 142
    Width = 936
    Height = 26
    BorderWidth = 1
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object btnBuscar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Refrescar (F5)'
      Caption = 'Buscar'
      ImageIndex = 0
      OnClick = btnBuscarClick
    end
    object tbEstablecimientos: TToolButton
      Left = 23
      Top = 0
      Hint = 'Establecimientos (F6)'
      Caption = 'tbEstablecimientos'
      ImageIndex = 14
      Visible = False
      OnClick = tbEstablecimientosClick
    end
    object tbAfiliaciones: TToolButton
      Left = 46
      Top = 0
      Hint = 'Afiliaciones (F7)'
      Caption = 'Afiliaciones'
      ImageIndex = 15
      OnClick = tbAfiliacionesClick
    end
    object tbCargaDiferida: TToolButton
      Left = 69
      Top = 0
      Caption = 'tbCargaDiferida'
      ImageIndex = 45
      OnClick = tbCargaDiferidaClick
    end
    object tbHistoricoPlanMejoras: TToolButton
      Left = 92
      Top = 0
      Hint = 'Historico Plan de Mejoras'
      Caption = 'HistoricoPlanMejoras'
      Enabled = False
      ImageIndex = 43
      OnClick = tbHistoricoPlanMejorasClick
    end
    object tbConstanciaVistasVacia: TToolButton
      Left = 115
      Top = 0
      Hint = 'Constancia de Visitas Vacia'
      Caption = 'Constancia de Visitas Vacia'
      ImageIndex = 27
      OnClick = tbConstanciaVistasVaciaClick
    end
    object tbConstanciaVisitas: TToolButton
      Left = 138
      Top = 0
      Hint = 'Constancia de Visitas'
      Caption = 'Constancia de Visitas'
      ImageIndex = 44
      OnClick = tbConstanciaVisitasClick
    end
    object tbUltmimoRegDom: TToolButton
      Left = 161
      Top = 0
      Hint = 'Domicilio de Explotaci'#243'n'
      Caption = 'tbUltmimoRegDom'
      ImageIndex = 49
      OnClick = tbUltmimoRegDomClick
    end
    object tbSeparator: TToolButton
      Left = 184
      Top = 0
      Width = 8
      Caption = 'tbSeparator'
      ImageIndex = 32
      Style = tbsSeparator
    end
    object tbImpresionVerosimilitud: TToolButton
      Left = 192
      Top = 0
      Hint = 'Impresi'#243'n Formulario Empresas'
      Caption = 'tbVerosimilitud'
      ImageIndex = 44
      OnClick = tbImpresionVerosimilitudClick
    end
    object tbImpresionPreventor: TToolButton
      Left = 215
      Top = 0
      Hint = 'Impresi'#243'n Resoluci'#243'n Preventor'
      ImageIndex = 40
      Visible = False
      OnClick = tbImpresionPreventorClick
    end
    object tbAnexoItemsNo: TToolButton
      Left = 238
      Top = 0
      Hint = 'Imprimir Visita Items No'
      Caption = 'tbAnexoItemsNo'
      ImageIndex = 41
      OnClick = tbAnexoItemsNoClick
    end
    object tbCargaRelevPreventor: TToolButton
      Left = 261
      Top = 0
      Hint = 'Carga Relevamiento Preventor 463(F9)'
      ImageIndex = 16
      OnClick = tbCargaRelevPreventorClick
    end
    object tbRelevRiesgo463: TToolButton
      Left = 284
      Top = 0
      Hint = 'Relevamiento de Riesgos Laborales'
      ImageIndex = 22
      OnClick = tbRelevRiesgo463Click
    end
    object tbImportacionNomina: TToolButton
      Left = 307
      Top = 0
      Hint = 'Importaci'#243'n Nomina'
      Caption = 'tbImportacionNomina'
      ImageIndex = 26
      OnClick = tbImportacionNominaClick
    end
    object tbSumario: TButton
      Left = 330
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Sumarios'
      TabOrder = 0
      OnClick = tbSumarioClick
    end
    object lbTipoEmpresa: TLabel
      Left = 405
      Top = 0
      Width = 68
      Height = 22
      Caption = 'Tipo Empresa:'
    end
  end
  object fpNoExportar: TFormPanel
    Left = 456
    Top = 455
    Width = 223
    Height = 175
    Caption = 'No Exportar'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsToolWindow
    Position = poOwnerFormCenter
    OnShow = fpNoExportarShow
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    DesignSize = (
      223
      175)
    object Bevel5: TBevel
      Left = 4
      Top = 139
      Width = 215
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Button1: TButton
      Left = 65
      Top = 145
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 143
      Top = 145
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object clbNoExportar: TARTCheckListBox
      Left = 0
      Top = 0
      Width = 223
      Height = 136
      Align = alTop
      ItemHeight = 13
      Items.Strings = (
        'Anexo 3'
        'Anexo 4'
        'Diagn'#243'sticos'
        'Recomendaciones'
        'Seguimientos (Visitas)'
        'Denuncias Generales'
        'Aviso  de Obra')
      TabOrder = 2
      AutoAjustarColumnas = True
      Locked = False
    end
  end
  object JvgGroupBox1: TJvgGroupBox
    Left = 0
    Top = 0
    Width = 936
    Height = 142
    Hint = 'Mostrar/Ocultar filtros (Ctrl+F)'
    Align = alTop
    Caption = 'Filtros'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clSilver
    CaptionGradient.Active = False
    CaptionGradient.BufferedDraw = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clWhite
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBlue
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GlyphCollapsed.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
      865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
      3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
      6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
      0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
      F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
      67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
      49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
      FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
      AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
      6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
      EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
      40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
      71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
      FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
      46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
      EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    GlyphExpanded.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
      855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
      A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
      6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
      C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
      F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
      5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
      55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
      FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
      B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
      91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
      E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
      40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
      F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
      FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
      45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
      EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    FullHeight = 139
    object pnlBusqueda: TPanel
      Left = 2
      Top = 16
      Width = 932
      Height = 126
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        932
        126)
      object Bevel1: TBevel
        Left = 0
        Top = 28
        Width = 932
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
        ExplicitWidth = 796
      end
      object Bevel2: TBevel
        Left = 0
        Top = 88
        Width = 902
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
        ExplicitWidth = 766
      end
      object btnInfoEstableci: TSpeedButton
        Left = 905
        Top = 83
        Width = 27
        Height = 10
        Hint = 'Informaci'#243'n del Establecimiento'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          26010000424D2601000000000000360000002800000010000000050000000100
          180000000000F0000000C40E0000C40E00000000000000000000FFFFFF808080
          FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFF
          FF808080FFFFFFFFFFFF808080000000808080FFFFFF808080000000808080FF
          FFFF808080000000808080FFFFFF808080000000808080FFFFFF000000FFFFFF
          000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF0000
          00FFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnInfoEstableciClick
        ExplicitLeft = 769
      end
      object Label13: TLabel
        Left = 5
        Top = 102
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label6: TLabel
        Left = 360
        Top = 102
        Width = 46
        Height = 13
        Caption = 'Operativo'
      end
      object lblCUIT: TLabel
        Left = 4
        Top = 5
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object lbCPostalA: TLabel
        Left = 820
        Top = 40
        Width = 30
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'C.P.A.'
        ExplicitLeft = 684
      end
      object Label11: TLabel
        Left = 826
        Top = 64
        Width = 21
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'CIIU'
        ExplicitLeft = 690
      end
      object Label12: TLabel
        Left = 558
        Top = 102
        Width = 46
        Height = 13
        Caption = 'Preventor'
      end
      inline fraEstableciBusq: TfraEstablecimientoDomic
        Left = -2
        Top = 36
        Width = 822
        Height = 47
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = -2
        ExplicitTop = 36
        ExplicitWidth = 822
        DesignSize = (
          822
          47)
        inherited lbLocalidad: TLabel
          Left = 549
          Width = 46
          ExplicitLeft = 413
          ExplicitWidth = 46
        end
        inherited lbEstableci: TLabel
          Left = 7
          Width = 30
          ExplicitLeft = 7
          ExplicitWidth = 30
        end
        inherited lbCPostal: TLabel
          Left = 745
          Width = 20
          ExplicitLeft = 609
          ExplicitWidth = 20
        end
        inherited lbDomicilio: TLabel
          Left = 7
          Width = 42
          ExplicitLeft = 7
          ExplicitWidth = 42
        end
        inherited lbProvincia: TLabel
          Left = 576
          Width = 44
          ExplicitLeft = 440
          ExplicitWidth = 44
        end
        inherited cmbDescripcion: TArtComboBox [5]
          Left = 100
          Width = 444
          ExplicitLeft = 100
          ExplicitWidth = 444
        end
        inherited edCodigo: TIntEdit [6]
          Left = 48
          ExplicitLeft = 48
        end
        inherited edLocalidad: TEdit
          Left = 608
          Width = 129
          ExplicitLeft = 608
          ExplicitWidth = 129
        end
        inherited edCPostal: TEdit
          Left = 772
          ExplicitLeft = 772
        end
        inherited edDomicilio: TEdit
          Left = 62
          Width = 505
          ExplicitLeft = 62
          ExplicitWidth = 505
        end
        inherited edProvincia: TEdit
          Left = 636
          Width = 182
          ExplicitLeft = 636
          ExplicitWidth = 182
        end
        inherited sdqDatos: TSDQuery
          Left = 144
          Top = 5
        end
        inherited dsDatos: TDataSource
          Left = 115
          Top = 5
        end
      end
      inline fraEmpresa: TfraEmpresa
        Left = 34
        Top = 2
        Width = 899
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
        ExplicitLeft = 34
        ExplicitTop = 2
        ExplicitWidth = 899
        ExplicitHeight = 21
        DesignSize = (
          899
          21)
        inherited lbRSocial: TLabel
          Left = 89
          ExplicitLeft = 89
        end
        inherited lbContrato: TLabel
          Left = 788
          ExplicitLeft = 652
        end
        inherited edContrato: TIntEdit
          Left = 839
          ExplicitLeft = 839
        end
        inherited cmbRSocial: TArtComboBox
          Left = 141
          Width = 634
          ExplicitLeft = 141
          ExplicitWidth = 634
        end
      end
      inline fraTipoFet: TfraCtbTablas
        Left = 32
        Top = 97
        Width = 164
        Height = 23
        TabOrder = 2
        ExplicitLeft = 32
        ExplicitTop = 97
        ExplicitWidth = 164
        DesignSize = (
          164
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 27
          Width = 136
          ExplicitLeft = 27
          ExplicitWidth = 136
        end
        inherited edCodigo: TPatternEdit
          Width = 24
          ExplicitWidth = 24
        end
      end
      inline fraOperativo: TfraCodigoDescripcion
        Left = 410
        Top = 97
        Width = 145
        Height = 23
        TabOrder = 3
        ExplicitLeft = 410
        ExplicitTop = 97
        ExplicitWidth = 145
        DesignSize = (
          145
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 45
          Width = 99
          ExplicitLeft = 45
          ExplicitWidth = 99
        end
        inherited edCodigo: TPatternEdit
          Width = 42
          ExplicitWidth = 42
        end
      end
      object edCPA: TEdit
        Left = 858
        Top = 36
        Width = 72
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
      object edCiuu: TEdit
        Left = 859
        Top = 60
        Width = 72
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object edPreventor: TEdit
        Left = 610
        Top = 98
        Width = 319
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
      end
      object edSubtipo: TEdit
        Left = 196
        Top = 98
        Width = 156
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
      end
    end
  end
  object fpItemsNo: TFormPanel
    Left = 482
    Top = 313
    Width = 210
    Height = 115
    Caption = 'Generar Constancia'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsToolWindow
    Position = poMainFormCenter
    DesignSize = (
      210
      115)
    object Bevel7: TBevel
      Left = 4
      Top = 72
      Width = 200
      Height = 7
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarProcedencia: TButton
      Left = 45
      Top = 82
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarProcedenciaClick
    end
    object btnCancelarProcedencia: TButton
      Left = 126
      Top = 82
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object rgProcedencia: TRadioGroup
      Left = 2
      Top = 3
      Width = 199
      Height = 62
      Caption = 'Procedencia'
      Items.Strings = (
        'Evaluaci'#243'n de Verosimilitud'
        'Verificaci'#243'n de '#237'tems incumplidos')
      TabOrder = 2
    end
  end
  object DBLogin: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    OnLogin = DBLoginLogin
    UseNetworkUser = True
    CheckServerDate = True
    AutoEjecutar = True
    Shake = False
    Left = 152
    Top = 576
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = DBLogin
    OnDisableComponent = SeguridadDisableComponent
    PermitirEdicion = True
    Left = 184
    Top = 576
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 216
    Top = 576
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ET_TIPO, ET_ITEM2, ET_ITEM4, ET_ITEM5, ET_ITEM6, ET_ITEM6' +
        '_1, ET_ITEM6_1_A, ET_ITEM6_1_B, ET_ITEM6_2,'
      
        '       ET_ITEM6_2_A, ET_ITEM6_2_B, ET_FECHABAJA,   ET_ITEM7HORAS' +
        'HOMBRE,'
      
        '       ET_ITEM7DIASNOTRAB,  ET_ITEM7TRABAJADORAS,  ET_ITEM7TRABA' +
        'JADORES,'
      
        '       ET_ITEM4RELAVAMIENTOAR, ET_ITEM1,ET_FECHARECEPCION,ET_IDO' +
        'RIGEN,ET_FECHANOTIFICACION,'
      
        '       ET_ITEM4_1,  ET_ITEM4_2,  ET_ITEM6_1_2_A, ET_TELEFONO, ET' +
        '_EMAIL, ET_AMERITAPRS,'
      '       ET_AMERITAPAL'
      '  FROM PET_EMPRESASTESTIGO'
      ' WHERE ET_CUIT = :pCuit'
      '   AND ET_ESTABLECI = :pEstableci'
      '   AND ET_TIPO = :pTipo'
      '   AND ET_OPERATIVO = :pOperativo')
    Left = 52
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'pCuit'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'pEstableci'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pOperativo'
        ParamType = ptInput
      end>
  end
  object ImageList: TImageList
    Left = 248
    Top = 576
    Bitmap = {
      494C010104000900840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6DEC600A5A5A50084848400008484000084840084848400A5A5A500C6DE
      C600000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00C6C6C600A5A5A5000000FF000000FF00A5A5A500C6C6C600F7FF
      FF00000000000000000000000000000000000000000000000000000000008400
      0000848400008484000084840000848400008484000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      84000000FF000000FF000000FF000000FF000000FF000000FF00000084000000
      840000008400000000000000000000000000000000000000000000000000A5A5
      A50000848400008484000084840000FFFF0000FFFF0000848400008484000084
      8400A5A5A5000000000000000000000000000000000000000000F7FFFF00C6DE
      C600008484000000FF000000FF000000FF000000FF000000FF000000FF000084
      8400C6DEC600F7FFFF0000000000000000000000000084000000848400008484
      0000848400008484000084840000848400008484000084840000840000008400
      00008400000084000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000084000000840000000000000000000000000000000000A5A5A5000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      840000848400A5A5A50000000000000000000000000000000000C6C6C6000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00C6DEC60000000000000000000000000084000000A5A5A500A5A5
      A500848400008484000084840000848400008484000084840000848400008484
      00008400000084000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0000008400000000000000000000000000C6C6C600008484000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000848400C6DEC6000000000000000000F7FFFF00008484000000
      FF000000FF000000FF0000848400008484000000FF000000FF000000FF000000
      FF000000FF0000848400F7FFFF000000000084000000A5A5A500A5A5A5008484
      00008484000084840000FFFFFF00FFFFFF00A5A5A50084840000848400008484
      00008400000084000000840000000000000000008400A5A5A5000000FF000000
      FF00F7FFFF00FFFFFF00F7FFFF000000FF000000FF00F7FFFF00FFFFFF00F7FF
      FF000000FF0000008400000084000000000000000000848484000084840000FF
      FF0000FFFF00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A50000FF
      FF0000FFFF0000848400A5A5A5000000000000000000C6C6C6000000FF000000
      FF000000FF000000FF0000000000008484000000FF000000FF000000FF000000
      FF000000FF000000FF00C6C6C6000000000084000000A5A5A500A5A5A5008484
      0000A5A5A500FFFFFF00FFFFFF00F7FFFF00FFFFFF00A5A5A500848400008484
      00008484000084000000840000000000000000008400A5A5A5000000FF000000
      FF000000FF00F7FFFF00FFFFFF00C6C6C600C6C6C600FFFFFF00F7FFFF000000
      FF000000FF000000FF000000840000000000000000008484840000FFFF0000FF
      FF0000FFFF00A5A5A500C6C6C600C6C6C600C6C6C600C6C6C600A5A5A50000FF
      FF0000FFFF0000848400848484000000000000000000848484000000FF000000
      FF0000FFFF00A5A5A5000000000000848400A5A5A500A5A5A500A5A5A5000000
      FF000000FF000000FF00A5A5A5000000000084000000A5A5A500A5A5A500A5A5
      A500F7FFFF00FFFFFF00CED6D600A5A5A500F7FFFF00FFFFFF00A5A5A5008484
      00008484000084840000840000000000000000008400A5A5A5000000FF000000
      FF000000FF000000FF00C6C6C600FFFFFF00FFFFFF00C6C6C6000000FF000000
      FF000000FF000000FF0000008400000000000000000000848400A5A5A500C6C6
      C600F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00C6C6C600A5A5A5000084840000000000000000000000FF000000FF00A5A5
      A500A5A5A500A5A5A5000000000000000000000000000000000084848400A5A5
      A500A5A5A5000000FF00008484000000000084000000A5A5A500CED6D600A5A5
      A500A5A5A500A5A5A5008484000084840000A5A5A500F7FFFF00FFFFFF00CED6
      D6008484000084840000840000000000000000008400A5A5A5000000FF000000
      FF000000FF000000FF00C6C6C600FFFFFF00FFFFFF00C6C6C6000000FF000000
      FF000000FF000000FF00000084000000000000000000A5A5A500C6C6C600C6DE
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FF
      FF00C6C6C600C6C6C600A5A5A50000000000000000000000FF00A5A5A500A5A5
      A500C6C6C600C6C6C6000000000084848400A5A5A5000084840000000000C6C6
      C600A5A5A500A5A5A500008484000000000084000000A5A5A500CED6D600A5A5
      A5008484000084840000848400008484000084840000A5A5A500FFFFFF00FFFF
      FF00CED6D60084840000840000000000000000008400A5A5A50000FFFF000000
      FF000000FF00F7FFFF00FFFFFF00C6C6C600C6C6C600FFFFFF00F7FFFF000000
      FF000000FF000000FF00000084000000000000000000A5A5A500C6C6C600C6DE
      C600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C600A5A5A5000000000000000000A5A5A500A5A5A500C6C6
      C600C6C6C600C6C6C6000000000084848400A5A5A5008484840000000000C6C6
      C600C6C6C600A5A5A500A5A5A5000000000084000000A5A5A500CED6D600CED6
      D600848400008484000084840000848400008484000084840000848400008484
      000084840000848400008400000000000000000084008484840000FFFF000000
      FF00C6DEC600FFFFFF00F7FFFF000000FF000000FF00F7FFFF00FFFFFF00F7FF
      FF000000FF000000FF00000084000000000000000000A5A5A500C6DEC600C6DE
      C600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6DEC600A5A5A5000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000084000000A5A5A500CED6
      D600A5A5A5008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000000000000000000000008400A5A5A5000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000C6C6C600A5A5A500C6DE
      C600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600A5A5A500C6DEC6000000000000000000C6DEC600A5A5A500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600A5A5A500F7FFFF00000000000000000084000000A5A5A500CED6
      D600CED6D600A5A5A500A5A5A500848484008484000084840000848400008484
      00008484000084000000000000000000000000000000000084000084840000FF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000000000000000000000000000000000A5A5A500C6C6
      C600C6DEC600C6DEC600C6DEC600F7FFFF00F7FFFF00C6DEC600C6DEC600C6DE
      C600C6C6C600A5A5A50000000000000000000000000000000000C6DEC600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6DEC6000000000000000000000000000000000084000000A5A5
      A500A5A5A500CED6D600CED6D600A5A5A500A5A5A50084840000848400008484
      0000840000000000000000000000000000000000000000000000000084000084
      8400A5A5A50000FFFF0000FFFF000000FF000000FF000000FF000000FF000000
      FF0000008400000000000000000000000000000000000000000000000000A5A5
      A500C6C6C600F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00C6C6
      C600A5A5A5000000000000000000000000000000000000000000F7FFFF00C6DE
      C600C6C6C600C6C6C600C6DEC600C6DEC600C6DEC600C6DEC600C6C6C600C6C6
      C600C6DEC600F7FFFF0000000000000000000000000000000000000000008400
      000084000000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500848400008400
      0000840000000000000000000000000000000000000000000000000000000000
      84000000840084848400A5A5A500A5A5A500A5A5A5000000FF000000FF000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600A5A5A500A5A5A500C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600F7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FF81FFFFFFFFFE007E007F00FF00F
      C003C003E007C00380018001C003C00380018001800180010000000080018001
      0000000080018001000000008001800100000000800180010000000080018001
      0000000080018001800180018001800180018001C003C003C003C003E007C003
      E007E007F00FF00FF81FF81FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ilToolBar_Color: TImageList
    Left = 224
    Top = 672
    Bitmap = {
      494C010109000E00840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000C6C6C600C6C6C60084848400000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000C6DEC600C6DE
      C6008484840084848400C6C6C600000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000000000008484840084848400A5A5
      A500C6C6C600C6C6C600C6C6C600000000000000000084848400848484000000
      0000000000008484840000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400A5A5A500C6DEC600C6DE
      C600C6C6C600C6C6C600C6C6C600000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FFFFFF00C6DEC600C6DE
      C600C6C6C600C6C6C600FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00C6DEC600C6DE
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484008484
      8400848484008484840084848400000000000000000000000000848484000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00C6DEC600C6C6C6000000FF0000000000C6C6C600C6C6C600C6C6C6008484
      8400848484008484840084848400000000000000000000000000848484000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00C6C6C600848484000000000084848400FFFFFF00C6DEC600C6DE
      C600C6DEC60000FF0000C6DEC600C6C6C600C6C6C60084848400848484000000
      0000C6C6C6008484840084848400000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00C6C6C6008484840000000000000000008484840084848400FFFF
      FF00C6DEC600C6C6C600C6DEC6008484840084848400C6DEC600C6DEC6000000
      0000C6DEC6000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6DEC600C6DEC600C6DEC600F7FFFF00F7FF
      FF00000000000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000008484840084848400C6DEC600F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000A5A5A500F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500F7FFFF00F7FFFF00F7FF
      FF00A5A5A500A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DE
      C600FFFFFF00C6C6C60000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000000000000000FF000000FF000000
      FF0000008400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF0000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000C6DEC600C6C6C60000000000000000000000000084848400FFFFFF00C6DE
      C600FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DEC600000000000000
      000000000000000000000000000000000000000000000000FF0000FFFF000000
      FF0000008400FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DEC600FFFF
      FF00C6C6C600000000000000FF0000000000FF000000FFFF0000FFFF0000FFFF
      0000FF0000000000000000000000000000000000000000000000FF000000FFFF
      0000FF0000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DE
      C600FFFFFF00C6C6C60000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF00000000000000000000000000000000000000000000008484
      8400848484008484840000000000FF00000000000000000000000000FF0000FF
      FF000000FF0000008400FF000000FF000000FF000000FF000000FF000000C6DE
      C600C6C6C6000000FF000000840000000000FF000000CED6D600FFFF00008400
      00000000000000000000000000000000000000000000FF000000FFFF0000FFFF
      0000FFFF00008484000084000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000C6DEC600C6C6C60000000000000000000000000084848400FFFFFF00C6DE
      C600FFFFFF00C6DEC6000000000000000000A5A5A500A5A5A500A5A5A5008484
      840084848400A5A5A50000000000FF0000000000000000000000848484000000
      FF000000FF0000008400C6DEC600FFFFFF00C6DEC600FFFFFF00C6DEC600FFFF
      FF000000FF00000084000000000000000000FF000000CED6D600840000000000
      0000000000000000000000000000FF000000FF000000FFFF0000FFFF0000FFFF
      0000FFFF00008484000084000000000000000000000000000000000000008484
      8400FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DE
      C600FFFFFF00C6C6C60000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF000000000000000000A5A5A500A5A5
      A500A5A5A500A5A5A50000000000CED6D600000000000000000084848400FFFF
      FF000000FF000000FF0000008400FF000000FF000000FF000000FF0000000000
      FF0000008400000000000000000000000000FF000000CED6D600FFFF00008400
      0000000000000000000000000000FF000000FFFFFF00CED6D600FFFF0000FFFF
      0000FFFF00008484000084000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000C6DEC600C6C6C60000000000000000000000000084848400FFFFFF00C6DE
      C600FFFFFF00C6DEC60000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6DEC6000000FF000000FF0000008400C6DEC600FFFFFF000000FF000000
      8400C6C6C600000000000000000000000000FF000000CED6D600FFFF0000FFFF
      000084000000000000000000000000000000FF000000FFFFFF00CED6D600FFFF
      0000FFFF00008484000084840000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00C6DEC600FFFFFF00C6DEC600FFFFFF00C6DE
      C600FFFFFF00C6C6C60000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000FF000000FF00000084000000FF0000008400C6DE
      C600C6C6C600000000000000000000000000FF000000CED6D600FFFFFF00FFFF
      0000FFFF000084000000000000000000000000000000FF000000FFFFFF00CED6
      D600FFFF000084840000848400000000000000000000000000000000000000FF
      FF00FFFFFF00FF000000FF000000FF000000FF000000FF000000C6DEC600FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00C6DEC600FFFFFF00C6DEC600000000000000000000FFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00C6DEC6000000FF000000FF0000008400C6DEC600FFFF
      FF00C6C6C600000000000000000000000000FF000000FFFFFF00FFFF00000000
      0000000000000000000000000000000000000000000000000000FF000000FFFF
      FF0000000000FFFF000084840000000000000000000000FFFF000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00C6DEC600FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000C6DEC600FFFFFF00FFFFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000FF000000FF00000084000000FF0000008400FFFF
      FF00C6C6C600000000000000000000000000FF000000CED6D600000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000000000000000008484000000000000000000000000000000FFFF0000FF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6DEC600FFFFFF0084848400000000000000
      000000FFFF00000000000000000000000000000000000000000084848400FFFF
      FF000000FF000000FF000000FF0000008400C6DEC600FFFFFF000000FF000000
      840000000000000000000000000000000000FF000000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF00008400000000FFFF0000FFFF0000FFFF008484
      840000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000008400FFFFFF00FFFFFF00FFFFFF00848484000000
      FF000000840000000000000000000000000000000000FF000000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF00008484000000000000000000000000000000FFFF0000FF
      FF0000FFFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      000000000000000000000000000000000000000000000000FF0000FFFF000000
      FF000000FF0000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000FF000000840000000000000000000000000000000000FF000000FF00
      0000FF0000008484000084840000848400008484000084840000848400008484
      0000848400008484000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000FF0000FFFF000000FF000000
      FF00000084008484840084848400848484008484840084848400848484000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FC3F000000000000F00F000000000000E007000000000000E007000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      E007000000000000E007000000000000F00F000000000000FC3F000000000000
      FFFF000000000000FFFF000000000000FFFF8001FC7FFFFF81F70000F01FFFFF
      9DE30000C007FC3FCFE300008001F00FE7C100008001E007F3C100000001E007
      B9F700000000C00381F700000000C003FFF700000100C00388F700000000C003
      9CF700008001E007C1F70000E007E007C9F70000F803F00FE3F70000FE00FC3F
      E3F70000FF03FFFFF7F78001FF8FFFFFFFFFE001FFFFDFFFFFF7E00180078002
      C1E7E0018007800381C7E001800080010381E0018000C0010700E0018000C003
      0E00E0018000C0030600E0018000C0030300E0018007C0030000E0018007C003
      0000A0018007C0030000C0038003C00300000007800BC0078001C00F801F8003
      C003ABFF803F001DFFFFEFFFFFFF9FFF00000000000000000000000000000000
      000000000000}
  end
  object ilToolBar_BN: TImageList
    Left = 312
    Top = 576
    Bitmap = {
      494C010107000900840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000848484000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000084848400000000000000000000000000000000008484
      84008484840084848400000000000000000084848400C6DEC600C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600C6DEC600C6C6C60084848400000000000000000000000000000000000000
      0000C6C6C600C6C6C60084848400000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      84008484840084848400000000000000000084848400C6DEC600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600C6DEC600C6C6C60084848400000000000000000000000000C6DEC600C6DE
      C6008484840084848400C6C6C600000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000848484008484
      84008484840084848400848484000000000084848400C6DEC600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600C6DEC600C6C6C6008484840000000000000000008484840084848400A5A5
      A500C6C6C600C6C6C600C6C6C600000000000000000084848400848484000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      84008484840084848400848484000000000084848400C6DEC600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400A5A5A500C6DEC600C6DE
      C600C6C6C600C6C6C600C6C6C600000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FFFFFF00C6DEC600C6DE
      C600C6C6C600C6C6C600FFFFFF00000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00C6DEC600C6DE
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00C6DEC600C6C6C6008484840084848400C6C6C600C6C6C600C6C6C6008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000008484840084848400848484000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C600848484000000000084848400FFFFFF00C6DEC600C6DE
      C6008484840084848400C6DEC600C6C6C600C6C6C60084848400848484000000
      0000C6C6C6008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000084848400848484000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C6008484840000000000000000008484840084848400FFFF
      FF00C6DEC600C6C6C600C6DEC6008484840084848400C6C6C600C6C6C6000000
      0000C6DEC6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C60084848400000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600C6DEC600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000008484840084848400000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C60084848400000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600C6C6C600C6C6C600C6C6C600C6DE
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000A5A5A500C6DEC600C6C6C600C6DEC600C6C6
      C600F7FFFF00F7FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      00008484840000000000000000000000000084848400C6DEC600C6C6C6008484
      8400C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6DEC600C6C6C60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6DEC600F7FFFF00F7FF
      FF00A5A5A500A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6
      C600F7FFFF00C6C6C60000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000848484008484
      84008484840084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000848484000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400F7FFFF008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60000000000000000000000000084848400F7FFFF00C6C6
      C600F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400F7FFFF00C6C6C600F7FFFF00C6C6C600F7FF
      FF00C6C6C6000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000008484
      8400F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6
      C600F7FFFF00C6C6C60000000000000000000000000084848400F7FFFF008484
      8400848484008484840000000000000000000000000000000000000000008484
      840084848400848484000000000084848400000000000000000084848400F7FF
      FF0084848400A5A5A5008484840084848400848484008484840084848400C6C6
      C600C6C6C60084848400848484000000000084848400C6DEC600848484000000
      0000848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484000000000000000000000000008484
      8400F7FFFF008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60000000000000000000000000084848400F7FFFF00C6C6
      C600F7FFFF00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484000000000084848400000000000000000084848400F7FF
      FF00C6C6C600848484008484840084848400C6C6C600F7FFFF00C6C6C600F7FF
      FF008484840084848400000000000000000084848400C6DEC600848484008484
      84000000000000000000000000008484840084848400C6C6C600A5A5A5008484
      8400848484008484840084848400848484000000000000000000000000008484
      8400F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6
      C600F7FFFF00C6C6C60000000000000000000000000084848400F7FFFF008484
      8400848484008484840000000000A5A5A5000000000000000000C6C6C600C6C6
      C600848484008484840000000000A5A5A500000000000000000084848400F7FF
      FF00848484008484840084848400848484008484840084848400848484008484
      84008484840000000000000000000000000084848400C6DEC600848484008484
      840000000000000000000000000084848400F7FFFF00C6DEC600C6C6C600A5A5
      A500848484008484840084848400848484000000000000000000000000008484
      8400F7FFFF008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60000000000000000000000000084848400F7FFFF00C6C6
      C600F7FFFF00C6C6C60000000000C6C6C600A5A5A50000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000084848400F7FF
      FF00C6C6C600F7FFFF00C6C6C600848484008484840084848400848484008484
      8400C6C6C60000000000000000000000000084848400C6DEC600A5A5A5008484
      84008484840084848400000000000000000084848400F7FFFF00C6DEC600C6C6
      C600A5A5A5008484840084848400848484000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00C6C6C600F7FFFF00C6C6C600F7FFFF00C6C6
      C600F7FFFF00C6C6C60000000000000000000000000084848400F7FFFF008484
      840084848400848484008484840000000000C6C6C600A5A5A500000000000000
      000000000000000000000000000000000000000000000000000084848400F7FF
      FF0084848400848484008484840084848400848484008484840084848400C6C6
      C600C6C6C60000000000000000000000000084848400C6DEC600F7FFFF00A5A5
      A500848484008484840084848400848484008484840084848400F7FFFF00C6DE
      C600C6C6C6008484840084848400848484000000000000000000000000008484
      8400F7FFFF008484840084848400848484008484840084848400C6C6C600F7FF
      FF00F7FFFF00C6C6C60000000000000000000000000084848400F7FFFF00F7FF
      FF00F7FFFF00C6C6C600F7FFFF00C6C6C6000000000000000000A5A5A5000000
      000000000000000000000000000000000000000000000000000084848400F7FF
      FF00F7FFFF00F7FFFF00C6C6C600848484008484840084848400848484008484
      8400C6C6C60000000000000000000000000084848400F7FFFF00A5A5A5008484
      840084848400848484008484840084848400848484008484840084848400F7FF
      FF0084848400C6C6C60084848400848484000000000084848400000000008484
      8400F7FFFF0084848400F7FFFF00F7FFFF00F7FFFF00C6C6C600F7FFFF008484
      8400000000000000000000000000000000000000000084848400F7FFFF008484
      840084848400848484008484840084848400C6C6C600F7FFFF00F7FFFF00A5A5
      A50000000000000000000000000000000000000000000000000084848400F7FF
      FF008484840084848400848484008484840084848400C6C6C600F7FFFF008484
      84008484840000000000000000000000000084848400C6DEC600848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000848484008484
      840084848400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF008484
      8400F7FFFF000000000000000000000000000000000084848400F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00C6C6C600F7FFFF0084848400000000000000
      0000A5A5A500000000000000000000000000000000000000000084848400F7FF
      FF0084848400848484008484840084848400C6C6C600F7FFFF00848484000000
      00008484840084848400000000000000000084848400A5A5A500848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400A5A5A500000000008484840084848400848484008484
      8400848484008484840084848400F7FFFF00F7FFFF00F7FFFF00F7FFFF008484
      8400000000000000000000000000000000000000000084848400F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF0084848400FFFFFF000000
      000000000000A5A5A50000000000000000000000000000000000848484008484
      8400848484008484840084848400F7FFFF00F7FFFF00F7FFFF0084848400FFFF
      FF00000000008484840084848400000000000000000084848400A5A5A5008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF0084848400000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84008484840084848400F7FFFF00F7FFFF00F7FFFF00F7FFFF00848484000000
      0000000000000000000084848400848484000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF8001FC7F000081F70000F01F0000
      9DE30000C0070000CFE3000080010000E7C1000080010000F3C1000000010000
      B9F700000000000081F7000000000000FFF700000000000088F7000000000000
      9CF7000080010000C1F70000E0070000C9F70000F8030000E3F70000FE000000
      E3F70000FF030000F7F78001FF8F0000FFFFE001FFFF87FFFFF7E00180078003
      C1E7E0018007C00281C7E0018000C0000381E0018000C0010700E0018000C003
      0E00E0018000C0030600E0018000C0030300E0018007C0030000E0018007C003
      0000A0018007C0030000C0038003C00300000007800BC0018001C00F801F800C
      C003ABFF803F001FFFFFEFFFFFFF0FFF00000000000000000000000000000000
      000000000000}
  end
  object PrintSetup: TPrinterSetupDialog
    Left = 344
    Top = 576
  end
  object PrintDialog: TPrintDialog
    Left = 376
    Top = 576
  end
  object sdqEmpleadoresContratantes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      'FROM hys.hec_empresacontratante'
      'WHERE EC_CUIT = :pCuit'
      'AND EC_TIPO = :pTipo'
      'AND EC_OPERATIVO = :pOperativo'
      'AND EC_ESTABLECI = :pEstableci')
    Left = 54
    Top = 283
    ParamData = <
      item
        DataType = ftString
        Name = 'pCuit'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pOperativo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pEstableci'
        ParamType = ptInput
      end>
  end
  object dsEmpresasContratantes: TDataSource
    DataSet = sdqEmpleadoresContratantes
    Left = 82
    Top = 283
  end
  object sdEmpleadoresContratantes: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEmpleadoresContratantes
    SortFields = <>
    FixedRows = 0
    Left = 408
    Top = 576
  end
  object edEmpleadoresContratantes: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqEmpleadoresContratantes
    Fields = <
      item
        DataField = 'OD_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'TIPO'
        Title = 'Tipo'
      end
      item
        DataField = 'OD_OBSERVACIONES1'
        Title = 'Observaciones1'
      end
      item
        DataField = 'OD_OBSERVACIONES2'
        Title = 'Observaciones2'
      end>
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
    VersionExcel = msExcel97
    Left = 440
    Top = 576
  end
  object sccEmpleadoresContratantes: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbAgregarEmp
      end
      item
        Key = 16461
        LinkControl = tbModificarEmp
      end
      item
        Key = 46
        LinkControl = tbEmpQuitar
      end
      item
        Key = 16463
      end
      item
        Key = 16453
      end
      item
        Key = 16457
      end
      item
        Key = 16449
      end
      item
        Key = 116
      end>
    Enabled = False
    Left = 472
    Top = 576
  end
  object qpEmpleadoresContratantes: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Denuncia de Incumplimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 504
    Top = 576
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqVisitasAfterScroll
    SQL.Strings = (
      
        'SELECT   rv1.rv_id, rv1.rv_idvisitaasociada, rv2.rv_estableci es' +
        'tvisitaasoc,'
      
        '         rv1.rv_fecha, rv1.rv_firmante, it_nombre, rv1.rv_fechab' +
        'aja,'
      '         rv1.rv_prestador, ej_descripcion, rv1.rv_descripcion,'
      
        '         rv1.rv_horariodesde, rv1.rv_horariohasta, rv1.rv_duraci' +
        'onpermanencia,'
      
        '         rv1.rv_operativo, rv1.rv_tipo, rv1.rv_estableci, rv1.rv' +
        '_obsinterna,'
      
        '         rv1.rv_fechanotificacion, rv1.rv_fechaviaticos, rv1.rv_' +
        'fechaalta,'
      
        '         rv1.rv_usualta, rv1.rv_fechainicioviaticos, rv1.rv_fech' +
        'afinviaticos,'
      
        '         rv1.rv_traspaso, rv1.RV_USUAUDITADO, rv1.RV_FECHAAUDITA' +
        'DO '
      '    FROM art.mej_empprest,'
      '         art.pit_firmantes,'
      '         art.prv_resvisitas rv1,'
      '         hys.hep_estabporpreventor,'
      '         art.prv_resvisitas rv2'
      '   WHERE it_codigo(+) = rv1.rv_firmante'
      '     AND ej_codigo(+) = rv1.rv_prestador'
      '     AND ep_cuit(+) = rv1.rv_cuit'
      '     AND ep_estableci(+) = rv1.rv_estableci'
      '     AND rv2.rv_id(+) = rv1.rv_idvisitaasociada'
      '     AND rv1.rv_cuit = :cuit'
      '     AND rv1.rv_estableci = :estab'
      'ORDER BY rv1.rv_fecha')
    Left = 54
    Top = 311
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estab'
        ParamType = ptInput
      end>
  end
  object sdqMotivos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        '  SELECT ROWNUM motivo, mo_descripcion descripcion, mo_codigo, v' +
        'm_fechabaja'
      '    FROM hys.hvm_visitamotivo, art.pmo_motivos'
      '   WHERE mo_codigo(+) = vm_idmotivo'
      '     AND vm_idvisita = :rv_id'
      ''
      ''
      ' ')
    Left = 82
    Top = 311
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rv_id'
        ParamType = ptInput
      end>
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 54
    Top = 339
  end
  object dsMotivos: TDataSource
    DataSet = sdqMotivos
    Left = 82
    Top = 339
  end
  object sdqTiposMotivos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   *'
      '    FROM art.pmo_motivos'
      'ORDER BY mo_descripcion'
      '')
    UniDirectional = True
    Left = 110
    Top = 283
  end
  object sdqMotivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        '  SELECT ROWNUM motivo, mo_descripcion descripcion, mo_codigo, v' +
        'm_fechabaja'
      '    FROM hys.hvm_visitamotivo, art.pmo_motivos'
      '   WHERE mo_codigo(+) = vm_idmotivo'
      '       AND vm_fechabaja IS NULL'
      ''
      '     AND vm_idvisita = :rv_id'
      '')
    Left = 110
    Top = 311
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rv_id'
        ParamType = ptInput
      end>
  end
  object sccVisitas: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = btnNuevaVisita
      end
      item
        Key = 16461
        LinkControl = btnModifVisita
      end
      item
        Key = 46
        LinkControl = btnDeleteVisita
      end
      item
        Key = 16463
      end
      item
        Key = 16453
      end
      item
        Key = 16457
      end
      item
        Key = 16449
      end
      item
        Key = 116
        LinkControl = btnRefrescarVisitas
      end>
    Enabled = False
    Left = 532
    Top = 576
  end
  object qryDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT od_id'
      '  FROM pod_obradenuncia'
      ' WHERE od_fechabaja IS NULL'
      '   AND od_idvisita = :idvisita'
      ' ')
    Left = 110
    Top = 339
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idvisita'
        ParamType = ptInput
      end>
  end
  object qryObsDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT 1, rv_descripcion obs'
      '  FROM art.pdd_detalledenuncia, art.prv_resvisitas'
      ' WHERE rv_fechabaja IS NULL'
      '   AND rv_id = dd_idvisita'
      '   AND dd_idpodobradenuncia = :od_id'
      'UNION'
      'SELECT 2, dd_observaciones obs'
      '  FROM art.pdd_detalledenuncia, ctb_tablas'
      ' WHERE dd_fechabaja IS NULL'
      '   AND tb_clave = '#39'ID_'#39' || dd_grupo'
      '   AND tb_codigo = TO_CHAR(dd_rubro)'
      '   AND dd_idpodobradenuncia = :od_id'
      'ORDER BY 1'
      ''
      ' '
      ' ')
    Left = 82
    Top = 367
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'od_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'od_id'
        ParamType = ptInput
      end>
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 140
    Top = 520
  end
end
