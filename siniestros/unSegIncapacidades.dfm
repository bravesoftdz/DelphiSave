inherited frmSegIncapacidades: TfrmSegIncapacidades
  Left = 450
  Top = 182
  Caption = 'Administraci'#243'n de Incapacidades'
  ClientHeight = 682
  ClientWidth = 1116
  Constraints.MinHeight = 550
  Constraints.MinWidth = 808
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Scaled = False
  OnShow = FSFormShow
  ExplicitWidth = 1124
  ExplicitHeight = 712
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1116
    Height = 217
    ExplicitWidth = 887
    ExplicitHeight = 217
    DesignSize = (
      1116
      217)
    object Label57: TLabel
      Left = 768
      Top = 139
      Width = 31
      Height = 13
      Caption = 'Juicios'
    end
    object Label62: TLabel
      Left = 766
      Top = 175
      Width = 58
      Height = 13
      Caption = 'Mediaciones'
    end
    object grpEmpresa: TGroupBox
      Left = 2
      Top = 0
      Width = 782
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 1
      TabStop = True
      ExplicitWidth = 553
      DesignSize = (
        782
        42)
      inline fraEmpresa: TfraEmpresa
        Left = 2
        Top = 15
        Width = 777
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 15
        ExplicitWidth = 548
        ExplicitHeight = 23
        DesignSize = (
          777
          23)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 674
          ExplicitLeft = 507
        end
        inherited mskCUIT: TMaskEdit
          Left = 3
          ExplicitLeft = 3
        end
        inherited edContrato: TIntEdit
          Left = 718
          ExplicitLeft = 489
        end
        inherited cmbRSocial: TArtComboBox
          Width = 539
          ExplicitWidth = 310
        end
      end
    end
    object grpSiniestro: TGroupBox
      Left = 2
      Top = 134
      Width = 517
      Height = 80
      Caption = ' Siniestro '
      Color = clBtnFace
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
      DesignSize = (
        517
        80)
      object blSinFecha: TLabel
        Left = 252
        Top = 18
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object Label1: TLabel
        Left = 361
        Top = 21
        Width = 64
        Height = 13
        Caption = 'Est.Rec.Cero'
      end
      object Label2: TLabel
        Left = 230
        Top = 45
        Width = 56
        Height = 26
        Caption = 'F.Alta m'#233'd.'#13#10#218'lt.Rec.'
      end
      object Label38: TLabel
        Left = 368
        Top = 53
        Width = 58
        Height = 13
        Caption = 'Est.'#218'lt.Rec.'
      end
      object Bevel14: TBevel
        Left = 226
        Top = 9
        Width = 2
        Height = 67
      end
      object Bevel15: TBevel
        Left = 116
        Top = 9
        Width = 2
        Height = 67
      end
      object Label44: TLabel
        Left = 138
        Top = 11
        Width = 68
        Height = 13
        Caption = 'Es Pluriempleo'
      end
      object Label45: TLabel
        Left = 137
        Top = 29
        Width = 89
        Height = 13
        Caption = 'Posee Cartas Doc.'
      end
      object Label59: TLabel
        Left = 137
        Top = 46
        Width = 82
        Height = 13
        Caption = 'Eval. Ergon'#243'mica'
      end
      object Label77: TLabel
        Left = 137
        Top = 61
        Width = 80
        Height = 13
        Caption = 'Grandes Sueldos'
      end
      object pnlSiniestro: TPanel
        Left = 3
        Top = 29
        Width = 113
        Height = 29
        BevelOuter = bvNone
        TabOrder = 0
        object sbtnBuscar: TSpeedButton
          Left = 95
          Top = 5
          Width = 16
          Height = 19
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
        object edSiniestro: TSinEdit
          Left = 1
          Top = 3
          Width = 92
          Height = 22
          TabOrder = 0
          ViewStyle = [etSiniestro, etOrden]
          OnSelect = edSiniestroSelect
        end
      end
      object edEstadoRecCero: TEdit
        Left = 426
        Top = 17
        Width = 87
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edSinFecha: TDateEditor
        Left = 285
        Top = 16
        Width = 73
        Height = 21
        Hint = 'Fecha del Siniestro'
        TabStop = False
        BlanksChar = '_'
        Color = 15262169
        ReadOnly = True
        ShowButton = False
        TabOrder = 1
        ParentCtl3D = False
      end
      object edFechaAlta: TDateEditor
        Left = 285
        Top = 48
        Width = 73
        Height = 21
        TabStop = False
        BlanksChar = '_'
        Color = 15262169
        ReadOnly = True
        ShowButton = False
        TabOrder = 2
        ParentCtl3D = False
      end
      object edEstadoRecMax: TEdit
        Left = 426
        Top = 49
        Width = 87
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object chkEsPluriempleo: TCheckBox
        Left = 121
        Top = 9
        Width = 16
        Height = 17
        Caption = 'Es Pluriempleo'
        Color = clBtnFace
        Ctl3D = True
        Enabled = False
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object chkPoseeCartasDoc: TCheckBox
        Left = 121
        Top = 27
        Width = 16
        Height = 17
        Caption = 'Posee Cartas Doc.'
        Color = clBtnFace
        Ctl3D = True
        Enabled = False
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 6
      end
      object chkEvalErgonomica: TCheckBox
        Left = 121
        Top = 44
        Width = 16
        Height = 17
        Caption = 'Eval. Ergon'#243'mica'
        Color = clBtnFace
        Ctl3D = True
        Enabled = False
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object chkGrandesSueldos: TCheckBox
        Left = 121
        Top = 60
        Width = 16
        Height = 17
        Caption = 'Es Pluriempleo'
        Color = clBtnFace
        Ctl3D = True
        Enabled = False
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 8
      end
    end
    object grpTrabajador: TGroupBox
      Left = 2
      Top = 42
      Width = 782
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Trabajador '
      TabOrder = 3
      TabStop = True
      ExplicitWidth = 553
      DesignSize = (
        782
        41)
      inline fraTrabajadorSIN: TfraTrabajadorSiniestro
        Left = 5
        Top = 14
        Width = 774
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 14
        ExplicitWidth = 545
        DesignSize = (
          774
          21)
        inherited lbSiniestro: TLabel
          Left = 608
          Visible = False
          ExplicitLeft = 441
        end
        inherited edSiniestro: TSinEdit [3]
          Left = 673
          Visible = False
          ExplicitLeft = 444
        end
        inherited ToolBar: TToolBar [4]
          Left = 650
          ExplicitLeft = 421
          inherited tbLimpiar: TToolButton
            Visible = False
          end
        end
        inherited cmbNombre: TArtComboBox [5]
          Width = 689
          Columns = <
            item
              Expanded = False
              FieldName = 'CUIL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Apellido y Nombre'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EM_CUIT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'CUIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRATO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Contrato'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_NROESTABLECI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Estab.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_NOMBRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Nombre'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EM_NOMBRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Raz'#243'n Social'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SINIESTRO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Siniestro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EX_FECHAACCIDENTE'
              Title.Caption = 'Accidente'
              Visible = True
            end>
          ExplicitWidth = 460
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C01010100D400F40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    object gbUbicacion: TGroupBox
      Left = 788
      Top = 42
      Width = 326
      Height = 41
      Anchors = [akTop, akRight]
      Caption = ' Ubicaci'#243'n del siniestro '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      ExplicitLeft = 559
      DesignSize = (
        326
        41)
      object Label7: TLabel
        Left = 158
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Deleg.'
      end
      object Label6: TLabel
        Left = 4
        Top = 18
        Width = 40
        Height = 13
        Caption = 'G. Trab.'
      end
      object edDelegacion: TEdit
        Left = 192
        Top = 14
        Width = 127
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edGTrabajo: TEdit
        Left = 44
        Top = 15
        Width = 110
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object gbGravedadTipo: TGroupBox
      Left = 788
      Top = 0
      Width = 326
      Height = 42
      Anchors = [akTop, akRight]
      Caption = ' Gravedad / Tipo del siniestro '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      ExplicitLeft = 559
      DesignSize = (
        326
        42)
      object Label3: TLabel
        Left = 158
        Top = 18
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object Label4: TLabel
        Left = 4
        Top = 18
        Width = 27
        Height = 13
        Caption = 'Grav.'
      end
      object edTipo: TEdit
        Left = 184
        Top = 15
        Width = 135
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edGravedad: TEdit
        Left = 34
        Top = 15
        Width = 119
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object gbExpediente: TGroupBox
      Left = 2
      Top = 85
      Width = 110
      Height = 49
      Caption = 'Exped. Incapacidad'
      TabOrder = 5
      TabStop = True
      DesignSize = (
        110
        49)
      object edExpedIncap: TEdit
        Left = 3
        Top = 18
        Width = 103
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
        OnKeyPress = edExpedIncapKeyPress
      end
    end
    object gbEventos: TGroupBox
      Left = 624
      Top = 134
      Width = 80
      Height = 80
      Caption = ' Eventos '
      TabOrder = 6
      object rbEventosTodos: TRadioButton
        Left = 2
        Top = 25
        Width = 49
        Height = 17
        Caption = 'Todos'
        TabOrder = 0
      end
      object rbEventosActivos: TRadioButton
        Left = 2
        Top = 41
        Width = 74
        Height = 26
        Caption = 'S'#243'lo activos'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    object gbDiagnostico: TGroupBox
      Left = 114
      Top = 85
      Width = 670
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Diagn'#243'stico '
      TabOrder = 7
      ExplicitWidth = 441
      DesignSize = (
        670
        49)
      object btnSiniMasDatos: TSpeedButton
        Left = 653
        Top = 19
        Width = 13
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSiniMasDatosClick
        ExplicitLeft = 486
      end
      object edDiagnostico: TEdit
        Left = 6
        Top = 19
        Width = 646
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15262169
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ExplicitWidth = 417
      end
    end
    object GroupBox1: TGroupBox
      Left = 520
      Top = 134
      Width = 103
      Height = 80
      Caption = 'Datos de Digitaliz.'
      TabOrder = 8
      object lblPoseeDni: TLabel
        Left = 2
        Top = 24
        Width = 97
        Height = 13
        AutoSize = False
        Caption = ' Posee Fotoc. DNI '
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblPoseeRecSueldo: TLabel
        Left = 2
        Top = 46
        Width = 97
        Height = 13
        AutoSize = False
        Caption = ' Posee Recib.Sueldo  '
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object gbEnfNoListada: TGroupBox
      Left = 705
      Top = 134
      Width = 59
      Height = 80
      Caption = 'Enf.noList'
      Enabled = False
      TabOrder = 9
      object rpNL_MARCADO: TJvDBRadioPanel
        Left = 6
        Top = 20
        Width = 44
        Height = 48
        BevelOuter = bvNone
        DataField = 'NL_MARCADO'
        DataSource = dsBusqueda
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          'Si'
          'No')
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          'S'
          'N')
      end
    end
    object GroupBox2: TGroupBox
      Left = 788
      Top = 85
      Width = 326
      Height = 49
      Anchors = [akTop, akRight]
      Caption = ' CIE-10'
      TabOrder = 10
      ExplicitLeft = 559
      inline fraCie10: TfraCDG_DIAGNOSTICO
        Left = 3
        Top = 18
        Width = 319
        Height = 23
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 18
        ExplicitWidth = 319
        DesignSize = (
          319
          23)
        inherited edCodigo: TPatternEdit
          Width = 52
          Color = 15262169
          ReadOnly = True
          ExplicitWidth = 52
        end
        inherited cmbDescripcion: TComboGrid
          Left = 56
          Width = 261
          Color = 15262169
          ReadOnly = True
          ExplicitLeft = 56
          ExplicitWidth = 261
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
    end
    object edJUICIO: TEdit
      Left = 767
      Top = 152
      Width = 340
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 15262169
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 11
      ExplicitWidth = 111
    end
    object edMEDIACIONES: TEdit
      Left = 767
      Top = 188
      Width = 340
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 15262169
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 12
      ExplicitWidth = 111
    end
  end
  inherited CoolBar: TCoolBar
    Top = 217
    Width = 1116
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1116
      end>
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    ExplicitTop = 217
    ExplicitWidth = 887
    inherited ToolBar: TToolBar
      Left = 9
      Width = 1107
      Align = alNone
      ExplicitLeft = 9
      ExplicitWidth = 1107
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Datos del Trabajador (Ctrl+T)'
        ImageIndex = 26
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Hint = ''
        Enabled = False
      end
      inherited tbEnviarMail: TToolButton
        Hint = ''
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Hint = ''
        Enabled = False
        Visible = False
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 370
        Top = 0
        Enabled = False
        ImageIndex = 48
        Visible = False
      end
      object tbExpediente: TToolButton
        Left = 393
        Top = 0
        Hint = 'Expediente incapacidad (Ctrl+X)'
        Caption = 'tbExpediente'
        ImageIndex = 7
        OnClick = tbExpedienteClick
      end
      object tbReplicarDict: TToolButton
        Left = 416
        Top = 0
        Hint = 'Replicar dictamen (Ctrl+R)'
        Caption = 'tbReplicarDict'
        ImageIndex = 22
        OnClick = tbReplicarDictClick
      end
      object ToolButton9: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAutorizacion: TToolButton
        Left = 447
        Top = 0
        Hint = 'Autorizaci'#243'n (Ctrl+A)'
        Caption = 'tbAutorizacion'
        ImageIndex = 40
        OnClick = tbAutorizacionClick
      end
      object tbCancelarAutor: TToolButton
        Left = 470
        Top = 0
        Hint = 'Cancelar autorizaci'#243'n (Ctrl+Z)'
        Caption = 'tbCancelarAutor'
        ImageIndex = 8
        OnClick = tbCancelarAutorClick
      end
      object tbNoLiquidar: TToolButton
        Left = 493
        Top = 0
        Hint = 'No liquidar (Ctrl+Q)'
        Caption = 'tbNoLiquidar'
        ImageIndex = 24
        OnClick = tbNoLiquidarClick
      end
      object ToolButton2: TToolButton
        Left = 516
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        Enabled = False
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbUsuarios: TToolButton
        Left = 524
        Top = 0
        Hint = 'Usuarios (Ctrl+U)'
        Caption = 'tbUsuarios'
        ImageIndex = 19
        OnClick = tbUsuariosClick
      end
      object tbViajar: TToolButton
        Left = 547
        Top = 0
        Hint = 'Viajar...'
        Caption = 'tbViajar'
        DropdownMenu = mnuViajar
        ImageIndex = 50
        Style = tbsDropDown
        OnClick = tbViajarClick
      end
      object btnRemitoExpedientes: TToolButton
        Left = 585
        Top = 0
        Hint = 'Imprimir Remito de Expedientes'
        Caption = 'btnRemitoExpedientes'
        ImageIndex = 32
        OnClick = btnRemitoExpedientesClick
      end
      object tbSinAntCobIncap: TToolButton
        Left = 608
        Top = 0
        Hint = 'Siniestros del trabajador que poseen cobro de Incapacidad'
        Caption = 'tbSinAntCobIncap'
        ImageIndex = 44
        OnClick = tbSinAntCobIncapClick
      end
      object tbInsertarFechas: TToolButton
        Left = 631
        Top = 0
        Hint = 'Insertar Fechas'
        Caption = 'tbInsertarFechas'
        DropdownMenu = mnuInsertarFechas
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = tbInsertarFechasClick
      end
      object tbLegajo: TToolButton
        Left = 669
        Top = 0
        Hint = 'Legajo del siniestro'
        Caption = 'tbLegajo'
        DropdownMenu = mnuLegajo
        ImageIndex = 21
        Style = tbsDropDown
        OnClick = tbLegajoClick
      end
      object tbDigitalizar: TToolButton
        Left = 707
        Top = 0
        Hint = 'Digitalizar (Ctrl+D) ...'
        ImageIndex = 17
        OnClick = tbDigitalizarClick
      end
      object ToolButton12: TToolButton
        Left = 730
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAsociarArchivo: TToolButton
        Left = 738
        Top = 0
        Hint = 'Asociar Archivo...'
        Enabled = False
        ImageIndex = 54
        OnClick = tbAsociarArchivoClick
      end
      object tbNoRecitar: TToolButton
        Left = 761
        Top = 0
        Hint = 'No Recitar'
        Caption = 'No Recitar'
        Enabled = False
        ImageIndex = 27
        Style = tbsCheck
        OnClick = tbNoRecitarClick
      end
      object tbObservLegales: TToolButton
        Left = 784
        Top = 0
        Hint = 'Observaciones de Legales...'
        Caption = 'tbObservLegales'
        ImageIndex = 53
        OnClick = tbObservLegalesClick
      end
      object tbReenviarPedidoTurnoSRT: TToolButton
        Left = 807
        Top = 0
        Hint = 'Reenviar pedido de Turno a la SRT'
        Caption = 'tbReenviarPedidoTurnoSRT'
        Enabled = False
        ImageIndex = 45
        OnClick = tbReenviarPedidoTurnoSRTClick
      end
      object ToolButton1: TToolButton
        Left = 830
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir7: TToolButton
        Left = 838
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir7'
        ImageIndex = 5
        OnClick = tbSalir7Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 246
    Width = 1116
    Height = 436
    TitleFont.Name = 'Tahoma'
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod.Ev.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EVENTO'
        Title.Caption = 'Evento'
        Width = 350
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Reca'#237'da'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HORA'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PORCINCA'
        Title.Alignment = taCenter
        Title.Caption = '% Inc.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRADO'
        Title.Caption = 'Grado'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARACTER'
        Title.Caption = 'Car'#225'cter'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRAINC'
        Title.Alignment = taCenter
        Title.Caption = 'G.I.'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RETRO'
        Title.Alignment = taCenter
        Title.Caption = 'Retr.'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Caption = 'Motivo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Caption = 'Comisi'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDICO'
        Title.Caption = 'M'#233'dico'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FVENCI'
        Title.Alignment = taCenter
        Title.Caption = 'F.Vencim.'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TRATAM'
        Title.Alignment = taCenter
        Title.Caption = 'Tratam.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UBICA'
        Title.Caption = 'Ubicaci'#243'n de incapacidad'
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FINICIODEF'
        Title.Alignment = taCenter
        Title.Caption = 'F.Inicio Inc. Def.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVA'
        Title.Caption = 'Observaciones'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FCARGA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Carga'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ABANDONO'
        Title.Alignment = taCenter
        Title.Caption = 'Abandono trat.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_PRESCRIPTO'
        Title.Caption = 'Prescripto'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_ACCIDNOLABORAL'
        Title.Alignment = taCenter
        Title.Caption = 'Accid. No Laboral'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_MORTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Mortal'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHADEFUNCION'
        Title.Alignment = taCenter
        Title.Caption = 'F.Defunci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_TIPOACCI'
        Title.Caption = 'T.Accidente'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_RECUPERO'
        Title.Alignment = taCenter
        Title.Caption = 'Recupero'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_COMPLEMENTARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Complementario'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTDICT'
        Title.Caption = 'Contingencia dictamen'
        Width = 140
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODCIE101'
        Title.Alignment = taCenter
        Title.Caption = 'CIE10 1'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCIE101'
        Title.Caption = 'Descripci'#243'n CIE10 1'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODCIE102'
        Title.Alignment = taCenter
        Title.Caption = 'CIE10 2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCIE102'
        Title.Caption = 'Descripci'#243'n CIE10 2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_EXPEDINCAPACIDAD'
        Title.Caption = 'Expediente Incap.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHARETROACTIVO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Retroactivo'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_IDSEG_DICTAMEN'
        Title.Alignment = taCenter
        Title.Caption = 'Id.Seg.Dictamen'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FALTADICTAMEN'
        Title.Caption = 'F.Alta Dictamen'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_INICIO_PROV'
        Title.Alignment = taCenter
        Title.Caption = 'F.Inicio Inc. Prov.'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_MOTIVOAPELACION'
        Title.Caption = 'Motivo apelaci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Caption = 'F.Accidente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'F.Alta M'#233'dica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHATOPELIQ'
        Title.Caption = 'Fecha Tope Liq.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_DESCRIPCIONHECHO'
        Title.Caption = 'Descripci'#243'n del hecho'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_LESIONESPROVOCADAS'
        Title.Caption = 'Lesiones provocadas'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_SECUELAS'
        Title.Caption = 'Secuelas'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_PREEXISTENCIAS'
        Title.Caption = 'Preexistencias'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIFICULTAD'
        Title.Caption = 'Dificultad tareas'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_EVENTO'
        Title.Caption = 'Nro Evento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDEV_APELACION'
        Title.Caption = 'Rel. c/Apelaci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECLIQDIN'
        Title.Caption = 'Fec.Liq.Din.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAALTADICTAMEN'
        Title.Caption = 'Fecha Alta Dictamen'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_ARCHIVOASOCIADO'
        Title.Caption = 'Archivo Adjunto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_SEMODIFICOFECHAEVENTO'
        Title.Caption = 'Se Modifico Fec.Evento'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ev_recitar'
        Title.Caption = 'Recitar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ev_integral'
        Title.Caption = 'Integral'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ev_prevencion'
        Title.Caption = 'Prevenci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ev_fechaentregaexped'
        Title.Caption = 'Fec. Entrega Exp.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ev_nroexpedientesrt'
        Title.Caption = 'Nro.Exped. SRT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHARECEPCION'
        Title.Caption = 'Fecha de Recep. del Dict.'
        Width = 120
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox [3]
    Left = 244
    Top = 400
    Width = 693
    Height = 1124
    TabOrder = 3
    Visible = False
    object fpPrestadorEstComp: TFormPanel
      Left = 10
      Top = 1
      Width = 611
      Height = 111
      Caption = 'Prestador'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        611
        111)
      object Bevel10: TBevel
        Left = 2
        Top = 11
        Width = 606
        Height = 2
      end
      object Label40: TLabel
        Left = 9
        Top = 4
        Width = 292
        Height = 13
        Caption = ' Seleccionar el Prestador para los Estudios complementarios: '
      end
      object Bevel11: TBevel
        Left = 2
        Top = 78
        Width = 606
        Height = 2
      end
      object btnPrestadorAceptar: TBitBtn
        Left = 525
        Top = 82
        Width = 80
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnPrestadorAceptarClick
      end
      inline fraPrestadorEstComp: TfraCPR_PRESTADOR
        Left = 3
        Top = 23
        Width = 605
        Height = 53
        VertScrollBar.Range = 49
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 23
        ExplicitWidth = 605
        DesignSize = (
          605
          53)
        inherited lbCPostal: TLabel
          Left = 526
          ExplicitLeft = 526
        end
        inherited cmbCA_DESCRIPCION: TArtComboBox
          Width = 275
          ExplicitWidth = 275
        end
        inherited edCA_LOCALIDAD: TEdit
          Width = 151
          ExplicitWidth = 151
        end
        inherited edCA_CODPOSTAL: TEdit
          Left = 550
          ExplicitLeft = 550
        end
      end
    end
    object fpDigitalizar: TFormPanel
      Left = 8
      Top = 113
      Width = 455
      Height = 82
      Caption = 'Digitalizaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        455
        82)
      object Bevel2: TBevel
        Left = 8
        Top = 44
        Width = 437
        Height = 2
      end
      object btnDigAceptar: TBitBtn
        Left = 376
        Top = 52
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnDigAceptarClick
      end
      inline fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO
        Left = 9
        Top = 15
        Width = 437
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 9
        ExplicitTop = 15
      end
    end
    object fpFirmanteBaja: TFormPanel
      Left = 9
      Top = 197
      Width = 311
      Height = 90
      Caption = 'Firmante'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        311
        90)
      object Label37: TLabel
        Left = 9
        Top = 8
        Width = 226
        Height = 13
        Caption = 'Seleccionar el firmante para el reporte de Baja:'
      end
      object btnAceptarFirmante: TBitBtn
        Left = 231
        Top = 58
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarFirmanteClick
      end
      inline fraFirmanteBaja: TfraCodigoDescripcion
        Left = 9
        Top = 27
        Width = 296
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 9
        ExplicitTop = 27
        ExplicitWidth = 296
        DesignSize = (
          296
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 46
          Width = 247
          DataSource = nil
          ExplicitLeft = 46
          ExplicitWidth = 247
        end
        inherited edCodigo: TPatternEdit
          Width = 41
          ExplicitWidth = 41
        end
      end
    end
    object fpFechaDictamen: TFormPanel
      Left = 323
      Top = 270
      Width = 278
      Height = 75
      Caption = 'Fecha dictamen'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpFechaDictamenBeforeShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        278
        75)
      object Label33: TLabel
        Left = 7
        Top = 11
        Width = 164
        Height = 13
        Caption = 'Fecha de alta m'#233'dica del dictamen'
      end
      object Bevel7: TBevel
        Left = 7
        Top = 40
        Width = 264
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarAltaDict: TBitBtn
        Left = 118
        Top = 46
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAceptarAltaDictClick
      end
      object dcAltaDictamen: TDateComboBox
        Left = 183
        Top = 8
        Width = 88
        Height = 21
        Hint = 'Fecha de baja del expediente'
        TabOrder = 0
      end
      object btnCancelarrAltaDict: TBitBtn
        Left = 197
        Top = 46
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnCancelarrAltaDictClick
      end
    end
    object fpNotaEntregaReq: TFormPanel
      Left = 323
      Top = 198
      Width = 262
      Height = 70
      Caption = 'Nota entrega requerimientos'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpNotaEntregaReqBeforeShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        262
        70)
      object Label32: TLabel
        Left = 5
        Top = 11
        Width = 152
        Height = 13
        Caption = 'Seleccione la fecha para la nota'
      end
      object Bevel6: TBevel
        Left = 7
        Top = 35
        Width = 248
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarNota: TBitBtn
        Left = 181
        Top = 41
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarNotaClick
      end
      object dcNota: TDateComboBox
        Left = 167
        Top = 8
        Width = 88
        Height = 21
        Hint = 'Fecha de baja del expediente'
        TabOrder = 1
      end
    end
    object fpUsuarios: TFormPanel
      Left = 6
      Top = 289
      Width = 281
      Height = 102
      Caption = 'Usuarios del evento'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      Position = poOwnerFormCenter
      DesignSize = (
        281
        102)
      object Bevel3: TBevel
        Left = 3
        Top = 66
        Width = 275
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label30: TLabel
        Left = 8
        Top = 14
        Width = 72
        Height = 13
        Caption = 'Usuario de alta'
      end
      object Label31: TLabel
        Left = 8
        Top = 42
        Width = 84
        Height = 13
        Caption = 'Usuario de modif.'
      end
      object btnCerrarUsu: TBitBtn
        Left = 202
        Top = 72
        Width = 75
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
      end
      object edUsuAlta: TEdit
        Left = 97
        Top = 10
        Width = 178
        Height = 21
        Color = 15262169
        ReadOnly = True
        TabOrder = 1
      end
      object edUsuModif: TEdit
        Left = 97
        Top = 38
        Width = 178
        Height = 21
        Color = 15262169
        ReadOnly = True
        TabOrder = 2
      end
    end
    object fpTextoNotaRectif: TFormPanel
      Left = 4
      Top = 411
      Width = 503
      Height = 301
      Caption = 'Texto de la Nota Rectificatoria'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        503
        301)
      object Bevel9: TBevel
        Left = 3
        Top = 265
        Width = 497
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label36: TLabel
        Left = 9
        Top = 9
        Width = 388
        Height = 26
        Caption = 
          'Ud. puede modificar el texto de la Nota Rectificatoria y luego p' +
          'resionar Aceptar. '#13#10'Si no desea modificarlo presione Cancelar.'
      end
      object btnAceptar: TBitBtn
        Left = 328
        Top = 269
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarCartaClick
      end
      object btnCancelar: TBitBtn
        Left = 414
        Top = 268
        Width = 75
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnCancelarClick
      end
      object MemoTextoFijo: TMemo
        Left = 4
        Top = 44
        Width = 466
        Height = 179
        Lines.Strings = (
          'MemoTextoFijo')
        TabOrder = 2
        Visible = False
      end
      object memoTexto: TMemo
        Left = 4
        Top = 44
        Width = 493
        Height = 216
        BevelInner = bvLowered
        BevelOuter = bvRaised
        Ctl3D = True
        Lines.Strings = (
          'memoTexto')
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
    object fpDictamenes: TFormPanel
      Left = 18
      Top = 697
      Width = 411
      Height = 183
      Caption = 'Seleccione dictamen para apelaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpDictamenesBeforeShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        411
        183)
      object Bevel4: TBevel
        Left = 7
        Top = 149
        Width = 397
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label24: TLabel
        Left = 8
        Top = 130
        Width = 80
        Height = 13
        Caption = 'Motivo apelaci'#243'n'
      end
      object btnAceptarDictamenes: TBitBtn
        Left = 330
        Top = 153
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAceptarDictamenesClick
      end
      object dgDictamenes: TArtDBGrid
        Left = 3
        Top = 8
        Width = 402
        Height = 114
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsDictamenes
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EXPEDIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Expediente'
            Width = 128
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PORCENTAJE'
            Title.Alignment = taCenter
            Title.Caption = 'Porcentaje'
            Width = 98
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 100
            Visible = True
          end>
      end
      object edMotivoApelacion: TEdit
        Left = 96
        Top = 126
        Width = 307
        Height = 21
        MaxLength = 250
        TabOrder = 0
      end
    end
    object fpApelaciones: TFormPanel
      Left = 2
      Top = 897
      Width = 543
      Height = 221
      Caption = 'Seleccione la apelaci'#243'n para el dictamen'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpApelacionesBeforeShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        543
        221)
      object btnAceptarApelaciones: TBitBtn
        Left = 462
        Top = 191
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarApelacionesClick
      end
      object dgApelaciones: TArtDBGrid
        Left = 3
        Top = 5
        Width = 536
        Height = 172
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsApelaciones
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        RowColorsUse = True
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'CODEVENTO'
            Title.Caption = 'C'#243'd. Ev.'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EVENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Evento'
            Width = 367
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHAEVENTO'
            Title.Caption = 'Fecha Evento'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EV_HORA'
            Title.Caption = 'Hora'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EV_IDEVENTO'
            Visible = True
          end>
      end
      object memoSeleccionado: TMemo
        Left = 4
        Top = 180
        Width = 449
        Height = 37
        Color = clMenuBar
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object fpFecLiqDin: TFormPanel
      Left = 323
      Top = 343
      Width = 241
      Height = 64
      Caption = 'Fecha Liquidaci'#243'n Dinerarias'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpFecLiqDinBeforeShow
      DesignSize = (
        241
        64)
      object Label58: TLabel
        Left = 5
        Top = 11
        Width = 139
        Height = 13
        Caption = 'Fecha Liquidaci'#243'n Dinerarias:'
      end
      object Bevel22: TBevel
        Left = 7
        Top = 32
        Width = 227
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarFecLiqDin: TBitBtn
        Left = 161
        Top = 36
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAceptarFecLiqDinClick
      end
      object dcFecLiqDin: TDateComboBox
        Left = 147
        Top = 8
        Width = 90
        Height = 21
        Hint = 'Fecha de baja del expediente'
        TabOrder = 0
      end
    end
    object fpDigitalizarDespues: TFormPanel
      Left = 283
      Top = 763
      Width = 357
      Height = 118
      Caption = 'Digitalizar'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpDigitalizarDespuesBeforeShow
      OnShow = fpDigitalizarDespuesShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 150
      Color = clMenuBar
      DesignSize = (
        357
        118)
      object Bevel27: TBevel
        Left = 7
        Top = 87
        Width = 343
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label68: TLabel
        Left = 7
        Top = 68
        Width = 73
        Height = 13
        Caption = 'Cantidad Hojas'
      end
      object btnDigDicAceptar: TBitBtn
        Left = 281
        Top = 91
        Width = 71
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 5
        OnClick = btnDigDicAceptarClick
      end
      object cmbDA_OPCION: TComboBox
        Left = 122
        Top = 36
        Width = 229
        Height = 21
        Style = csDropDownList
        Color = clCaptionText
        ItemIndex = 0
        TabOrder = 3
        Text = 'Digitalizaci'#243'n'
        Items.Strings = (
          'Digitalizaci'#243'n'
          'Guarda')
      end
      object edDA_HOJAS: TIntEdit
        Left = 122
        Top = 62
        Width = 38
        Height = 21
        TabOrder = 4
        MaxLength = 3
      end
      inline fraCodDigitalizacion: TfraCodigoDescripcion
        Left = 121
        Top = 10
        Width = 235
        Height = 23
        TabOrder = 1
        ExplicitLeft = 121
        ExplicitTop = 10
        ExplicitWidth = 235
        DesignSize = (
          235
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 51
          Width = 178
          ExplicitLeft = 51
          ExplicitWidth = 178
        end
        inherited edCodigo: TPatternEdit
          Width = 48
          ExplicitWidth = 48
        end
      end
      object chkCodigoDigitalizacion: TRadioButton
        Left = 3
        Top = 15
        Width = 117
        Height = 17
        Caption = 'C'#243'digo Digitalizaci'#243'n'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = chkCodigoDigitalizacionClick
      end
      object chkDestinoPapel: TRadioButton
        Left = 3
        Top = 43
        Width = 86
        Height = 13
        Caption = 'Destino Papel'
        TabOrder = 2
        OnClick = chkDestinoPapelClick
      end
    end
  end
  object ScrollBox2: TScrollBox [4]
    Left = 649
    Top = 268
    Width = 700
    Height = 545
    TabOrder = 4
    Visible = False
    object fpFechaTopeLiquid: TFormPanel
      Left = 285
      Top = 369
      Width = 192
      Height = 71
      Caption = 'Fecha tope de Liquidaciones'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpImpRemitoExpedientesBeforeShow
      DesignSize = (
        192
        71)
      object Bevel16: TBevel
        Left = 4
        Top = 40
        Width = 184
        Height = 2
      end
      object Label49: TLabel
        Left = 9
        Top = 15
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object btnCancelarFecTopeLiq: TBitBtn
        Left = 109
        Top = 45
        Width = 74
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
      end
      object btnAceptarFecTopeLiq: TBitBtn
        Left = 29
        Top = 45
        Width = 74
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAceptarFecTopeLiqClick
      end
      object dcFecTopeLiq: TDateComboBox
        Left = 44
        Top = 11
        Width = 102
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
    end
    object fpSeleccionRecaida: TFormPanel
      Left = 8
      Top = 7
      Width = 262
      Height = 70
      Caption = 'Recaida del evento'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpSeleccionRecaidaBeforeShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        262
        70)
      object lbSelRecaida: TLabel
        Left = 5
        Top = 11
        Width = 206
        Height = 13
        Caption = 'Reca'#237'da para Carta Documento / Comercial'
      end
      object Bevel8: TBevel
        Left = 7
        Top = 35
        Width = 248
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object cmbRecaida: TRxDBLookupCombo
        Left = 219
        Top = 7
        Width = 39
        Height = 21
        DropDownCount = 3
        Anchors = [akLeft, akTop, akRight]
        LookupField = 'EX_RECAIDA'
        LookupDisplay = 'EX_RECAIDA'
        LookupSource = dsRecaidas
        TabOrder = 0
      end
      object btnAceptarRecaida: TBitBtn
        Left = 181
        Top = 41
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Kind = bkYes
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAceptarRecaidaClick
      end
    end
    object fpFecha2daCitacion: TFormPanel
      Left = 14
      Top = 87
      Width = 263
      Height = 90
      Caption = ' Ingrese Fecha y Hora'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        263
        90)
      object Label41: TLabel
        Left = 9
        Top = 31
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object Label42: TLabel
        Left = 157
        Top = 31
        Width = 23
        Height = 13
        Caption = 'Hora'
      end
      object Bevel12: TBevel
        Left = 4
        Top = 12
        Width = 253
        Height = 2
      end
      object Bevel13: TBevel
        Left = 5
        Top = 55
        Width = 254
        Height = 2
      end
      object Label43: TLabel
        Left = 14
        Top = 6
        Width = 163
        Height = 13
        Caption = ' Fecha y Hora de la 2da. Citaci'#243'n:'
      end
      object btnAceptarFec2daCit: TBitBtn
        Left = 188
        Top = 61
        Width = 69
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarFec2daCitClick
      end
      object dcFecha2daCit: TDateComboBox
        Left = 43
        Top = 27
        Width = 100
        Height = 21
        TabOrder = 1
      end
      object mskHora2daCit: TMaskEdit
        Left = 187
        Top = 27
        Width = 47
        Height = 21
        EditMask = '##:##;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
    end
    object fpImpRemitoExpedientes: TFormPanel
      Left = 12
      Top = 181
      Width = 267
      Height = 104
      Caption = 'Impresi'#243'n del Remito de Expedientes'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpImpRemitoExpedientesBeforeShow
      DesignSize = (
        267
        104)
      object Bevel17: TBevel
        Left = 5
        Top = 68
        Width = 258
        Height = 2
      end
      object Label46: TLabel
        Left = 11
        Top = 17
        Width = 85
        Height = 13
        Caption = 'Fecha de Evento:'
      end
      object Label47: TLabel
        Left = 55
        Top = 45
        Width = 40
        Height = 13
        Caption = 'Usuario:'
      end
      object btnAceptarRemitoExp: TBitBtn
        Left = 108
        Top = 75
        Width = 73
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarRemitoExpClick
      end
      object dcFechaEventoRemito: TDateComboBox
        Left = 100
        Top = 12
        Width = 102
        Height = 21
        TabOrder = 1
      end
      object edUsuarioAltaEventoRemito: TEdit
        Left = 100
        Top = 40
        Width = 160
        Height = 21
        TabOrder = 2
      end
      object btnCancelarRemitoExp: TBitBtn
        Left = 189
        Top = 75
        Width = 73
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 3
      end
    end
    object fpSiniIncap: TFormPanel
      Left = 13
      Top = 293
      Width = 263
      Height = 209
      Caption = 'Siniestros con cobro de Incapacidad'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpImpRemitoExpedientesBeforeShow
      DesignSize = (
        263
        209)
      object Label48: TLabel
        Left = 9
        Top = 8
        Width = 231
        Height = 26
        Caption = 
          'Siniestros anteriores del trabajador que poseen '#13#10'cobro de Incap' +
          'acidad:'
      end
      object btnCerrarSiniIncap: TBitBtn
        Left = 194
        Top = 181
        Width = 64
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
      end
      object ArtDBGrid_SiniIncap: TArtDBGrid
        Left = 4
        Top = 42
        Width = 256
        Height = 136
        DataSource = dsSiniIncap
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Caption = 'Siniestro'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Caption = 'Orden'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECAIDA'
            Title.Caption = 'Reca'#237'da'
            Width = 56
            Visible = True
          end>
      end
    end
    object fpTipoCarta: TFormPanel
      Left = 487
      Top = 375
      Width = 205
      Height = 106
      Caption = 'Tipo de Carta a Generar'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biMinimize, biMaximize]
      BorderStyle = bsToolWindow
      Position = poMainFormCenter
      DesignSize = (
        205
        106)
      object rgTipoCarta: TRadioGroup
        Left = 0
        Top = 0
        Width = 205
        Height = 73
        Align = alTop
        ItemIndex = 0
        Items.Strings = (
          'Carta Documento'
          'Carta Comercial')
        TabOrder = 0
      end
      object btnAceptarCarta: TBitBtn
        Left = 124
        Top = 77
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAceptarCartaClick
      end
    end
    object fpExpediente: TFormPanel
      Left = 311
      Top = 3
      Width = 378
      Height = 354
      Caption = 'Expediente de Incapacidad'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpExpedienteBeforeShow
      DesignSize = (
        378
        354)
      object gbDatosExp: TGroupBox
        Left = 0
        Top = 0
        Width = 378
        Height = 71
        Align = alTop
        Caption = ' Datos del expediente '
        TabOrder = 0
        object Label5: TLabel
          Left = 50
          Top = 22
          Width = 54
          Height = 13
          Caption = 'Expediente'
        end
        object Label22: TLabel
          Left = 8
          Top = 50
          Width = 95
          Height = 13
          Caption = 'Exped. Incapacidad'
        end
        object edSiniestroExp: TSinEdit
          Left = 108
          Top = 18
          Width = 100
          Height = 21
          TabOrder = 1
          ReadOnly = True
          TabStop = False
          Color = 15262169
        end
        object edExpedIncapABM: TEdit
          Left = 108
          Top = 45
          Width = 176
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 0
        end
      end
      object btnGuardarExped: TBitBtn
        Left = 227
        Top = 326
        Width = 72
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Guardar'
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          0400000000004001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
          0000AAA88888888888888A000000A8888800000088880A777778888887777800
          0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
          FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
          7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
          FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
          FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
          9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
          F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
          8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
          FFF778016E02AA88888888888888AAA77777777777777A006701}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnGuardarExpedClick
      end
      object btnCerrarExped: TBitBtn
        Left = 303
        Top = 326
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
      end
      object btnAceptarExped: TBitBtn
        Left = 303
        Top = 326
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btnAceptarExpedClick
      end
      object dgExpediente: TArtDBGrid
        Left = 3
        Top = 75
        Width = 370
        Height = 149
        DataSource = dsExpediente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'IX_EXPEDINCAPACIDAD'
            Title.Caption = 'Expediente'
            Width = 173
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'IX_FBAJA'
            Title.Alignment = taCenter
            Title.Caption = 'F. baja'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IX_MOTIVOBAJA'
            Title.Caption = 'Motivo Baja'
            Width = 94
            Visible = True
          end>
      end
      object gbBaja: TGroupBox
        Left = 4
        Top = 229
        Width = 369
        Height = 88
        Caption = ' Datos para realizar la Baja '
        TabOrder = 5
        DesignSize = (
          369
          88)
        object Label34: TLabel
          Left = 7
          Top = 20
          Width = 57
          Height = 13
          Caption = 'Fecha Baja:'
        end
        object Label35: TLabel
          Left = 106
          Top = 20
          Width = 60
          Height = 13
          Caption = 'Motivo Baja:'
        end
        object dcBajaExped: TDateComboBox
          Left = 5
          Top = 33
          Width = 96
          Height = 21
          Hint = 'Fecha de baja del expediente'
          TabOrder = 0
        end
        object edMotivoBaja: TEdit
          Left = 104
          Top = 33
          Width = 258
          Height = 21
          MaxLength = 100
          TabOrder = 1
        end
        object btnBajaExp: TBitBtn
          Left = 291
          Top = 58
          Width = 70
          Height = 24
          Anchors = [akRight, akBottom]
          Caption = '&Baja'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888808888888888088800088888888888880000888888
            8088888000888888088888880008888008888888800088008888888888000008
            8888888888800088888888888800000888888888800088008888888000088880
            0888880000888888008888000888888888088888888888888888}
          TabOrder = 2
          OnClick = btnBajaExpClick
        end
      end
    end
    object fpFechaAltaDictamen: TFormPanel
      Left = 281
      Top = 449
      Width = 209
      Height = 71
      Caption = 'Fecha de Alta del Dictamen'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpFechaAltaDictamenBeforeShow
      DesignSize = (
        209
        71)
      object Bevel23: TBevel
        Left = 4
        Top = 38
        Width = 201
        Height = 2
      end
      object Label60: TLabel
        Left = 5
        Top = 16
        Width = 98
        Height = 13
        Caption = 'Fecha Alta Dictamen'
      end
      object btnAceptarFecAltaDictamen: TBitBtn
        Left = 50
        Top = 43
        Width = 74
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 1
      end
      object dcFecAltaDictamen: TDateComboBox
        Left = 107
        Top = 11
        Width = 97
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
      object btnCancelarFecAltaDictamen: TBitBtn
        Left = 129
        Top = 43
        Width = 74
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
      end
    end
  end
  object sbEvento: TScrollBox [5]
    Left = 321
    Top = 19
    Width = 558
    Height = 1515
    TabOrder = 5
    Visible = False
    object fpEventos: TFormPanel
      Left = 11
      Top = 1
      Width = 515
      Height = 554
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpEventosBeforeShow
      DesignSize = (
        515
        554)
      object gbDatosEvento: TGroupBox
        Left = 0
        Top = 0
        Width = 515
        Height = 527
        Align = alTop
        Caption = ' Datos del evento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          515
          527)
        object Label8: TLabel
          Left = 8
          Top = 18
          Width = 54
          Height = 13
          Caption = 'Expediente'
        end
        object Label9: TLabel
          Left = 27
          Top = 42
          Width = 34
          Height = 13
          Caption = 'Evento'
        end
        object Label10: TLabel
          Left = 31
          Top = 62
          Width = 29
          Height = 13
          Caption = 'Fecha'
        end
        object Hora: TLabel
          Left = 160
          Top = 62
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object Label11: TLabel
          Left = 379
          Top = 63
          Width = 43
          Height = 13
          Caption = 'F.vencim'
        end
        object Label12: TLabel
          Left = 228
          Top = 62
          Width = 59
          Height = 13
          Caption = 'F. recepci'#243'n'
        end
        object Label13: TLabel
          Left = 29
          Top = 82
          Width = 32
          Height = 13
          Caption = 'Motivo'
        end
        object Label14: TLabel
          Left = 19
          Top = 98
          Width = 42
          Height = 26
          Caption = 'Comisi'#243'n'#13#10'  m'#233'dica'
        end
        object Label15: TLabel
          Left = 26
          Top = 128
          Width = 33
          Height = 13
          Caption = 'M'#233'dico'
        end
        object Label16: TLabel
          Left = 21
          Top = 149
          Width = 42
          Height = 13
          Caption = 'Firmante'
        end
        object Label17: TLabel
          Left = 5
          Top = 164
          Width = 55
          Height = 26
          Caption = '  Ubicaci'#243'n'#13#10'de incapac.'
        end
        object Label18: TLabel
          Left = 3
          Top = 232
          Width = 64
          Height = 26
          Caption = 'Incapacidad'#13#10'  otorgada %'
        end
        object Label19: TLabel
          Left = 5
          Top = 321
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Label20: TLabel
          Left = 187
          Top = 295
          Width = 60
          Height = 26
          Caption = 'Inicio incap. '#13#10'definitiva'
        end
        object Label25: TLabel
          Left = 357
          Top = 295
          Width = 60
          Height = 26
          Caption = 'Inicio incap. '#13#10'provisoria'
        end
        object Bevel5: TBevel
          Left = 3
          Top = 368
          Width = 508
          Height = 3
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label21: TLabel
          Left = 4
          Top = 363
          Width = 80
          Height = 13
          Caption = ' Datos dictamen '
        end
        object Label23: TLabel
          Left = 10
          Top = 421
          Width = 62
          Height = 13
          Caption = 'Contingencia'
        end
        object Bevel1: TBevel
          Left = 3
          Top = 493
          Width = 508
          Height = 3
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label26: TLabel
          Left = 4
          Top = 486
          Width = 124
          Height = 13
          Caption = ' Documentaci'#243'n asociada '
        end
        object Label27: TLabel
          Left = 330
          Top = 505
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object Label28: TLabel
          Left = 400
          Top = 505
          Width = 23
          Height = 13
          Caption = 'CUIL'
        end
        object Label29: TLabel
          Left = 4
          Top = 505
          Width = 26
          Height = 13
          Caption = 'Trab.'
        end
        object Label39: TLabel
          Left = 15
          Top = 194
          Width = 44
          Height = 13
          Caption = 'Area mail'
        end
        object lblNiegaFirmarIncap: TLabel
          Left = 86
          Top = 212
          Width = 199
          Height = 13
          Caption = 'El Afiliado se niega a firmar la incapacidad'
          Enabled = False
        end
        object Label50: TLabel
          Left = 34
          Top = 444
          Width = 38
          Height = 13
          Caption = 'CIE10 1'
        end
        object Label51: TLabel
          Left = 33
          Top = 467
          Width = 38
          Height = 13
          Caption = 'CIE10 2'
        end
        object lblAFavorART: TLabel
          Left = 335
          Top = 212
          Width = 74
          Height = 13
          Caption = 'A favor de ART'
          Enabled = False
        end
        object edSiniestroABM: TSinEdit
          Left = 68
          Top = 13
          Width = 115
          Height = 21
          TabOrder = 38
          ReadOnly = True
          TabStop = False
          Color = 15262169
        end
        object dcFecha: TDateComboBox
          Left = 68
          Top = 57
          Width = 87
          Height = 21
          TabOrder = 1
        end
        object dcFechaVencim: TDateComboBox
          Left = 424
          Top = 57
          Width = 87
          Height = 21
          TabOrder = 4
        end
        inline fraMotivo: TfraCodigoDescripcion
          Left = 67
          Top = 78
          Width = 445
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 67
          ExplicitTop = 78
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 380
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 380
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
        end
        inline fraComMedica: TfraCodigoDescripcion
          Left = 67
          Top = 100
          Width = 445
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          ExplicitLeft = 67
          ExplicitTop = 100
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 380
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 380
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
        end
        inline fraMedico: TfraCodigoDescripcion
          Left = 67
          Top = 122
          Width = 445
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          ExplicitLeft = 67
          ExplicitTop = 122
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 380
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 380
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
        end
        inline fraUbicIncap: TfraCodigoDescripcion
          Left = 67
          Top = 166
          Width = 445
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
          ExplicitLeft = 67
          ExplicitTop = 166
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 380
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 380
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
        end
        object gbGrado: TGroupBox
          Left = 134
          Top = 226
          Width = 168
          Height = 33
          Caption = ' Grado '
          TabOrder = 12
          object rbParcial: TRadioButton
            Left = 10
            Top = 14
            Width = 52
            Height = 17
            Caption = 'Parcial'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbTotal: TRadioButton
            Left = 106
            Top = 14
            Width = 48
            Height = 15
            Caption = 'Total'
            TabOrder = 1
          end
        end
        object gbCaracter: TGroupBox
          Left = 304
          Top = 226
          Width = 205
          Height = 33
          Caption = ' Car'#225'cter '
          TabOrder = 13
          object rbProvisorio: TRadioButton
            Left = 14
            Top = 13
            Width = 68
            Height = 17
            Caption = 'Provisorio'
            TabOrder = 0
            OnClick = rbProvisorioClick
          end
          object rbDefinitivo: TRadioButton
            Left = 102
            Top = 13
            Width = 65
            Height = 17
            Caption = 'Definitivo'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbDefinitivoClick
          end
        end
        object chkGranInvalidez: TCheckBox
          Left = 6
          Top = 261
          Width = 89
          Height = 17
          Caption = 'Gran invalidez'
          TabOrder = 14
        end
        object chkTratamiento: TCheckBox
          Left = 205
          Top = 278
          Width = 81
          Height = 17
          Caption = 'Tratamiento'
          TabOrder = 21
        end
        object chkRetroactivo: TCheckBox
          Left = 6
          Top = 300
          Width = 77
          Height = 17
          Caption = 'Retroactivo'
          TabOrder = 23
          OnClick = chkRetroactivoClick
        end
        object chkRecalificacion: TCheckBox
          Left = 6
          Top = 278
          Width = 89
          Height = 17
          Caption = 'Recalificaci'#243'n'
          TabOrder = 19
        end
        object chkEstudios: TCheckBox
          Left = 102
          Top = 261
          Width = 65
          Height = 17
          Caption = 'Estudios'
          TabOrder = 15
        end
        object chkReingreso: TCheckBox
          Left = 309
          Top = 278
          Width = 73
          Height = 15
          Caption = 'Reingreso'
          TabOrder = 22
        end
        object chkEnfInculpable: TCheckBox
          Left = 205
          Top = 261
          Width = 89
          Height = 17
          Caption = 'Enf. inculpable'
          TabOrder = 16
        end
        object chkAbandono: TCheckBox
          Left = 102
          Top = 278
          Width = 89
          Height = 17
          Caption = 'Aband. tratam.'
          TabOrder = 20
        end
        object dcIncDef: TDateComboBox
          Left = 249
          Top = 297
          Width = 93
          Height = 21
          TabOrder = 25
        end
        object edObservaciones: TMemo
          Left = 84
          Top = 321
          Width = 426
          Height = 43
          MaxLength = 500
          ScrollBars = ssVertical
          TabOrder = 27
        end
        object mskHora: TMaskEdit
          Left = 185
          Top = 57
          Width = 37
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 2
          Text = '  :  '
        end
        inline fraEvento: TfraCodDesc
          Left = 67
          Top = 34
          Width = 446
          Height = 23
          TabOrder = 0
          ExplicitLeft = 67
          ExplicitTop = 34
          ExplicitWidth = 446
          DesignSize = (
            446
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 381
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 381
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraFields = 
              ', EI_FECHAPOSTERIOR, EI_EXIGEHORA, EI_VENCIMIENTO, EI_RECEPCION,' +
              ' EI_DIASPOS, EI_NIVELPERFIL, EI_NROEXPEDIENTE, EI_PORMINIMO, EI_' +
              'PORMAXIMO, EI_GRANINVALIDEZ, EI_TRATAMIENTO, EI_RETROACTIVO, EI_' +
              'RECALIFICACION, EI_ESTUDIOS, EI_REINGRESO, EI_TIPOEVENTO, EI_TEL' +
              'EGRAMAALTA, EI_CHECKRECUPERO, EI_CARACTERNULO, EI_GENERAOTROEVEN' +
              'TO'
            FieldBaja = 'EI_FECHABAJA'
            FieldCodigo = 'EI_CODIGO'
            FieldDesc = 'EI_DESCRIPCION'
            FieldID = 'EI_ID'
            OrderBy = 'EI_CODIGO'
            TableName = 'SIN.SEI_EVENTOINCAPACIDAD'
            OnChange = fraEventoPropiedadesChange
          end
        end
        object edPorcentaje: TEdit
          Left = 68
          Top = 234
          Width = 62
          Height = 21
          MaxLength = 5
          TabOrder = 11
          OnChange = edPorcentajeChange
          OnKeyPress = edPorcentajeKeyPress
        end
        inline fraFirmante: TfraCodigoDescripcion
          Left = 67
          Top = 144
          Width = 445
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          ExplicitLeft = 67
          ExplicitTop = 144
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 380
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 380
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
        end
        object dcFechaRetro: TDateComboBox
          Left = 84
          Top = 298
          Width = 93
          Height = 21
          Color = 15262169
          ReadOnly = True
          TabOrder = 24
        end
        object dcIncProv: TDateComboBox
          Left = 417
          Top = 297
          Width = 93
          Height = 21
          Color = clWhite
          TabOrder = 26
        end
        object chkAccidNoLab: TCheckBox
          Left = 309
          Top = 261
          Width = 98
          Height = 17
          Caption = 'Accid. no laboral'
          TabOrder = 17
        end
        object chkMortal: TCheckBox
          Left = 5
          Top = 380
          Width = 82
          Height = 17
          Caption = 'Marca mortal'
          TabOrder = 28
          OnClick = chkMortalClick
        end
        object dcFechaDefuncion: TDateComboBox
          Left = 87
          Top = 377
          Width = 96
          Height = 21
          Color = 15262169
          ReadOnly = True
          TabOrder = 29
        end
        inline fraContingenciaDic: TfraCodigoDescripcion
          Left = 73
          Top = 416
          Width = 438
          Height = 23
          TabOrder = 32
          ExplicitLeft = 73
          ExplicitTop = 416
          ExplicitWidth = 438
          DesignSize = (
            438
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 381
            Color = 15262169
            ReadOnly = True
            DataSource = nil
            ExplicitLeft = 56
            ExplicitWidth = 381
          end
          inherited edCodigo: TPatternEdit
            Width = 52
            Color = 15262169
            ReadOnly = True
            ExplicitWidth = 52
          end
        end
        object chkRecupero: TCheckBox
          Left = 187
          Top = 395
          Width = 65
          Height = 15
          Caption = 'Recupero'
          TabOrder = 30
        end
        object chkComplemento: TCheckBox
          Left = 5
          Top = 399
          Width = 125
          Height = 13
          Caption = 'Complementa anterior'
          TabOrder = 31
        end
        object edIDDocAsoc: TIntEdit
          Left = 343
          Top = 501
          Width = 53
          Height = 21
          TabOrder = 36
          OnEnter = edIDDocAsocEnter
          OnExit = edIDDocAsocExit
          OnKeyPress = edIDDocAsocKeyPress
        end
        object mskCUITDocAsoc: TMaskEdit
          Left = 426
          Top = 501
          Width = 84
          Height = 21
          EditMask = '99-99999999-c;0;'
          MaxLength = 13
          TabOrder = 37
          OnExit = mskCUITDocAsocExit
        end
        object cmbTrabDocAsoc: TArtComboBox
          Left = 30
          Top = 501
          Width = 296
          Height = 21
          CharCase = ecUpperCase
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 35
          OnEnter = cmbTrabDocAsocEnter
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_ID'
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CUIL'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_NOMBRE'
              Title.Caption = 'Trabajador'
              Width = 120
              Visible = True
            end>
          DataSource = dsPapeleria
          FieldList = 'ID_NOMBRE'
          FieldKey = 'ID_ID'
          OnCloseUp = cmbTrabDocAsocCloseUp
          OnDropDown = cmbTrabDocAsocDropDown
        end
        object dcFechaRecep: TDateComboBox
          Left = 289
          Top = 57
          Width = 87
          Height = 21
          TabOrder = 3
          OnExit = dcFechaRecepExit
        end
        object chkPrescripto: TCheckBox
          Left = 420
          Top = 261
          Width = 69
          Height = 17
          Caption = 'Prescripto'
          TabOrder = 18
        end
        inline fraArea: TfraCodigoDescripcion
          Left = 67
          Top = 188
          Width = 445
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
          ExplicitLeft = 67
          ExplicitTop = 188
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 380
            DataSource = nil
            ExplicitLeft = 63
            ExplicitWidth = 380
          end
          inherited edCodigo: TPatternEdit
            Width = 61
            ExplicitWidth = 61
          end
        end
        object chkNiegaFirmarIncap: TCheckBox
          Left = 67
          Top = 210
          Width = 16
          Height = 17
          TabOrder = 39
        end
        inline fraCIE101: TfraCDG_DIAGNOSTICO
          Left = 73
          Top = 439
          Width = 438
          Height = 23
          TabOrder = 33
          ExplicitLeft = 73
          ExplicitTop = 439
          ExplicitWidth = 438
          DesignSize = (
            438
            23)
          inherited edCodigo: TPatternEdit
            Width = 52
            Color = 15262169
            ReadOnly = True
            ExplicitWidth = 52
          end
          inherited cmbDescripcion: TComboGrid
            Left = 56
            Width = 381
            Color = 15262169
            ReadOnly = True
            ExplicitLeft = 56
            ExplicitWidth = 381
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
        inline fraCIE102: TfraCDG_DIAGNOSTICO
          Left = 73
          Top = 462
          Width = 438
          Height = 23
          TabOrder = 34
          ExplicitLeft = 73
          ExplicitTop = 462
          ExplicitWidth = 438
          DesignSize = (
            438
            23)
          inherited edCodigo: TPatternEdit
            Width = 52
            Color = 15262169
            ReadOnly = True
            ExplicitWidth = 52
          end
          inherited cmbDescripcion: TComboGrid
            Left = 56
            Width = 381
            Color = 15262169
            ReadOnly = True
            ExplicitLeft = 56
            ExplicitWidth = 381
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
        object chkAFavorART: TCheckBox
          Left = 316
          Top = 210
          Width = 16
          Height = 17
          TabOrder = 40
        end
        object chkExcluirDictAnt: TCheckBox
          Left = 187
          Top = 380
          Width = 127
          Height = 14
          Caption = 'Excluir dict'#225'menes ant.'
          TabOrder = 41
        end
        object chkApelacion: TCheckBox
          Left = 319
          Top = 380
          Width = 65
          Height = 15
          Caption = 'Apelaci'#243'n'
          TabOrder = 42
        end
        object chkRectificatoria: TCheckBox
          Left = 319
          Top = 395
          Width = 88
          Height = 15
          Caption = 'Rectificatoria'
          TabOrder = 43
        end
        object chkIntegral: TCheckBox
          Left = 407
          Top = 380
          Width = 60
          Height = 15
          Caption = 'Integral'
          TabOrder = 44
          OnClick = chkIntegralClick
        end
        object chkPrevencion: TCheckBox
          Left = 407
          Top = 395
          Width = 75
          Height = 15
          Caption = 'Prevenci'#243'n'
          TabOrder = 45
        end
        object edPorcIntegral: TEdit
          Left = 467
          Top = 373
          Width = 42
          Height = 21
          MaxLength = 5
          TabOrder = 46
          OnChange = edPorcIntegralChange
          OnKeyPress = edPorcIntegralKeyPress
        end
        object chkPatCron: TCheckBox
          Left = 420
          Top = 278
          Width = 73
          Height = 15
          Caption = 'P. Cr'#243'nica'
          TabOrder = 47
        end
      end
      object btnCerrar: TBitBtn
        Left = 433
        Top = 530
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 3
      end
      object btnLimpiar: TBitBtn
        Left = 91
        Top = 530
        Width = 77
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Limpiar'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0010101020202000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
          101020202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF001F20201F606040606020202000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001F202066
          666666666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF002F303000808010D0D04FA0A0305F5F20202000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF002F3030666666E3
          E3E3A4A0A066666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF00404040104F4F00D0D000E0E000CFCF00BFBF3050502F2F2F00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00404040666666E3E3E3A4
          A0A0E3E3E3A4A0A06666662F2F2F00FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF002F2F2F00909000E0E000C0C000E0E010C0C05FB0B03050502020
          2000FF0000FF0000FF0000FF0000FF0000FF0000FF002F2F2F008080A4A0A0E3
          E3E3CCCCCCD7D7D7B2B2B266666620202000FF0000FF0000FF0000FF0000FF00
          00FF001F1F1F10505000E0E000CFCF00E0E000D0D000DFDF10DFDF2FB0B04060
          6020202000FF0000FF0000FF0000FF0000FF001F1F1F666666B2B2B2E3E3E3CC
          CCCCD7D7D7E3E3E3A4A0A0E3E3E366666620202000FF0000FF0000FF0000FF00
          00FF001010100F80800FD0D000E0E000CFCF00DFDF00D0D03FD0D030DFDF4FB0
          B030606020202000FF0000FF0000FF0000FF00808080666666E3E3E3CCCCCCD7
          D7D7E3E3E3A4A0A0E3E3E3A4A0A0C0C0C066666620202000FF0000FF0000FF00
          302F2F803030204F4F5FC0C000C0C000E0E000D0D030D0D010EFEF00C0C020EF
          EF208F8F10101000FF0000FF0000FF00302F2F808080666666CCCCCCD7D7D7E3
          E3E3A4A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B266666600FF0000FF0000FF00
          80605FD0A0008F502F204F4F5FCFCF00D0D030D0D01FE0E000C0C000E0E0409F
          9F0F20200F0F0F00FF0000FF0000FF0080605F808080808080666666B2B2B2A4
          A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B200666622222200FF0000FF0000FF00
          A05F4FFFF01FDFD06F7F4030204F4F30C0C020DFDF20BFBF40AFAF0F50502F40
          400F0F0F00FF0000FF0000FF0000FF00A4A0A0A4A0A0A4A0A0808080666666E3
          E3E3B2B2B2C0C0C0C0C0C0A4A0A066666639393900FF0000FF0000FF00302F2F
          AF6040E0E06FAFAF7FBF60306F2000204F4F0F8F8F204F4F1F2F2F2F2F2F00FF
          0000FF0000FF0000FF0000FF00302F2FA4A0A0A4A0A0B2B2B2B2B2B280808066
          6666B2B2B233999966666666666600FF0000FF0000FF0000FF0000FF00B07F60
          EFD060C0C0A09F5F3F8030008000003010101010101F1F1F00FF0000FF0000FF
          0000FF0000FF0000FF0000FF00A4A0A0969696C0C0C0B2B2B2B2B2B280808080
          808066666666666600FF0000FF0000FF0000FF0000FF0000FF00805030E0D060
          C0C09F8F502F5F4F4F605F5F605F5F00FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00666666969696B2B2B2868686969696605F5F605F5F00
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B06F1FC0C060
          905F302F201F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00969696A4A0A086868696969600FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008F4F30605F30
          2F1F1F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0086868686868696969600FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnLimpiarClick
      end
      object btnGuardar: TBitBtn
        Left = 7
        Top = 530
        Width = 77
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Guardar'
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          0400000000004001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
          0000AAA88888888888888A000000A8888800000088880A777778888887777800
          0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
          FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
          7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
          FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
          FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
          9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
          F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
          8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
          FFF778016E02AA88888888888888AAA77777777777777A006701}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnGuardarClick
      end
      object btnImprimir: TBitBtn
        Left = 177
        Top = 530
        Width = 77
        Height = 23
        Anchors = [akRight, akBottom]
        BiDiMode = bdLeftToRight
        Caption = '&Imprimir'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0004040404
          040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF00000000000000BFBFBF2F2F2F30303000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00040404040404C0C0C029
          292933333304040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF00
          000000000000CFCFCFBFBFBF7F7F7F0000000000004F4F4F5050500000000000
          0000FF0000FF0000FF0000FF0000FF00040404040404CCCCCCC0C0C080808004
          04040404044D4D4D55555504040404040400FF0000FF0000FF0000FF00000000
          DFDFDFD0D0D07F7F7F7F7F7FBFBFBF2F2F2F3030300000000000005F5F5F6060
          6000000000000000FF0000FF00040404DDDDDDD7D7D7808080808080C0C0C029
          29293333330404040404045F5F5F66666604040404040400FF0000FF007F7F7F
          7F7F7FA09F9FCFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050500000000000
          0070707000000000FF0000FF00808080808080A4A0A0CCCCCCC0C0C0C0C0C029
          29293333334D4D4D55555504040404040477777704040400FF007F7F7FA09F9F
          DFDFDFD0D0D0CFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050505F5F5F6060
          6000000000000000FF00808080A4A0A0DDDDDDD7D7D7CCCCCCC0C0C0C0C0C029
          29293333334D4D4D5555555F5F5F66666604040404040400FF007F7F7FFFFFFF
          DFDFDFD0D0D0CFCFCFBFBFBFFFFFFF2F2F2F3030304F4F4F5050505F5F5F6060
          607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7CCCCCCC0C0C0FFFFFF29
          29293333334D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
          DFDFDFD0D0D0FFFFFFFFFFFFBFBFBFBFBFBFBFBFBF4F4F4F5050505F5F5F6060
          607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7FFFFFFFFFFFFC0C0C0C0
          C0C0C0C0C04D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
          FFFFFFFFFFFFD0D0D0CFCFCF2F2FFFFF00FFBFBFBFBFBFBFBFBFBF5F5F5F6060
          607070707F7F7F000000808080FFFFFFFFFFFFFFFFFFD7D7D7CCCCCC66666677
          7777C0C0C0C0C0C0C0C0C05F5F5F6666667777778080800404047F7F7FFFFFFF
          DFDFDFD0D0D090FF9000FF00D0D0D0CFCFCFCFCFCF7F7F7F7F7F7F000000BFBF
          BF7070707F7F7F000000808080FFFFFFDDDDDDD7D7D75555554D4D4DD7D7D7CC
          CCCCCCCCCC808080808080040404C0C0C077777780808004040400FF007F7F7F
          7F7F7FFFFFFFDFDFDFBFBFBFD0D0D07F7F7F7F7F7F90FFFF90FFFF000000DFDF
          DF00000000000000FF0000FF00808080808080FFFFFFDDDDDDC0C0C0D7D7D780
          8080808080C0C0C0C0C0C0040404DDDDDD04040404040400FF0000FF0000FF00
          00FF007F7F7F7F7F7FFFFFFF7F7F7F90FFFF90FFFF90FFFFCFFFFFCFFFFF0000
          0000FF0000FF0000FF0000FF0000FF0000FF00808080808080FFFFFF808080C0
          C0C0C0C0C0C0C0C0D7D7D7CCCCCC04040400FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF007F7F7F7F7F7F90FFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFF
          FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00808080808080C0
          C0C0CCCCCCCCCCCCCCCCCCD7D7D7CCCCCC04040400FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00909090CFFFFFCFFFFFCFFFFFCFFFFFEFF0
          FFEFF0FF00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0096
          9696D7D7D7CCCCCCD7D7D7CCCCCCF0FBFFF0FBFF04040404040400FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF00909090CFFFFFEFF0FFEFF0FF9090
          9090909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF00969696D7D7D7F0FBFFF0FBFF96969696969600FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00AFAFAFAFAFAFAFAFAF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF00B2B2B2B2B2B2B2B2B200FF0000FF0000FF0000FF00}
        NumGlyphs = 2
        ParentBiDiMode = False
        TabOrder = 4
        Visible = False
      end
    end
    object fpFirmante_elim: TFormPanel
      Left = 10
      Top = 573
      Width = 407
      Height = 67
      Caption = 'Ingrese el firmante para la Carta Documento'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        407
        67)
      object Label61: TLabel
        Left = 6
        Top = 13
        Width = 42
        Height = 13
        Caption = 'Firmante'
      end
      object Bevel25: TBevel
        Left = 4
        Top = 33
        Width = 398
        Height = 2
      end
      object btnAceptarFirmante_elim: TBitBtn
        Left = 330
        Top = 38
        Width = 71
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarFirmante_elimClick
      end
      inline fraFirmante_elim: TfraCodigoDescripcion
        Left = 53
        Top = 8
        Width = 350
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 53
        ExplicitTop = 8
        ExplicitWidth = 350
        DesignSize = (
          350
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 63
          Width = 285
          DataSource = nil
          ExplicitLeft = 63
          ExplicitWidth = 285
        end
        inherited edCodigo: TPatternEdit
          Width = 61
          ExplicitWidth = 61
        end
      end
    end
    object fpAsociarArchivo: TFormPanel
      Left = 10
      Top = 645
      Width = 420
      Height = 87
      Caption = 'Asociar Archivo'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpAsociarArchivoBeforeShow
      ActiveControl = edDescripcionArchivo
      DesignSize = (
        420
        87)
      object Bevel24: TBevel
        Left = 4
        Top = 56
        Width = 414
        Height = 2
      end
      object Label63: TLabel
        Left = 5
        Top = 12
        Width = 54
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object Label64: TLabel
        Left = 5
        Top = 34
        Width = 60
        Height = 13
        Caption = 'Asociar Doc.'
      end
      object tbSeleccionArchivoAsociar: TSpeedButton
        Left = 393
        Top = 30
        Width = 23
        Height = 23
        Hint = 'Asociar Archivo...'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSeleccionArchivoAsociarClick
      end
      object btnAbrirArchivo: TSpeedButton
        Left = 5
        Top = 61
        Width = 88
        Height = 22
        Caption = 'Abrir Archivo'
        Glyph.Data = {
          A6020000424DA6020000000000003600000028000000100000000D0000000100
          18000000000070020000C40E0000C40E0000000000000000000000FF0000FF00
          00FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000FF0000FF0000909000909000909000909000909000
          909000909000909000909000909000909000909000000000000000FF0000FF00
          009090F0F0F090CFFF90FFFF90CFFF90FFFF90CFFF90CFFF90CFFF90CFFF60CF
          CF00909000000000000000FF00009090F0F0F090FFFF90FFFF90CFFF90FFFF90
          CFFF90FFFF90CFFF90CFFF90CFFF60CFCF00000000909000000000FF00009090
          F0F0F090FFFF90FFFF90FFFF90FFFF90FFFF90CFFF90FFFF90CFFF90CFFF0090
          90000000009090000000009090F0F0F090FFFF90FFFF90FFFF90FFFF90CFFF90
          FFFF90FFFF90CFFF90FFFF60CFCF00000060CFCF60CFCF000000009090F0F0F0
          90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90CFFF90FFFF90CFFF60CFCF0000
          0060CFCF60CFCF00000000909000909000909000909000909000909000909000
          909000909000909000909000909060CFCF90FFFF60CFCF00000000FF00009090
          F0F0F090FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FFFF90FF
          FF90FFFF60CFCF00000000FF00009090F0F0F090FFFF90FFFF90FFFF90FFFF90
          FFFF90FFFF90FFFFF0F0F0F0F0F0F0F0F0F0F0F060CFCF00000000FF00009090
          F0F0F090FFFF90FFFF90FFFF90FFFF90FFFFF0F0F00090900090900090900090
          9000909000909000FF0000FF0000FF00009090F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F000909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000909000909000909000909000909000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF00}
        OnClick = btnAbrirArchivoClick
      end
      object btnDesasociar: TSpeedButton
        Left = 100
        Top = 61
        Width = 85
        Height = 22
        Hint = 'Desasociar Archivo'
        Caption = 'Desasociar'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000000010000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
          0A0A0A0A0A00000000000000000A0A1F1F1F1F1F1F0A0A00000000001D1F2020
          202020201F1F010A00000001204141414141414120201F010A0000012C474141
          414141414141201F0A0001E32641BDFFBD4141BDFFBD201F1F0A01E34D4141BD
          FFB7B7FFBD4141201F0A01E34D414141B7FFFFB7414141201F0A01E34D474141
          B7FFFFB7414141201F0A01E3534741BDFFB7B7FFBD4141201F0A016F532C1AFF
          BD4141BDFFBD41201F0A0001E34D2C4141414141414141200A0000014C534D2C
          474741414141411F0A000000014CE353534D264141411F1D000000000001016F
          E3E3E31720010100000000000000000101010101010000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDesasociarClick
      end
      object btnAceptar_AsocArchivo: TBitBtn
        Left = 260
        Top = 60
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnAceptar_AsocArchivoClick
      end
      object btnCerrar_AsocArchivo: TBitBtn
        Left = 341
        Top = 60
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 3
      end
      object edDescripcionArchivo: TEdit
        Left = 65
        Top = 7
        Width = 326
        Height = 21
        MaxLength = 100
        TabOrder = 0
      end
      object edArchivoAsociado: TEdit
        Left = 65
        Top = 31
        Width = 326
        Height = 21
        Color = 15262169
        ReadOnly = True
        TabOrder = 1
      end
    end
    object fpSubMotivos: TFormPanel
      Left = 10
      Top = 737
      Width = 261
      Height = 145
      Caption = 'Sub Motivos del Evento'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpSubMotivosBeforeShow
      DesignSize = (
        261
        145)
      object Bevel26: TBevel
        Left = 3
        Top = 112
        Width = 254
        Height = 2
      end
      object Label65: TLabel
        Left = 8
        Top = 4
        Width = 120
        Height = 13
        Caption = 'Seleccionar Sub-motivos:'
      end
      object Label66: TLabel
        Left = 8
        Top = 116
        Width = 3
        Height = 13
      end
      object btnAceptarSubMotivos: TBitBtn
        Left = 111
        Top = 117
        Width = 70
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptarSubMotivosClick
      end
      object btnCancelarSubMotivos: TBitBtn
        Left = 186
        Top = 117
        Width = 70
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
      object chkAltaCargTarde: TCheckBox
        Left = 9
        Top = 24
        Width = 237
        Height = 17
        Caption = 'Alta cargada tarde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object chkAltaCargTildeErr: TCheckBox
        Left = 9
        Top = 41
        Width = 249
        Height = 17
        Caption = 'Alta cargada con tilde erroneo en incapacidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object chkAltaMalConf: TCheckBox
        Left = 9
        Top = 58
        Width = 249
        Height = 17
        Caption = 'Alta mal confeccionada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object chkCDNotaSic: TCheckBox
        Left = 9
        Top = 75
        Width = 199
        Height = 17
        Caption = 'Por CD / Nota / SIC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object chkRequerimientos: TCheckBox
        Left = 9
        Top = 92
        Width = 94
        Height = 15
        Caption = 'Requerimientos'
        TabOrder = 6
      end
    end
    object fpAgregarObservLegales: TFormPanel
      Left = 10
      Top = 887
      Width = 383
      Height = 237
      Caption = 'Observaciones de Legales'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpAgregarObservLegalesBeforeShow
      DesignSize = (
        383
        237)
      object Bevel28: TBevel
        Left = 4
        Top = 204
        Width = 377
        Height = 2
      end
      object Label70: TLabel
        Left = 8
        Top = 116
        Width = 3
        Height = 13
      end
      object Label69: TLabel
        Left = 5
        Top = 11
        Width = 34
        Height = 13
        Caption = 'Evento'
      end
      object Label74: TLabel
        Left = 5
        Top = 33
        Width = 39
        Height = 13
        Caption = 'Observ.'
      end
      object btnAceptar_Leg: TBitBtn
        Left = 233
        Top = 209
        Width = 70
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAceptar_LegClick
      end
      object btnCancelar_Leg: TBitBtn
        Left = 308
        Top = 209
        Width = 70
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Cerrar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
      object edObserv_Leg: TRichEdit
        Left = 44
        Top = 32
        Width = 333
        Height = 168
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object edCodEvento_Leg: TEdit
        Left = 45
        Top = 8
        Width = 49
        Height = 19
        Color = 15262169
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edDescEvento_Leg: TEdit
        Left = 96
        Top = 8
        Width = 281
        Height = 19
        Color = 15262169
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object fpRecaidaSin: TFormPanel
      Left = 315
      Top = 764
      Width = 201
      Height = 76
      Caption = 'Seleccione la Reca'#237'da'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnClose = fpRecaidaSinClose
      OnBeforeShow = fpRecaidaSinBeforeShow
      Constraints.MinHeight = 70
      Constraints.MinWidth = 200
      DesignSize = (
        201
        76)
      object Label75: TLabel
        Left = 18
        Top = 11
        Width = 99
        Height = 13
        Caption = 'Seleccione la reca'#237'da'
      end
      object Bevel29: TBevel
        Left = 7
        Top = 36
        Width = 187
        Height = 8
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptarRecaidaSin: TButton
        Left = 68
        Top = 45
        Width = 61
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        TabOrder = 1
        OnClick = btnAceptarRecaidaSinClick
      end
      object btnCancelarRecaidaSin: TButton
        Left = 135
        Top = 45
        Width = 60
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        TabOrder = 2
        OnClick = btnCancelarRecaidaSinClick
      end
      object cmbRecaidaSin: TRxDBLookupCombo
        Left = 135
        Top = 7
        Width = 50
        Height = 21
        DropDownCount = 5
        Anchors = [akLeft, akTop, akRight]
        LookupField = 'EX_RECAIDA'
        LookupDisplay = 'EX_RECAIDA'
        LookupSource = dsRecaidaSin
        TabOrder = 0
      end
    end
    object fpConstanciaDomicCobro: TFormPanel
      Left = 12
      Top = 1139
      Width = 402
      Height = 240
      Caption = 'Constancia de Domicilio de Cobro'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      OnShow = fpConstanciaDomicCobroShow
      DesignSize = (
        402
        240)
      object Label76: TLabel
        Left = 8
        Top = 8
        Width = 191
        Height = 13
        Caption = 'Administrador General de Archivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label79: TLabel
        Left = 12
        Top = 32
        Width = 320
        Height = 26
        Caption = 
          #191'Desea digitalizar la Constancia de domicilio de Cobro directame' +
          'nte'#13#10' en el repositorio del AGA?'
      end
      object Label80: TLabel
        Left = 8
        Top = 106
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object Label81: TLabel
        Left = 8
        Top = 150
        Width = 369
        Height = 13
        Caption = 
          'Seleccione el archivo (habitualmente ser'#225' el PDF descargado de l' +
          'a Ventanilla)'
      end
      object Bevel30: TBevel
        Left = 0
        Top = 200
        Width = 402
        Height = 40
        Align = alBottom
        Shape = bsTopLine
        ExplicitTop = 199
      end
      object btnAceptarCODOC: TButton
        Left = 244
        Top = 204
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnAceptarCODOCClick
      end
      object btnCancelarCODOC: TButton
        Left = 321
        Top = 204
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 4
      end
      object rdDigitalizarCODOC_Si: TAdvOfficeRadioButton
        Left = 12
        Top = 64
        Width = 43
        Height = 17
        TabOrder = 0
        TabStop = True
        OnClick = DoCambioOpcionCODOC
        Alignment = taLeftJustify
        Caption = 'Si'
        Checked = True
        GroupIndex = 1
        ReturnIsTab = False
        Version = '1.3.2.0'
      end
      object rdDigitalizarCODOC_No: TAdvOfficeRadioButton
        Left = 12
        Top = 81
        Width = 43
        Height = 17
        TabOrder = 1
        OnClick = DoCambioOpcionCODOC
        Alignment = taLeftJustify
        Caption = 'No'
        GroupIndex = 1
        ReturnIsTab = False
        Version = '1.3.2.0'
      end
      object edArchivoCODOC: TFilenameEdit
        Left = 8
        Top = 167
        Width = 376
        Height = 21
        Filter = 'Archivos PDF (*.PDF)|*.pdf'
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 2
      end
      inline fraTipoDocumentoAGA_CODOC: TfraCodDesc
        Left = 8
        Top = 122
        Width = 378
        Height = 23
        ParentCustomHint = False
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 5
        ExplicitLeft = 8
        ExplicitTop = 122
        ExplicitWidth = 378
        DesignSize = (
          378
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 313
          ExplicitWidth = 313
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 63
          ExplicitLeft = 0
          ExplicitWidth = 63
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'TD_FECHABAJA'
          FieldCodigo = 'TD_CODIGO'
          FieldDesc = 'TD_DESCRIPCION'
          FieldID = 'TD_ID'
          TableName = 'RTD_TIPODOCUMENTO'
        end
      end
    end
  end
  object ScrollBox3: TScrollBox [6]
    Left = -396
    Top = 396
    Width = 559
    Height = 721
    TabOrder = 6
    Visible = False
    object fpLegajo: TFormPanel
      Left = 13
      Top = 16
      Width = 521
      Height = 338
      Caption = 'Legajo del siniestro'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      DesignSize = (
        521
        338)
      object Bevel18: TBevel
        Left = 5
        Top = 301
        Width = 509
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
      end
      object Bevel19: TBevel
        Left = 5
        Top = 11
        Width = 509
        Height = 2
        Anchors = [akLeft, akTop, akRight]
      end
      object lblTitulo: TLabel
        Left = 20
        Top = 5
        Width = 6
        Height = 13
        Caption = '  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chkLE_HISTORIACLINICA: TCheckBox
        Left = 8
        Top = 21
        Width = 197
        Height = 17
        Caption = 'Historia cl'#237'nica'
        TabOrder = 0
      end
      object chkLE_PMI: TCheckBox
        Left = 8
        Top = 37
        Width = 197
        Height = 17
        Caption = 'PMI'
        TabOrder = 1
      end
      object chkLE_DENUNCIA: TCheckBox
        Left = 8
        Top = 53
        Width = 197
        Height = 17
        Caption = 'Denuncia'
        TabOrder = 2
      end
      object chkLE_ACUSERECIBO: TCheckBox
        Left = 8
        Top = 69
        Width = 197
        Height = 17
        Caption = 'Acuse de recibo'
        TabOrder = 3
      end
      object chkLE_FOTOCOPIADNI: TCheckBox
        Left = 8
        Top = 85
        Width = 197
        Height = 17
        Caption = 'Fotocopia DNI'
        TabOrder = 4
      end
      object chkLE_PME: TCheckBox
        Left = 8
        Top = 101
        Width = 197
        Height = 17
        Caption = 'Alta m'#233'dica'
        TabOrder = 5
      end
      object chkLE_ACUERDO: TCheckBox
        Left = 8
        Top = 117
        Width = 197
        Height = 17
        Caption = 'Acuerdo'
        TabOrder = 6
      end
      object chkLE_TRATAMEDICO: TCheckBox
        Left = 8
        Top = 133
        Width = 197
        Height = 17
        Caption = 'Tratamiento m'#233'dico sintom'#225'tico'
        TabOrder = 7
      end
      object chkLE_REHABILITACION: TCheckBox
        Left = 8
        Top = 149
        Width = 197
        Height = 17
        Caption = 'Rehabilitaci'#243'n'
        TabOrder = 8
      end
      object chkLE_TRATAPSICOLOGICO: TCheckBox
        Left = 8
        Top = 165
        Width = 197
        Height = 17
        Caption = 'Tratamiento psicol'#243'gico'
        TabOrder = 9
      end
      object chkLE_TRATAQUIRURGICO: TCheckBox
        Left = 8
        Top = 181
        Width = 197
        Height = 17
        Caption = 'Tratamiento quir'#250'rgico'
        TabOrder = 10
      end
      object chkLE_OTROSTRATAMIENTOS: TCheckBox
        Left = 9
        Top = 197
        Width = 197
        Height = 17
        Caption = 'Otros tratamientos o prestaciones'
        TabOrder = 11
        OnClick = chkLE_OTROSTRATAMIENTOSClick
      end
      object chkLE_PROTOQUIRURGICO: TCheckBox
        Left = 8
        Top = 263
        Width = 197
        Height = 17
        Caption = 'Protocolo quir'#250'rgico'
        TabOrder = 13
      end
      object btnAceptarLeg: TBitBtn
        Left = 356
        Top = 307
        Width = 77
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 29
        OnClick = btnAceptarLegClick
      end
      object btnCancelarLeg: TBitBtn
        Left = 437
        Top = 307
        Width = 77
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 30
      end
      object chkLE_INTERCONSULTA: TCheckBox
        Left = 264
        Top = 24
        Width = 197
        Height = 17
        Caption = 'Interconsulta con especialista'
        TabOrder = 14
      end
      object chkLE_PSICODIAGNOSTICO: TCheckBox
        Left = 264
        Top = 40
        Width = 197
        Height = 17
        Caption = 'Psicodiagn'#243'stico'
        TabOrder = 15
      end
      object chkLE_RADIOGRAFIAS: TCheckBox
        Left = 264
        Top = 56
        Width = 197
        Height = 17
        Caption = 'Radiograf'#237'as'
        TabOrder = 16
      end
      object chkLE_ECOGRAFIAS: TCheckBox
        Left = 264
        Top = 72
        Width = 197
        Height = 17
        Caption = 'Ecograf'#237'as'
        TabOrder = 17
      end
      object chkLE_OTROSESTUDIOS: TCheckBox
        Left = 264
        Top = 232
        Width = 197
        Height = 17
        Caption = 'Otros estudios'
        TabOrder = 27
        OnClick = chkLE_OTROSESTUDIOSClick
      end
      object chkLE_TAC: TCheckBox
        Left = 264
        Top = 88
        Width = 197
        Height = 17
        Caption = 'TAC'
        TabOrder = 18
      end
      object chkLE_RMN: TCheckBox
        Left = 264
        Top = 104
        Width = 197
        Height = 17
        Caption = 'RMN'
        TabOrder = 19
      end
      object chkLE_EMG: TCheckBox
        Left = 264
        Top = 120
        Width = 197
        Height = 17
        Caption = 'EMG'
        TabOrder = 20
      end
      object chkLE_ESTAUDIOLOGICOS: TCheckBox
        Left = 264
        Top = 136
        Width = 197
        Height = 17
        Caption = 'Estudios audiol'#243'gicos'
        TabOrder = 21
      end
      object chkLE_ESTOFTALMOLOGICOS: TCheckBox
        Left = 264
        Top = 152
        Width = 197
        Height = 17
        Caption = 'Estudios oftalmol'#243'gicos'
        TabOrder = 22
      end
      object chkLE_ESTNEUMONOLOGICOS: TCheckBox
        Left = 264
        Top = 168
        Width = 197
        Height = 17
        Caption = 'Estudios neumonol'#243'gicos'
        TabOrder = 23
      end
      object chkLE_LABORATORIO: TCheckBox
        Left = 264
        Top = 200
        Width = 197
        Height = 17
        Caption = 'Laboratorio'
        TabOrder = 25
      end
      object chkLE_RECALIFICACION: TCheckBox
        Left = 264
        Top = 184
        Width = 197
        Height = 17
        Caption = 'Recalificaci'#243'n'
        TabOrder = 24
      end
      object chkLE_ESTCOMPLEMENTARIOS: TCheckBox
        Left = 264
        Top = 216
        Width = 221
        Height = 17
        Caption = 'Estudios complem. relacionados c/secuela'
        TabOrder = 26
      end
      object edLE_OTROSTRATAMIENTOS: TMemo
        Left = 7
        Top = 214
        Width = 252
        Height = 44
        Color = 15262169
        MaxLength = 100
        ReadOnly = True
        TabOrder = 12
      end
      object edLE_OTROSESTUDIOS: TMemo
        Left = 263
        Top = 249
        Width = 252
        Height = 44
        Color = 15262169
        MaxLength = 100
        ReadOnly = True
        TabOrder = 28
      end
    end
    object fpAcuerdo: TFormPanel
      Left = 17
      Top = 363
      Width = 521
      Height = 324
      Caption = 'Datos adicionales del acuerdo/divergencia'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpAcuerdoBeforeShow
      DesignSize = (
        521
        324)
      object Bevel20: TBevel
        Left = 5
        Top = 287
        Width = 509
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
      end
      object Label52: TLabel
        Left = 8
        Top = 4
        Width = 103
        Height = 13
        Caption = 'Descripci'#243'n del hecho'
      end
      object Label53: TLabel
        Left = 8
        Top = 67
        Width = 100
        Height = 13
        Caption = 'Lesiones provocadas'
      end
      object Label54: TLabel
        Left = 8
        Top = 131
        Width = 42
        Height = 13
        Caption = 'Secuelas'
      end
      object Label55: TLabel
        Left = 8
        Top = 194
        Width = 69
        Height = 13
        Caption = 'Preexistencias'
      end
      object Label56: TLabel
        Left = 8
        Top = 263
        Width = 130
        Height = 13
        Caption = 'Dificultad tareas habituales'
      end
      object btnAceptarAcu: TBitBtn
        Left = 356
        Top = 294
        Width = 77
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 5
        OnClick = btnAceptarAcuClick
      end
      object btnCancelarAcu: TBitBtn
        Left = 437
        Top = 294
        Width = 77
        Height = 26
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        ModalResult = 2
        NumGlyphs = 2
        TabOrder = 6
        OnClick = btnCancelarAcuClick
      end
      object edDescripcionHecho: TMemo
        Left = 6
        Top = 19
        Width = 510
        Height = 46
        Color = clWhite
        Lines.Strings = (
          '')
        MaxLength = 500
        TabOrder = 0
      end
      object edLesiones: TMemo
        Left = 6
        Top = 82
        Width = 510
        Height = 46
        Color = clWhite
        MaxLength = 500
        TabOrder = 1
      end
      object edSecuelas: TMemo
        Left = 6
        Top = 146
        Width = 510
        Height = 46
        Color = clWhite
        MaxLength = 500
        TabOrder = 2
      end
      object edPreexistencias: TMemo
        Left = 6
        Top = 209
        Width = 510
        Height = 46
        Color = clWhite
        MaxLength = 500
        TabOrder = 3
      end
      object cmbDificultad: TComboBox
        Left = 143
        Top = 260
        Width = 146
        Height = 19
        Style = csOwnerDrawFixed
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          'Ninguna'
          'Leve'
          'Inermedia'
          'Alta')
      end
    end
  end
  object fpDictamen: TFormPanel [7]
    Left = 634
    Top = 265
    Width = 402
    Height = 300
    Caption = 'Dictamen'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpDictamenShow
    DesignSize = (
      402
      300)
    object Label67: TLabel
      Left = 8
      Top = 8
      Width = 191
      Height = 13
      Caption = 'Administrador General de Archivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTituloSIC: TLabel
      Left = 8
      Top = 180
      Width = 217
      Height = 13
      Caption = 'Sistema Integrado de Comunicaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPreguntaSIC: TLabel
      Left = 12
      Top = 200
      Width = 328
      Height = 13
      Caption = 
        #191'Desea generar una tarea en el SIC con el documento seleccionado' +
        '?'
    end
    object Label71: TLabel
      Left = 12
      Top = 32
      Width = 332
      Height = 13
      Caption = 
        #191'Desea digitalizar el dictamen directamente en el repositorio de' +
        'l AGA?'
    end
    object Label72: TLabel
      Left = 12
      Top = 88
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label73: TLabel
      Left = 12
      Top = 132
      Width = 369
      Height = 13
      Caption = 
        'Seleccione el archivo (habitualmente ser'#225' el PDF descargado de l' +
        'a Ventanilla)'
    end
    object Bevel21: TBevel
      Left = 0
      Top = 260
      Width = 402
      Height = 40
      Align = alBottom
      Shape = bsTopLine
      ExplicitLeft = 3
    end
    object btnAceptarDictamen: TButton
      Left = 240
      Top = 267
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnAceptarDictamenClick
    end
    object btnCancelarDictamen: TButton
      Left = 321
      Top = 267
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 7
    end
    inline fraTipoDocumentoAGA: TfraCodDesc
      Left = 12
      Top = 104
      Width = 378
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 12
      ExplicitTop = 104
      ExplicitWidth = 378
      DesignSize = (
        378
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 313
        ExplicitWidth = 313
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 63
        ExplicitLeft = 0
        ExplicitWidth = 63
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'TD_FECHABAJA'
        FieldCodigo = 'TD_CODIGO'
        FieldDesc = 'TD_DESCRIPCION'
        FieldID = 'TD_ID'
        TableName = 'RTD_TIPODOCUMENTO'
      end
    end
    object rgGenerarTareaSI: TAdvOfficeRadioButton
      Left = 16
      Top = 220
      Width = 41
      Height = 17
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
      Caption = 'Si'
      Checked = True
      GroupIndex = 2
      ReturnIsTab = False
      Version = '1.3.2.0'
    end
    object rgGenerarTareaNO: TAdvOfficeRadioButton
      Left = 16
      Top = 236
      Width = 41
      Height = 17
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'No'
      GroupIndex = 2
      ReturnIsTab = False
      Version = '1.3.2.0'
    end
    object rgDigitalizarSI: TAdvOfficeRadioButton
      Left = 16
      Top = 47
      Width = 43
      Height = 17
      TabOrder = 0
      TabStop = True
      OnClick = CambioDigitalizarAGA
      Alignment = taLeftJustify
      Caption = 'Si'
      Checked = True
      GroupIndex = 1
      ReturnIsTab = False
      Version = '1.3.2.0'
    end
    object rgDigitalizarNO: TAdvOfficeRadioButton
      Left = 16
      Top = 64
      Width = 43
      Height = 17
      TabOrder = 1
      OnClick = CambioDigitalizarAGA
      Alignment = taLeftJustify
      Caption = 'No'
      GroupIndex = 1
      ReturnIsTab = False
      Version = '1.3.2.0'
    end
    object edArchivoDictamen: TFilenameEdit
      Left = 12
      Top = 152
      Width = 376
      Height = 21
      Filter = 'Archivos PDF (*.PDF)|*.pdf'
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT ei_descripcion evento, ev_evento, ev_fecha fecha, ev_hora' +
        ' hora, ev_porcincapacidad porcinca,'
      
        '       ev_grado grado, ev_caracter caracter, ev_graninc grainc, ' +
        'ev_retroactivo retro,'
      
        '       mi_descripcion motivo, cm_descripcion comision, au_nombre' +
        ' medico,'
      
        '       ev_fechavencimiento fvenci, ev_tratamiento tratam, ui_des' +
        'cripcion ubica,'
      
        '       ev_inicioincadef finiciodef, ev_observaciones observa, ev' +
        '_fechaalta fcarga,'
      '       ev_abandonotratamiento abandono,'
      
        '       art.SIN.get_expedincapacidadseginc(ev_siniestro, ev_orden' +
        ', ev_recaida) expedinc,'
      '       ev_idevento, ev_mortal, ev_fechadefuncion,'
      
        '       ev_complementario, ev_recupero, ev_expedincapacidad, ev_f' +
        'echaretroactivo,'
      
        '       ev_idseg_dictamen,ev_inicio_prov, ev_motivoapelacion, ev_' +
        'accidnolaboral,'
      
        '       utiles.armar_siniestro(ev_siniestro, ev_orden, ev_recaida' +
        ') siniestro,'
      
        '       ev_idaccidentedictamen, ev_idcie101, ev_idcie102, ev_fech' +
        'aaltadictamen,'
      
        '       ei_codigo, ei_cartadoc_elim, ei_codcartadoc_elim, ev_Arch' +
        'ivoAsociado, ei_caracternulo,'
      
        '       ei_autorizaextensionilt, ev_recaida, ev_nroexpedientesrt,' +
        ' ei_pdf_constdomic, ev_fecharecepcion'
      ''
      '  FROM sev_eventosdetramite, SIN.sei_eventoincapacidad,'
      
        '          SIN.smi_motivoincapacidad, SIN.scm_comisionmedica, mau' +
        '_auditores,'
      '         SIN.sui_ubicacionincapacidad'
      ' WHERE ev_codigo = ei_codigo'
      '   AND ev_motivo = mi_codigo(+)'
      '   AND ev_comision = cm_codigo(+)'
      '   AND ev_medico = au_auditor(+)'
      '   AND ev_codubic = ui_codigo(+)'
      '   AND ev_siniestro = :pSiniestro'
      '   AND ev_orden = :pOrden'
      '   AND ev_recaida = :pRecaida')
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pRecaida'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Top = 292
  end
  inherited SortDialog: TSortDialog
    Top = 320
  end
  inherited ExportDialog: TExportDialog
    Top = 320
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Cod.Ev.'
        TitleAlignment = taCenter
        DataField = 'EV_CODIGO'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Evento'
        DataField = 'EVENTO'
        MaxLength = 55
      end
      item
        Title = 'F.Evento'
        TitleAlignment = taCenter
        DataField = 'FECHA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Porc.Inc.'
        TitleAlignment = taCenter
        DataField = 'PORCINCA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Grado'
        TitleAlignment = taCenter
        DataField = 'GRADO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Caracter'
        TitleAlignment = taCenter
        DataField = 'CARACTER'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Comisi'#243'n'
        DataField = 'COMISION'
        MaxLength = 12
      end
      item
        Title = 'Exped. Incap.'
        DataField = 'EV_EXPEDINCAPACIDAD'
        MaxLength = 15
      end
      item
        Title = 'Motivo'
        DataField = 'MOTIVO'
        MaxLength = 16
      end
      item
        Title = 'M'#233'dico'
        DataField = 'MEDICO'
        MaxLength = 30
      end
      item
        Title = 'Fecha'
        DataField = 'FECHA'
        MaxLength = 10
      end
      item
        Title = 'Hora'
        DataField = 'HORA'
        MaxLength = 5
      end
      item
        Title = 'F.Accidente'
        DataField = 'EX_FECHAACCIDENTE'
        MaxLength = 13
      end
      item
        Title = 'F.Alta M'#233'dica'
        DataField = 'EX_ALTAMEDICA'
        MaxLength = 11
      end>
    Title.Text = 'Listado de Seguimiento de Incapacidades'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Top = 348
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PerfilEvento0'
      end
      item
        Name = 'PerfilEvento1'
      end
      item
        Name = 'PerfilEvento2'
      end
      item
        Name = 'PerfilEvento3'
      end
      item
        Name = 'ModifContingencia'
      end
      item
        Name = 'Derivar_IncapPagada'
      end>
    Top = 264
  end
  inherited FormStorage: TFormStorage
    Top = 264
  end
  inherited PrintDialog: TPrintDialog
    Top = 348
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbReenviarPedidoTurnoSRT
      end
      item
        Key = 16468
        LinkControl = tbPropiedades
      end
      item
        Key = 16466
        LinkControl = tbReplicarDict
      end
      item
        Key = 16472
        LinkControl = tbExpediente
      end
      item
        Key = 16449
        LinkControl = tbAutorizacion
      end
      item
        Key = 16474
        LinkControl = tbCancelarAutor
      end
      item
        Key = 16469
        LinkControl = tbUsuarios
      end
      item
        Key = 16465
        LinkControl = tbNoLiquidar
      end
      item
        Key = 16452
        LinkControl = tbDigitalizar
      end>
    Left = 76
    Top = 232
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Top = 292
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ex_id, ex_siniestro, ex_orden, ex_recaida, ex_diagnostico' +
        ', ex_estado,'
      
        '       ex_causafin, se_descripcion estado, ex_fechaaccidente, tj' +
        '_cuil, tj_nombre, '
      
        '       ex_cuit, ca_identificador, gp_nombre gtrabajo, lg_nombre ' +
        'delegacion,'
      
        '       ta_descripcion tipoacc, tg_descripcion gravedad, tj_sexo,' +
        ' tj_fnacimiento,'
      
        '       art.sin.getaltamedultrecexped(ex_siniestro, ex_orden) alt' +
        'amed, ex_tipo, '
      
        '       ex_gravedad, ct_descripcion causafin, NL_MARCADO, ex_gtra' +
        'bajo, ex_pluriempleo,'
      
        '       ex_diagnosticooms, art.hys.get_ergonomiaaprobada(ex_sinie' +
        'stro, ex_orden) EvalErgonomica, ex_contrato, ex_cuil,'
      
        '       tj_documento, tj_cpostal, pv_codigoDGI, tj_mail, ex_breve' +
        'descripcion, tj_provincia, tj_localidad, ex_tipo,'
      
        '       upper(ART.utiles.get_textolimpio(art.utiles.armar_domicil' +
        'io(tj_calle, tj_numero, tj_piso, tj_departamento))) DOMICILIO_TR' +
        'ABAJADOR,'
      ''
      '       CASE WHEN INSTR (tj_mail, '#39';'#39') > 0'
      
        '            THEN TRIM (SUBSTR (tj_mail, 1, INSTR (tj_mail, '#39';'#39') ' +
        '- 1))'
      '            ELSE tj_mail END AS MAIL_TRABAJADOR'
      ''
      ''
      
        '  FROM ctj_trabajador, sex_expedientes, cpr_prestador, SIN.sse_s' +
        'iniestroestado, '
      
        '       mgp_gtrabajo, dlg_delegaciones, SIN.sta_tipoaccidente, st' +
        'g_tipogravedad,'
      
        '       sin.sct_causaterminacion ,SIN.SNL_ENFERMEDADNOLISTADA, cp' +
        'v_provincias'
      ' WHERE tj_cuil = ex_cuil'
      '   AND ex_prestador = ca_identificador(+)'
      '   AND ex_gtrabajo = gp_codigo'
      '   AND ex_delegacion = lg_codigo'
      '   AND se_codigo(+) = ex_estado'
      '   AND ta_codigo(+) = ex_tipo'
      '   AND tg_codigo(+) = ex_gravedad'
      '   AND ct_codigo(+) = ex_causafin'
      '   AND ex_siniestro = :psiniestro'
      '   AND ex_orden = :porden'
      '   AND ex_recaida = :precaida'
      '   AND EX_ID = NL_IDEXPEDIENTE(+)'
      '   AND NL_FECHABAJA IS NULL'
      '   AND tj_provincia = pv_codigo(+)')
    Left = 44
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
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
    object sdqBusquedaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqBusquedaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqBusquedaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqBusquedaEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqBusquedaCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
      Required = True
    end
    object sdqBusquedaGTRABAJO: TStringField
      FieldName = 'GTRABAJO'
      Size = 30
    end
    object sdqBusquedaDELEGACION: TStringField
      FieldName = 'DELEGACION'
      Size = 50
    end
    object sdqBusquedaEX_ESTADO: TStringField
      FieldName = 'EX_ESTADO'
      Size = 2
    end
    object sdqBusquedaEX_CAUSAFIN: TStringField
      FieldName = 'EX_CAUSAFIN'
      Size = 10
    end
    object sdqBusquedaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqBusquedaTIPOACC: TStringField
      FieldName = 'TIPOACC'
      Size = 25
    end
    object sdqBusquedaGRAVEDAD: TStringField
      FieldName = 'GRAVEDAD'
      Size = 25
    end
    object sdqBusquedaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqBusquedaTJ_SEXO: TStringField
      FieldName = 'TJ_SEXO'
      Size = 1
    end
    object sdqBusquedaTJ_FNACIMIENTO: TDateTimeField
      FieldName = 'TJ_FNACIMIENTO'
    end
    object sdqBusquedaALTAMED: TDateTimeField
      FieldName = 'ALTAMED'
    end
    object sdqBusquedaEX_TIPO: TStringField
      FieldName = 'EX_TIPO'
      Size = 1
    end
    object sdqBusquedaEX_GRAVEDAD: TStringField
      FieldName = 'EX_GRAVEDAD'
      Size = 1
    end
    object sdqBusquedaCAUSAFIN: TStringField
      FieldName = 'CAUSAFIN'
      Size = 100
    end
    object sdqBusquedaNL_MARCADO: TStringField
      FieldName = 'NL_MARCADO'
      Size = 1
    end
    object sdqBusquedaEX_GTRABAJO: TStringField
      FieldName = 'EX_GTRABAJO'
    end
    object sdqBusquedaEX_PLURIEMPLEO: TStringField
      FieldName = 'EX_PLURIEMPLEO'
    end
    object sdqBusquedaEX_DIAGNOSTICOOMS: TStringField
      FieldName = 'EX_DIAGNOSTICOOMS'
    end
    object sdqBusquedaEVALERGONOMICA: TStringField
      FieldName = 'EVALERGONOMICA'
      Size = 1
    end
    object sdqBusquedaEX_CONTRATO: TIntegerField
      FieldName = 'EX_CONTRATO'
    end
    object sdqBusquedaEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
    end
    object sdqBusquedaTJ_DOCUMENTO: TStringField
      FieldName = 'TJ_DOCUMENTO'
    end
    object sdqBusquedaDOMICILIO_TRABAJADOR: TStringField
      DisplayWidth = 250
      FieldName = 'DOMICILIO_TRABAJADOR'
      Size = 250
    end
    object sdqBusquedaTJ_CPOSTAL: TStringField
      DisplayWidth = 10
      FieldName = 'TJ_CPOSTAL'
      Size = 10
    end
    object sdqBusquedaPV_CODIGODGI: TStringField
      FieldName = 'PV_CODIGODGI'
    end
    object sdqBusquedaTJ_MAIL: TStringField
      DisplayWidth = 50
      FieldName = 'TJ_MAIL'
      Size = 50
    end
    object sdqBusquedaEX_BREVEDESCRIPCION: TStringField
      DisplayWidth = 250
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqBusquedaTJ_PROVINCIA: TStringField
      FieldName = 'TJ_PROVINCIA'
      Size = 2
    end
    object sdqBusquedaTJ_LOCALIDAD: TStringField
      FieldName = 'TJ_LOCALIDAD'
      Size = 30
    end
    object sdqBusquedaMAIL_TRABAJADOR: TStringField
      DisplayWidth = 100
      FieldName = 'MAIL_TRABAJADOR'
      Size = 100
    end
  end
  object dsBusqueda: TDataSource
    DataSet = sdqBusqueda
    Left = 76
    Top = 264
  end
  object dsExpediente: TDataSource
    DataSet = sdqExpediente
    Left = 52
    Top = 404
  end
  object sdqExpediente: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqExpedienteAfterScroll
    SQL.Strings = (
      
        'SELECT ix_expedincapacidad, ix_fbaja, ix_contador, ix_idexpedien' +
        'te, ix_fbaja, ix_motivobaja'
      '   FROM six_expedientesincapacidad'
      ' WHERE ix_idexpediente = :pIdExpediente'
      '  ORDER BY ix_contador')
    Left = 24
    Top = 404
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdExpediente'
        ParamType = ptInput
      end>
  end
  object dsRecaidas: TDataSource
    DataSet = sdqRecaidas
    Left = 52
    Top = 376
  end
  object sdqRecaidas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select ex_recaida'
      'from sex_expedientes'
      'where ex_siniestro = :siniestro and'
      '           ex_orden = :orden and'
      '           nvl(ex_causafin, '#39' '#39') not in ('#39'02'#39','#39'99'#39','#39'95'#39')')
    Left = 24
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptInput
      end>
    object sdqRecaidasEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
  end
  object dsPapeleria: TDataSource
    DataSet = sdqPapeleria
    Left = 136
    Top = 320
  end
  object sdqPapeleria: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT id_id, id_cuil, id_nombre'
      '   FROM SIN.sid_informacion_dictamen'
      ' WHERE id_fechabaja IS NULL'
      '       AND id_fechacargadicta IS NULL'
      '')
    Left = 108
    Top = 320
  end
  object dsDictamenes: TDataSource
    DataSet = sdqDictamenes
    Left = 136
    Top = 264
  end
  object sdqDictamenes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ev_expedincapacidad expediente, ev_porcincapacidad porcen' +
        'taje, '
      '               ev_fecha fecha, ev_idevento'
      '   FROM SIN.sti_tipoeventoinca, SIN.sei_eventoincapacidad, '
      '              sev_eventosdetramite'
      'WHERE ti_codigo IN('#39'D'#39', '#39'T'#39', '#39'H'#39')'
      '      AND ti_id = ei_tipoevento'
      '      AND ei_codigo = ev_codigo'
      '      AND ev_idexpediente = :pIdExpediente'
      '      AND ev_evento > 0'
      '')
    Left = 108
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdExpediente'
        ParamType = ptInput
      end>
  end
  object mnuViajar: TPopupMenu
    OnPopup = mnuViajarPopup
    Left = 80
    Top = 320
    object mnuViajarLiquidaciones: TMenuItem
      Caption = 'Administraci'#243'n de liquidaciones'
      OnClick = mnuViajarLiquidacionesClick
    end
    object mnuViajarSiniestros: TMenuItem
      Caption = 'Administraci'#243'n de siniestros'
      OnClick = mnuViajarSiniestrosClick
    end
    object mnuViajarContCartasDoc: TMenuItem
      Caption = 'Control de Cartas Documento'
      OnClick = mnuViajarContCartasDocClick
    end
    object mnuVerDigitalizacion: TMenuItem
      Caption = 'Ver Digitalizaci'#243'n'
      OnClick = mnuVerDigitalizacionClick
    end
  end
  object sdqSiniIncap: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 4
    Top = 16
  end
  object dsSiniIncap: TDataSource
    DataSet = sdqSiniIncap
    Left = 32
    Top = 16
  end
  object mnuLegajo: TPopupMenu
    Left = 80
    Top = 348
    object mnuDatosLegajo: TMenuItem
      Caption = 'Datos legajo'
      OnClick = mnuDatosLegajoClick
    end
    object mnuImpLegajo: TMenuItem
      Caption = 'Imprimir legajo'
      OnClick = mnuImpLegajoClick
    end
  end
  object sdqApelaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqApelacionesAfterScroll
    SQL.Strings = (
      
        'select ev_codigo CodEvento, ei_descripcion Evento, ev_fecha Fech' +
        'aEvento,'
      '          EV_IDEVENTO, ev_hora'
      'from ART.SEV_EVENTOSDETRAMITE, sin.sei_eventoincapacidad'
      'where ei_codigo = ev_codigo'
      '  and ev_idexpediente = :pIdExpediente'
      '  and ev_evento > 0'
      '  and ei_apelacionantecmc = '#39'S'#39
      '')
    Left = 108
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdExpediente'
        ParamType = ptInput
      end>
  end
  object dsApelaciones: TDataSource
    DataSet = sdqApelaciones
    Left = 136
    Top = 292
  end
  object mnuInsertarFechas: TPopupMenu
    OnPopup = mnuInsertarFechasPopup
    Left = 80
    Top = 376
    object mnuFecTopeLiq: TMenuItem
      Caption = 'Fecha tope de Liquidaciones'
      OnClick = mnuFecTopeLiqClick
    end
    object mnuFecLiqDin: TMenuItem
      Caption = 'Fecha de Liquidaci'#243'n Dinerarias'
      OnClick = mnuFecLiqDinClick
    end
    object mnuEntregaExpediente: TMenuItem
      Caption = 'Entrega Expediente'
      OnClick = mnuEntregaExpedienteClick
    end
  end
  object OpenDialog_AsocArch: TOpenDialog
    Left = 610
    Top = 502
  end
  object sdqRecaidaSin: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TO_CHAR(ex_recaida) EX_RECAIDA'
      '  FROM sex_expedientes'
      ' WHERE ex_siniestro = :siniestro'
      '   AND ex_orden = :orden'
      '   AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'02'#39', '#39'99'#39', '#39'95'#39')'
      '')
    Left = 434
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'EX_RECAIDA'
    end
  end
  object dsRecaidaSin: TDataSource
    DataSet = sdqRecaidaSin
    Left = 462
    Top = 340
  end
end
