inherited frmDenunciaSTD: TfrmDenunciaSTD
  Left = 775
  Top = 175
  HorzScrollBar.Visible = True
  VertScrollBar.Visible = True
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Denuncia'
  ClientHeight = 386
  ClientWidth = 657
  Constraints.MinWidth = 640
  OldCreateOrder = True
  OnCreate = FSFormCreate
  OnKeyDown = FSFormKeyDown
  AutoTabs = False
  ExplicitLeft = 775
  ExplicitTop = 175
  ExplicitWidth = 665
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  object pgSolapas: TPageControl [0]
    Left = 0
    Top = 0
    Width = 657
    Height = 386
    ActivePage = tsEP
    Align = alClient
    Images = ImageListTabs
    TabOrder = 0
    object tsA: TTabSheet
      Caption = 'Info / Ubicaci'#243'n de la denun&cia / Laboral'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbA: TScrollBox
        Left = 0
        Top = 0
        Width = 649
        Height = 357
        VertScrollBar.Smooth = True
        Align = alClient
        TabOrder = 0
        object gbUbicacion: TJvgGroupBox
          Left = 0
          Top = 60
          Width = 645
          Height = 147
          Align = alTop
          Caption = ' Ubicaci'#243'n de la denuncia '
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
          Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          GlyphCollapsed.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          GlyphExpanded.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          DesignSize = (
            645
            147)
          FullHeight = 147
          object lbValidacionCUIT: TLabel
            Left = 230
            Top = 124
            Width = 98
            Height = 13
            Caption = 'Cambia en ejecuci'#243'n'
          end
          object Label29: TLabel
            Left = 8
            Top = 118
            Width = 134
            Height = 26
            Caption = 'Colocar  el n'#250'mero de CUIT '#13#10'si es distinto del empleador'
          end
          object Label43: TLabel
            Left = 416
            Top = 119
            Width = 44
            Height = 26
            Hint = 
              'Es tenido en cuenta para la liquidaci'#243'n de las asignaciones fami' +
              'liares'
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Localidad'#13#10'/ Partido'
            ParentShowHint = False
            ShowHint = True
          end
          object Label45: TLabel
            Left = 341
            Top = 119
            Width = 70
            Height = 26
            Anchors = [akTop, akRight]
            Caption = 'Empresa'#13#10'subcontratada'
          end
          object rgEstablecimiento: TDBRadioGroup
            Left = 2
            Top = 20
            Width = 642
            Height = 94
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Domicilio de ocurrencia del accidente '
            DataField = 'UBICACION_DENUNCIA'
            DataSource = dsDatos
            Items.Strings = (
              'Est. &Propio'
              '&Otro Lugar'
              'Sin &Datos'
              'Est. &Terceros')
            ParentBackground = True
            TabOrder = 0
            Values.Strings = (
              'P'
              'O'
              'S'
              'T')
            OnChange = rgEstablecimientoChange
            OnClick = rgEstablecimientoClick
          end
          object pnlEstablecimientoExtra: TPanel
            Left = 93
            Top = 36
            Width = 549
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 1
            TabStop = True
            DesignSize = (
              549
              23)
            object Label18: TLabel
              Left = 151
              Top = 5
              Width = 47
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tel'#233'fonos'
            end
            object Label26: TLabel
              Left = 345
              Top = 5
              Width = 19
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Pa'#237's'
            end
            object Label28: TLabel
              Left = 10
              Top = 5
              Width = 37
              Height = 13
              Hint = 
                'Nombre del establecimiento de ocurrencia del accidente o detecci' +
                #243'n de la enfermedad profesional'
              Caption = 'Nombre'
              ParentShowHint = False
              ShowHint = True
            end
            object Label42: TLabel
              Left = 67
              Top = 5
              Width = 38
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'N'#176' AFIP'
            end
            object edDE_UBICACION_TELEFONOS: TDBEdit
              Left = 237
              Top = 1
              Width = 102
              Height = 21
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_UBICACION_TELEFONOS'
              DataSource = dsDatos
              TabOrder = 3
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_UBICACION_CODAREATELEFONOS: TDBEdit
              Left = 201
              Top = 1
              Width = 34
              Height = 21
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_UBICACION_CODAREATELEFONOS'
              DataSource = dsDatos
              TabOrder = 2
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inline fraDE_UBICACION_PAIS: TfraCPA_PAISES
              Left = 367
              Top = 0
              Width = 181
              Height = 23
              Anchors = [akTop, akRight]
              TabOrder = 4
              TabStop = True
              ExplicitLeft = 367
              ExplicitWidth = 181
              DesignSize = (
                181
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 118
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 118
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqDatosDE_UBICACION_PAIS
                DataSource = dsDatos
                OrderBy = 'PA_DESCRIPCION'
                Left = 112
              end
            end
            object edDE_UBICACION_NOMBRE: TDBEdit
              Left = 50
              Top = 1
              Width = 15
              Height = 21
              Hint = 
                'Nombre del establecimiento de ocurrencia del accidente o detecci' +
                #243'n de la enfermedad profesional'
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_UBICACION_NOMBRE'
              DataSource = dsDatos
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edUD_NROESTABLECIMIENTOAFIP: TDBEdit
              Left = 107
              Top = 1
              Width = 42
              Height = 21
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'UD_NROESTABLECIMIENTOAFIP'
              DataSource = dsDatos
              TabOrder = 1
              OnEnter = OnEnter
              OnExit = OnExit
            end
          end
          inline fraDomicilioEstablecimiento: TfraDomicilio
            Left = 97
            Top = 61
            Width = 544
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnEnter = OnEnter
            OnExit = OnExit
            ExplicitLeft = 97
            ExplicitTop = 61
            ExplicitWidth = 544
            ExplicitHeight = 47
            DesignSize = (
              544
              47)
            inherited lbCalle: TLabel
              Left = 17
              ExplicitLeft = 17
            end
            inherited lbNro: TLabel
              Left = 329
              ExplicitLeft = 329
            end
            inherited lbPiso: TLabel
              Left = 401
              ExplicitLeft = 401
            end
            inherited lbDto: TLabel
              Left = 477
              ExplicitLeft = 477
            end
            inherited lbCPostal: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbCPA: TLabel
              Left = 100
              Top = 28
              ExplicitLeft = 100
              ExplicitTop = 28
            end
            inherited lbLocalidad: TLabel
              Left = 202
              Top = 28
              ExplicitLeft = 202
              ExplicitTop = 28
            end
            inherited lbProvincia: TLabel
              Left = 271
              Top = 28
              Width = 169
              Caption = 'Provincia de ocurrencia o detecci'#243'n'
              ExplicitLeft = 271
              ExplicitTop = 28
              ExplicitWidth = 169
            end
            inherited cmbCalle: TArtComboBox
              Left = 46
              Width = 244
              ExplicitLeft = 46
              ExplicitWidth = 244
            end
            inherited edNumero: TEdit
              Left = 351
              ExplicitLeft = 351
            end
            inherited edPiso: TEdit
              Left = 427
              ExplicitLeft = 427
            end
            inherited edDto: TEdit
              Left = 499
              Width = 44
              ExplicitLeft = 499
              ExplicitWidth = 44
            end
            inherited edCPostal: TIntEdit
              Left = 46
              Top = 24
              OnChange = fraDomicilioEstablecimientoedCPostalChange
              ExplicitLeft = 46
              ExplicitTop = 24
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 249
              Top = 24
              Width = 18
              ExplicitLeft = 249
              ExplicitTop = 24
              ExplicitWidth = 18
            end
            inherited edProvincia: TEdit
              Left = 442
              Top = 24
              Width = 101
              ExplicitLeft = 442
              ExplicitTop = 24
              ExplicitWidth = 101
            end
            inherited edCPA: TPatternEdit
              Left = 124
              Top = 24
              Width = 73
              ExplicitLeft = 124
              ExplicitTop = 24
              ExplicitWidth = 73
            end
            inherited btnBuscar: TButton
              Left = 294
              ExplicitLeft = 294
            end
          end
          object edDE_UBICACION_CUITOCURRE: TJvDBMaskEdit
            Left = 144
            Top = 122
            Width = 82
            Height = 21
            Hint = 'CUIT o Clave del Prestador'
            BevelWidth = 0
            CharCase = ecUpperCase
            DataField = 'DE_UBICACION_CUITOCURRE'
            DataSource = dsDatos
            TabOrder = 3
            OnChange = edDE_UBICACION_CUITOCURREChange
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inline fraUD_SECUENCIA_PARTIDOLOCALIDAD: TfraCCO_PARTIDOS_CODIGOSPOSTALES
            Left = 462
            Top = 121
            Width = 179
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 4
            ExplicitLeft = 462
            ExplicitTop = 121
            ExplicitWidth = 179
            DesignSize = (
              179
              23)
            inherited edCodigo: TPatternEdit [0]
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TArtComboBox [1]
              Width = 114
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 114
            end
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD
              DataSource = dsDatos
              Left = 88
              Top = 65532
            end
          end
          object chkEmpresaContratada: TJvCheckBox
            Left = 327
            Top = 123
            Width = 13
            Height = 17
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ParentColor = False
            TabOrder = 5
            LinkedControls = <>
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
        end
        object gbDatos1: TJvgGroupBox
          Left = 0
          Top = 0
          Width = 645
          Height = 60
          Align = alTop
          Caption = ' Informaci'#243'n sobre el siniestro '
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
          Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          GlyphCollapsed.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          GlyphExpanded.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          DesignSize = (
            645
            60)
          FullHeight = 60
          object Label23: TLabel
            Left = 8
            Top = 17
            Width = 66
            Height = 13
            AutoSize = False
            Caption = 'Tipo Siniestro'
          end
          object lbTextoDenuncia: TLabel
            Left = 238
            Top = 19
            Width = 56
            Height = 39
            Anchors = [akTop, akRight]
            Caption = 'Denunciado'#13#10'por el '#13#10'trabajador'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5581568
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object rpDE_QUIENDENUNCIA: TJvDBRadioPanel
            Left = 190
            Top = 18
            Width = 45
            Height = 42
            Hint = #191'Qui'#233'n hizo la denuncia?'
            Anchors = [akTop, akRight]
            BevelOuter = bvNone
            DataField = 'DE_QUIENDENUNCIA'
            DataSource = dsDatos
            Font.Charset = ANSI_CHARSET
            Font.Color = 5581568
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'S/D'
              'Si'
              'No')
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TabStop = True
            Values.Strings = (
              '1'
              '2'
              '3')
            OnChange = rpDE_QUIENDENUNCIAChange
          end
          inline fraTipoSiniestro: TfraTipoSiniestro
            Left = 8
            Top = 33
            Width = 187
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 33
            ExplicitWidth = 187
            DesignSize = (
              187
              23)
            inherited edCodigo: TPatternEdit
              Width = 20
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 20
            end
            inherited cmbDescripcion: TComboGrid
              Left = 23
              Width = 162
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 23
              ExplicitWidth = 162
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_TIPO
              DataSource = dsDatos
              OnChange = fraTipoSiniestroPropiedadesChange
            end
          end
          object rpDE_SUBTIPO: TJvDBRadioPanel
            Left = 299
            Top = 18
            Width = 361
            Height = 41
            Hint = 'Caracter'#237'stica del siniestro'
            Anchors = [akTop, akRight]
            BevelOuter = bvNone
            Columns = 2
            DataField = 'DE_SUBTIPO'
            DataSource = dsDatos
            Font.Charset = ANSI_CHARSET
            Font.Color = 1842233
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              '&En el trabajo'
              'En o&tro centro o lugar de trabajo'
              'Al ir o al &volver del trabajo'
              'Despla&zamiento en d'#237'a laboral'
              'Ot&ro'
              'Ninguna de las anteriores')
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            TabStop = True
            Values.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6')
          end
        end
        object gbLaboral: TJvgGroupBox
          Left = 0
          Top = 207
          Width = 645
          Height = 145
          Align = alTop
          Caption = ' Aspecto laboral '
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
          Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          GlyphCollapsed.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          GlyphExpanded.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          DesignSize = (
            645
            145)
          FullHeight = 145
          object Label9: TLabel
            Left = 440
            Top = 18
            Width = 249
            Height = 13
            AutoSize = False
            Caption = 'Puesto de trabajo al momento del accidente'
          end
          object Label12: TLabel
            Left = 276
            Top = 18
            Width = 55
            Height = 13
            Caption = 'Antig'#252'edad'
          end
          object Label13: TLabel
            Left = 368
            Top = 18
            Width = 24
            Height = 13
            Caption = 'A'#241'os'
          end
          object Label14: TLabel
            Left = 400
            Top = 18
            Width = 30
            Height = 13
            Caption = 'Meses'
          end
          object Label22: TLabel
            Left = 4
            Top = 18
            Width = 80
            Height = 13
            AutoSize = False
            Caption = 'Tarea Habitual'
          end
          object Label56: TLabel
            Left = 276
            Top = 58
            Width = 55
            Height = 13
            Caption = 'Antig'#252'edad'
          end
          object Label57: TLabel
            Left = 368
            Top = 58
            Width = 24
            Height = 13
            Caption = 'A'#241'os'
          end
          object Label58: TLabel
            Left = 400
            Top = 58
            Width = 30
            Height = 13
            Caption = 'Meses'
          end
          object Label59: TLabel
            Left = 4
            Top = 58
            Width = 225
            Height = 13
            AutoSize = False
            Caption = 'Puesto de trabajo anterior'
          end
          object Label44: TLabel
            Left = 261
            Top = 102
            Width = 118
            Height = 13
            Caption = 'Inicio inasistencia laboral'
          end
          object Label15: TLabel
            Left = 5
            Top = 102
            Width = 136
            Height = 13
            Caption = 'Horario de la jornada laboral'
          end
          object Label24: TLabel
            Left = 77
            Top = 122
            Width = 14
            Height = 13
            Caption = 'Fin'
          end
          object Label25: TLabel
            Left = 201
            Top = 122
            Width = 14
            Height = 13
            Caption = 'Fin'
          end
          object Label16: TLabel
            Left = 5
            Top = 122
            Width = 25
            Height = 13
            Caption = 'Inicio'
          end
          object Label17: TLabel
            Left = 133
            Top = 122
            Width = 25
            Height = 13
            Caption = 'Inicio'
          end
          object Label52: TLabel
            Left = 396
            Top = 102
            Width = 57
            Height = 13
            Caption = 'Baja m'#233'dica'
          end
          object edDE_ANIOSPUESTO: TDBPatternEdit
            Left = 368
            Top = 34
            Width = 28
            Height = 21
            DataField = 'DE_ANIOSPUESTO'
            DataSource = dsDatos
            MaxLength = 2
            TabOrder = 2
            OnEnter = OnEnter
            OnExit = OnExit
            Pattern = '0123456789'
          end
          object edDE_MESESPUESTO: TDBPatternEdit
            Left = 400
            Top = 34
            Width = 23
            Height = 21
            DataField = 'DE_MESESPUESTO'
            DataSource = dsDatos
            MaxLength = 2
            TabOrder = 3
            OnEnter = OnEnter
            OnExit = OnExit
            Pattern = '0123456789'
          end
          object edDE_ANTIGUEDADPUESTO: TDBDateEdit
            Left = 276
            Top = 34
            Width = 88
            Height = 21
            DataField = 'DE_ANTIGUEDADPUESTO'
            DataSource = dsDatos
            DialogTitle = 'Seleccione una Fecha.'
            NumGlyphs = 2
            TabOrder = 1
            StartOfWeek = Sun
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inline fraDE_TAREAHABITUAL: TfraCCI_CIUO
            Left = 4
            Top = 34
            Width = 269
            Height = 23
            TabOrder = 0
            ExplicitLeft = 4
            ExplicitTop = 34
            ExplicitWidth = 269
            DesignSize = (
              269
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 206
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 206
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                500
                -1
                -1)
            end
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_TAREAHABITUAL
              DataSource = dsDatos
            end
          end
          inline fraDE_TAREAACCIDENTE: TfraCCI_CIUO
            Left = 440
            Top = 34
            Width = 184
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            ExplicitLeft = 440
            ExplicitTop = 34
            ExplicitWidth = 184
            DesignSize = (
              184
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 121
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 121
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                500
                -1
                -1)
            end
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_TAREAACCIDENTE
              DataSource = dsDatos
            end
          end
          object edDE_ANIOSPUESTOANTERIOR: TDBPatternEdit
            Left = 368
            Top = 74
            Width = 28
            Height = 21
            DataField = 'DE_ANIOSPUESTOANTERIOR'
            DataSource = dsDatos
            MaxLength = 2
            TabOrder = 7
            OnEnter = OnEnter
            OnExit = OnExit
            Pattern = '0123456789'
          end
          object edDE_MESESPUESTOANTERIOR: TDBPatternEdit
            Left = 400
            Top = 74
            Width = 23
            Height = 21
            DataField = 'DE_MESESPUESTOANTERIOR'
            DataSource = dsDatos
            MaxLength = 2
            TabOrder = 8
            OnEnter = OnEnter
            OnExit = OnExit
            Pattern = '0123456789'
          end
          object edDE_ANTIGUEDADPUESTOANTERIOR: TDBDateEdit
            Left = 276
            Top = 74
            Width = 88
            Height = 21
            DataField = 'DE_ANTIGUEDADPUESTOANTERIOR'
            DataSource = dsDatos
            DialogTitle = 'Seleccione una Fecha.'
            NumGlyphs = 2
            TabOrder = 6
            StartOfWeek = Sun
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inline fraDE_TAREAANTERIOR: TfraCCI_CIUO
            Left = 4
            Top = 74
            Width = 269
            Height = 23
            TabOrder = 5
            ExplicitLeft = 4
            ExplicitTop = 74
            ExplicitWidth = 269
            DesignSize = (
              269
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 206
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 206
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                500
                -1
                -1)
            end
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_TAREAANTERIOR
              DataSource = dsDatos
            end
          end
          object edDE_INICIOINASISTENCIALABORAL: TDBDateEdit
            Left = 261
            Top = 118
            Width = 88
            Height = 21
            DataField = 'DE_INICIOINASISTENCIALABORAL'
            DataSource = dsDatos
            DialogTitle = 'Seleccione una Fecha.'
            NumGlyphs = 2
            TabOrder = 13
            StartOfWeek = Sun
            OnEnter = OnEnter
            OnExit = OnExit
          end
          object edDE_HORJORNADA1DESDE: TTimeEditor
            Left = 33
            Top = 118
            Width = 37
            Height = 21
            TabOrder = 9
            OnEnter = OnEnter
            OnExit = edDE_HORJORNADA1DESDEExit
            CustomFormat = 'HH:mm'
          end
          object edDE_HORJORNADA1HASTA: TTimeEditor
            Left = 93
            Top = 118
            Width = 37
            Height = 21
            TabOrder = 10
            OnEnter = OnEnter
            OnExit = edDE_HORJORNADA1HASTAExit
            CustomFormat = 'HH:mm'
          end
          object edDE_HORJORNADA2DESDE: TTimeEditor
            Left = 161
            Top = 118
            Width = 37
            Height = 21
            TabOrder = 11
            OnEnter = OnEnter
            OnExit = edDE_HORJORNADA2DESDEExit
            CustomFormat = 'HH:mm'
          end
          object edDE_HORJORNADA2HASTA: TTimeEditor
            Left = 217
            Top = 118
            Width = 37
            Height = 21
            TabOrder = 12
            OnEnter = OnEnter
            OnExit = edDE_HORJORNADA2HASTAExit
            CustomFormat = 'HH:mm'
          end
          object edDE_FECHABAJAMEDICA: TDBDateEdit
            Left = 395
            Top = 118
            Width = 97
            Height = 22
            DataField = 'DE_BAJAMEDICA'
            DataSource = dsDatos
            DialogTitle = 'Seleccione una Fecha.'
            NumGlyphs = 2
            TabOrder = 14
            StartOfWeek = Sun
          end
        end
        object fpEstableciTemporales: TFormPanel
          Left = 461
          Top = 452
          Width = 456
          Height = 193
          Caption = 'Establecimientos Temporales del Empleador'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderIcons = [biSystemMenu]
          BorderStyle = bsSingle
          Position = poOwnerFormCenter
          OnBeforeShow = fpEstableciTemporalesBeforeShow
          DesignSize = (
            456
            193)
          object Bevel18: TBevel
            Left = 3
            Top = 162
            Width = 449
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
          end
          object lblTitulo: TLabel
            Left = 20
            Top = 5
            Width = 6
            Height = 13
            Caption = '  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnAceptarEstTemp: TBitBtn
            Left = 374
            Top = 166
            Width = 77
            Height = 22
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
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
            TabOrder = 0
            OnClick = btnAceptarEstTempClick
          end
          object dbgEstableciTemporales: TArtDBGrid
            Left = 3
            Top = 3
            Width = 450
            Height = 157
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsEstableciTemporales
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbgEstableciTemporalesDblClick
            IniStorage = FormStorage
            FooterBand = False
            TitleHeight = 17
            AutoTitleHeight = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ET_NROESTABLECI'
                Title.Caption = 'Nro. Estab.'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_NOMBRE'
                Title.Caption = 'Nombre'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_CUIT_TEMPORAL'
                Title.Caption = 'CUIT Temporal'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_CALLE'
                Title.Caption = 'Calle'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_NUMERO'
                Title.Caption = 'Nro.'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_PISO'
                Title.Caption = 'Piso'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_DEPARTAMENTO'
                Title.Caption = 'Depto.'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_LOCALIDAD'
                Title.Caption = 'Localidad'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ET_CPOSTAL'
                Title.Caption = 'Cod.Postal'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROVINCIA'
                Title.Caption = 'Provincia'
                Width = 75
                Visible = True
              end>
          end
        end
      end
    end
    object tsAC: TTabSheet
      Caption = 'Accidente de tra&bajo'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbB: TScrollBox
        Left = 0
        Top = 0
        Width = 649
        Height = 357
        Align = alClient
        TabOrder = 0
        object gbAccidenteDeTrabajo: TJvgGroupBox
          Left = 0
          Top = 0
          Width = 645
          Height = 339
          Align = alTop
          Caption = ' Accidente de trabajo '
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
          Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          DesignSize = (
            645
            339)
          FullHeight = 350
          object lbForma: TLabel
            Left = 308
            Top = 58
            Width = 149
            Height = 13
            AutoSize = False
            Caption = 'Forma del Accidente'
          end
          object Label3: TLabel
            Left = 12
            Top = 57
            Width = 149
            Height = 13
            AutoSize = False
            Caption = 'Agente Material Asociado'
          end
          object Label5: TLabel
            Left = 11
            Top = 125
            Width = 62
            Height = 13
            Hint = 'Naturaleza de la lesi'#243'n'
            AutoSize = False
            Caption = 'Naturaleza'
            ParentShowHint = False
            ShowHint = True
          end
          object Label6: TLabel
            Left = 11
            Top = 148
            Width = 62
            Height = 13
            Hint = 'Zona del cuerpo afectada'
            AutoSize = False
            Caption = 'Zona'
            ParentShowHint = False
            ShowHint = True
          end
          object Label20: TLabel
            Left = 144
            Top = 18
            Width = 103
            Height = 13
            Caption = 'Descripci'#243'n del hecho'
          end
          object Label40: TLabel
            Left = 9
            Top = 18
            Width = 29
            Height = 13
            Caption = 'Fecha'
          end
          object Label46: TLabel
            Left = 101
            Top = 18
            Width = 23
            Height = 13
            Caption = 'Hora'
          end
          object Label60: TLabel
            Left = 11
            Top = 102
            Width = 61
            Height = 13
            AutoSize = False
            Caption = 'Diagn'#243'stico'
          end
          object Label61: TLabel
            Left = 71
            Top = 102
            Width = 7
            Height = 13
            Caption = '1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label62: TLabel
            Left = 71
            Top = 125
            Width = 7
            Height = 13
            Caption = '1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label63: TLabel
            Left = 71
            Top = 148
            Width = 7
            Height = 13
            Caption = '1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label64: TLabel
            Left = 315
            Top = 102
            Width = 7
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label65: TLabel
            Left = 315
            Top = 125
            Width = 7
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label66: TLabel
            Left = 315
            Top = 148
            Width = 7
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label67: TLabel
            Left = 478
            Top = 102
            Width = 7
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '3'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label68: TLabel
            Left = 478
            Top = 125
            Width = 7
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '3'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label69: TLabel
            Left = 478
            Top = 148
            Width = 7
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '3'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inline fraDE_IDLESIONFORMA: TfraSLF_LESIONFORMA
            Left = 304
            Top = 72
            Width = 334
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            ExplicitLeft = 304
            ExplicitTop = 72
            ExplicitWidth = 334
            DesignSize = (
              334
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 271
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 271
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja'
                'SubTitulo')
              ColWidths = (
                40
                300
                -1
                -1
                -1)
            end
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONFORMA
              DataSource = dsDatos
            end
          end
          inline fraDE_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA
            Left = 79
            Top = 120
            Width = 231
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            ExplicitLeft = 79
            ExplicitTop = 120
            ExplicitWidth = 231
            DesignSize = (
              231
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 168
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 168
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONNATURALEZA
              DataSource = dsDatos
            end
          end
          inline fraDE_IDLESIONZONA: TfraSLZ_LESIONZONA
            Left = 79
            Top = 143
            Width = 231
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            ExplicitLeft = 79
            ExplicitTop = 143
            ExplicitWidth = 231
            DesignSize = (
              231
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 168
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 168
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONZONA
              DataSource = dsDatos
            end
          end
          object edDE_DESCRIPCION: TDBMemo
            Left = 141
            Top = 34
            Width = 497
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelWidth = 0
            DataField = 'DE_DESCRIPCION'
            DataSource = dsDatos
            ParentShowHint = False
            ScrollBars = ssVertical
            ShowHint = True
            TabOrder = 2
            OnChange = edDE_DESCRIPCIONChange
            OnEnter = OnEnter
            OnExit = OnExit
          end
          object edEX_FECHAACCIDENTE: TDBDateEdit
            Left = 9
            Top = 34
            Width = 88
            Height = 21
            DataField = 'EX_FECHAACCIDENTE'
            DataSource = dsDatos
            DialogTitle = 'Seleccione una Fecha.'
            NumGlyphs = 2
            TabOrder = 0
            StartOfWeek = Sun
            OnEnter = OnEnter
            OnExit = OnExit
          end
          object edEX_HORAACCIDENTE: TTimeEditor
            Left = 101
            Top = 34
            Width = 37
            Height = 21
            TabOrder = 1
            OnEnter = OnEnter
            OnExit = OnExit
            CustomFormat = 'HH:mm'
          end
          object gbAdicionalesAccidenteDeTrabajo: TJvgGroupBox
            Left = 2
            Top = 244
            Width = 641
            Height = 93
            Align = alBottom
            Caption = ' Adicionales '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
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
            Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GlyphCollapsed.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            GlyphExpanded.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            OnCollapsed = CambioTamanio
            OnExpanded = CambioTamanio
            DesignSize = (
              641
              93)
            FullHeight = 93
            object Label10: TLabel
              Left = 8
              Top = 24
              Width = 143
              Height = 13
              Caption = 'Motivo de NO Carga de Datos'
            end
            object Label7: TLabel
              Left = 8
              Top = 48
              Width = 137
              Height = 13
              AutoSize = False
              Caption = 'Gravedad presunta'
            end
            object Label21: TLabel
              Left = 340
              Top = 44
              Width = 71
              Height = 13
              Caption = 'Observaciones'
            end
            inline fraDE_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA
              Left = 160
              Top = 20
              Width = 476
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 160
              ExplicitTop = 20
              ExplicitWidth = 476
              DesignSize = (
                476
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 413
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 413
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqDatosDE_IDMOTIVONOCARGA
                DataSource = dsDatos
              end
            end
            inline fraDE_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD
              Left = 8
              Top = 64
              Width = 197
              Height = 23
              TabOrder = 1
              ExplicitLeft = 8
              ExplicitTop = 64
              ExplicitWidth = 197
              DesignSize = (
                197
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 134
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 134
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqDatosDE_IDGRAVEDAD
                DataSource = dsDatos
                FieldID = 'TG_ID'
              end
            end
            object edDE_OBSERVACIONES: TDBMemo
              Left = 340
              Top = 60
              Width = 296
              Height = 29
              Anchors = [akLeft, akTop, akRight]
              BevelWidth = 0
              DataField = 'DE_OBSERVACIONES'
              DataSource = dsDatos
              ScrollBars = ssVertical
              TabOrder = 3
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object rgDE_ACCIDENTETRANSITO: TDBRadioGroup
              Left = 212
              Top = 50
              Width = 121
              Height = 41
              Caption = ' Accidente de tr'#225'nsito '
              Columns = 2
              DataField = 'DE_ACCIDENTETRANSITO'
              DataSource = dsDatos
              Items.Strings = (
                'Si'
                'No')
              ParentBackground = True
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                'S'
                'N')
            end
          end
          object gbDiagnostico: TJvgGroupBox
            Left = 2
            Top = 170
            Width = 641
            Height = 74
            Align = alBottom
            Caption = ' Diagn'#243'stico '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 14
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
            Options = [fgoCanCollapse, fgoCollapseOther, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GlyphCollapsed.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            GlyphExpanded.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            OnCollapsed = CambioTamanio
            OnExpanded = CambioTamanio
            DesignSize = (
              641
              74)
            FullHeight = 71
            object Label1: TLabel
              Left = 6
              Top = 26
              Width = 61
              Height = 13
              AutoSize = False
              Caption = 'Diagn'#243'stico'
            end
            object Label2: TLabel
              Left = 4
              Top = 52
              Width = 37
              Height = 13
              AutoSize = False
              Caption = 'CIE-10'
            end
            object Label11: TLabel
              Left = 305
              Top = 52
              Width = 80
              Height = 13
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'Gravedad CIE10'
            end
            inline fraDE_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO
              Left = 48
              Top = 48
              Width = 250
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ExplicitLeft = 48
              ExplicitTop = 48
              ExplicitWidth = 250
              DesignSize = (
                250
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 187
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 187
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqDatosDE_IDDIAGNOSTICO
                DataSource = dsDatos
                OnChange = fraDE_IDDIAGNOSTICOPropiedadesChange
              end
            end
            inline fraDE_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10
              Left = 389
              Top = 48
              Width = 247
              Height = 23
              Anchors = [akTop, akRight]
              TabOrder = 3
              ExplicitLeft = 389
              ExplicitTop = 48
              ExplicitWidth = 247
              DesignSize = (
                247
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 184
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 184
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqDatosDE_IDGRAVEDAD_CIE10
                DataSource = dsDatos
              end
            end
            object edDE_DIAGNOSTICO: TDBMemo
              Left = 64
              Top = 23
              Width = 496
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              BevelWidth = 0
              DataField = 'DE_DIAGNOSTICO'
              DataSource = dsDatos
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object chkInternado: TDBCheckBox
              Left = 565
              Top = 26
              Width = 73
              Height = 17
              Hint = 'Genera un parte evolutivo si se especifica el prestador'
              Anchors = [akTop, akRight]
              Caption = 'Internado'
              DataField = 'DE_INTERNACION'
              DataSource = dsDatos
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          inline fraDE_IDDIAGNOSTICO1: TfraCDG_DIAGNOSTICO
            Left = 79
            Top = 97
            Width = 231
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            ExplicitLeft = 79
            ExplicitTop = 97
            ExplicitWidth = 231
            DesignSize = (
              231
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 168
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 168
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDDIAGNOSTICO
              DataSource = dsDatos
              OnChange = fraCDG_DIAGNOSTICO1PropiedadesChange
            end
          end
          inline fraDE_IDLESIONNATURALEZA2: TfraSLN_LESIONNATURALEZA
            Left = 323
            Top = 120
            Width = 153
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 9
            ExplicitLeft = 323
            ExplicitTop = 120
            ExplicitWidth = 153
            DesignSize = (
              153
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 90
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 90
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONNATURALEZA2
              DataSource = dsDatos
            end
          end
          inline fraDE_IDLESIONZONA2: TfraSLZ_LESIONZONA
            Left = 323
            Top = 143
            Width = 153
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 10
            ExplicitLeft = 323
            ExplicitTop = 143
            ExplicitWidth = 153
            DesignSize = (
              153
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 90
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 90
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONZONA2
              DataSource = dsDatos
            end
          end
          inline fraDE_IDDIAGNOSTICO2: TfraCDG_DIAGNOSTICO
            Left = 323
            Top = 97
            Width = 153
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 8
            ExplicitLeft = 323
            ExplicitTop = 97
            ExplicitWidth = 153
            DesignSize = (
              153
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 90
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 90
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDDIAGNOSTICO2
              DataSource = dsDatos
            end
          end
          inline fraDE_IDLESIONNATURALEZA3: TfraSLN_LESIONNATURALEZA
            Left = 486
            Top = 120
            Width = 152
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 12
            ExplicitLeft = 486
            ExplicitTop = 120
            ExplicitWidth = 152
            DesignSize = (
              152
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 89
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 89
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONNATURALEZA3
              DataSource = dsDatos
            end
          end
          inline fraDE_IDLESIONZONA3: TfraSLZ_LESIONZONA
            Left = 486
            Top = 143
            Width = 152
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 13
            ExplicitLeft = 486
            ExplicitTop = 143
            ExplicitWidth = 152
            DesignSize = (
              152
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 89
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 89
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONZONA3
              DataSource = dsDatos
            end
          end
          inline fraDE_IDDIAGNOSTICO3: TfraCDG_DIAGNOSTICO
            Left = 486
            Top = 97
            Width = 152
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 11
            ExplicitLeft = 486
            ExplicitTop = 97
            ExplicitWidth = 152
            DesignSize = (
              152
              23)
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 89
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 89
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDDIAGNOSTICO3
              DataSource = dsDatos
            end
          end
          inline fraDE_IDLESIONAGENTE: TfraSLM_LESIONAGENTEMATERIAL
            Left = 8
            Top = 73
            Width = 293
            Height = 23
            TabOrder = 3
            ExplicitLeft = 8
            ExplicitTop = 73
            ExplicitWidth = 293
            inherited edCodigo: TPatternEdit
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inherited cmbDescripcion: TComboGrid
              Width = 230
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitWidth = 230
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja'
                'SubTitulo'
                'Titulo')
              ColWidths = (
                50
                320
                -1
                -1
                -1
                -1)
            end
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDLESIONAGENTE
              DataSource = dsDatos
            end
          end
        end
      end
    end
    object tsEP: TTabSheet
      Caption = 'En&fermedad Profesional'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbC: TScrollBox
        Left = 0
        Top = 0
        Width = 649
        Height = 357
        Align = alClient
        TabOrder = 0
        object gbEnfermedadProfesional: TJvgGroupBox
          Left = 0
          Top = 16
          Width = 645
          Height = 281
          Align = alTop
          Caption = ' Enfermedad Profesional '
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
          Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          FullHeight = 212
          object gbDatosEnfermedadProfesional: TJvgGroupBox
            Left = 2
            Top = 181
            Width = 641
            Height = 98
            Align = alBottom
            Caption = ' Datos de la Enfermedad Profesional '
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
            Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            OnCollapsed = CambioTamanio
            OnExpanded = CambioTamanio
            DesignSize = (
              641
              98)
            FullHeight = 108
            object Label47: TLabel
              Left = 4
              Top = 18
              Width = 125
              Height = 13
              AutoSize = False
              Caption = 'Agente causante'
            end
            object Label48: TLabel
              Left = 172
              Top = 18
              Width = 66
              Height = 13
              AutoSize = False
              Caption = 'Diagn'#243'stico'
            end
            object Label49: TLabel
              Left = 280
              Top = 18
              Width = 37
              Height = 13
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'CIE-10'
            end
            object Label50: TLabel
              Left = 459
              Top = 18
              Width = 134
              Height = 13
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'Gravedad del CIE10'
            end
            object Label51: TLabel
              Left = 450
              Top = 58
              Width = 60
              Height = 13
              Caption = 'Fecha de Dx'
            end
            object Label53: TLabel
              Left = 4
              Top = 58
              Width = 117
              Height = 13
              AutoSize = False
              Caption = 'Agente material'
            end
            object Label54: TLabel
              Left = 176
              Top = 58
              Width = 66
              Height = 13
              AutoSize = False
              Caption = 'Zona'
            end
            object Label55: TLabel
              Left = 362
              Top = 58
              Width = 50
              Height = 13
              Caption = 'Exposici'#243'n'
            end
            object Label70: TLabel
              Left = 536
              Top = 58
              Width = 92
              Height = 13
              AutoSize = False
              Caption = 'Modo de detecci'#243'n'
            end
            inline fraEP_IDLESIONAGENTE: TfraSLA_LESIONAGENTE
              Left = 0
              Top = 34
              Width = 169
              Height = 23
              TabOrder = 0
              ExplicitTop = 34
              ExplicitWidth = 169
              DesignSize = (
                169
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 106
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 106
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqEnfermedadProfesionalEP_IDLESIONAGENTE
                DataSource = dsEnfermedadProfesional
              end
            end
            inline fraEP_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO
              Left = 280
              Top = 34
              Width = 177
              Height = 23
              Anchors = [akTop, akRight]
              TabOrder = 2
              ExplicitLeft = 280
              ExplicitTop = 34
              ExplicitWidth = 177
              DesignSize = (
                177
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 114
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 114
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqEnfermedadProfesionalEP_IDDIAGNOSTICO
                DataSource = dsEnfermedadProfesional
              end
            end
            object edEP_DIAGNOSTICO: TDBMemo
              Left = 172
              Top = 35
              Width = 105
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              BevelWidth = 0
              DataField = 'EP_DIAGNOSTICO'
              DataSource = dsEnfermedadProfesional
              ScrollBars = ssVertical
              TabOrder = 1
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inline fraEP_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10
              Left = 459
              Top = 34
              Width = 170
              Height = 23
              Anchors = [akTop, akRight]
              TabOrder = 3
              ExplicitLeft = 459
              ExplicitTop = 34
              ExplicitWidth = 170
              DesignSize = (
                170
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 108
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 108
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqEnfermedadProfesionalEP_IDGRAVEDAD_CIE10
                DataSource = dsEnfermedadProfesional
              end
            end
            object edEP_FECHADIAGNOSTICO: TDBDateEdit
              Left = 448
              Top = 75
              Width = 88
              Height = 21
              DataField = 'EP_FECHADIAGNOSTICO'
              DataSource = dsEnfermedadProfesional
              DialogTitle = 'Seleccione una Fecha.'
              NumGlyphs = 2
              TabOrder = 7
              StartOfWeek = Sun
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inline fraEP_IDLESIONZONA: TfraSLZ_LESIONZONA
              Left = 172
              Top = 74
              Width = 184
              Height = 23
              TabOrder = 5
              ExplicitLeft = 172
              ExplicitTop = 74
              ExplicitWidth = 184
              DesignSize = (
                184
                23)
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 121
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 121
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
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqEnfermedadProfesionalEP_IDLESIONZONA
                DataSource = dsEnfermedadProfesional
              end
            end
            object edEP_TIEMPOEXPOSICION: TDBDateEdit
              Left = 358
              Top = 75
              Width = 88
              Height = 21
              DataField = 'EP_TIEMPOEXPOSICION'
              DataSource = dsEnfermedadProfesional
              DialogTitle = 'Seleccione una Fecha.'
              NumGlyphs = 2
              TabOrder = 6
              StartOfWeek = Sun
              OnEnter = OnEnter
              OnExit = OnExit
            end
            inline fraEP_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL
              Left = 0
              Top = 74
              Width = 169
              Height = 23
              TabOrder = 4
              ExplicitTop = 74
              ExplicitWidth = 169
              inherited edCodigo: TPatternEdit
                OnEnter = OnEnter
                OnExit = OnExit
              end
              inherited cmbDescripcion: TComboGrid
                Width = 106
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 106
                Cells = (
                  'C'#243'digo'
                  'Descripci'#243'n'
                  'Id'
                  'Fecha de Baja'
                  'SubTitulo'
                  'Titulo')
                ColWidths = (
                  40
                  300
                  -1
                  -1
                  -1
                  -1)
              end
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqEnfermedadProfesionalEP_IDLESIONAGENTEMATERIAL
                DataSource = dsEnfermedadProfesional
              end
            end
            inline fraEP_MODODETECCION: TfraCodDesc
              Left = 536
              Top = 74
              Width = 93
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 8
              ExplicitLeft = 536
              ExplicitTop = 74
              ExplicitWidth = 93
              inherited cmbDescripcion: TArtComboBox
                Left = 20
                Width = 30
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitLeft = 20
                ExplicitWidth = 30
              end
              inherited edCodigo: TPatternEdit
                Width = 16
                OnEnter = OnEnter
                OnExit = OnExit
                ExplicitWidth = 16
              end
              inherited Propiedades: TPropiedadesFrame
                DataField = sdqEnfermedadProfesionalEP_MODODETECCION
                DataSource = dsEnfermedadProfesional
                FieldBaja = 'MD_FECHABAJA'
                FieldCodigo = 'MD_CODIGO'
                FieldDesc = 'MD_DESCRIPCION'
                FieldID = 'MD_ID'
                IdType = ctInteger
                OrderBy = 'MD_DESCRIPCION'
                TableName = 'SIN.SMD_MODODETECCION'
                Left = 28
              end
            end
          end
          object ToolBarEnfermedadProfesional: TToolBar
            Left = 2
            Top = 16
            Width = 641
            Height = 26
            BorderWidth = 1
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Agregar (Ctrl+Shift+N)'
              Caption = '&Asas'
              ImageIndex = 6
              OnClick = tbNuevoClick
            end
            object tbModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+Shift+M)'
              Enabled = False
              ImageIndex = 7
              OnClick = tbModificarClick
            end
            object tbEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Ctrl+Shift+E)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbEliminarClick
            end
            object tbSep1: TToolButton
              Left = 69
              Top = 0
              Width = 4
              Caption = 'tbSep1'
              ImageIndex = 41
              Style = tbsSeparator
            end
            object tbGuardar: TToolButton
              Left = 73
              Top = 0
              Hint = 'Guardar (Ctrl+Shift+G)'
              Caption = 'Guardar'
              ImageIndex = 3
              OnClick = tbGuardarClick
            end
            object tbCancelar: TToolButton
              Left = 96
              Top = 0
              Hint = 'Cancelar (Ctrl+Shift+C)'
              Caption = 'Cancelar'
              ImageIndex = 39
              OnClick = tbCancelarClick
            end
          end
          object GridEnfermedadesProfesionales: TArtDBGrid
            Left = 2
            Top = 42
            Width = 641
            Height = 139
            Align = alClient
            Color = clWhite
            DataSource = dsEnfermedadProfesional
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = tbModificarClick
            OnKeyDown = GridEnfermedadesProfesionalesKeyDown
            IniStorage = FormStorage
            FooterBand = False
            TitleHeight = 34
            AutoTitleHeight = True
            Columns = <
              item
                Expanded = False
                FieldName = 'LA_DESCRIPCION'
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EP_DIAGNOSTICO'
                Width = 128
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DG_DESCRIPCION'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TC_DESCRIPCION'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EP_IDEXPEDIENTE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EP_IDLESIONAGENTE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EP_IDDIAGNOSTICO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EP_IDGRAVEDAD_CIE10'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LM_DESCRIPCION'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EP_IDLESIONAGENTEMATERIAL'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EP_IDLESIONZONA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EP_TIEMPOEXPOSICION'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EP_FECHADIAGNOSTICO'
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EP_FORMADIAGNOSTICO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EP_FECHAINICIOINASISTENCIALABO'
                Title.Caption = 'Inicio inasistencia laboral'
                Width = 116
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MD_DESCRIPCION'
                Title.Caption = 'Modo de detecci'#243'n'
                Visible = True
              end>
          end
        end
        object gbObservacionesEP: TJvgGroupBox
          Left = 0
          Top = 0
          Width = 645
          Height = 16
          Align = alTop
          Caption = ' Observaciones'
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
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.FromColor = 10461087
          CaptionGradient.ToColor = clSilver
          CaptionGradient.Active = True
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Collapsed = True
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
          Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          GlyphCollapsed.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          GlyphExpanded.Data = {
            DE000000424DDE0000000000000076000000280000000F0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
            7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
            FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
            FFF0}
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          DesignSize = (
            645
            16)
          FullHeight = 83
          object Label71: TLabel
            Left = 8
            Top = 60
            Width = 143
            Height = 13
            Caption = 'Motivo de NO Carga de Datos'
            Visible = False
          end
          object edDE_OBSERVACIONES_EP: TDBMemo
            Left = 8
            Top = 24
            Width = 630
            Height = 29
            Anchors = [akLeft, akTop, akRight]
            BevelWidth = 0
            DataField = 'DE_OBSERVACIONES'
            DataSource = dsDatos
            ScrollBars = ssVertical
            TabOrder = 0
            Visible = False
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inline fraDE_IDMOTIVONOCARGA2: TfraSMC_MOTIVONOCARGA
            Left = 160
            Top = 56
            Width = 557
            Height = 23
            TabOrder = 1
            Visible = False
            ExplicitLeft = 160
            ExplicitTop = 56
            ExplicitWidth = 557
            DesignSize = (
              557
              23)
            inherited cmbDescripcion: TComboGrid
              Width = 494
              ExplicitWidth = 494
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
            inherited Propiedades: TPropiedadesFrame
              DataField = sdqDatosDE_IDMOTIVONOCARGA
              DataSource = dsDatos
            end
          end
        end
      end
    end
    object tsE: TTabSheet
      Caption = 'Prestador / Arc&hivo'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gbPrestador: TJvgGroupBox
        Left = 0
        Top = 0
        Width = 649
        Height = 81
        Align = alTop
        Caption = ' Datos del prestador '
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
        Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        OnCollapsed = CambioTamanio
        OnExpanded = CambioTamanio
        DesignSize = (
          649
          81)
        FullHeight = 81
        inline fraDE_IDPRESTADOR: TfraPrestadorFueraDeContrato
          Left = 4
          Top = 22
          Width = 642
          Height = 54
          VertScrollBar.Range = 49
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 4
          ExplicitTop = 22
          ExplicitWidth = 642
          ExplicitHeight = 54
          DesignSize = (
            642
            54)
          inherited lbCPostal: TLabel
            Left = 563
            ExplicitLeft = 563
          end
          inherited mskCA_CLAVE: TMaskEdit
            TabStop = False
            TabOrder = 1
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inherited cmbCA_DESCRIPCION: TArtComboBox
            Width = 312
            TabOrder = 0
            OnEnter = OnEnter
            OnExit = OnExit
            ExplicitWidth = 312
          end
          inherited edCA_LOCALIDAD: TEdit
            Width = 188
            ExplicitWidth = 188
          end
          inherited edCA_CODPOSTAL: TEdit
            Left = 587
            ExplicitLeft = 587
          end
          inherited edCA_IDENTIFICADOR: TIntEdit
            TabStop = False
            TabOrder = 3
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inherited edCA_SECUENCIA: TIntEdit
            TabStop = False
            TabOrder = 2
            OnEnter = OnEnter
            OnExit = OnExit
          end
          inherited gbPrestadorFueraDeContrato: TJvgGroupBox
            Width = 642
            ExplicitWidth = 642
            FullHeight = 72
            inherited fraDomicilioExtra: TfraDomicilio
              Width = 448
              ExplicitWidth = 448
              inherited lbNro: TLabel
                Left = 233
                ExplicitLeft = 233
              end
              inherited lbPiso: TLabel
                Left = 305
                ExplicitLeft = 305
              end
              inherited lbDto: TLabel
                Left = 381
                ExplicitLeft = 381
              end
              inherited lbProvincia: TLabel
                Left = 286
                ExplicitLeft = 286
              end
              inherited cmbCalle: TArtComboBox
                Width = 148
                ExplicitWidth = 148
              end
              inherited edNumero: TEdit
                Left = 255
                ExplicitLeft = 255
              end
              inherited edPiso: TEdit
                Left = 331
                ExplicitLeft = 331
              end
              inherited edDto: TEdit
                Left = 403
                ExplicitLeft = 403
              end
              inherited cmbLocalidad: TArtComboBox
                Width = 25
                ExplicitWidth = 25
              end
              inherited edProvincia: TEdit
                Left = 335
                ExplicitLeft = 335
              end
              inherited btnBuscar: TButton
                Left = 198
                ExplicitLeft = 198
              end
            end
          end
          inherited sdqDatos: TSDQuery
            Left = 4
            Top = 20
          end
          inherited dsDatos: TDataSource
            Left = 32
            Top = 20
          end
        end
      end
      object gbArchivo: TJvgGroupBox
        Left = 0
        Top = 81
        Width = 649
        Height = 81
        Align = alTop
        Caption = ' Sistema de Archivo '
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
        OnCollapsed = CambioTamanio
        OnExpanded = CambioTamanio
        DesignSize = (
          649
          81)
        FullHeight = 81
        object Label19: TLabel
          Left = 458
          Top = 28
          Width = 96
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fecha de Recepci'#243'n'
        end
        object Label8: TLabel
          Left = 6
          Top = 28
          Width = 68
          Height = 13
          Caption = 'Sector de Alta'
        end
        object Label4: TLabel
          Left = 286
          Top = 28
          Width = 74
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fecha de carga'
        end
        inline fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO
          Left = 8
          Top = 52
          Width = 481
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ExplicitLeft = 8
          ExplicitTop = 52
          ExplicitWidth = 481
          ExplicitHeight = 21
          DesignSize = (
            481
            21)
          inherited Label2: TLabel
            Left = 334
            ExplicitLeft = 334
          end
          inherited cmbDA_OPCION: TComboBox
            Width = 255
            OnEnter = OnEnter
            OnExit = OnExit
            ExplicitWidth = 255
          end
          inherited edDA_HOJAS: TIntEdit
            Left = 426
            OnEnter = OnEnter
            OnExit = OnExit
            ExplicitLeft = 426
          end
        end
        object edDE_FECHARECEPCION: TDBDateEdit
          Left = 558
          Top = 24
          Width = 88
          Height = 21
          DataField = 'DE_FECHARECEPCION'
          DataSource = dsDatos
          DialogTitle = 'Seleccione una Fecha.'
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 2
          StartOfWeek = Sun
          OnEnter = OnEnter
          OnExit = OnExit
        end
        object edSector: TDBEdit
          Left = 80
          Top = 24
          Width = 198
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'SE_SECTOR'
          DataSource = dsDatos
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          OnEnter = GetFocus
        end
        object edDE_FECHAALTA: TDBDateEdit
          Left = 366
          Top = 24
          Width = 88
          Height = 21
          DataField = 'DE_FECHAALTA'
          DataSource = dsDatos
          Color = clBtnFace
          DialogTitle = 'Seleccione una Fecha.'
          Enabled = False
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 1
          StartOfWeek = Sun
          OnEnter = GetFocus
        end
      end
    end
    object tsDP: TTabSheet
      Caption = 'Denunci&a policial'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbD: TScrollBox
        Left = 0
        Top = 0
        Width = 649
        Height = 357
        Align = alClient
        TabOrder = 0
        object gbDenunciaPolicial: TJvgGroupBox
          Left = 0
          Top = 0
          Width = 645
          Height = 205
          Align = alTop
          Caption = ' Denuncia Policial '
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
          Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          OnCollapsed = CambioTamanio
          OnExpanded = CambioTamanio
          DesignSize = (
            645
            205)
          FullHeight = 205
          object rgDenunciaPolicial: TDBRadioGroup
            Left = 8
            Top = 24
            Width = 642
            Height = 173
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Otros datos del Siniestro [Sumario Policial] '
            DataField = 'DE_ITINERE_DENUNCIAPOLICIAL'
            DataSource = dsDatos
            Items.Strings = (
              'S&i'
              '&No')
            ParentBackground = True
            TabOrder = 0
            Values.Strings = (
              'S'
              'N')
            OnChange = rgDenunciaPolicialChange
          end
          object pnl: TPanel
            Left = 88
            Top = 40
            Width = 556
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              556
              23)
            object Label30: TLabel
              Left = 387
              Top = 5
              Width = 47
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tel'#233'fonos'
            end
            object Label32: TLabel
              Left = 11
              Top = 5
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
            end
            object Label41: TLabel
              Left = 139
              Top = 5
              Width = 46
              Height = 13
              Caption = 'Comisar'#237'a'
            end
            object edDE_ITINERE_COM_TELEFONOS: TDBEdit
              Left = 438
              Top = 1
              Width = 116
              Height = 21
              TabStop = False
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_COM_TELEFONOS'
              DataSource = dsDatos
              TabOrder = 2
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_COMISARIA: TDBEdit
              Left = 188
              Top = 1
              Width = 193
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_COMISARIA'
              DataSource = dsDatos
              TabOrder = 1
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_NRODENUNCIA: TDBEdit
              Left = 52
              Top = 1
              Width = 81
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_NRODENUNCIA'
              DataSource = dsDatos
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = OnExit
            end
          end
          inline fraDomicilioDenuncia: TfraDomicilio
            Left = 95
            Top = 67
            Width = 547
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ExplicitLeft = 95
            ExplicitTop = 67
            ExplicitWidth = 547
            ExplicitHeight = 47
            DesignSize = (
              547
              47)
            inherited lbCalle: TLabel
              Left = 17
              ExplicitLeft = 17
            end
            inherited lbNro: TLabel
              Left = 332
              ExplicitLeft = 332
            end
            inherited lbPiso: TLabel
              Left = 404
              ExplicitLeft = 404
            end
            inherited lbDto: TLabel
              Left = 480
              ExplicitLeft = 480
            end
            inherited lbCPostal: TLabel
              Top = 30
              ExplicitTop = 30
            end
            inherited lbCPA: TLabel
              Left = 102
              Top = 30
              ExplicitLeft = 102
              ExplicitTop = 30
            end
            inherited lbLocalidad: TLabel
              Left = 210
              Top = 30
              ExplicitLeft = 210
              ExplicitTop = 30
            end
            inherited lbProvincia: TLabel
              Left = 385
              Top = 30
              ExplicitLeft = 385
              ExplicitTop = 30
            end
            inherited cmbCalle: TArtComboBox
              Left = 46
              Width = 247
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 46
              ExplicitWidth = 247
            end
            inherited edNumero: TEdit
              Left = 354
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 354
            end
            inherited edPiso: TEdit
              Left = 430
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 430
            end
            inherited edDto: TEdit
              Left = 502
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 502
            end
            inherited edCPostal: TIntEdit
              Left = 46
              Top = 26
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 46
              ExplicitTop = 26
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 262
              Top = 26
              Width = 115
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 262
              ExplicitTop = 26
              ExplicitWidth = 115
            end
            inherited edProvincia: TEdit
              Left = 434
              Top = 26
              ExplicitLeft = 434
              ExplicitTop = 26
            end
            inherited edCPA: TPatternEdit
              Left = 128
              Top = 26
              OnEnter = OnEnter
              OnExit = OnExit
              ExplicitLeft = 128
              ExplicitTop = 26
            end
            inherited btnBuscar: TButton
              Left = 297
              ExplicitLeft = 297
            end
          end
          object pnlTestigo1: TPanel
            Left = 84
            Top = 114
            Width = 562
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 3
            DesignSize = (
              562
              25)
            object Label27: TLabel
              Left = 8
              Top = 8
              Width = 44
              Height = 13
              Caption = 'Testigo 1'
            end
            object Label31: TLabel
              Left = 208
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Domicilio'
            end
            object Label33: TLabel
              Left = 405
              Top = 8
              Width = 47
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tel'#233'fonos'
            end
            object edDE_ITINERE_TESTIGO1_TELEFONOS: TDBEdit
              Left = 457
              Top = 4
              Width = 103
              Height = 21
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TESTIGO1_TELEFONOS'
              DataSource = dsDatos
              TabOrder = 2
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_TESTIGO1_DOMICILIO: TDBEdit
              Left = 251
              Top = 4
              Width = 151
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TESTIGO1_DOMICILIO'
              DataSource = dsDatos
              TabOrder = 1
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_TESTIGO1_NOMBRE: TDBEdit
              Left = 57
              Top = 4
              Width = 146
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TESTIGO1_NOMBRE'
              DataSource = dsDatos
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = OnExit
            end
          end
          object pnlTestigo2: TPanel
            Left = 84
            Top = 139
            Width = 562
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 4
            DesignSize = (
              562
              25)
            object Label34: TLabel
              Left = 8
              Top = 8
              Width = 44
              Height = 13
              Caption = 'Testigo 2'
            end
            object Label35: TLabel
              Left = 208
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Domicilio'
            end
            object Label36: TLabel
              Left = 405
              Top = 8
              Width = 47
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tel'#233'fonos'
            end
            object edDE_ITINERE_TESTIGO2_TELEFONOS: TDBEdit
              Left = 457
              Top = 4
              Width = 103
              Height = 21
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TESTIGO2_TELEFONOS'
              DataSource = dsDatos
              TabOrder = 2
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_TESTIGO2_DOMICILIO: TDBEdit
              Left = 251
              Top = 4
              Width = 151
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TESTIGO2_DOMICILIO'
              DataSource = dsDatos
              TabOrder = 1
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_TESTIGO2_NOMBRE: TDBEdit
              Left = 57
              Top = 4
              Width = 146
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TESTIGO2_NOMBRE'
              DataSource = dsDatos
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = OnExit
            end
          end
          object pnlTerceros: TPanel
            Left = 16
            Top = 164
            Width = 630
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 5
            DesignSize = (
              630
              25)
            object Label37: TLabel
              Left = 10
              Top = 8
              Width = 111
              Height = 13
              Caption = 'Terceros Responsables'
            end
            object Label38: TLabel
              Left = 276
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Domicilio'
            end
            object Label39: TLabel
              Left = 473
              Top = 8
              Width = 47
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tel'#233'fonos'
            end
            object edDE_ITINERE_TERCERO_RESP_TEL: TDBEdit
              Left = 525
              Top = 4
              Width = 103
              Height = 21
              Anchors = [akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TERCERO_RESP_TEL'
              DataSource = dsDatos
              TabOrder = 2
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_TERCERO_RESP_DOM: TDBEdit
              Left = 320
              Top = 4
              Width = 150
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TERCERO_RESP_DOM'
              DataSource = dsDatos
              TabOrder = 1
              OnEnter = OnEnter
              OnExit = OnExit
            end
            object edDE_ITINERE_TERCERO_RESP_NOMBRE: TDBEdit
              Left = 125
              Top = 4
              Width = 146
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DE_ITINERE_TERCERO_RESP_NOMBRE'
              DataSource = dsDatos
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = OnExit
            end
          end
        end
      end
    end
  end
  inherited sdqDatos: TSDQuery
    OnNewRecord = sdqDatosNewRecord
    SQL.Strings = (
      'SELECT DE_ID, DE_IDEXPEDIENTE, NVL(DE_TAREAHABITUAL,'
      
        '       SINIESTRO.GET_TAREATRABAJADOR (DE_IDEXPEDIENTE)) as DE_TA' +
        'REAHABITUAL,'
      
        '       DE_TAREAACCIDENTE, DE_ANTIGUEDADPUESTO, DE_ANIOSPUESTO, D' +
        'E_MESESPUESTO,'
      
        '       DE_IDGRAVEDAD, DE_DESCRIPCION, DE_DIAGNOSTICO, DE_IDDIAGN' +
        'OSTICO,'
      
        '       DE_IDLESIONFORMA, DE_IDLESIONAGENTE, DE_IDLESIONNATURALEZ' +
        'A, DE_IDLESIONZONA,'
      
        '       DE_HORJORNADA1DESDE, DE_HORJORNADA1HASTA, DE_HORJORNADA2D' +
        'ESDE,'
      
        '       DE_HORJORNADA2HASTA, DE_IDPRESTADOR, DE_EPMANIFESTACION, ' +
        'DE_IDMOTIVONOCARGA,'
      
        '       DE_EPEXPUESTODESDE, DE_OBSERVACIONES, DE_FECHARECEPCION, ' +
        'DE_USUALTA USUARIO,'
      '       DE_FECHAALTA, DE_USUMODIF, DE_FECHAMODIF,'
      
        '       DE_IDGRAVEDAD_CIE10, SE_SECTOR, EX_FECHAALTA, EX_FECHAACC' +
        'IDENTE, EX_HORAACCIDENTE,'
      
        '       NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) as FACCREC, EX_TI' +
        'PO, DE_TIPO,'
      
        '       EX_FECHARECEPCION, DE_ACCIDENTETRANSITO, DE_SUBTIPO, DE_I' +
        'NICIOINASISTENCIALABORAL, '
      '       UD_TIPO_ESTAB AS UBICACION_DENUNCIA,'
      
        '       UD_ESTABLECIMIENTO AS DE_UBICACION_ESTABLECIMIENTO, UD_NO' +
        'MBRE AS DE_UBICACION_NOMBRE,'
      
        '       UD_CALLE AS DE_UBICACION_CALLE, UD_NUMERO AS DE_UBICACION' +
        '_NUMERO,'
      
        '       UD_PISO AS DE_UBICACION_PISO, UD_DEPARTAMENTO AS DE_UBICA' +
        'CION_DEPARTAMENTO,'
      
        '       UD_LOCALIDAD AS DE_UBICACION_LOCALIDAD, UD_CPOSTAL AS DE_' +
        'UBICACION_CPOSTAL,'
      
        '       UD_CPOSTALA AS DE_UBICACION_CPOSTALA, UD_PROVINCIA AS DE_' +
        'UBICACION_PROVINCIA,'
      
        '       UD_TELEFONOS AS DE_UBICACION_TELEFONOS, UD_PAIS AS DE_UBI' +
        'CACION_PAIS, UD_NROESTABLECIMIENTOAFIP,'
      
        '       UD_CODAREATELEFONOS AS DE_UBICACION_CODAREATELEFONOS, UD_' +
        'CUITOCURRE DE_UBICACION_CUITOCURRE,'
      '       UD_SECUENCIA_PARTIDOLOCALIDAD,'
      '       CPV_1.PV_DESCRIPCION PROV_1, CPV_2.PV_DESCRIPCION PROV_2,'
      
        '       DE_ITINERE_DENUNCIAPOLICIAL, DE_ITINERE_COMISARIA, DE_ITI' +
        'NERE_COM_CALLE,'
      
        '       DE_ITINERE_COM_NUMERO, DE_ITINERE_COM_PISO, DE_ITINERE_CO' +
        'M_DEPARTAMENTO,'
      
        '       DE_ITINERE_COM_CPOSTAL, DE_ITINERE_COM_CPOSTALA, DE_ITINE' +
        'RE_COM_LOCALIDAD,'
      '       DE_ITINERE_COM_PROVINCIA, DE_ITINERE_NRODENUNCIA,'
      '       DE_ITINERE_PRIMEROS_AUXILIOS, DE_ITINERE_COM_TELEFONOS,'
      
        '       DE_ITINERE_TESTIGO1_NOMBRE, DE_ITINERE_TESTIGO1_DOMICILIO' +
        ', DE_ITINERE_TESTIGO1_TELEFONOS,'
      
        '       DE_ITINERE_TESTIGO2_NOMBRE, DE_ITINERE_TESTIGO2_DOMICILIO' +
        ', DE_ITINERE_TESTIGO2_TELEFONOS,'
      
        '       DE_ITINERE_TERCERO_RESP_NOMBRE, DE_ITINERE_TERCERO_RESP_D' +
        'OM, DE_ITINERE_TERCERO_RESP_TEL,'
      
        '       DE_INTERNACION, CAST(NULL AS VARCHAR2(1)) AS DA_OPCION, T' +
        'O_NUMBER(NULL) AS DA_HOJAS,'
      
        '       DE_PRESTADOR_NOMBRE, DE_PRESTADOR_TELEFONOS, DE_PRESTADOR' +
        '_CALLE,'
      
        '       DE_PRESTADOR_NUMERO, DE_PRESTADOR_PISO, DE_PRESTADOR_DEPA' +
        'RTAMENTO,'
      
        '       DE_PRESTADOR_LOCALIDAD, DE_PRESTADOR_CPOSTAL, DE_PRESTADO' +
        'R_CPOSTALA,'
      '       DE_PRESTADOR_PROVINCIA,'
      
        '       DE_TAREAANTERIOR, DE_ANTIGUEDADPUESTOANTERIOR, DE_ANIOSPU' +
        'ESTOANTERIOR, DE_MESESPUESTOANTERIOR,'
      
        '       DE_IDDIAGNOSTICO2, DE_IDDIAGNOSTICO3, DE_IDLESIONNATURALE' +
        'ZA2, DE_IDLESIONNATURALEZA3,'
      
        '       DE_IDLESIONZONA2, DE_IDLESIONZONA3, DE_QUIENDENUNCIA, UD_' +
        'ESTABLECIMIENTO_TEMP, UD_IDEXPEDIENTE,'
      '       DE_BAJAMEDICA, EX_ALTAMEDICA'
      
        '  FROM SEX_EXPEDIENTES, CPV_PROVINCIAS CPV_1, CPV_PROVINCIAS CPV' +
        '_2,'
      '       SIN.SUD_UBICACIONDENUNCIA, USE_USUARIOS, SIN.SDE_DENUNCIA'
      ' WHERE DE_IDEXPEDIENTE = :DE_IDEXPEDIENTE'
      '   AND EX_ID = DE_IDEXPEDIENTE'
      '   AND EX_ID = UD_IDEXPEDIENTE (+)'
      '   AND SE_USUARIO (+) = DE_USUALTA'
      '   AND CPV_1.PV_CODIGO (+) = UD_PROVINCIA'
      '   AND CPV_2.PV_CODIGO (+) = DE_ITINERE_COM_PROVINCIA')
    UniDirectional = True
    Left = 420
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DE_IDEXPEDIENTE'
        ParamType = ptInput
      end>
    object sdqDatosDE_ID: TFloatField
      FieldName = 'DE_ID'
      Required = True
    end
    object sdqDatosDE_IDEXPEDIENTE: TFloatField
      FieldName = 'DE_IDEXPEDIENTE'
      Required = True
    end
    object sdqDatosDE_TAREAHABITUAL: TFloatField
      FieldName = 'DE_TAREAHABITUAL'
    end
    object sdqDatosDE_TAREAACCIDENTE: TFloatField
      FieldName = 'DE_TAREAACCIDENTE'
    end
    object sdqDatosDE_ANTIGUEDADPUESTO: TDateTimeField
      FieldName = 'DE_ANTIGUEDADPUESTO'
    end
    object sdqDatosDE_ANIOSPUESTO: TFloatField
      FieldName = 'DE_ANIOSPUESTO'
    end
    object sdqDatosDE_MESESPUESTO: TFloatField
      FieldName = 'DE_MESESPUESTO'
    end
    object sdqDatosDE_IDGRAVEDAD: TFloatField
      FieldName = 'DE_IDGRAVEDAD'
    end
    object sdqDatosDE_DESCRIPCION: TStringField
      FieldName = 'DE_DESCRIPCION'
      Size = 250
    end
    object sdqDatosDE_DIAGNOSTICO: TStringField
      FieldName = 'DE_DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosDE_IDDIAGNOSTICO: TFloatField
      FieldName = 'DE_IDDIAGNOSTICO'
    end
    object sdqDatosDE_IDLESIONFORMA: TFloatField
      FieldName = 'DE_IDLESIONFORMA'
    end
    object sdqDatosDE_IDLESIONAGENTE: TFloatField
      FieldName = 'DE_IDLESIONAGENTE'
    end
    object sdqDatosDE_IDLESIONNATURALEZA: TFloatField
      FieldName = 'DE_IDLESIONNATURALEZA'
    end
    object sdqDatosDE_IDLESIONZONA: TFloatField
      FieldName = 'DE_IDLESIONZONA'
    end
    object sdqDatosDE_HORJORNADA1DESDE: TStringField
      FieldName = 'DE_HORJORNADA1DESDE'
      Size = 5
    end
    object sdqDatosDE_HORJORNADA1HASTA: TStringField
      FieldName = 'DE_HORJORNADA1HASTA'
      Size = 5
    end
    object sdqDatosDE_HORJORNADA2DESDE: TStringField
      FieldName = 'DE_HORJORNADA2DESDE'
      Size = 5
    end
    object sdqDatosDE_HORJORNADA2HASTA: TStringField
      FieldName = 'DE_HORJORNADA2HASTA'
      Size = 5
    end
    object sdqDatosDE_IDPRESTADOR: TFloatField
      FieldName = 'DE_IDPRESTADOR'
    end
    object sdqDatosDE_EPMANIFESTACION: TDateTimeField
      FieldName = 'DE_EPMANIFESTACION'
    end
    object sdqDatosDE_EPEXPUESTODESDE: TDateTimeField
      FieldName = 'DE_EPEXPUESTODESDE'
    end
    object sdqDatosDE_OBSERVACIONES: TStringField
      FieldName = 'DE_OBSERVACIONES'
      Size = 250
    end
    object sdqDatosDE_FECHARECEPCION: TDateTimeField
      FieldName = 'DE_FECHARECEPCION'
    end
    object sdqDatosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
    end
    object sdqDatosDE_FECHAALTA: TDateTimeField
      FieldName = 'DE_FECHAALTA'
      Required = True
    end
    object sdqDatosDE_USUMODIF: TStringField
      FieldName = 'DE_USUMODIF'
    end
    object sdqDatosDE_FECHAMODIF: TDateTimeField
      FieldName = 'DE_FECHAMODIF'
    end
    object sdqDatosDE_IDMOTIVONOCARGA: TFloatField
      FieldName = 'DE_IDMOTIVONOCARGA'
    end
    object sdqDatosDE_IDGRAVEDAD_CIE10: TFloatField
      FieldName = 'DE_IDGRAVEDAD_CIE10'
    end
    object sdqDatosSE_SECTOR: TStringField
      FieldName = 'SE_SECTOR'
      Size = 8
    end
    object sdqDatosEX_FECHAALTA: TDateTimeField
      FieldName = 'EX_FECHAALTA'
    end
    object sdqDatosEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqDatosFACCREC: TDateTimeField
      FieldName = 'FACCREC'
    end
    object sdqDatosEX_TIPO: TStringField
      FieldName = 'EX_TIPO'
      Size = 1
    end
    object sdqDatosEX_FECHARECEPCION: TDateTimeField
      FieldName = 'EX_FECHARECEPCION'
    end
    object sdqDatosDE_TIPO: TStringField
      FieldName = 'DE_TIPO'
      Size = 1
    end
    object sdqDatosUBICACION_DENUNCIA: TStringField
      FieldName = 'UBICACION_DENUNCIA'
      Size = 1
    end
    object sdqDatosDE_UBICACION_ESTABLECIMIENTO: TFloatField
      FieldName = 'DE_UBICACION_ESTABLECIMIENTO'
    end
    object sdqDatosDE_UBICACION_NOMBRE: TStringField
      FieldName = 'DE_UBICACION_NOMBRE'
      Size = 100
    end
    object sdqDatosDE_UBICACION_CALLE: TStringField
      FieldName = 'DE_UBICACION_CALLE'
      Size = 60
    end
    object sdqDatosDE_UBICACION_NUMERO: TStringField
      FieldName = 'DE_UBICACION_NUMERO'
    end
    object sdqDatosDE_UBICACION_PISO: TStringField
      FieldName = 'DE_UBICACION_PISO'
    end
    object sdqDatosDE_UBICACION_DEPARTAMENTO: TStringField
      FieldName = 'DE_UBICACION_DEPARTAMENTO'
    end
    object sdqDatosDE_UBICACION_LOCALIDAD: TStringField
      FieldName = 'DE_UBICACION_LOCALIDAD'
      Size = 60
    end
    object sdqDatosDE_UBICACION_CPOSTAL: TStringField
      FieldName = 'DE_UBICACION_CPOSTAL'
      Size = 5
    end
    object sdqDatosDE_UBICACION_CPOSTALA: TStringField
      FieldName = 'DE_UBICACION_CPOSTALA'
      Size = 8
    end
    object sdqDatosDE_UBICACION_PROVINCIA: TStringField
      FieldName = 'DE_UBICACION_PROVINCIA'
      Size = 2
    end
    object sdqDatosDE_UBICACION_TELEFONOS: TStringField
      FieldName = 'DE_UBICACION_TELEFONOS'
      Size = 60
    end
    object sdqDatosDE_UBICACION_PAIS: TStringField
      FieldName = 'DE_UBICACION_PAIS'
      Size = 3
    end
    object sdqDatosDE_UBICACION_CODAREATELEFONOS: TStringField
      FieldName = 'DE_UBICACION_CODAREATELEFONOS'
      Size = 5
    end
    object sdqDatosDE_UBICACION_CUITOCURRE: TStringField
      FieldName = 'DE_UBICACION_CUITOCURRE'
      EditMask = '##-########-c;0;_'
      Size = 11
    end
    object sdqDatosDE_ITINERE_DENUNCIAPOLICIAL: TStringField
      FieldName = 'DE_ITINERE_DENUNCIAPOLICIAL'
      Size = 1
    end
    object sdqDatosDE_ITINERE_COMISARIA: TStringField
      FieldName = 'DE_ITINERE_COMISARIA'
      Size = 50
    end
    object sdqDatosDE_ITINERE_COM_CALLE: TStringField
      FieldName = 'DE_ITINERE_COM_CALLE'
      Size = 60
    end
    object sdqDatosDE_ITINERE_COM_NUMERO: TStringField
      FieldName = 'DE_ITINERE_COM_NUMERO'
      Size = 6
    end
    object sdqDatosDE_ITINERE_COM_PISO: TStringField
      FieldName = 'DE_ITINERE_COM_PISO'
      Size = 6
    end
    object sdqDatosDE_ITINERE_COM_DEPARTAMENTO: TStringField
      FieldName = 'DE_ITINERE_COM_DEPARTAMENTO'
      Size = 6
    end
    object sdqDatosDE_ITINERE_COM_CPOSTAL: TStringField
      FieldName = 'DE_ITINERE_COM_CPOSTAL'
      Size = 5
    end
    object sdqDatosDE_ITINERE_COM_CPOSTALA: TStringField
      FieldName = 'DE_ITINERE_COM_CPOSTALA'
      Size = 8
    end
    object sdqDatosDE_ITINERE_COM_LOCALIDAD: TStringField
      FieldName = 'DE_ITINERE_COM_LOCALIDAD'
      Size = 85
    end
    object sdqDatosDE_ITINERE_COM_PROVINCIA: TStringField
      FieldName = 'DE_ITINERE_COM_PROVINCIA'
      Size = 2
    end
    object sdqDatosDE_ITINERE_NRODENUNCIA: TStringField
      FieldName = 'DE_ITINERE_NRODENUNCIA'
      Size = 10
    end
    object sdqDatosDE_ITINERE_PRIMEROS_AUXILIOS: TStringField
      FieldName = 'DE_ITINERE_PRIMEROS_AUXILIOS'
      Size = 1
    end
    object sdqDatosDE_ITINERE_COM_TELEFONOS: TStringField
      FieldName = 'DE_ITINERE_COM_TELEFONOS'
      Size = 60
    end
    object sdqDatosPROV_1: TStringField
      FieldName = 'PROV_1'
      Size = 50
    end
    object sdqDatosPROV_2: TStringField
      FieldName = 'PROV_2'
      Size = 50
    end
    object sdqDatosDE_ITINERE_TESTIGO1_NOMBRE: TStringField
      FieldName = 'DE_ITINERE_TESTIGO1_NOMBRE'
      Size = 60
    end
    object sdqDatosDE_ITINERE_TESTIGO1_DOMICILIO: TStringField
      FieldName = 'DE_ITINERE_TESTIGO1_DOMICILIO'
      Size = 150
    end
    object sdqDatosDE_ITINERE_TESTIGO1_TELEFONOS: TStringField
      FieldName = 'DE_ITINERE_TESTIGO1_TELEFONOS'
      Size = 60
    end
    object sdqDatosDE_ITINERE_TESTIGO2_NOMBRE: TStringField
      FieldName = 'DE_ITINERE_TESTIGO2_NOMBRE'
      Size = 60
    end
    object sdqDatosDE_ITINERE_TESTIGO2_DOMICILIO: TStringField
      FieldName = 'DE_ITINERE_TESTIGO2_DOMICILIO'
      Size = 150
    end
    object sdqDatosDE_ITINERE_TESTIGO2_TELEFONOS: TStringField
      FieldName = 'DE_ITINERE_TESTIGO2_TELEFONOS'
      Size = 60
    end
    object sdqDatosDE_ITINERE_TERCERO_RESP_NOMBRE: TStringField
      FieldName = 'DE_ITINERE_TERCERO_RESP_NOMBRE'
      Size = 60
    end
    object sdqDatosDE_ITINERE_TERCERO_RESP_DOM: TStringField
      FieldName = 'DE_ITINERE_TERCERO_RESP_DOM'
      Size = 150
    end
    object sdqDatosDE_ITINERE_TERCERO_RESP_TEL: TStringField
      FieldName = 'DE_ITINERE_TERCERO_RESP_TEL'
      Size = 60
    end
    object sdqDatosDE_ACCIDENTETRANSITO: TStringField
      FieldName = 'DE_ACCIDENTETRANSITO'
      Size = 1
    end
    object sdqDatosDE_INTERNACION: TStringField
      FieldName = 'DE_INTERNACION'
      Size = 1
    end
    object sdqDatosDE_PRESTADOR_NOMBRE: TStringField
      FieldName = 'DE_PRESTADOR_NOMBRE'
      Size = 100
    end
    object sdqDatosDE_PRESTADOR_TELEFONOS: TStringField
      FieldName = 'DE_PRESTADOR_TELEFONOS'
      Size = 60
    end
    object sdqDatosDE_PRESTADOR_CALLE: TStringField
      FieldName = 'DE_PRESTADOR_CALLE'
      Size = 60
    end
    object sdqDatosDE_PRESTADOR_NUMERO: TStringField
      FieldName = 'DE_PRESTADOR_NUMERO'
    end
    object sdqDatosDE_PRESTADOR_PISO: TStringField
      FieldName = 'DE_PRESTADOR_PISO'
    end
    object sdqDatosDE_PRESTADOR_DEPARTAMENTO: TStringField
      FieldName = 'DE_PRESTADOR_DEPARTAMENTO'
    end
    object sdqDatosDE_PRESTADOR_LOCALIDAD: TStringField
      FieldName = 'DE_PRESTADOR_LOCALIDAD'
      Size = 60
    end
    object sdqDatosDE_PRESTADOR_CPOSTAL: TStringField
      FieldName = 'DE_PRESTADOR_CPOSTAL'
      Size = 5
    end
    object sdqDatosDE_PRESTADOR_CPOSTALA: TStringField
      FieldName = 'DE_PRESTADOR_CPOSTALA'
      Size = 8
    end
    object sdqDatosDE_PRESTADOR_PROVINCIA: TStringField
      FieldName = 'DE_PRESTADOR_PROVINCIA'
      Size = 2
    end
    object sdqDatosDA_OPCION: TStringField
      FieldName = 'DA_OPCION'
      Size = 1
    end
    object sdqDatosDA_HOJAS: TFloatField
      FieldName = 'DA_HOJAS'
    end
    object sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD: TFloatField
      FieldName = 'UD_SECUENCIA_PARTIDOLOCALIDAD'
    end
    object sdqDatosUD_NROESTABLECIMIENTOAFIP: TFloatField
      FieldName = 'UD_NROESTABLECIMIENTOAFIP'
    end
    object sdqDatosDE_INICIOINASISTENCIALABORAL: TDateTimeField
      FieldName = 'DE_INICIOINASISTENCIALABORAL'
    end
    object sdqDatosEX_HORAACCIDENTE: TStringField
      FieldName = 'EX_HORAACCIDENTE'
      Size = 5
    end
    object sdqDatosDE_SUBTIPO: TStringField
      FieldName = 'DE_SUBTIPO'
      Size = 1
    end
    object sdqDatosDE_TAREAANTERIOR: TFloatField
      FieldName = 'DE_TAREAANTERIOR'
    end
    object sdqDatosDE_ANTIGUEDADPUESTOANTERIOR: TDateTimeField
      FieldName = 'DE_ANTIGUEDADPUESTOANTERIOR'
    end
    object sdqDatosDE_ANIOSPUESTOANTERIOR: TFloatField
      FieldName = 'DE_ANIOSPUESTOANTERIOR'
    end
    object sdqDatosDE_MESESPUESTOANTERIOR: TFloatField
      FieldName = 'DE_MESESPUESTOANTERIOR'
    end
    object sdqDatosDE_IDDIAGNOSTICO2: TFloatField
      FieldName = 'DE_IDDIAGNOSTICO2'
    end
    object sdqDatosDE_IDDIAGNOSTICO3: TFloatField
      FieldName = 'DE_IDDIAGNOSTICO3'
    end
    object sdqDatosDE_IDLESIONNATURALEZA2: TFloatField
      FieldName = 'DE_IDLESIONNATURALEZA2'
    end
    object sdqDatosDE_IDLESIONNATURALEZA3: TFloatField
      FieldName = 'DE_IDLESIONNATURALEZA3'
    end
    object sdqDatosDE_IDLESIONZONA2: TFloatField
      FieldName = 'DE_IDLESIONZONA2'
    end
    object sdqDatosDE_IDLESIONZONA3: TFloatField
      FieldName = 'DE_IDLESIONZONA3'
    end
    object sdqDatosDE_QUIENDENUNCIA: TStringField
      FieldName = 'DE_QUIENDENUNCIA'
      Size = 1
    end
    object sdqDatosUD_ESTABLECIMIENTO_TEMP: TFloatField
      FieldName = 'UD_ESTABLECIMIENTO_TEMP'
    end
    object sdqDatosUD_IDEXPEDIENTE: TFloatField
      FieldName = 'UD_IDEXPEDIENTE'
    end
    object sdqDatosde_bajamedica: TDateTimeField
      FieldName = 'de_bajamedica'
    end
    object sdqDatosEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
  end
  inherited dsDatos: TDataSource
    OnUpdateData = dsDatosUpdateData
    Left = 448
    Top = 290
  end
  inherited sduDatos: TSDUpdateSQL
    ModifySQL.Strings = (
      'DECLARE'
      '  iNUMERO NUMBER (8);'
      'BEGIN'
      '  /* MODIFICO LA DENUNCIA */'
      ''
      '  UPDATE SIN.SDE_DENUNCIA'
      '  SET'
      '    DE_ID = :DE_ID,'
      '    DE_IDEXPEDIENTE = :DE_IDEXPEDIENTE,'
      '    DE_TAREAHABITUAL = :DE_TAREAHABITUAL,'
      '    DE_TAREAACCIDENTE = :DE_TAREAACCIDENTE,'
      '    DE_ANTIGUEDADPUESTO = :DE_ANTIGUEDADPUESTO,'
      '    DE_ANIOSPUESTO = :DE_ANIOSPUESTO,'
      '    DE_MESESPUESTO = :DE_MESESPUESTO,'
      '    DE_IDGRAVEDAD = :DE_IDGRAVEDAD,'
      '    DE_DESCRIPCION = :DE_DESCRIPCION,'
      '    DE_DIAGNOSTICO = :DE_DIAGNOSTICO,'
      '    DE_IDDIAGNOSTICO = :DE_IDDIAGNOSTICO,'
      '    DE_IDLESIONFORMA = :DE_IDLESIONFORMA,'
      '    DE_IDLESIONAGENTE = :DE_IDLESIONAGENTE,'
      '    DE_IDLESIONNATURALEZA = :DE_IDLESIONNATURALEZA,'
      '    DE_IDLESIONZONA = :DE_IDLESIONZONA,'
      
        '    DE_HORJORNADA1DESDE = DECODE(:DE_HORJORNADA1DESDE, '#39'__:__'#39', ' +
        'NULL, :DE_HORJORNADA1DESDE),'
      
        '    DE_HORJORNADA1HASTA = DECODE(:DE_HORJORNADA1HASTA, '#39'__:__'#39', ' +
        'NULL, :DE_HORJORNADA1HASTA),'
      
        '    DE_HORJORNADA2DESDE = DECODE(:DE_HORJORNADA2DESDE, '#39'__:__'#39', ' +
        'NULL, :DE_HORJORNADA2DESDE),'
      
        '    DE_HORJORNADA2HASTA = DECODE(:DE_HORJORNADA2HASTA, '#39'__:__'#39', ' +
        'NULL, :DE_HORJORNADA2HASTA),'
      
        '    DE_IDPRESTADOR = DECODE(:DE_IDPRESTADOR, 0, NULL, :DE_IDPRES' +
        'TADOR),'
      '    DE_EPMANIFESTACION = :DE_EPMANIFESTACION,'
      '    DE_EPEXPUESTODESDE = :DE_EPEXPUESTODESDE,'
      '    DE_OBSERVACIONES = :DE_OBSERVACIONES,'
      '    DE_FECHARECEPCION = :DE_FECHARECEPCION,'
      '    DE_TIPO = :DE_TIPO,'
      '    DE_USUMODIF = :USUARIO,'
      '    DE_FECHAMODIF = SYSDATE,'
      '    DE_IDGRAVEDAD_CIE10 = :DE_IDGRAVEDAD_CIE10,'
      '    DE_ITINERE_DENUNCIAPOLICIAL = :DE_ITINERE_DENUNCIAPOLICIAL,'
      '    DE_ITINERE_COMISARIA = :DE_ITINERE_COMISARIA,'
      '    DE_ITINERE_COM_CALLE = :DE_ITINERE_COM_CALLE,'
      '    DE_ITINERE_COM_NUMERO = :DE_ITINERE_COM_NUMERO,'
      '    DE_ITINERE_COM_PISO = :DE_ITINERE_COM_PISO,'
      '    DE_ITINERE_COM_DEPARTAMENTO = :DE_ITINERE_COM_DEPARTAMENTO,'
      '    DE_ITINERE_COM_CPOSTAL = :DE_ITINERE_COM_CPOSTAL,'
      '    DE_ITINERE_COM_CPOSTALA = :DE_ITINERE_COM_CPOSTALA,'
      '    DE_ITINERE_COM_LOCALIDAD = :DE_ITINERE_COM_LOCALIDAD,'
      '    DE_ITINERE_COM_PROVINCIA = :DE_ITINERE_COM_PROVINCIA,'
      '    DE_ITINERE_NRODENUNCIA = :DE_ITINERE_NRODENUNCIA,'
      
        '    DE_ITINERE_PRIMEROS_AUXILIOS = :DE_ITINERE_PRIMEROS_AUXILIOS' +
        ','
      '    DE_ITINERE_COM_TELEFONOS = :DE_ITINERE_COM_TELEFONOS,'
      '    DE_ITINERE_TESTIGO1_NOMBRE = :DE_ITINERE_TESTIGO1_NOMBRE,'
      
        '    DE_ITINERE_TESTIGO1_DOMICILIO = :DE_ITINERE_TESTIGO1_DOMICIL' +
        'IO,'
      
        '    DE_ITINERE_TESTIGO1_TELEFONOS = :DE_ITINERE_TESTIGO1_TELEFON' +
        'OS,'
      '    DE_ITINERE_TESTIGO2_NOMBRE = :DE_ITINERE_TESTIGO2_NOMBRE,'
      
        '    DE_ITINERE_TESTIGO2_DOMICILIO = :DE_ITINERE_TESTIGO2_DOMICIL' +
        'IO,'
      
        '    DE_ITINERE_TESTIGO2_TELEFONOS = :DE_ITINERE_TESTIGO2_TELEFON' +
        'OS,'
      
        '    DE_ITINERE_TERCERO_RESP_NOMBRE = :DE_ITINERE_TERCERO_RESP_NO' +
        'MBRE,'
      '    DE_ITINERE_TERCERO_RESP_DOM = :DE_ITINERE_TERCERO_RESP_DOM,'
      '    DE_ITINERE_TERCERO_RESP_TEL = :DE_ITINERE_TERCERO_RESP_TEL,'
      '    DE_ACCIDENTETRANSITO = :DE_ACCIDENTETRANSITO,'
      '    DE_INTERNACION = :DE_INTERNACION,'
      '    DE_PRESTADOR_NOMBRE = :DE_PRESTADOR_NOMBRE,'
      '    DE_PRESTADOR_TELEFONOS = :DE_PRESTADOR_TELEFONOS,'
      '    DE_PRESTADOR_CALLE = :DE_PRESTADOR_CALLE,'
      '    DE_PRESTADOR_NUMERO = :DE_PRESTADOR_NUMERO,'
      '    DE_PRESTADOR_PISO = :DE_PRESTADOR_PISO,'
      '    DE_PRESTADOR_DEPARTAMENTO = :DE_PRESTADOR_DEPARTAMENTO,'
      '    DE_PRESTADOR_LOCALIDAD = :DE_PRESTADOR_LOCALIDAD,'
      '    DE_PRESTADOR_CPOSTAL = :DE_PRESTADOR_CPOSTAL,'
      '    DE_PRESTADOR_CPOSTALA = :DE_PRESTADOR_CPOSTALA,'
      '    DE_PRESTADOR_PROVINCIA = :DE_PRESTADOR_PROVINCIA,'
      '    DE_IDMOTIVONOCARGA = :DE_IDMOTIVONOCARGA,'
      
        '    DE_INICIOINASISTENCIALABORAL = :DE_INICIOINASISTENCIALABORAL' +
        ','
      '    DE_SUBTIPO = :DE_SUBTIPO,'
      '    DE_TAREAANTERIOR = :DE_TAREAANTERIOR,'
      '    DE_ANTIGUEDADPUESTOANTERIOR = :DE_ANTIGUEDADPUESTOANTERIOR,'
      '    DE_ANIOSPUESTOANTERIOR = :DE_ANIOSPUESTOANTERIOR,'
      '    DE_MESESPUESTOANTERIOR = :DE_MESESPUESTOANTERIOR,'
      '    DE_IDDIAGNOSTICO2 = :DE_IDDIAGNOSTICO2,'
      '    DE_IDDIAGNOSTICO3 = :DE_IDDIAGNOSTICO3,'
      '    DE_IDLESIONNATURALEZA2 = :DE_IDLESIONNATURALEZA2,'
      '    DE_IDLESIONNATURALEZA3 = :DE_IDLESIONNATURALEZA3,'
      '    DE_IDLESIONZONA2 = :DE_IDLESIONZONA2,'
      '    DE_IDLESIONZONA3 = :DE_IDLESIONZONA3,'
      '    DE_QUIENDENUNCIA = :DE_QUIENDENUNCIA,'
      '    DE_BAJAMEDICA = :DE_BAJAMEDICA'
      '  WHERE'
      '    DE_ID = :OLD_DE_ID;'
      ''
      '  IF (:UD_IDEXPEDIENTE IS NULL) THEN'
      '      INSERT INTO SIN.SUD_UBICACIONDENUNCIA'
      '         (UD_IDEXPEDIENTE, UD_ESTABLECIMIENTO,'
      '          UD_NOMBRE, UD_CALLE, UD_NUMERO, UD_PISO,'
      '          UD_DEPARTAMENTO, UD_LOCALIDAD, UD_CPOSTAL,'
      
        '          UD_CPOSTALA, UD_PROVINCIA, UD_TELEFONOS, UD_USUALTA, U' +
        'D_FECHAALTA,'
      
        '          UD_PAIS, UD_CODAREATELEFONOS, UD_CUITOCURRE, UD_SECUEN' +
        'CIA_PARTIDOLOCALIDAD,'
      '          UD_ESTABLECIMIENTO_TEMP, UD_TIPO_ESTAB)'
      '      VALUES'
      '         (:DE_IDEXPEDIENTE, :DE_UBICACION_ESTABLECIMIENTO,'
      
        '          :DE_UBICACION_NOMBRE, :DE_UBICACION_CALLE, :DE_UBICACI' +
        'ON_NUMERO, :DE_UBICACION_PISO,'
      
        '          :DE_UBICACION_DEPARTAMENTO, :DE_UBICACION_LOCALIDAD, :' +
        'DE_UBICACION_CPOSTAL,'
      
        '          :DE_UBICACION_CPOSTALA, :DE_UBICACION_PROVINCIA, :DE_U' +
        'BICACION_TELEFONOS,'
      '          :USUARIO, SYSDATE,'
      
        '          :DE_UBICACION_PAIS, :DE_UBICACION_CODAREATELEFONOS, :D' +
        'E_UBICACION_CUITOCURRE,'
      
        '          :UD_SECUENCIA_PARTIDOLOCALIDAD, :UD_ESTABLECIMIENTO_TE' +
        'MP, :UBICACION_DENUNCIA);'
      '  ELSE'
      '    UPDATE SIN.SUD_UBICACIONDENUNCIA'
      '       SET UD_ESTABLECIMIENTO = :DE_UBICACION_ESTABLECIMIENTO,'
      '           UD_NOMBRE = :DE_UBICACION_NOMBRE,'
      '           UD_CALLE = :DE_UBICACION_CALLE,'
      '           UD_NUMERO = :DE_UBICACION_NUMERO,'
      '           UD_PISO = :DE_UBICACION_PISO,'
      '           UD_DEPARTAMENTO = :DE_UBICACION_DEPARTAMENTO,'
      '           UD_LOCALIDAD = :DE_UBICACION_LOCALIDAD,'
      '           UD_CPOSTAL = :DE_UBICACION_CPOSTAL,'
      '           UD_CPOSTALA = :DE_UBICACION_CPOSTALA,'
      '           UD_PROVINCIA = :DE_UBICACION_PROVINCIA,'
      '           UD_TELEFONOS = :DE_UBICACION_TELEFONOS,'
      '           UD_PAIS = :DE_UBICACION_PAIS,'
      '           UD_CODAREATELEFONOS = :DE_UBICACION_CODAREATELEFONOS,'
      '           UD_CUITOCURRE = :DE_UBICACION_CUITOCURRE,'
      '           UD_USUMODIF = :USUARIO,'
      '           UD_FECHAMODIF = SYSDATE,'
      
        '           UD_SECUENCIA_PARTIDOLOCALIDAD = :UD_SECUENCIA_PARTIDO' +
        'LOCALIDAD,'
      '           UD_ESTABLECIMIENTO_TEMP = :UD_ESTABLECIMIENTO_TEMP,'
      '           UD_TIPO_ESTAB = :UBICACION_DENUNCIA'
      '       WHERE UD_IDEXPEDIENTE = :DE_IDEXPEDIENTE;'
      '  END IF;'
      ''
      '  UPDATE ART.SEX_EXPEDIENTES'
      '     SET EX_HORAACCIDENTE = :EX_HORAACCIDENTE'
      '   WHERE EX_ID = :DE_IDEXPEDIENTE;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:DE_IDEXPEDIENTE, '#39'001'#39 +
        ', :USUARIO, :DE_FECHARECEPCION, NULL);'
      ''
      '  IF (:DA_OPCION <> '#39'S'#39') THEN'
      
        '    ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO (:DE_IDEXPEDIENTE, :DA_O' +
        'PCION, :DA_HOJAS, :USUARIO, '#39'DEN'#39', NULL);'
      '  END IF;'
      'END;')
    InsertSQL.Strings = (
      'DECLARE'
      '  SINIESTRO SEX_EXPEDIENTES.EX_SINIESTRO%TYPE;'
      '  ORDEN     SEX_EXPEDIENTES.EX_ORDEN%TYPE;'
      '  RECAIDA   SEX_EXPEDIENTES.EX_RECAIDA%TYPE;'
      ''
      '  BAJAMEDICA     SEX_EXPEDIENTES.EX_BAJAMEDICA%TYPE;'
      '  DIAGNOSTICOOMS SEX_EXPEDIENTES.EX_DIAGNOSTICOOMS%TYPE;'
      '  GRAVEDAD       SEX_EXPEDIENTES.EX_GRAVEDAD%TYPE;'
      'BEGIN'
      '  /* INSERTA LA DENUNCIA */'
      '  INSERT INTO SIN.SDE_DENUNCIA'
      
        '  (DE_ID, DE_IDEXPEDIENTE, DE_TAREAHABITUAL, DE_TAREAACCIDENTE, ' +
        'DE_ANTIGUEDADPUESTO,'
      
        '   DE_ANIOSPUESTO, DE_MESESPUESTO, DE_IDGRAVEDAD, DE_DESCRIPCION' +
        ', DE_DIAGNOSTICO,'
      
        '   DE_IDDIAGNOSTICO, DE_IDLESIONFORMA, DE_IDLESIONAGENTE, DE_IDL' +
        'ESIONNATURALEZA,'
      
        '   DE_IDLESIONZONA, DE_HORJORNADA1DESDE, DE_HORJORNADA1HASTA, DE' +
        '_HORJORNADA2DESDE,'
      
        '   DE_HORJORNADA2HASTA, DE_IDPRESTADOR, DE_EPMANIFESTACION, DE_E' +
        'PEXPUESTODESDE,'
      
        '   DE_OBSERVACIONES, DE_FECHARECEPCION, DE_USUALTA, DE_FECHAALTA' +
        ', DE_FECHACARGA, DE_TIPO,'
      '   DE_IDGRAVEDAD_CIE10,'
      
        '   DE_ITINERE_DENUNCIAPOLICIAL, DE_ITINERE_COMISARIA, DE_ITINERE' +
        '_COM_CALLE,'
      
        '   DE_ITINERE_COM_NUMERO, DE_ITINERE_COM_PISO, DE_ITINERE_COM_DE' +
        'PARTAMENTO,'
      
        '   DE_ITINERE_COM_CPOSTAL, DE_ITINERE_COM_CPOSTALA, DE_ITINERE_C' +
        'OM_LOCALIDAD,'
      '   DE_ITINERE_COM_PROVINCIA, DE_ITINERE_NRODENUNCIA,'
      '   DE_ITINERE_PRIMEROS_AUXILIOS, DE_ITINERE_COM_TELEFONOS,'
      
        '   DE_ITINERE_TESTIGO1_NOMBRE, DE_ITINERE_TESTIGO1_DOMICILIO, DE' +
        '_ITINERE_TESTIGO1_TELEFONOS,'
      
        '   DE_ITINERE_TESTIGO2_NOMBRE, DE_ITINERE_TESTIGO2_DOMICILIO, DE' +
        '_ITINERE_TESTIGO2_TELEFONOS,'
      
        '   DE_ITINERE_TERCERO_RESP_NOMBRE, DE_ITINERE_TERCERO_RESP_DOM, ' +
        'DE_ITINERE_TERCERO_RESP_TEL,'
      '   DE_ACCIDENTETRANSITO, DE_INTERNACION,'
      
        '   DE_PRESTADOR_NOMBRE, DE_PRESTADOR_TELEFONOS, DE_PRESTADOR_CAL' +
        'LE,'
      
        '   DE_PRESTADOR_NUMERO, DE_PRESTADOR_PISO, DE_PRESTADOR_DEPARTAM' +
        'ENTO,'
      
        '   DE_PRESTADOR_LOCALIDAD, DE_PRESTADOR_CPOSTAL, DE_PRESTADOR_CP' +
        'OSTALA,'
      
        '   DE_PRESTADOR_PROVINCIA, DE_IDMOTIVONOCARGA, DE_INICIOINASISTE' +
        'NCIALABORAL, DE_SUBTIPO,'
      
        '   DE_TAREAANTERIOR, DE_ANTIGUEDADPUESTOANTERIOR, DE_ANIOSPUESTO' +
        'ANTERIOR, DE_MESESPUESTOANTERIOR,'
      
        '   DE_IDDIAGNOSTICO2, DE_IDDIAGNOSTICO3, DE_IDLESIONNATURALEZA2,' +
        ' DE_IDLESIONNATURALEZA3,'
      
        '   DE_IDLESIONZONA2, DE_IDLESIONZONA3, DE_QUIENDENUNCIA, DE_BAJA' +
        'MEDICA)'
      '  VALUES'
      
        '  (:DE_ID, :DE_IDEXPEDIENTE, :DE_TAREAHABITUAL, :DE_TAREAACCIDEN' +
        'TE, :DE_ANTIGUEDADPUESTO,'
      
        '   :DE_ANIOSPUESTO, :DE_MESESPUESTO, :DE_IDGRAVEDAD, :DE_DESCRIP' +
        'CION, :DE_DIAGNOSTICO,'
      
        '   :DE_IDDIAGNOSTICO, :DE_IDLESIONFORMA, :DE_IDLESIONAGENTE, :DE' +
        '_IDLESIONNATURALEZA,'
      '   :DE_IDLESIONZONA,'
      
        '   DECODE(:DE_HORJORNADA1DESDE, '#39'__:__'#39', NULL, :DE_HORJORNADA1DE' +
        'SDE),'
      
        '   DECODE(:DE_HORJORNADA1HASTA, '#39'__:__'#39', NULL, :DE_HORJORNADA1HA' +
        'STA),'
      
        '   DECODE(:DE_HORJORNADA2DESDE, '#39'__:__'#39', NULL, :DE_HORJORNADA2DE' +
        'SDE),'
      
        '   DECODE(:DE_HORJORNADA2HASTA, '#39'__:__'#39', NULL, :DE_HORJORNADA2HA' +
        'STA),'
      
        '   DECODE(:DE_IDPRESTADOR, 0, NULL, :DE_IDPRESTADOR), :DE_EPMANI' +
        'FESTACION, :DE_EPEXPUESTODESDE,'
      
        '   :DE_OBSERVACIONES, :DE_FECHARECEPCION, :USUARIO, ART.ACTUALDA' +
        'TE, SYSDATE, :DE_TIPO,'
      '   :DE_IDGRAVEDAD_CIE10,'
      
        '   :DE_ITINERE_DENUNCIAPOLICIAL, :DE_ITINERE_COMISARIA, :DE_ITIN' +
        'ERE_COM_CALLE,'
      
        '   :DE_ITINERE_COM_NUMERO, :DE_ITINERE_COM_PISO, :DE_ITINERE_COM' +
        '_DEPARTAMENTO,'
      
        '   :DE_ITINERE_COM_CPOSTAL, :DE_ITINERE_COM_CPOSTALA, :DE_ITINER' +
        'E_COM_LOCALIDAD,'
      '   :DE_ITINERE_COM_PROVINCIA, :DE_ITINERE_NRODENUNCIA,'
      '   :DE_ITINERE_PRIMEROS_AUXILIOS, :DE_ITINERE_COM_TELEFONOS,'
      
        '   :DE_ITINERE_TESTIGO1_NOMBRE, :DE_ITINERE_TESTIGO1_DOMICILIO, ' +
        ':DE_ITINERE_TESTIGO1_TELEFONOS,'
      
        '   :DE_ITINERE_TESTIGO2_NOMBRE, :DE_ITINERE_TESTIGO2_DOMICILIO, ' +
        ':DE_ITINERE_TESTIGO2_TELEFONOS,'
      
        '   :DE_ITINERE_TERCERO_RESP_NOMBRE, :DE_ITINERE_TERCERO_RESP_DOM' +
        ', :DE_ITINERE_TERCERO_RESP_TEL,'
      '   :DE_ACCIDENTETRANSITO, :DE_INTERNACION,'
      
        '   :DE_PRESTADOR_NOMBRE, :DE_PRESTADOR_TELEFONOS, :DE_PRESTADOR_' +
        'CALLE,'
      
        '   :DE_PRESTADOR_NUMERO, :DE_PRESTADOR_PISO, :DE_PRESTADOR_DEPAR' +
        'TAMENTO,'
      
        '   :DE_PRESTADOR_LOCALIDAD, :DE_PRESTADOR_CPOSTAL, :DE_PRESTADOR' +
        '_CPOSTALA,'
      
        '   :DE_PRESTADOR_PROVINCIA, :DE_IDMOTIVONOCARGA, :DE_INICIOINASI' +
        'STENCIALABORAL, :DE_SUBTIPO,'
      
        '   :DE_TAREAANTERIOR, :DE_ANTIGUEDADPUESTOANTERIOR, :DE_ANIOSPUE' +
        'STOANTERIOR, :DE_MESESPUESTOANTERIOR,'
      
        '   :DE_IDDIAGNOSTICO2, :DE_IDDIAGNOSTICO3, :DE_IDLESIONNATURALEZ' +
        'A2, :DE_IDLESIONNATURALEZA3,'
      
        '   :DE_IDLESIONZONA2, :DE_IDLESIONZONA3, :DE_QUIENDENUNCIA, art.' +
        'iif_null(:DE_BAJAMEDICA, :DE_FECHARECEPCION, :DE_BAJAMEDICA));'
      ''
      '   BEGIN'
      '      INSERT INTO SIN.SUD_UBICACIONDENUNCIA'
      '         (UD_IDEXPEDIENTE, UD_ESTABLECIMIENTO,'
      '          UD_NOMBRE, UD_CALLE, UD_NUMERO, UD_PISO,'
      '          UD_DEPARTAMENTO, UD_LOCALIDAD, UD_CPOSTAL,'
      
        '          UD_CPOSTALA, UD_PROVINCIA, UD_TELEFONOS, UD_USUALTA, U' +
        'D_FECHAALTA, UD_NROESTABLECIMIENTOAFIP,'
      
        '          UD_PAIS, UD_CODAREATELEFONOS, UD_CUITOCURRE, UD_SECUEN' +
        'CIA_PARTIDOLOCALIDAD, UD_ESTABLECIMIENTO_TEMP,'
      '          UD_TIPO_ESTAB)'
      '      VALUES'
      '         (:DE_IDEXPEDIENTE, :DE_UBICACION_ESTABLECIMIENTO,'
      
        '          :DE_UBICACION_NOMBRE, :DE_UBICACION_CALLE, :DE_UBICACI' +
        'ON_NUMERO, :DE_UBICACION_PISO,'
      
        '          :DE_UBICACION_DEPARTAMENTO, :DE_UBICACION_LOCALIDAD, :' +
        'DE_UBICACION_CPOSTAL,'
      
        '          :DE_UBICACION_CPOSTALA, :DE_UBICACION_PROVINCIA, :DE_U' +
        'BICACION_TELEFONOS,'
      '          :USUARIO, SYSDATE, :UD_NROESTABLECIMIENTOAFIP,'
      
        '          :DE_UBICACION_PAIS, :DE_UBICACION_CODAREATELEFONOS, :D' +
        'E_UBICACION_CUITOCURRE,'
      
        '          :UD_SECUENCIA_PARTIDOLOCALIDAD, :UD_ESTABLECIMIENTO_TE' +
        'MP, :UBICACION_DENUNCIA);'
      '   EXCEPTION WHEN DUP_VAL_ON_INDEX THEN'
      '      UPDATE SIN.SUD_UBICACIONDENUNCIA'
      '         SET UD_ESTABLECIMIENTO = :DE_UBICACION_ESTABLECIMIENTO,'
      '             UD_NOMBRE = :DE_UBICACION_NOMBRE,'
      '             UD_CALLE = :DE_UBICACION_CALLE,'
      '             UD_NUMERO = :DE_UBICACION_NUMERO,'
      '             UD_PISO = :DE_UBICACION_PISO,'
      '             UD_DEPARTAMENTO = :DE_UBICACION_DEPARTAMENTO,'
      '             UD_LOCALIDAD = :DE_UBICACION_LOCALIDAD,'
      '             UD_CPOSTAL = :DE_UBICACION_CPOSTAL,'
      '             UD_CPOSTALA = :DE_UBICACION_CPOSTALA,'
      '             UD_PROVINCIA = :DE_UBICACION_PROVINCIA,'
      '             UD_TELEFONOS = :DE_UBICACION_TELEFONOS,'
      '             UD_PAIS = :DE_UBICACION_PAIS,'
      
        '             UD_CODAREATELEFONOS = :DE_UBICACION_CODAREATELEFONO' +
        'S,'
      '             UD_CUITOCURRE = :DE_UBICACION_CUITOCURRE,'
      '             UD_USUMODIF = :USUARIO,'
      '             UD_FECHAMODIF = SYSDATE,'
      
        '             UD_SECUENCIA_PARTIDOLOCALIDAD = :UD_SECUENCIA_PARTI' +
        'DOLOCALIDAD,'
      
        '             UD_NROESTABLECIMIENTOAFIP = :UD_NROESTABLECIMIENTOA' +
        'FIP,'
      '             UD_ESTABLECIMIENTO_TEMP = :UD_ESTABLECIMIENTO_TEMP,'
      '             UD_TIPO_ESTAB = :UBICACION_DENUNCIA'
      '       WHERE UD_IDEXPEDIENTE = :DE_IDEXPEDIENTE;'
      '   END;'
      ''
      '  IF (:DA_OPCION <> '#39'S'#39') THEN'
      
        '    ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO (:DE_IDEXPEDIENTE, :DA_O' +
        'PCION, :DA_HOJAS, :USUARIO, '#39'DEN'#39', NULL);'
      '  END IF;'
      ''
      '  UPDATE ART.SEX_EXPEDIENTES'
      '     SET EX_HORAACCIDENTE = :EX_HORAACCIDENTE'
      '   WHERE EX_ID = :DE_IDEXPEDIENTE;'
      '     '
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:DE_IDEXPEDIENTE, '#39'001'#39 +
        ', :USUARIO, :DE_FECHARECEPCION, NULL);'
      ''
      
        '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_DIAGNOSTICOOMS, ' +
        'EX_GRAVEDAD, EX_BAJAMEDICA'
      
        '    INTO SINIESTRO, ORDEN, RECAIDA, DIAGNOSTICOOMS, GRAVEDAD, BA' +
        'JAMEDICA'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :DE_IDEXPEDIENTE;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAR_DOCUMENTO (SINIESTRO, ORDEN, RECAI' +
        'DA, '#39'001'#39', :DE_FECHARECEPCION);'
      
        '  ART.SINIESTRO.DO_REGAUDITLOG_COMPLETO (:DE_IDEXPEDIENTE, '#39'SINI' +
        'ESTROS'#39','
      '                                         '#39'ADM. TABLAS DENUNCIA'#39','
      '                                         '#39'ALTA'#39', :USUARIO, -1,'
      '                                          DIAGNOSTICOOMS,'
      
        '                                          GRAVEDAD, '#39#39', '#39#39', '#39#39', ' +
        #39#39', '#39#39');'
      ''
      
        '  IF (:DE_INTERNACION = '#39'S'#39') AND (:DE_IDPRESTADOR IS NOT NULL) T' +
        'HEN'
      
        '    ART.SINIESTRO.DO_GENERAREVOLUTIVO('#39'DE'#39', :DE_IDEXPEDIENTE, :D' +
        'E_IDPRESTADOR,'
      
        '                                      :DE_DIAGNOSTICO, :DE_IDDIA' +
        'GNOSTICO, :DE_IDGRAVEDAD_CIE10, :DE_FECHARECEPCION,'
      
        '                                      :DE_FECHARECEPCION, NULL, ' +
        ':DE_OBSERVACIONES,'
      
        '                                      NULL, BAJAMEDICA, NULL, '#39'0' +
        '3'#39', NULL, NULL,'
      
        '                                      NULL, NULL, NULL, NULL, NU' +
        'LL, '#39'E'#39', :USUARIO, '#39'SINI'#39');'
      '  END IF;'
      'END;')
    DeleteSQL.Strings = (
      'DECLARE'
      '  SINIESTRO SEX_EXPEDIENTES.EX_SINIESTRO%TYPE;'
      '  ORDEN     SEX_EXPEDIENTES.EX_ORDEN%TYPE;'
      '  RECAIDA   SEX_EXPEDIENTES.EX_RECAIDA%TYPE;'
      'BEGIN'
      '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA'
      '    INTO SINIESTRO, ORDEN, RECAIDA'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :DE_IDEXPEDIENTE;'
      ''
      '  DELETE FROM SIN.SDE_DENUNCIA'
      '        WHERE DE_ID = :OLD_DE_ID;'
      ''
      '  DELETE FROM SDO_DOCUEXPESIN'
      '        WHERE DO_SINIESTRO = SINIESTRO'
      '          AND DO_ORDEN = ORDEN'
      '          AND DO_RECAIDA = RECAIDA'
      '          AND DO_CODIGO = '#39'001'#39';'
      ''
      
        '  ART.SINIESTRO.DO_GENERAREVOLUTIVO('#39'DE_VUELCO'#39', :DE_IDEXPEDIENT' +
        'E, :DE_IDPRESTADOR, :DE_DIAGNOSTICO, :DE_IDDIAGNOSTICO,'
      
        '                                    :DE_IDGRAVEDAD_CIE10, :DE_BA' +
        'JAMEDICA, :DE_FECHARECEPCION,'
      
        '                                    NULL /*INTERNACION*/, :DE_OB' +
        'SERVACIONES,'
      
        '                                    NULL /*DE_PRESUPINCAPACIDAD*' +
        '/, NULL /*INTERNADODESDE*/, NULL /*INTERNADOHASTA*/,'
      
        '                                    NULL /*TIPOTRATAMIENTO*/, NU' +
        'LL /*PLANREHABILIT*/, NULL /*DESDE*/, NULL /*HASTA*/,'
      
        '                                    NULL /*PROXIMOCONTROL*/, /*P' +
        'ROBABLEALTA*/ NULL, NULL /*PI_MEDICO*/,'
      
        '                                    NULL /*AUDITOR*/, '#39'A'#39' /*TIPO' +
        'PARTE*/, ART.GETOSUSER() /*USUARIO*/,'
      
        '                                    '#39'SINI'#39' /*MODULO*/, NULL /*PD' +
        'ESDELISTADO*/);'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:DE_IDEXPEDIENTE, '#39'001'#39 +
        ', ART.GETOSUSER(), SYSDATE, NULL, '#39'N'#39');'
      'END;')
    Left = 476
    Top = 290
  end
  inherited XPMenu: TXPMenu
    Left = 560
    Top = 317
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'asd'
      end>
    Left = 588
    Top = 317
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbAdicionalesAccidenteDeTrabajo.Collapsed'
      'gbDatos1.Collapsed'
      'gbDatosEnfermedadProfesional.Collapsed'
      'gbDiagnostico.Collapsed'
      'gbEnfermedadProfesional.Collapsed'
      'gbUbicacion.Collapsed'
      'gbLaboral.Collapsed'
      'gbObservacionesEP.Collapsed')
    Left = 532
    Top = 317
  end
  inherited Acciones: TActionList
    Left = 504
    Top = 290
  end
  object sdqEnfermedadProfesional: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEnfermedadProfesionalAfterOpen
    AfterPost = sdqEnfermedadProfesionalAfterPost
    AfterCancel = sdqEnfermedadProfesionalAfterCancel
    AfterScroll = sdqEnfermedadProfesionalAfterScroll
    SQL.Strings = (
      
        'SELECT SEP.ROWID, EP_IDEXPEDIENTE, EP_IDLESIONAGENTE, EP_DIAGNOS' +
        'TICO, EP_IDDIAGNOSTICO, EP_IDGRAVEDAD_CIE10,'
      
        '       EP_IDLESIONAGENTEMATERIAL, EP_IDLESIONZONA, EP_TIEMPOEXPO' +
        'SICION, EP_FECHADIAGNOSTICO,'
      
        '       EP_FORMADIAGNOSTICO, EP_FECHAINICIOINASISTENCIALABO, EP_F' +
        'ECHABAJA, EP_USUBAJA, TC_DESCRIPCION,'
      
        '       LA_DESCRIPCION, DG_DESCRIPCION, LM_DESCRIPCION, MD_DESCRI' +
        'PCION, EP_MODODETECCION'
      
        '  FROM SIN.SMD_MODODETECCION, SIN.SLM_LESIONAGENTEMATERIAL, SIN.' +
        'STC_TIPOGRAVEDAD_CIE10,'
      
        '       CDG_DIAGNOSTICO, SIN.SLA_LESIONAGENTE, SIN.SEP_ENFERMEDAD' +
        'PROFESIONAL SEP'
      ' WHERE EP_IDEXPEDIENTE = :ID'
      '   AND EP_IDLESIONAGENTE = LA_ID(+)'
      '   AND EP_IDDIAGNOSTICO = DG_ID'
      '   AND EP_IDGRAVEDAD_CIE10 = TC_ID'
      '   AND EP_IDLESIONAGENTEMATERIAL = LM_ID(+)'
      '   AND EP_MODODETECCION = MD_ID(+)')
    UpdateObject = sduEnfermedadProfesional
    Left = 420
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object sdqEnfermedadProfesionalEP_IDEXPEDIENTE: TFloatField
      DisplayLabel = 'Expediente'
      FieldName = 'EP_IDEXPEDIENTE'
      Required = True
    end
    object sdqEnfermedadProfesionalEP_IDLESIONAGENTE: TFloatField
      DisplayLabel = 'Id Lesi'#243'n agente'
      FieldName = 'EP_IDLESIONAGENTE'
    end
    object sdqEnfermedadProfesionalEP_DIAGNOSTICO: TStringField
      DisplayLabel = 'Descripci'#243'n (Diagn'#243'stico)'
      FieldName = 'EP_DIAGNOSTICO'
      Size = 250
    end
    object sdqEnfermedadProfesionalEP_IDDIAGNOSTICO: TFloatField
      DisplayLabel = 'Id Diagn'#243'stico'
      FieldName = 'EP_IDDIAGNOSTICO'
      Required = True
    end
    object sdqEnfermedadProfesionalEP_IDGRAVEDAD_CIE10: TFloatField
      DisplayLabel = 'Id Gravedad del CIE-10'
      FieldName = 'EP_IDGRAVEDAD_CIE10'
    end
    object sdqEnfermedadProfesionalEP_IDLESIONAGENTEMATERIAL: TFloatField
      DisplayLabel = 'Id Lesi'#243'n agente material'
      FieldName = 'EP_IDLESIONAGENTEMATERIAL'
    end
    object sdqEnfermedadProfesionalEP_IDLESIONZONA: TFloatField
      DisplayLabel = 'Id Lesi'#243'n zona'
      FieldName = 'EP_IDLESIONZONA'
    end
    object sdqEnfermedadProfesionalEP_TIEMPOEXPOSICION: TDateTimeField
      DisplayLabel = 'Tiempo exposici'#243'n'
      FieldName = 'EP_TIEMPOEXPOSICION'
    end
    object sdqEnfermedadProfesionalEP_FECHADIAGNOSTICO: TDateTimeField
      DisplayLabel = 'Fecha Diagn'#243'stico'
      FieldName = 'EP_FECHADIAGNOSTICO'
    end
    object sdqEnfermedadProfesionalEP_FORMADIAGNOSTICO: TFloatField
      DisplayLabel = 'Forma Diagn'#243'stico'
      FieldName = 'EP_FORMADIAGNOSTICO'
    end
    object sdqEnfermedadProfesionalEP_FECHAINICIOINASISTENCIALABO: TDateTimeField
      DisplayLabel = 'Fecha inicio inasistencia laboral'
      FieldName = 'EP_FECHAINICIOINASISTENCIALABO'
    end
    object sdqEnfermedadProfesionalEP_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'EP_FECHABAJA'
    end
    object sdqEnfermedadProfesionalEP_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'EP_USUBAJA'
    end
    object sdqEnfermedadProfesionalTC_DESCRIPCION: TStringField
      DisplayLabel = 'Gravedad CIE-10'
      FieldName = 'TC_DESCRIPCION'
      Size = 25
    end
    object sdqEnfermedadProfesionalLA_DESCRIPCION: TStringField
      DisplayLabel = 'Agente causante'
      FieldName = 'LA_DESCRIPCION'
      Size = 250
    end
    object sdqEnfermedadProfesionalDG_DESCRIPCION: TStringField
      DisplayLabel = 'Diagn'#243'stico (CIE-10)'
      FieldName = 'DG_DESCRIPCION'
      Size = 100
    end
    object sdqEnfermedadProfesionalLM_DESCRIPCION: TStringField
      DisplayLabel = 'Agente material asociado'
      FieldName = 'LM_DESCRIPCION'
      Size = 250
    end
    object sdqEnfermedadProfesionalMD_DESCRIPCION: TStringField
      FieldName = 'MD_DESCRIPCION'
      Size = 100
    end
    object sdqEnfermedadProfesionalEP_MODODETECCION: TFloatField
      FieldName = 'EP_MODODETECCION'
    end
    object sdqEnfermedadProfesionalROWID: TStringField
      FieldName = 'ROWID'
      Size = 18
    end
  end
  object dsEnfermedadProfesional: TDataSource
    DataSet = sdqEnfermedadProfesional
    OnUpdateData = dsEnfermedadProfesionalUpdateData
    Left = 448
    Top = 317
  end
  object sduEnfermedadProfesional: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE SIN.sep_enfermedadprofesional'
      '   SET ep_idexpediente = :ep_idexpediente,'
      '       ep_idlesionagente = :ep_idlesionagente,'
      '       ep_diagnostico = :ep_diagnostico,'
      '       ep_iddiagnostico = :ep_iddiagnostico,'
      '       ep_idgravedad_cie10 = :ep_idgravedad_cie10,'
      '       ep_idlesionagentematerial = :ep_idlesionagentematerial,'
      '       ep_idlesionzona = :ep_idlesionzona,'
      '       ep_tiempoexposicion = :ep_tiempoexposicion,'
      '       ep_fechadiagnostico = :ep_fechadiagnostico,'
      
        '       ep_fechainicioinasistencialabo = DECODE(:ep_fechainicioin' +
        'asistencialabo,'
      
        '                                               TO_DATE('#39'31/12/18' +
        '99'#39', '#39'DD/MM/YYYY'#39'), NULL,'
      
        '                                               :ep_fechainicioin' +
        'asistencialabo),'
      
        '       ep_mododeteccion = DECODE(:ep_mododeteccion, 0, NULL, :ep' +
        '_mododeteccion)'
      ' WHERE ep_idexpediente = :old_ep_idexpediente'
      '   AND ep_iddiagnostico = :old_ep_iddiagnostico')
    InsertSQL.Strings = (
      'INSERT INTO SIN.sep_enfermedadprofesional'
      
        '            (ep_idexpediente, ep_idlesionagente, ep_diagnostico,' +
        ' ep_iddiagnostico,'
      
        '             ep_idgravedad_cie10, ep_idlesionagentematerial, ep_' +
        'idlesionzona,'
      '             ep_tiempoexposicion, ep_fechadiagnostico,'
      '             ep_fechainicioinasistencialabo,'
      '             ep_mododeteccion)'
      
        '     VALUES (:ep_idexpediente, :ep_idlesionagente, :ep_diagnosti' +
        'co, :ep_iddiagnostico,'
      
        '             :ep_idgravedad_cie10, :ep_idlesionagentematerial, :' +
        'ep_idlesionzona,'
      '             :ep_tiempoexposicion, :ep_fechadiagnostico,'
      '             DECODE(:ep_fechainicioinasistencialabo,'
      '                    TO_DATE('#39'1899'#39', '#39'YYYY'#39'), NULL,'
      '                    :ep_fechainicioinasistencialabo),'
      
        '             DECODE(:ep_mododeteccion, 0, NULL, :ep_mododeteccio' +
        'n))')
    DeleteSQL.Strings = (
      'delete from SIN.sep_enfermedadprofesional'
      'where'
      '  EP_IDEXPEDIENTE = :OLD_EP_IDEXPEDIENTE and'
      '  EP_IDDIAGNOSTICO = :OLD_EP_IDDIAGNOSTICO')
    Left = 476
    Top = 317
  end
  object ImageListTabs: TImageList
    Left = 504
    Top = 317
    Bitmap = {
      494C010106000900080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000EFEFEF00ADA5
      AD009C949C009C949C009C949C009C949C009C949C009C949C009C949C009C94
      9C009C9C9C00A59CA500FFFFFF000000000000000000C6C6BD00BDBDB5009C9C
      9C00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00DEC6DE00BD84
      BD009C4A9C0094319400A552A500B56BB500B56BAD00A54A9C0094319400A54A
      9C00C68CBD00CE9CC600C6C6C60000000000F7F7F7008C8C4A00C6C69C00A5A5
      630084846B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700D6B5D600E7CEE700D6A5
      D600BD84BD00AD5AAD009C319C008C188C008C1084008C1084008C1084008C10
      84008C10840084108400CEC6CE0000000000DEDEDE00D6D6BD00C6C69400A59C
      6300737B42000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5ADB500F7EFF700EFDEEF00DEB5
      DE00CE8CCE00B563B5009C429C008C298C008418840084188400841884008418
      84008418840084187B000000000000000000DEDEDE00EFEFE700D6D6AD00B5B5
      73007B7B420000000000EFEFEF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADA5AD00F7EFF700EFD6EF00E7B5
      E700CE8CCE00EFEFEF00AD94AD00BDADBD00B59CB500ADA5AD0000000000DEDE
      DE00A59CA5009C949C00F7F7F70000000000DEDEDE00E7EFD600CED6AD00ADB5
      73007B844200FFFFFF00DEDECE00ADB57B00848C39007B8C31007B8C3100848C
      3900BDBD9400ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5ADB500F7D6EF00EFC6EF00E7AD
      E700AD8CAD00A594A500A55AA500C68CC600B573B50084298400FFFFFF00A563
      A500BD84BD00B573B5009C6B9C0000000000DEDEDE00CED6AD00BDC68C009CAD
      6300737B3900FFFFFF00F7FFF700F7F7EF00E7E7D600CECEB500B5BD8C009CA5
      6B009CA56B00D6DEBD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5ADB500EFB5EF00E7ADE700E794
      DE00AD7BAD00BDB5BD00F7D6F700E79CDE00CE5ACE00A5319C00F7F7F700E7D6
      E700EFC6EF00D68CD60094398C0000000000DEDEDE00A5B57B009CB56B008CA5
      4A00637B310000000000EFF7EF00EFEFE700DEDECE00C6CEAD00B5C68C009CB5
      6B008CA54A006B843100B5BD8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5A5B500E794E700E78CE700DE7B
      DE00A573A500FFFFFF00D6A5D600C67BC600B54AB500DEB5DE00F7F7F700F7E7
      F700F7C6EF00E794E700C65ABD0000000000EFEFEF0084A5520084A54A00739C
      3900638439000000000000000000000000000000000000000000BDC6A50094B5
      630084AD4A00739C390063843900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD9CAD00DE73D600DE6BD600D65A
      D600A5639C000000000000000000000000000000000000000000F7F7F700EFBD
      EF00EFA5E700DE7BDE00BD4ABD0000000000FFFFFF006B9C390073A5420073A5
      3900638C42000000000000000000000000000000000000000000E7E7E70084AD
      5A007BAD4A0073A54200638C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B5CE00CE4ACE00CE42CE00CE39
      C600B55AB500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A59CA500DE84
      D600DE73D600D652CE00B531B50000000000FFFFFF005A843900639C39006394
      3900A5ADA500CECECE00CECECE00CECECE00CECECE00B5B5B500DEE7D60073AD
      520073AD4A0073AD42005A943900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7C6DE00BD21BD00C621BD00BD21
      BD00A531A500BD84BD00AD7BAD00A56B9C00A56B9C00BD84BD00B56BB500C64A
      C600C639C600C629BD00A5189C0000000000DEDEDE00B5C68C00738C21006B84
      10006B8410006B8410006B8410006B8410007B943100A5B56B0084AD6B006BAD
      4A0073B54A006BAD4A006B945200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A510A500B510B500B510
      B500AD10AD00A5399C008C298C00841884008418840094298C00A510A500B510
      B500B510B500B510AD00C684C60000000000DEDEDE00F7FFF700EFF7EF00DEEF
      D600C6DEBD00B5D6A5009CC68C0084B5730073AD5A006BAD52006BB54A006BB5
      4A006BB54A005A9C420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7D6E7009C009C00A500
      A500AD00A500A500A500A500A500A500A500A500A500A500A500AD00A500AD00
      A500A5009C009C319C00000000000000000000000000DEEFDE00DEEFDE00CEE7
      CE00B5D6AD009CC6940084B573006BA55A005A9C4A0052944200529442005A94
      42009CBD94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEB5
      DE00C684BD00C684BD00C684BD00C684BD00C684BD00C684BD00C684BD00C694
      C600FFFFFF000000000000000000000000000000000000000000000000000000
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
      00000000000000000000E7B58C00DEAD7B00E7B58C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6DEE700006394000063940073ADC600ADCEDE00ADCED60073A5BD00186B
      8C0000527B0000528400CEDEE70000000000000000000000000000000000FFFF
      FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00000000000000
      0000F7F7F700F7F7F70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700F7F7F700F7F7F700FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000D6945200D69C5A00DE9C6300DEA56B00DE9C6300D69C6300D69452000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008739C000884AD001094BD0000739C000063940000638C0000638C00107B
      A500189CC60000638C00106384000000000000000000F7F7F70094B5BD009CF7
      FF0073EFFF006BEFFF006BEFFF007BEFFF00ADF7FF00B5D6DE000000000094AD
      B500CEFFFF00DEFFFF00B5BDBD00000000000000000000000000000000000000
      00000000000000000000EFEFEF00ADA5A500CEA5A500AD6B7300AD6B7300CEAD
      B500FFFFFF000000000000000000000000000000000000000000E7B58C00D68C
      4A00D6945A00DE9C6300DEA56B00DEA56B00DEA56B00DE9C6300D69C5A00D694
      5200E7B58C000000000000000000000000000000000000000000CEBD94000000
      0000006B9C0073EFF70042C6E7004ACEE7004ACEE7004ACEE70063DEEF006BE7
      EF0052D6EF0000638C00EFF7F70000000000FFFFFF00C6F7FF0094F7FF007BF7
      FF0063EFFF0052EFFF004AEFFF004AEFFF005AEFFF0073EFFF00FFFFFF0018DE
      FF008CF7FF0084F7FF0031DEF700FFFFFF000000000000000000000000000000
      000000000000FFFFFF00C69CA500DEC6C600DEB5B500CE8C9400BD6B7B00B573
      7B00FFFFFF000000000000000000000000000000000000000000D68C4A00D694
      5200D69C5A00DE9C6B00DEA56B00F7DECE00E7B58400DEA56B00DE9C6300D694
      5200D68C4A0000000000000000000000000000000000D6BD9400946300009463
      00000073AD0073E7F70042C6E70052CEE70052D6E7005AD6EF0073E7F7007BEF
      F7004ACEE70000527B000000000000000000A5B5BD00ADF7FF00DEFFFF00BDFF
      FF0094FFFF006BF7FF004AF7FF0021F7FF0008EFFF0008EFFF00FFFFFF00CEFF
      FF00ADFFFF0084FFFF0063F7FF00FFFFFF000000000000000000000000000000
      000000000000E7E7E700F7E7E700F7E7E700DEB5BD00C6848C00AD525A00AD5A
      6B000000000000000000000000000000000000000000CE843900D68C4A00D694
      5200D69C5A00DE9C6300DEA56B00FFFFFF00E7BD9400DE9C6300D69C5A00D694
      5200D68C4A00D68442000000000000000000000000009C6B0800CE9C2900DE9C
      21000084B5006BDEEF0039C6E70042C6E70039C6E70042C6E7005AD6EF006BDE
      EF0029A5CE005A94B50000000000000000006BADBD00F7FFFF00DEFFFF00BDFF
      FF0094FFFF00CEFFFF0000000000000000000000000000000000FFFFFF00EFFF
      FF00C6FFFF0094FFFF0063F7FF00FFFFFF000000000000000000000000000000
      000000000000DEDEDE00EFDEE700EFD6D600D6A5AD00B59C9C00000000000000
      00000000000000000000000000000000000000000000CE843900D68C4200D68C
      4A00D6945200D69C5A00DE9C6300FFFFFF00E7B58C00D69C5A00D6945A00D694
      5200D68C4200CE8439000000000000000000000000009C630000F7CE7B00E7AD
      42000894BD007BE7F7004ACEE70042CEE70042C6E70042C6E7005AD6EF0063DE
      EF001894BD007BADBD000000000000000000ADBDC600DEFFFF00CEFFFF00ADFF
      FF008CCED6000000000000000000000000000000000000000000FFFFFF00E7FF
      FF00C6FFFF0094F7FF0063F7FF00FFFFFF000000000000000000000000000000
      000000000000DED6D600D6ADB500D6A5AD00C6848C00C6BDBD00000000000000
      000000000000000000000000000000000000DEAD7B00CE843100CE843900D68C
      4200D68C4A00D6945200D6945200FFFFFF00DEAD7B00D6945200D68C4A00D68C
      4200CE843900CE843100DEAD7B000000000000000000A56B0000F7CE7B00E7AD
      39000894C6009CEFF70063DEEF005AD6EF0052CEE7004ACEE7005ADEEF0063DE
      EF0029A5CE0073ADBD000000000000000000A5BDC600B5FFFF00ADF7FF0094F7
      FF0084C6CE000000000000000000000000000000000000000000F7F7F700C6FF
      FF00ADF7FF0084F7FF005AEFFF00FFFFFF000000000000000000000000000000
      000000000000DED6D600BD738400B5737B00AD5A6B00BDBDBD00000000000000
      000000000000000000000000000000000000D6945A00CE844200D68C4200D68C
      4A00D68C4A00D6945200D6945200FFFFFF00DEAD7B00D6945200D68C4A00D68C
      4A00D68C4200CE844200D6945A000000000000000000B57B0000F7CE7B00EFAD
      39000094C600C6FFFF0073E7F7006BE7F70063DEEF0052D6EF005AD6EF0063DE
      EF0039BDDE0029739C00000000000000000094BDC60094F7FF008CF7FF007BEF
      FF007BC6CE000000000000000000000000000000000000000000F7F7F7009CF7
      FF0084F7FF006BEFFF0042E7FF00FFFFFF000000000000000000000000000000
      000000000000DED6D6009C4252009C42520094394A00BDB5BD00000000000000
      000000000000000000000000000000000000DEAD7B00D68C4A00D6945200D694
      5200D6945200D6945200EFCEAD00FFFFFF00DEAD7B00D6945200D6945200D694
      5200D6945200D68C4A00DEAD7B000000000000000000BD7B0800F7D68C00F7B5
      4A000084C600FFFFFF008CF7FF007BEFF7006BE7F7005AD6EF005AD6EF0042BD
      D60029ADCE00005A840000000000000000008CBDC6006BEFFF0063EFFF005AE7
      FF0073BDCE000000000000000000000000000000000000000000F7F7F7006BEF
      FF005AEFFF004AE7FF0029DEFF00FFFFFF000000000000000000000000000000
      000000000000DED6D6008C314200943942008C314200BDB5BD00000000000000
      00000000000000000000000000000000000000000000D6945A00D69C5A00D69C
      5A00D69C6300D69C6300FFF7EF00FFF7EF00DEAD8400D69C6300D69C6300D69C
      5A00D69C5A00D6945A00000000000000000000000000C6841000FFE7AD00F7C6
      63001094B500DEFFFF00BDFFFF0073EFF7006BE7EF005AD6EF0052D6EF000073
      9C00006394003184A50000000000000000007BB5BD004AE7FF0042E7FF0039DE
      FF0063BDCE000000000000000000000000000000000000000000CECECE0042DE
      FF0039DEFF0029DEFF0018D6FF00000000000000000000000000000000000000
      000000000000F7EFEF008C2939008C3142008C293900DED6D600000000000000
      00000000000000000000000000000000000000000000CE7B2900DEA57300DEA5
      7300DEA57300DEA57300DEA57300F7DEC600DEA57300DEA57300DEA57300DEA5
      7300DEA57300CE7B2900000000000000000000000000BD7B0000FFF7DE00F7CE
      7B00CEC68400009CD6009CEFF700E7FFFF00D6FFFF00B5F7FF00ADFFFF000073
      A500006B940000000000000000000000000073B5BD0029D6F70029D6F70021D6
      F70063B5CE00F7F7F7009CADAD008CA5AD0094A5AD0094ADB500CEEFFF0021D6
      F70018D6F70010D6F70010D6F700000000000000000000000000000000000000
      000000000000FFFFFF007B213100842931007B213100F7EFEF00000000000000
      0000000000000000000000000000000000000000000000000000D69C5A00E7B5
      8400E7B58400E7B58400E7B58400FFFFFF00EFD6BD00E7B58400E7B58400E7B5
      8400DE9C630000000000000000000000000000000000BD7B0000FFFFF700FFD6
      8C00FFD68400EFC67300529C9C00088CB5000084BD000084C6000073AD00187B
      A500000000000000000000000000000000008CDEF70018CEF70018CEF70018CE
      F7006BDEF700B5BDBD007BDEFF0018BDF70000B5F70039C6F70039D6F70010CE
      F70018CEF70010CEF70021CEF700000000000000000000000000000000000000
      000000000000FFFFFF00947B7B008C4A520094737B00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000DEAD7B00DEA5
      6B00E7BD9C00E7BD9C00E7BD9C00E7BD9C00E7BD9C00E7BD9C00E7BD9C00DEA5
      7300DEAD7B0000000000000000000000000000000000D6AD5A00F7D69C00FFFF
      F700FFD68C00EFC66300E7B54A00EFB53900AD6B0000A55A0000CEAD7B000000
      000000000000000000000000000000000000BDEFFF0018CEF70018CEF70018CE
      F700A5EFFF00ADBDBD0010CEF70010CEF70010CEF70018CEF70018CEF70018CE
      F70018CEF70010CEF700FFFFFF00000000000000000000000000000000000000
      000000000000EFEFEF00EFE7EF00BD949C0084394200CEC6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE7B3100EFC6A500EFCEAD00EFCEAD00EFCEAD00EFCEAD00CE8439000000
      0000000000000000000000000000000000000000000000000000CE840000DEA5
      3100F7CE8400FFE7B500FFE7AD00FFDE94009C6B0000AD8C3900000000000000
      00000000000000000000000000000000000000000000A5EFFF0039CEF70094E7
      FF00000000000000000042CEF70031CEF70031CEF70031CEF70031CEF70042D6
      F70094E7FF000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700B58C94009C5A630073182900D6CECE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEAD7300D6945200DEAD730000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF7
      E700DEB57300BD8C3100A56B0000A5731000CEB57B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A57B7B006B102100945A630000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      C00187FF00000000800107FF00000000000107FF000000000003040700000000
      002100030000000000010001000000000001040100000000000107C100000000
      07C107C100000000000100010000000000010001000000008001000300000000
      8003800700000000E007FFFF00000000FFFFFFFFFFFFFFFFFC7FF001E033FF0F
      F01FF0018021FC07C007D0010000F807C00780030000F80F8003800303C0F83F
      8003800307C0F83F0001800307C0F83F0001800307C0F83F0001800307C0F83F
      8003800307C1F83F800380070001F83FC007800F0001F83FC007801F0001F83F
      F01FC03F8C07F83FFC7FE07FFFFFFC7F00000000000000000000000000000000
      000000000000}
  end
  object sdqEstableciTemporales: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEnfermedadProfesionalAfterOpen
    AfterPost = sdqEnfermedadProfesionalAfterPost
    AfterCancel = sdqEnfermedadProfesionalAfterCancel
    AfterScroll = sdqEnfermedadProfesionalAfterScroll
    SQL.Strings = (
      
        'SELECT et_id, et_nroestableci, et_nombre, et_cuit_temporal, et_c' +
        'alle, et_numero, '
      
        '       et_piso, et_departamento, et_localidad, et_cpostal, et_pr' +
        'ovincia, '
      
        '       pv_descripcion provincia, et_cpostala, et_telefonos, et_c' +
        'uit_temporal '
      '  FROM sin.set_establecimiento_temporal, art.cpv_provincias '
      ' WHERE et_provincia = pv_codigo '
      '   AND et_cuit = (SELECT ex_cuit FROM art.sex_expedientes '
      '                   WHERE ex_id = :idexp)')
    Left = 364
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexp'
        ParamType = ptInput
      end>
  end
  object dsEstableciTemporales: TDataSource
    DataSet = sdqEstableciTemporales
    OnUpdateData = dsEnfermedadProfesionalUpdateData
    Left = 392
    Top = 232
  end
end
