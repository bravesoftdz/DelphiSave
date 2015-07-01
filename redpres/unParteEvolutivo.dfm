object frmParteEvolutivo: TfrmParteEvolutivo
  Left = 535
  Top = 122
  ActiveControl = SinEdit
  Caption = 'Parte Evolutivo'
  ClientHeight = 643
  ClientWidth = 938
  Color = clBtnFace
  Constraints.MinHeight = 468
  Constraints.MinWidth = 796
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 121
    Align = alTop
    TabOrder = 0
    DesignSize = (
      938
      121)
    object grpEmpresa: TGroupBox
      Left = 0
      Top = -1
      Width = 717
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 2
      DesignSize = (
        717
        38)
      inline fraEmpresa: TfraEmpresa
        Left = 2
        Top = 12
        Width = 710
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 12
        ExplicitWidth = 710
        ExplicitHeight = 23
        DesignSize = (
          710
          23)
        inherited lbContrato: TLabel
          Left = 606
          ExplicitLeft = 588
        end
        inherited edContrato: TIntEdit
          Left = 653
          ExplicitLeft = 653
        end
        inherited cmbRSocial: TArtComboBox
          Width = 471
          ExplicitWidth = 471
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 719
      Top = -1
      Width = 218
      Height = 50
      Anchors = [akTop, akRight]
      Caption = 'Diagn'#243'stico del Siniestro'
      TabOrder = 0
      object MemoDiagnosticoSin: TMemo
        Left = 2
        Top = 15
        Width = 214
        Height = 33
        Align = alClient
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
    end
    object grpTrabajador: TGroupBox
      Left = 0
      Top = 37
      Width = 620
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Trabajador'
      TabOrder = 1
      DesignSize = (
        620
        41)
      object ToolBarHistoriaClinica: TToolBar
        Left = 591
        Top = 15
        Width = 27
        Height = 24
        Align = alRight
        EdgeInner = esNone
        EdgeOuter = esRaised
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        TabOrder = 0
        Transparent = False
        object tbHC: TToolButton
          Left = 0
          Top = 0
          Hint = 'Historia cl'#237'nica'
          Caption = 'tbHC'
          ImageIndex = 13
          ParentShowHint = False
          ShowHint = True
          OnClick = tbHCClick
        end
      end
      inline fraTrabajadorSIN: TfraTrabajadorSiniestro
        Left = 3
        Top = 14
        Width = 584
        Height = 111
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 14
        ExplicitWidth = 584
        ExplicitHeight = 111
        DesignSize = (
          584
          111)
        inherited lbSiniestro: TLabel
          Left = 418
          ExplicitLeft = 441
        end
        inherited edSiniestro: TSinEdit [1]
          Left = 483
          ExplicitLeft = 483
        end
        inherited lvSiniestros: TListView [2]
        end
        inherited mskCUIL: TMaskEdit [3]
        end
        inherited ToolBar: TToolBar [4]
          Left = 460
          ExplicitLeft = 460
        end
        inherited cmbNombre: TArtComboBox [5]
          Width = 500
          ExplicitWidth = 500
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010101003C005C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
            0000000000003600000028000000400000001000000001002000000000000010
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000636363006363630000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
            6300000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
            E700636363000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
            A500C6C6C6006363630000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
            C600C6C6C600B5B5B50063636300000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008484
            84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
            C600B5B5B5000063630021212100000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A5A5
            A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
            A500636363003939390000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A5A5
            A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
            6300000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000094949400C6C6
            C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000094949400B5B5B5008484
            8400949494000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000094949400A5A5A500848484009494
            9400000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000008484840084848400949494000000
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
            000000000000000000000000000000000000424D3E000000000000003E000000
            2800000040000000100000000100010000000000800000000000000000000000
            000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
            FC3F000000000000F81F000000000000F80F000000000000F007000000000000
            E003000000000000E001000000000000E001000000000000E003000000000000
            E00F000000000000C03F00000000000087FF0000000000000FFF000000000000
            1FFF000000000000FFFF00000000000000000000000000000000000000000000
            000000000000}
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 719
      Top = 48
      Width = 218
      Height = 50
      Anchors = [akTop, akRight]
      Caption = 'Mecanismo Accidentol'#243'gico'
      TabOrder = 3
      object MemoMecanismoAccid: TMemo
        Left = 2
        Top = 15
        Width = 214
        Height = 33
        Align = alClient
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
    end
    object grpSiniestro: TGroupBox
      Left = 0
      Top = 77
      Width = 717
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Siniestro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      DesignSize = (
        717
        42)
      object blSinFecha: TLabel
        Left = 147
        Top = 18
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object btnSiniMasDatos: TSpeedButton
        Left = 450
        Top = 13
        Width = 11
        Height = 21
        Hint = 'Ver datos del Siniestro'
        Anchors = [akTop, akRight]
        Enabled = False
        Flat = True
        Glyph.Data = {
          0E010000424D0E01000000000000360000002800000007000000090000000100
          180000000000D8000000C40E0000C40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000000000000000FF0000FF0000000000FF
          0000FF0000FF0000000000FF0000000000FF0000FF0000000000FF0000FF0000
          000000FF0000FF0000000000FF0000FF0000000000FF0000000000FF0000FF00
          00FF0000000000FF0000FF0000000000000000FF0000FF0000000000FF0000FF
          0000000000FF0000000000FF0000000000FF0000FF0000000000FF0000FF0000
          000000000000FF0000FF0000000000FF0000FF0000FF0000000000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00000000}
        OnClick = btnSiniMasDatosClick
        ExplicitLeft = 432
      end
      object Label9: TLabel
        Left = 466
        Top = 9
        Width = 23
        Height = 26
        Anchors = [akTop, akRight]
        Caption = 'Ges.'#13#10'Aud.'
        ExplicitLeft = 448
      end
      object edCausaFin: TEdit
        Left = 238
        Top = 13
        Width = 213
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
      end
      object pnlSiniestro: TPanel
        Left = 1
        Top = 13
        Width = 146
        Height = 25
        BevelOuter = bvNone
        TabOrder = 2
        object sbtnBuscar: TSpeedButton
          Left = 103
          Top = 0
          Width = 19
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
        object sbtnSIC: TSpeedButton
          Left = 122
          Top = 0
          Width = 22
          Height = 22
          Hint = 'Buscar Siniestro'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFCFFFFF9FFFFFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEF6F3F1EEE5DD568ED10075E2007BE70079E720
            7AD8A5B8D3FCF3E8F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBF9E3E0E0
            0C72D90F98FF3A9AF06BA9E55EA6E71090FD0F90F56896D1FFF9EEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF2C84E00E95FFA4C1DBF2EBD8EAEADFF1EFE2EA
            E2D12B8FEF0E8EF4C8D9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D9F20D8EF3
            76ADE2F3EEE0E8EBE9F1F4F33F3C37EEF3EFEBE2CF1090FC3289E0FFFFFEFFFF
            FAFFFFFAFFFFF9FFFFFF8CB6E9088BF9D8DBD9EBEEEAFFFFFF52534E9D9E9BF2
            F7F5E8E6D9539DE4198BEC136A9E1676B41575B21275B28EADC192BBEB007EF3
            EBE5D8EEF0EEFFFFFF4C4C483C3D37DADDDBF3F2E75998DA198CF0968A779B9A
            91A39F935D819581AFCD92B9EA118EF4B1C2D5F3F3ECF3F5F3FFFFFFD3D4D23D
            3C35BCB29F378FE72790ECFFFFFFB4B8B5A2A19C5D869E82AFCCFFFFFF0380E9
            277DD8F8EEDAF0F2ECECEFECEFF2EFFFFEF1A3B7CF1195FF618AB8BDB6AEEBEB
            EBD0CECA729BB280ADCAFFFFFF97BAE80F90F42375D2AEBCCBE9E1D2D5D4CE6A
            93C50987F33692E9A29588BBB9B8FBFBFBFFFFFF49728983B0CDFFFFFFFFFFFF
            91B6E8007BE8138DF1097EEA158AF20E8DF34594E4D4CBC69C9A95A8A7A5F5F4
            F5FFFFFF4C748B83B0CDFFFFFFFFFFFFFFFFFFFFFFFE8DB6EB3C84CB2767A4E4
            E9F6E1D8CCEBEBEAEDEDEDECEDEDC8CBCAFFFFFF4D748B83B0CDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF7BAAC64C7080FFFFFF88908EC0C1BEFFFFFFC0C1BE8890
            8EFFFFFF4B718683B0CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A9DBE629CC03D
            677FD2CFC9677E8845718A667D87D3D0CA3F698066A0C479A7C4FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE8F1F5689CBD6AA2C5DAD5CF7693A170A8CB85A0AFCCC7
            C26BA3C6689CBDEDF3F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC8CAC9FCFAF8FFFFFFFBF9F7C9CBCAFFFFFFFFFFFFFFFFFF}
          OnClick = sbtnSICClick
        end
        object SinEdit: TSinEdit
          Left = 2
          Top = 0
          Width = 100
          Height = 21
          TabOrder = 0
          OnSelect = SinEditSelect
        end
      end
      object pnlChecks: TPanel
        Left = 554
        Top = 7
        Width = 160
        Height = 31
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 3
        object chkComMed: TCheckBox
          Left = 0
          Top = 0
          Width = 65
          Height = 17
          Hint = 'Dictamen de comisi'#243'n m'#233'dica'
          Caption = 'Com.med'
          TabOrder = 0
        end
        object chkSRT: TCheckBox
          Left = 0
          Top = 15
          Width = 45
          Height = 17
          Hint = 'Denunciado a SRT'
          Caption = 'SRT'
          TabOrder = 1
        end
        object chkReqSRT: TCheckBox
          Left = 65
          Top = 0
          Width = 41
          Height = 17
          Hint = 'Posee alg'#250'n requerimiento de la SRT'
          Caption = 'Req.'
          TabOrder = 2
        end
        object chkSumario: TCheckBox
          Left = 65
          Top = 14
          Width = 41
          Height = 17
          Hint = 'Sumario'
          Caption = 'Sum.'
          TabOrder = 3
        end
        object chkRemis: TCheckBox
          Left = 110
          Top = 0
          Width = 47
          Height = 17
          Hint = 'Amerita remis'
          Caption = 'Remis'
          TabOrder = 4
        end
        object chkGSueldos: TCheckBox
          Left = 110
          Top = 14
          Width = 52
          Height = 17
          Hint = 'Grandes sueldos'
          Caption = 'G.Suel.'
          TabOrder = 5
        end
      end
      object edSinFecha: TDateEditor
        Left = 177
        Top = 13
        Width = 61
        Height = 21
        Hint = 'Fecha del Siniestro'
        TabStop = False
        BlanksChar = '_'
        Color = clSilver
        ReadOnly = True
        ShowButton = False
        TabOrder = 0
        ParentCtl3D = False
      end
      object edGesAud: TEdit
        Left = 489
        Top = 13
        Width = 62
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clSilver
        ReadOnly = True
        TabOrder = 4
      end
    end
    object grpChecks2: TGroupBox
      Left = 621
      Top = 37
      Width = 94
      Height = 25
      Anchors = [akTop, akRight]
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      object chkPosibleFraude: TCheckBox
        Left = 4
        Top = 6
        Width = 87
        Height = 17
        Hint = 'Posible Fraude'
        Caption = 'Posible fraude'
        TabOrder = 0
      end
    end
    object edPuestoSector: TEdit
      Left = 719
      Top = 99
      Width = 215
      Height = 21
      Hint = 'Tarea (Sector)'
      Anchors = [akTop, akRight]
      Color = clSilver
      ReadOnly = True
      TabOrder = 6
    end
    object Panel3: TPanel
      Left = 621
      Top = 62
      Width = 94
      Height = 20
      Anchors = [akTop, akRight]
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 7
      object chkDEAM: TCheckBox
        Left = 3
        Top = 2
        Width = 48
        Height = 16
        Hint = 'Definici'#243'n de '#193'rea M'#233'dica'
        Caption = 'DEAM'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object pnlBarra: TPanel
    Left = 0
    Top = 121
    Width = 938
    Height = 26
    Align = alTop
    TabOrder = 1
    object tbHerramientas: TToolBar
      Left = 1
      Top = 1
      Width = 936
      Height = 22
      AutoSize = True
      Caption = 'tbHerramientas'
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      TabOrder = 0
      Transparent = True
      DesignSize = (
        936
        22)
      object tbPrimero: TToolButton
        Left = 0
        Top = 0
        Hint = 'Primer Parte (Ctrl+Home)'
        Enabled = False
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = tbPrimeroClick
      end
      object tbAnterior: TToolButton
        Left = 23
        Top = 0
        Hint = 'Parte Anterior (Ctrl+PgDn)'
        Enabled = False
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        OnClick = tbAnteriorClick
      end
      object tbSiguiente: TToolButton
        Left = 46
        Top = 0
        Hint = 'Siguiente Parte (Ctrl+PgUp)'
        Enabled = False
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSiguienteClick
      end
      object tbUltimo: TToolButton
        Left = 69
        Top = 0
        Hint = #218'ltimo Parte (Ctrl+End)'
        Enabled = False
        ImageIndex = 12
        ParentShowHint = False
        ShowHint = True
        OnClick = tbUltimoClick
      end
      object ToolBu5: TToolButton
        Left = 92
        Top = 0
        Width = 7
        Caption = 'tbSeparador3'
        ImageIndex = 9
        Style = tbsSeparator
        OnClick = btnSiniMasDatosClick
      end
      object tbNuevo: TToolButton
        Left = 99
        Top = 0
        Hint = 'Nuevo Parte (Ctrl+N)'
        Caption = 'tbNuevo'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = tbNuevoClick
      end
      object tbGuardar: TToolButton
        Left = 122
        Top = 0
        Hint = 'Guardar (Ctrl+G)'
        Caption = 'unco'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = tbGuardarClick
      end
      object tbEliminar: TToolButton
        Left = 145
        Top = 0
        Hint = 'Invalidar parte evolutivo'
        Caption = 'tbEliminar'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = tbEliminarClick
      end
      object tbDatosBaja: TToolButton
        Left = 168
        Top = 0
        Hint = 'Ver datos modificaci'#243'n'
        Enabled = False
        ImageIndex = 41
        ParentShowHint = False
        ShowHint = True
        OnClick = tbDatosBajaClick
      end
      object tbSep1: TToolButton
        Left = 191
        Top = 0
        Width = 8
        Caption = 'tbSep1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbOrden: TToolButton
        Left = 199
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrden'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdenClick
      end
      object toolb2: TToolButton
        Left = 222
        Top = 0
        Width = 7
        Caption = 'toolb2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 229
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        Caption = 'tbLimpiar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tbLimpiarClick
      end
      object tbRefrescar: TToolButton
        Left = 252
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'Refrescar'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = False
        OnClick = tbRefrescarClick
      end
      object ToolB1: TToolButton
        Left = 275
        Top = 0
        Width = 7
        Caption = 'ToolB1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbTrabajador: TToolButton
        Left = 282
        Top = 0
        Hint = 'Datos trabajador'
        Caption = 'tbTrabajador'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = tbTrabajadorClick
      end
      object tbSep2: TToolButton
        Left = 305
        Top = 0
        Width = 8
        Caption = 'tbSep2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 313
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        DropdownMenu = pmnuImprimir
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbImprimirClick
      end
      object tbSep5: TToolButton
        Left = 351
        Top = 0
        Width = 6
        Caption = 'tbSep5'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbViajar: TToolButton
        Left = 357
        Top = 0
        Hint = 'Viajar...'
        Caption = 'tbViajar'
        DropdownMenu = pMenuViajar
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbViajarClick
      end
      object ToolBu3: TToolButton
        Left = 395
        Top = 0
        Width = 7
        Caption = 'ToolBu3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbPedInfo: TToolButton
        Left = 402
        Top = 0
        Hint = 'Ver Pedido de Informaci'#243'n'
        Caption = 'tbPedInfo'
        ImageIndex = 24
        ParentShowHint = False
        ShowHint = True
        OnClick = tbPedInfoClick
      end
      object TbEnvTlgCart: TToolButton
        Left = 425
        Top = 0
        Hint = 'Centro de Notificaciones > Telegramas - Cartas - SMS'
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
        OnClick = TbEnvTlgCartClick
      end
      object tbCostos: TToolButton
        Left = 448
        Top = 0
        Hint = 'Ver costos del Siniestro...'
        Caption = 'tbCostos'
        ImageIndex = 28
        ParentShowHint = False
        ShowHint = True
        OnClick = tbCostosClick
      end
      object tbEvaluacion: TToolButton
        Left = 471
        Top = 0
        Hint = 'Evaluaci'#243'n m'#233'dica (Ctrl+A)'
        Caption = 'tbEvaluacion'
        ImageIndex = 40
        ParentShowHint = False
        ShowHint = True
        OnClick = tbEvaluacionClick
      end
      object tbAmeritaRemis: TToolButton
        Left = 494
        Top = 0
        Hint = 'Amerita remis'
        Caption = 'tbAmeritaRemis'
        ImageIndex = 42
        ParentShowHint = False
        ShowHint = True
        OnClick = tbAmeritaRemisClick
      end
      object tbObsSupMed: TToolButton
        Left = 517
        Top = 0
        Hint = 'Observaciones'
        Caption = 'Observaciones'
        DropdownMenu = pMenuObs
        ImageIndex = 15
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbObsSupMedClick
      end
      object tbResumenSum: TToolButton
        Left = 555
        Top = 0
        Hint = 'Resumen sumarizado por tipo de prestaci'#243'n otorgada'
        Caption = 'Resumen sumarizado'
        ImageIndex = 47
        ParentShowHint = False
        ShowHint = True
        OnClick = tbResumenSumClick
      end
      object tbSuspension: TToolButton
        Left = 578
        Top = 0
        Hint = 'Decisi'#243'n m'#233'dica'
        Caption = 'tbSuspension'
        ImageIndex = 43
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSuspensionClick
      end
      object tbSIC: TToolButton
        Left = 601
        Top = 0
        Hint = 'SIC - Agenda de Eventos'
        ImageIndex = 38
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSICClick
      end
      object ToolBu4: TToolButton
        Left = 624
        Top = 0
        Width = 7
        Caption = 'ToolBu4'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 631
        Top = 0
        Hint = 'Salir  (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSalirClick
      end
      object lbOperacion: TPanel
        Left = 654
        Top = 0
        Width = 15
        Height = 22
        Hint = 'Estado de la Operaci'#243'n'
        Anchors = [akTop, akRight]
        BevelOuter = bvLowered
        Caption = 'Inactivo'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Locked = True
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 938
    Height = 496
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      938
      496)
    object lbParte: TLabel
      Left = 1
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Parte N'#186
    end
    object lbFechaControl: TLabel
      Left = 103
      Top = 16
      Width = 45
      Height = 13
      Caption = 'F.Control'
    end
    object lbFechaProxControl: TLabel
      Left = 243
      Top = 8
      Width = 36
      Height = 26
      Caption = 'F.Prox.'#13#10'Control'
    end
    object lbDiagnostico: TLabel
      Left = 3
      Top = 85
      Width = 55
      Height = 13
      Caption = 'Diagn'#243'stico'
    end
    object lbCIE10: TLabel
      Left = 4
      Top = 113
      Width = 33
      Height = 13
      Caption = 'CIE-10'
    end
    object lbTipoTratam: TLabel
      Left = 4
      Top = 135
      Width = 47
      Height = 13
      Caption = 'Tipo Trat.'
    end
    object lblAuditor: TLabel
      Left = 420
      Top = 136
      Width = 35
      Height = 13
      Caption = 'Auditor'
    end
    object lbInterDesde: TLabel
      Left = 5
      Top = 210
      Width = 50
      Height = 13
      Caption = 'Int. desde'
    end
    object lbInterHasta: TLabel
      Left = 165
      Top = 178
      Width = 27
      Height = 13
      Caption = 'hasta'
    end
    object lbSitioInternac: TLabel
      Left = 3
      Top = 185
      Width = 57
      Height = 13
      Caption = 'Sitio Intern.'
    end
    object lbMedico: TLabel
      Left = 423
      Top = 185
      Width = 33
      Height = 13
      Caption = 'M'#233'dico'
    end
    object lbRecibido: TLabel
      Left = 637
      Top = 211
      Width = 40
      Height = 13
      Caption = 'Recibido'
    end
    object lbObservaciones: TLabel
      Left = 6
      Top = 235
      Width = 23
      Height = 13
      Caption = 'Obs.'
    end
    object lbltipo: TLabel
      Left = 4
      Top = 161
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object lblAuto: TLabel
      Left = 639
      Top = 185
      Width = 38
      Height = 13
      Caption = 'Autoriz.'
    end
    object btnAutorizacion: TSpeedButton
      Left = 751
      Top = 181
      Width = 21
      Height = 20
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
      OnClick = btnAutorizacionClick
    end
    object lblGTRAb: TLabel
      Left = 629
      Top = 161
      Width = 49
      Height = 13
      Caption = 'G.deTrab.'
    end
    object lbldelegacion: TLabel
      Left = 404
      Top = 160
      Width = 52
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    object lblTurno: TLabel
      Left = 560
      Top = 211
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object Label1: TLabel
      Left = 428
      Top = 211
      Width = 28
      Height = 13
      Caption = 'Turno'
    end
    object Bevel5: TBevel
      Left = 597
      Top = 2
      Width = 0
      Height = 30
    end
    object Label2: TLabel
      Left = 396
      Top = 112
      Width = 59
      Height = 13
      Caption = 'Grav. CIE10'
    end
    object btnAgregarObs: TSpeedButton
      Left = 34
      Top = 231
      Width = 21
      Height = 21
      Hint = 'Agregar observaciones...'
      Enabled = False
      Flat = True
      Glyph.Data = {
        B6090000424DB60900000000000036000000280000002A000000130000000100
        18000000000080090000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000000000000000000000000000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000000000000000000000000000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000000080800080800080800080800000000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000000080808080808080808080808000000000FF000000000000000000
        00FF0000FF0000FF0000FF0000000000000000000000000000000000000000FF
        0000FF0000000000000080800080800080800080800000000000000000000000
        FF0000FF0000FF0000FF0000000000000000000000000000000000000000FF00
        00FF000000000000008080808080808080808080800000000000000000FF00FF
        000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000C0C0C0C0C0C000000080800080800080800000000000000080808000
        0000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
        000000C0C0C0C0C0C0000000808080808080808080000000000000FF00000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C000000080800080800000000000FF0000000080
        8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000808080808080000000000000FF0000FF00
        000000000000000000000000000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC0C0C000000080800080800000000000FF0000FF0000
        0000808080000000000000000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC0C0C0000000808080808080000000000000FF0000FF00
        000000000000FF00FF00000000FF00000000C0C0C0C0C0C0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00000080800080800000000000FF0000FF0000
        000000000080808000000000FF00000000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000808080808080000000000000FF0000FF00
        000000C0C0C0000000FF00FF000000000000C0C0C0C0C0C0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00000080800080800000000000FF0000FF0000
        0000C0C0C0000000808080000000000000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000808080808080000000000000FF0000FF00
        000000FFFFFFC0C0C0000000FF00FF000000C0C0C0C0C0C0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000FF0000FF0000FF0000
        0000FFFFFFC0C0C0000000808080000000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000000000000000000000FF00000000FF0000FF00
        00FF00000000FFFFFFC0C0C0000000FF00FF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF00000000FFFFFFC0C0C0000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00000000000000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF00000000FFFFFFC0C0C0000000FF00FF000000FFFFFFFFFFFFFFFF
        FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00000000FFFFFFC0C0C0000000808080000000FFFFFFFFFFFFFFFFFF
        00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF00000000FFFFFFFFFFFF000000FF00FF0000000000000000
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF00000000FFFFFFFFFFFF000000808080000000000000000000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF00000000000000000000000000FF00FF00000000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000000000000000000000000080808000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF00FF0000
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000808080000000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF00
        FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000808080
        00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        00FF00FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000
        80808000000000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00000000FF00FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00000080808000000000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF00000000FF00FF00000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000000080808000000000FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000000000000000FF0000FF0000FF0000FF000000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAgregarObsClick
    end
    object btnObsAud: TSpeedButton
      Left = 34
      Top = 260
      Width = 21
      Height = 21
      Hint = 'Observaciones del auditor...'
      Enabled = False
      Flat = True
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
        00DDDD0000000000000DDD000000D8777777777770DDDD8777777777770DDD00
        0000D8F7CCFCCCCF70DDDD8F788F8888F70DDD000000D8FFFF7F7F7F70DDDD8F
        FFF7F7F7F70DDD000000D8FFCCFCCCCF70DDDD8FF88F8888F70DDD000000D8F7
        FF7F7F7F70DDDD8F7FF7F7F7F70DDD000000D8FFCCFCCCCF70DDDD8FF77F7777
        F70DDD000000D8FF7F7F7F7F70DDDD8FF7F7F7F7F70DDD000000D8F777F77077
        70DDDD8F777F7707770DDD000000D8F007F7070770DDDD8F007F7070770DDD00
        0000D8F8F070737000000D8F87070787000000000000D8FF8F073738880CCD8F
        F8707878888088000000D88888F07377788EED8888870787778877000000DDDD
        DD8F0FF7777EEDDDDDD870FF777777000000DDDDDDD8FFFFFF877DDDDDDD8FFF
        FFF877000000DDDDDDDD888888FCCDDDDDDDD888888F88000000}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnObsAudClick
    end
    object Bevel3: TBevel
      Left = 517
      Top = 2
      Width = 0
      Height = 29
    end
    object Label10: TLabel
      Left = 397
      Top = 85
      Width = 61
      Height = 13
      Caption = 'Prest.p/Dict.'
    end
    object Label14: TLabel
      Left = 375
      Top = 8
      Width = 41
      Height = 26
      Caption = 'Hr.Prox.'#13#10'Control'
    end
    object btnPrimerRangoInternacion: TSpeedButton
      Left = 305
      Top = 206
      Width = 23
      Height = 22
      Hint = 'Ver rangos de internaci'#243'n'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFD0A4343FDFD0A0A0AFDFDFDFDFDFDFDFD0A4343FDFD140A0AFDFDFDFDFDFD
        0A4307FF070A0A4A740AFDFDFDFDFDFD0A4307FF070A14EBEC0AFDFDFDFD0A43
        07FFFFFFFF0A4A991A0AFDFDFDFD0A4307FFFFFFFF14EB07EF14FDFD0A4307FF
        FFFFDDE60A4A741A0AFDFDFD0A4307FFFFFFBC9214EBF70714FDFDFDECFFFFFF
        DDE6DD0A4A741A0AFDFDFDFDECFFFFFFBC92BC14EBF7EF14FDFDFDFD0AFFDDE6
        DDE60A4A74990A0AFDFDFDFD0AFFBC92BC9214EBF7EF140AFDFDFD43F10A0A0A
        0A0A74521A0AFF43FDFDFD43F11414141414ECF7EF14FF43FDFD0AFF0AB9E1B9
        B90A0A520AE6DD070AFD0AFF14BCF007071414EC1492BC070AFDFF0AB9E1E1B9
        B9B90A0ADDE6E6FF43FDFD14BCF0F00707071414BC9292FF43FD0AE2FF19E1BA
        B9B9B90AE6DDE6DD070A14BCF4F2F0070707071492BC92BC070A0AE11919E1BA
        B9B9B90ADDDDFFFFFF4314F0F2F2F00707070714BCBCFFFFFF430AE1E1E1DBB9
        B9B3B30AFFFFFFFF074314F0F0F0070707F7F714FFFFFFFF07430ADFDCDCDBB9
        B990B30AEDF107430AFD1407BCBC070707ECF714EDF107430AFDFD0ABABAB9B9
        B9900AF1EF0F6D0AFDFDFD14EFEF070707EC14F1EF0F6D0AFDFDFDFD0AB9B9B3
        B30AECECEC430AFDFDFDFDFD140707EDED14ECECEC430AFDFDFDFDFDFD0A0A0A
        0A0A0A0A0A0AFDFDFDFDFDFDFD141414140A0A0A0A0AFDFDFDFD}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPrimerRangoInternacionClick
    end
    object btnDatosInca: TSpeedButton
      Left = 910
      Top = 105
      Width = 23
      Height = 23
      Hint = 'Datos incapacidad...'
      Anchors = [akTop, akRight]
      Enabled = False
      Flat = True
      Glyph.Data = {
        6A090000424D6A09000000000000360000002800000029000000130000000100
        1800000000003409000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D400007B00007B00007B00007B00007B00007BD4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D400007BFFFFFFD4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4A996CDA996CDA996CDA996CDA996CDA996CDD4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4A996CDFFFFFF00FFFFFFD4D4D4D4D4D4D4D4D4D4D4
        D400007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D400007BD4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D400007B00007BFFFFFFD4D4D4D4D4D4D4D4D4D4D4D400007B
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D400007BD4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4A996CDA996CDFFFFFF00FFFFFFD4D4D4D4D4D4D4D4D400007BD4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D400007BD4D4D4D4D4D4D4D4
        D400007B00007B00007BFFFFFFD4D4D4D4D4D4D4D4D400007BD4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4A996CDD4D4D4D4D4D4D4D4D4A996CD
        A996CDA996CDFFFFFF00FFFFFFD4D4D4D4D4D400007BD4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D400007B00007B00007B00007B00007B00007B00007B00007B00007B
        00007BD4D4D4FFFFFFD4D4D4D4D4D4A996CDD4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4A996CDA996CDA996CDA996CDA996CDA996CDA996CDA996CDA996CDA996CDD4
        D4D4FFFFFF00FFFFFFD4D4D4D4D4D400007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D400007B00007B00007B00007B00007B00007B00007B00007B00007BD4D4D4D4
        D4D4FFFFFFD4D4D4D4D4D4A996CDD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4A996CD
        A996CDA996CDA996CDA996CDA996CDA996CDA996CDA996CDD4D4D4D4D4D4FFFF
        FF00FFFFFFD4D4D4D4D4D400007BD4D4D4D4D4D4D4D4D4D4D4D400007B00007B
        00007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFF
        FFD4D4D4D4D4D4A996CDD4D4D4D4D4D4D4D4D4D4D4D4A996CDA996CDA996CDD4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFF
        FFD4D4D4D4D4D400007BD4D4D4D4D4D4D4D4D4D4D4D400007B00007BD4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4
        D4D4D4A996CDD4D4D4D4D4D4D4D4D4D4D4D4A996CDA996CDD4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4
        D4D4D400007BD4D4D4D4D4D4D4D4D400007B00007B00007B00007B00007B0000
        7B00007B00007B00007BD4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4A9
        96CDD4D4D4D4D4D4D4D4D4A996CDA996CDA996CDA996CDA996CDA996CDA996CD
        A996CDA996CDD4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4D4D4D4D4
        D4D400007BD4D4D4D4D4D400007B00007B00007B00007B00007B00007B00007B
        00007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4D4D4D40000
        7BD4D4D4D4D4D4A996CDA996CDA996CDA996CDA996CDA996CDA996CDA996CDD4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4D4D4D4D4D4D4D4D4
        D400007BD4D4D400007B00007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4D4D4D4D4D4D400007B
        D4D4D4A996CDA996CDD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        00007B00007B00007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4A996CDA9
        96CDA996CDD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4D4D4D4D4D4D4D4D4D400007B00007B00
        007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4D4D4D4D4D4D4A996CDA996CDA996CDD4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4FFFFFF00FFFFFFD4D4D4D4D4D4D4D4D4D4D4D400007B00007B00007BD4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4FFFFFFD4D4D4D4D4D4D4D4D4D4D4D4A996CDA996CDA996CDD4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFF
        FF00FFFFFFD4D4D4D4D4D4D4D4D400007B00007B00007B00007B00007BD4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFF
        FFD4D4D4D4D4D4D4D4D4A996CDA996CDA996CDA996CDA996CDD4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFF
        FFD4D4D4D4D4D4D4D4D400007B00007B00007B00007B00007BD4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4
        D4D4D4D4D4D4A996CDA996CDA996CDA996CDA996CDD4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4
        D4D4D4D4D4D4D4D4D400007B00007B00007BD4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4D4
        D4D4D4D4D4A996CDA996CDA996CDD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFD4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFFD4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDatosIncaClick
      ExplicitLeft = 892
    end
    object edObs: TMemo
      Left = 58
      Top = 230
      Width = 877
      Height = 268
      Anchors = [akLeft, akTop, akRight, akBottom]
      HideSelection = False
      MaxLength = 4000
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 30
    end
    object dbcPartes: TArtComboBox
      Left = 44
      Top = 12
      Width = 55
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      Columns = <
        item
          Expanded = False
          FieldName = 'PV_NROPARTE'
          Title.Caption = 'N'#250'mero'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV_FECHACONTROL'
          Title.Caption = 'Fecha de Control'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV_DIAGNOSTICO'
          Title.Caption = 'Diagn'#243'stico'
          Width = 360
          Visible = True
        end>
      DataSource = dsPartes
      FieldList = 'PV_NROPARTE'
      FieldKey = 'PV_NROPARTE'
      RowColor1 = cl3DLight
      OnMoved = dbcPartesCloseUp
      OnCloseUp = dbcPartesCloseUp
    end
    object edDiagnostico: TEdit
      Left = 58
      Top = 81
      Width = 332
      Height = 21
      Hint = 'Diagn'#243'stico de la lesi'#243'n'
      MaxLength = 250
      TabOrder = 10
    end
    object cmbTipoTratam: TArtComboBox
      Left = 57
      Top = 129
      Width = 83
      Height = 21
      GlyphKind = gkDropDown
      MaxLength = 10
      NumGlyphs = 1
      TabOrder = 16
      OnExit = cmbTipoTratamExit
      OnKeyPress = cmbTipoTratamKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripcion'
          Width = 300
          Visible = True
        end>
      DataSource = dsTipoTramite
      FieldList = 'TB_CODIGO'
      FieldKey = 'TB_CODIGO'
    end
    object edTipoTramite: TEdit
      Left = 143
      Top = 131
      Width = 247
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 17
    end
    object edInternacion: TEdit
      Left = 57
      Top = 181
      Width = 333
      Height = 21
      MaxLength = 30
      TabOrder = 22
    end
    object edMedico: TEdit
      Left = 459
      Top = 181
      Width = 164
      Height = 21
      MaxLength = 30
      TabOrder = 23
    end
    object grpPrestador: TGroupBox
      Left = 0
      Top = 38
      Width = 935
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 9
      DesignSize = (
        935
        39)
      inline fraPrestador: TfraPrestador
        Left = 3
        Top = 12
        Width = 928
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 12
        ExplicitWidth = 928
        ExplicitHeight = 24
        DesignSize = (
          911
          24)
        inherited lbIdentif: TLabel
          Width = 36
          Caption = 'Identif.'
          ExplicitWidth = 36
        end
        inherited lbLocalidad: TLabel
          Left = 346
          ExplicitLeft = 346
        end
        inherited lbCPostal: TLabel
          Left = 772
          ExplicitLeft = 822
        end
        inherited lbTelefono: TLabel
          Left = 684
          Visible = True
          ExplicitLeft = 734
        end
        inherited cmbPrestFantasia: TArtComboBox
          Left = 184
          Width = 389
          ExplicitLeft = 184
          ExplicitWidth = 389
        end
        inherited cmbPrestador: TArtComboBox
          Width = 514
          ExplicitWidth = 514
        end
        inherited edPresDomicilio: TEdit
          Width = 293
          ExplicitWidth = 293
        end
        inherited edPresLocalidad: TEdit
          Left = 392
          Width = 285
          ExplicitLeft = 392
          ExplicitWidth = 285
        end
        inherited edPresCPostal: TEdit
          Left = 789
          Width = 36
          ExplicitLeft = 789
          ExplicitWidth = 36
        end
        inherited edPresTelefono: TEdit
          Left = 704
          Width = 152
          Visible = True
          ExplicitLeft = 704
          ExplicitWidth = 152
        end
      end
    end
    object deIntDesde: TDateComboBox
      Left = 58
      Top = 206
      Width = 95
      Height = 21
      MaxDateCombo = deIntHasta
      ErrorMessage = 
        'La fecha de inicio de internacion debe ser posterior a la fecha ' +
        'de control y anterior a la fecha de finilizaci'#243'n de la internaci' +
        #243'n'
      DialogTitle = 'Seleccione una Fecha'
      Enabled = False
      ButtonWidth = 20
      TabOrder = 25
    end
    object deIntHasta: TDateComboBox
      Left = 196
      Top = 206
      Width = 95
      Height = 21
      MinDateCombo = deIntDesde
      ErrorMessage = 
        'La fecha de finalizaci'#243'n de internacion debe ser posterior a la ' +
        'fecha de inicio.'
      DialogTitle = 'Seleccione una Fecha'
      Enabled = False
      ButtonWidth = 20
      TabOrder = 26
    end
    object edRecibido: TDateComboBox
      Left = 679
      Top = 206
      Width = 95
      Height = 21
      MinDateCombo = dtFechaControl
      ErrorMessage = 
        'La fecha de recepci'#243'n, debe ser mayor o igual a la fecha de cont' +
        'rol'
      DialogTitle = 'Seleccione una Fecha'
      ButtonWidth = 20
      TabOrder = 29
    end
    object dtFechaControl: TDateComboBox
      Left = 150
      Top = 12
      Width = 84
      Height = 21
      MaxDateCombo = dtFechaProxControl
      ErrorMessage = 
        'La fecha de Control debe ser posterior a la fecha del accidente ' +
        'y no puede ser mayor a la fecha actual'
      TabOrder = 1
    end
    object dtFechaProxControl: TDateComboBox
      Left = 284
      Top = 12
      Width = 84
      Height = 21
      MinDateCombo = dtFechaControl
      ErrorMessage = 
        'La fecha del Pr'#243'ximo control debe ser posterior a la fecha de co' +
        'ntrol'
      TabOrder = 2
    end
    object cmbTipo: TArtComboBox
      Left = 58
      Top = 156
      Width = 332
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 19
      OnChange = cmbTipoChange
      Columns = <
        item
          Expanded = False
          FieldName = 'TP_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TP_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 340
          Visible = True
        end>
      DataSource = dsTipo
      FieldList = 'TP_DESCRIPCION'
      FieldKey = 'TP_CODIGO'
      OnCloseUp = cmbTipoCloseUp
    end
    object edAutorizacion: TIntEdit
      Left = 679
      Top = 181
      Width = 70
      Height = 21
      ReadOnly = True
      TabOrder = 24
      Alignment = taCenter
      MaxLength = 3
    end
    object edGTrabajo: TEdit
      Left = 679
      Top = 156
      Width = 255
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      ParentColor = True
      ReadOnly = True
      TabOrder = 21
    end
    object edDelegacion: TEdit
      Left = 459
      Top = 156
      Width = 164
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 20
    end
    object cmbTurno: TDateComboBox
      Left = 459
      Top = 206
      Width = 96
      Height = 21
      TabOrder = 27
    end
    object mskHora: TMaskEdit
      Left = 585
      Top = 206
      Width = 39
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 28
      Text = '  :  '
    end
    object chkEmpresaVIP: TCheckBox
      Left = 526
      Top = 6
      Width = 81
      Height = 17
      Caption = 'Empresa VIP'
      TabOrder = 6
    end
    inline fraCIE10: TfraCodigoDescripcion
      Left = 57
      Top = 105
      Width = 336
      Height = 23
      TabOrder = 12
      ExplicitLeft = 57
      ExplicitTop = 105
      ExplicitWidth = 336
      DesignSize = (
        336
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 43
        Width = 291
        CharCase = ecUpperCase
        ExplicitLeft = 43
        ExplicitWidth = 291
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
    end
    inline fraGravedadCIE10: TfraStaticCTB_TABLAS
      Left = 457
      Top = 105
      Width = 301
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      ExplicitLeft = 457
      ExplicitTop = 105
      ExplicitWidth = 301
      DesignSize = (
        301
        23)
      inherited edCodigo: TPatternEdit
        Width = 32
        Pattern = '1234567890'
        ExplicitWidth = 32
      end
      inherited cmbDescripcion: TComboGrid
        Left = 36
        Width = 263
        ExplicitLeft = 36
        ExplicitWidth = 263
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
    object chkProtGeneral: TCheckBox
      Left = 526
      Top = 22
      Width = 87
      Height = 16
      Caption = 'Protocolo Gral.'
      TabOrder = 7
    end
    object chkRevisar: TCheckBox
      Left = 464
      Top = 6
      Width = 55
      Height = 17
      Caption = 'Revisar'
      TabOrder = 4
    end
    object edUsuAlta: TEdit
      Left = 672
      Top = 2
      Width = 264
      Height = 19
      Hint = 'Fecha - Usuario de alta del parte'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 8
    end
    object edPorcentaje: TCurrencyEdit
      Left = 849
      Top = 106
      Width = 58
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-,% 0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Anchors = [akTop, akRight]
      MaxLength = 6
      MaxValue = 100.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 31
    end
    object pnlInca: TPanel
      Left = 909
      Top = 78
      Width = 26
      Height = 25
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 32
    end
    object edPorcentajeN: TEdit
      Left = 850
      Top = 106
      Width = 58
      Height = 21
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
    end
    object chkEstimar: TCheckBox
      Left = 759
      Top = 108
      Width = 86
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeftNoAlign
      Caption = '% Inc. Estimar'
      ParentBiDiMode = False
      TabOrder = 14
      OnClick = chkEstimarClick
    end
    object chkInfectologia: TCheckBox
      Left = 464
      Top = 22
      Width = 60
      Height = 16
      Caption = 'Infecto.'
      Enabled = False
      TabOrder = 5
    end
    inline fraAuditor: TfraCodigoDescripcion
      Left = 457
      Top = 131
      Width = 479
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 18
      ExplicitLeft = 457
      ExplicitTop = 131
      ExplicitWidth = 479
      DesignSize = (
        479
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 49
        Width = 429
        ExplicitLeft = 49
        ExplicitWidth = 429
      end
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
    end
    object edPrestPorDictPV: TEdit
      Left = 458
      Top = 81
      Width = 476
      Height = 21
      Hint = 'Prestaciones por Dict'#225'men'
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 11
    end
    object mskHoraProxControl: TMaskEdit
      Left = 419
      Top = 12
      Width = 37
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
    end
    object edCatCIE10: TEdit
      Left = 672
      Top = 22
      Width = 264
      Height = 19
      Hint = 'Categor'#237'a segun CIE-10'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 33
    end
    object chkReca: TCheckBox
      Left = 619
      Top = 6
      Width = 45
      Height = 17
      Caption = 'RECA'
      TabOrder = 34
    end
    object edEstadoSSA: TEdit
      Left = 787
      Top = 179
      Width = 145
      Height = 21
      Hint = 'Diagn'#243'stico del Siniestro'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      ReadOnly = True
      TabOrder = 35
    end
    object edTopeado: TEdit
      Left = 787
      Top = 204
      Width = 145
      Height = 21
      Hint = 'Diagn'#243'stico del Siniestro'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 36
    end
  end
  object ScrollBox1: TScrollBox
    Left = 187
    Top = 420
    Width = 758
    Height = 649
    TabOrder = 3
    Visible = False
    object fpReqTraslado: TFormPanel
      Left = 4
      Top = 9
      Width = 213
      Height = 80
      Caption = 'Traslado'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      DesignSize = (
        213
        80)
      object Bevel10: TBevel
        Left = 4
        Top = 41
        Width = 205
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarTrasl: TButton
        Left = 74
        Top = 50
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        TabOrder = 0
        OnClick = btnAceptarTraslClick
      end
      object btnCancelarTrasl: TButton
        Left = 145
        Top = 50
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
      object chkRemisABM: TCheckBox
        Left = 8
        Top = 12
        Width = 201
        Height = 17
        Caption = 'El siniestro amerita traslado en remis'
        TabOrder = 2
      end
    end
    object fpMedicoResp: TFormPanel
      Left = 453
      Top = 383
      Width = 260
      Height = 254
      Caption = 'Seleccione un M'#233'dico responsable'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      Constraints.MinHeight = 160
      Constraints.MinWidth = 260
      DesignSize = (
        260
        254)
      object Label7: TLabel
        Left = 7
        Top = 5
        Width = 230
        Height = 39
        Caption = 
          'Existe mas de un m'#233'dico responsable para este '#13#10'grupo de trabajo' +
          '. Por favor, seleccione el que '#13#10'deber'#225' aparecer como Aval en el' +
          ' Informe:'
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 49
        Width = 260
        Height = 171
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object Label8: TLabel
          Left = 8
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Selecci'#243'n:'
        end
        object dbgMedicoResp: TRxDBGrid
          Left = 8
          Top = 36
          Width = 241
          Height = 124
          Ctl3D = False
          DataSource = dsMedicosResp
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          RowColor2 = 16776176
          Columns = <
            item
              Expanded = False
              FieldName = 'SE_NOMBRE'
              Title.Caption = 'M'#233'dicos Responsables del Grupo'
              Width = 207
              Visible = True
            end>
        end
        object edMedicoSelecc: TEdit
          Left = 60
          Top = 13
          Width = 188
          Height = 19
          Color = clInactiveBorder
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object Button1: TButton
        Left = 121
        Top = 226
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        ModalResult = 1
        TabOrder = 1
        OnClick = btnAceptarObsClick
      end
      object Button2: TButton
        Left = 190
        Top = 226
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 2
      end
    end
    object fpSolAudMedica: TFormPanel
      Left = 6
      Top = 95
      Width = 247
      Height = 162
      Caption = 'Agregar Tipo de Solicitud'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      Constraints.MinHeight = 150
      Constraints.MinWidth = 203
      DesignSize = (
        247
        162)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 247
        Height = 124
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Solicitud de Auditoria M'#233'dica '
        TabOrder = 0
        object rbSol24hs: TRadioButton
          Left = 28
          Top = 46
          Width = 181
          Height = 17
          Caption = '4 Autorizaciones (1 cada 24 hs.)'
          TabOrder = 0
        end
        object rbSol48hs: TRadioButton
          Left = 28
          Top = 70
          Width = 185
          Height = 17
          Caption = '3 Autorizaciones (1 cada 48 hs.)'
          TabOrder = 1
        end
        object rbSol72hs: TRadioButton
          Left = 28
          Top = 94
          Width = 185
          Height = 17
          Caption = '2 Autorizaciones (1 cada 72 hs.)'
          TabOrder = 2
        end
        object rbPuntual: TRadioButton
          Left = 28
          Top = 24
          Width = 165
          Height = 17
          Caption = '1 Autorizaci'#243'n Puntual'
          Checked = True
          TabOrder = 3
          TabStop = True
        end
      end
      object btnAceptar: TButton
        Left = 104
        Top = 130
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancelar: TButton
        Left = 179
        Top = 130
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 2
      end
    end
    object fpObservaciones: TFormPanel
      Left = 8
      Top = 341
      Width = 389
      Height = 160
      Caption = 'Agregar observaciones'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      Position = poOwnerFormCenter
      Constraints.MinHeight = 160
      Constraints.MinWidth = 260
      DesignSize = (
        389
        160)
      object GroupBox2: TGroupBox
        Left = 4
        Top = 5
        Width = 381
        Height = 126
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object edObsABM: TMemo
          Left = 2
          Top = 15
          Width = 377
          Height = 109
          Align = alClient
          MaxLength = 1000
          TabOrder = 0
        end
      end
      object btnAceptarObs: TButton
        Left = 250
        Top = 132
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        ModalResult = 1
        TabOrder = 1
        OnClick = btnAceptarObsClick
      end
      object btnCancelarObs: TButton
        Left = 319
        Top = 132
        Width = 64
        Height = 24
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cerrar'
        ModalResult = 2
        TabOrder = 2
      end
    end
    object fpPracticasRealizadas: TFormPanel
      Left = 232
      Top = 12
      Width = 225
      Height = 70
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        225
        70)
      object lbEspCodigo: TLabel
        Left = 7
        Top = 10
        Width = 159
        Height = 13
        Caption = 'Cantidad de pr'#225'cticas realizadas:'
      end
      object Bevel8: TBevel
        Left = 7
        Top = 32
        Width = 209
        Height = 8
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnRealAceptar: TButton
        Left = 141
        Top = 39
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 0
        OnClick = btnRealAceptarClick
      end
      object edRealizadas: TCurrencyEdit
        Left = 171
        Top = 6
        Width = 45
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 6
        MaxValue = 100.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object fpMotivoElim: TFormPanel
      Left = 4
      Top = 501
      Width = 441
      Height = 117
      Caption = 'Motivo de eliminaci'#243'n del parte'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      Constraints.MinHeight = 50
      Constraints.MinWidth = 260
      DesignSize = (
        441
        117)
      object btnCerrarElim: TButton
        Left = 374
        Top = 87
        Width = 61
        Height = 24
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cerrar'
        ModalResult = 2
        TabOrder = 2
      end
      object gbMotivo: TGroupBox
        Left = 0
        Top = 0
        Width = 441
        Height = 81
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 19
          Width = 56
          Height = 13
          Caption = 'Motivo baja'
        end
        object Label4: TLabel
          Left = 8
          Top = 51
          Width = 60
          Height = 13
          Caption = 'Usuario baja'
        end
        object Label5: TLabel
          Left = 166
          Top = 51
          Width = 34
          Height = 13
          Caption = 'F. baja'
        end
        object Label6: TLabel
          Left = 276
          Top = 51
          Width = 69
          Height = 13
          Caption = 'Usuario modif.'
        end
        object edMotivoElim: TEdit
          Left = 72
          Top = 16
          Width = 363
          Height = 21
          MaxLength = 150
          TabOrder = 0
        end
        object edUsuBaja: TEdit
          Left = 72
          Top = 48
          Width = 89
          Height = 21
          Color = clBtnFace
          MaxLength = 150
          ReadOnly = True
          TabOrder = 1
        end
        object edFechaBaja: TEdit
          Left = 203
          Top = 48
          Width = 70
          Height = 21
          Color = clBtnFace
          MaxLength = 150
          ReadOnly = True
          TabOrder = 2
        end
        object edUsuModif: TEdit
          Left = 346
          Top = 48
          Width = 89
          Height = 21
          Color = clBtnFace
          MaxLength = 150
          ReadOnly = True
          TabOrder = 3
        end
      end
      object btnAceptarElim: TButton
        Left = 374
        Top = 87
        Width = 61
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        TabOrder = 1
        OnClick = btnAceptarElimClick
      end
    end
    object fpPrimerRangoInternacion: TFormPanel
      Left = 268
      Top = 124
      Width = 373
      Height = 187
      Caption = 'Primer rango de Internaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        373
        187)
      object Bevel1: TBevel
        Left = 5
        Top = 154
        Width = 363
        Height = 6
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarInt: TButton
        Left = 296
        Top = 159
        Width = 71
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 0
        OnClick = btnAceptarIntClick
      end
      object dgPrimerRangoInternacion: TArtDBGrid
        Left = 4
        Top = 5
        Width = 365
        Height = 147
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsPrimerRangoInternacion
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
        Columns = <
          item
            Expanded = False
            FieldName = 'SI_INTERNADODESDE'
            Title.Caption = 'Internado Desde'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_INTERNADOHASTA'
            Title.Caption = 'Internado Hasta'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRESTADOR'
            Title.Caption = 'Prestador'
            Width = 170
            Visible = True
          end>
      end
    end
  end
  object ScrollBox2: TScrollBox
    Left = 1036
    Top = 509
    Width = 605
    Height = 693
    TabOrder = 4
    Visible = False
    object fpResumenSum: TFormPanel
      Left = 22
      Top = 5
      Width = 476
      Height = 251
      Caption = 'Resumen sumarizado por tipo de prestaci'#243'n otorgada'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biMaximize]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      ActiveControl = dgResumenSum
      Constraints.MinHeight = 150
      Constraints.MinWidth = 203
      DesignSize = (
        476
        251)
      object ToolBar1: TToolBar
        Left = 0
        Top = 34
        Width = 476
        Height = 28
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbOrdenarRes: TToolButton
          Left = 0
          Top = 0
          Hint = 'Ordenar'
          ImageIndex = 5
          OnClick = tbOrdenarResClick
        end
        object ToolButton1: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbExportarRes: TToolButton
          Left = 31
          Top = 0
          Hint = 'Guardar'
          Caption = 'tbGuardarObs'
          ImageIndex = 1
          OnClick = tbExportarResClick
        end
        object tbImprimirRes: TToolButton
          Left = 54
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbImprimirObs'
          ImageIndex = 7
          OnClick = tbImprimirResClick
        end
        object ToolButton15: TToolButton
          Left = 77
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbSalirRes: TToolButton
          Left = 85
          Top = 0
          Hint = 'Salir'
          Caption = 'tbSalirObs'
          ImageIndex = 8
          OnClick = tbSalirResClick
        end
      end
      object dgResumenSum: TArtDBGrid
        Left = 3
        Top = 64
        Width = 471
        Height = 184
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsResumenSum
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CODPRESTACION'
            Title.Caption = 'Cod. Prestaci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRESTACION'
            Title.Caption = 'Prestaci'#243'n'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Caption = 'Cantidad'
            Width = 70
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 476
        Height = 34
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object rbSinOrdRec: TRadioButton
          Left = 7
          Top = 11
          Width = 140
          Height = 17
          Caption = 'Siniestro/Orden/Reca'#237'da'
          TabOrder = 0
          OnClick = rbSinOrdRecClick
        end
        object rbSinOrd: TRadioButton
          Left = 273
          Top = 11
          Width = 95
          Height = 17
          Caption = 'Siniestro/Orden'
          TabOrder = 1
          OnClick = rbSinOrdClick
        end
        object edSinOrdRec: TSinEdit
          Left = 149
          Top = 7
          Width = 110
          Height = 21
          TabOrder = 2
          ReadOnly = True
          Color = clInfoBk
        end
        object edSinOrd: TSinEdit
          Left = 372
          Top = 7
          Width = 91
          Height = 21
          TabOrder = 3
          ViewStyle = [etSiniestro, etOrden]
          ReadOnly = True
          Color = clSilver
        end
      end
    end
    object fpObsSupMed: TFormPanel
      Left = 18
      Top = 283
      Width = 538
      Height = 385
      Caption = 'Observaciones'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biMaximize]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnClose = fpObsSupMedClose
      ActiveControl = dgObsSupMed
      Constraints.MinHeight = 150
      Constraints.MinWidth = 203
      DesignSize = (
        538
        385)
      object pnlFiltros: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 217
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          538
          217)
        object Label11: TLabel
          Left = 141
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Usuario:'
        end
        object Label12: TLabel
          Left = 411
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Fecha:'
        end
        object Label13: TLabel
          Left = 6
          Top = 127
          Width = 75
          Height = 13
          Caption = 'Observaciones:'
        end
        object edUsuarioObs: TEdit
          Left = 185
          Top = 6
          Width = 220
          Height = 19
          TabStop = False
          BevelInner = bvNone
          Color = clBtnFace
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object MemoObservaciones: TMemo
          Left = 5
          Top = 143
          Width = 529
          Height = 69
          Anchors = [akLeft, akTop, akRight]
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 500
          ParentCtl3D = False
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object edFechaObs: TDateEditor
          Left = 446
          Top = 6
          Width = 85
          Height = 19
          Hint = 'Fecha del Siniestro'
          TabStop = False
          BlanksChar = '_'
          Color = clBtnFace
          Flat = True
          ParentFlat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          ParentCtl3D = False
        end
        object edSiniestroObs: TEdit
          Left = 5
          Top = 6
          Width = 128
          Height = 19
          TabStop = False
          BevelInner = bvNone
          Color = clBtnFace
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object pnlTipoTopeo: TPanel
          Left = 4
          Top = 31
          Width = 529
          Height = 28
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 4
          object Label15: TLabel
            Left = 7
            Top = 8
            Width = 160
            Height = 13
            Caption = 'Justificar topeo de siniestros por:'
          end
          object chkTopeCie10: TRadioButton
            Left = 191
            Top = 9
            Width = 71
            Height = 15
            Caption = 'CIE-10'
            TabOrder = 0
          end
          object chkTopeAutorizacion: TRadioButton
            Left = 268
            Top = 7
            Width = 87
            Height = 17
            Caption = 'Autorizaci'#243'n'
            TabOrder = 1
          end
          object chkTopeTraslado: TRadioButton
            Left = 376
            Top = 7
            Width = 80
            Height = 17
            Caption = 'Traslado'
            TabOrder = 2
          end
          object chkTopeFKT: TRadioButton
            Left = 466
            Top = 7
            Width = 53
            Height = 16
            Caption = 'FKT'
            TabOrder = 3
          end
        end
        object chkRevisar48: TCheckBox
          Left = 5
          Top = 64
          Width = 97
          Height = 17
          Caption = 'Revisar en 48hs.'
          TabOrder = 5
          Visible = False
          OnClick = chkRevisar48Click
        end
        object mObsRevisar48: TMemo
          Left = 5
          Top = 82
          Width = 529
          Height = 41
          Lines.Strings = (
            '')
          TabOrder = 6
          Visible = False
        end
      end
      object ToolBar: TToolBar
        Left = 0
        Top = 217
        Width = 538
        Height = 28
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = [ebLeft, ebRight, ebBottom]
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object tbRefrescarObs: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar'
          ImageIndex = 4
          OnClick = tbRefrescarObsClick
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 14
          Style = tbsSeparator
          Visible = False
        end
        object tbNuevoObs: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo'
          ImageIndex = 23
          OnClick = tbNuevoObsClick
        end
        object ToolButton4: TToolButton
          Left = 54
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
          Visible = False
        end
        object tbGuardarObs: TToolButton
          Left = 62
          Top = 0
          Hint = 'Guardar'
          Caption = 'tbGuardarObs'
          ImageIndex = 1
          OnClick = tbGuardarObsClick
        end
        object tbCancelarObs: TToolButton
          Left = 85
          Top = 0
          Hint = 'Cancelar'
          Caption = 'Cancelar'
          ImageIndex = 2
          OnClick = tbCancelarObsClick
        end
        object ToolButton2: TToolButton
          Left = 108
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbOrdenarObs: TToolButton
          Left = 116
          Top = 0
          Hint = 'Ordenar'
          ImageIndex = 5
          OnClick = tbOrdenarObsClick
        end
        object tbExportarObs: TToolButton
          Left = 139
          Top = 0
          Hint = 'Exportar'
          Caption = 'tbExportarObs'
          ImageIndex = 1
          OnClick = tbExportarObsClick
        end
        object tbImprimirObs: TToolButton
          Left = 162
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbImprimirObs'
          ImageIndex = 7
          OnClick = tbImprimirObsClick
        end
        object ToolButton6: TToolButton
          Left = 185
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbSalirObs: TToolButton
          Left = 193
          Top = 0
          Hint = 'Salir'
          Caption = 'tbSalirObs'
          ImageIndex = 8
          OnClick = tbSalirObsClick
        end
      end
      object dgObsSupMed: TArtDBGrid
        Left = 1
        Top = 246
        Width = 535
        Height = 136
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsObsSupMed
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
        Columns = <
          item
            Expanded = False
            FieldName = 'SO_FECHAALTA'
            Title.Caption = 'Fecha'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBREUSUARIO'
            Title.Caption = 'Usuario'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO_OBSERVACIONES'
            Title.Caption = 'Observaciones'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO_TIPOJUSTIFICACION'
            Title.Caption = 'Tipo Justificacion'
            Width = 86
            Visible = True
          end>
      end
    end
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ex_siniestro, ex_orden, ex_recaida, ex_id, ex_fechaaccide' +
        'nte, '
      
        '       ex_diagnostico, art.amebpba.get_causafin(ex_causafin) cau' +
        'safin, '
      
        '       ex_cuit, ex_cuil, ex_causafin, ex_gtrabajo, gp_nombre, el' +
        '_nombre,   '
      
        '       ex_prestador, art.amebpba.is_requerimientosrt(ex_siniestr' +
        'o, ex_orden, ex_recaida) req,'
      
        '       art.amebpba.is_sumario(ex_siniestro, ex_orden, ex_recaida' +
        ') SUM, '
      
        '       ex_fechagestaud, ex_contrato, NVL(ex_ameritaremis, '#39'S'#39') e' +
        'x_ameritaremis,'
      
        '       art.trabajador.get_isgrandessueldos(ex_cuil, ex_contrato)' +
        ' gransueldo,'
      
        '       art.inca.is_dictamencommed(ex_siniestro, ex_orden) commed' +
        ','
      
        '       NVL(TRIM(ex_mecanismoaccid), ex_brevedescripcion) ex_meca' +
        'nismoaccid,'
      '       rl_sector, rl_tarea'
      
        '  FROM art.mgp_gtrabajo, art.sex_expedientes, art.del_delegacion' +
        ', crl_relacionlaboral  '
      ' WHERE ex_gtrabajo = gp_codigo(+)'
      '   AND ex_delegacion = el_id(+)  '
      '   AND ex_siniestro = :psiniestro'
      '   AND ex_orden = :porden'
      '   AND ex_recaida = :precaida'
      '   AND ex_contrato = rl_contrato(+) '
      '   AND ex_idtrabajador = rl_idtrabajador(+) '
      '')
    Left = 72
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
    object sdqBusquedaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqBusquedaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqBusquedaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqBusquedaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqBusquedaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqBusquedaCAUSAFIN: TStringField
      FieldName = 'CAUSAFIN'
      Size = 4000
    end
    object sdqBusquedaEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqBusquedaEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqBusquedaEX_CAUSAFIN: TStringField
      FieldName = 'EX_CAUSAFIN'
      Size = 10
    end
    object sdqBusquedaEX_GTRABAJO: TStringField
      FieldName = 'EX_GTRABAJO'
      Size = 3
    end
    object sdqBusquedaGP_NOMBRE: TStringField
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqBusquedaEL_NOMBRE: TStringField
      FieldName = 'EL_NOMBRE'
      Size = 50
    end
    object sdqBusquedaEX_PRESTADOR: TFloatField
      FieldName = 'EX_PRESTADOR'
    end
    object sdqBusquedaREQ: TStringField
      FieldName = 'REQ'
      Size = 4000
    end
    object sdqBusquedaSUM: TStringField
      FieldName = 'SUM'
      Size = 4000
    end
    object sdqBusquedaEX_FECHAGESTAUD: TDateTimeField
      FieldName = 'EX_FECHAGESTAUD'
    end
    object sdqBusquedaEX_CONTRATO: TFloatField
      FieldName = 'EX_CONTRATO'
    end
    object sdqBusquedaEX_AMERITAREMIS: TStringField
      FieldName = 'EX_AMERITAREMIS'
      Size = 1
    end
    object sdqBusquedaGRANSUELDO: TStringField
      FieldName = 'GRANSUELDO'
      Size = 4000
    end
    object sdqBusquedaCOMMED: TStringField
      FieldName = 'COMMED'
      Size = 4000
    end
    object sdqBusquedaEX_MECANISMOACCID: TStringField
      FieldName = 'EX_MECANISMOACCID'
      Size = 250
    end
    object sdqBusquedaRL_SECTOR: TStringField
      FieldName = 'RL_SECTOR'
      Size = 150
    end
    object sdqBusquedaRL_TAREA: TStringField
      FieldName = 'RL_TAREA'
      Size = 150
    end
  end
  object dsBusqueda: TDataSource
    DataSet = sdqBusqueda
    Left = 100
    Top = 388
  end
  object sdqPartes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqPartesAfterScroll
    SQL.Strings = (
      
        'SELECT PV_SINIESTRO, PV_ORDEN,PV_RECAIDA, PV_NROPARTE, PV_FECHAC' +
        'ONTROL, PV_PROXIMOCONTROL, PV_DIAGNOSTICO,'
      
        '       PV_IDENTIFPRESTADOR, PV_DIAGNOSTICOOMS, PV_GRAVEDADCIE10,' +
        ' PV_TIPOTRATAMIENTO, PV_AUDITOR,'
      '       PV_INTERNADODESDE, PV_INTERNADOHASTA, PV_DESDE, PV_HASTA,'
      
        '       PV_SITIOINTERNACION, PV_MEDICO, PV_OBSERVACIONES, PV_FECH' +
        'ARECEPCION,'
      '       PV_TIPOPARTE, PV_AUTORIZACION, PV_USUALTA, PV_FECHAALTA, '
      
        '       PV_OPERPROG, PV_NRODENUNCIASRT, PV_TURNO, PV_TURNOHORA, P' +
        'V_EVIP, '
      
        '       PV_MEDICACION, PV_REPOSO, PV_PROTOCOLOGENERAL, PV_AREVISA' +
        'R,'
      
        '       PV_FECHABAJA, PV_USUBAJA, PV_MOTIVOBAJA, PV_IDEXPEDIENTE,' +
        ' PV_USUMODIF,'
      
        '       PV_PORCINCAPACIDAD, PV_INFECTOLOGIA, PV_IDCITACION, PV_PR' +
        'ESTPORDICTAMEN,'
      
        '       PV_HORAPROXIMOCONTROL, PV_RECALIFICACION, PV_DEAM, PV_FEC' +
        'HADEAM'
      'FROM SPV_PARTEEVOLUTIVO'
      ' ')
    Left = 240
    Top = 444
    object sdqPartesPV_SINIESTRO: TFloatField
      FieldName = 'PV_SINIESTRO'
      Required = True
    end
    object sdqPartesPV_ORDEN: TFloatField
      FieldName = 'PV_ORDEN'
      Required = True
    end
    object sdqPartesPV_RECAIDA: TFloatField
      FieldName = 'PV_RECAIDA'
      Required = True
    end
    object sdqPartesPV_NROPARTE: TFloatField
      FieldName = 'PV_NROPARTE'
      Required = True
    end
    object sdqPartesPV_FECHACONTROL: TDateTimeField
      FieldName = 'PV_FECHACONTROL'
    end
    object sdqPartesPV_PROXIMOCONTROL: TDateTimeField
      FieldName = 'PV_PROXIMOCONTROL'
    end
    object sdqPartesPV_DIAGNOSTICO: TStringField
      FieldName = 'PV_DIAGNOSTICO'
      Size = 250
    end
    object sdqPartesPV_IDENTIFPRESTADOR: TFloatField
      FieldName = 'PV_IDENTIFPRESTADOR'
    end
    object sdqPartesPV_DIAGNOSTICOOMS: TStringField
      FieldName = 'PV_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqPartesPV_GRAVEDADCIE10: TStringField
      FieldName = 'PV_GRAVEDADCIE10'
      Size = 10
    end
    object sdqPartesPV_TIPOTRATAMIENTO: TStringField
      FieldName = 'PV_TIPOTRATAMIENTO'
      Size = 10
    end
    object sdqPartesPV_AUDITOR: TFloatField
      FieldName = 'PV_AUDITOR'
    end
    object sdqPartesPV_INTERNADODESDE: TDateTimeField
      FieldName = 'PV_INTERNADODESDE'
    end
    object sdqPartesPV_INTERNADOHASTA: TDateTimeField
      FieldName = 'PV_INTERNADOHASTA'
    end
    object sdqPartesPV_DESDE: TDateTimeField
      FieldName = 'PV_DESDE'
    end
    object sdqPartesPV_HASTA: TDateTimeField
      FieldName = 'PV_HASTA'
    end
    object sdqPartesPV_SITIOINTERNACION: TStringField
      FieldName = 'PV_SITIOINTERNACION'
      Size = 100
    end
    object sdqPartesPV_MEDICO: TStringField
      DisplayWidth = 50
      FieldName = 'PV_MEDICO'
      Size = 50
    end
    object sdqPartesPV_OBSERVACIONES: TStringField
      DisplayWidth = 4000
      FieldName = 'PV_OBSERVACIONES'
      Size = 4000
    end
    object sdqPartesPV_FECHARECEPCION: TDateTimeField
      FieldName = 'PV_FECHARECEPCION'
    end
    object sdqPartesPV_TIPOPARTE: TStringField
      FieldName = 'PV_TIPOPARTE'
      Size = 10
    end
    object sdqPartesPV_AUTORIZACION: TFloatField
      FieldName = 'PV_AUTORIZACION'
    end
    object sdqPartesPV_USUALTA: TStringField
      FieldName = 'PV_USUALTA'
    end
    object sdqPartesPV_FECHAALTA: TDateTimeField
      FieldName = 'PV_FECHAALTA'
    end
    object sdqPartesPV_OPERPROG: TStringField
      FieldName = 'PV_OPERPROG'
      Size = 1
    end
    object sdqPartesPV_NRODENUNCIASRT: TStringField
      FieldName = 'PV_NRODENUNCIASRT'
      Size = 13
    end
    object sdqPartesPV_TURNO: TDateTimeField
      FieldName = 'PV_TURNO'
    end
    object sdqPartesPV_TURNOHORA: TStringField
      FieldName = 'PV_TURNOHORA'
      Size = 5
    end
    object sdqPartesPV_EVIP: TStringField
      FieldName = 'PV_EVIP'
      Size = 1
    end
    object sdqPartesPV_MEDICACION: TStringField
      FieldName = 'PV_MEDICACION'
      Size = 1
    end
    object sdqPartesPV_REPOSO: TStringField
      FieldName = 'PV_REPOSO'
      Size = 1
    end
    object sdqPartesPV_PROTOCOLOGENERAL: TStringField
      FieldName = 'PV_PROTOCOLOGENERAL'
      Size = 1
    end
    object sdqPartesPV_AREVISAR: TStringField
      FieldName = 'PV_AREVISAR'
      Size = 1
    end
    object sdqPartesPV_FECHABAJA: TDateTimeField
      FieldName = 'PV_FECHABAJA'
    end
    object sdqPartesPV_USUBAJA: TStringField
      FieldName = 'PV_USUBAJA'
    end
    object sdqPartesPV_MOTIVOBAJA: TStringField
      FieldName = 'PV_MOTIVOBAJA'
      Size = 150
    end
    object sdqPartesPV_IDEXPEDIENTE: TFloatField
      FieldName = 'PV_IDEXPEDIENTE'
    end
    object sdqPartesPV_USUMODIF: TStringField
      FieldName = 'PV_USUMODIF'
    end
    object sdqPartesPV_PORCINCAPACIDAD: TFloatField
      FieldName = 'PV_PORCINCAPACIDAD'
    end
    object sdqPartesPV_INFECTOLOGIA: TStringField
      FieldName = 'PV_INFECTOLOGIA'
      Size = 1
    end
    object sdqPartesPV_IDCITACION: TFloatField
      FieldName = 'PV_IDCITACION'
    end
    object sdqPartesPV_PRESTPORDICTAMEN: TStringField
      FieldName = 'PV_PRESTPORDICTAMEN'
      Size = 250
    end
    object sdqPartesPV_HORAPROXIMOCONTROL: TStringField
      FieldName = 'PV_HORAPROXIMOCONTROL'
      Size = 5
    end
    object sdqPartesPV_RECALIFICACION: TStringField
      FieldName = 'PV_RECALIFICACION'
    end
    object sdqPartesPV_DEAM: TStringField
      FieldName = 'PV_DEAM'
      Size = 1
    end
    object sdqPartesPV_FECHADEAM: TDateTimeField
      FieldName = 'PV_FECHADEAM'
    end
  end
  object dsPartes: TDataSource
    DataSet = sdqPartes
    Left = 268
    Top = 444
  end
  object sdqTipoTramite: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TRATA'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 128
    Top = 416
    object sdqTipoTramiteTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Required = True
      Size = 10
    end
    object sdqTipoTramiteTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
  end
  object dsTipoTramite: TDataSource
    DataSet = sdqTipoTramite
    Left = 156
    Top = 416
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'NAVEGADOR'
      end
      item
        Name = 'CIE10-P.EVOLUTIVO'
      end
      item
        Name = 'RecepcionEmailAvisoCargaSolicitudAuditoria'
      end
      item
        Name = 'EnvioSolicitudAuditoriaGrave'
      end
      item
        Name = 'RecepcionEmailAvisoCargaSolicitudAuditoriaGRAVE'
      end
      item
        Name = 'CargarPartesAuditoria'
      end
      item
        Name = 'EstimarIncapacidad'
      end
      item
        Name = 'CargarPrestPorDict'
      end
      item
        Name = 'CargarAdministrativoMedico'
      end
      item
        Name = 'CargarObservacionAuditor_InfoSocial'
      end
      item
        Name = 'CargarObservacionAuditor_AdmMedico'
      end
      item
        Name = 'DesmarcarAmeritaRemis'
      end
      item
        Name = 'CargaPartesSML'
      end
      item
        Name = 'CargarObsSupervisor'
      end
      item
        Name = 'CargarObsMedico'
      end
      item
        Name = 'CargarAbordajeFisiatrico'
      end
      item
        Name = 'CargarInformeFisiatrico'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 212
    Top = 388
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 184
    Top = 388
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16420
        OnShortCutPress = tbPrimeroClick
      end
      item
        Key = 16418
        OnShortCutPress = tbAnteriorClick
      end
      item
        Key = 16417
        OnShortCutPress = tbSiguienteClick
      end
      item
        Key = 16419
        OnShortCutPress = tbUltimoClick
      end
      item
        Key = 16462
        OnShortCutPress = tbNuevoClick
      end
      item
        Key = 16455
        OnShortCutPress = tbGuardarClick
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
      end
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenClick
      end
      item
        Key = 16466
        OnShortCutPress = tbViajarClick
      end
      item
        Key = 16449
      end>
    Left = 156
    Top = 388
  end
  object SortDialog: TSortDialog
    Caption = 'Orden del Navegador'
    DataSet = sdqPartes
    SortFields = <
      item
        Title = 'N'#250'mero de Parte'
        DataField = 'PV_NROPARTE'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'PV_SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'PV_ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Recaida'
        DataField = 'PV_RECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Control'
        DataField = 'PV_FECHACONTROL'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Pr'#243'ximo Control'
        DataField = 'PV_PROXIMOCONTROL'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'PV_IDENTIFPRESTADOR'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Internaci'#243'n - Desde'
        DataField = 'PV_INTERNADODESDE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Internaci'#243'n - Hasta'
        DataField = 'PV_INTERNADOHASTA'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 296
    Top = 444
  end
  object sdqTipo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TP_CODIGO, TP_DESCRIPCION, TP_RECALIFICACION,'
      '               TP_CARGAAUTO, TP_REQUIERECIE10, TP_CUITPROVART'
      'FROM SIN.STP_TIPOPARTE'
      'WHERE TP_FECHABAJA IS NULL'
      '               ')
    Left = 268
    Top = 472
  end
  object dsTipo: TDataSource
    DataSet = sdqTipo
    Left = 296
    Top = 472
  end
  object sdqAutorizaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT au_numauto, au_siniestro, au_orden, au_recaida, '
      '               au_identifapro, au_fechasoli, ca_descripcion, '
      '               pr_descripcion, au_detalleapro, gp_nombre, '
      '               au_observaciones, au_usuapro, au_fechapro, au_id'
      
        '   FROM cpr_prestador, mpr_prestaciones, mgp_gtrabajo, sau_autor' +
        'izaciones'
      'WHERE ca_identificador = au_identifapro'
      '   AND pr_codigo = au_presapro'
      '   AND gp_codigo = au_trabajo'
      '   AND au_estado = '#39'E'#39
      '   AND au_siniestro = :psiniestro'
      '   AND au_orden = :porden'
      '   AND au_recaida = :precaida'
      '')
    Left = 128
    Top = 444
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
  end
  object dsAutorizaciones: TDataSource
    DataSet = sdqAutorizaciones
    Left = 156
    Top = 444
  end
  object ldAutorizaciones: TLookupDialog
    Caption = 'Autorizaciones'
    CharCase = ecNormal
    DataSource = dsAutorizaciones
    DataField = 'AU_USUAPRO'
    Columns = <
      item
        Expanded = False
        FieldName = 'AU_FECHASOLI'
        Title.Caption = 'F.Solicitud'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_DESCRIPCION'
        Title.Caption = 'Prestaci'#243'n'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_DETALLEAPRO'
        Title.Caption = 'Detalle'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'Grupo T.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUAPRO'
        Title.Caption = 'Usu.Apro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAPRO'
        Title.Caption = 'Fecha Apro.'
        Width = 63
        Visible = True
      end>
    AutoFill = False
    ShowButtons = False
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    OnGetCellParams = ldAutorizacionesGetCellParams
    ShowExportar = True
    Left = 184
    Top = 444
  end
  object pmnuHistoria: TPopupMenu
    Left = 240
    Top = 388
    object mnuHistoDetalle: TMenuItem
      Caption = 'Ver detalle'
      ImageIndex = 15
      OnClick = mnuHistoDetalleClick
    end
  end
  object pmnuImprimir: TPopupMenu
    OnPopup = pmnuImprimirPopup
    Left = 128
    Top = 388
    object mnuImprimirPartes: TMenuItem
      Caption = 'Imprimir &Partes'
      OnClick = mnuImprimirPartesClick
    end
    object mnuCartaDerivacion: TMenuItem
      Caption = 'Imprimir Carta de &Derivaci'#243'n'
      OnClick = mnuCartaDerivacionClick
    end
    object mnuImprimirInforme: TMenuItem
      Caption = 'Imprimir I&nforme'
      OnClick = mnuImprimirInformeClick
    end
  end
  object TimerConfidencial: TTimer
    Enabled = False
    Interval = 0
    OnTimer = TimerConfidencialTimer
    Left = 212
    Top = 444
  end
  object pMenuViajar: TPopupMenu
    OnPopup = pMenuViajarPopup
    Left = 268
    Top = 388
    object mnuViajarAutorizaciones: TMenuItem
      Caption = 'Viajar a Autorizaciones'
      OnClick = mnuViajarAutorizacionesClick
    end
    object mnViajarAgenda: TMenuItem
      Caption = 'Viajar a Agenda'
      OnClick = mnViajarAgendaClick
    end
    object mnuViajarCalendario: TMenuItem
      Caption = 'Viajar a Calendario'
      OnClick = mnuViajarCalendarioClick
    end
    object mnuViajarSuspPlazos: TMenuItem
      Caption = 'Viajar a Suspensi'#243'n de plazos'
      OnClick = mnuViajarSuspPlazosClick
    end
    object mnuViajarSeguim: TMenuItem
      Caption = 'Viajar a Seguimiento m'#233'dico'
      OnClick = mnuViajarSeguimClick
    end
  end
  object sdqMedicosResp: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqMedicosRespAfterScroll
    Left = 72
    Top = 472
  end
  object dsMedicosResp: TDataSource
    DataSet = sdqMedicosResp
    Left = 100
    Top = 472
  end
  object sdqObsSupMed: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqObsSupMedAfterScroll
    Left = 184
    Top = 416
  end
  object dsObsSupMed: TDataSource
    DataSet = sdqObsSupMed
    Left = 212
    Top = 416
  end
  object SortDialog_Obs: TSortDialog
    Caption = 'Orden del Navegador'
    DataSet = sdqObsSupMed
    SortFields = <
      item
        Title = 'Fecha'
        DataField = 'SO_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Usuario'
        DataField = 'NOMBREUSUARIO'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'SO_OBSERVACIONES'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 240
    Top = 416
  end
  object pMenuObs: TPopupMenu
    Left = 296
    Top = 388
    object mnuSupervisor: TMenuItem
      Caption = 'Supervisor'
      OnClick = mnuSupervisorClick
    end
    object mnuMedico: TMenuItem
      Caption = 'M'#233'dico'
      OnClick = mnuMedicoClick
    end
    object mnuResumen: TMenuItem
      Caption = 'Resumen'
      OnClick = mnuResumenClick
    end
  end
  object exportObs: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqObsSupMed
    Fields = <
      item
        DataField = 'SO_FECHAALTA'
        Title = 'Fecha alta'
      end
      item
        DataField = 'NOMBREUSUARIO'
        Title = 'Usuario'
      end
      item
        DataField = 'SO_OBSERVACIONES'
        Title = 'Observaciones'
      end>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 296
    Top = 416
  end
  object qpObs: TQueryPrint
    Fields = <
      item
        Title = 'Fecha alta'
        TitleAlignment = taCenter
        DataField = 'SO_FECHAALTA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Usuario'
        DataField = 'NOMBREUSUARIO'
        MaxLength = 30
      end
      item
        Title = 'Observaciones'
        DataField = 'SO_OBSERVACIONES'
        MaxLength = 0
      end>
    DataSource = dsObsSupMed
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -13
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 15000804
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -11
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -11
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    Left = 268
    Top = 416
  end
  object pdObs: TPrintDialog
    Left = 100
    Top = 416
  end
  object sdqResumenSum: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 128
    Top = 472
  end
  object dsResumenSum: TDataSource
    DataSet = sdqResumenSum
    Left = 156
    Top = 472
  end
  object SortDialog_ResSum: TSortDialog
    Caption = 'Orden del Navegador'
    DataSet = sdqResumenSum
    SortFields = <
      item
        Title = 'Cod. Prestaci'#243'n'
        DataField = 'CODPRESTACION'
        FieldIndex = 0
      end
      item
        Title = 'Prestaci'#243'n'
        DataField = 'PRESTACION'
        FieldIndex = 0
      end
      item
        Title = 'Cantidad'
        DataField = 'CANTIDAD'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 184
    Top = 472
  end
  object Export_ResSum: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqResumenSum
    Fields = <
      item
        DataField = 'CODPRESTACION'
        Title = 'Cod. Prestaci'#243'n'
      end
      item
        DataField = 'PRESTACION'
        Title = 'Prestaci'#243'n'
      end
      item
        DataField = 'CANTIDAD'
        Title = 'Cantidad'
      end>
    OutputFile = 'ResumenSum'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 212
    Top = 472
  end
  object QueryPrint_ResSum: TQueryPrint
    Fields = <
      item
        Title = 'Cod. Prestaci'#243'n'
        DataField = 'CODPRESTACION'
        Width = 350
        MaxLength = 350
      end
      item
        Title = 'Prestaci'#243'n'
        DataField = 'PRESTACION'
        Width = 1600
        MaxLength = 1600
      end
      item
        Title = 'Cantidad'
        DataField = 'CANTIDAD'
        Width = 200
        MaxLength = 200
      end>
    DataSource = dsResumenSum
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -13
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 15066341
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -12
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -11
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -11
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    Left = 240
    Top = 472
  end
  object dsPrimerRangoInternacion: TDataSource
    DataSet = sdqPrimerRangoInternacion
    Left = 100
    Top = 444
  end
  object sdqPrimerRangoInternacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 72
    Top = 444
  end
end
