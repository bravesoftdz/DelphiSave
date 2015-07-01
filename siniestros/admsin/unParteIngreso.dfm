inherited frmParteIngreso: TfrmParteIngreso
  Left = 462
  Top = 369
  BorderStyle = bsNone
  Caption = 'Parte de Ingreso'
  ClientHeight = 328
  ClientWidth = 632
  Constraints.MinHeight = 240
  Constraints.MinWidth = 640
  OldCreateOrder = True
  OnCreate = FSFormCreate
  ExplicitLeft = 462
  ExplicitTop = 369
  ExplicitWidth = 640
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  object gbPrestador: TJvgGroupBox [0]
    Left = 0
    Top = 0
    Width = 632
    Height = 16
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
      632
      16)
    FullHeight = 80
    inline fraPI_IDPRESTADOR: TfraPrestadorFueraDeContrato
      Left = 4
      Top = 22
      Width = 621
      Height = 56
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      ExplicitLeft = 4
      ExplicitTop = 22
      ExplicitWidth = 621
      DesignSize = (
        621
        56)
      inherited lbCPostal: TLabel
        Left = 542
        ExplicitLeft = 542
      end
      inherited cmbCA_DESCRIPCION: TArtComboBox
        Width = 291
        ExplicitWidth = 291
      end
      inherited edCA_LOCALIDAD: TEdit
        Width = 167
        ExplicitWidth = 167
      end
      inherited edCA_CODPOSTAL: TEdit
        Left = 566
        ExplicitLeft = 566
      end
      inherited gbPrestadorFueraDeContrato: TJvgGroupBox
        Width = 621
        ExplicitWidth = 621
        DesignSize = (
          621
          72)
        FullHeight = 72
        inherited fraDomicilioExtra: TfraDomicilio
          Width = 427
          ExplicitWidth = 427
          DesignSize = (
            427
            49)
          inherited lbNro: TLabel
            Left = 212
            ExplicitLeft = 212
          end
          inherited lbPiso: TLabel
            Left = 284
            ExplicitLeft = 284
          end
          inherited lbDto: TLabel
            Left = 360
            ExplicitLeft = 360
          end
          inherited lbProvincia: TLabel
            Left = 265
            ExplicitLeft = 265
          end
          inherited cmbCalle: TArtComboBox
            Width = 131
            ExplicitWidth = 131
          end
          inherited edNumero: TEdit
            Left = 234
            ExplicitLeft = 234
          end
          inherited edPiso: TEdit
            Left = 310
            ExplicitLeft = 310
          end
          inherited edDto: TEdit
            Left = 382
            ExplicitLeft = 382
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 0
            ExplicitWidth = 0
          end
          inherited edProvincia: TEdit
            Left = 314
            ExplicitLeft = 314
          end
          inherited btnBuscar: TButton
            Left = 186
            ExplicitLeft = 186
          end
        end
      end
      inherited sdqDatos: TSDQuery
        Left = 4
        Top = 84
      end
      inherited dsDatos: TDataSource
        Left = 32
        Top = 84
      end
    end
  end
  object gbDatos1: TJvgGroupBox [1]
    Left = 0
    Top = 16
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Datos del accidente '
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
      632
      16)
    FullHeight = 141
    object Label18: TLabel
      Left = 8
      Top = 20
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Tipo Siniestro'
      Visible = False
    end
    object Label1: TLabel
      Left = 280
      Top = 20
      Width = 60
      Height = 13
      AutoSize = False
      Caption = 'Diagn'#243'stico'
      Visible = False
    end
    object Label2: TLabel
      Left = 100
      Top = 64
      Width = 60
      Height = 13
      AutoSize = False
      Caption = 'CIE-10'
      Visible = False
    end
    object Label3: TLabel
      Left = 413
      Top = 64
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Gravedad CIE10'
      Visible = False
    end
    object Label17: TLabel
      Left = 8
      Top = 64
      Width = 80
      Height = 13
      Caption = '1'#176' Manifestaci'#243'n'
      Visible = False
    end
    object Label26: TLabel
      Left = 231
      Top = 108
      Width = 69
      Height = 26
      Alignment = taCenter
      Caption = #191'Sugiere'#13#10'Recalificaci'#243'n?'
      Visible = False
    end
    object Label28: TLabel
      Left = 216
      Top = 115
      Width = 11
      Height = 13
      Caption = '%'
      Visible = False
    end
    object Label29: TLabel
      Left = 415
      Top = 108
      Width = 134
      Height = 26
      Alignment = taCenter
      Caption = #191'Coincide con el mecanismo '#13#10'accidentol'#243'gico?'
      Visible = False
    end
    object Label16: TLabel
      Left = 8
      Top = 108
      Width = 63
      Height = 26
      Alignment = taCenter
      Caption = #191'Presupone'#13#10'Incapacidad?'
      Visible = False
    end
    object rpPI_COINCIDE_MECANISMO_ACC: TJvDBRadioPanel
      Left = 545
      Top = 113
      Width = 112
      Height = 17
      BevelOuter = bvNone
      Columns = 3
      DataField = 'PI_COINCIDE_MECANISMO_ACC'
      DataSource = dsDatos
      Items.Strings = (
        'Si'
        'No'
        'S/D')
      ParentColor = True
      TabOrder = 8
      Values.Strings = (
        'S'
        'N'
        '?')
      Visible = False
    end
    inline fraTipoSiniestro: TfraTipoSiniestro
      Left = 8
      Top = 36
      Width = 265
      Height = 23
      TabOrder = 0
      Visible = False
      ExplicitLeft = 8
      ExplicitTop = 36
      ExplicitWidth = 265
      DesignSize = (
        265
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 202
        ExplicitWidth = 202
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
        DataField = sdqDatosPI_TIPO
        DataSource = dsDatos
      end
    end
    inline fraPI_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO
      Left = 100
      Top = 80
      Width = 307
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Visible = False
      ExplicitLeft = 100
      ExplicitTop = 80
      ExplicitWidth = 307
      DesignSize = (
        307
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 244
        ExplicitWidth = 244
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
        DataField = sdqDatosPI_IDDIAGNOSTICO
        DataSource = dsDatos
      end
    end
    inline fraPI_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10
      Left = 413
      Top = 80
      Width = 211
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 4
      Visible = False
      ExplicitLeft = 413
      ExplicitTop = 80
      ExplicitWidth = 211
      DesignSize = (
        211
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 148
        ExplicitWidth = 148
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
        DataField = sdqDatosPI_IDGRAVEDAD_CIE10
        DataSource = dsDatos
      end
    end
    object edPI_DIAGNOSTICO: TDBMemo
      Left = 280
      Top = 37
      Width = 345
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelWidth = 0
      DataField = 'PI_DIAGNOSTICO'
      DataSource = dsDatos
      ScrollBars = ssVertical
      TabOrder = 1
      Visible = False
    end
    object edPI_EPMANIFESTACION: TDBDateEdit
      Left = 8
      Top = 81
      Width = 88
      Height = 21
      DataField = 'PI_EPMANIFESTACION'
      DataSource = dsDatos
      Color = clBtnFace
      DialogTitle = 'Seleccione una Fecha.'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 2
      StartOfWeek = Sun
      Visible = False
    end
    object rpPI_PRESUPINCAPACIDAD: TJvDBRadioPanel
      Left = 71
      Top = 113
      Width = 112
      Height = 17
      BevelOuter = bvNone
      Columns = 3
      DataField = 'PI_PRESUPINCAPACIDAD'
      DataSource = dsDatos
      Items.Strings = (
        'Si'
        'No'
        'S/D')
      ParentColor = True
      TabOrder = 5
      Values.Strings = (
        'S'
        'N'
        '?')
      Visible = False
    end
    object rpPI_RECALIFICACION: TJvDBRadioPanel
      Left = 300
      Top = 113
      Width = 112
      Height = 17
      BevelOuter = bvNone
      Columns = 3
      DataField = 'PI_RECALIFICACION'
      DataSource = dsDatos
      Items.Strings = (
        'Si'
        'No'
        'S/D')
      ParentColor = True
      TabOrder = 7
      Values.Strings = (
        'S'
        'N'
        '?')
      Visible = False
    end
    object edPI_PORCENTAJEINCAPACIDAD: TDBPatternEdit
      Left = 188
      Top = 111
      Width = 25
      Height = 21
      TabStop = False
      DataField = 'PI_PORCENTAJEINCAPACIDAD'
      DataSource = dsDatos
      MaxLength = 11
      TabOrder = 6
      Visible = False
      Pattern = '0123456789'
    end
  end
  object gbLesion: TJvgGroupBox [2]
    Left = 0
    Top = 32
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Datos de la lesi'#243'n / Otros datos '
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
      632
      16)
    FullHeight = 112
    object Label30: TLabel
      Left = 8
      Top = 24
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Forma'
      Visible = False
    end
    object Label31: TLabel
      Left = 188
      Top = 24
      Width = 121
      Height = 13
      AutoSize = False
      Caption = 'Agente causante'
      Visible = False
    end
    object Label32: TLabel
      Left = 548
      Top = 24
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Naturaleza'
      Visible = False
    end
    object Label33: TLabel
      Left = 368
      Top = 24
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Zona'
      Visible = False
    end
    object Label34: TLabel
      Left = 460
      Top = 68
      Width = 143
      Height = 13
      Caption = 'Motivo de NO Carga de Datos'
      Visible = False
    end
    object Label35: TLabel
      Left = 260
      Top = 68
      Width = 53
      Height = 13
      AutoSize = False
      Caption = 'Gravedad'
      Visible = False
    end
    object Label7: TLabel
      Left = 8
      Top = 68
      Width = 121
      Height = 13
      Caption = 'Agente material asociado'
      Visible = False
    end
    inline fraPI_IDLESIONFORMA: TfraSLF_LESIONFORMA
      Left = 4
      Top = 40
      Width = 180
      Height = 23
      TabOrder = 0
      Visible = False
      ExplicitLeft = 4
      ExplicitTop = 40
      ExplicitWidth = 180
      DesignSize = (
        180
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 132
        ExplicitLeft = 48
        ExplicitWidth = 132
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
        DataField = sdqDatosPI_IDLESIONFORMA
        DataSource = dsDatos
      end
    end
    inline fraPI_IDLESIONAGENTE: TfraSLA_LESIONAGENTE
      Left = 184
      Top = 40
      Width = 180
      Height = 23
      TabOrder = 1
      Visible = False
      ExplicitLeft = 184
      ExplicitTop = 40
      ExplicitWidth = 180
      DesignSize = (
        180
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 132
        ExplicitLeft = 48
        ExplicitWidth = 132
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
        DataField = sdqDatosPI_IDLESIONAGENTE
        DataSource = dsDatos
      end
    end
    inline fraPI_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA
      Left = 544
      Top = 40
      Width = 80
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Visible = False
      ExplicitLeft = 544
      ExplicitTop = 40
      ExplicitWidth = 80
      DesignSize = (
        80
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 32
        ExplicitLeft = 48
        ExplicitWidth = 32
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
        DataField = sdqDatosPI_IDLESIONNATURALEZA
        DataSource = dsDatos
      end
    end
    inline fraPI_IDLESIONZONA: TfraSLZ_LESIONZONA
      Left = 364
      Top = 40
      Width = 180
      Height = 23
      TabOrder = 2
      Visible = False
      ExplicitLeft = 364
      ExplicitTop = 40
      ExplicitWidth = 180
      DesignSize = (
        180
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 132
        ExplicitLeft = 48
        ExplicitWidth = 132
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
        DataField = sdqDatosPI_IDLESIONZONA
        DataSource = dsDatos
      end
    end
    inline fraPI_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA
      Left = 456
      Top = 84
      Width = 169
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      Visible = False
      ExplicitLeft = 456
      ExplicitTop = 84
      ExplicitWidth = 169
      DesignSize = (
        169
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 106
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
        DataField = sdqDatosPI_IDMOTIVONOCARGA
        DataSource = dsDatos
      end
    end
    inline fraPI_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD
      Left = 256
      Top = 84
      Width = 197
      Height = 23
      TabOrder = 5
      Visible = False
      ExplicitLeft = 256
      ExplicitTop = 84
      ExplicitWidth = 197
      DesignSize = (
        197
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 134
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
        DataField = sdqDatosPI_IDGRAVEDAD
        DataSource = dsDatos
        FieldID = 'TG_ID'
      end
    end
    inline fraPI_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL
      Left = 4
      Top = 84
      Width = 249
      Height = 23
      TabOrder = 4
      Visible = False
      ExplicitLeft = 4
      ExplicitTop = 84
      ExplicitWidth = 249
      inherited cmbDescripcion: TComboGrid
        Width = 186
        ExplicitWidth = 186
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
        DataField = sdqDatosPI_IDLESIONAGENTEMATERIAL
        DataSource = dsDatos
      end
    end
  end
  object gbArchivo: TJvgGroupBox [3]
    Left = 0
    Top = 237
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Sistema de Archivo '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
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
      632
      16)
    FullHeight = 81
    object Label5: TLabel
      Left = 437
      Top = 28
      Width = 96
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Recepci'#243'n'
      Visible = False
    end
    object Label8: TLabel
      Left = 6
      Top = 28
      Width = 68
      Height = 13
      Caption = 'Sector de Alta'
      Visible = False
    end
    object Label6: TLabel
      Left = 265
      Top = 28
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de carga'
      Visible = False
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
      Visible = False
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
        ExplicitWidth = 255
      end
      inherited edDA_HOJAS: TIntEdit
        Left = 426
        ExplicitLeft = 426
      end
    end
    object edPI_FECHARECEPCION: TDBDateEdit
      Left = 537
      Top = 24
      Width = 88
      Height = 21
      DataField = 'PI_FECHARECEPCION'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una Fecha.'
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 2
      StartOfWeek = Sun
      Visible = False
    end
    object edSector: TDBEdit
      Left = 80
      Top = 24
      Width = 177
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
      Visible = False
    end
    object edPI_FECHAALTA: TDBDateEdit
      Left = 345
      Top = 24
      Width = 88
      Height = 21
      DataField = 'PI_FECHAALTA'
      DataSource = dsDatos
      Color = clBtnFace
      DialogTitle = 'Seleccione una Fecha.'
      Enabled = False
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 1
      StartOfWeek = Sun
      Visible = False
    end
  end
  object gbTratamiento: TJvgGroupBox [4]
    Left = 0
    Top = 48
    Width = 632
    Height = 189
    Align = alTop
    Caption = ' Tratamiento / Internaci'#243'n '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
      632
      189)
    FullHeight = 189
    object lbTratamiento: TLabel
      Left = 8
      Top = 20
      Width = 58
      Height = 13
      Caption = 'Tratamiento'
    end
    object Label22: TLabel
      Left = 356
      Top = 20
      Width = 45
      Height = 13
      Caption = 'Ubicaci'#243'n'
    end
    object lbInternado: TLabel
      Left = 8
      Top = 60
      Width = 184
      Height = 13
      Caption = 'Internado (genera un parte evolutivo)'
    end
    object Label24: TLabel
      Left = 356
      Top = 60
      Width = 45
      Height = 13
      Caption = 'Ubicaci'#243'n'
    end
    object Label13: TLabel
      Left = 279
      Top = 104
      Width = 106
      Height = 13
      Caption = 'D'#237'as de baja previstos'
    end
    object Label25: TLabel
      Left = 100
      Top = 104
      Width = 57
      Height = 13
      Caption = 'Baja M'#233'dica'
    end
    object Label12: TLabel
      Left = 190
      Top = 104
      Width = 53
      Height = 13
      Caption = 'Reconsulta'
    end
    object Label20: TLabel
      Left = 238
      Top = 144
      Width = 69
      Height = 13
      Caption = 'Historia Cl'#237'nica'
    end
    object Label10: TLabel
      Left = 8
      Top = 144
      Width = 33
      Height = 13
      Caption = 'M'#233'dico'
    end
    object Label36: TLabel
      Left = 452
      Top = 104
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label4: TLabel
      Left = 8
      Top = 104
      Width = 86
      Height = 13
      Caption = 'Baja en Prestador'
    end
    object edPI_TRATAMINSTITUCION: TDBEdit
      Left = 8
      Top = 36
      Width = 342
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PI_TRATAMINSTITUCION'
      DataSource = dsDatos
      TabOrder = 0
      OnChange = edPI_TRATAMINSTITUCIONChange
    end
    object edPI_TRATAMUBICACION: TDBEdit
      Left = 356
      Top = 36
      Width = 267
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'PI_TRATAMUBICACION'
      DataSource = dsDatos
      TabOrder = 1
    end
    object edPI_INTERNINSTITUCION: TDBEdit
      Left = 8
      Top = 76
      Width = 342
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PI_INTERNINSTITUCION'
      DataSource = dsDatos
      TabOrder = 2
      OnChange = edPI_INTERNINSTITUCIONChange
    end
    object edPI_INTERNUBICACION: TDBEdit
      Left = 356
      Top = 76
      Width = 267
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'PI_INTERNUBICACION'
      DataSource = dsDatos
      TabOrder = 3
    end
    object edPI_DIASBAJAPREVISTOS: TDBPatternEdit
      Left = 278
      Top = 120
      Width = 109
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PI_DIASBAJAPREVISTOS'
      DataSource = dsDatos
      MaxLength = 2
      TabOrder = 7
      Pattern = '0123456789'
    end
    object edPI_FECHABAJAMEDICA: TDBDateEdit
      Left = 98
      Top = 120
      Width = 88
      Height = 21
      DataField = 'PI_FECHABAJAMEDICA'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una fecha'
      NumGlyphs = 2
      TabOrder = 5
    end
    object edPI_FECHARECONSULTA: TDBDateEdit
      Left = 188
      Top = 120
      Width = 88
      Height = 21
      DataField = 'PI_FECHARECONSULTA'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una fecha'
      NumGlyphs = 2
      TabOrder = 6
    end
    object edPI_HISTORIACLINICA: TDBEdit
      Left = 236
      Top = 160
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PI_HISTORIACLINICA'
      DataSource = dsDatos
      MaxLength = 250
      TabOrder = 11
    end
    object edPI_MEDICO: TDBEdit
      Left = 8
      Top = 160
      Width = 221
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PI_MEDICO'
      DataSource = dsDatos
      TabOrder = 10
    end
    object edPI_OBSERVACIONES: TDBMemo
      Left = 452
      Top = 120
      Width = 171
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      BevelWidth = 0
      DataField = 'PI_OBSERVACIONES'
      DataSource = dsDatos
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object chkPI_PROTESIS: TDBCheckBox
      Left = 390
      Top = 120
      Width = 55
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pr'#243'tesis'
      DataField = 'PI_PROTESIS'
      DataSource = dsDatos
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edPI_FECHABAJAPRESTADOR: TDBDateEdit
      Left = 8
      Top = 120
      Width = 88
      Height = 21
      DataField = 'PI_FECHABAJAPRESTADOR'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una fecha'
      NumGlyphs = 2
      TabOrder = 4
      OnChange = edPI_FECHABAJAPRESTADORChange
    end
    object chkGENERAR_EVOLUTIVO: TDBCheckBox
      Left = 504
      Top = 103
      Width = 118
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Generar un evolutivo'
      DataField = 'GENERAR_EVOLUTIVO'
      DataSource = dsDatos
      TabOrder = 12
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited sdqDatos: TSDQuery
    OnNewRecord = sdqDatosNewRecord
    SQL.Strings = (
      'SELECT PI_ID, PI_IDEXPEDIENTE, PI_IDPRESTADOR,'
      '       PI_EPMANIFESTACION, PI_EPEXPUESTODESDE, PI_IDGRAVEDAD,'
      '       PI_DIAGNOSTICO, PI_IDDIAGNOSTICO, PI_IDLESIONFORMA,'
      
        '       PI_IDLESIONAGENTE, PI_IDLESIONNATURALEZA, PI_IDLESIONZONA' +
        ','
      '       PI_PRESUPINCAPACIDAD, PI_OBSERVACIONES,'
      '       PI_TRATAMINSTITUCION, PI_TRATAMUBICACION,'
      '       PI_INTERNINSTITUCION, PI_INTERNUBICACION, '
      '       PI_FECHABAJAMEDICA, PI_DIASBAJAPREVISTOS,'
      '       PI_FECHARECONSULTA, PI_HISTORIACLINICA, '
      '       PI_MEDICO, PI_FECHARECEPCION, PI_USUALTA, PI_FECHAALTA,'
      
        '       PI_USUMODIF, PI_FECHAMODIF, NVL(PI_PROTESIS, '#39'N'#39') as PI_P' +
        'ROTESIS,'
      
        '       PI_IDGRAVEDAD_CIE10, PI_IDMOTIVONOCARGA, PI_FECHACARGA, S' +
        'E_SECTOR,'
      
        '       EX_FECHAALTA, EX_FECHAACCIDENTE, EX_TIPO, EX_FECHARECEPCI' +
        'ON,'
      
        '       NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) as FACCREC, PI_TI' +
        'PO,'
      
        '       PI_PORCENTAJEINCAPACIDAD, PI_COINCIDE_MECANISMO_ACC, PI_R' +
        'ECALIFICACION,'
      
        '       CAST(NULL AS VARCHAR2(1)) AS DA_OPCION, TO_NUMBER(NULL) A' +
        'S DA_HOJAS, '
      
        '       PI_PRESTADOR_NOMBRE, PI_PRESTADOR_TELEFONOS, PI_PRESTADOR' +
        '_CALLE,'
      
        '       PI_PRESTADOR_NUMERO, PI_PRESTADOR_PISO, PI_PRESTADOR_DEPA' +
        'RTAMENTO,'
      
        '       PI_PRESTADOR_LOCALIDAD, PI_PRESTADOR_CPOSTAL, PI_PRESTADO' +
        'R_CPOSTALA,'
      
        '       PI_PRESTADOR_PROVINCIA, PI_FECHABAJAPRESTADOR, '#39'N'#39' as GEN' +
        'ERAR_EVOLUTIVO,'
      '       PI_IDLESIONAGENTEMATERIAL, EX_ALTAMEDICA'
      '  FROM USE_USUARIOS, SEX_EXPEDIENTES, SIN.SPI_PARTEDEINGRESO'
      ' WHERE PI_IDEXPEDIENTE = :PI_IDEXPEDIENTE'
      '   AND EX_ID = PI_IDEXPEDIENTE'
      '   AND SE_USUARIO (+) = PI_USUALTA')
    UniDirectional = True
    Left = 300
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PI_IDEXPEDIENTE'
        ParamType = ptInput
      end>
    object sdqDatosPI_IDGRAVEDAD: TFloatField
      FieldName = 'PI_IDGRAVEDAD'
    end
    object sdqDatosPI_DIAGNOSTICO: TStringField
      FieldName = 'PI_DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosPI_IDDIAGNOSTICO: TFloatField
      FieldName = 'PI_IDDIAGNOSTICO'
    end
    object sdqDatosPI_IDLESIONFORMA: TFloatField
      FieldName = 'PI_IDLESIONFORMA'
    end
    object sdqDatosPI_IDLESIONAGENTE: TFloatField
      FieldName = 'PI_IDLESIONAGENTE'
    end
    object sdqDatosPI_IDLESIONZONA: TFloatField
      FieldName = 'PI_IDLESIONZONA'
    end
    object sdqDatosPI_PRESUPINCAPACIDAD: TStringField
      FieldName = 'PI_PRESUPINCAPACIDAD'
      Size = 1
    end
    object sdqDatosPI_TRATAMINSTITUCION: TStringField
      FieldName = 'PI_TRATAMINSTITUCION'
      Size = 100
    end
    object sdqDatosPI_TRATAMUBICACION: TStringField
      FieldName = 'PI_TRATAMUBICACION'
      Size = 100
    end
    object sdqDatosPI_INTERNINSTITUCION: TStringField
      FieldName = 'PI_INTERNINSTITUCION'
      Size = 100
    end
    object sdqDatosPI_INTERNUBICACION: TStringField
      FieldName = 'PI_INTERNUBICACION'
      Size = 100
    end
    object sdqDatosPI_FECHABAJAMEDICA: TDateTimeField
      FieldName = 'PI_FECHABAJAMEDICA'
    end
    object sdqDatosPI_DIASBAJAPREVISTOS: TFloatField
      FieldName = 'PI_DIASBAJAPREVISTOS'
    end
    object sdqDatosPI_FECHARECONSULTA: TDateTimeField
      FieldName = 'PI_FECHARECONSULTA'
    end
    object sdqDatosPI_HISTORIACLINICA: TStringField
      FieldName = 'PI_HISTORIACLINICA'
    end
    object sdqDatosPI_MEDICO: TStringField
      FieldName = 'PI_MEDICO'
      Size = 30
    end
    object sdqDatosPI_FECHARECEPCION: TDateTimeField
      FieldName = 'PI_FECHARECEPCION'
    end
    object sdqDatosPI_USUALTA: TStringField
      FieldName = 'PI_USUALTA'
    end
    object sdqDatosPI_FECHAALTA: TDateTimeField
      FieldName = 'PI_FECHAALTA'
    end
    object sdqDatosPI_USUMODIF: TStringField
      FieldName = 'PI_USUMODIF'
    end
    object sdqDatosPI_FECHAMODIF: TDateTimeField
      FieldName = 'PI_FECHAMODIF'
    end
    object sdqDatosPI_PROTESIS: TStringField
      FieldName = 'PI_PROTESIS'
      Size = 1
    end
    object sdqDatosPI_IDGRAVEDAD_CIE10: TFloatField
      FieldName = 'PI_IDGRAVEDAD_CIE10'
    end
    object sdqDatosPI_IDMOTIVONOCARGA: TFloatField
      FieldName = 'PI_IDMOTIVONOCARGA'
    end
    object sdqDatosPI_FECHACARGA: TDateTimeField
      FieldName = 'PI_FECHACARGA'
    end
    object sdqDatosSE_SECTOR: TStringField
      FieldName = 'SE_SECTOR'
      Size = 8
    end
    object sdqDatosPI_ID: TFloatField
      FieldName = 'PI_ID'
      Required = True
    end
    object sdqDatosPI_IDEXPEDIENTE: TFloatField
      FieldName = 'PI_IDEXPEDIENTE'
      Required = True
    end
    object sdqDatosPI_IDPRESTADOR: TFloatField
      FieldName = 'PI_IDPRESTADOR'
    end
    object sdqDatosPI_EPMANIFESTACION: TDateTimeField
      FieldName = 'PI_EPMANIFESTACION'
    end
    object sdqDatosPI_EPEXPUESTODESDE: TDateTimeField
      FieldName = 'PI_EPEXPUESTODESDE'
    end
    object sdqDatosPI_IDLESIONNATURALEZA: TFloatField
      FieldName = 'PI_IDLESIONNATURALEZA'
    end
    object sdqDatosPI_OBSERVACIONES: TStringField
      FieldName = 'PI_OBSERVACIONES'
      Size = 250
    end
    object sdqDatosEX_FECHAALTA: TDateTimeField
      FieldName = 'EX_FECHAALTA'
    end
    object sdqDatosEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqDatosEX_TIPO: TStringField
      FieldName = 'EX_TIPO'
      Size = 1
    end
    object sdqDatosEX_FECHARECEPCION: TDateTimeField
      FieldName = 'EX_FECHARECEPCION'
    end
    object sdqDatosFACCREC: TDateTimeField
      FieldName = 'FACCREC'
    end
    object sdqDatosPI_TIPO: TStringField
      FieldName = 'PI_TIPO'
      Size = 1
    end
    object sdqDatosPI_PORCENTAJEINCAPACIDAD: TFloatField
      FieldName = 'PI_PORCENTAJEINCAPACIDAD'
      MaxValue = 100.000000000000000000
    end
    object sdqDatosPI_COINCIDE_MECANISMO_ACC: TStringField
      FieldName = 'PI_COINCIDE_MECANISMO_ACC'
      Size = 1
    end
    object sdqDatosPI_RECALIFICACION: TStringField
      FieldName = 'PI_RECALIFICACION'
      Size = 1
    end
    object sdqDatosDA_OPCION: TStringField
      FieldName = 'DA_OPCION'
      Size = 1
    end
    object sdqDatosDA_HOJAS: TFloatField
      FieldName = 'DA_HOJAS'
    end
    object sdqDatosPI_PRESTADOR_NOMBRE: TStringField
      FieldName = 'PI_PRESTADOR_NOMBRE'
      Size = 100
    end
    object sdqDatosPI_PRESTADOR_TELEFONOS: TStringField
      FieldName = 'PI_PRESTADOR_TELEFONOS'
      Size = 60
    end
    object sdqDatosPI_PRESTADOR_CALLE: TStringField
      FieldName = 'PI_PRESTADOR_CALLE'
      Size = 60
    end
    object sdqDatosPI_PRESTADOR_NUMERO: TStringField
      FieldName = 'PI_PRESTADOR_NUMERO'
    end
    object sdqDatosPI_PRESTADOR_PISO: TStringField
      FieldName = 'PI_PRESTADOR_PISO'
    end
    object sdqDatosPI_PRESTADOR_DEPARTAMENTO: TStringField
      FieldName = 'PI_PRESTADOR_DEPARTAMENTO'
    end
    object sdqDatosPI_PRESTADOR_LOCALIDAD: TStringField
      FieldName = 'PI_PRESTADOR_LOCALIDAD'
      Size = 60
    end
    object sdqDatosPI_PRESTADOR_CPOSTAL: TStringField
      FieldName = 'PI_PRESTADOR_CPOSTAL'
      Size = 5
    end
    object sdqDatosPI_PRESTADOR_CPOSTALA: TStringField
      FieldName = 'PI_PRESTADOR_CPOSTALA'
      Size = 8
    end
    object sdqDatosPI_PRESTADOR_PROVINCIA: TStringField
      FieldName = 'PI_PRESTADOR_PROVINCIA'
      Size = 2
    end
    object sdqDatosPI_FECHABAJAPRESTADOR: TDateTimeField
      FieldName = 'PI_FECHABAJAPRESTADOR'
    end
    object sdqDatosGENERAR_EVOLUTIVO: TStringField
      FieldName = 'GENERAR_EVOLUTIVO'
      Size = 1
    end
    object sdqDatosPI_IDLESIONAGENTEMATERIAL: TFloatField
      FieldName = 'PI_IDLESIONAGENTEMATERIAL'
    end
    object sdqDatosEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
  end
  inherited dsDatos: TDataSource
    OnUpdateData = dsDatosUpdateData
    Left = 328
    Top = 92
  end
  inherited sduDatos: TSDUpdateSQL
    ModifySQL.Strings = (
      'DECLARE'
      '  SINIESTRO SEX_EXPEDIENTES.EX_SINIESTRO%TYPE;'
      '  ORDEN     SEX_EXPEDIENTES.EX_ORDEN%TYPE;'
      '  RECAIDA   SEX_EXPEDIENTES.EX_RECAIDA%TYPE;'
      ''
      '  DIAGNOSTICOOMS SEX_EXPEDIENTES.EX_DIAGNOSTICOOMS%TYPE;'
      '  GRAVEDAD       SEX_EXPEDIENTES.EX_GRAVEDAD%TYPE;'
      ''
      '  INUMERO NUMBER (8);'
      '  FECHA_CONTROL DATE;'
      '  TIPO_TRATAMIENTO VARCHAR2(2);'
      'BEGIN'
      '  /* MODIFICO EL PARTE DE INGRESO */'
      '  UPDATE SIN.SPI_PARTEDEINGRESO'
      '     SET PI_TIPO = :PI_TIPO,'
      '         PI_RECALIFICACION = :PI_RECALIFICACION,'
      '         PI_COINCIDE_MECANISMO_ACC = :PI_COINCIDE_MECANISMO_ACC,'
      '         PI_PORCENTAJEINCAPACIDAD = :PI_PORCENTAJEINCAPACIDAD,'
      '         PI_ID = :PI_ID,'
      '         PI_IDEXPEDIENTE = :PI_IDEXPEDIENTE,'
      
        '         PI_IDPRESTADOR = DECODE(:PI_IDPRESTADOR, 0, NULL, :PI_I' +
        'DPRESTADOR),'
      '         PI_EPMANIFESTACION = :PI_EPMANIFESTACION,'
      '         PI_EPEXPUESTODESDE = :PI_EPEXPUESTODESDE,'
      '         PI_IDGRAVEDAD = :PI_IDGRAVEDAD,'
      '         PI_DIAGNOSTICO = UPPER(:PI_DIAGNOSTICO),'
      '         PI_IDDIAGNOSTICO = :PI_IDDIAGNOSTICO,'
      '         PI_IDLESIONFORMA = :PI_IDLESIONFORMA,'
      '         PI_IDLESIONAGENTE = :PI_IDLESIONAGENTE,'
      '         PI_IDLESIONNATURALEZA = :PI_IDLESIONNATURALEZA,'
      '         PI_IDLESIONZONA = :PI_IDLESIONZONA,'
      '         PI_PRESUPINCAPACIDAD = :PI_PRESUPINCAPACIDAD,'
      '         PI_OBSERVACIONES = UPPER(:PI_OBSERVACIONES),'
      '         PI_TRATAMINSTITUCION = UPPER(:PI_TRATAMINSTITUCION),'
      '         PI_TRATAMUBICACION = UPPER(:PI_TRATAMUBICACION),'
      '         PI_INTERNINSTITUCION = UPPER(:PI_INTERNINSTITUCION),'
      '         PI_INTERNUBICACION = UPPER(:PI_INTERNUBICACION),'
      '         PI_FECHABAJAMEDICA = :PI_FECHABAJAMEDICA,'
      '         PI_DIASBAJAPREVISTOS = :PI_DIASBAJAPREVISTOS,'
      '         PI_FECHARECONSULTA = :PI_FECHARECONSULTA,'
      '         PI_HISTORIACLINICA = :PI_HISTORIACLINICA,'
      '         PI_MEDICO = :PI_MEDICO,'
      '         PI_FECHARECEPCION = :PI_FECHARECEPCION,'
      '         PI_USUALTA = :PI_USUALTA,'
      '         PI_FECHAALTA = :PI_FECHAALTA,'
      '         PI_USUMODIF = :PI_USUMODIF,'
      '         PI_FECHAMODIF = SYSDATE,'
      '         PI_PROTESIS = :PI_PROTESIS,'
      '         PI_IDGRAVEDAD_CIE10 = :PI_IDGRAVEDAD_CIE10,'
      '         PI_IDMOTIVONOCARGA = :PI_IDMOTIVONOCARGA,'
      '         PI_PRESTADOR_NOMBRE = :PI_PRESTADOR_NOMBRE,'
      '         PI_PRESTADOR_TELEFONOS = :PI_PRESTADOR_TELEFONOS,'
      '         PI_PRESTADOR_CALLE = :PI_PRESTADOR_CALLE,'
      '         PI_PRESTADOR_NUMERO = :PI_PRESTADOR_NUMERO,'
      '         PI_PRESTADOR_PISO = :PI_PRESTADOR_PISO,'
      '         PI_PRESTADOR_DEPARTAMENTO = :PI_PRESTADOR_DEPARTAMENTO,'
      '         PI_PRESTADOR_LOCALIDAD = :PI_PRESTADOR_LOCALIDAD,'
      '         PI_PRESTADOR_CPOSTAL = :PI_PRESTADOR_CPOSTAL,'
      '         PI_PRESTADOR_CPOSTALA = :PI_PRESTADOR_CPOSTALA,'
      '         PI_PRESTADOR_PROVINCIA = :PI_PRESTADOR_PROVINCIA,'
      '         PI_FECHABAJAPRESTADOR = :PI_FECHABAJAPRESTADOR,'
      '         PI_IDLESIONAGENTEMATERIAL = :PI_IDLESIONAGENTEMATERIAL'
      '   WHERE PI_ID = :OLD_PI_ID;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:PI_IDEXPEDIENTE, '#39'004'#39 +
        ', :PI_USUMODIF, :PI_FECHARECEPCION, NULL);'
      ''
      '  IF (:DA_OPCION <> '#39'S'#39') THEN'
      
        '    ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO (:PI_IDEXPEDIENTE, :DA_O' +
        'PCION, :DA_HOJAS, :PI_USUALTA, '#39'PMI'#39', NULL);'
      '  END IF;'
      ''
      
        '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_DIAGNOSTICOOMS, ' +
        'EX_GRAVEDAD'
      '    INTO SINIESTRO, ORDEN, RECAIDA, DIAGNOSTICOOMS, GRAVEDAD'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :PI_IDEXPEDIENTE;'
      ''
      '  IF (:GENERAR_EVOLUTIVO = '#39'S'#39') THEN'
      
        '    SELECT DECODE(TRIM(:PI_INTERNINSTITUCION), NULL, NULL, :PI_F' +
        'ECHABAJAMEDICA), DECODE(TRIM(:PI_INTERNINSTITUCION), NULL, '#39'01'#39',' +
        ' '#39'03'#39')'
      '      INTO FECHA_CONTROL, TIPO_TRATAMIENTO'
      '      FROM DUAL;'
      ''
      
        '    ART.SINIESTRO.DO_GENERAREVOLUTIVO('#39'PI'#39', :PI_IDEXPEDIENTE, :P' +
        'I_IDPRESTADOR,'
      
        '                                      UPPER(:PI_DIAGNOSTICO), :P' +
        'I_IDDIAGNOSTICO, :PI_IDGRAVEDAD_CIE10, :PI_FECHABAJAMEDICA,'
      
        '                                      :PI_FECHARECEPCION, UPPER(' +
        ':PI_INTERNINSTITUCION), UPPER(:PI_OBSERVACIONES),'
      
        '                                      NULL, FECHA_CONTROL, NULL,' +
        ' TIPO_TRATAMIENTO, NULL, NULL,'
      
        '                                      NULL, NULL, NULL, NULL, NU' +
        'LL, '#39'E'#39', :PI_USUALTA, '#39'SINI'#39');'
      '  END IF;'
      ''
      
        '  ART.SINIESTRO.DO_REGAUDITLOG_COMPLETO (:PI_IDEXPEDIENTE, '#39'SINI' +
        'ESTROS'#39','
      
        '                                         '#39'ADM. TABLAS PARTE DE I' +
        'NGRESO'#39','
      
        '                                         '#39'MODIFICACION'#39', :PI_USU' +
        'ALTA, -1,'
      '                                          DIAGNOSTICOOMS,'
      
        '                                          GRAVEDAD, '#39#39', '#39#39', '#39#39', ' +
        #39#39', '#39#39');'
      'END;')
    InsertSQL.Strings = (
      'DECLARE'
      '  SINIESTRO SEX_EXPEDIENTES.EX_SINIESTRO%TYPE;'
      '  ORDEN     SEX_EXPEDIENTES.EX_ORDEN%TYPE;'
      '  RECAIDA   SEX_EXPEDIENTES.EX_RECAIDA%TYPE;'
      ''
      '  DIAGNOSTICOOMS SEX_EXPEDIENTES.EX_DIAGNOSTICOOMS%TYPE;'
      '  GRAVEDAD       SEX_EXPEDIENTES.EX_GRAVEDAD%TYPE;'
      ''
      '  FECHA_CONTROL DATE;'
      '  TIPO_TRATAMIENTO VARCHAR2(2);'
      'BEGIN'
      '  /* INSERTO EL PARTE DE INGRESO */'
      '  '
      '  INSERT INTO SIN.SPI_PARTEDEINGRESO'
      
        '              (PI_TIPO, PI_RECALIFICACION, PI_COINCIDE_MECANISMO' +
        '_ACC,'
      '               PI_PORCENTAJEINCAPACIDAD, PI_ID,'
      
        '               PI_IDEXPEDIENTE, PI_IDPRESTADOR, PI_EPMANIFESTACI' +
        'ON,'
      
        '               PI_EPEXPUESTODESDE, PI_IDGRAVEDAD, PI_DIAGNOSTICO' +
        ','
      
        '               PI_IDDIAGNOSTICO, PI_IDLESIONFORMA, PI_IDLESIONAG' +
        'ENTE,'
      '               PI_IDLESIONNATURALEZA, PI_IDLESIONZONA,'
      '               PI_PRESUPINCAPACIDAD, PI_OBSERVACIONES,'
      '               PI_TRATAMINSTITUCION, PI_TRATAMUBICACION,'
      '               PI_INTERNINSTITUCION, PI_INTERNUBICACION,'
      '               PI_FECHABAJAMEDICA, PI_DIASBAJAPREVISTOS,'
      
        '               PI_FECHARECONSULTA, PI_HISTORIACLINICA, PI_MEDICO' +
        ','
      '               PI_FECHARECEPCION, PI_USUALTA, PI_FECHAALTA,'
      '               PI_PROTESIS, PI_IDGRAVEDAD_CIE10,'
      '               PI_IDMOTIVONOCARGA, PI_FECHACARGA,'
      
        '               PI_PRESTADOR_NOMBRE, PI_PRESTADOR_TELEFONOS, PI_P' +
        'RESTADOR_CALLE,'
      
        '               PI_PRESTADOR_NUMERO, PI_PRESTADOR_PISO, PI_PRESTA' +
        'DOR_DEPARTAMENTO,'
      
        '               PI_PRESTADOR_LOCALIDAD, PI_PRESTADOR_CPOSTAL, PI_' +
        'PRESTADOR_CPOSTALA,'
      
        '               PI_PRESTADOR_PROVINCIA, PI_FECHABAJAPRESTADOR, PI' +
        '_IDLESIONAGENTEMATERIAL'
      '              )'
      
        '       VALUES (:PI_TIPO, :PI_RECALIFICACION, :PI_COINCIDE_MECANI' +
        'SMO_ACC,'
      '               :PI_PORCENTAJEINCAPACIDAD, :PI_ID,'
      
        '               :PI_IDEXPEDIENTE, DECODE(:PI_IDPRESTADOR, 0, NULL' +
        ', :PI_IDPRESTADOR),'
      
        '               :PI_EPMANIFESTACION, :PI_EPEXPUESTODESDE, :PI_IDG' +
        'RAVEDAD, UPPER(:PI_DIAGNOSTICO),'
      
        '               :PI_IDDIAGNOSTICO, :PI_IDLESIONFORMA, :PI_IDLESIO' +
        'NAGENTE,'
      '               :PI_IDLESIONNATURALEZA, :PI_IDLESIONZONA,'
      '               :PI_PRESUPINCAPACIDAD, UPPER(:PI_OBSERVACIONES),'
      
        '               UPPER(:PI_TRATAMINSTITUCION), UPPER(:PI_TRATAMUBI' +
        'CACION),'
      
        '               UPPER(:PI_INTERNINSTITUCION), UPPER(:PI_INTERNUBI' +
        'CACION),'
      
        '               art.iif_null(:PI_FECHABAJAMEDICA, :PI_FECHARECEPC' +
        'ION, :PI_FECHABAJAMEDICA), :PI_DIASBAJAPREVISTOS,'
      
        '               :PI_FECHARECONSULTA, :PI_HISTORIACLINICA, :PI_MED' +
        'ICO,'
      '               :PI_FECHARECEPCION, :PI_USUALTA, ART.ACTUALDATE,'
      '               :PI_PROTESIS, :PI_IDGRAVEDAD_CIE10,'
      '               :PI_IDMOTIVONOCARGA, SYSDATE,'
      
        '               :PI_PRESTADOR_NOMBRE, :PI_PRESTADOR_TELEFONOS, :P' +
        'I_PRESTADOR_CALLE,'
      
        '               :PI_PRESTADOR_NUMERO, :PI_PRESTADOR_PISO, :PI_PRE' +
        'STADOR_DEPARTAMENTO,'
      
        '               :PI_PRESTADOR_LOCALIDAD, :PI_PRESTADOR_CPOSTAL, :' +
        'PI_PRESTADOR_CPOSTALA,'
      
        '               :PI_PRESTADOR_PROVINCIA, :PI_FECHABAJAPRESTADOR, ' +
        ':PI_IDLESIONAGENTEMATERIAL'
      '              );'
      ''
      '  IF (:DA_OPCION <> '#39'S'#39') THEN'
      
        '    ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO (:PI_IDEXPEDIENTE, :DA_O' +
        'PCION, :DA_HOJAS, :PI_USUALTA, '#39'PMI'#39', NULL);'
      '  END IF;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:PI_IDEXPEDIENTE, '#39'004'#39 +
        ', :PI_USUALTA, :PI_FECHARECEPCION, NULL);'
      ''
      
        '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_DIAGNOSTICOOMS, ' +
        'EX_GRAVEDAD'
      '    INTO SINIESTRO, ORDEN, RECAIDA, DIAGNOSTICOOMS, GRAVEDAD'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :PI_IDEXPEDIENTE;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAR_DOCUMENTO (SINIESTRO, ORDEN, RECAI' +
        'DA, '#39'004'#39', :PI_FECHARECEPCION);'
      
        '  ART.SINIESTRO.DO_REGAUDITLOG_COMPLETO (:PI_IDEXPEDIENTE, '#39'SINI' +
        'ESTROS'#39','
      
        '                                         '#39'ADM. TABLAS PARTE DE I' +
        'NGRESO'#39','
      
        '                                         '#39'ALTA'#39', :PI_USUALTA, -1' +
        ','
      '                                          DIAGNOSTICOOMS,'
      
        '                                          GRAVEDAD, '#39#39', '#39#39', '#39#39', ' +
        #39#39', '#39#39');'
      ''
      
        '  IF ((:PI_INTERNINSTITUCION IS NOT NULL) AND (:PI_IDPRESTADOR I' +
        'S NOT NULL)) OR (:GENERAR_EVOLUTIVO = '#39'S'#39') THEN'
      
        '    SELECT DECODE(TRIM(:PI_INTERNINSTITUCION), NULL, NULL, :PI_F' +
        'ECHABAJAMEDICA), DECODE(TRIM(:PI_INTERNINSTITUCION), NULL, '#39'01'#39',' +
        ' '#39'03'#39')'
      '      INTO FECHA_CONTROL, TIPO_TRATAMIENTO'
      '      FROM DUAL;'
      ''
      
        '    ART.SINIESTRO.DO_GENERAREVOLUTIVO('#39'PI'#39', :PI_IDEXPEDIENTE, :P' +
        'I_IDPRESTADOR,'
      
        '                                      UPPER(:PI_DIAGNOSTICO), :P' +
        'I_IDDIAGNOSTICO, :PI_IDGRAVEDAD_CIE10, :PI_FECHABAJAMEDICA,'
      
        '                                      :PI_FECHARECEPCION, UPPER(' +
        ':PI_INTERNINSTITUCION), UPPER(:PI_OBSERVACIONES),'
      
        '                                      NULL, FECHA_CONTROL, NULL,' +
        ' TIPO_TRATAMIENTO, NULL, NULL,'
      
        '                                      NULL, NULL, NULL, NULL, NU' +
        'LL, '#39'E'#39', :PI_USUALTA, '#39'SINI'#39');'
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
      '   WHERE EX_ID = :PI_IDEXPEDIENTE;'
      ''
      '  DELETE FROM SIN.SPI_PARTEDEINGRESO'
      '        WHERE PI_ID = :OLD_PI_ID;'
      ''
      '  DELETE FROM SDO_DOCUEXPESIN'
      '        WHERE DO_SINIESTRO = SINIESTRO'
      '          AND DO_ORDEN = ORDEN'
      '          AND DO_RECAIDA = RECAIDA'
      '          AND DO_CODIGO = '#39'004'#39';'
      ''
      
        '  ART.SINIESTRO.DO_GENERAREVOLUTIVO('#39'PI_VUELCO'#39', :PI_IDEXPEDIENT' +
        'E, :PI_IDPRESTADOR, :PI_DIAGNOSTICO, :PI_IDDIAGNOSTICO,'
      
        '                                    :PI_IDGRAVEDAD_CIE10, :PI_FE' +
        'CHABAJAMEDICA, :PI_FECHARECEPCION,'
      
        '                                    NULL /*INTERNACION*/, :PI_OB' +
        'SERVACIONES,'
      
        '                                    :PI_PRESUPINCAPACIDAD, NULL ' +
        '/*INTERNADODESDE*/, NULL /*INTERNADOHASTA*/,'
      
        '                                    NULL /*TIPOTRATAMIENTO*/, NU' +
        'LL /*PLANREHABILIT*/, NULL /*DESDE*/, NULL /*HASTA*/,'
      
        '                                    NULL /*PROXIMOCONTROL*/, /*P' +
        'ROBABLEALTA*/ NULL, :PI_MEDICO,'
      
        '                                    NULL /*AUDITOR*/, '#39'A'#39' /*TIPO' +
        'PARTE*/, ART.GETOSUSER() /*USUARIO*/,'
      
        '                                    '#39'SINI'#39' /*MODULO*/, NULL /*PD' +
        'ESDELISTADO*/);'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:PI_IDEXPEDIENTE, '#39'004'#39 +
        ', ART.GETOSUSER(), SYSDATE, NULL, '#39'N'#39');'
      'END;')
    Left = 356
    Top = 92
  end
  inherited XPMenu: TXPMenu
    Left = 300
    Top = 120
  end
  inherited Seguridad: TSeguridad
    Left = 328
    Top = 120
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbDatos1.Collapsed'
      'gbLesion.Collapsed'
      'gbPrestador.Collapsed'
      'gbTratamiento.Collapsed'
      'gbArchivo.Collapsed')
    Left = 356
    Top = 120
  end
  inherited Acciones: TActionList
    Left = 300
    Top = 148
    inherited acEliminar: TAction
      Enabled = True
    end
  end
end
