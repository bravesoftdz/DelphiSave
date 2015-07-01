inherited frmOtros: TfrmOtros
  Left = 231
  Top = 70
  BorderStyle = bsNone
  Caption = 'frmOtros'
  ClientHeight = 600
  ClientWidth = 632
  Constraints.MinHeight = 240
  Constraints.MinWidth = 632
  OldCreateOrder = True
  OnCreate = FSFormCreate
  ExplicitWidth = 632
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object gbDiagnostico: TJvgGroupBox [0]
    Left = 0
    Top = 426
    Width = 632
    Height = 81
    Align = alTop
    Caption = ' Diagn'#243'stico '
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
      81)
    FullHeight = 81
    object Label2: TLabel
      Left = 6
      Top = 28
      Width = 61
      Height = 13
      AutoSize = False
      Caption = 'Diagn'#243'stico'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 37
      Height = 13
      AutoSize = False
      Caption = 'CIE-10'
    end
    object Label11: TLabel
      Left = 280
      Top = 56
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Gravedad CIE10'
    end
    inline fraSA_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO
      Left = 48
      Top = 52
      Width = 225
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 48
      ExplicitTop = 52
      ExplicitWidth = 225
      DesignSize = (
        225
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 162
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
        DataField = sdqDatosSA_IDDIAGNOSTICO
        DataSource = dsDatos
      end
    end
    inline fraSA_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10
      Left = 364
      Top = 52
      Width = 259
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 364
      ExplicitTop = 52
      ExplicitWidth = 259
      DesignSize = (
        259
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 196
        ExplicitWidth = 196
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
        DataField = sdqDatosSA_IDGRAVEDADCIE10
        DataSource = dsDatos
      end
    end
    object edSA_DIAGNOSTICO: TDBMemo
      Left = 64
      Top = 25
      Width = 559
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelWidth = 0
      DataField = 'SA_DIAGNOSTICO'
      DataSource = dsDatos
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object gbArchivo: TJvgGroupBox [1]
    Left = 0
    Top = 507
    Width = 632
    Height = 81
    Align = alTop
    Caption = ' Sistema de Archivo '
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
      81)
    FullHeight = 81
    object Label19: TLabel
      Left = 437
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
      Left = 261
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
        ExplicitWidth = 255
      end
      inherited edDA_HOJAS: TIntEdit
        Left = 426
        ExplicitLeft = 426
      end
    end
    object edSA_FECHARECEPCION: TDBDateEdit
      Left = 537
      Top = 24
      Width = 88
      Height = 21
      DataField = 'SA_FECHARECEPCION'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una Fecha.'
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 2
      StartOfWeek = Sun
    end
    object edSector: TDBEdit
      Left = 80
      Top = 24
      Width = 171
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
    end
    object edSA_FECHAALTA: TDBDateEdit
      Left = 341
      Top = 24
      Width = 88
      Height = 21
      DataField = 'SA_FECHAALTA'
      DataSource = dsDatos
      Color = clBtnFace
      DialogTitle = 'Seleccione una Fecha.'
      Enabled = False
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 1
      StartOfWeek = Sun
    end
  end
  object gbLaboral: TJvgGroupBox [2]
    Left = 0
    Top = 177
    Width = 632
    Height = 137
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
      632
      137)
    FullHeight = 137
    object Label9: TLabel
      Left = 260
      Top = 24
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'En Accidente'
    end
    object Label12: TLabel
      Left = 348
      Top = 80
      Width = 59
      Height = 26
      Caption = 'Antig'#252'edad'#13#10'en el Puesto'
    end
    object Label13: TLabel
      Left = 442
      Top = 92
      Width = 24
      Height = 13
      Caption = 'A'#241'os'
    end
    object Label14: TLabel
      Left = 474
      Top = 92
      Width = 30
      Height = 13
      Caption = 'Meses'
    end
    object Label20: TLabel
      Left = 12
      Top = 68
      Width = 103
      Height = 13
      Caption = 'Descripci'#243'n del hecho'
    end
    object Label22: TLabel
      Left = 12
      Top = 24
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Tarea Habitual'
    end
    object Label1: TLabel
      Left = 508
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object edSA_ANIOSPUESTO: TDBPatternEdit
      Left = 442
      Top = 108
      Width = 28
      Height = 21
      DataField = 'SA_ANIOSPUESTO'
      DataSource = dsDatos
      MaxLength = 2
      TabOrder = 4
      Pattern = '0123456789'
    end
    object edSA_MESESPUESTO: TDBPatternEdit
      Left = 474
      Top = 108
      Width = 23
      Height = 21
      DataField = 'SA_MESESPUESTO'
      DataSource = dsDatos
      MaxLength = 2
      TabOrder = 5
      Pattern = '0123456789'
    end
    object edSA_ANTIGUEDADPUESTO: TDBDateEdit
      Left = 346
      Top = 108
      Width = 88
      Height = 21
      DataField = 'SA_ANTIGUEDADPUESTO'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una Fecha.'
      NumGlyphs = 2
      TabOrder = 3
      StartOfWeek = Sun
    end
    inline fraSA_TAREAHABITUAL: TfraCCI_CIUO
      Left = 12
      Top = 40
      Width = 245
      Height = 23
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 40
      ExplicitWidth = 245
      DesignSize = (
        245
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 182
        ExplicitWidth = 182
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
        DataField = sdqDatosSA_IDTAREAHABITUAL
        DataSource = dsDatos
      end
    end
    inline fraSA_TAREAACCIDENTE: TfraCCI_CIUO
      Left = 260
      Top = 40
      Width = 245
      Height = 23
      TabOrder = 1
      ExplicitLeft = 260
      ExplicitTop = 40
      ExplicitWidth = 245
      DesignSize = (
        245
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 182
        ExplicitWidth = 182
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
        DataField = sdqDatosSA_IDTAREAACCIDENTE
        DataSource = dsDatos
      end
    end
    object edSA_DESCRIPCION: TDBMemo
      Left = 12
      Top = 84
      Width = 329
      Height = 45
      BevelWidth = 0
      DataField = 'SA_DESCRIPCION'
      DataSource = dsDatos
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edSA_OBSERVACIONES: TDBMemo
      Left = 508
      Top = 40
      Width = 115
      Height = 89
      Anchors = [akLeft, akTop, akRight]
      BevelWidth = 0
      DataField = 'SA_OBSERVACIONES'
      DataSource = dsDatos
      ScrollBars = ssVertical
      TabOrder = 6
    end
  end
  object gbLesion: TJvgGroupBox [3]
    Left = 0
    Top = 314
    Width = 632
    Height = 112
    Align = alTop
    Caption = ' Datos de la lesi'#243'n / Otros datos '
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
    FullHeight = 112
    object Label30: TLabel
      Left = 4
      Top = 24
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Forma'
    end
    object Label31: TLabel
      Left = 160
      Top = 24
      Width = 117
      Height = 13
      AutoSize = False
      Caption = 'Agente causante'
    end
    object Label32: TLabel
      Left = 472
      Top = 24
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Naturaleza'
    end
    object Label33: TLabel
      Left = 316
      Top = 24
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Zona'
    end
    object Label34: TLabel
      Left = 420
      Top = 68
      Width = 143
      Height = 13
      Caption = 'Motivo de NO Carga de Datos'
    end
    object Label35: TLabel
      Left = 256
      Top = 68
      Width = 53
      Height = 13
      AutoSize = False
      Caption = 'Gravedad'
    end
    object Label7: TLabel
      Left = 4
      Top = 68
      Width = 121
      Height = 13
      Caption = 'Agente material asociado'
    end
    inline fraSA_IDLESIONFORMA: TfraSLF_LESIONFORMA
      Left = 0
      Top = 40
      Width = 154
      Height = 23
      TabOrder = 0
      ExplicitTop = 40
      ExplicitWidth = 154
      DesignSize = (
        154
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 106
        ExplicitLeft = 48
        ExplicitWidth = 106
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
        DataField = sdqDatosSA_IDLESIONFORMA
        DataSource = dsDatos
      end
    end
    inline fraSA_IDLESIONAGENTE: TfraSLA_LESIONAGENTE
      Left = 156
      Top = 40
      Width = 154
      Height = 23
      TabOrder = 1
      ExplicitLeft = 156
      ExplicitTop = 40
      ExplicitWidth = 154
      DesignSize = (
        154
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 106
        ExplicitLeft = 48
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
        DataField = sdqDatosSA_IDLESIONAGENTE
        DataSource = dsDatos
      end
    end
    inline fraSA_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA
      Left = 468
      Top = 40
      Width = 154
      Height = 23
      TabOrder = 3
      ExplicitLeft = 468
      ExplicitTop = 40
      ExplicitWidth = 154
      DesignSize = (
        154
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 106
        ExplicitLeft = 48
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
        DataField = sdqDatosSA_IDLESIONNATURALEZA
        DataSource = dsDatos
      end
    end
    inline fraSA_IDLESIONZONA: TfraSLZ_LESIONZONA
      Left = 312
      Top = 40
      Width = 154
      Height = 23
      TabOrder = 2
      ExplicitLeft = 312
      ExplicitTop = 40
      ExplicitWidth = 154
      DesignSize = (
        154
        23)
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TComboGrid
        Left = 48
        Width = 106
        ExplicitLeft = 48
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
        DataField = sdqDatosSA_IDLESIONZONA
        DataSource = dsDatos
      end
    end
    inline fraSA_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA
      Left = 416
      Top = 84
      Width = 207
      Height = 23
      TabOrder = 7
      ExplicitLeft = 416
      ExplicitTop = 84
      ExplicitWidth = 207
      inherited cmbDescripcion: TComboGrid
        Width = 144
        ExplicitWidth = 144
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
        DataField = sdqDatosSA_IDMOTIVONOCARGA
        DataSource = dsDatos
      end
    end
    inline fraSA_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD
      Left = 252
      Top = 84
      Width = 160
      Height = 23
      TabOrder = 6
      ExplicitLeft = 252
      ExplicitTop = 84
      ExplicitWidth = 160
      DesignSize = (
        160
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 97
        ExplicitWidth = 97
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
        DataField = sdqDatosSA_IDGRAVEDAD
        DataSource = dsDatos
        FieldID = 'TG_ID'
      end
    end
    object chkSA_INTERNADO: TDBCheckBox
      Left = 184
      Top = 87
      Width = 65
      Height = 15
      Caption = 'Internado'
      DataField = 'SA_INTERNADO'
      DataSource = dsDatos
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    inline fraSA_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL
      Left = 0
      Top = 84
      Width = 180
      Height = 23
      TabOrder = 4
      ExplicitTop = 84
      ExplicitWidth = 180
      inherited cmbDescripcion: TComboGrid
        Width = 117
        ExplicitWidth = 117
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
        DataField = sdqDatosSA_IDLESIONAGENTEMATERIAL
        DataSource = dsDatos
      end
    end
  end
  object gbDatos1: TJvgGroupBox [4]
    Left = 0
    Top = 81
    Width = 632
    Height = 96
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
      96)
    FullHeight = 65
    object Shape1: TShape
      Left = 2
      Top = 16
      Width = 628
      Height = 1
      Align = alTop
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    object Label15: TLabel
      Left = 266
      Top = 20
      Width = 136
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Horario de la jornada laboral'
    end
    object Label23: TLabel
      Left = 8
      Top = 20
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Tipo Siniestro'
    end
    object Label24: TLabel
      Left = 334
      Top = 40
      Width = 14
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fin'
    end
    object Label25: TLabel
      Left = 458
      Top = 40
      Width = 14
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fin'
    end
    object Label16: TLabel
      Left = 266
      Top = 40
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Inicio'
    end
    object Label17: TLabel
      Left = 390
      Top = 40
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Inicio'
    end
    object Label5: TLabel
      Left = 528
      Top = 21
      Width = 57
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Baja m'#233'dica'
    end
    object Label6: TLabel
      Left = 8
      Top = 66
      Width = 130
      Height = 13
      Caption = 'Nro. siniestro Colonia Suiza'
    end
    object lbTextoDenuncia: TLabel
      Left = 414
      Top = 76
      Width = 44
      Height = 13
      Caption = 'Sin datos'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5581568
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edSA_HORJORNADA1DESDE: TTimeEditor
      Left = 294
      Top = 36
      Width = 35
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      CustomFormat = 'HH:mm'
    end
    object edSA_HORJORNADA1HASTA: TTimeEditor
      Left = 350
      Top = 36
      Width = 34
      Height = 21
      Anchors = [akTop, akRight]
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      CustomFormat = 'HH:mm'
    end
    object edSA_HORJORNADA2DESDE: TTimeEditor
      Left = 418
      Top = 36
      Width = 37
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      CustomFormat = 'HH:mm'
    end
    object edSA_HORJORNADA2HASTA: TTimeEditor
      Left = 474
      Top = 36
      Width = 37
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      CustomFormat = 'HH:mm'
    end
    inline fraTipoSiniestro: TfraTipoSiniestro
      Left = 8
      Top = 36
      Width = 249
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 36
      ExplicitWidth = 249
      DesignSize = (
        249
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 186
        ExplicitWidth = 186
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
        DataField = sdqDatosSA_TIPO
        DataSource = dsDatos
      end
    end
    object chkSA_ALTAPORAMP: TDBCheckBox
      Left = 277
      Top = 66
      Width = 97
      Height = 15
      AllowGrayed = True
      Caption = 'Abierto por AMP'
      DataField = 'SA_ALTAPORAMP'
      DataSource = dsDatos
      ReadOnly = True
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edSA_FECHABAJAMEDICA: TDBDateEdit
      Left = 526
      Top = 36
      Width = 97
      Height = 21
      DataField = 'SA_FECHABAJAMEDICA'
      DataSource = dsDatos
      DialogTitle = 'Seleccione una Fecha.'
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 5
      StartOfWeek = Sun
    end
    object edSA_NROSINISUIZA: TDBEdit
      Left = 143
      Top = 62
      Width = 121
      Height = 21
      DataField = 'SA_NROSINISUIZA'
      DataSource = dsDatos
      TabOrder = 6
    end
    object rpSA_QUIENDENUNCIA: TJvDBRadioPanel
      Left = 404
      Top = 62
      Width = 151
      Height = 16
      Hint = #191'Denuncia realizada por el trabajador?'
      BevelOuter = bvNone
      Columns = 3
      DataField = 'SA_QUIENDENUNCIA'
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
      TabOrder = 8
      TabStop = True
      Values.Strings = (
        '1'
        '2'
        '3')
      OnChange = rpSA_QUIENDENUNCIAChange
    end
  end
  object gbPrestador: TJvgGroupBox [5]
    Left = 0
    Top = 0
    Width = 632
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
      81)
    FullHeight = 81
    inline fraSA_IDPRESTADOR: TfraPrestadorFueraDeContrato
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
        Width = 547
        ExplicitWidth = 547
        FullHeight = 72
        inherited fraDomicilioExtra: TfraDomicilio
          Width = 353
          ExplicitWidth = 353
          inherited lbNro: TLabel
            Left = 138
            ExplicitLeft = 138
          end
          inherited lbPiso: TLabel
            Left = 210
            ExplicitLeft = 210
          end
          inherited lbDto: TLabel
            Left = 286
            ExplicitLeft = 286
          end
          inherited lbProvincia: TLabel
            Left = 191
            ExplicitLeft = 191
          end
          inherited cmbCalle: TArtComboBox
            Width = 57
            ExplicitWidth = 57
          end
          inherited edNumero: TEdit
            Left = 160
            ExplicitLeft = 160
          end
          inherited edPiso: TEdit
            Left = 236
            ExplicitLeft = 236
          end
          inherited edDto: TEdit
            Left = 308
            ExplicitLeft = 308
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 0
            ExplicitWidth = 0
          end
          inherited edProvincia: TEdit
            Left = 240
            ExplicitLeft = 240
          end
          inherited btnBuscar: TButton
            Left = 109
            ExplicitLeft = 109
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
  inherited sdqDatos: TSDQuery
    OnNewRecord = sdqDatosNewRecord
    SQL.Strings = (
      
        'SELECT SA_ID, SA_IDEXPEDIENTE, SA_DESCRIPCION, SA_DIAGNOSTICO, S' +
        'A_IDDIAGNOSTICO,'
      
        '       SA_IDGRAVEDADCIE10, SA_IDGRAVEDAD, SA_OBSERVACIONES, SA_I' +
        'DLESIONFORMA,'
      
        '       SA_IDLESIONAGENTE, SA_IDLESIONNATURALEZA, SA_IDLESIONZONA' +
        ','
      
        '       SA_HORJORNADA1DESDE, SA_HORJORNADA1HASTA, SA_HORJORNADA2D' +
        'ESDE,'
      
        '       SA_HORJORNADA2HASTA, SA_IDPRESTADOR, NVL(SA_IDTAREAHABITU' +
        'AL, ART.SINIESTRO.GET_TAREATRABAJADOR(EX_ID)) SA_IDTAREAHABITUAL' +
        ','
      '       SA_IDTAREAACCIDENTE, SA_ANTIGUEDADPUESTO, SA_ANIOSPUESTO,'
      
        '       SA_MESESPUESTO, SA_FECHARECEPCION, SA_USUALTA, SA_FECHAAL' +
        'TA, SA_USUMODIF,'
      
        '       SA_FECHAMODIF, SA_IDMOTIVONOCARGA, SA_FECHACARGA, SA_CIE1' +
        '0REVISADO,'
      
        '       SA_USUARIOREVISION, SA_FECHAREVISION, SA_CPAPEL, SE_SECTO' +
        'R,'
      
        '       EX_FECHAALTA, EX_FECHAACCIDENTE, EX_TIPO, EX_FECHARECEPCI' +
        'ON,'
      '       NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) as FACCREC,'
      
        '       SA_TIPO, CAST(NULL AS VARCHAR2(1)) AS DA_OPCION, TO_NUMBE' +
        'R(NULL) AS DA_HOJAS,'
      
        '       SA_PRESTADOR_NOMBRE, SA_PRESTADOR_TELEFONOS, SA_PRESTADOR' +
        '_CALLE,'
      
        '       SA_PRESTADOR_NUMERO, SA_PRESTADOR_PISO, SA_PRESTADOR_DEPA' +
        'RTAMENTO,'
      
        '       SA_PRESTADOR_LOCALIDAD, SA_PRESTADOR_CPOSTAL, SA_PRESTADO' +
        'R_CPOSTALA,'
      
        '       SA_PRESTADOR_PROVINCIA, DECODE(SA_INTERNADO, NULL, '#39'N'#39', S' +
        'A_INTERNADO) as SA_INTERNADO,'
      
        '       SA_IDLESIONAGENTEMATERIAL, DECODE(SA_ALTAPORAMP, NULL, '#39'N' +
        #39', SA_ALTAPORAMP) as SA_ALTAPORAMP,'
      
        '       SA_FECHABAJAMEDICA, SA_NROSINISUIZA, SA_QUIENDENUNCIA, SA' +
        '_NRO_CECAP, EX_ALTAMEDICA, EX_BAJAMEDICA'
      
        '  FROM USE_USUARIOS, SEX_EXPEDIENTES, SIN.SSA_SOLICITUDASISTENCI' +
        'A'
      ' WHERE SA_IDEXPEDIENTE = :SA_IDEXPEDIENTE'
      '   AND EX_ID = SA_IDEXPEDIENTE'
      '   AND SE_USUARIO = SA_USUALTA')
    Left = 80
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SA_IDEXPEDIENTE'
        ParamType = ptInput
      end>
    object sdqDatosSA_ID: TFloatField
      FieldName = 'SA_ID'
      Required = True
    end
    object sdqDatosSA_IDEXPEDIENTE: TFloatField
      FieldName = 'SA_IDEXPEDIENTE'
      Required = True
    end
    object sdqDatosSA_DESCRIPCION: TStringField
      FieldName = 'SA_DESCRIPCION'
      Size = 250
    end
    object sdqDatosSA_DIAGNOSTICO: TStringField
      FieldName = 'SA_DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosSA_IDDIAGNOSTICO: TFloatField
      FieldName = 'SA_IDDIAGNOSTICO'
    end
    object sdqDatosSA_IDGRAVEDADCIE10: TFloatField
      FieldName = 'SA_IDGRAVEDADCIE10'
    end
    object sdqDatosSA_IDGRAVEDAD: TFloatField
      FieldName = 'SA_IDGRAVEDAD'
    end
    object sdqDatosSA_OBSERVACIONES: TStringField
      FieldName = 'SA_OBSERVACIONES'
      Size = 250
    end
    object sdqDatosSA_IDLESIONFORMA: TFloatField
      FieldName = 'SA_IDLESIONFORMA'
    end
    object sdqDatosSA_IDLESIONAGENTE: TFloatField
      FieldName = 'SA_IDLESIONAGENTE'
    end
    object sdqDatosSA_IDLESIONNATURALEZA: TFloatField
      FieldName = 'SA_IDLESIONNATURALEZA'
    end
    object sdqDatosSA_IDLESIONZONA: TFloatField
      FieldName = 'SA_IDLESIONZONA'
    end
    object sdqDatosSA_HORJORNADA1DESDE: TDateTimeField
      FieldName = 'SA_HORJORNADA1DESDE'
      DisplayFormat = 'hh:nn'
    end
    object sdqDatosSA_HORJORNADA1HASTA: TDateTimeField
      FieldName = 'SA_HORJORNADA1HASTA'
      DisplayFormat = 'hh:nn'
    end
    object sdqDatosSA_HORJORNADA2DESDE: TDateTimeField
      FieldName = 'SA_HORJORNADA2DESDE'
      DisplayFormat = 'hh:nn'
    end
    object sdqDatosSA_HORJORNADA2HASTA: TDateTimeField
      FieldName = 'SA_HORJORNADA2HASTA'
      DisplayFormat = 'hh:nn'
    end
    object sdqDatosSA_IDPRESTADOR: TFloatField
      FieldName = 'SA_IDPRESTADOR'
    end
    object sdqDatosSA_IDTAREAHABITUAL: TFloatField
      FieldName = 'SA_IDTAREAHABITUAL'
    end
    object sdqDatosSA_IDTAREAACCIDENTE: TFloatField
      FieldName = 'SA_IDTAREAACCIDENTE'
    end
    object sdqDatosSA_ANTIGUEDADPUESTO: TDateTimeField
      FieldName = 'SA_ANTIGUEDADPUESTO'
    end
    object sdqDatosSA_ANIOSPUESTO: TFloatField
      FieldName = 'SA_ANIOSPUESTO'
    end
    object sdqDatosSA_MESESPUESTO: TFloatField
      FieldName = 'SA_MESESPUESTO'
    end
    object sdqDatosSA_FECHARECEPCION: TDateTimeField
      FieldName = 'SA_FECHARECEPCION'
    end
    object sdqDatosSA_USUALTA: TStringField
      FieldName = 'SA_USUALTA'
    end
    object sdqDatosSA_FECHAALTA: TDateTimeField
      FieldName = 'SA_FECHAALTA'
    end
    object sdqDatosSA_USUMODIF: TStringField
      FieldName = 'SA_USUMODIF'
    end
    object sdqDatosSA_FECHAMODIF: TDateTimeField
      FieldName = 'SA_FECHAMODIF'
    end
    object sdqDatosSA_IDMOTIVONOCARGA: TFloatField
      FieldName = 'SA_IDMOTIVONOCARGA'
    end
    object sdqDatosSA_FECHACARGA: TDateTimeField
      FieldName = 'SA_FECHACARGA'
    end
    object sdqDatosSA_CIE10REVISADO: TStringField
      FieldName = 'SA_CIE10REVISADO'
      Size = 1
    end
    object sdqDatosSA_USUARIOREVISION: TStringField
      FieldName = 'SA_USUARIOREVISION'
    end
    object sdqDatosSA_FECHAREVISION: TDateTimeField
      FieldName = 'SA_FECHAREVISION'
    end
    object sdqDatosSA_CPAPEL: TFloatField
      FieldName = 'SA_CPAPEL'
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
    object sdqDatosDA_OPCION: TStringField
      FieldName = 'DA_OPCION'
      Size = 1
    end
    object sdqDatosDA_HOJAS: TFloatField
      FieldName = 'DA_HOJAS'
    end
    object sdqDatosSA_TIPO: TStringField
      FieldName = 'SA_TIPO'
      Size = 1
    end
    object sdqDatosSA_PRESTADOR_NOMBRE: TStringField
      FieldName = 'SA_PRESTADOR_NOMBRE'
      Size = 100
    end
    object sdqDatosSA_PRESTADOR_TELEFONOS: TStringField
      FieldName = 'SA_PRESTADOR_TELEFONOS'
      Size = 60
    end
    object sdqDatosSA_PRESTADOR_CALLE: TStringField
      FieldName = 'SA_PRESTADOR_CALLE'
      Size = 60
    end
    object sdqDatosSA_PRESTADOR_NUMERO: TStringField
      FieldName = 'SA_PRESTADOR_NUMERO'
    end
    object sdqDatosSA_PRESTADOR_PISO: TStringField
      FieldName = 'SA_PRESTADOR_PISO'
    end
    object sdqDatosSA_PRESTADOR_DEPARTAMENTO: TStringField
      FieldName = 'SA_PRESTADOR_DEPARTAMENTO'
    end
    object sdqDatosSA_PRESTADOR_LOCALIDAD: TStringField
      FieldName = 'SA_PRESTADOR_LOCALIDAD'
      Size = 60
    end
    object sdqDatosSA_PRESTADOR_CPOSTAL: TStringField
      FieldName = 'SA_PRESTADOR_CPOSTAL'
      Size = 5
    end
    object sdqDatosSA_PRESTADOR_CPOSTALA: TStringField
      FieldName = 'SA_PRESTADOR_CPOSTALA'
      Size = 8
    end
    object sdqDatosSA_PRESTADOR_PROVINCIA: TStringField
      FieldName = 'SA_PRESTADOR_PROVINCIA'
      Size = 2
    end
    object sdqDatosSA_INTERNADO: TStringField
      FieldName = 'SA_INTERNADO'
      Size = 1
    end
    object sdqDatosSA_IDLESIONAGENTEMATERIAL: TFloatField
      FieldName = 'SA_IDLESIONAGENTEMATERIAL'
    end
    object sdqDatosSA_ALTAPORAMP: TStringField
      FieldName = 'SA_ALTAPORAMP'
      Size = 1
    end
    object sdqDatosSA_FECHABAJAMEDICA: TDateTimeField
      FieldName = 'SA_FECHABAJAMEDICA'
    end
    object sdqDatosSA_NROSINISUIZA: TStringField
      FieldName = 'SA_NROSINISUIZA'
    end
    object sdqDatosSA_QUIENDENUNCIA: TStringField
      FieldName = 'SA_QUIENDENUNCIA'
    end
    object sdqDatosSA_NRO_CECAP: TFloatField
      FieldName = 'SA_NRO_CECAP'
    end
    object sdqDatosEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqDatosEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
  end
  inherited dsDatos: TDataSource
    OnUpdateData = dsDatosUpdateData
    Left = 108
    Top = 8
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
      '  CUIT      CPR_PRESTADOR.CA_CLAVE%TYPE;'
      '  SECUENCIA CPR_PRESTADOR.CA_SECUENCIA%TYPE;'
      '  MUTUAL    CPR_PRESTADOR.CA_PRESTADORMUTUAL%TYPE;'
      'BEGIN'
      '  /* ACTUALIZA LA SOLICITUD DE ASISTENCIA */'
      '  UPDATE SIN.SSA_SOLICITUDASISTENCIA'
      '     SET SA_ID = :SA_ID,'
      '         SA_IDEXPEDIENTE = :SA_IDEXPEDIENTE,'
      '         SA_DESCRIPCION = UPPER(:SA_DESCRIPCION),'
      '         SA_DIAGNOSTICO = UPPER(:SA_DIAGNOSTICO),'
      '         SA_IDDIAGNOSTICO = :SA_IDDIAGNOSTICO,'
      '         SA_IDGRAVEDADCIE10 = :SA_IDGRAVEDADCIE10,'
      '         SA_IDGRAVEDAD = :SA_IDGRAVEDAD,'
      '         SA_OBSERVACIONES = UPPER(:SA_OBSERVACIONES),'
      '         SA_IDLESIONFORMA = :SA_IDLESIONFORMA,'
      '         SA_IDLESIONAGENTE = :SA_IDLESIONAGENTE,'
      '         SA_IDLESIONNATURALEZA = :SA_IDLESIONNATURALEZA,'
      '         SA_IDLESIONZONA = :SA_IDLESIONZONA,'
      '         SA_HORJORNADA1DESDE = :SA_HORJORNADA1DESDE,'
      '         SA_HORJORNADA1HASTA = :SA_HORJORNADA1HASTA,'
      '         SA_HORJORNADA2DESDE = :SA_HORJORNADA2DESDE,'
      '         SA_HORJORNADA2HASTA = :SA_HORJORNADA2HASTA,'
      
        '         SA_IDPRESTADOR = DECODE(:SA_IDPRESTADOR, 0, NULL, :SA_I' +
        'DPRESTADOR),'
      '         SA_IDTAREAHABITUAL = :SA_IDTAREAHABITUAL,'
      '         SA_IDTAREAACCIDENTE = :SA_IDTAREAACCIDENTE,'
      '         SA_ANTIGUEDADPUESTO = :SA_ANTIGUEDADPUESTO,'
      '         SA_ANIOSPUESTO = :SA_ANIOSPUESTO,'
      '         SA_MESESPUESTO = :SA_MESESPUESTO,'
      '         SA_FECHARECEPCION = :SA_FECHARECEPCION,'
      '         SA_USUALTA = :SA_USUALTA,'
      '         SA_FECHAALTA = :SA_FECHAALTA,'
      '         SA_USUMODIF = :SA_USUMODIF,'
      '         SA_FECHAMODIF = SYSDATE,'
      '         SA_IDMOTIVONOCARGA = :SA_IDMOTIVONOCARGA,'
      '         SA_CIE10REVISADO = :SA_CIE10REVISADO,'
      '         SA_USUARIOREVISION = :SA_USUARIOREVISION,'
      '         SA_FECHAREVISION = :SA_FECHAREVISION,'
      '         SA_CPAPEL = :SA_CPAPEL,'
      '         SA_TIPO = :SA_TIPO,'
      '         SA_PRESTADOR_NOMBRE = :SA_PRESTADOR_NOMBRE,'
      '         SA_PRESTADOR_TELEFONOS = :SA_PRESTADOR_TELEFONOS,'
      '         SA_PRESTADOR_CALLE = :SA_PRESTADOR_CALLE,'
      '         SA_PRESTADOR_NUMERO = :SA_PRESTADOR_NUMERO,'
      '         SA_PRESTADOR_PISO = :SA_PRESTADOR_PISO,'
      '         SA_PRESTADOR_DEPARTAMENTO = :SA_PRESTADOR_DEPARTAMENTO,'
      '         SA_PRESTADOR_LOCALIDAD = :SA_PRESTADOR_LOCALIDAD,'
      '         SA_PRESTADOR_CPOSTAL = :SA_PRESTADOR_CPOSTAL,'
      '         SA_PRESTADOR_CPOSTALA = :SA_PRESTADOR_CPOSTALA,'
      '         SA_PRESTADOR_PROVINCIA = :SA_PRESTADOR_PROVINCIA,'
      '         SA_INTERNADO = :SA_INTERNADO,'
      '         SA_IDLESIONAGENTEMATERIAL = :SA_IDLESIONAGENTEMATERIAL,'
      '         SA_FECHABAJAMEDICA = :SA_FECHABAJAMEDICA,'
      '         SA_NROSINISUIZA = :SA_NROSINISUIZA,'
      '         SA_QUIENDENUNCIA = :SA_QUIENDENUNCIA,'
      '         SA_NRO_CECAP = :SA_NRO_CECAP'
      '   WHERE SA_ID = :OLD_SA_ID;'
      ''
      '  IF (:DA_OPCION <> '#39'S'#39') THEN'
      
        '    ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO (:SA_IDEXPEDIENTE, :DA_O' +
        'PCION, :DA_HOJAS, :SA_USUMODIF, '#39'OTR'#39', NULL);'
      '  END IF;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:SA_IDEXPEDIENTE, '#39'002'#39 +
        ', :SA_USUMODIF, :SA_FECHARECEPCION, NULL);'
      ''
      
        '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_DIAGNOSTICOOMS, ' +
        'EX_GRAVEDAD'
      '    INTO SINIESTRO, ORDEN, RECAIDA, DIAGNOSTICOOMS, GRAVEDAD'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :SA_IDEXPEDIENTE;'
      ''
      
        '  ART.SINIESTRO.DO_GENERAREVENTOMORTALES(TRUE, '#39'002'#39', :SA_IDEXPE' +
        'DIENTE, :SA_USUMODIF);'
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
      ''
      '  CUIT      CPR_PRESTADOR.CA_CLAVE%TYPE;'
      '  SECUENCIA CPR_PRESTADOR.CA_SECUENCIA%TYPE;'
      '  MUTUAL    CPR_PRESTADOR.CA_PRESTADORMUTUAL%TYPE;'
      ''
      '  DESTINATARIOS  ART.INTRAWEB.TCURSOR;'
      '  ID_TRANSACCION NUMBER;'
      '  SEGUIR         CHAR;'
      'BEGIN'
      '  /* INSERTA LA SOLICITUD DE ASISTENCIA */'
      ''
      '  INSERT INTO SIN.SSA_SOLICITUDASISTENCIA'
      
        '    (SA_ID, SA_IDEXPEDIENTE, SA_DESCRIPCION, SA_DIAGNOSTICO, SA_' +
        'IDDIAGNOSTICO,'
      
        '     SA_IDGRAVEDADCIE10, SA_IDGRAVEDAD, SA_OBSERVACIONES, SA_IDL' +
        'ESIONFORMA,'
      '     SA_IDLESIONAGENTE, SA_IDLESIONNATURALEZA, SA_IDLESIONZONA,'
      
        '     SA_HORJORNADA1DESDE, SA_HORJORNADA1HASTA, SA_HORJORNADA2DES' +
        'DE, SA_HORJORNADA2HASTA,'
      
        '     SA_IDPRESTADOR, SA_IDTAREAHABITUAL, SA_IDTAREAACCIDENTE, SA' +
        '_ANTIGUEDADPUESTO,'
      
        '     SA_ANIOSPUESTO, SA_MESESPUESTO, SA_FECHARECEPCION, SA_USUAL' +
        'TA,'
      
        '     SA_FECHAALTA, SA_USUMODIF, SA_FECHAMODIF, SA_IDMOTIVONOCARG' +
        'A, SA_FECHACARGA,'
      
        '     SA_CIE10REVISADO, SA_USUARIOREVISION, SA_FECHAREVISION, SA_' +
        'TIPO,'
      
        '     SA_PRESTADOR_NOMBRE, SA_PRESTADOR_TELEFONOS, SA_PRESTADOR_C' +
        'ALLE,'
      
        '     SA_PRESTADOR_NUMERO, SA_PRESTADOR_PISO, SA_PRESTADOR_DEPART' +
        'AMENTO,'
      
        '     SA_PRESTADOR_LOCALIDAD, SA_PRESTADOR_CPOSTAL, SA_PRESTADOR_' +
        'CPOSTALA,'
      
        '     SA_PRESTADOR_PROVINCIA, SA_INTERNADO, SA_IDLESIONAGENTEMATE' +
        'RIAL, SA_FECHABAJAMEDICA,'
      '     SA_NROSINISUIZA, SA_QUIENDENUNCIA, SA_NRO_CECAP)'
      '  VALUES'
      
        '    (:SA_ID, :SA_IDEXPEDIENTE, UPPER(:SA_DESCRIPCION), UPPER(:SA' +
        '_DIAGNOSTICO), :SA_IDDIAGNOSTICO,'
      
        '     :SA_IDGRAVEDADCIE10, :SA_IDGRAVEDAD, UPPER(:SA_OBSERVACIONE' +
        'S), :SA_IDLESIONFORMA,'
      
        '     :SA_IDLESIONAGENTE, :SA_IDLESIONNATURALEZA, :SA_IDLESIONZON' +
        'A,'
      
        '     :SA_HORJORNADA1DESDE, :SA_HORJORNADA1HASTA, :SA_HORJORNADA2' +
        'DESDE, :SA_HORJORNADA2HASTA,'
      
        '     DECODE(:SA_IDPRESTADOR, 0, NULL, :SA_IDPRESTADOR), :SA_IDTA' +
        'REAHABITUAL, :SA_IDTAREAACCIDENTE,'
      
        '     :SA_ANTIGUEDADPUESTO, :SA_ANIOSPUESTO, :SA_MESESPUESTO, :SA' +
        '_FECHARECEPCION,'
      
        '     :SA_USUALTA, ART.ACTUALDATE, :SA_USUMODIF, :SA_FECHAMODIF, ' +
        ':SA_IDMOTIVONOCARGA,'
      
        '     SYSDATE, :SA_CIE10REVISADO, :SA_USUARIOREVISION, :SA_FECHAR' +
        'EVISION, :SA_TIPO,'
      
        '     :SA_PRESTADOR_NOMBRE, :SA_PRESTADOR_TELEFONOS, :SA_PRESTADO' +
        'R_CALLE,'
      
        '     :SA_PRESTADOR_NUMERO, :SA_PRESTADOR_PISO, :SA_PRESTADOR_DEP' +
        'ARTAMENTO,'
      
        '     :SA_PRESTADOR_LOCALIDAD, :SA_PRESTADOR_CPOSTAL, :SA_PRESTAD' +
        'OR_CPOSTALA,'
      
        '     :SA_PRESTADOR_PROVINCIA, :SA_INTERNADO, :SA_IDLESIONAGENTEM' +
        'ATERIAL, :SA_FECHABAJAMEDICA,'
      
        '     :SA_NROSINISUIZA, :SA_QUIENDENUNCIA, :SA_NRO_CECAP);       ' +
        '        '
      ''
      '  IF (:DA_OPCION <> '#39'S'#39') THEN'
      
        '    ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO (:SA_IDEXPEDIENTE, :DA_O' +
        'PCION, :DA_HOJAS, :SA_USUALTA, '#39'OTR'#39', NULL);'
      '  END IF;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:SA_IDEXPEDIENTE, '#39'002'#39 +
        ', :SA_USUALTA, :SA_FECHARECEPCION, NULL);'
      ''
      
        '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_DIAGNOSTICOOMS, ' +
        'EX_GRAVEDAD, EX_BAJAMEDICA'
      
        '    INTO SINIESTRO, ORDEN, RECAIDA, DIAGNOSTICOOMS, GRAVEDAD, BA' +
        'JAMEDICA'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :SA_IDEXPEDIENTE;'
      ''
      
        '  ART.SINIESTRO.DO_ACTUALIZAR_DOCUMENTO (SINIESTRO, ORDEN, RECAI' +
        'DA, '#39'002'#39', :SA_FECHARECEPCION);'
      
        '  ART.SINIESTRO.DO_REGAUDITLOG_COMPLETO (:SA_IDEXPEDIENTE, '#39'SINI' +
        'ESTROS'#39','
      
        '                                         '#39'ADM. TABLAS DENUNCIAS ' +
        'VARIAS'#39','
      
        '                                         '#39'ALTA'#39', :SA_USUALTA, -1' +
        ','
      '                                          DIAGNOSTICOOMS,'
      
        '                                          GRAVEDAD, '#39#39', '#39#39', '#39#39', ' +
        #39#39', '#39#39');'
      ''
      
        '  ART.SINIESTRO.DO_GENERAREVENTOMORTALES(TRUE, '#39'002'#39', :SA_IDEXPE' +
        'DIENTE, :SA_USUALTA);'
      ''
      '  BEGIN'
      '    BEGIN'
      '      SELECT '#39'S'#39
      '        INTO SEGUIR'
      '        FROM DUAL'
      '       WHERE EXISTS(SELECT 1'
      '                      FROM ART.USE_USUARIOS'
      '                     WHERE SE_USUARIO = :SA_USUALTA'
      '                       AND SE_SECTOR = '#39'CEM'#39')'
      '         AND EXISTS(SELECT 1'
      '                      FROM CDG_DIAGNOSTICO'
      '                     WHERE DG_ID = :SA_IDDIAGNOSTICO'
      '                       AND DG_CODIGO = '#39'Z20.9'#39')'
      '         AND EXISTS(SELECT 1'
      '                      FROM ART.CPR_PRESTADOR'
      '                     WHERE CA_IDENTIFICADOR = :SA_IDPRESTADOR'
      '                       AND CA_DIRELECTRONICA IS NOT NULL)'
      '         AND :SA_IDPRESTADOR IS NOT NULL;'
      '    EXCEPTION'
      '      WHEN NO_DATA_FOUND THEN'
      '        NULL;'
      '    END;'
      ''
      '    IF (SEGUIR = '#39'S'#39') THEN'
      '      OPEN DESTINATARIOS FOR'
      '        SELECT CA_DIRELECTRONICA'
      '          FROM ART.CPR_PRESTADOR'
      '         WHERE CA_IDENTIFICADOR = :SA_IDPRESTADOR;'
      ''
      '      SELECT MAX(TW_ID) + 1'
      '        INTO ID_TRANSACCION'
      '        FROM WEB.WTW_TRANSACCIONWEB;'
      ''
      '      UPDATE SIN.SSA_SOLICITUDASISTENCIA'
      '         SET SA_IDTRANSACCIONWEB = ID_TRANSACCION'
      '       WHERE SA_ID = :SA_ID;'
      ''
      
        '      ART.INTRAWEB.TRANSACCION_WEB_GENERAR(SYSDATE, :SA_USUALTA,' +
        ' 9, ID_TRANSACCION, DESTINATARIOS, '#39'M'#39');'
      '    END IF;'
      '  EXCEPTION'
      '    WHEN OTHERS THEN'
      '      NULL;'
      '  END;'
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
      '   WHERE EX_ID = :SA_IDEXPEDIENTE;'
      ''
      '  DELETE FROM SIN.SSA_SOLICITUDASISTENCIA'
      '        WHERE SA_ID = :OLD_SA_ID;'
      ''
      '  DELETE FROM SDO_DOCUEXPESIN'
      '        WHERE DO_SINIESTRO = SINIESTRO'
      '          AND DO_ORDEN = ORDEN'
      '          AND DO_RECAIDA = RECAIDA'
      '          AND DO_CODIGO = '#39'002'#39';'
      ''
      
        '  ART.SINIESTRO.DO_GENERAREVOLUTIVO('#39'SA_VUELCO'#39', :SA_IDEXPEDIENT' +
        'E, :SA_IDPRESTADOR, :SA_DIAGNOSTICO, :SA_IDDIAGNOSTICO,'
      
        '                                    :SA_IDGRAVEDADCIE10, :SA_FEC' +
        'HABAJAMEDICA, :SA_FECHARECEPCION,'
      
        '                                    NULL /*INTERNACION*/, :SA_OB' +
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
      
        '  ART.SINIESTRO.DO_ACTUALIZAREXPEDIENTE (:SA_IDEXPEDIENTE, '#39'002'#39 +
        ', ART.GETOSUSER(), SYSDATE, NULL, '#39'N'#39');'
      'END;')
    Left = 136
    Top = 8
  end
  inherited XPMenu: TXPMenu
    Left = 80
    Top = 36
  end
  inherited Seguridad: TSeguridad
    Left = 108
    Top = 36
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbDatos1.Collapsed'
      'gbLaboral.Collapsed'
      'gbLesion.Collapsed'
      'gbPrestador.Collapsed'
      'gbArchivo.Collapsed'
      'gbDiagnostico.Collapsed')
    Left = 136
    Top = 36
  end
  inherited Acciones: TActionList
    Left = 80
    Top = 64
  end
end
