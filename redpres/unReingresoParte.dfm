object frmReingresoParte: TfrmReingresoParte
  Left = 320
  Top = 135
  Width = 571
  Height = 327
  BorderIcons = [biSystemMenu]
  Caption = 'Correcci'#243'n de Partes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel
    Left = 8
    Top = 261
    Width = 549
    Height = 2
    Shape = bsTopLine
  end
  object bSeparador1: TBevel
    Left = 8
    Top = 91
    Width = 549
    Height = 2
    Shape = bsTopLine
  end
  object bSeparador2: TBevel
    Left = 8
    Top = 131
    Width = 549
    Height = 2
    Shape = bsTopLine
  end
  object lFechaEvento: TLabel
    Left = 209
    Top = 209
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object bSeparador3: TBevel
    Left = 8
    Top = 197
    Width = 549
    Height = 2
    Shape = bsTopLine
  end
  object lSiniestro: TLabel
    Left = 12
    Top = 209
    Width = 40
    Height = 13
    Caption = 'Siniestro'
  end
  object lDiagnostico: TLabel
    Left = 12
    Top = 239
    Width = 56
    Height = 13
    Caption = 'Diagn'#243'stico'
  end
  object lObservaciones: TLabel
    Left = 10
    Top = 44
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object lRegistroOriginal: TLabel
    Left = 10
    Top = 17
    Width = 80
    Height = 13
    Caption = 'Registro Original:'
  end
  object sbtnBuscar: TSpeedButton
    Left = 180
    Top = 206
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
  object Label1: TLabel
    Left = 12
    Top = 104
    Width = 51
    Height = 13
    Caption = 'Trabajador'
  end
  object btnAceptar: TButton
    Left = 403
    Top = 268
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 7
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 481
    Top = 268
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 8
  end
  inline fraCUIL: TfraTrabajador
    Left = 72
    Top = 101
    Width = 483
    Height = 21
    TabOrder = 0
    inherited mskCUIL: TMaskEdit
      Left = 2
    end
    inherited cmbNombre: TArtComboBox
      Width = 400
    end
  end
  object edFEC_SINI: TDateEditor
    Left = 247
    Top = 205
    Width = 65
    Height = 21
    TabOrder = 3
  end
  inline fraPRESTADOR: TfraPrestador
    Left = 8
    Top = 138
    Width = 549
    Height = 50
    VertScrollBar.Range = 49
    AutoScroll = False
    TabOrder = 1
    inherited lbCUIT: TLabel
      Left = 2
      Width = 45
      Caption = 'Prestador'
    end
    inherited lbSec: TLabel
      Left = 148
    end
    inherited lbIdentif: TLabel
      Left = 220
    end
    inherited lbRSocial: TLabel
      Left = 306
    end
    inherited lbDomicilio: TLabel
      Left = 2
    end
    inherited lbCPostal: TLabel
      Left = 470
    end
    inherited mskPrestCUIT: TMaskEdit
      Left = 64
    end
    inherited cmbPrestador: TArtComboBox
      Left = 352
      Width = 196
    end
    inherited edPresDomicilio: TEdit
      Left = 64
      Width = 241
    end
    inherited edPresLocalidad: TEdit
      Width = 95
    end
    inherited edPresCPostal: TEdit
      Left = 494
    end
    inherited edPrestIdentif: TIntEdit
      Left = 256
    end
    inherited edPrestSecuencia: TIntEdit
      Left = 172
    end
  end
  object edDIAGNOSTICO: TEdit
    Left = 72
    Top = 235
    Width = 483
    Height = 21
    TabOrder = 4
  end
  object edSINIESTRO: TSinEdit
    Left = 72
    Top = 205
    Width = 100
    Height = 21
    TabOrder = 2
    Separator = '/'
  end
  object edtRegistroOriginal: TEdit
    Left = 96
    Top = 13
    Width = 459
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtObservaciones: TEdit
    Left = 8
    Top = 60
    Width = 547
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 6
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Left = 312
    Top = 36
  end
end