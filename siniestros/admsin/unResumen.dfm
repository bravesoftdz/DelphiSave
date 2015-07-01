inherited frmResumen: TfrmResumen
  Left = 201
  Top = 151
  BorderStyle = bsNone
  Caption = 'Resumen'
  ClientHeight = 213
  ClientWidth = 632
  Constraints.MinHeight = 240
  Constraints.MinWidth = 640
  OldCreateOrder = True
  OnCreate = FSFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatosEmpresa: TJvgGroupBox [0]
    Left = 0
    Top = 0
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Datos de la Empresa (Domicilio Postal) '
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
    FullHeight = 100
    inline fraDomicilioEmpresa: TfraDomicilioEmpresa
      Left = 8
      Top = 24
      Width = 617
      Height = 69
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      inherited lbNro: TLabel
        Left = 404
      end
      inherited lbPiso: TLabel
        Left = 476
        Width = 19
      end
      inherited lbDto: TLabel
        Left = 552
        Width = 21
      end
      inherited lbCPostal: TLabel
        Width = 40
      end
      inherited lbCPA: TLabel
        Left = 110
        Width = 20
      end
      inherited lbLocalidad: TLabel
        Left = 218
        Width = 44
      end
      inherited lbProvincia: TLabel
        Left = 455
        Width = 43
      end
      inherited cmbCalle: TArtComboBox
        Left = 50
        Width = 327
      end
      inherited edNumero: TEdit
        Left = 426
      end
      inherited edPiso: TEdit
        Left = 502
      end
      inherited edDto: TEdit
        Left = 573
      end
      inherited edCPostal: TIntEdit
        Left = 50
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 270
        Width = 180
      end
      inherited edProvincia: TEdit
        Left = 502
        Width = 115
      end
      inherited edCPA: TPatternEdit
        Left = 136
      end
      inherited edTelefonos: TEdit
        Left = 50
        Width = 567
      end
      inherited btnBuscar: TButton
        Left = 379
      end
    end
  end
  object gbEstadoCobranza: TJvgGroupBox [1]
    Left = 0
    Top = 128
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Estado de Cobranza '
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
    FullHeight = 52
    object Label24: TLabel
      Left = 8
      Top = 28
      Width = 76
      Height = 13
      Caption = 'Cuota Promedio'
      Visible = False
    end
    object Label25: TLabel
      Left = 204
      Top = 28
      Width = 75
      Height = 13
      Caption = 'Deuda Admitida'
      Visible = False
    end
    object Label26: TLabel
      Left = 400
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Deuda'
      Visible = False
    end
    object CurrencyEdit3: TDBEdit
      Left = 88
      Top = 24
      Width = 104
      Height = 21
      AutoSize = False
      DataField = 'CUOTAPROMEDIO'
      DataSource = dsDatos
      TabOrder = 0
      Visible = False
    end
    object CurrencyEdit4: TDBEdit
      Left = 436
      Top = 24
      Width = 104
      Height = 21
      AutoSize = False
      DataField = 'DEUDA'
      DataSource = dsDatos
      TabOrder = 2
      Visible = False
    end
    object CurrencyEdit5: TDBEdit
      Left = 284
      Top = 24
      Width = 104
      Height = 21
      AutoSize = False
      DataField = 'DEUDAADMITIDA'
      DataSource = dsDatos
      TabOrder = 1
      Visible = False
    end
  end
  object gbDocumentacion: TJvgGroupBox [2]
    Left = 0
    Top = 112
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Documentaci'#243'n '
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
    FullHeight = 128
    object CheckBox6: TDBCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Expediente'
      DataField = 'EX_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox7: TDBCheckBox
      Left = 144
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Denuncia'
      DataField = 'DE_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox8: TDBCheckBox
      Left = 8
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Otros'
      DataField = 'SA_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox9: TDBCheckBox
      Left = 144
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Denuncia Grave'
      DataField = 'DG_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox10: TDBCheckBox
      Left = 416
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Parte Egreso'
      DataField = 'PE_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox11: TDBCheckBox
      Left = 416
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Parte Auditoria'
      DataField = 'PA_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 14
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox12: TDBCheckBox
      Left = 280
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Parte Evolutivo'
      DataField = 'PV_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 12
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox13: TDBCheckBox
      Left = 280
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Parte Ingreso'
      DataField = 'PI_FECHARECEPCIONTILDE'
      DataSource = dsDatos
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object DateEdit4: TDBDateEdit
      Left = 280
      Top = 100
      Width = 96
      Height = 21
      DataField = 'PV_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 13
      Visible = False
    end
    object DateEdit5: TDBDateEdit
      Left = 416
      Top = 100
      Width = 96
      Height = 21
      DataField = 'PA_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 15
      Visible = False
    end
    object DateEdit6: TDBDateEdit
      Left = 416
      Top = 44
      Width = 96
      Height = 21
      DataField = 'PE_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 7
      Visible = False
    end
    object DateEdit7: TDBDateEdit
      Left = 280
      Top = 44
      Width = 96
      Height = 21
      DataField = 'PI_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 5
      Visible = False
    end
    object DateEdit8: TDBDateEdit
      Left = 144
      Top = 100
      Width = 96
      Height = 21
      DataField = 'DG_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 11
      Visible = False
    end
    object DateEdit9: TDBDateEdit
      Left = 144
      Top = 44
      Width = 96
      Height = 21
      DataField = 'DE_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 3
      Visible = False
    end
    object DateEdit10: TDBDateEdit
      Left = 8
      Top = 100
      Width = 96
      Height = 21
      DataField = 'SA_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 9
      Visible = False
    end
    object DateEdit11: TDBDateEdit
      Left = 8
      Top = 44
      Width = 96
      Height = 21
      DataField = 'EX_FECHARECEPCION'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 1
      Visible = False
    end
  end
  object gbIncapacidad: TJvgGroupBox [3]
    Left = 0
    Top = 96
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Incapacidad '
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
    FullHeight = 156
    object Label20: TLabel
      Left = 8
      Top = 132
      Width = 61
      Height = 13
      Caption = '% Provisorio'
      Visible = False
    end
    object Label21: TLabel
      Left = 164
      Top = 132
      Width = 59
      Height = 13
      Caption = '% Definitivo'
      Visible = False
    end
    object Label22: TLabel
      Left = 312
      Top = 132
      Width = 29
      Height = 13
      Caption = 'Fecha'
      Visible = False
    end
    object Label23: TLabel
      Left = 452
      Top = 132
      Width = 112
      Height = 13
      Caption = 'Presupone Incapacidad'
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 24
      Width = 368
      Height = 96
      Caption = ' Incapacidad '
      TabOrder = 0
      Visible = False
      object CheckBox1: TDBCheckBox
        Left = 16
        Top = 24
        Width = 176
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Existe Incapacidad Permanente'
        DataField = 'EXISTEINCAPACIDAD'
        DataSource = dsDatos
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object RadioGroup2: TDBRadioGroup
        Left = 16
        Top = 48
        Width = 160
        Height = 40
        Caption = ' Grado '
        Columns = 2
        DataField = 'GRADO'
        DataSource = dsDatos
        Items.Strings = (
          'Parcial'
          'Total')
        TabOrder = 1
      end
      object RadioGroup3: TDBRadioGroup
        Left = 192
        Top = 48
        Width = 160
        Height = 40
        Caption = ' Car'#225'cter '
        Columns = 2
        DataField = 'CARACTER'
        DataSource = dsDatos
        Items.Strings = (
          'Provisorio'
          'Definitivo')
        TabOrder = 2
      end
    end
    object CheckBox2: TDBCheckBox
      Left = 392
      Top = 32
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Gran Invalidez'
      DataField = 'GRANINVALIDEZ'
      DataSource = dsDatos
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox3: TDBCheckBox
      Left = 392
      Top = 56
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Rech. Patolog'#237'a Base'
      DataField = 'RECHAZOPATOLOGIABASE'
      DataSource = dsDatos
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object CheckBox4: TDBCheckBox
      Left = 392
      Top = 80
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Fallecimiento'
      DataField = 'FALLECIMIENTO'
      DataSource = dsDatos
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object checkHomologado: TDBCheckBox
      Left = 392
      Top = 104
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Homologado'
      DataField = 'HOMOLOGADO'
      DataSource = dsDatos
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
    end
    object DateEdit3: TDBDateEdit
      Left = 348
      Top = 128
      Width = 96
      Height = 21
      DataField = 'FECHAHOMOLOGADO'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 7
      Visible = False
    end
    object CurrencyEdit1: TDBEdit
      Left = 80
      Top = 128
      Width = 77
      Height = 21
      AutoSize = False
      DataField = 'SI_PORCPROVI'
      DataSource = dsDatos
      TabOrder = 5
      Visible = False
    end
    object CurrencyEdit2: TDBEdit
      Left = 228
      Top = 128
      Width = 77
      Height = 21
      AutoSize = False
      DataField = 'SI_PORCDEF'
      DataSource = dsDatos
      TabOrder = 6
      Visible = False
    end
    object Edit8: TDBEdit
      Left = 572
      Top = 128
      Width = 48
      Height = 21
      DataField = 'PRESUPINCAP'
      DataSource = dsDatos
      TabOrder = 8
      Visible = False
    end
  end
  object gbParteAuditoria: TJvgGroupBox [4]
    Left = 0
    Top = 80
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Parte de Auditor'#237'a '
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
    FullHeight = 96
    object Label18: TLabel
      Left = 8
      Top = 28
      Width = 82
      Height = 13
      Caption = 'Fecha de Control'
      Visible = False
    end
    object Label19: TLabel
      Left = 8
      Top = 72
      Width = 33
      Height = 13
      Caption = 'M'#233'dico'
      Visible = False
    end
    object DateEdit2: TDBDateEdit
      Left = 96
      Top = 24
      Width = 96
      Height = 21
      DataField = 'PA_FECHACONTROL'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 0
      Visible = False
    end
    object Edit7: TDBEdit
      Left = 96
      Top = 68
      Width = 528
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PA_MEDICO'
      DataSource = dsDatos
      TabOrder = 2
      Visible = False
    end
    object RadioGroup1: TDBRadioGroup
      Left = 201
      Top = 20
      Width = 424
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Calidad Estimada de las Prestaciones '
      Columns = 5
      DataField = 'CALIDADAUDITORIA'
      DataSource = dsDatos
      Items.Strings = (
        'Muy Buena'
        'Buena'
        'Regular'
        'Mala'
        'No informada')
      TabOrder = 1
      Values.Strings = (
        'M'
        'R'
        'B'
        'U'
        '?')
      Visible = False
    end
  end
  object gbDatosPrestador: TJvgGroupBox [5]
    Left = 0
    Top = 64
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Datos del Prestador '
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
    inline fraPrestador: TfraCPR_PRESTADOR
      Left = 4
      Top = 24
      Width = 621
      Height = 51
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 0
      Visible = False
      DesignSize = (
        621
        51)
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
        Left = 542
        Width = 21
      end
      inherited cmbCA_DESCRIPCION: TArtComboBox
        Width = 291
      end
      inherited edCA_LOCALIDAD: TEdit
        Width = 167
      end
      inherited edCA_CODPOSTAL: TEdit
        Left = 566
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
  object gbDatosSiniestro: TJvgGroupBox [6]
    Left = 0
    Top = 48
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Datos del Siniestro '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    FullHeight = 292
    object Label5: TLabel
      Left = 8
      Top = 28
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
      Visible = False
    end
    object Label6: TLabel
      Left = 8
      Top = 52
      Width = 71
      Height = 13
      Caption = 'Observaciones'
      Visible = False
    end
    object Label7: TLabel
      Left = 8
      Top = 76
      Width = 62
      Height = 13
      Caption = 'Causa Cierre'
      Visible = False
    end
    object Label8: TLabel
      Left = 8
      Top = 100
      Width = 30
      Height = 13
      Caption = 'Forma'
      Visible = False
    end
    object Label9: TLabel
      Left = 8
      Top = 124
      Width = 35
      Height = 13
      Caption = 'Agente'
      Visible = False
    end
    object Label10: TLabel
      Left = 8
      Top = 148
      Width = 52
      Height = 13
      Caption = 'Naturaleza'
      Visible = False
    end
    object Label11: TLabel
      Left = 8
      Top = 172
      Width = 24
      Height = 13
      Caption = 'Zona'
      Visible = False
    end
    object Label12: TLabel
      Left = 8
      Top = 196
      Width = 67
      Height = 13
      Caption = 'D'#237'as Previstos'
      Visible = False
    end
    object Label13: TLabel
      Left = 200
      Top = 196
      Width = 59
      Height = 13
      Caption = 'D'#237'as de Baja'
      Visible = False
    end
    object Label14: TLabel
      Left = 384
      Top = 196
      Width = 80
      Height = 13
      Caption = 'Fecha de Egreso'
      Visible = False
    end
    object Label15: TLabel
      Left = 8
      Top = 220
      Width = 71
      Height = 13
      Caption = 'Diagn. Ingreso'
      Visible = False
    end
    object Label16: TLabel
      Left = 8
      Top = 244
      Width = 67
      Height = 13
      Caption = 'Diagn. Egreso'
      Visible = False
    end
    object Label17: TLabel
      Left = 8
      Top = 268
      Width = 55
      Height = 13
      Caption = 'OMS-CIE10'
      Visible = False
    end
    inline fraPI_IDLESIONFORMA: TfraSLF_LESIONFORMA
      Left = 88
      Top = 96
      Width = 536
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Visible = False
      DesignSize = (
        536
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 473
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
        DataSource = dsDatos
        DataField = sdqDatosFORMA
      end
    end
    inline fraPI_IDLESIONAGENTE: TfraSLA_LESIONAGENTE
      Left = 88
      Top = 120
      Width = 536
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Visible = False
      DesignSize = (
        536
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 473
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
        DataSource = dsDatos
        DataField = sdqDatosAGENTE
      end
    end
    inline fraPI_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA
      Left = 88
      Top = 144
      Width = 536
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      Visible = False
      DesignSize = (
        536
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 473
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
        DataSource = dsDatos
        DataField = sdqDatosNATURALEZA
      end
    end
    inline fraPI_IDLESIONZONA: TfraSLZ_LESIONZONA
      Left = 88
      Top = 168
      Width = 536
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      Visible = False
      DesignSize = (
        536
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 473
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
        DataSource = dsDatos
        DataField = sdqDatosZONA
      end
    end
    inline fraPI_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO
      Left = 88
      Top = 264
      Width = 536
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      Visible = False
      DesignSize = (
        536
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 473
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
        DataSource = dsDatos
        DataField = sdqDatosEX_IDDIAGNOSTICO
      end
    end
    object IntEdit1: TDBEdit
      Left = 88
      Top = 192
      Width = 80
      Height = 21
      DataField = 'PI_DIASBAJAPREVISTOS'
      DataSource = dsDatos
      MaxLength = 11
      TabOrder = 7
      Visible = False
    end
    object IntEdit2: TDBEdit
      Left = 272
      Top = 192
      Width = 80
      Height = 21
      DataField = 'PE_DIASBAJATOTALES'
      DataSource = dsDatos
      MaxLength = 11
      TabOrder = 8
      Visible = False
    end
    object Edit4: TDBEdit
      Left = 88
      Top = 216
      Width = 536
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PI_DIAGNOSTICO'
      DataSource = dsDatos
      TabOrder = 10
      Visible = False
    end
    object Edit5: TDBEdit
      Left = 88
      Top = 240
      Width = 536
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PE_DIAGNOSTICO'
      DataSource = dsDatos
      TabOrder = 11
      Visible = False
    end
    object DateEdit1: TDBDateEdit
      Left = 472
      Top = 192
      Width = 96
      Height = 21
      DataField = 'EX_ALTAMEDICA'
      DataSource = dsDatos
      NumGlyphs = 2
      TabOrder = 9
      Visible = False
    end
    object Edit1: TDBEdit
      Left = 88
      Top = 24
      Width = 536
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EX_BREVEDESCRIPCION'
      DataSource = dsDatos
      TabOrder = 0
      Visible = False
    end
    object Edit2: TDBEdit
      Left = 88
      Top = 48
      Width = 536
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EX_OBSERVACIONES'
      DataSource = dsDatos
      TabOrder = 1
      Visible = False
    end
    object Edit3: TDBEdit
      Left = 88
      Top = 72
      Width = 536
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CAUSADENEGACION'
      DataSource = dsDatos
      TabOrder = 2
      Visible = False
    end
  end
  object gbUbicacionDenuncia: TJvgGroupBox [7]
    Left = 0
    Top = 32
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Ubicaci'#243'n de la Denuncia '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
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
    FullHeight = 124
    object Label3: TLabel
      Left = 8
      Top = 28
      Width = 37
      Height = 13
      Caption = 'Nombre'
      Visible = False
    end
    object Label4: TLabel
      Left = 8
      Top = 101
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
      Visible = False
    end
    inline fraDomicilioDenuncia: TfraDomicilio
      Left = 8
      Top = 48
      Width = 616
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      DesignSize = (
        616
        45)
      inherited lbNro: TLabel
        Left = 401
      end
      inherited lbPiso: TLabel
        Left = 473
        Width = 19
      end
      inherited lbDto: TLabel
        Left = 549
        Width = 21
      end
      inherited lbCPostal: TLabel
        Top = 28
        Width = 40
      end
      inherited lbCPA: TLabel
        Left = 112
        Top = 28
        Width = 20
      end
      inherited lbLocalidad: TLabel
        Left = 220
        Top = 28
        Width = 44
      end
      inherited lbProvincia: TLabel
        Left = 454
        Top = 28
        Width = 43
      end
      inherited cmbCalle: TArtComboBox
        Left = 56
        Width = 312
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
      inherited edCPostal: TIntEdit
        Left = 56
        Top = 24
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 272
        Top = 24
        Width = 176
      end
      inherited edProvincia: TEdit
        Left = 503
        Top = 24
      end
      inherited edCPA: TPatternEdit
        Left = 138
        Top = 24
      end
      inherited btnBuscar: TButton
        Left = 371
        Width = 23
      end
    end
    object edNombreDenuncia: TDBEdit
      Left = 64
      Top = 24
      Width = 560
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NOMBREDENUNCIA'
      DataSource = dsDatos
      TabOrder = 0
      Visible = False
    end
    object edTelefonosDenuncia: TDBEdit
      Left = 64
      Top = 96
      Width = 560
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TELEFONOSDENUNCIA'
      DataSource = dsDatos
      TabOrder = 2
      Visible = False
    end
  end
  object gbDatosEmpleado: TJvgGroupBox [8]
    Left = 0
    Top = 16
    Width = 632
    Height = 16
    Align = alTop
    Caption = ' Datos del Empleado '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
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
    FullHeight = 100
    inline fraDomicilioTrabajador: TfraDomicilioTrabajador
      Left = 8
      Top = 24
      Width = 617
      Height = 73
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      inherited lbNro: TLabel
        Left = 404
      end
      inherited lbPiso: TLabel
        Left = 476
        Width = 19
      end
      inherited lbDto: TLabel
        Left = 552
        Width = 21
      end
      inherited lbCPostal: TLabel
        Width = 40
      end
      inherited lbCPA: TLabel
        Width = 20
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbProvincia: TLabel
        Left = 455
        Width = 43
      end
      inherited cmbCalle: TArtComboBox
        Width = 327
      end
      inherited edNumero: TEdit
        Left = 426
      end
      inherited edPiso: TEdit
        Left = 502
      end
      inherited edDto: TEdit
        Left = 573
        Width = 43
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 184
      end
      inherited edProvincia: TEdit
        Left = 502
        Width = 114
      end
      inherited edTelefonos: TEdit
        Width = 566
      end
      inherited btnBuscar: TButton
        Left = 378
        Width = 22
      end
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      
        'SELECT EX_CUIT, EX_CUIL, UD_NOMBRE NOMBREDENUNCIA, UD_CALLE CALL' +
        'EDENUNCIA,'
      '       UD_NUMERO NUMERODENUNCIA, UD_PISO PISODENUNCIA,'
      
        '       UD_DEPARTAMENTO DEPARTAMENTODENUNCIA, UD_CPOSTAL CODIGOPO' +
        'STALDENUNCIA,'
      
        '       UD_CPOSTALA CPADENUNCIA, UD_LOCALIDAD LOCALIDADDENUNCIA, ' +
        'PV_DESCRIPCION PROVINCIADENUNCIA,'
      
        '       UTILES.ARMAR_TELEFONO(UD_CODAREATELEFONOS, NULL, UD_TELEF' +
        'ONOS) TELEFONOSDENUNCIA,'
      
        '       PI_DIASBAJAPREVISTOS, PI_DIAGNOSTICO, EX_IDDIAGNOSTICO, P' +
        'E_DIASBAJATOTALES, PE_DIAGNOSTICO,'
      '       EX_ALTAMEDICA, PI_IDLESIONFORMA FORMA,'
      
        '       PI_IDLESIONAGENTE AGENTE, PI_IDLESIONNATURALEZA NATURALEZ' +
        'A, PI_IDLESIONZONA ZONA, EX_BREVEDESCRIPCION,'
      
        '       EX_OBSERVACIONES, EX_DIAGNOSTICOOMS, CT_DESCRIPCION CAUSA' +
        'DENEGACION, EX_PRESTADOR,'
      
        '       PA_FECHAAUDITORIA PA_FECHACONTROL, PA_CALIDADPREST CALIDA' +
        'DAUDITORIA, PA_MEDICO,'
      
        '       DECODE(SI_GRADO, NULL, DECODE(SI_CARACTER, NULL, 0, 1), 1' +
        ') EXISTEINCAPACIDAD,'
      
        '       DECODE(SI_GRADO, '#39'P'#39', 0, DECODE(SI_GRADO, '#39'T'#39', 1, -1)) GR' +
        'ADO,'
      
        '       DECODE(SI_CARACTER, '#39'P'#39', 0, DECODE(SI_CARACTER, '#39'D'#39', 1, -' +
        '1)) CARACTER,'
      '       DECODE(SI_GRANINC, '#39'S'#39', 1, 0) GRANINVALIDEZ,'
      
        '       DECODE(ART.SINIESTRO.IS_RECHAZOPATOLOGIABASE(EX_ID), '#39'S'#39',' +
        ' 1, 0) RECHAZOPATOLOGIABASE,'
      
        '       DECODE(EX_GRAVEDAD, '#39'5'#39', 1, 0) FALLECIMIENTO, SINIESTRO.G' +
        'ET_FECHA_HOMOLOGADO(EX_ID) FECHAHOMOLOGADO,'
      
        '       DECODE(SINIESTRO.GET_FECHA_HOMOLOGADO(EX_ID), NULL, 0, 1)' +
        ' HOMOLOGADO, SI_PORCPROVI, SI_PORCDEF,'
      
        '       DECODE(EX_PRESUPINCAPACIDAD, '#39'?'#39', '#39' '#39', EX_PRESUPINCAPACID' +
        'AD) PRESUPINCAP, EX_FECHARECEPCION, DE_FECHARECEPCION,'
      
        '       PI_FECHARECEPCION, PE_FECHARECEPCION, SA_FECHARECEPCION, ' +
        'DG_FECHARECEPCION, PV_FECHARECEPCION, PA_FECHARECEPCION,'
      
        '       DECODE(EX_FECHARECEPCION, NULL, 0, 1) EX_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(DE_FECHARECEPCION, NULL, 0, 1) DE_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(PI_FECHARECEPCION, NULL, 0, 1) PI_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(PE_FECHARECEPCION, NULL, 0, 1) PE_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(SA_FECHARECEPCION, NULL, 0, 1) SA_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(DG_FECHARECEPCION, NULL, 0, 1) DG_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(PV_FECHARECEPCION, NULL, 0, 1) PV_FECHARECEPCIONTI' +
        'LDE,'
      
        '       DECODE(PA_FECHARECEPCION, NULL, 0, 1) PA_FECHARECEPCIONTI' +
        'LDE,'
      
        '       ART.COMPDEUDA.GET_CUOTAPROMEDIO(AFILIACION.GET_CONTRATOVI' +
        'GENTE(EX_CUIT, EX_FECHAACCIDENTE),'
      '                                       '#39'E'#39','
      
        '                                       UTILES.PERIODO_ANTERIOR(C' +
        'OBRANZA.GET_ULTPERIODODEVENGADO('#39'E'#39'), 12),'
      
        '                                       COBRANZA.GET_ULTPERIODODE' +
        'VENGADO('#39'E'#39'),'
      '                                       '#39'S'#39') CUOTAPROMEDIO,'
      
        '       ART.COMPDEUDA.GET_DEUDA(AFILIACION.GET_CONTRATOVIGENTE(EX' +
        '_CUIT, EX_FECHAACCIDENTE), '#39'D'#39', '#39'S'#39', '#39'N'#39') DEUDA,'
      '       DECODE(ART.AFILIACION.CHECK_COBERTURA(EX_CUIT),'
      
        '              1 /*ART.AFILIACION.ESTADO_ACTIVA*/, ART.COMPDEUDA.' +
        'GET_CUOTAPROMEDIO(AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT,'
      
        '                                                                ' +
        '                                                 EX_FECHAACCIDEN' +
        'TE),'
      
        '                                                                ' +
        '                  '#39'E'#39','
      
        '                                                                ' +
        '                  UTILES.PERIODO_ANTERIOR(COBRANZA.GET_ULTPERIOD' +
        'ODEVENGADO('#39'E'#39'),'
      
        '                                                                ' +
        '                                          12),'
      
        '                                                                ' +
        '                  COBRANZA.GET_ULTPERIODODEVENGADO('#39'E'#39'),'
      
        '                                                                ' +
        '                  '#39'S'#39'),'
      '              0) DEUDAADMITIDA'
      '  FROM SEX_EXPEDIENTES,'
      '       CPV_PROVINCIAS,'
      '       SIN.SUD_UBICACIONDENUNCIA,'
      '       SIN.SPI_PARTEDEINGRESO,'
      '       SIN.SPE_PARTEDEEGRESO,'
      '       SIN.SCT_CAUSATERMINACION,'
      '       SIN.SPA_PARTEDEAUDITORIA,'
      '       SIN_INCAPACIDSIN,'
      '       SIN.SDE_DENUNCIA,'
      '       SIN.SSA_SOLICITUDASISTENCIA,'
      '       SIN.SDG_DENUNCIAGRAVE,'
      '       SPV_PARTEEVOLUTIVO'
      ' WHERE EX_ID = :IDEXPEDIENTE'
      '   AND PV_CODIGO(+) = UD_PROVINCIA'
      '   AND UD_IDEXPEDIENTE(+) = EX_ID'
      '   AND PI_IDEXPEDIENTE(+) = EX_ID'
      '   AND PE_IDEXPEDIENTE(+) = EX_ID'
      '   AND DE_IDEXPEDIENTE(+) = EX_ID'
      '   AND SA_IDEXPEDIENTE(+) = EX_ID'
      '   AND DG_IDEXPEDIENTE(+) = EX_ID'
      '   AND (   DG_NROPARTE = (SELECT MAX(DG_NROPARTE)'
      '                            FROM SIN.SDG_DENUNCIAGRAVE'
      '                           WHERE DG_IDEXPEDIENTE = EX_ID)'
      '        OR DG_NROPARTE IS NULL)'
      '   AND PV_IDEXPEDIENTE(+) = EX_ID'
      '   AND (   PV_NROPARTE = (SELECT MAX(PV_NROPARTE)'
      '                            FROM SPV_PARTEEVOLUTIVO'
      '                           WHERE PV_IDEXPEDIENTE = EX_ID)'
      '        OR PV_NROPARTE IS NULL)'
      '   AND PA_IDEXPEDIENTE(+) = EX_ID'
      '   AND (   PA_NROPARTE = (SELECT MAX(PA_NROPARTE)'
      '                            FROM SIN.SPA_PARTEDEAUDITORIA'
      '                           WHERE PA_IDEXPEDIENTE = EX_ID)'
      '        OR PA_NROPARTE IS NULL)'
      '   AND SI_IDEXPEDIENTE(+) = EX_ID'
      '   AND CT_CODIGO(+) = EX_CAUSAFIN')
    Left = 280
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEXPEDIENTE'
        ParamType = ptInput
      end>
    object sdqDatosEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqDatosEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqDatosNOMBREDENUNCIA: TStringField
      FieldName = 'NOMBREDENUNCIA'
      Size = 100
    end
    object sdqDatosCALLEDENUNCIA: TStringField
      FieldName = 'CALLEDENUNCIA'
      Size = 60
    end
    object sdqDatosNUMERODENUNCIA: TStringField
      FieldName = 'NUMERODENUNCIA'
    end
    object sdqDatosPISODENUNCIA: TStringField
      FieldName = 'PISODENUNCIA'
    end
    object sdqDatosDEPARTAMENTODENUNCIA: TStringField
      FieldName = 'DEPARTAMENTODENUNCIA'
    end
    object sdqDatosCODIGOPOSTALDENUNCIA: TStringField
      FieldName = 'CODIGOPOSTALDENUNCIA'
      Size = 5
    end
    object sdqDatosCPADENUNCIA: TStringField
      FieldName = 'CPADENUNCIA'
      Size = 8
    end
    object sdqDatosLOCALIDADDENUNCIA: TStringField
      FieldName = 'LOCALIDADDENUNCIA'
      Size = 60
    end
    object sdqDatosPROVINCIADENUNCIA: TStringField
      FieldName = 'PROVINCIADENUNCIA'
      Size = 50
    end
    object sdqDatosTELEFONOSDENUNCIA: TStringField
      FieldName = 'TELEFONOSDENUNCIA'
      Size = 4000
    end
    object sdqDatosPI_DIASBAJAPREVISTOS: TFloatField
      FieldName = 'PI_DIASBAJAPREVISTOS'
    end
    object sdqDatosPE_DIASBAJATOTALES: TFloatField
      FieldName = 'PE_DIASBAJATOTALES'
    end
    object sdqDatosPE_DIAGNOSTICO: TStringField
      FieldName = 'PE_DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqDatosFORMA: TFloatField
      FieldName = 'FORMA'
    end
    object sdqDatosAGENTE: TFloatField
      FieldName = 'AGENTE'
    end
    object sdqDatosNATURALEZA: TFloatField
      FieldName = 'NATURALEZA'
    end
    object sdqDatosZONA: TFloatField
      FieldName = 'ZONA'
    end
    object sdqDatosEX_BREVEDESCRIPCION: TStringField
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqDatosEX_OBSERVACIONES: TStringField
      FieldName = 'EX_OBSERVACIONES'
      Size = 250
    end
    object sdqDatosEX_DIAGNOSTICOOMS: TStringField
      FieldName = 'EX_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqDatosCAUSADENEGACION: TStringField
      FieldName = 'CAUSADENEGACION'
      Size = 150
    end
    object sdqDatosPA_FECHACONTROL: TDateTimeField
      FieldName = 'PA_FECHACONTROL'
    end
    object sdqDatosCALIDADAUDITORIA: TStringField
      FieldName = 'CALIDADAUDITORIA'
      Size = 1
    end
    object sdqDatosPA_MEDICO: TStringField
      FieldName = 'PA_MEDICO'
      Size = 30
    end
    object sdqDatosEXISTEINCAPACIDAD: TFloatField
      FieldName = 'EXISTEINCAPACIDAD'
    end
    object sdqDatosGRADO: TFloatField
      FieldName = 'GRADO'
    end
    object sdqDatosCARACTER: TFloatField
      FieldName = 'CARACTER'
    end
    object sdqDatosGRANINVALIDEZ: TFloatField
      FieldName = 'GRANINVALIDEZ'
    end
    object sdqDatosRECHAZOPATOLOGIABASE: TFloatField
      FieldName = 'RECHAZOPATOLOGIABASE'
    end
    object sdqDatosFALLECIMIENTO: TFloatField
      FieldName = 'FALLECIMIENTO'
    end
    object sdqDatosFECHAHOMOLOGADO: TDateTimeField
      FieldName = 'FECHAHOMOLOGADO'
    end
    object sdqDatosHOMOLOGADO: TFloatField
      FieldName = 'HOMOLOGADO'
    end
    object sdqDatosSI_PORCPROVI: TFloatField
      FieldName = 'SI_PORCPROVI'
    end
    object sdqDatosSI_PORCDEF: TFloatField
      FieldName = 'SI_PORCDEF'
    end
    object sdqDatosPRESUPINCAP: TStringField
      FieldName = 'PRESUPINCAP'
      Size = 1
    end
    object sdqDatosEX_FECHARECEPCION: TDateTimeField
      FieldName = 'EX_FECHARECEPCION'
    end
    object sdqDatosDE_FECHARECEPCION: TDateTimeField
      FieldName = 'DE_FECHARECEPCION'
    end
    object sdqDatosPI_FECHARECEPCION: TDateTimeField
      FieldName = 'PI_FECHARECEPCION'
    end
    object sdqDatosPE_FECHARECEPCION: TDateTimeField
      FieldName = 'PE_FECHARECEPCION'
    end
    object sdqDatosSA_FECHARECEPCION: TDateTimeField
      FieldName = 'SA_FECHARECEPCION'
    end
    object sdqDatosDG_FECHARECEPCION: TDateTimeField
      FieldName = 'DG_FECHARECEPCION'
    end
    object sdqDatosPV_FECHARECEPCION: TDateTimeField
      FieldName = 'PV_FECHARECEPCION'
    end
    object sdqDatosPA_FECHARECEPCION: TDateTimeField
      FieldName = 'PA_FECHARECEPCION'
    end
    object sdqDatosEX_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'EX_FECHARECEPCIONTILDE'
    end
    object sdqDatosDE_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'DE_FECHARECEPCIONTILDE'
    end
    object sdqDatosPI_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'PI_FECHARECEPCIONTILDE'
    end
    object sdqDatosPE_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'PE_FECHARECEPCIONTILDE'
    end
    object sdqDatosSA_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'SA_FECHARECEPCIONTILDE'
    end
    object sdqDatosDG_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'DG_FECHARECEPCIONTILDE'
    end
    object sdqDatosPV_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'PV_FECHARECEPCIONTILDE'
    end
    object sdqDatosPA_FECHARECEPCIONTILDE: TFloatField
      FieldName = 'PA_FECHARECEPCIONTILDE'
    end
    object sdqDatosCUOTAPROMEDIO: TFloatField
      FieldName = 'CUOTAPROMEDIO'
    end
    object sdqDatosDEUDA: TFloatField
      FieldName = 'DEUDA'
    end
    object sdqDatosDEUDAADMITIDA: TFloatField
      FieldName = 'DEUDAADMITIDA'
    end
    object sdqDatosEX_PRESTADOR: TFloatField
      FieldName = 'EX_PRESTADOR'
    end
    object sdqDatosEX_IDDIAGNOSTICO: TFloatField
      FieldName = 'EX_IDDIAGNOSTICO'
    end
    object sdqDatosPI_DIAGNOSTICO: TStringField
      FieldName = 'PI_DIAGNOSTICO'
      Size = 250
    end
  end
  inherited dsDatos: TDataSource
    Left = 308
    Top = 128
  end
  inherited sduDatos: TSDUpdateSQL
    Left = 336
    Top = 128
  end
  inherited XPMenu: TXPMenu
    Left = 280
    Top = 100
  end
  inherited Seguridad: TSeguridad
    Left = 308
    Top = 100
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbDatosEmpleado.Collapsed'
      'gbDatosEmpresa.Collapsed'
      'gbDatosPrestador.Collapsed'
      'gbDatosSiniestro.Collapsed'
      'gbDocumentacion.Collapsed'
      'gbEstadoCobranza.Collapsed'
      'gbIncapacidad.Collapsed'
      'gbParteAuditoria.Collapsed'
      'gbUbicacionDenuncia.Collapsed')
    Left = 336
    Top = 100
  end
  inherited Acciones: TActionList
    Left = 280
    Top = 156
  end
end
