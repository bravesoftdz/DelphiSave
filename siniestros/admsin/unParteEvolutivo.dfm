inherited frmParteEvolutivo: TfrmParteEvolutivo
  Left = 48
  Top = 107
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  ClientHeight = 444
  ClientWidth = 688
  Constraints.MinWidth = 696
  DesignSize = (
    688
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel [0]
    Left = -1
    Top = 29
    Width = 663
    Height = 4
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  inherited gbNavegador: TJvgGroupBox
    Width = 688
    DesignSize = (
      688
      40)
    FullHeight = 81
    object Label3: TLabel [4]
      Left = 253
      Top = 21
      Width = 82
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Control'
    end
    object Label4: TLabel [5]
      Left = 437
      Top = 21
      Width = 125
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha del Pr'#243'ximo Control'
    end
    object Label7: TLabel [6]
      Left = 133
      Top = 21
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    inherited edNroOrden: TDBComboGrid
      KeyField = 'PV_NROPARTE'
      ListField = 'PV_NROPARTE'
      DropDownRows = 10
      Columns = <
        item
          Expanded = False
          FieldName = 'PV_NROPARTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Parte'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV_FECHACONTROL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Control'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV_DIAGNOSTICO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Diagn'#243'stico'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 360
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV_FECHABAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Anulado (Fecha de baja)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 64
          Visible = True
        end>
    end
    object edPV_FECHACONTROL: TDateComboBox
      Left = 341
      Top = 17
      Width = 88
      Height = 21
      MaxDateCombo = edPV_PROXIMOCONTROL
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object edPV_PROXIMOCONTROL: TDateComboBox
      Left = 570
      Top = 17
      Width = 88
      Height = 21
      MinDateCombo = edPV_FECHACONTROL
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object cmbPV_TIPOPARTE: TExComboBox
      Left = 157
      Top = 17
      Width = 85
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 3
      ItemIndex = -1
      Options = [coShowValues, coGridLines]
      ValueWidth = 12
    end
  end
  object gbPrestador: TJvgGroupBox [2]
    Left = 0
    Top = 40
    Width = 688
    Height = 16
    Align = alTop
    Caption = ' Datos del prestador '
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
      688
      16)
    FullHeight = 80
    inline fraPV_IDENTIFPRESTADOR: TfraCPR_PRESTADOR
      Left = 4
      Top = 22
      Width = 677
      Height = 53
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      DesignSize = (
        677
        53)
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 598
        Width = 21
      end
      inherited cmbCA_DESCRIPCION: TArtComboBox
        Width = 347
        DataSource = nil
      end
      inherited edCA_LOCALIDAD: TEdit
        Width = 223
      end
      inherited edCA_CODPOSTAL: TEdit
        Left = 622
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
  object gbDatosMedicos: TJvgGroupBox [3]
    Left = 0
    Top = 56
    Width = 688
    Height = 16
    Align = alTop
    Caption = ' Datos m'#233'dicos '
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
      688
      16)
    FullHeight = 265
    object Label1: TLabel
      Left = 4
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Diagn'#243'stico'
      Visible = False
    end
    object Label2: TLabel
      Left = 4
      Top = 54
      Width = 33
      Height = 13
      Caption = 'CIE-10'
      Visible = False
    end
    object Label5: TLabel
      Left = 389
      Top = 55
      Width = 81
      Height = 13
      Caption = 'Tipo Tratamiento'
      Visible = False
    end
    object Label6: TLabel
      Left = 4
      Top = 83
      Width = 35
      Height = 13
      Caption = 'Auditor'
      Visible = False
    end
    object Label8: TLabel
      Left = 4
      Top = 108
      Width = 28
      Height = 13
      Caption = 'Turno'
      Visible = False
    end
    object Label9: TLabel
      Left = 456
      Top = 81
      Width = 45
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Den. SRT'
      Visible = False
    end
    object Label10: TLabel
      Left = 208
      Top = 108
      Width = 59
      Height = 13
      Caption = 'Autorizaci'#243'n'
      Visible = False
    end
    object btnBusqueda: TSpeedButton
      Left = 315
      Top = 104
      Width = 20
      Height = 21
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FAFAFAFAFAFA
        FAFAFAFAFAFAFA0A0A0AFAFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8FAFAFAFAFAFA
        FAFAFAFAFAFA0A4A740AFAFAFAFAFAFAFAFAFAFAFAFAF81C99F8FAFAFAFAFAFA
        FAFAFAFAFA0A4A991A0AFAFAFAFAFAFAFAFAFAFAFAF81C1A1BF8FAFAFAFAFAFA
        FAFAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFA
        FAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFAFA
        FAFA0A4A74990AFAFAFAFAFAFAFAFAFAFAFAF81C991AF8FAFAFAFAFAFA0A0A0A
        0A0A74521A0AFAFAFAFAFAFAFAF8F8F8F8F899991BF8FAFAFAFAFAFA0AB9E1B9
        B90A0A520AFAFAFAFAFAFAFAF8BB19BBBBF8F899F8FAFAFAFAFAFA0AB9E1E1B9
        B9B90A0AFAFAFAFAFAFAFAF8BB1919BBBBBBF8F8FAFAFAFAFAFA0AE2FF19E1BA
        B9B9B90AFAFAFAFAFAFAF8F3F4F31909BBBBBBF8FAFAFAFAFAFA0AE11919E1BA
        B9B9B90AFAFAFAFAFAFAF819F3F31909BBBBBBF8FAFAFAFAFAFA0AE1E1E1DBB9
        B9B3B30AFAFAFAFAFAFAF819191909BBBBBBBBF8FAFAFAFAFAFA0ADFDCDCDBB9
        B990B30AFAFAFAFAFAFAF8E1191909BBBBBBBBF8FAFAFAFAFAFAFA0ABABAB9B9
        B9900AFAFAFAFAFAFAFAFAF80909BBBBBBBBF8FAFAFAFAFAFAFAFAFA0AB9B9B3
        B30AFAFAFAFAFAFAFAFAFAFAF8BBBBBBBBF8FAFAFAFAFAFAFAFAFAFAFA0A0A0A
        0AFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8F8FAFAFAFAFAFAFAFAFA}
      NumGlyphs = 2
      Visible = False
    end
    object Label13: TLabel
      Left = 344
      Top = 108
      Width = 36
      Height = 13
      Caption = 'M'#233'dico '
      Visible = False
    end
    object Label19: TLabel
      Left = 4
      Top = 136
      Width = 49
      Height = 13
      Caption = 'Recepci'#243'n'
      Visible = False
    end
    object Label22: TLabel
      Left = 4
      Top = 160
      Width = 66
      Height = 13
      Caption = 'Internaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label23: TLabel
      Left = 4
      Top = 184
      Width = 62
      Height = 13
      Caption = 'Fecha Desde'
      Visible = False
    end
    object Label11: TLabel
      Left = 172
      Top = 184
      Width = 28
      Height = 13
      Caption = 'Hasta'
      Visible = False
    end
    object Label12: TLabel
      Left = 304
      Top = 184
      Width = 20
      Height = 13
      Caption = 'Sitio'
      Visible = False
    end
    object Bevel5: TBevel
      Left = -3
      Top = 207
      Width = 663
      Height = 4
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
      Visible = False
    end
    object Label15: TLabel
      Left = 4
      Top = 216
      Width = 80
      Height = 13
      Caption = 'Rehabilitaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label16: TLabel
      Left = 4
      Top = 240
      Width = 62
      Height = 13
      Caption = 'Fecha Desde'
      Visible = False
    end
    object Label17: TLabel
      Left = 172
      Top = 240
      Width = 28
      Height = 13
      Caption = 'Hasta'
      Visible = False
    end
    inline fraPV_IDDIAGNOSTICO: TfraStaticCodigoDescripcion
      Left = 75
      Top = 49
      Width = 308
      Height = 23
      TabOrder = 0
      Visible = False
      DesignSize = (
        308
        23)
      inherited edCodigo: TPatternEdit
        Width = 40
      end
      inherited cmbDescripcion: TComboGrid
        Left = 44
        Width = 245
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
    object edDG_DIAGNOSTICO: TDBEdit
      Left = 76
      Top = 23
      Width = 581
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PV_DIAGNOSTICO'
      DataSource = dsDatos
      TabOrder = 1
      Visible = False
    end
    inline fraPV_TIPOTRATAMIENTO: TfraStaticCTB_TABLAS
      Left = 476
      Top = 48
      Width = 182
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Visible = False
      DesignSize = (
        182
        23)
      inherited edCodigo: TPatternEdit
        Width = 40
      end
      inherited cmbDescripcion: TComboGrid
        Left = 44
        Width = 118
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
    inline fraPV_AUDITOR: TfraStaticCodigoDescripcion
      Left = 75
      Top = 76
      Width = 261
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Visible = False
      DesignSize = (
        261
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 198
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
    object chkPV_OPERPROG: TDBCheckBox
      Left = 344
      Top = 80
      Width = 102
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Op.Programadas'
      DataField = 'PV_OPERPROG'
      DataSource = dsDatos
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
    end
    object edPV_TURNO: TDateComboBox
      Left = 112
      Top = 104
      Width = 88
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object edPV_TURNOHORA: TTimeEditor
      Left = 76
      Top = 104
      Width = 34
      Height = 21
      TabOrder = 6
      Visible = False
      CustomFormat = 'HH:mm'
    end
    object edPV_NRODENUNCIASRT: TDBEdit
      Left = 512
      Top = 76
      Width = 144
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'PV_NRODENUNCIASRT'
      DataSource = dsDatos
      TabOrder = 7
      Visible = False
    end
    object edPV_FECHARECEPCION: TDateComboBox
      Left = 76
      Top = 132
      Width = 88
      Height = 21
      MinDate = 35272.000000000000000000
      TabOrder = 9
      Visible = False
    end
    object edPV_MEDICO: TDBEdit
      Left = 380
      Top = 104
      Width = 276
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'PV_MEDICO'
      DataSource = dsDatos
      TabOrder = 10
      Visible = False
    end
    object edPV_INTERNADODESDE: TDateComboBox
      Left = 76
      Top = 180
      Width = 88
      Height = 21
      MaxDateCombo = edPV_INTERNADOHASTA
      TabOrder = 11
      Visible = False
    end
    object edPV_INTERNADOHASTA: TDateComboBox
      Left = 208
      Top = 180
      Width = 88
      Height = 21
      MinDateCombo = edPV_INTERNADODESDE
      TabOrder = 12
      Visible = False
    end
    object edPV_SITIOINTERNACION: TDBEdit
      Left = 331
      Top = 180
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'PV_SITIOINTERNACION'
      DataSource = dsDatos
      TabOrder = 13
      Visible = False
    end
    object edPV_DESDE: TDateComboBox
      Left = 76
      Top = 236
      Width = 88
      Height = 21
      MaxDateCombo = edPV_HASTA
      TabOrder = 14
      Visible = False
    end
    object edPV_HASTA: TDateComboBox
      Left = 208
      Top = 236
      Width = 88
      Height = 21
      MinDateCombo = edPV_DESDE
      TabOrder = 15
      Visible = False
    end
    object cmbAU_NUMAUTO: TDBEdit
      Left = 272
      Top = 104
      Width = 41
      Height = 21
      DataField = 'PV_AUTORIZACION'
      DataSource = dsDatos
      TabOrder = 8
      Visible = False
    end
  end
  object gbOtros: TJvgGroupBox [4]
    Left = 0
    Top = 72
    Width = 688
    Height = 16
    Align = alTop
    Caption = ' Otros '
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
      688
      16)
    FullHeight = 116
    object Label14: TLabel
      Left = 8
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edPV_OBSERVACIONES: TDBMemo
      Left = 8
      Top = 44
      Width = 652
      Height = 65
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PV_OBSERVACIONES'
      DataSource = dsDatos
      TabOrder = 0
      Visible = False
    end
    object btnInfoAdicional: TJvXPButton
      Left = 484
      Top = 24
      Width = 175
      Height = 17
      Caption = 'Observaciones del M'#233'dico auditor'
      TabOrder = 1
      WordWrap = False
      Anchors = [akTop, akRight]
      Visible = False
      OnClick = btnInfoAdicionalClick
    end
  end
  inherited dsDatos: TDataSource [5]
    OnUpdateData = dsDatosUpdateData
    Left = 604
    Top = 333
  end
  inherited sdqDatos: TSDQuery [6]
    AutoCalcFields = False
    BeforePost = sdqDatosBeforePost
    OnNewRecord = sdqDatosNewRecord
    SQL.Strings = (
      
        'SELECT EX_ID, PV_NROPARTE, PV_DIAGNOSTICO, PV_OBSERVACIONES, PV_' +
        'TIPOTRATAMIENTO,'
      
        '       PV_PLANREHABILITACION, PV_DESDE, PV_HASTA, PV_FECHACONTRO' +
        'L, PV_PROXIMOCONTROL, PV_PROBABLEALTA, PV_MEDICO,'
      
        '       PV_FECHARECEPCION, PV_AUDITOR, PV_PRESUPINCAPACIDAD, PV_A' +
        'UTORIZACION as AU_NUMAUTO, '
      
        '       PV_IDENTIFPRESTADOR, PV_DIAGNOSTICOOMS, PV_INTERNADODESDE' +
        ', PV_INTERNADOHASTA, PV_SITIOINTERNACION,'
      
        '       PV_TIPOPARTE, PV_AUTORIZACION, PV_NRODENUNCIASRT, PV_OPER' +
        'PROG, PV_TURNO, PV_TURNOHORA, PV_EVIP,'
      
        '       PV_IDDIAGNOSTICO, PV_USUALTA USUARIO, CAST(NULL AS VARCHA' +
        'R2(1)) DA_OPCION, TO_NUMBER(NULL) as DA_HOJAS, PV_FECHABAJA'
      '  FROM SEX_EXPEDIENTES, SPV_PARTEEVOLUTIVO'
      ' WHERE PV_SINIESTRO = EX_SINIESTRO'
      '   AND PV_ORDEN = EX_ORDEN'
      '   AND PV_RECAIDA = EX_RECAIDA'
      '   AND EX_ID = :EX_ID'
      ' ORDER BY PV_NROPARTE')
    Left = 576
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EX_ID'
        ParamType = ptInput
      end>
    object sdqDatosEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqDatosPV_NROPARTE: TFloatField
      FieldName = 'PV_NROPARTE'
      Required = True
    end
    object sdqDatosPV_DIAGNOSTICO: TStringField
      FieldName = 'PV_DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosPV_OBSERVACIONES: TStringField
      FieldName = 'PV_OBSERVACIONES'
      Size = 2000
    end
    object sdqDatosPV_TIPOTRATAMIENTO: TStringField
      FieldName = 'PV_TIPOTRATAMIENTO'
      Size = 10
    end
    object sdqDatosPV_PLANREHABILITACION: TStringField
      FieldName = 'PV_PLANREHABILITACION'
      Size = 1
    end
    object sdqDatosPV_DESDE: TDateTimeField
      FieldName = 'PV_DESDE'
    end
    object sdqDatosPV_HASTA: TDateTimeField
      FieldName = 'PV_HASTA'
    end
    object sdqDatosPV_FECHACONTROL: TDateTimeField
      FieldName = 'PV_FECHACONTROL'
    end
    object sdqDatosPV_PROXIMOCONTROL: TDateTimeField
      FieldName = 'PV_PROXIMOCONTROL'
    end
    object sdqDatosPV_PROBABLEALTA: TDateTimeField
      FieldName = 'PV_PROBABLEALTA'
    end
    object sdqDatosPV_MEDICO: TStringField
      FieldName = 'PV_MEDICO'
      Size = 50
    end
    object sdqDatosPV_FECHARECEPCION: TDateTimeField
      FieldName = 'PV_FECHARECEPCION'
    end
    object sdqDatosPV_AUDITOR: TFloatField
      FieldName = 'PV_AUDITOR'
    end
    object sdqDatosPV_PRESUPINCAPACIDAD: TStringField
      FieldName = 'PV_PRESUPINCAPACIDAD'
      Size = 1
    end
    object sdqDatosPV_IDENTIFPRESTADOR: TFloatField
      FieldName = 'PV_IDENTIFPRESTADOR'
    end
    object sdqDatosPV_DIAGNOSTICOOMS: TStringField
      FieldName = 'PV_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqDatosPV_INTERNADODESDE: TDateTimeField
      FieldName = 'PV_INTERNADODESDE'
    end
    object sdqDatosPV_INTERNADOHASTA: TDateTimeField
      FieldName = 'PV_INTERNADOHASTA'
    end
    object sdqDatosPV_SITIOINTERNACION: TStringField
      FieldName = 'PV_SITIOINTERNACION'
      Size = 100
    end
    object sdqDatosPV_TIPOPARTE: TStringField
      FieldName = 'PV_TIPOPARTE'
      Size = 10
    end
    object sdqDatosPV_AUTORIZACION: TFloatField
      FieldName = 'PV_AUTORIZACION'
    end
    object sdqDatosPV_NRODENUNCIASRT: TStringField
      FieldName = 'PV_NRODENUNCIASRT'
      Size = 13
    end
    object sdqDatosPV_OPERPROG: TStringField
      FieldName = 'PV_OPERPROG'
      Size = 1
    end
    object sdqDatosPV_TURNO: TDateTimeField
      FieldName = 'PV_TURNO'
    end
    object sdqDatosPV_TURNOHORA: TStringField
      FieldName = 'PV_TURNOHORA'
      Size = 5
    end
    object sdqDatosPV_EVIP: TStringField
      FieldName = 'PV_EVIP'
      Size = 1
    end
    object sdqDatosPV_IDDIAGNOSTICO: TFloatField
      FieldName = 'PV_IDDIAGNOSTICO'
    end
    object sdqDatosUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object sdqDatosDA_OPCION: TStringField
      FieldName = 'DA_OPCION'
      Size = 0
    end
    object sdqDatosDA_HOJAS: TFloatField
      FieldName = 'DA_HOJAS'
    end
    object sdqDatosPV_FECHABAJA: TDateTimeField
      FieldName = 'PV_FECHABAJA'
    end
    object sdqDatosAU_NUMAUTO: TFloatField
      FieldName = 'AU_NUMAUTO'
    end
  end
  inherited sduDatos: TSDUpdateSQL
    ModifySQL.Strings = (
      'DECLARE'
      '  nSiniestro  SEX_EXPEDIENTES.EX_SINIESTRO%TYPE;'
      '  nOrden      SEX_EXPEDIENTES.EX_ORDEN%TYPE;'
      '  nRecaida    SEX_EXPEDIENTES.EX_RECAIDA%TYPE;'
      '  DiagOMS     SEX_EXPEDIENTES.EX_DIAGNOSTICOOMS%TYPE;'
      '  idPrestador SEX_EXPEDIENTES.EX_PRESTADOR%TYPE;'
      'BEGIN'
      '  SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA,'
      
        '         ART.AMEBPBA.GET_GTRABAJO(EX_SINIESTRO, EX_ORDEN, EX_REC' +
        'AIDA),'
      
        '         ART.SIN.GET_DIAGNOSTICOOMS(EX_SINIESTRO, EX_ORDEN, EX_R' +
        'ECAIDA),'
      
        '         ART.AMEBPBA.GET_PRESCABECERA(EX_SINIESTRO, EX_ORDEN, EX' +
        '_RECAIDA)'
      
        '    INTO nSiniestro, nOrden, nRecaida, sGTrabajo, DiagOMS, idPre' +
        'stador'
      '    FROM SEX_EXPEDIENTES'
      '   WHERE EX_ID = :EX_ID;'
      ''
      '  /* ACTUALIZA LA TABLA DE EXPEDIENTES */'
      '  UPDATE SEX_EXPEDIENTES'
      '     SET EX_DIAGNOSTICOOMS = DiagOMS,'
      '         EX_PRESTADOR = idPrestador'
      '   WHERE EX_ID = :EX_ID;'
      ''
      '  UPDATE SPV_PARTEEVOLUTIVO'
      '     SET PV_DIAGNOSTICO = :PV_DIAGNOSTICO,'
      '         PV_OBSERVACIONES = :PV_OBSERVACIONES,'
      '         PV_TIPOTRATAMIENTO = :PV_TIPOTRATAMIENTO,'
      '         PV_PLANREHABILITACION = :PV_PLANREHABILITACION,'
      '         PV_DESDE = :PV_DESDE,'
      '         PV_HASTA = :PV_HASTA,'
      '         PV_FECHACONTROL = :PV_FECHACONTROL,'
      '         PV_PROXIMOCONTROL = :PV_PROXIMOCONTROL,'
      '         PV_PROBABLEALTA = :PV_PROBABLEALTA,'
      '         PV_MEDICO = :PV_MEDICO,'
      '         PV_FECHARECEPCION = :PV_FECHARECEPCION,'
      '         PV_AUDITOR = :PV_AUDITOR,'
      '         PV_PRESUPINCAPACIDAD = :PV_PRESUPINCAPACIDAD,'
      '         PV_IDENTIFPRESTADOR = :PV_IDENTIFPRESTADOR,'
      '         PV_DIAGNOSTICOOMS = :PV_DIAGNOSTICOOMS,'
      '         PV_INTERNADODESDE = :PV_INTERNADODESDE,'
      '         PV_INTERNADOHASTA = :PV_INTERNADOHASTA,'
      '         PV_SITIOINTERNACION = :PV_SITIOINTERNACION,'
      '         PV_TIPOPARTE = :PV_TIPOPARTE,'
      '         PV_AUTORIZACION = :PV_AUTORIZACION,'
      '         PV_NRODENUNCIASRT = :PV_NRODENUNCIASRT,'
      '         PV_OPERPROG = :PV_OPERPROG,'
      '         PV_TURNO = :PV_TURNO,'
      '         PV_TURNOHORA = :PV_TURNOHORA,'
      '         PV_EVIP = :PV_EVIP,'
      '         PV_IDDIAGNOSTICO = :PV_IDDIAGNOSTICO,'
      '         PV_USUMODIF = :USUARIO,'
      '         PV_FECHAMODIF = SYSDATE'
      '   WHERE PV_SINIESTRO = nSiniestro'
      '     AND PV_ORDEN = nOrden'
      '     AND PV_RECAIDA = nRecaida'
      '     AND PV_NROPARTE = :PV_NROPARTE;'
      'END;'
      '')
    InsertSQL.Strings = (
      ' ')
    Left = 632
    Top = 333
  end
  inherited XPMenu: TXPMenu
    Left = 576
    Top = 304
  end
  inherited Seguridad: TSeguridad
    Left = 604
    Top = 304
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbDatosMedicos.Collapsed'
      'gbNavegador.Collapsed'
      'gbOtros.Collapsed'
      'gbPrestador.Collapsed')
    Left = 632
    Top = 304
  end
  inherited Acciones: TActionList
    Left = 548
    Top = 332
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16418
        LinkControl = btnNavUltimo
      end
      item
        Key = 16417
        LinkControl = btnNavPrimero
      end
      item
        Key = 16493
        LinkControl = btnNavAnterior
      end
      item
        Key = 16491
        LinkControl = btnNavSiguiente
      end>
    Enabled = False
    Left = 548
    Top = 304
  end
end
