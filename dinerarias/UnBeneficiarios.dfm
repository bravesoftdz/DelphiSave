inherited frmBeneficiarios: TfrmBeneficiarios
  Left = 294
  Top = 123
  Width = 782
  Height = 478
  Caption = 'Maestro de Beneficiarios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 774
    Height = 121
    object grpEmpresa: TGroupBox
      Left = 0
      Top = 0
      Width = 774
      Height = 40
      Align = alTop
      Caption = 'Empresa'
      TabOrder = 2
      DesignSize = (
        774
        40)
      object Label1: TLabel
        Left = 7
        Top = 17
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 38
        Top = 13
        Width = 731
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
        inherited lbContrato: TLabel
          Left = 627
        end
        inherited edContrato: TIntEdit
          Left = 672
        end
        inherited cmbRSocial: TArtComboBox
          Width = 490
        end
      end
    end
    object grpSiniestro: TGroupBox
      Left = 0
      Top = 80
      Width = 774
      Height = 40
      Align = alTop
      Caption = 'Siniestro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DesignSize = (
        774
        40)
      object blSinFecha: TLabel
        Left = 6
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object btnSiniMasDatos: TSpeedButton
        Left = 635
        Top = 14
        Width = 14
        Height = 22
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
      end
      object edSinDiagnostico: TEdit
        Left = 312
        Top = 14
        Width = 323
        Height = 21
        Hint = 'Diagn'#243'stico del Siniestro'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edCausaFin: TEdit
        Left = 131
        Top = 14
        Width = 180
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object pnlChecks: TPanel
        Left = 653
        Top = 9
        Width = 117
        Height = 26
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object chkComMed: TCheckBox
          Left = 0
          Top = 8
          Width = 69
          Height = 17
          Caption = 'Com.Med.'
          TabOrder = 0
        end
        object chkSRT: TCheckBox
          Left = 72
          Top = 8
          Width = 45
          Height = 17
          Caption = 'SRT'
          TabOrder = 1
        end
      end
    end
    object grpTrabajador: TGroupBox
      Left = 0
      Top = 40
      Width = 774
      Height = 40
      Align = alTop
      Caption = 'Trabajador'
      TabOrder = 0
      DesignSize = (
        774
        40)
      object Label3: TLabel
        Left = 7
        Top = 17
        Width = 24
        Height = 13
        Caption = 'CUIL'
      end
      object sbtnBuscar: TSpeedButton
        Left = 744
        Top = 13
        Width = 23
        Height = 22
        Hint = 'Buscar Siniestro'
        Anchors = [akTop, akRight]
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
      inline fraTrabajadorSIN: TfraTrabajadorSiniestro
        Left = 38
        Top = 14
        Width = 707
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited lbSiniestro: TLabel
          Left = 541
        end
        inherited mskCUIL: TMaskEdit
          TabOrder = 1
        end
        inherited cmbNombre: TArtComboBox
          Width = 454
          TabOrder = 2
        end
        inherited edSiniestro: TSinEdit
          Left = 606
          TabOrder = 0
          OnSelect = fraTrabajadorSINedSiniestroSelect
        end
        inherited ToolBar: TToolBar
          Left = 583
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  end
  inherited CoolBar: TCoolBar
    Top = 121
    Width = 774
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 770
      end>
    inherited ToolBar: TToolBar
      Width = 757
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Enabled = False
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
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
        Visible = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 28
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
        Visible = False
      end
      object tbControversia: TToolButton
        Left = 370
        Top = 0
        Hint = 'Controversia / reserva'
        Caption = 'tbControversia'
        ImageIndex = 24
        OnClick = tbControversiaClick
      end
      object tbFinControversia: TToolButton
        Left = 393
        Top = 0
        Hint = 'Finalizar controversia / reserva'
        Caption = 'tbFinControversia'
        ImageIndex = 16
        OnClick = tbFinControversiaClick
      end
      object ToolButton2: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLiquidaciones: TToolButton
        Left = 424
        Top = 0
        Hint = 'Ver Liquidaciones...'
        Caption = 'tbLiquidaciones'
        ImageIndex = 50
        OnClick = tbLiquidacionesClick
      end
      object ToolButton1: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 455
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 150
    Width = 774
    Height = 301
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'EB_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_GRUPOFAMILIAR'
        Title.Caption = 'G. Fam.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRPARENTEZCO'
        Title.Caption = 'Parentezco'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_REPLEGAL'
        Title.Caption = 'Rep. Legal'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_FECHANACIMIENTO'
        Title.Caption = 'Fec. Nacim.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DISCAPACITADO'
        Title.Caption = 'Discap.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porc.'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_LOCALIDAD'
        Title.Caption = 'Localidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_TELEFONO'
        Title.Caption = 'Tel.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_DOCUMENTO'
        Title.Caption = 'Documento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EB_MOTIVOBAJA'
        Title.Caption = 'Mot. Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRPARENTEZCOBENEF'
        Title.Caption = 'Parentezco Benef.'
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_CONTROVERSIA'
        Title.Alignment = taCenter
        Title.Caption = 'Controversia'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_CONTROVERSIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Controv. desde'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_CONTROVERSIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Controv. hasta'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_DOCUMDNI'
        Title.Alignment = taCenter
        Title.Caption = 'DNI'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_DOCUMNACIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Part.Nac.'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_DOCUMCASAMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Part.Casam.'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_DOCUMSUMARIA'
        Title.Alignment = taCenter
        Title.Caption = 'Inf.Sum.'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EB_DOCUMOTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Otros'
        Width = 45
        Visible = True
      end>
  end
  object PanABM: TFormPanel [3]
    Left = 368
    Top = 266
    Width = 607
    Height = 262
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = PanABMShow
    DesignSize = (
      607
      262)
    object LblNombre: TLabel
      Left = 42
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object LblParentezco: TLabel
      Left = 25
      Top = 32
      Width = 54
      Height = 13
      Caption = 'Parentezco'
    end
    object LblGrupoFam: TLabel
      Left = 377
      Top = 33
      Width = 67
      Height = 13
      Caption = 'Grupo Familiar'
    end
    object LblFecNac: TLabel
      Left = 8
      Top = 54
      Width = 71
      Height = 13
      Caption = 'Fecha de Nac.'
    end
    object lbTelefono: TLabel
      Left = 32
      Top = 150
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
    end
    object Label2: TLabel
      Left = 426
      Top = 54
      Width = 55
      Height = 13
      Caption = 'Documento'
    end
    object lbDomicilio: TLabel
      Left = 37
      Top = 75
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object lblParentezcoBenef: TLabel
      Left = 22
      Top = 166
      Width = 57
      Height = 26
      Alignment = taRightJustify
      Caption = 'Parentezco '#13#10'Benef.'
    end
    object Bevel2: TBevel
      Left = 3
      Top = 225
      Width = 601
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 4
      Top = 201
      Width = 75
      Height = 13
      Caption = 'Documentaci'#243'n'
    end
    object TxtTelefonos: TEdit
      Left = 83
      Top = 146
      Width = 288
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 8
    end
    object ChkDiscapacitado: TCheckBox
      Left = 316
      Top = 53
      Width = 97
      Height = 17
      Caption = 'Discapacitado'
      TabOrder = 5
    end
    object TxtNombre: TEdit
      Left = 83
      Top = 6
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 70
      TabOrder = 0
    end
    object cmbFecNac: TDateComboBox
      Left = 83
      Top = 50
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object ChkRepLegal: TCheckBox
      Left = 178
      Top = 53
      Width = 122
      Height = 17
      Caption = 'Representante Legal'
      TabOrder = 4
      OnClick = ChkRepLegalClick
    end
    object TxtDocumento: TEdit
      Left = 490
      Top = 50
      Width = 114
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 6
    end
    object CmbGrupoFam: TComboBox
      Left = 456
      Top = 28
      Width = 148
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    inline fraParentezco: TfraCtbTablas
      Left = 82
      Top = 27
      Width = 290
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 237
      end
    end
    object EdDomicilio: TEdit
      Left = 83
      Top = 72
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Enabled = False
      MaxLength = 70
      TabOrder = 13
    end
    inline fraParentezcoBenef: TfraCtbTablas
      Left = 82
      Top = 168
      Width = 290
      Height = 23
      TabOrder = 9
      inherited cmbDescripcion: TArtComboBox
        Width = 237
      end
    end
    inline fraDireccion: TfraDomicilio
      Left = 35
      Top = 95
      Width = 568
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnExit = fraDireccionExit
      inherited lbNro: TLabel
        Left = 353
      end
      inherited lbPiso: TLabel
        Left = 425
      end
      inherited lbDto: TLabel
        Left = 501
      end
      inherited lbProvincia: TLabel
        Left = 406
      end
      inherited cmbCalle: TArtComboBox
        Width = 268
      end
      inherited edNumero: TEdit
        Left = 375
      end
      inherited edPiso: TEdit
        Left = 451
      end
      inherited edDto: TEdit
        Left = 523
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 136
      end
      inherited edProvincia: TEdit
        Left = 455
      end
      inherited btnBuscar: TButton
        Left = 318
      end
    end
    object GroupBox1: TGroupBox
      Left = 84
      Top = 190
      Width = 461
      Height = 31
      TabOrder = 10
      TabStop = True
      object chkDocumNacimiento: TCheckBox
        Left = 85
        Top = 9
        Width = 109
        Height = 17
        Caption = 'Partida nacimiento'
        TabOrder = 1
      end
      object chkDocumDNI: TCheckBox
        Left = 5
        Top = 9
        Width = 77
        Height = 17
        Caption = 'Fotoc. DNI'
        TabOrder = 0
      end
      object chkDocumCasamiento: TCheckBox
        Left = 201
        Top = 9
        Width = 109
        Height = 17
        Caption = 'Partida casamiento'
        TabOrder = 2
      end
      object chkDocumSumaria: TCheckBox
        Left = 317
        Top = 9
        Width = 81
        Height = 17
        Caption = 'Inf. sumaria'
        TabOrder = 3
      end
      object chkDocumOtros: TCheckBox
        Left = 405
        Top = 9
        Width = 52
        Height = 17
        Caption = 'Otros'
        TabOrder = 4
      end
    end
    object btnAceptar: TBitBtn
      Left = 445
      Top = 232
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 11
      OnClick = btnAceptarClick
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
    end
    object btnCancelar: TBitBtn
      Left = 527
      Top = 232
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 12
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
      NumGlyphs = 2
    end
    object rbControversia: TRadioButton
      Left = 380
      Top = 150
      Width = 81
      Height = 17
      Caption = 'Controversia'
      Enabled = False
      TabOrder = 14
      OnClick = rbControvAltaClick
    end
    object rbReserva: TRadioButton
      Left = 466
      Top = 150
      Width = 62
      Height = 17
      Caption = 'Reserva'
      Enabled = False
      TabOrder = 15
      OnClick = rbControvAltaClick
    end
  end
  object PANBaja: TFormPanel [4]
    Left = 335
    Top = 195
    Width = 201
    Height = 115
    Caption = 'Baja de Beneficiario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      201
      115)
    object RadioGroup: TRadioGroup
      Left = 3
      Top = 6
      Width = 193
      Height = 73
      Caption = 'Motivo de Baja'
      ItemIndex = 0
      Items.Strings = (
        '&Deja de ser beneficiario'
        '&No corresponde como beneficiario')
      TabOrder = 0
    end
    object btnAceptarBorrado: TBitBtn
      Left = 120
      Top = 84
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarBorradoClick
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
    end
  end
  object edSinFecha: TDateEdit [5]
    Left = 40
    Top = 94
    Width = 90
    Height = 21
    TabStop = False
    Color = clBtnFace
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 5
  end
  object fpControversia: TFormPanel [6]
    Left = 142
    Top = 172
    Width = 464
    Height = 204
    Caption = 'Controversia / reserva'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpControversiaBeforeShow
    DesignSize = (
      464
      204)
    object Bevel1: TBevel
      Left = 5
      Top = 167
      Width = 454
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 4
      Top = 13
      Width = 62
      Height = 13
      Caption = 'Fecha desde'
    end
    object Label6: TLabel
      Left = 4
      Top = 38
      Width = 55
      Height = 13
      Caption = 'Beneficiario'
    end
    object btnCancelarCont: TBitBtn
      Left = 383
      Top = 173
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 8
      OnClick = btnCancelarContClick
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
      NumGlyphs = 2
    end
    object btnAceptarCont: TBitBtn
      Left = 301
      Top = 173
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 7
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
    end
    object dcDesdeCont: TDateComboBox
      Left = 71
      Top = 9
      Width = 88
      Height = 21
      TabOrder = 0
      OnExit = dcDesdeContExit
    end
    object rbReservaAlta: TRadioButton
      Left = 255
      Top = 10
      Width = 62
      Height = 17
      Caption = 'Reserva'
      TabOrder = 2
      OnClick = rbControvAltaClick
    end
    object rbControvAlta: TRadioButton
      Left = 169
      Top = 10
      Width = 81
      Height = 17
      Caption = 'Controversia'
      TabOrder = 1
      OnClick = rbControvAltaClick
    end
    object btnAgregarCont: TBitBtn
      Left = 433
      Top = 32
      Width = 26
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 4
      OnClick = btnAgregarContClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnQuitarCont: TBitBtn
      Left = 433
      Top = 61
      Width = 26
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 6
      OnClick = btnQuitarContClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
        0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object ArtDBGrid1: TArtDBGrid
      Left = 7
      Top = 60
      Width = 423
      Height = 103
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsControversia
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'EB_CODIGO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EB_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 192
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EB_DOCUMENTO'
          Title.Caption = 'Documento'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRPARENTEZCO'
          Title.Caption = 'Parentezco'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EB_PORCENTAJE'
          Title.Caption = 'Porcentaje'
          Width = 60
          Visible = True
        end>
    end
    inline fraBeneficiarioCont: TfraCodDesc
      Left = 69
      Top = 33
      Width = 362
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Left = 44
        Width = 317
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 40
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'eb_fechabaja'
        FieldCodigo = 'eb_codigo'
        FieldDesc = 'eb_nombre'
        FieldID = 'eb_codigo'
        IdType = ctInteger
        TableName = 'seb_beneficiarios'
      end
    end
  end
  object fpFechaFin: TFormPanel [7]
    Left = 186
    Top = 281
    Width = 214
    Height = 86
    Caption = 'Controversia / reserva'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpFechaFinBeforeShow
    DesignSize = (
      214
      86)
    object Label87: TLabel
      Left = 10
      Top = 17
      Width = 100
      Height = 13
      Caption = 'Fecha de finalizaci'#243'n'
    end
    object Bevel5: TBevel
      Left = 4
      Top = 44
      Width = 206
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnCerrarFecha: TBitBtn
      Left = 131
      Top = 52
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
    object btnAceptarFecha: TBitBtn
      Left = 49
      Top = 52
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      TabOrder = 0
      OnClick = btnAceptarFechaClick
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
    end
    object dcHastaCont: TDateComboBox
      Left = 117
      Top = 13
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   eb_siniestro, eb_orden, eb_recaida, eb_codigo, eb_nombr' +
        'e, eb_direccion, '
      
        '         eb_caracter, eb_cpostal, eb_localidad, eb_fechanacimien' +
        'to, eb_benefprincipal, '
      
        '         eb_fechaalta, eb_usualta, eb_fechamodif, eb_usumodif, e' +
        'b_provincia, eb_porcentaje, '
      
        '         eb_fechabaja, eb_usubaja, eb_grupofamiliar, eb_replegal' +
        ', eb_discapacitado, '
      
        '         eb_documento, eb_telefono, eb_parenbene, NVL(eb_controv' +
        'ersia, '#39'N'#39') eb_controversia,'
      '         parentezco.tb_descripcion descrparentezco,'
      '         parentezcobenef.tb_descripcion descrparentezcobenef,'
      
        '         DECODE(eb_motivobaja, '#39'D'#39', '#39'Dejo de ser beneficiario'#39', ' +
        #39'N'#39', '#39'No es beneficiairo'#39', NULL) AS eb_motivobaja,'
      
        '         eb_documdni, eb_documnacimiento, eb_documcasamiento, eb' +
        '_documsumaria,'
      
        '         eb_documotros, eb_controversiadesde, eb_controversiahas' +
        'ta, eb_calle, eb_numero, eb_piso, eb_departamento'
      
        '    FROM seb_beneficiarios, ctb_tablas parentezco, ctb_tablas pa' +
        'rentezcobenef, art.sex_expedientes'
      '   WHERE eb_siniestro = :nsiniestro'
      '     AND eb_orden = :norden'
      '     AND eb_recaida = :nrecaida'
      '     AND eb_caracter = parentezco.tb_codigo(+)'
      '     AND parentezco.tb_clave(+) = '#39'PAREN'#39
      '     AND eb_parenbene = parentezcobenef.tb_codigo(+)'
      '     AND parentezcobenef.tb_clave(+) = '#39'PAREN'#39
      '     AND eb_siniestro = ex_siniestro'
      '     AND eb_orden = ex_orden'
      '     AND eb_recaida = ex_recaida'
      'ORDER BY eb_grupofamiliar'
      '')
    Left = 8
    Top = 316
    ParamData = <
      item
        DataType = ftString
        Name = 'nSINIESTRO'
        ParamType = ptInput
        Value = '71657'
      end
      item
        DataType = ftString
        Name = 'nORDEN'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'nRECAIDA'
        ParamType = ptInput
        Value = '0'
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 316
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 344
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 344
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'C'#243'd.'
        TitleAlignment = taCenter
        DataField = 'EB_CODIGO'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'G.Fam.'
        TitleAlignment = taCenter
        DataField = 'EB_GRUPOFAMILIAR'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Nombre'
        DataField = 'EB_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DESCRPARENTEZCO'
        MaxLength = 11
      end
      item
        Title = 'R.Leg.'
        TitleAlignment = taCenter
        DataField = 'EB_REPLEGAL'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'F. Nac.'
        TitleAlignment = taCenter
        DataField = 'EB_FECHANACIMIENTO'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Disc.'
        TitleAlignment = taCenter
        DataField = 'EB_DISCAPACITADO'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Porc.'
        DataField = 'EB_PORCENTAJE'
        MaxLength = 7
      end
      item
        Title = 'Direcci'#243'n'
        DataField = 'EB_DIRECCION'
        MaxLength = 30
      end
      item
        Title = 'Localidad'
        DataField = 'EB_LOCALIDAD'
        MaxLength = 17
      end
      item
        Title = 'Tel.'
        DataField = 'EB_TELEFONO'
        MaxLength = 15
      end
      item
        Title = 'Documento'
        DataField = 'EB_DOCUMENTO'
        MaxLength = 12
      end
      item
        Title = 'Parentezco'
        DataField = 'DESCRPARENTEZCOBENEF'
        MaxLength = 11
      end
      item
        Title = 'Controv.'
        TitleAlignment = taCenter
        DataField = 'EB_CONTROVERSIA'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Doc.DNI'
        TitleAlignment = taCenter
        DataField = 'EB_DOCUMDNI'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Doc.Nac.'
        TitleAlignment = taCenter
        DataField = 'EB_DOCUMNACIMIENTO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Doc.Cas.'
        TitleAlignment = taCenter
        DataField = 'EB_DOCUMCASAMIENTO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Doc.Sum.'
        TitleAlignment = taCenter
        DataField = 'EB_DOCUMSUMARIA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Doc.Otros'
        TitleAlignment = taCenter
        DataField = 'EB_DOCUMOTROS'
        Alignment = taCenter
        MaxLength = 9
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
    Left = 36
    Top = 372
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 7
    Top = 288
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 288
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 372
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 0
      end>
    Left = 64
    Top = 288
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 316
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ex_siniestro, ex_orden, ex_recaida, ex_fechaaccidente, ex' +
        '_diagnostico, '
      
        '       ex_gravedad, art.amebpba.get_causafin(ex_causafin) causaf' +
        'in, ex_cuit, '
      
        '       ex_cuil, ex_causafin, ex_gtrabajo, gp_nombre, lg_nombre, ' +
        'ex_prestador,'
      '       em_id, ex_idtrabajador'
      '  FROM mgp_gtrabajo, sex_expedientes, usc_sectores, '
      '       dlg_delegaciones, aem_empresa'
      ' WHERE ex_gtrabajo = gp_codigo(+)'
      '   AND lg_codigo = sc_delegacion'
      '   AND ex_sector = sc_codigo(+)'
      '   AND ex_cuit = em_cuit'
      '   AND ex_siniestro = :psiniestro'
      '   AND ex_orden = :porden'
      '   AND ex_recaida = :precaida'
      '')
    Left = 320
    Top = 164
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
      Size = 2
    end
    object sdqBusquedaGP_NOMBRE: TStringField
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqBusquedaLG_NOMBRE: TStringField
      FieldName = 'LG_NOMBRE'
      Size = 50
    end
    object sdqBusquedaEX_PRESTADOR: TFloatField
      FieldName = 'EX_PRESTADOR'
    end
    object sdqBusquedaEX_GRAVEDAD: TStringField
      FieldName = 'EX_GRAVEDAD'
      Size = 1
    end
    object sdqBusquedaEX_IDTRABAJADOR: TFloatField
      FieldName = 'EX_IDTRABAJADOR'
    end
    object sdqBusquedaEM_ID: TFloatField
      FieldName = 'EM_ID'
      Required = True
    end
  end
  object dsBusqueda: TDataSource
    DataSet = sdqBusqueda
    Left = 348
    Top = 164
  end
  object SDQGruposFam: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 268
    Top = 52
  end
  object dsControversia: TDataSource
    DataSet = sdqControversia
    Left = 36
    Top = 400
  end
  object sdqControversia: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT   eb_codigo, eb_nombre, eb_porcentaje, eb_replegal, '
      '         eb_documento, parentezco.tb_descripcion descrparentezco'
      '    FROM seb_beneficiarios, ctb_tablas parentezco'
      '   WHERE eb_caracter = parentezco.tb_codigo(+)'
      '     AND parentezco.tb_clave(+) = '#39'PAREN'#39
      '     AND eb_siniestro = :nsiniestro'
      '     AND eb_fechabaja IS NULL '
      '     AND eb_orden = :norden'
      '     AND eb_recaida = :nrecaida'
      '     AND NVL(eb_controversia, '#39'N'#39') = :cont'
      '     AND eb_controversiadesde = :desde'
      'ORDER BY eb_grupofamiliar, eb_codigo'
      '')
    Left = 8
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'nSINIESTRO'
        ParamType = ptInput
        Value = '71657'
      end
      item
        DataType = ftString
        Name = 'nORDEN'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'nRECAIDA'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'cont'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'desde'
        ParamType = ptInput
      end>
  end
end
