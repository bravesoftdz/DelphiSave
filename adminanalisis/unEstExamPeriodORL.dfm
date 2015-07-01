object frmEstExamenORL: TfrmEstExamenORL
  Left = 271
  Top = 177
  Width = 800
  Height = 600
  Caption = 'Examen M'#233'dico peri'#243'dico O.R.L.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotones: TPanel
    Left = 0
    Top = 540
    Width = 792
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      792
      33)
    object btnAceptar: TButton
      Left = 635
      Top = 5
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 715
      Top = 5
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ScrollBox: TScrollBox
    Left = 0
    Top = 0
    Width = 792
    Height = 540
    VertScrollBar.Position = 216
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = -216
      Width = 772
      Height = 16
      Align = alTop
      Caption = '   DATOS DEL TRABAJADOR'
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
      Top = -112
      Width = 772
      Height = 16
      Align = alTop
      Caption = '  TRABAJADORES DE SERVICIOS TELEFONICOS'
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
      Top = -40
      Width = 772
      Height = 16
      Align = alTop
      Caption = '  HABITOS'
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
      Top = 60
      Width = 772
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
    object Label30: TLabel
      Left = 0
      Top = 385
      Width = 772
      Height = 16
      Align = alTop
      Caption = '  EXAMEN O.R.L.'
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
      Top = -200
      Width = 772
      Height = 88
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 28
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Antig'#252'edad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 188
        Top = 8
        Width = 130
        Height = 13
        Caption = 'Antig'#252'edad en otros cargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 20
        Top = 32
        Width = 63
        Height = 13
        Caption = 'Carga horaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 168
        Top = 32
        Width = 27
        Height = 13
        Caption = 'Diaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 276
        Top = 32
        Width = 41
        Height = 13
        Caption = 'Semanal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 8
        Top = 56
        Width = 74
        Height = 13
        Caption = 'Nivel educativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel16: TPanel
        Left = 400
        Top = 8
        Width = 241
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object rbtEO_DATANTIGTIPO_Titu: TRadioButton
          Left = 0
          Top = 0
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Titular'
          TabOrder = 0
        end
        object rbtEO_DATANTIGTIPO_Prov: TRadioButton
          Left = 84
          Top = 0
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Provisorio'
          TabOrder = 1
        end
        object rbtEO_DATANTIGTIPO_Sup: TRadioButton
          Left = 176
          Top = 0
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Suplente'
          TabOrder = 2
        end
      end
      object Panel19: TPanel
        Left = 168
        Top = 56
        Width = 473
        Height = 17
        BevelOuter = bvNone
        TabOrder = 6
        object rbtEO_DATNIVEDUCFIN_PPRI: TRadioButton
          Left = 0
          Top = 0
          Width = 75
          Height = 17
          Alignment = taLeftJustify
          Caption = 'PrePrimaria'
          TabOrder = 0
        end
        object rbtEO_DATNIVEDUCFIN_PRI: TRadioButton
          Left = 92
          Top = 0
          Width = 55
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Primaria'
          TabOrder = 1
        end
        object rbtEO_DATNIVEDUCFIN_SEC: TRadioButton
          Left = 168
          Top = 0
          Width = 75
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Secundaria'
          TabOrder = 2
        end
        object rbtEO_DATNIVEDUCFIN_TER: TRadioButton
          Left = 268
          Top = 0
          Width = 60
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Terciario'
          TabOrder = 3
        end
        object rbtEO_DATNIVEDUCFIN_UNI: TRadioButton
          Left = 344
          Top = 0
          Width = 75
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Universitario'
          TabOrder = 4
        end
      end
      object edEO_DATANTIG: TIntEdit
        Left = 92
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 0
        Alignment = taRightJustify
        MaxLength = 3
      end
      object edEO_DATCARGADIARIA: TIntEdit
        Left = 204
        Top = 28
        Width = 57
        Height = 21
        TabOrder = 3
        Alignment = taRightJustify
        MaxLength = 3
      end
      object edEO_DATCARGASEMAN: TIntEdit
        Left = 328
        Top = 28
        Width = 57
        Height = 21
        TabOrder = 4
        Alignment = taRightJustify
        MaxLength = 3
      end
      object edEO_DATNIVEDUC: TIntEdit
        Left = 92
        Top = 52
        Width = 57
        Height = 21
        TabOrder = 5
        Alignment = taRightJustify
        MaxLength = 3
      end
      object edEO_DATCARGAHORA: TIntEdit
        Left = 92
        Top = 28
        Width = 57
        Height = 21
        TabOrder = 2
        Alignment = taRightJustify
        MaxLength = 3
      end
      object edEO_DATANTIGOTROS: TIntEdit
        Left = 328
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 7
        Alignment = taRightJustify
        MaxLength = 3
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = -96
      Width = 772
      Height = 56
      Align = alTop
      BevelInner = bvLowered
      Caption = 'sdfsf'#13#10'sdfsdf'
      TabOrder = 1
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 148
        Height = 13
        Caption = 'Breve descripci'#243'n de las tareas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edEO_SERVTELEDESC: TMemo
        Left = 160
        Top = 8
        Width = 609
        Height = 37
        MaxLength = 256
        TabOrder = 0
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = -24
      Width = 772
      Height = 84
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object Label14: TLabel
        Left = 9
        Top = 7
        Width = 64
        Height = 13
        Caption = 'Toma alcohol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 9
        Top = 31
        Width = 26
        Height = 13
        Caption = 'Fuma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 9
        Top = 54
        Width = 84
        Height = 13
        Caption = 'Toma medicaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 217
        Top = 7
        Width = 181
        Height = 13
        Caption = 'Otras actividades con esfuerzo de voz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 217
        Top = 28
        Width = 42
        Height = 13
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 217
        Top = 54
        Width = 21
        Height = 13
        Caption = 'Cu'#225'l'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 505
        Top = 7
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
      object Panel9: TPanel
        Left = 104
        Top = 5
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object rbtEO_HABALCOHOL_S: TRadioButton
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
        object rbtEO_HABALCOHOL_N: TRadioButton
          Left = 50
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
      object Panel3: TPanel
        Left = 104
        Top = 29
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 3
        object rbtEO_HABFUMA_S: TRadioButton
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
        object rbtEO_HABFUMA_N: TRadioButton
          Left = 50
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
        Left = 104
        Top = 53
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 5
        object rbtEO_HABMEDIC_S: TRadioButton
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
        object rbtEO_HABMEDIC_N: TRadioButton
          Left = 50
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
        Left = 408
        Top = 7
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object rbtEO_ACTVOZ_S: TRadioButton
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
        object rbtEO_ACTVOZ_N: TRadioButton
          Left = 50
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
      object edEO_ACTVOZDESC: TEdit
        Left = 568
        Top = 4
        Width = 201
        Height = 21
        MaxLength = 64
        TabOrder = 2
      end
      object edEO_HABMEDICDESC: TEdit
        Left = 268
        Top = 50
        Width = 133
        Height = 21
        MaxLength = 32
        TabOrder = 6
        OnExit = edEO_HABMEDICDESCExit
      end
      object edEO_HABFUMACANT: TIntEdit
        Left = 268
        Top = 24
        Width = 57
        Height = 21
        TabOrder = 4
        Alignment = taRightJustify
        MaxLength = 3
      end
    end
    object Panel15: TPanel
      Left = 0
      Top = 76
      Width = 772
      Height = 309
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 3
      object Label17: TLabel
        Left = 12
        Top = 12
        Width = 61
        Height = 13
        Caption = 'Respiratorios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 12
        Top = 36
        Width = 43
        Height = 13
        Caption = 'Al'#233'rgicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 12
        Top = 252
        Width = 25
        Height = 13
        Caption = 'Otras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 12
        Top = 228
        Width = 79
        Height = 13
        Caption = 'N'#243'dulos vocales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 12
        Top = 60
        Width = 53
        Height = 13
        Caption = 'Quir'#250'rgicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 12
        Top = 84
        Width = 49
        Height = 13
        Caption = 'Digestivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 12
        Top = 108
        Width = 43
        Height = 13
        Caption = 'Tir'#243'ideos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 12
        Top = 132
        Width = 25
        Height = 13
        Caption = 'Otros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 12
        Top = 152
        Width = 86
        Height = 13
        Caption = 'Diston'#237'a funcional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 12
        Top = 180
        Width = 79
        Height = 13
        Caption = 'Laringitis cr'#243'nica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 12
        Top = 204
        Width = 81
        Height = 13
        Caption = 'P'#243'lipos lar'#237'ngeos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 12
        Top = 276
        Width = 167
        Height = 13
        Caption = 'Caracter'#237'sticas subjetivas de la voz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label31: TLabel
        Left = 376
        Top = 80
        Width = 59
        Height = 13
        Caption = 'Hernia hiatal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 564
        Top = 80
        Width = 111
        Height = 13
        Caption = 'Reflujo gastroesof'#225'gico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 205
        Top = 176
        Width = 31
        Height = 13
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label37: TLabel
        Left = 205
        Top = 152
        Width = 31
        Height = 13
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Normal: TLabel
        Left = 577
        Top = 274
        Width = 33
        Height = 13
        Caption = 'Normal'
      end
      object edEO_ANTRESP: TMemo
        Left = 104
        Top = 4
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTALER: TMemo
        Left = 104
        Top = 28
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 1
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTQUIRUR: TMemo
        Left = 104
        Top = 52
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 2
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTTIROID: TMemo
        Left = 104
        Top = 101
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 6
        WantReturns = False
        WordWrap = False
      end
      object Panel7: TPanel
        Left = 448
        Top = 80
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 4
        object rbtEO_ANTHERNIA_S: TRadioButton
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
        object rbtEO_ANTHERNIA_N: TRadioButton
          Left = 50
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
        Left = 680
        Top = 80
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 5
        object rbtEO_ANTGASTRO_S: TRadioButton
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
        object rbtEO_ANTGASTRO_N: TRadioButton
          Left = 50
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
      object edEO_ANTDIGEST: TMemo
        Left = 104
        Top = 76
        Width = 261
        Height = 21
        MaxLength = 256
        TabOrder = 3
        WantReturns = False
        WordWrap = False
      end
      object Panel11: TPanel
        Left = 108
        Top = 176
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 10
        object rbtEO_ANTLARING_S: TRadioButton
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
        object rbtEO_ANTLARING_N: TRadioButton
          Left = 50
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
      object Panel12: TPanel
        Left = 108
        Top = 152
        Width = 85
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 8
        object rbtEO_ANTDISTONIA_S: TRadioButton
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
        object rbtEO_ANTDISTONIA_N: TRadioButton
          Left = 50
          Top = 4
          Width = 35
          Height = 9
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
      object edEO_ANTDISTODESDE: TMemo
        Left = 243
        Top = 148
        Width = 524
        Height = 21
        MaxLength = 256
        TabOrder = 9
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTOTRAS: TMemo
        Left = 104
        Top = 247
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 14
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTNODULOS: TMemo
        Left = 104
        Top = 222
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 13
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTPOLIPOS: TMemo
        Left = 104
        Top = 197
        Width = 663
        Height = 21
        MaxLength = 256
        TabOrder = 12
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTLARINGDESDE: TMemo
        Left = 243
        Top = 172
        Width = 524
        Height = 21
        MaxLength = 256
        TabOrder = 11
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTCARACSUBVOZ: TMemo
        Left = 187
        Top = 272
        Width = 382
        Height = 21
        MaxLength = 256
        TabOrder = 15
        WantReturns = False
        WordWrap = False
      end
      object edEO_ANTOTROS: TEdit
        Left = 104
        Top = 124
        Width = 663
        Height = 21
        TabOrder = 7
      end
      object Panel13: TPanel
        Left = 618
        Top = 272
        Width = 101
        Height = 21
        BevelOuter = bvNone
        TabOrder = 16
        TabStop = True
        object rbtEO_NORMAL_S: TRadioButton
          Left = 6
          Top = 2
          Width = 34
          Height = 17
          Alignment = taLeftJustify
          Caption = 'SI'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbtEO_NORMAL_SClick
          OnExit = rbtEO_NORMAL_SClick
        end
        object rbtEO_NORMAL_A: TRadioButton
          Left = 57
          Top = 2
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
          TabStop = True
          OnClick = rbtEO_NORMAL_SClick
        end
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 401
      Width = 772
      Height = 135
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 4
      object Label38: TLabel
        Left = 9
        Top = 11
        Width = 151
        Height = 13
        Caption = 'Aspecto anat'#243'mico de la laringe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 9
        Top = 51
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
      object Label33: TLabel
        Left = 9
        Top = 91
        Width = 124
        Height = 13
        Caption = 'Diagn'#243'stico y sugerencias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edEO_EXAASPECTOLARINGE: TMemo
        Left = 172
        Top = 12
        Width = 593
        Height = 33
        MaxLength = 256
        TabOrder = 0
      end
      object edEO_EXAOBSERV: TMemo
        Left = 172
        Top = 52
        Width = 593
        Height = 33
        TabStop = False
        MaxLength = 256
        TabOrder = 1
      end
      object edEO_DIAGSUG: TMemo
        Left = 172
        Top = 92
        Width = 593
        Height = 33
        TabStop = False
        MaxLength = 256
        TabOrder = 2
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT  *'
      '  FROM  art.aeo_estorl'
      ' WHERE  eo_aetid = :aetid')
    Left = 700
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'aetid'
        ParamType = ptInput
      end>
  end
end
