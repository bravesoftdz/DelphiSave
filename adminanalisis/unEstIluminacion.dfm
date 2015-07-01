object frmEstIluminacion: TfrmEstIluminacion
  Left = 414
  Top = 209
  Width = 800
  Height = 600
  Caption = 'Estudios de Protocolo de Ilumincai'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 792
    Height = 16
    Align = alTop
    Caption = '  ANTECEDENTES'
    Color = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 0
    Top = 205
    Width = 792
    Height = 16
    Align = alTop
    Caption = '  EXAMEN CLINICO'
    Color = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 0
    Top = 349
    Width = 792
    Height = 16
    Align = alTop
    Caption = '  EXAMEN OCULAR'
    Color = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label20: TLabel
    Left = 0
    Top = 421
    Width = 792
    Height = 16
    Align = alTop
    Caption = '  AGUDEZA VISUAL'
    Color = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 16
    Width = 792
    Height = 189
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 140
      Height = 13
      Caption = 'Antecedentes de enfermedad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 54
      Width = 185
      Height = 13
      Caption = 'Antecedentes de trastornos cong'#233'nitos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 330
      Height = 13
      Caption = 
        'Antecedentes de enfermedades profesionales o accidentes de traba' +
        'jo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 118
      Width = 212
      Height = 13
      Caption = 'Trabajos anteriores con d'#233'ficit de iluminaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 144
      Width = 71
      Height = 13
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edEI_ANTEENFERMEDAD: TMemo
      Left = 380
      Top = 8
      Width = 409
      Height = 33
      MaxLength = 256
      TabOrder = 0
    end
    object edEI_ANTETRASTCONEGNITO: TMemo
      Left = 380
      Top = 44
      Width = 409
      Height = 33
      MaxLength = 256
      TabOrder = 1
    end
    object edEI_ANTEENFPROFACCI: TMemo
      Left = 380
      Top = 80
      Width = 409
      Height = 33
      MaxLength = 256
      TabOrder = 2
    end
    object edEI_ANTEOBS: TMemo
      Left = 380
      Top = 140
      Width = 409
      Height = 33
      MaxLength = 256
      TabOrder = 4
    end
    object Panel16: TPanel
      Left = 380
      Top = 118
      Width = 105
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      object rbtEI_ANTETRABANTDEFILU_S: TRadioButton
        Left = 0
        Top = 0
        Width = 36
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_ANTETRABANTDEFILU_N: TRadioButton
        Left = 70
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 221
    Width = 792
    Height = 128
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label8: TLabel
      Left = 12
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Cefaleas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 12
      Top = 104
      Width = 66
      Height = 13
      Caption = 'Visi'#243'n borrosa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 12
      Top = 82
      Width = 56
      Height = 13
      Caption = 'Conjuntivitis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 12
      Top = 60
      Width = 83
      Height = 13
      Caption = 'Mareos / v'#233'rtigos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 12
      Top = 36
      Width = 57
      Height = 13
      Caption = 'Visi'#243'n doble'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 207
      Top = 13
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 207
      Top = 37
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 207
      Top = 60
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 207
      Top = 83
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 207
      Top = 106
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edEI_CLIDESCCEFALEAS: TEdit
      Left = 280
      Top = 8
      Width = 509
      Height = 21
      MaxLength = 128
      TabOrder = 1
    end
    object edEI_CLIDESCVISIONDBL: TEdit
      Left = 280
      Top = 31
      Width = 509
      Height = 21
      MaxLength = 128
      TabOrder = 3
    end
    object edEI_CLIDESCVERETIGO: TEdit
      Left = 280
      Top = 54
      Width = 509
      Height = 21
      MaxLength = 128
      TabOrder = 5
    end
    object edEI_CLIDESCCONJUNTIV: TEdit
      Left = 280
      Top = 77
      Width = 509
      Height = 21
      MaxLength = 128
      TabOrder = 7
    end
    object edEI_CLIDESCVISIONBORRO: TEdit
      Left = 280
      Top = 100
      Width = 509
      Height = 21
      MaxLength = 128
      TabOrder = 9
    end
    object Panel3: TPanel
      Left = 112
      Top = 12
      Width = 87
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object rbtEI_CLICEFALEAS_S: TRadioButton
        Left = 0
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_CLICEFALEAS_N: TRadioButton
        Left = 52
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 112
      Top = 36
      Width = 87
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      object rbtEI_CLIVISIONDBL_S: TRadioButton
        Left = 0
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_CLIVISIONDBL_N: TRadioButton
        Left = 52
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 112
      Top = 59
      Width = 87
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 4
      object rbtEI_CLIVERTIGO_S: TRadioButton
        Left = 0
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_CLIVERTIGO_N: TRadioButton
        Left = 52
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel6: TPanel
      Left = 112
      Top = 81
      Width = 87
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 6
      object rbtEI_CLICONJUNTIV_S: TRadioButton
        Left = 0
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_CLICONJUNTIV_N: TRadioButton
        Left = 52
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel7: TPanel
      Left = 112
      Top = 104
      Width = 87
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 8
      object rbtEI_CLIVISIONBORRO_S: TRadioButton
        Left = 0
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object EI_CLIVISIONBORRO_N: TRadioButton
        Left = 52
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 365
    Width = 792
    Height = 56
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label14: TLabel
      Left = 116
      Top = 4
      Width = 72
      Height = 13
      Caption = 'Ojos Centrados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 133
      Top = 20
      Width = 55
      Height = 13
      Caption = 'Conjuntivas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 112
      Top = 36
      Width = 76
      Height = 13
      Caption = 'Motilidad Ocular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 408
      Top = 4
      Width = 34
      Height = 13
      Caption = 'Pupilas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 403
      Top = 20
      Width = 39
      Height = 13
      Caption = 'C'#243'rneas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 393
      Top = 36
      Width = 49
      Height = 13
      Caption = 'Nistagmus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel9: TPanel
      Left = 244
      Top = 4
      Width = 109
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object rbtEI_OCUOJOCENTRADO_S: TRadioButton
        Left = 0
        Top = 0
        Width = 32
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_OCUOJOCENTRADO_N: TRadioButton
        Left = 74
        Top = 0
        Width = 35
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel10: TPanel
      Left = 216
      Top = 20
      Width = 137
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      object rbtEI_OCUCONJUNTIVAS_N: TRadioButton
        Left = 0
        Top = 0
        Width = 60
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_OCUCONJUNTIVAS_A: TRadioButton
        Left = 72
        Top = 0
        Width = 65
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Anormal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel11: TPanel
      Left = 216
      Top = 36
      Width = 137
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 4
      object rbtEI_OCUMOTILIDAD_N: TRadioButton
        Left = 0
        Top = 0
        Width = 60
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_OCUMOTILIDAD_A: TRadioButton
        Left = 72
        Top = 0
        Width = 65
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Anormal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel12: TPanel
      Left = 474
      Top = 4
      Width = 137
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object rbtEI_OCUPUPILAS_N: TRadioButton
        Left = 0
        Top = 0
        Width = 59
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_OCUPUPILAS_A: TRadioButton
        Left = 72
        Top = 0
        Width = 65
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Anormal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel13: TPanel
      Left = 474
      Top = 20
      Width = 137
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      object rbtEI_OCUCORNEAS_N: TRadioButton
        Left = 0
        Top = 0
        Width = 59
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_OCUCORNEAS_A: TRadioButton
        Left = 72
        Top = 0
        Width = 65
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Anormal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel14: TPanel
      Left = 464
      Top = 36
      Width = 147
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 5
      object rbtEI_OCUNISTAGMUS_P: TRadioButton
        Left = 0
        Top = 0
        Width = 69
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Presente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_OCUNISTAGMUS_A: TRadioButton
        Left = 82
        Top = 0
        Width = 65
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Ausente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel15: TPanel
    Left = 0
    Top = 437
    Width = 792
    Height = 104
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object Label21: TLabel
      Left = 8
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Ojos derecho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 8
      Top = 32
      Width = 66
      Height = 13
      Caption = 'Ojos izquierdo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 124
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Sin correcci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 124
      Top = 32
      Width = 68
      Height = 13
      Caption = 'Sin correcci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 368
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Con Correcci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 368
      Top = 32
      Width = 73
      Height = 13
      Caption = 'Con Correcci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 8
      Top = 56
      Width = 181
      Height = 13
      Caption = 'En su '#225'rea la preotecci'#243'n personal es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 8
      Top = 80
      Width = 182
      Height = 13
      Caption = 'Tipo de protecci'#243'n personal que utiliza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 588
      Top = 80
      Width = 118
      Height = 13
      Caption = #191'Le imposibilita ver bien?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edEI_AGUOJODSINCORR: TEdit
      Left = 208
      Top = 4
      Width = 121
      Height = 21
      MaxLength = 32
      TabOrder = 0
    end
    object EI_AGUOJOISINCORR: TEdit
      Left = 208
      Top = 28
      Width = 121
      Height = 21
      MaxLength = 32
      TabOrder = 2
    end
    object EI_AGUOJODCONCORR: TEdit
      Left = 456
      Top = 4
      Width = 121
      Height = 21
      MaxLength = 32
      TabOrder = 1
    end
    object EI_AGUOJOICONCORR: TEdit
      Left = 456
      Top = 28
      Width = 121
      Height = 21
      MaxLength = 32
      TabOrder = 3
    end
    object Panel17: TPanel
      Left = 208
      Top = 56
      Width = 251
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 4
      object rbtEI_PROTPERSONAL_OB: TRadioButton
        Left = 0
        Top = 0
        Width = 75
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Obligatoria'
        TabOrder = 0
      end
      object rbtEI_PROTPERSONAL_OP: TRadioButton
        Left = 84
        Top = 0
        Width = 75
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Opcional'
        TabOrder = 1
      end
      object rbtEI_PROTPERSONAL_NP: TRadioButton
        Left = 176
        Top = 0
        Width = 75
        Height = 17
        Alignment = taLeftJustify
        Caption = 'No previsto'
        TabOrder = 2
      end
    end
    object edEI_PROTTIPO: TEdit
      Left = 208
      Top = 76
      Width = 369
      Height = 21
      MaxLength = 64
      TabOrder = 5
    end
    object Panel18: TPanel
      Left = 716
      Top = 79
      Width = 68
      Height = 17
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 6
      object rbtEI_PROTIMPOSIBILITA_S: TRadioButton
        Left = 0
        Top = 0
        Width = 30
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rbtEI_PROTIMPOSIBILITA_N: TRadioButton
        Left = 34
        Top = 0
        Width = 34
        Height = 17
        Alignment = taLeftJustify
        Caption = 'NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 544
    Width = 792
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      792
      29)
    object btnAceptar: TButton
      Left = 635
      Top = 1
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 715
      Top = 1
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT  *'
      '  FROM  art.aei_estiluminacion'
      ' WHERE  ei_aetid = :aetid')
    Left = 320
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'aetid'
        ParamType = ptInput
      end>
  end
end
