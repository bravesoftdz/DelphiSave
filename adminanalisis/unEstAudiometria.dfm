object frmEstAudiometria: TfrmEstAudiometria
  Left = 372
  Top = 131
  Width = 617
  Height = 579
  ActiveControl = fraPrestador.edCodigo
  Caption = 'Audiometr'#237'a Tonal'
  Color = clBtnFace
  Constraints.MinHeight = 508
  Constraints.MinWidth = 617
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    609
    552)
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TButton
    Left = 449
    Top = 525
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 4
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 529
    Top = 525
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
  object pnlEstudio: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 90
    Align = alTop
    TabOrder = 0
    DesignSize = (
      609
      90)
    object Label6: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Prestador'
    end
    object Operativo: TLabel
      Left = 308
      Top = 12
      Width = 46
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Operativo'
    end
    object Label7: TLabel
      Left = 10
      Top = 42
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label8: TLabel
      Left = 308
      Top = 40
      Width = 85
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ex'#225'men Peri'#243'dico'
    end
    object lbFechaRPrest: TLabel
      Left = 16
      Top = 66
      Width = 100
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Recepci'#243'n Prestador'
      FocusControl = edFechaRPrest
    end
    object lbFechaRML: TLabel
      Left = 228
      Top = 66
      Width = 136
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Recepci'#243'n Medicina Laboral'
      FocusControl = edFechaRML
    end
    inline fraPrestador: TfraPrestadorAMP
      Left = 64
      Top = 8
      Width = 241
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        241
        21)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 189
      end
      inherited edCodigo: TIntEdit
        Width = 49
      end
    end
    inline fraOperativo: TfraOperativo
      Left = 360
      Top = 8
      Width = 241
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 1
      DesignSize = (
        241
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 189
      end
    end
    object edFechaRPrest: TDateComboBox
      Left = 128
      Top = 62
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object edFechaRML: TDateComboBox
      Left = 368
      Top = 62
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    inline fraTipoEstudio: TfraTipoEstudio
      Left = 64
      Top = 36
      Width = 241
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        241
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 188
      end
    end
    inline fraReconfirmacion: TfraReconfirmacion
      Left = 398
      Top = 36
      Width = 203
      Height = 22
      Anchors = [akTop, akRight]
      TabOrder = 3
      DesignSize = (
        203
        22)
      inherited cmbEstudio: TArtComboBox
        Width = 135
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 90
    Width = 609
    Height = 249
    ActivePage = tsAudicion
    Align = alTop
    TabOrder = 1
    object tsAudicion: TTabSheet
      Caption = 'Datos de la Audici'#243'n'
      DesignSize = (
        601
        221)
      object cgAlteraciones: TCheckGroup
        Left = 0
        Top = 100
        Width = 173
        Height = 119
        Anchors = [akLeft, akBottom]
        Caption = 'Alteraciones de la Audici'#243'n'
        TabOrder = 3
        Items.Strings = (
          '&Usa Protecci'#243'n Personal'
          'T&ap'#243'n de cera'
          '&T'#237'mpano'
          '&Eczema'
          '&Supuraci'#243'n')
        Value = '00000'
      end
      object pnlHipoacusia: TGroupBox
        Left = 392
        Top = 100
        Width = 209
        Height = 119
        Anchors = [akRight, akBottom]
        Caption = 'Hipoacusia'
        TabOrder = 5
        object Bevel1: TBevel
          Left = 68
          Top = 32
          Width = 121
          Height = 9
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 136
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Derecho'
        end
        object Label2: TLabel
          Left = 76
          Top = 16
          Width = 43
          Height = 13
          Caption = 'Izquierdo'
        end
        object Label3: TLabel
          Left = 10
          Top = 40
          Width = 51
          Height = 13
          Caption = 'Perceptiva'
        end
        object Label4: TLabel
          Left = 7
          Top = 64
          Width = 54
          Height = 13
          Caption = 'Conductiva'
        end
        object Label5: TLabel
          Left = 36
          Top = 88
          Width = 25
          Height = 13
          Caption = 'Mixta'
        end
        object Bevel2: TBevel
          Left = 128
          Top = 36
          Width = 5
          Height = 73
          Shape = bsLeftLine
        end
        object chkHipoPerceDer: TCheckBox
          Left = 150
          Top = 40
          Width = 13
          Height = 13
          Alignment = taLeftJustify
          TabOrder = 1
          OnEnter = chkHipoacusiaEnter
          OnExit = chkHipoacusiaEnter
        end
        object chkHipoConduDer: TCheckBox
          Left = 150
          Top = 64
          Width = 13
          Height = 13
          Alignment = taLeftJustify
          TabOrder = 3
          OnEnter = chkHipoacusiaEnter
          OnExit = chkHipoacusiaEnter
        end
        object chkHipoMixtaDer: TCheckBox
          Left = 150
          Top = 88
          Width = 13
          Height = 13
          Alignment = taLeftJustify
          TabOrder = 5
          OnEnter = chkHipoacusiaEnter
          OnExit = chkHipoacusiaEnter
        end
        object chkHipoPerceIzq: TCheckBox
          Left = 91
          Top = 40
          Width = 13
          Height = 13
          Alignment = taLeftJustify
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          OnEnter = chkHipoacusiaEnter
          OnExit = chkHipoacusiaEnter
        end
        object chkHipoConduIzq: TCheckBox
          Left = 91
          Top = 64
          Width = 13
          Height = 13
          Alignment = taLeftJustify
          TabOrder = 2
          OnEnter = chkHipoacusiaEnter
          OnExit = chkHipoacusiaEnter
        end
        object chkHipoMixtaIzq: TCheckBox
          Left = 91
          Top = 88
          Width = 13
          Height = 13
          Alignment = taLeftJustify
          TabOrder = 4
          OnEnter = chkHipoacusiaEnter
          OnExit = chkHipoacusiaEnter
        end
      end
      object pnlPorcentajes: TPanel
        Left = 176
        Top = 105
        Width = 213
        Height = 56
        Anchors = [akLeft, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 4
        DesignSize = (
          213
          56)
        object Label28: TLabel
          Left = 8
          Top = 9
          Width = 139
          Height = 13
          Caption = 'Porc.de Incapacidad auditiva'
        end
        object Label39: TLabel
          Left = 7
          Top = 34
          Width = 113
          Height = 13
          Caption = 'Porc. de la Total Obrera'
        end
        object edPorceIncap: TIntEdit
          Left = 160
          Top = 5
          Width = 45
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object edIncapLabo: TIntEdit
          Left = 160
          Top = 30
          Width = 45
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
      end
      object pnlOtros: TGroupBox
        Left = 0
        Top = 52
        Width = 605
        Height = 45
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = '&Otros'
        TabOrder = 2
        DesignSize = (
          605
          45)
        object edOtros: TEdit
          Left = 8
          Top = 16
          Width = 589
          Height = 21
          Hint = 'Otros Antecedentes'
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 50
          TabOrder = 0
        end
      end
      object pnlOtotoxicos: TGroupBox
        Left = 0
        Top = 4
        Width = 481
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = 'A&ntecedentes a Exposici'#243'n a Otot'#243'xicos'
        TabOrder = 0
        DesignSize = (
          481
          45)
        object edOtotoxicos: TEdit
          Left = 8
          Top = 16
          Width = 465
          Height = 21
          Hint = 'Antecedentes de exposici'#243'n a otot'#243'xicos'
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 50
          TabOrder = 0
        end
      end
      object pnlSisigrama: TPanel
        Left = 176
        Top = 163
        Width = 213
        Height = 56
        Anchors = [akLeft, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 6
        DesignSize = (
          213
          56)
        object Label9: TLabel
          Left = 8
          Top = 9
          Width = 45
          Height = 26
          Caption = 'Sisigrama'#13#10'(4000Hz)'
        end
        object Label10: TLabel
          Left = 103
          Top = 34
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'O.Izq.'
        end
        object Label11: TLabel
          Left = 100
          Top = 11
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'O.Der.'
        end
        object edSisigramaDerecho: TCurrencyEdit
          Left = 144
          Top = 5
          Width = 61
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DisplayFormat = ',0.00 %;-,0.00 %'
          Anchors = [akTop, akRight]
          MaxLength = 10
          ReadOnly = True
          TabOrder = 0
        end
        object edSisigramaIzquierdo: TCurrencyEdit
          Left = 144
          Top = 30
          Width = 61
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DisplayFormat = ',0.00 %;-,0.00 %'
          Anchors = [akTop, akRight]
          MaxLength = 10
          ReadOnly = True
          TabOrder = 1
        end
      end
      object bgLogoAudiometria: TGroupBox
        Left = 484
        Top = 4
        Width = 117
        Height = 45
        Anchors = [akTop, akRight]
        Caption = 'Logo Audiometr'#237'a'
        TabOrder = 1
        DesignSize = (
          117
          45)
        object cmbLogoAudiometria: TComboBox
          Left = 4
          Top = 16
          Width = 109
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Con Ca'#237'da'
            'Sin Ca'#237'da')
        end
      end
    end
    object tsAudiometria: TTabSheet
      Caption = 'Audiometr'#237'a'
      ImageIndex = 1
    end
  end
  object pnlAudiometrias: TPanel
    Left = 0
    Top = 339
    Width = 609
    Height = 132
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      609
      132)
    object edtI500: TIntEdit
      Tag = 9
      Left = 214
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 500Hz'
      TabOrder = 10
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtD500: TIntEdit
      Tag = 2
      Left = 214
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 500Hz'
      TabOrder = 2
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtD1000: TIntEdit
      Tag = 3
      Left = 274
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 1000Hz'
      TabOrder = 3
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtI1000: TIntEdit
      Tag = 10
      Left = 274
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 1000Hz'
      TabOrder = 11
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtI2000: TIntEdit
      Tag = 11
      Left = 334
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 2000Hz'
      TabOrder = 12
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtD2000: TIntEdit
      Tag = 4
      Left = 334
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 2000Hz'
      TabOrder = 4
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtI4000: TIntEdit
      Tag = 12
      Left = 394
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 4000Hz'
      TabOrder = 13
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtD4000: TIntEdit
      Tag = 5
      Left = 394
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 4000Hz'
      TabOrder = 5
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtDperd: TIntEdit
      Left = 514
      Top = 32
      Width = 83
      Height = 21
      Hint = 'Oido Derecho Suma'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edtIperd: TIntEdit
      Left = 514
      Top = 56
      Width = 83
      Height = 21
      Hint = 'Oido Izquierdo Suma'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 81
      Height = 21
      Caption = 'Hz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object Panel2: TPanel
      Left = 212
      Top = 8
      Width = 57
      Height = 21
      Caption = '500'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
    end
    object Panel3: TPanel
      Left = 272
      Top = 8
      Width = 57
      Height = 21
      Caption = '1000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
    end
    object Panel4: TPanel
      Left = 332
      Top = 8
      Width = 57
      Height = 21
      Caption = '2000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
    end
    object Panel5: TPanel
      Left = 392
      Top = 8
      Width = 57
      Height = 21
      Caption = '4000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
    end
    object Panel6: TPanel
      Left = 512
      Top = 8
      Width = 85
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Suma db'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
    end
    object edtI125: TIntEdit
      Tag = 7
      Left = 94
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 500Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 8
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtD125: TIntEdit
      Left = 94
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 500Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object Panel7: TPanel
      Left = 92
      Top = 8
      Width = 57
      Height = 21
      Caption = '125'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
    end
    object Panel8: TPanel
      Left = 152
      Top = 8
      Width = 57
      Height = 21
      Caption = '250'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
    end
    object edtD250: TIntEdit
      Tag = 1
      Left = 154
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 1000Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtI250: TIntEdit
      Tag = 8
      Left = 154
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 1000Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 9
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtI8000: TIntEdit
      Tag = 13
      Left = 454
      Top = 56
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 4000Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 14
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edtD8000: TIntEdit
      Tag = 6
      Left = 454
      Top = 32
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 4000Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 6
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object Panel9: TPanel
      Left = 452
      Top = 8
      Width = 57
      Height = 21
      Caption = '8000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
    end
    object chkOidoDerecho: TRxSwitch
      Left = 8
      Top = 32
      Width = 81
      Height = 21
      Caption = 'O.Derecho'
      GlyphOff.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FFC0C0C00000
        FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF000000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FF
        C0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C00000
        FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0
        C0C00000FF00FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FF
        C0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0
        C00000FF00FF0000FF0000FF0000FF000000FFC0C0C00000FFC0C0C00000FF00
        FF0000FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FFC0C0C0
        00FF0000FF0000FF000000FFC0C0C00000FFC0C0C00000FF00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FFC0C0C000
        FF0000FF00C0C0C00000FFC0C0C00000FF00FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FF00FF00C0C0
        C00000FFC0C0C00000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FF0000FFC0C0C0
        0000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF000000FFC0C0C00000FFC0C0C0C0C0C00000FFC0C0C000
        00FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00C0C0C00000FFC0C0C00000FF0000FFC0C0C00000FFC0C0C000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF000000FFC0C0C00000FFC0C0C0C0C0C00000FFC0C0C00000FF00FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0
        C00000FFC0C0C00000FF0000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFC0C0C0
        0000FFC0C0C000FF000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF000000FFC0C0C00000FFC0C0C000
        FF0000FF00C0C0C00000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF000000FFC0C0C00000FFC0C0C00000FF00FF0000FF
        0000FF00C0C0C00000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000
        FF0000FF000000FFC0C0C00000FFC0C0C00000FF00FF0000FF0000FF0000FF00
        0000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000
        FFC0C0C00000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000
        00FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FF
        C0C0C00000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00C0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FFC0C0C00000FF00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF000000FFC0C0C00000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      GlyphOn.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000
        FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF00
        FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF
        00FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF00
        FF0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF00FF000000
        FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF
        0000FF0000FF00FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF00
        FF0000FF000000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF00FF0000FF
        0000FF000000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000
        FF0000FF000000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF00
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF000000FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      StateOn = True
      TabOrder = 25
      TabStop = False
      TextPosition = tpRight
      Data = {03}
    end
    object chkOidoIzquierdo: TRxSwitch
      Tag = 1
      Left = 8
      Top = 56
      Width = 77
      Height = 21
      Caption = ' O.Izquierdo'
      GlyphOff.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF0000C0C0C0FF
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00C0C0C0FF0000C0C0C000FF0000FF00C0C0C0FF0000C0C0C0FF00
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0
        C0C0FF0000C0C0C0FF000000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF0000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0
        C0FF000000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000
        FF0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF
        0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF00
        00FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF0000C0C0C0FF
        0000C0C0C0FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF0000C0C0C0FF00
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00C0C0C0FF0000C0C0C0FF0000C0C0C0FF000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        C0C0C0FF0000C0C0C0FF0000C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0
        C0C0FF000000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF
        0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF00
        00FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF0000FF
        0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF0000FF00C0C0C0
        FF0000C0C0C0FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00C0C0C0FF0000C0C0C0FF000000FF0000FF00FF0000C0C0C0FF
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00C0C0C0FF0000C0C0C000FF0000FF00C0C0C0FF000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00C0C0C0FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      GlyphOn.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00FF0000FF0000FF000000FF0000FF00FF0000FF0000FF0000FF00
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF
        0000FF0000FF0000FF000000FF0000FF0000FF00FF0000FF0000FF0000FF0000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF00
        00FF000000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000
        FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF
        0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF00
        00FF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF00
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF
        0000FF000000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF
        0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF00
        00FF0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF
        0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF0000FF00FF0000
        FF0000FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00FF0000FF0000FF0000FF000000FF0000FF00FF0000FF0000FF
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00FF0000FF0000FF000000FF0000FF00FF0000FF000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00FF0000FF000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      StateOn = True
      TabOrder = 26
      TabStop = False
      TextPosition = tpRight
      Data = {03}
    end
    object chkOseoDerecho: TRxSwitch
      Tag = 2
      Left = 8
      Top = 80
      Width = 81
      Height = 21
      Caption = 'V'#237'a Osea D'
      GlyphOff.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        000000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        0000FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        00FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        FFC0C0C00000FFC0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C00000FF
        C0C0C00000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFC0C0C00000FFC0
        C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FF00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FF00FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF00C0C0C00000FFC0C0C00000FF00FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C0
        0000FFC0C0C00000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C000
        00FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00C0C0C00000FFC0C0C00000FF00FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF00C0C0C00000FFC0C0C00000FF00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00C0C0C00000FFC0C0C00000FF00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C00000FF
        C0C0C00000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      GlyphOn.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        0000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        00FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF
        0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF00
        00FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF
        0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF00
        00FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000FF0000FF0000FF0000FF00FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        000000FF0000FF0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF0000FF
        0000FF0000FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00}
      StateOn = True
      TabOrder = 27
      TabStop = False
      TextPosition = tpRight
      Data = {03}
    end
    object chkOseoIzquierdo: TRxSwitch
      Tag = 3
      Left = 8
      Top = 104
      Width = 77
      Height = 21
      Caption = 'V'#237'a Osea I'
      GlyphOff.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0
        C0800000C0C0C080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C0800000C0C0C0
        80000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF00C0C0C0800000C0C0C080000000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF00C0C0C0800000C0C0C080000000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF00C0C0C0800000C0C0C080000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C08000
        00C0C0C080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0C0800000C0C0C0800000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF00C0C0C0800000C0C0C080000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00C0C0C0800000C0C0C080000000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF00800000C0C0C0800000C0C0C000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0C0
        C0800000C0C0C080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0
        800000C0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C080
        0000C0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C08000
        00C0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0800000
        C0C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0800000C0
        C0C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0800000C0C0
        C000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0800000C0C0C0
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0800000C0C0C000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF00800000C0C0C0800000C0C0C000FF
        0000FF0000FF0000FF00}
      GlyphOn.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008000
        0080000080000080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000800000800000
        80000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0080000080000080000080000000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0080000080000080000080000000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0080000080000080000080000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008000008000
        0080000080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00800000800000800000800000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0080000080000080000080000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0080000080000080000080000000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0080000080000080000080000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008000
        0080000080000080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000800000
        80000080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0080000080000080
        000080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008000008000008000
        0080000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00800000800000800000
        80000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0080000080000080000080
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF008000008000008000008000
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00800000800000800000800000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0080000080000080000080000000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0080000080000080000080000000FF
        0000FF0000FF0000FF00}
      StateOn = True
      TabOrder = 28
      TabStop = False
      TextPosition = tpRight
      Data = {03}
    end
    object edOseoI250: TIntEdit
      Tag = 22
      Left = 154
      Top = 108
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 1000Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 34
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoI500: TIntEdit
      Tag = 23
      Left = 214
      Top = 104
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 500Hz'
      Enabled = False
      TabOrder = 35
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoI1000: TIntEdit
      Tag = 24
      Left = 274
      Top = 104
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 1000Hz'
      Enabled = False
      TabOrder = 36
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoI2000: TIntEdit
      Tag = 25
      Left = 334
      Top = 104
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 2000Hz'
      Enabled = False
      TabOrder = 37
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoI4000: TIntEdit
      Tag = 26
      Left = 394
      Top = 104
      Width = 53
      Height = 21
      Hint = 'Oido Izquierdo 4000Hz'
      Enabled = False
      TabOrder = 38
      OnChange = OnOidoIzquierdoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoD4000: TIntEdit
      Tag = 19
      Left = 394
      Top = 80
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 4000Hz'
      Enabled = False
      TabOrder = 33
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoD2000: TIntEdit
      Tag = 18
      Left = 334
      Top = 80
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 2000Hz'
      Enabled = False
      TabOrder = 32
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoD1000: TIntEdit
      Tag = 17
      Left = 274
      Top = 80
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 1000Hz'
      Enabled = False
      TabOrder = 31
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoD500: TIntEdit
      Tag = 16
      Left = 214
      Top = 80
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 500Hz'
      Enabled = False
      TabOrder = 30
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object edOseoD250: TIntEdit
      Tag = 15
      Left = 154
      Top = 80
      Width = 53
      Height = 21
      Hint = 'Oido Derecho 1000Hz'
      Color = clBtnFace
      Enabled = False
      TabOrder = 29
      OnChange = OnOidoDerechoChange
      MaxLength = 3
      MaxValue = 135
      MinValue = -15
      Options = [ioAllowEmpty, ioAllowNegative]
    end
    object Panel10: TPanel
      Left = 94
      Top = 80
      Width = 53
      Height = 21
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 39
    end
    object Panel11: TPanel
      Left = 94
      Top = 104
      Width = 53
      Height = 21
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 40
    end
    object Panel12: TPanel
      Left = 454
      Top = 104
      Width = 53
      Height = 21
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 41
    end
    object Panel13: TPanel
      Left = 454
      Top = 80
      Width = 53
      Height = 21
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 42
    end
    object Panel14: TPanel
      Left = 514
      Top = 80
      Width = 83
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 43
    end
    object Panel15: TPanel
      Left = 514
      Top = 104
      Width = 83
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 44
    end
  end
  object pnlChks: TPanel
    Left = 0
    Top = 471
    Width = 609
    Height = 41
    Align = alTop
    TabOrder = 3
    object chkAM_AUDNORMAL: TCheckBox
      Left = 12
      Top = 16
      Width = 61
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Normal'
      TabOrder = 0
    end
    object chkAM_AUDTA: TCheckBox
      Left = 96
      Top = 16
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Trauma Ac'#250'stico (T.A.)'
      TabOrder = 1
    end
    object chkAM_AUDINCULP: TCheckBox
      Left = 480
      Top = 16
      Width = 77
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Inculpable'
      TabOrder = 3
    end
    object chkAM_AUDTASC: TCheckBox
      Left = 256
      Top = 16
      Width = 201
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Trauma Ac'#250'stico Sin Incapacidad'
      TabOrder = 2
    end
  end
  object pmnuAudiometria: TPopupMenu
    Left = 200
    Top = 64
    object mnuAudCopiar: TMenuItem
      Caption = 'Copiar la Portapapeles'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuGuardarComo: TMenuItem
      Caption = 'Guardar como...'
    end
  end
  object SavePictureDialog: TSavePictureDialog
    FileName = 'C:\AUDIOMETRIA.GIF'
    Filter = 
      'All (*.gif;*.gif;*.jpg;*.jpeg;*.jpg;*.jpeg;*.bmp)|*.gif;*.gif;*.' +
      'jpg;*.jpeg;*.jpg;*.jpeg;*.bmp|Imagen GIF Image (*.gif)|*.gif|Ima' +
      'gen JPEG|*.jpg;*.jpeg;*.jpg|Bitmaps (*.bmp)|*.bmp'
    Title = 'Guardar Como'
    Left = 228
    Top = 64
  end
end
