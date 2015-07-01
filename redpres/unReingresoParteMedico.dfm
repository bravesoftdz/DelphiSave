object frmReingresoParteMedico: TfrmReingresoParteMedico
  Left = 198
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 367
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    689
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel
    Left = 3
    Top = 326
    Width = 681
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label48: TLabel
    Left = 7
    Top = 340
    Width = 33
    Height = 13
    Caption = 'Acci'#243'n'
  end
  object btnAceptar: TButton
    Left = 530
    Top = 335
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 608
    Top = 335
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object pcParte: TPageControl
    Left = 1
    Top = 0
    Width = 686
    Height = 321
    ActivePage = tbGeneral
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tbGeneral: TTabSheet
      Caption = 'General'
      DesignSize = (
        678
        293)
      object bSeparador1: TBevel
        Left = 1
        Top = 275
        Width = 671
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object bSeparador2: TBevel
        Left = 1
        Top = 131
        Width = 671
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object lFechaEvento: TLabel
        Left = 204
        Top = 225
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object bSeparador3: TBevel
        Left = 1
        Top = 210
        Width = 671
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object lSiniestro: TLabel
        Left = 7
        Top = 225
        Width = 40
        Height = 13
        Caption = 'Siniestro'
      end
      object lObservaciones: TLabel
        Left = 5
        Top = 4
        Width = 134
        Height = 13
        Caption = 'Observaciones Encontradas'
      end
      object sbtnBuscar: TSpeedButton
        Left = 162
        Top = 222
        Width = 23
        Height = 22
        Hint = 'Buscar Siniestro'
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
        OnClick = sbtnBuscarClick
      end
      object Label45: TLabel
        Left = 321
        Top = 225
        Width = 79
        Height = 13
        Caption = 'Tipo de Siniestro'
      end
      object Label46: TLabel
        Left = 316
        Top = 249
        Width = 88
        Height = 13
        Caption = 'Info. Adicional Sin.'
      end
      object Label49: TLabel
        Left = 3
        Top = 148
        Width = 51
        Height = 13
        Caption = 'Trabajador'
      end
      object Label50: TLabel
        Left = 4
        Top = 184
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      inline fraCUIL: TfraTrabajador
        Left = 60
        Top = 143
        Width = 614
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbNombre: TArtComboBox
          Width = 530
        end
      end
      object edFEC_SINI: TDateEditor
        Left = 242
        Top = 221
        Width = 65
        Height = 21
        TabOrder = 4
      end
      object edSINIESTRO: TSinEdit
        Left = 54
        Top = 221
        Width = 101
        Height = 21
        TabOrder = 3
        Separator = '/'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 60
        Top = 180
        Width = 613
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
        TabOrder = 2
        inherited lbContrato: TLabel
          Left = 509
        end
        inherited edContrato: TIntEdit
          Left = 554
        end
        inherited cmbRSocial: TArtComboBox
          Left = 128
          Width = 377
        end
      end
      inline fraTipoSiniestro: TfraCtbTablas
        Left = 405
        Top = 220
        Width = 264
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        inherited cmbDescripcion: TArtComboBox
          Width = 211
        end
      end
      object edObservacionesEncontradas: TJvDotNetRichEdit
        Left = 2
        Top = 23
        Width = 668
        Height = 103
        Anchors = [akLeft, akTop, akRight]
        Color = 16510691
        ReadOnly = True
        TabOrder = 0
      end
      object edTipoSiniestroInfoAdic: TEdit
        Left = 406
        Top = 246
        Width = 261
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInactiveCaptionText
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object tbDatosParte: TTabSheet
      Caption = 'Datos del Parte'
      ImageIndex = 1
      DesignSize = (
        678
        293)
      object Label1: TLabel
        Left = 5
        Top = 15
        Width = 63
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Raz'#243'n Social'
      end
      object Label2: TLabel
        Left = 5
        Top = 38
        Width = 85
        Height = 13
        Caption = 'F. Accidente Orig.'
      end
      object Label3: TLabel
        Left = 163
        Top = 38
        Width = 131
        Height = 13
        Caption = 'Fecha Primer Manifestaci'#243'n'
      end
      object Label4: TLabel
        Left = 368
        Top = 38
        Width = 89
        Height = 13
        Caption = 'Tiempo Exposici'#243'n'
      end
      object Label5: TLabel
        Left = 5
        Top = 59
        Width = 86
        Height = 13
        Caption = 'Diagn'#243'stico Inicial'
      end
      object Label6: TLabel
        Left = 5
        Top = 96
        Width = 74
        Height = 13
        Caption = 'Hora Accidente'
      end
      object lbCIE10: TLabel
        Left = 365
        Top = 200
        Width = 32
        Height = 13
        Caption = 'CIE-10'
      end
      object Label7: TLabel
        Left = 5
        Top = 116
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Label8: TLabel
        Left = 517
        Top = 38
        Width = 84
        Height = 13
        Caption = 'Presupone Incap.'
      end
      object Label9: TLabel
        Left = 5
        Top = 154
        Width = 80
        Height = 13
        Caption = 'Forma Accidente'
      end
      object Label10: TLabel
        Left = 331
        Top = 153
        Width = 70
        Height = 13
        Caption = 'P. Cuerpo Les.'
      end
      object Label11: TLabel
        Left = 5
        Top = 177
        Width = 85
        Height = 13
        Caption = 'Naturaleza Lesi'#243'n'
      end
      object Label12: TLabel
        Left = 333
        Top = 176
        Width = 64
        Height = 13
        Caption = 'Ag. Causante'
      end
      object Label13: TLabel
        Left = 5
        Top = 200
        Width = 71
        Height = 13
        Caption = 'Tipo Gravedad'
      end
      object Label14: TLabel
        Left = 5
        Top = 223
        Width = 83
        Height = 13
        Caption = 'Lugar Internaci'#243'n'
      end
      object Label15: TLabel
        Left = 5
        Top = 246
        Width = 86
        Height = 13
        Caption = 'Lugar Tratamiento'
      end
      object Label16: TLabel
        Left = 133
        Top = 96
        Width = 86
        Height = 13
        Caption = 'Fecha Internaci'#243'n'
      end
      object Label17: TLabel
        Left = 293
        Top = 96
        Width = 59
        Height = 13
        Caption = 'Baja M'#233'dica'
      end
      object Label18: TLabel
        Left = 410
        Top = 96
        Width = 88
        Height = 13
        Caption = 'D'#237'as Previsto Baja'
      end
      object Label19: TLabel
        Left = 5
        Top = 269
        Width = 87
        Height = 13
        Caption = 'Fecha Reconsulta'
      end
      object Label20: TLabel
        Left = 165
        Top = 269
        Width = 88
        Height = 13
        Caption = 'F. Reinicio Laboral'
      end
      object Label21: TLabel
        Left = 333
        Top = 269
        Width = 35
        Height = 13
        Caption = 'M'#233'dico'
      end
      object lblFechaEgreso: TLabel
        Left = 555
        Top = 96
        Width = 45
        Height = 13
        Caption = 'F. Egreso'
      end
      object lblRecalificacion: TLabel
        Left = 581
        Top = 269
        Width = 36
        Height = 13
        Caption = 'Recalif.'
      end
      object edRazonSocial: TEdit
        Left = 94
        Top = 11
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInactiveCaptionText
        ReadOnly = True
        TabOrder = 0
      end
      object edFechaAccidenteOriginal: TDateEditor
        Left = 94
        Top = 34
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object edFechaPrimerManifestacion: TDateEditor
        Left = 297
        Top = 34
        Width = 65
        Height = 21
        TabOrder = 2
      end
      object edDiagnosticoInicial: TRichEdit
        Left = 94
        Top = 57
        Width = 575
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 5
      end
      object edObservaciones: TRichEdit
        Left = 94
        Top = 115
        Width = 575
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 11
      end
      inline fraForma: TfraCtbTablas
        Left = 93
        Top = 149
        Width = 236
        Height = 23
        TabOrder = 12
        inherited cmbDescripcion: TArtComboBox
          Width = 183
        end
      end
      inline fraParteCuerpoLesionada: TfraCtbTablas
        Left = 402
        Top = 148
        Width = 270
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 13
        inherited cmbDescripcion: TArtComboBox
          Width = 217
        end
      end
      inline fraNaturaleza: TfraCtbTablas
        Left = 93
        Top = 172
        Width = 236
        Height = 23
        TabOrder = 14
        inherited cmbDescripcion: TArtComboBox
          Width = 183
        end
      end
      inline fraAgenteCausante: TfraCtbTablas
        Left = 402
        Top = 171
        Width = 270
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
        inherited cmbDescripcion: TArtComboBox
          Width = 217
        end
      end
      inline fraTipoGravedad: TfraCtbTablas
        Left = 93
        Top = 195
        Width = 236
        Height = 23
        TabOrder = 16
        inherited cmbDescripcion: TArtComboBox
          Width = 183
        end
      end
      inline fraLugarInterna: TfraCtbTablas
        Left = 93
        Top = 218
        Width = 236
        Height = 23
        TabOrder = 18
        inherited cmbDescripcion: TArtComboBox
          Width = 183
        end
      end
      object edLugarInternacion: TEdit
        Left = 336
        Top = 219
        Width = 332
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 19
      end
      inline fraLugarTratamiento: TfraCtbTablas
        Left = 93
        Top = 241
        Width = 236
        Height = 23
        TabOrder = 20
        inherited cmbDescripcion: TArtComboBox
          Width = 183
        end
      end
      object edLugarTratamiento: TEdit
        Left = 336
        Top = 242
        Width = 332
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 21
      end
      inline fraCIE10: TfraCodigoDescripcion
        Left = 402
        Top = 193
        Width = 270
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 17
        inherited cmbDescripcion: TArtComboBox
          Left = 52
          Width = 217
          CharCase = ecUpperCase
        end
        inherited edCodigo: TPatternEdit
          Width = 48
        end
      end
      object edFechaInternacion: TDateEditor
        Left = 224
        Top = 92
        Width = 65
        Height = 21
        TabOrder = 7
      end
      object edFechaReconsulta: TDateEditor
        Left = 94
        Top = 265
        Width = 65
        Height = 21
        TabOrder = 22
      end
      object edFechaReinicioLaboral: TDateEditor
        Left = 259
        Top = 265
        Width = 65
        Height = 21
        TabOrder = 23
      end
      object edMedico: TEdit
        Left = 374
        Top = 265
        Width = 203
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 24
      end
      object edHoraAccidente: TTimeEditor
        Left = 94
        Top = 92
        Width = 35
        Height = 21
        TabOrder = 6
      end
      object edTiempoExposicion: TPatternEdit
        Left = 462
        Top = 34
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 3
        Pattern = '1234567890'
      end
      object edDiasPrevistoBaja: TPatternEdit
        Left = 501
        Top = 92
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 9
        Pattern = '1234567890'
      end
      object cbBajaMedica: TExComboBox
        Left = 356
        Top = 92
        Width = 49
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 8
        Items.Strings = (
          '1=Si'
          '0=No')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
      object cbPresuponeIncapacidad: TExComboBox
        Left = 604
        Top = 33
        Width = 65
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 4
        Items.Strings = (
          '1=Si'
          '0=No')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
      object edFechaEgreso: TDateEditor
        Left = 603
        Top = 92
        Width = 65
        Height = 21
        TabOrder = 10
      end
      object cbRecalificacion: TExComboBox
        Left = 621
        Top = 265
        Width = 49
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 25
        Items.Strings = (
          '1=Si'
          '0=No')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
    end
    object tbLugarSiniestro: TTabSheet
      Caption = 'Lugar del Siniestro'
      ImageIndex = 2
      DesignSize = (
        678
        293)
      object Label22: TLabel
        Left = 18
        Top = 13
        Width = 27
        Height = 13
        Caption = 'Lugar'
      end
      object Label23: TLabel
        Left = 18
        Top = 35
        Width = 42
        Height = 13
        Caption = 'Tel'#233'fono'
      end
      object Label24: TLabel
        Left = 18
        Top = 57
        Width = 23
        Height = 13
        Caption = 'Calle'
      end
      object Label25: TLabel
        Left = 18
        Top = 79
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label26: TLabel
        Left = 18
        Top = 101
        Width = 20
        Height = 13
        Caption = 'Piso'
      end
      object Label27: TLabel
        Left = 18
        Top = 123
        Width = 67
        Height = 13
        Caption = 'Departamento'
      end
      object Label28: TLabel
        Left = 18
        Top = 145
        Width = 46
        Height = 13
        Caption = 'Localidad'
      end
      object Label29: TLabel
        Left = 18
        Top = 167
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
      end
      object Label30: TLabel
        Left = 18
        Top = 189
        Width = 44
        Height = 13
        Caption = 'Provincia'
      end
      object Label31: TLabel
        Left = 18
        Top = 210
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object edLugarSiniestro: TEdit
        Left = 89
        Top = 9
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 150
        TabOrder = 0
      end
      object edTelefonoSiniestro: TEdit
        Left = 89
        Top = 31
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 1
      end
      object edCalleSiniestro: TEdit
        Left = 89
        Top = 53
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 2
      end
      object edNumeroSiniestro: TEdit
        Left = 89
        Top = 75
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 3
      end
      object edPisoSiniestro: TEdit
        Left = 89
        Top = 97
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 4
      end
      object edDeptoSiniestro: TEdit
        Left = 89
        Top = 119
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 5
      end
      object edLocalidadSiniestro: TEdit
        Left = 89
        Top = 141
        Width = 575
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 6
      end
      object edCodigoPostalSiniestro: TPatternEdit
        Left = 89
        Top = 163
        Width = 107
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 7
        Pattern = '1234567890'
      end
      inline fraProvinciaSiniestro: TfraCodigoDescripcion
        Left = 88
        Top = 184
        Width = 577
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        inherited cmbDescripcion: TArtComboBox
          Width = 512
        end
      end
      inline fraPaisSiniestro: TfraCodigoDescripcion
        Left = 88
        Top = 206
        Width = 577
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        inherited cmbDescripcion: TArtComboBox
          Width = 512
        end
      end
    end
    object tbDatosTrabajador: TTabSheet
      Caption = 'Datos Trabajador'
      ImageIndex = 3
      DesignSize = (
        678
        293)
      object Label32: TLabel
        Left = 6
        Top = 14
        Width = 79
        Height = 13
        Caption = 'Tipo Documento'
      end
      object Label33: TLabel
        Left = 352
        Top = 13
        Width = 55
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Documento'
      end
      object Label34: TLabel
        Left = 406
        Top = 58
        Width = 42
        Height = 13
        Caption = 'Tel'#233'fono'
      end
      object Label35: TLabel
        Left = 6
        Top = 37
        Width = 79
        Height = 13
        Caption = 'Apellido y Nomb.'
      end
      object Label36: TLabel
        Left = 6
        Top = 58
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label37: TLabel
        Left = 243
        Top = 58
        Width = 86
        Height = 13
        Caption = 'Fecha Nacimiento'
      end
      object Label38: TLabel
        Left = 6
        Top = 107
        Width = 23
        Height = 13
        Caption = 'Calle'
      end
      object Label39: TLabel
        Left = 6
        Top = 129
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label40: TLabel
        Left = 6
        Top = 151
        Width = 20
        Height = 13
        Caption = 'Piso'
      end
      object Label41: TLabel
        Left = 6
        Top = 173
        Width = 67
        Height = 13
        Caption = 'Departamento'
      end
      object Label42: TLabel
        Left = 6
        Top = 195
        Width = 46
        Height = 13
        Caption = 'Localidad'
      end
      object Label43: TLabel
        Left = 6
        Top = 217
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
      end
      object Label44: TLabel
        Left = 6
        Top = 239
        Width = 44
        Height = 13
        Caption = 'Provincia'
      end
      object Label47: TLabel
        Left = 6
        Top = 82
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      inline fraCodigoDocumento: TfraCtbTablas
        Left = 90
        Top = 9
        Width = 251
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 198
        end
      end
      object edTelefonoTrabajador: TEdit
        Left = 454
        Top = 54
        Width = 215
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 30
        TabOrder = 5
      end
      object edDocumento: TPatternEdit
        Left = 413
        Top = 10
        Width = 256
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 11
        TabOrder = 1
        Pattern = '1234567890'
      end
      object edApellidoNombre: TEdit
        Left = 91
        Top = 32
        Width = 578
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 2
      end
      object cbSexo: TExComboBox
        Left = 91
        Top = 54
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 3
        Items.Strings = (
          '0=Femenino'
          '1=Masculino')
        ItemIndex = -1
        Options = []
        ValueWidth = 64
      end
      object edFechaNacimiento: TDateEditor
        Left = 334
        Top = 54
        Width = 65
        Height = 21
        TabOrder = 4
      end
      object edCalleTrabajador: TEdit
        Left = 91
        Top = 103
        Width = 579
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 45
        TabOrder = 7
      end
      object edNumeroTrabajador: TEdit
        Left = 91
        Top = 125
        Width = 579
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 8
      end
      object edPisoTrabajador: TEdit
        Left = 91
        Top = 147
        Width = 579
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 9
      end
      object edDeptoTrabajador: TEdit
        Left = 91
        Top = 169
        Width = 579
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 10
      end
      object edLocalidadTrabajador: TEdit
        Left = 91
        Top = 191
        Width = 579
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 11
      end
      object edCodigoPostalTrabajador: TPatternEdit
        Left = 91
        Top = 213
        Width = 107
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 12
        Pattern = '1234567890'
      end
      inline fraProvinciaTrabajador: TfraCodigoDescripcion
        Left = 90
        Top = 234
        Width = 579
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 13
        inherited cmbDescripcion: TArtComboBox
          Width = 514
        end
      end
      inline fraEstadoCivil: TfraCtbTablas
        Left = 90
        Top = 76
        Width = 583
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        inherited cmbDescripcion: TArtComboBox
          Width = 530
        end
      end
    end
  end
  inline fraAccion: TfraStaticCTB_TABLAS
    Left = 48
    Top = 335
    Width = 294
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    inherited edCodigo: TPatternEdit
      Width = 65
    end
    inherited cmbDescripcion: TComboGrid
      Left = 68
      Width = 225
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
end
