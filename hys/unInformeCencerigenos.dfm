inherited frmInformeCencerigenos: TfrmInformeCencerigenos
  Left = 174
  Top = 148
  Width = 593
  Height = 511
  ActiveControl = edNumeroInforme
  Caption = 'Informe Cancer'#237'genos'
  Constraints.MinHeight = 444
  Constraints.MinWidth = 593
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 223
    Align = alNone
    BevelInner = bvRaised
    BevelOuter = bvLowered
    object Label11: TLabel
      Left = 4
      Top = 8
      Width = 92
      Height = 13
      Caption = 'N'#250'mero del Informe'
    end
    object btnBuscarInforme: TSpeedButton
      Left = 196
      Top = 4
      Width = 23
      Height = 22
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
      OnClick = btnBuscarInformeClick
    end
    object edNumeroInforme: TIntEdit
      Left = 108
      Top = 4
      Width = 85
      Height = 21
      TabOrder = 0
      OnKeyDown = edNumeroInformeKeyDown
      OnKeyPress = edNumeroInformeKeyPress
    end
  end
  inherited CoolBar: TCoolBar
    Left = 226
    Top = 0
    Width = 357
    Align = alNone
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 353
      end>
    inherited ToolBar: TToolBar
      Width = 340
      inherited tbNuevo: TToolButton
        ImageIndex = 6
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
      end
      inherited tbImprimir: TToolButton
        Enabled = False
        ImageIndex = 4
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 32
    Width = 584
    Height = 421
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 421
      ActivePage = tsEstablecimientos
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      object tsEstablecimientos: TTabSheet
        Caption = '&Establecimientos'
        ImageIndex = 1
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar1: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCENuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCENuevoClick
            end
            object tbPCEModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbPCEModificar'
              ImageIndex = 7
              OnClick = tbPCEModificarClick
            end
            object tbPCEEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCEEliminarClick
            end
          end
        end
        object dbgPCE_CANCERESTABLECI: TArtDBGrid
          Left = 0
          Top = 29
          Width = 576
          Height = 364
          Align = alClient
          DataSource = dsPCE_CANCERESTABLECI
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCE_CANCERESTABLECIDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCE_CANCERESTABLECIGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CE_CUIT'
              Title.Caption = 'CUIT'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CE_NOMBRE'
              Title.Caption = 'R.Social'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CE_NUMEROESTABLECI'
              Title.Caption = 'Establecimiento'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CE_NOMBRE'
              Title.Caption = 'Nombre Establecimiento'
              Width = 171
              Visible = True
            end>
        end
        object fpEstablecimientos: TFormPanel
          Left = 256
          Top = -8
          Width = 517
          Height = 397
          Caption = 'Establecimiento'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          Constraints.MinHeight = 121
          Constraints.MinWidth = 500
          DesignSize = (
            517
            397)
          object BevelAbm: TBevel
            Left = 4
            Top = 355
            Width = 509
            Height = 4
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label12: TLabel
            Left = 31
            Top = 101
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label13: TLabel
            Left = 31
            Top = 129
            Width = 37
            Height = 13
            Caption = 'Nombre'
          end
          object Label14: TLabel
            Left = 31
            Top = 157
            Width = 57
            Height = 13
            Caption = 'Calle / Ruta'
          end
          object Bevel4: TBevel
            Left = 4
            Top = 90
            Width = 509
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label15: TLabel
            Left = 31
            Top = 186
            Width = 43
            Height = 13
            Caption = 'Nro / Km'
          end
          object Label16: TLabel
            Left = 195
            Top = 186
            Width = 20
            Height = 13
            Caption = 'Piso'
          end
          object Label17: TLabel
            Left = 279
            Top = 186
            Width = 54
            Height = 13
            Caption = 'Dto / Local'
          end
          object Label18: TLabel
            Left = 31
            Top = 212
            Width = 46
            Height = 13
            Caption = 'Localidad'
          end
          object Label19: TLabel
            Left = 31
            Top = 239
            Width = 61
            Height = 13
            Caption = 'Partido / Dto'
          end
          object Label20: TLabel
            Left = 31
            Top = 268
            Width = 44
            Height = 13
            Caption = 'Provincia'
          end
          object Label21: TLabel
            Left = 315
            Top = 268
            Width = 113
            Height = 13
            Caption = 'C'#243'digo Postal Argentino'
          end
          object Bevel5: TBevel
            Left = 4
            Top = 290
            Width = 509
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label22: TLabel
            Left = 43
            Top = 304
            Width = 48
            Height = 13
            Caption = 'CIIU Emp.'
          end
          object Label23: TLabel
            Left = 43
            Top = 330
            Width = 54
            Height = 13
            Caption = 'CIIU Estab.'
          end
          object btnPCETomarDatos: TSpeedButton
            Left = 187
            Top = 97
            Width = 24
            Height = 22
            Hint = 'Traer los valores de los datos de la Base de Datos'
            Flat = True
            Glyph.Data = {
              36080000424D360800000000000036000000280000002A000000100000000100
              18000000000000080000C40E0000C40E0000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF001010
              1010101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0016161616161600FF0000FF0000FF00161616
              16161600FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00101010007F7F10101000FF0000FF001010
              10007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0016161696969616161600FF0000FF00161616
              96969616161600FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF001010
              10009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600FF00161616
              A1A1A196969616161600FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F1010101010
              1000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A1969696161616161616
              AAAAAAA1A1A196969616161600FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
              1000FFFF00CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A1969696161616
              B8B8B8AAAAAAA1A1A196969616161600FF0000FF0000FF000000002F2F101010
              10101010101010101010101010101010101000FFFF00FFFF00CFCF009090007F
              7F10101000FFFF00CFCF009090007F7F10101000FF0000FF0016161616161616
              1616161616161616161616161616161616B8B8B8B8B8B8AAAAAAA1A1A1969696
              161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF000000002F2F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
              90007F7F10101000FFFF00CFCF009090007F7F10101000FF0000333396969696
              9696969696969696969696969696969696C1C1C1B8B8B8B8B8B8AAAAAAA1A1A1
              969696161616B8B8B8AAAAAAA1A1A196969616161600FF000000002F2F60FFFF
              60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF2FFFFF00FFFF00FFFF00CF
              CF009090007F7F10101000FFFF00CFCF009090007F7F101010003333CACACACA
              CACACACACACACACACACACACACACACACACACACACAC1C1C1B8B8B8B8B8B8AAAAAA
              A1A1A1969696161616B8B8B8AAAAAAA1A1A19696961616160000002F2F90FFFF
              EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
              FF00CFCF007F7F002F2FEFF0FF00FFFF00CFCF007F7F002F2F003333B8B8B8B8
              B8B8E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B8B8B8
              AAAAAA969696003333E3E3E3B8B8B8AAAAAA9696960033330000002F2FCFFFFF
              CFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFEFF0FF2FFFFF00FF
              FF007F7F002F2FEFF0FF2FFFFF00FFFF007F7F002F2F00FF00003333DADADADA
              DADADADADADADADADADADADADADADADADADADADADADADAE3E3E3C1C1C1B8B8B8
              969696003333E3E3E3C1C1C1B8B8B896969600333300FF000000002F2F002F2F
              002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
              7F002F2FEFF0FFCFFFFF2FFFFF007F7F002F2F00FF0000FF0000333300333300
              3333003333003333003333003333003333DADADAF1F1F1DADADAC1C1C1969696
              003333F1F1F1DADADAC1C1C196969600333300FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F002F
              2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADADADADADADADA969696003333
              DADADADADADADADADA96969600333300FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F002F
              2FCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADADADADA969696003333003333
              DADADADADADA96969600333300FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF00002F
              2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADA96969600333300FF00003333
              DADADA96969600333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF00002F
              2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000333396969600333300FF0000FF00003333
              96969600333300FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000FF0000FF00002F
              2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000333300333300FF0000FF0000FF00003333
              00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPCETomarDatosClick
          end
          object Label64: TLabel
            Left = 0
            Top = 11
            Width = 28
            Height = 14
            Caption = '(01)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label65: TLabel
            Left = 0
            Top = 39
            Width = 28
            Height = 14
            Caption = '(02)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label66: TLabel
            Left = 0
            Top = 156
            Width = 28
            Height = 14
            Caption = '(09)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label67: TLabel
            Left = 0
            Top = 211
            Width = 28
            Height = 14
            Caption = '(10)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label68: TLabel
            Left = 0
            Top = 267
            Width = 28
            Height = 14
            Caption = '(11)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label69: TLabel
            Left = 284
            Top = 267
            Width = 28
            Height = 14
            Caption = '(12)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label70: TLabel
            Left = 0
            Top = 128
            Width = 28
            Height = 14
            Caption = '(08)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label71: TLabel
            Left = 0
            Top = 303
            Width = 42
            Height = 14
            Caption = '(19.a)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label72: TLabel
            Left = 0
            Top = 329
            Width = 42
            Height = 14
            Caption = '(19.b)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label73: TLabel
            Left = 0
            Top = 185
            Width = 28
            Height = 14
            Caption = '(09)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inline fraCE_CUIT: TfraEmpresa
            Left = 27
            Top = 8
            Width = 501
            Height = 81
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
            inherited lbRSocial: TLabel
              Left = 4
              Top = 32
              Width = 60
              Caption = 'Raz'#243'n Social'
            end
            inherited lbContrato: TLabel
              Left = 5
              Top = 60
            end
            inherited mskCUIT: TMaskEdit
              Left = 72
            end
            inherited edContrato: TIntEdit
              Left = 72
              Top = 56
            end
            inherited cmbRSocial: TArtComboBox
              Left = 72
              Top = 28
              Width = 414
            end
            inherited sdqDatos: TSDQuery
              Left = 160
              Top = 0
            end
            inherited dsDatos: TDataSource
              Left = 188
              Top = 0
            end
          end
          object btnEstAceptar: TButton
            Left = 359
            Top = 363
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 12
            OnClick = btnEstAceptarClick
          end
          object btnEstCancelar: TButton
            Left = 437
            Top = 363
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 13
          end
          object edCE_NUMEROESTABLECI: TIntEdit
            Left = 99
            Top = 97
            Width = 85
            Height = 21
            TabOrder = 1
            OnKeyPress = edCE_NUMEROESTABLECIKeyPress
            MaxLength = 6
          end
          object edCE_NOMBRE: TEdit
            Left = 99
            Top = 125
            Width = 410
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 50
            TabOrder = 2
          end
          object edCE_CALLE: TEdit
            Left = 99
            Top = 153
            Width = 410
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 3
          end
          object edCE_NUMERO: TEdit
            Left = 99
            Top = 181
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 4
          end
          object edCE_PISO: TEdit
            Left = 225
            Top = 181
            Width = 46
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 5
            TabOrder = 5
          end
          object edCE_DEPARTAMENTO: TEdit
            Left = 343
            Top = 181
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 6
          end
          object edCE_LOCALIDAD: TEdit
            Left = 99
            Top = 208
            Width = 410
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 7
          end
          object edCE_PARTIDO: TEdit
            Left = 99
            Top = 235
            Width = 410
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 8
          end
          object cmbCE_PROVINCIA: TExComboBox
            Left = 99
            Top = 263
            Width = 182
            Height = 22
            Style = csOwnerDrawFixed
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 16
            TabOrder = 9
            ItemIndex = -1
            Options = [coShowValues, coGridLines]
            ValueWidth = 64
          end
          object edCE_CPOSTALA: TPatternEdit
            Left = 432
            Top = 264
            Width = 77
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 8
            TabOrder = 10
            Pattern = 'ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789'
          end
          inline fraCE_CIIU_Establecimiento: TfraActividad
            Left = 98
            Top = 324
            Width = 413
            Height = 23
            TabOrder = 11
            inherited cmbDescripcion: TArtComboBox
              Width = 364
            end
          end
          inline fraCE_CIIU: TfraActividad
            Left = 98
            Top = 300
            Width = 413
            Height = 23
            TabOrder = 14
            inherited cmbDescripcion: TArtComboBox
              Width = 364
            end
          end
        end
      end
      object tsDatosGenerales: TTabSheet
        Caption = '&Datos Generales'
        DesignSize = (
          576
          393)
        object GroupBox1: TGroupBox
          Left = 0
          Top = 4
          Width = 576
          Height = 73
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Informe'
          TabOrder = 0
          DesignSize = (
            576
            73)
          object Label9: TLabel
            Left = 6
            Top = 20
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label10: TLabel
            Left = 34
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object lbInfExportado: TLabel
            Left = 567
            Top = 56
            Width = 3
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
          end
          object Label95: TLabel
            Left = 4
            Top = 47
            Width = 28
            Height = 14
            Caption = '(17)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCI_ID: TEdit
            Left = 132
            Top = 16
            Width = 87
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
          object edCI_FECHA: TDateComboBox
            Left = 132
            Top = 44
            Width = 88
            Height = 21
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 80
          Width = 576
          Height = 133
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Responsable'
          TabOrder = 1
          DesignSize = (
            576
            133)
          object Label1: TLabel
            Left = 34
            Top = 24
            Width = 60
            Height = 13
            Caption = 'CUIT / CUIL'
          end
          object Label5: TLabel
            Left = 34
            Top = 50
            Width = 85
            Height = 13
            Caption = 'Apellido y Nombre'
          end
          object Label6: TLabel
            Left = 34
            Top = 77
            Width = 94
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label7: TLabel
            Left = 34
            Top = 104
            Width = 75
            Height = 13
            Caption = 'Representaci'#243'n'
          end
          object Label58: TLabel
            Left = 4
            Top = 23
            Width = 28
            Height = 14
            Caption = '(16)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 4
            Top = 49
            Width = 28
            Height = 14
            Caption = '(14)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 4
            Top = 76
            Width = 28
            Height = 14
            Caption = '(15)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 4
            Top = 103
            Width = 28
            Height = 14
            Caption = '(18)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCI_RESP_CUILCUIT: TMaskEdit
            Left = 133
            Top = 16
            Width = 81
            Height = 21
            EditMask = '99-########-c;0; '
            MaxLength = 13
            TabOrder = 0
          end
          object edCI_RESP_NOMBRE: TEdit
            Left = 133
            Top = 44
            Width = 436
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 1
          end
          inline fraCI_RESP_TIPODOCUMENTO: TfraStaticCTB_TABLAS
            Left = 133
            Top = 71
            Width = 436
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            inherited cmbDescripcion: TComboGrid
              Width = 372
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
          inline fraCI_REPRESENTACION: TfraStaticCTB_TABLAS
            Left = 133
            Top = 99
            Width = 436
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            inherited cmbDescripcion: TComboGrid
              Width = 372
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
        object GroupBox3: TGroupBox
          Left = 0
          Top = 216
          Width = 576
          Height = 105
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Personal'
          TabOrder = 2
          object Label2: TLabel
            Left = 34
            Top = 20
            Width = 62
            Height = 13
            Caption = 'Administativo'
          end
          object Label3: TLabel
            Left = 34
            Top = 48
            Width = 54
            Height = 13
            Caption = 'Producci'#243'n'
          end
          object Label4: TLabel
            Left = 34
            Top = 80
            Width = 24
            Height = 13
            Caption = 'Total'
          end
          object Bevel3: TBevel
            Left = 124
            Top = 69
            Width = 115
            Height = 3
            Shape = bsTopLine
          end
          object Label61: TLabel
            Left = 4
            Top = 19
            Width = 28
            Height = 14
            Caption = '(20)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label62: TLabel
            Left = 4
            Top = 47
            Width = 28
            Height = 14
            Caption = '(21)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label63: TLabel
            Left = 4
            Top = 79
            Width = 28
            Height = 14
            Caption = '(22)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCI_PERS_ADMINISTRACION: TIntEdit
            Left = 136
            Top = 16
            Width = 90
            Height = 21
            TabOrder = 0
            OnChange = edCI_PERS_ADMINISTRACIONChange
            Alignment = taRightJustify
          end
          object edCI_PERS_PRODUCCION: TIntEdit
            Left = 136
            Top = 44
            Width = 90
            Height = 21
            TabOrder = 1
            OnChange = edCI_PERS_ADMINISTRACIONChange
            Alignment = taRightJustify
          end
          object edCI_PERS_TOTAL: TIntEdit
            Left = 136
            Top = 76
            Width = 90
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
            Alignment = taRightJustify
          end
        end
      end
      object tsSustancias: TTabSheet
        Caption = '&Sustancias'
        ImageIndex = 4
        object Splitter3: TSplitter
          Left = 0
          Top = 161
          Width = 576
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object CoolBar6: TCoolBar
          Left = 0
          Top = 0
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar6
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar6: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCSNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCSNuevoClick
            end
            object tbPCSModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCSModificarClick
            end
            object tbPCSEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCSEliminarClick
            end
            object Label78: TLabel
              Left = 69
              Top = 0
              Width = 63
              Height = 14
              Caption = ' (33..39)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCS_CANCERSUSTANCIA: TArtDBGrid
          Left = 0
          Top = 29
          Width = 576
          Height = 132
          Align = alTop
          Constraints.MinHeight = 60
          DataSource = dsPCS_CANCERSUSTANCIA
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCS_CANCERSUSTANCIADblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCS_CANCERSUSTANCIAGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CS_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RG_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 446
              Visible = True
            end>
        end
        object CoolBar7: TCoolBar
          Left = 0
          Top = 164
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar7
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar7: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCCNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCCNuevoClick
            end
            object tbPCCModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCCModificarClick
            end
            object tbPCCEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCCEliminarClick
            end
            object Label79: TLabel
              Left = 69
              Top = 0
              Width = 56
              Height = 14
              Caption = ' (38/39)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCC_CANCERESTUDIO: TArtDBGrid
          Left = 0
          Top = 193
          Width = 576
          Height = 200
          Align = alClient
          Constraints.MinHeight = 60
          DataSource = dsPCC_CANCERESTUDIO
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCC_CANCERESTUDIODblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCC_CANCERESTUDIOGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CC_DETERMINACIONES'
              Title.Caption = 'Determinaciones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRECUENCIA'
              Title.Caption = 'Frecuencia'
              Width = 175
              Visible = True
            end>
        end
        object fpPCS_CANCERSUSTANCIA: TFormPanel
          Left = 96
          Top = -32
          Width = 505
          Height = 423
          Caption = 'Sustancias'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          Constraints.MinHeight = 73
          Constraints.MinWidth = 163
          DesignSize = (
            505
            423)
          object Bevel8: TBevel
            Left = 4
            Top = 387
            Width = 497
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label47: TLabel
            Left = 8
            Top = 13
            Width = 47
            Height = 13
            Caption = 'Sustancia'
          end
          object Bevel9: TBevel
            Left = 4
            Top = 64
            Width = 497
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label46: TLabel
            Left = 8
            Top = 76
            Width = 40
            Height = 13
            Caption = 'Estudios'
          end
          object Label48: TLabel
            Left = 8
            Top = 152
            Width = 40
            Height = 13
            Caption = 'Medidas'
          end
          object Bevel10: TBevel
            Left = 4
            Top = 224
            Width = 497
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label49: TLabel
            Left = 8
            Top = 236
            Width = 49
            Height = 13
            Caption = 'Ex'#225'menes'
          end
          object Label84: TLabel
            Left = 216
            Top = 41
            Width = 28
            Height = 14
            Caption = '(33)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label85: TLabel
            Left = 448
            Top = 41
            Width = 28
            Height = 14
            Caption = '(34)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label86: TLabel
            Left = 7
            Top = 89
            Width = 28
            Height = 14
            Caption = '(35)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 7
            Top = 165
            Width = 28
            Height = 14
            Caption = '(36)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label88: TLabel
            Left = 59
            Top = 236
            Width = 28
            Height = 14
            Caption = '(37)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Bevel17: TBevel
            Left = 4
            Top = 260
            Width = 497
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label89: TLabel
            Left = 8
            Top = 272
            Width = 159
            Height = 13
            Caption = 'Estudios Ambientales Espec'#237'ficos'
          end
          object Label90: TLabel
            Left = 171
            Top = 272
            Width = 28
            Height = 14
            Caption = '(38)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label91: TLabel
            Left = 223
            Top = 300
            Width = 53
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Frecuencia'
          end
          object Bevel18: TBevel
            Left = 4
            Top = 324
            Width = 497
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label92: TLabel
            Left = 9
            Top = 336
            Width = 150
            Height = 13
            Caption = 'Estudios Biol'#243'gicos Espec'#237'ficos'
          end
          object Label93: TLabel
            Left = 172
            Top = 336
            Width = 28
            Height = 14
            Caption = '(39)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label94: TLabel
            Left = 224
            Top = 364
            Width = 53
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Frecuencia'
          end
          object btnPCSAceptar: TButton
            Left = 347
            Top = 393
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 12
            OnClick = btnPCSAceptarClick
          end
          object btnPCSCancelar: TButton
            Left = 425
            Top = 393
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 13
          end
          inline fraCS_CODIGO: TfraStaticCodigoDescripcion
            Left = 67
            Top = 7
            Width = 432
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            inherited cmbDescripcion: TComboGrid
              Width = 369
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
          object chkCS_INFORMACION: TCheckBox
            Left = 68
            Top = 40
            Width = 145
            Height = 17
            Caption = 'Informaci'#243'n sobre Riesgos'
            TabOrder = 1
          end
          object chkCS_CAPACITACION: TCheckBox
            Left = 292
            Top = 40
            Width = 157
            Height = 17
            Caption = 'Capacitaci'#243'n sobre Riesgos'
            TabOrder = 2
          end
          object edCS_ESTUDIOS: TMemo
            Left = 68
            Top = 72
            Width = 429
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 3
          end
          object edCS_MEDIDAS: TMemo
            Left = 68
            Top = 148
            Width = 429
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 4
          end
          object chkCS_EXAMEN_PREOCUPACIONAL: TCheckBox
            Left = 104
            Top = 235
            Width = 109
            Height = 17
            Caption = 'Preocupacionales'
            TabOrder = 5
          end
          object chkCS_EXAMEN_PERIODICO: TCheckBox
            Left = 256
            Top = 235
            Width = 73
            Height = 17
            Caption = 'Peri'#243'dicos'
            TabOrder = 6
          end
          object chkCS_EXAMEN_EGRESO: TCheckBox
            Left = 372
            Top = 235
            Width = 97
            Height = 17
            Caption = 'De Egreso'
            TabOrder = 7
          end
          object chkEstAmbCC_DETERMINACIONES: TCheckBox
            Left = 220
            Top = 272
            Width = 165
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Determinaciones Efectuadas'
            TabOrder = 8
          end
          object cmbEstAmbCC_FRECUENCIA: TComboBox
            Left = 372
            Top = 296
            Width = 125
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 9
            Items.Strings = (
              'Trimestral'
              'Semestral'
              'Anual'
              'Otra')
          end
          object chkEstBioCC_DETERMINACIONES: TCheckBox
            Left = 221
            Top = 336
            Width = 165
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Determinaciones Efectuadas'
            TabOrder = 10
          end
          object cmbEstBioCC_FRECUENCIA: TComboBox
            Left = 373
            Top = 360
            Width = 125
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 11
            Items.Strings = (
              'Trimestral'
              'Semestral'
              'Anual'
              'Otra')
          end
        end
        object fpPCC_CANCERESTUDIO: TFormPanel
          Left = 144
          Top = 60
          Width = 285
          Height = 129
          Caption = 'Estudio'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          BorderStyle = bsSingle
          Position = poOwnerFormCenter
          Constraints.MinHeight = 73
          Constraints.MinWidth = 163
          DesignSize = (
            285
            129)
          object Bevel11: TBevel
            Left = 4
            Top = 93
            Width = 277
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label50: TLabel
            Left = 10
            Top = 12
            Width = 21
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Tipo'
          end
          object Label51: TLabel
            Left = 12
            Top = 72
            Width = 53
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Frecuencia'
          end
          object btnPCCAceptar: TButton
            Left = 127
            Top = 99
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 3
            OnClick = btnPCCAceptarClick
          end
          object btnPCCCancelar: TButton
            Left = 205
            Top = 99
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 4
          end
          object cmbCC_TIPO: TComboBox
            Left = 152
            Top = 8
            Width = 125
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Ambiental'
              'Biol'#243'gico')
          end
          object chkCC_DETERMINACIONES: TCheckBox
            Left = 8
            Top = 40
            Width = 157
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Determinaciones Efectuadas'
            TabOrder = 1
          end
          object cmbCC_FRECUENCIA: TComboBox
            Left = 152
            Top = 68
            Width = 125
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'Trimestral'
              'Semestral'
              'Anual'
              'Otra')
          end
        end
      end
      object tsProveedores: TTabSheet
        Caption = '&Proveedores / Compradores'
        ImageIndex = 3
        object Splitter2: TSplitter
          Left = 0
          Top = 201
          Width = 576
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object CoolBar4: TCoolBar
          Left = 0
          Top = 0
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar4
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar4: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCPNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCPNuevoClick
            end
            object tbPCPModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCPModificarClick
            end
            object tbPCPEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCPEliminarClick
            end
            object Label76: TLabel
              Left = 69
              Top = 0
              Width = 56
              Height = 14
              Caption = ' (43/44)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCP_CANCERPROVEEDOR: TArtDBGrid
          Left = 0
          Top = 29
          Width = 576
          Height = 172
          Align = alTop
          Constraints.MinHeight = 60
          DataSource = dsPCP_CANCERPROVEEDOR
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCP_CANCERPROVEEDORDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCP_CANCERPROVEEDORGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CP_CUIT'
              Title.Caption = 'CUIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CP_NOMBRE'
              Title.Caption = 'Nombre'
              Visible = True
            end>
        end
        object CoolBar5: TCoolBar
          Left = 0
          Top = 204
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar5
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar5: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCDNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCDNuevoClick
            end
            object tbPCDModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCDModificarClick
            end
            object tbPCDEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCDEliminarClick
            end
            object Label77: TLabel
              Left = 69
              Top = 0
              Width = 56
              Height = 14
              Caption = ' (43/44)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCD_CANCERPRODUCTOS: TArtDBGrid
          Left = 0
          Top = 233
          Width = 576
          Height = 160
          Align = alClient
          Constraints.MinHeight = 60
          DataSource = dsPCD_CANCERPRODUCTOS
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCD_CANCERPRODUCTOSDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCD_CANCERPRODUCTOSGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_NOMBRE_QUIMICO'
              Title.Caption = 'Nombre Qu'#237'mico'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_NOMBRE_COMERCIAL'
              Title.Caption = 'Nombre Comercial'
              Width = 211
              Visible = True
            end>
        end
        object fpPCP_CANCERPROVEEDOR: TFormPanel
          Left = 108
          Top = 116
          Width = 517
          Height = 269
          Caption = 'Proveedores / Compradores'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          BorderStyle = bsSingle
          Position = poOwnerFormCenter
          Constraints.MaxHeight = 269
          Constraints.MinHeight = 269
          Constraints.MinWidth = 500
          DesignSize = (
            517
            269)
          object Bevel6: TBevel
            Left = 4
            Top = 233
            Width = 509
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label32: TLabel
            Left = 8
            Top = 41
            Width = 37
            Height = 13
            Caption = 'Nombre'
          end
          object Label33: TLabel
            Left = 8
            Top = 69
            Width = 57
            Height = 13
            Caption = 'Calle / Ruta'
          end
          object Label34: TLabel
            Left = 8
            Top = 98
            Width = 43
            Height = 13
            Caption = 'Nro / Km'
          end
          object Label35: TLabel
            Left = 176
            Top = 98
            Width = 20
            Height = 13
            Caption = 'Piso'
          end
          object Label36: TLabel
            Left = 260
            Top = 98
            Width = 54
            Height = 13
            Caption = 'Dto / Local'
          end
          object Label37: TLabel
            Left = 8
            Top = 124
            Width = 46
            Height = 13
            Caption = 'Localidad'
          end
          object Label38: TLabel
            Left = 8
            Top = 151
            Width = 61
            Height = 13
            Caption = 'Partido / Dto'
          end
          object Label39: TLabel
            Left = 8
            Top = 180
            Width = 44
            Height = 13
            Caption = 'Provincia'
          end
          object Label40: TLabel
            Left = 288
            Top = 180
            Width = 113
            Height = 13
            Caption = 'C'#243'digo Postal Argentino'
          end
          object Label31: TLabel
            Left = 8
            Top = 14
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label41: TLabel
            Left = 8
            Top = 208
            Width = 42
            Height = 13
            Caption = 'Tel'#233'fono'
          end
          object Label42: TLabel
            Left = 204
            Top = 14
            Width = 21
            Height = 13
            Caption = 'Tipo'
          end
          object btnPCPTomarDatos: TSpeedButton
            Left = 167
            Top = 9
            Width = 24
            Height = 22
            Hint = 'Traer los valores de los datos de la Base de Datos'
            Flat = True
            Glyph.Data = {
              36080000424D360800000000000036000000280000002A000000100000000100
              18000000000000080000C40E0000C40E0000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF001010
              1010101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0016161616161600FF0000FF0000FF00161616
              16161600FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00101010007F7F10101000FF0000FF001010
              10007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0016161696969616161600FF0000FF00161616
              96969616161600FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF001010
              10009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600FF00161616
              A1A1A196969616161600FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F1010101010
              1000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A1969696161616161616
              AAAAAAA1A1A196969616161600FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
              1000FFFF00CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A1969696161616
              B8B8B8AAAAAAA1A1A196969616161600FF0000FF0000FF000000002F2F101010
              10101010101010101010101010101010101000FFFF00FFFF00CFCF009090007F
              7F10101000FFFF00CFCF009090007F7F10101000FF0000FF0016161616161616
              1616161616161616161616161616161616B8B8B8B8B8B8AAAAAAA1A1A1969696
              161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF000000002F2F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
              90007F7F10101000FFFF00CFCF009090007F7F10101000FF0000333396969696
              9696969696969696969696969696969696C1C1C1B8B8B8B8B8B8AAAAAAA1A1A1
              969696161616B8B8B8AAAAAAA1A1A196969616161600FF000000002F2F60FFFF
              60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF2FFFFF00FFFF00FFFF00CF
              CF009090007F7F10101000FFFF00CFCF009090007F7F101010003333CACACACA
              CACACACACACACACACACACACACACACACACACACACAC1C1C1B8B8B8B8B8B8AAAAAA
              A1A1A1969696161616B8B8B8AAAAAAA1A1A19696961616160000002F2F90FFFF
              EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
              FF00CFCF007F7F002F2FEFF0FF00FFFF00CFCF007F7F002F2F003333B8B8B8B8
              B8B8E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B8B8B8
              AAAAAA969696003333E3E3E3B8B8B8AAAAAA9696960033330000002F2FCFFFFF
              CFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFEFF0FF2FFFFF00FF
              FF007F7F002F2FEFF0FF2FFFFF00FFFF007F7F002F2F00FF00003333DADADADA
              DADADADADADADADADADADADADADADADADADADADADADADAE3E3E3C1C1C1B8B8B8
              969696003333E3E3E3C1C1C1B8B8B896969600333300FF000000002F2F002F2F
              002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
              7F002F2FEFF0FFCFFFFF2FFFFF007F7F002F2F00FF0000FF0000333300333300
              3333003333003333003333003333003333DADADAF1F1F1DADADAC1C1C1969696
              003333F1F1F1DADADAC1C1C196969600333300FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F002F
              2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADADADADADADADA969696003333
              DADADADADADADADADA96969600333300FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F002F
              2FCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADADADADA969696003333003333
              DADADADADADA96969600333300FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF00002F
              2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADA96969600333300FF00003333
              DADADA96969600333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF00002F
              2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000333396969600333300FF0000FF00003333
              96969600333300FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000FF0000FF00002F
              2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000333300333300FF0000FF0000FF00003333
              00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPCPTomarDatosClick
          end
          object btnPCPAceptar: TButton
            Left = 359
            Top = 239
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 12
            OnClick = btnPCPAceptarClick
          end
          object btnPCPCancelar: TButton
            Left = 437
            Top = 239
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 13
          end
          object edCP_NOMBRE: TEdit
            Left = 80
            Top = 37
            Width = 429
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 50
            TabOrder = 2
          end
          object edCP_CALLE: TEdit
            Left = 80
            Top = 65
            Width = 429
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 3
          end
          object edCP_NUMERO: TEdit
            Left = 80
            Top = 93
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 4
          end
          object edCP_PISO: TEdit
            Left = 206
            Top = 93
            Width = 46
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 5
            TabOrder = 5
          end
          object edCP_DEPARTAMENTO: TEdit
            Left = 324
            Top = 93
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 6
          end
          object edCP_LOCALIDAD: TEdit
            Left = 80
            Top = 120
            Width = 429
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 7
          end
          object edCP_PARTIDO: TEdit
            Left = 80
            Top = 147
            Width = 429
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 8
          end
          object cmbCP_PROVINCIA: TExComboBox
            Left = 80
            Top = 175
            Width = 201
            Height = 22
            Style = csOwnerDrawFixed
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 16
            TabOrder = 9
            ItemIndex = -1
            Options = [coShowValues, coGridLines]
            ValueWidth = 64
          end
          object edCP_CPOSTALA: TPatternEdit
            Left = 408
            Top = 176
            Width = 101
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 8
            TabOrder = 10
            Pattern = 'ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789'
          end
          object edCP_CUIT: TMaskEdit
            Left = 81
            Top = 9
            Width = 81
            Height = 21
            EditMask = '99-99999999-c;0;'
            MaxLength = 13
            TabOrder = 0
            OnKeyPress = edCP_CUITKeyPress
          end
          object edCP_TELEFONO: TEdit
            Left = 80
            Top = 204
            Width = 429
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 25
            TabOrder = 11
          end
          object cmbCP_INDICADOR: TComboBox
            Left = 230
            Top = 9
            Width = 105
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'Comprador'
              'Proveedor')
          end
        end
        object fpPCD_CANCERPRODUCTOS: TFormPanel
          Left = 109
          Top = 12
          Width = 456
          Height = 100
          Caption = 'Productos Cancer'#237'genos'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          Constraints.MaxHeight = 100
          Constraints.MinHeight = 100
          Constraints.MinWidth = 163
          DesignSize = (
            456
            100)
          object Bevel7: TBevel
            Left = 4
            Top = 64
            Width = 448
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label44: TLabel
            Left = 12
            Top = 12
            Width = 80
            Height = 13
            Caption = 'Nombre Qu'#237'mico'
          end
          object Label45: TLabel
            Left = 12
            Top = 40
            Width = 86
            Height = 13
            Caption = 'Nombre Comercial'
          end
          object bntPCDAceptar: TButton
            Left = 298
            Top = 70
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 2
            OnClick = bntPCDAceptarClick
          end
          object bntPCDCancelar: TButton
            Left = 376
            Top = 70
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 3
          end
          object edCD_NOMBRE_QUIMICO: TEdit
            Left = 108
            Top = 8
            Width = 340
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 250
            TabOrder = 0
          end
          object edCD_NOMBRE_COMERCIAL: TEdit
            Left = 108
            Top = 36
            Width = 340
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 250
            TabOrder = 1
          end
        end
      end
      object tsSustanciasSector: TTabSheet
        Caption = 'S&ustancias por Sector'
        ImageIndex = 5
        object Splitter4: TSplitter
          Left = 0
          Top = 161
          Width = 576
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object CoolBar8: TCoolBar
          Left = 0
          Top = 0
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar8
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar8: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCXNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCXNuevoClick
            end
            object tbPCXModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCXModificarClick
            end
            object tbPCXEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCXEliminarClick
            end
            object Label80: TLabel
              Left = 69
              Top = 0
              Width = 35
              Height = 14
              Caption = ' (40)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCX_CANCERSUSTTRAB: TArtDBGrid
          Left = 0
          Top = 29
          Width = 576
          Height = 132
          Align = alTop
          Constraints.MinHeight = 60
          DataSource = dsPCX_CANCERSUSTTRAB
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCX_CANCERSUSTTRABDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCX_CANCERSUSTTRABGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'RG_DESCRIPCION'
              Title.Caption = 'Sustancia'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CX_IDSECTOR'
              Title.Caption = 'Sector'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CX_TRAB_PERMANENTE'
              Title.Caption = 'Trab.Permanente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CX_TRAB_NOPERMANENTE1'
              Title.Caption = 'Trab.no Perm Cancer'#237'genos'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CX_TRAB_NOPERMANENTE2'
              Title.Caption = 'Trab.no Perm No cancer'#237'genos'
              Width = 89
              Visible = True
            end>
        end
        object CoolBar9: TCoolBar
          Left = 0
          Top = 164
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar9
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar9: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCUNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCUNuevoClick
            end
            object tbPCUModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCUModificarClick
            end
            object tbPCUEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCUEliminarClick
            end
            object Label81: TLabel
              Left = 69
              Top = 0
              Width = 35
              Height = 14
              Caption = ' (40)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCU_CANCERUSOSUSTANCIAS: TArtDBGrid
          Left = 0
          Top = 193
          Width = 576
          Height = 200
          Align = alClient
          Constraints.MinHeight = 60
          DataSource = dsPCU_CANCERUSOSUSTANCIAS
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCU_CANCERUSOSUSTANCIASDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCU_CANCERUSOSUSTANCIASGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_NOMBRE_QUIMICO'
              Title.Caption = 'Nombre Qu'#237'mico'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_NOMBRE_COMERCIAL'
              Title.Caption = 'Nombre Comercial'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CU_USOS'
              Title.Caption = 'Usos'
              Width = 100
              Visible = True
            end>
        end
        object fpPCX_CANCERSUSTTRAB: TFormPanel
          Left = 108
          Top = 39
          Width = 461
          Height = 193
          Caption = 'Trabajadores por Sector'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          OnBeforeShow = fpPCX_CANCERSUSTTRABBeforeShow
          Constraints.MinHeight = 73
          Constraints.MinWidth = 163
          DesignSize = (
            461
            193)
          object Bevel12: TBevel
            Left = 4
            Top = 157
            Width = 453
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label52: TLabel
            Left = 8
            Top = 13
            Width = 47
            Height = 13
            Caption = 'Sustancia'
          end
          object Label53: TLabel
            Left = 8
            Top = 40
            Width = 31
            Height = 13
            Caption = 'Sector'
          end
          object Bevel13: TBevel
            Left = 4
            Top = 64
            Width = 453
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object lbCX_TRAB_PERMANENTE: TLabel
            Left = 8
            Top = 76
            Width = 182
            Height = 13
            Caption = 'Cantidad de trabajadores permanentes'
          end
          object lbCX_TRAB_NOPERMANENTE1: TLabel
            Left = 8
            Top = 96
            Width = 306
            Height = 26
            Caption = 
              'Cantidad de trabajadores que alternen tareas entre sectores que ' +
              'utilizan sustancias o agentes con otros sectores que no utilizan'
            WordWrap = True
          end
          object lbCX_TRAB_NOPERMANENTE2: TLabel
            Left = 8
            Top = 128
            Width = 280
            Height = 26
            Caption = 
              'Cantidad de trabajadores que realizan tareas en m'#225's de un sector' +
              ' que utilizan sustancias o agentes'
            WordWrap = True
          end
          object btnPCXAceptar: TButton
            Left = 303
            Top = 163
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 5
            OnClick = btnPCXAceptarClick
          end
          object btnPCXCancelar: TButton
            Left = 381
            Top = 163
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 6
          end
          object dbcCX_IDCANCERSUSTANCIA: TDBIncComboGrid
            Left = 72
            Top = 8
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 0
            KeyField = 'CS_CODIGO'
            ListField = 'RG_DESCRIPCION'
            ListSource = dsPCS_CANCERSUSTANCIA
            Columns = <
              item
                Expanded = False
                FieldName = 'CS_CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RG_DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 330
                Visible = True
              end>
          end
          object edCX_IDSECTOR: TEdit
            Left = 72
            Top = 36
            Width = 381
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 1
          end
          object edCX_TRAB_PERMANENTE: TIntEdit
            Left = 332
            Top = 72
            Width = 121
            Height = 21
            TabOrder = 2
            Alignment = taRightJustify
            MaxLength = 6
          end
          object edCX_TRAB_NOPERMANENTE1: TIntEdit
            Left = 332
            Top = 100
            Width = 121
            Height = 21
            TabOrder = 3
            Alignment = taRightJustify
            MaxLength = 6
          end
          object edCX_TRAB_NOPERMANENTE2: TIntEdit
            Left = 332
            Top = 128
            Width = 121
            Height = 21
            TabOrder = 4
            Alignment = taRightJustify
            MaxLength = 6
          end
        end
        object fpPCU_CANCERUSOSUSTANCIAS: TFormPanel
          Left = 192
          Top = 100
          Width = 457
          Height = 295
          Caption = 'Sustancias Utilizadas en Productos'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          OnBeforeShow = fpPCU_CANCERUSOSUSTANCIASBeforeShow
          Constraints.MinHeight = 295
          Constraints.MinWidth = 163
          DesignSize = (
            457
            295)
          object Bevel14: TBevel
            Left = 4
            Top = 259
            Width = 449
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label43: TLabel
            Left = 8
            Top = 12
            Width = 43
            Height = 13
            Caption = 'Producto'
          end
          object Bevel15: TBevel
            Left = 4
            Top = 35
            Width = 449
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label54: TLabel
            Left = 8
            Top = 48
            Width = 24
            Height = 13
            Caption = 'Usos'
          end
          object Label55: TLabel
            Left = 8
            Top = 134
            Width = 49
            Height = 29
            AutoSize = False
            Caption = 'Modos de Empleo'
            WordWrap = True
          end
          object Label56: TLabel
            Left = 8
            Top = 236
            Width = 42
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Cantidad'
          end
          object btnPCUAceptar: TButton
            Left = 299
            Top = 265
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 6
            OnClick = btnPCUAceptarClick
          end
          object btnPCUCancelar: TButton
            Left = 377
            Top = 265
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 7
          end
          object dbcCU_IDPRODUCTO: TDBIncComboGrid
            Left = 60
            Top = 8
            Width = 391
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            TabOrder = 0
            KeyField = 'CD_CODIGO'
            ListField = 'CD_NOMBRE_QUIMICO'
            ListSource = dsPCD_CANCERPRODUCTOS
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_NOMBRE_COMERCIAL'
                Title.Caption = 'Nombre Comercial'
                Width = 330
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_NOMBRE_QUIMICO'
                Title.Caption = 'Nombre Qu'#237'mico'
                Width = 330
                Visible = True
              end>
          end
          object cgCU_MODOS_USO: TCheckGroup
            Left = 60
            Top = 68
            Width = 389
            Height = 57
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Modos de Uso'
            TabOrder = 2
            Columns = 2
            Items.Strings = (
              'Materia Prima'
              'Producto Final'
              'Almacenamiento'
              'Otros')
            TrueChar = 'S'
            FalseChar = 'N'
            Value = 'NNNN'
          end
          object edCU_OTROS_MODOS_EMPLEO: TMemo
            Left = 60
            Top = 132
            Width = 390
            Height = 94
            Anchors = [akLeft, akTop, akRight, akBottom]
            MaxLength = 500
            TabOrder = 3
          end
          object edCU_CANTIDAD: TIntEdit
            Left = 60
            Top = 232
            Width = 43
            Height = 21
            Anchors = [akLeft, akBottom]
            TabOrder = 4
            MaxLength = 6
          end
          object cmbCU_UNIDAD: TComboBox
            Left = 105
            Top = 232
            Width = 181
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akBottom]
            ItemHeight = 13
            TabOrder = 5
            Items.Strings = (
              'Gramos'
              'Kilogramos'
              'Toneladas'
              'Litros'
              'Centr'#237'metros C'#250'bicos'
              'Metros C'#250'bicos')
          end
          object edCU_USOS: TEdit
            Left = 60
            Top = 44
            Width = 390
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 200
            TabOrder = 1
          end
        end
      end
      object tsTrabajadores: TTabSheet
        Caption = '&Trabajadores'
        ImageIndex = 2
        object Splitter1: TSplitter
          Left = 0
          Top = 201
          Width = 576
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object CoolBar2: TCoolBar
          Left = 0
          Top = 0
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar2
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar2: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCTNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCTNuevoClick
            end
            object tbPCTModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbPCTModificar'
              ImageIndex = 7
              OnClick = tbPCTModificarClick
            end
            object tbPCTEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCTEliminarClick
            end
            object Label74: TLabel
              Left = 69
              Top = 0
              Width = 35
              Height = 14
              Caption = ' (42)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCT_CANCERTRABAJADOR: TArtDBGrid
          Left = 0
          Top = 29
          Width = 576
          Height = 172
          Align = alTop
          Constraints.MinHeight = 60
          DataSource = dsPCT_CANCERTRABAJADOR
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCT_CANCERTRABAJADORDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCT_CANCERTRABAJADORGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CT_CUIL'
              Title.Caption = 'CUIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_NOMBRE'
              Title.Caption = 'Apellido y Nombre'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_EDAD'
              Title.Caption = 'Edad'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_ANTIGUEDAD'
              Title.Caption = 'Empr.Ant.'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_UNIDAD'
              Title.Caption = 'Empr.Unidad'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_CATEGORIA'
              Title.Caption = 'Categor'#237'a'
              Width = 157
              Visible = True
            end>
        end
        object CoolBar3: TCoolBar
          Left = 0
          Top = 204
          Width = 576
          Height = 29
          Bands = <
            item
              Control = ToolBar3
              ImageIndex = -1
              MinHeight = 27
              Width = 572
            end>
          object ToolBar3: TToolBar
            Left = 9
            Top = 0
            Width = 559
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbPCONuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPCONuevoClick
            end
            object tbPCOModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbTrabModificar'
              ImageIndex = 7
              OnClick = tbPCOModificarClick
            end
            object tbPCOEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbPCOEliminarClick
            end
            object Label75: TLabel
              Left = 69
              Top = 0
              Width = 56
              Height = 14
              Caption = ' (41/42)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
        object dbgPCO_CANCERSECTORTRAB: TArtDBGrid
          Left = 0
          Top = 233
          Width = 576
          Height = 160
          Align = alClient
          Constraints.MinHeight = 60
          DataSource = dsPCO_CANCERSECTORTRAB
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPCO_CANCERSECTORTRABDblClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPCO_CANCERSECTORTRABGetCellParams
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CO_NOMBRE'
              Title.Caption = 'Sector'
              Width = 346
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_ANTIGUEDAD'
              Title.Caption = 'Antig'#252'edad'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_UNIDAD'
              Title.Caption = 'Unidad'
              Width = 40
              Visible = True
            end>
        end
        object fpPCO_CANCERSECTORTRAB: TFormPanel
          Left = 46
          Top = 276
          Width = 453
          Height = 98
          Caption = 'Sector'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          OnShow = fpTrabajadoresShow
          Constraints.MaxHeight = 98
          Constraints.MinHeight = 98
          Constraints.MinWidth = 274
          DesignSize = (
            453
            98)
          object Bevel2: TBevel
            Left = 4
            Top = 62
            Width = 445
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label28: TLabel
            Left = 8
            Top = 38
            Width = 57
            Height = 13
            Caption = 'Antig'#252'edad '
          end
          object Label29: TLabel
            Left = 8
            Top = 12
            Width = 37
            Height = 13
            Caption = 'Nombre'
          end
          object btnSecTrabAceptar: TButton
            Left = 291
            Top = 68
            Width = 78
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 3
            OnClick = btnSecTrabAceptarClick
          end
          object btnSecTrabCancelar: TButton
            Left = 373
            Top = 68
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 4
          end
          object edCO_ANTIGUEDAD: TIntEdit
            Left = 75
            Top = 34
            Width = 56
            Height = 21
            TabOrder = 1
            Alignment = taRightJustify
            MaxLength = 3
          end
          object cmbCO_UNIDAD: TComboBox
            Left = 132
            Top = 34
            Width = 137
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'D'#237'as'
              'Meses'
              'A'#241'os')
          end
          object edCO_NOMBRE: TDBLookupComboBox
            Left = 75
            Top = 8
            Width = 372
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            KeyField = 'CX_IDSECTOR'
            ListField = 'CX_IDSECTOR'
            ListSource = dsSectoresDisponibles
            TabOrder = 0
          end
        end
        object fpTrabajadores: TFormPanel
          Left = 46
          Top = 36
          Width = 479
          Height = 237
          Caption = 'Trabajadores'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu, biMaximize]
          Position = poOwnerFormCenter
          OnShow = fpTrabajadoresShow
          Constraints.MaxHeight = 237
          Constraints.MinHeight = 237
          Constraints.MinWidth = 400
          DesignSize = (
            479
            237)
          object Bevel1: TBevel
            Left = 4
            Top = 139
            Width = 471
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object lbTrabCUIL: TLabel
            Left = 9
            Top = 12
            Width = 99
            Height = 13
            AutoSize = False
            Caption = 'CUIL / DNI'
          end
          object Label8: TLabel
            Left = 9
            Top = 64
            Width = 99
            Height = 13
            AutoSize = False
            Caption = 'Tipo de Documento'
          end
          object Label25: TLabel
            Left = 9
            Top = 38
            Width = 99
            Height = 13
            AutoSize = False
            Caption = 'Apellido y Nombre'
          end
          object Label26: TLabel
            Left = 385
            Top = 64
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Edad'
          end
          object Label27: TLabel
            Left = 9
            Top = 90
            Width = 100
            Height = 13
            AutoSize = False
            Caption = 'Antig'#252'edad '
          end
          object Label30: TLabel
            Left = 9
            Top = 116
            Width = 47
            Height = 13
            Caption = 'Categor'#237'a'
          end
          object Label82: TLabel
            Left = 8
            Top = 151
            Width = 31
            Height = 13
            Caption = 'Sector'
          end
          object Label83: TLabel
            Left = 8
            Top = 177
            Width = 57
            Height = 13
            Caption = 'Antig'#252'edad '
          end
          object Bevel16: TBevel
            Left = 4
            Top = 201
            Width = 445
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object btnPCTTomarDatos: TSpeedButton
            Left = 195
            Top = 8
            Width = 24
            Height = 22
            Hint = 'Traer los valores de los datos de la Base de Datos'
            Flat = True
            Glyph.Data = {
              36080000424D360800000000000036000000280000002A000000100000000100
              18000000000000080000C40E0000C40E0000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF001010
              1010101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0016161616161600FF0000FF0000FF00161616
              16161600FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00101010007F7F10101000FF0000FF001010
              10007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0016161696969616161600FF0000FF00161616
              96969616161600FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF001010
              10009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600FF00161616
              A1A1A196969616161600FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F1010101010
              1000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A1969696161616161616
              AAAAAAA1A1A196969616161600FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
              1000FFFF00CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A1969696161616
              B8B8B8AAAAAAA1A1A196969616161600FF0000FF0000FF000000002F2F101010
              10101010101010101010101010101010101000FFFF00FFFF00CFCF009090007F
              7F10101000FFFF00CFCF009090007F7F10101000FF0000FF0016161616161616
              1616161616161616161616161616161616B8B8B8B8B8B8AAAAAAA1A1A1969696
              161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF000000002F2F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
              90007F7F10101000FFFF00CFCF009090007F7F10101000FF0000333396969696
              9696969696969696969696969696969696C1C1C1B8B8B8B8B8B8AAAAAAA1A1A1
              969696161616B8B8B8AAAAAAA1A1A196969616161600FF000000002F2F60FFFF
              60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF2FFFFF00FFFF00FFFF00CF
              CF009090007F7F10101000FFFF00CFCF009090007F7F101010003333CACACACA
              CACACACACACACACACACACACACACACACACACACACAC1C1C1B8B8B8B8B8B8AAAAAA
              A1A1A1969696161616B8B8B8AAAAAAA1A1A19696961616160000002F2F90FFFF
              EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
              FF00CFCF007F7F002F2FEFF0FF00FFFF00CFCF007F7F002F2F003333B8B8B8B8
              B8B8E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B8B8B8
              AAAAAA969696003333E3E3E3B8B8B8AAAAAA9696960033330000002F2FCFFFFF
              CFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFEFF0FF2FFFFF00FF
              FF007F7F002F2FEFF0FF2FFFFF00FFFF007F7F002F2F00FF00003333DADADADA
              DADADADADADADADADADADADADADADADADADADADADADADAE3E3E3C1C1C1B8B8B8
              969696003333E3E3E3C1C1C1B8B8B896969600333300FF000000002F2F002F2F
              002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
              7F002F2FEFF0FFCFFFFF2FFFFF007F7F002F2F00FF0000FF0000333300333300
              3333003333003333003333003333003333DADADAF1F1F1DADADAC1C1C1969696
              003333F1F1F1DADADAC1C1C196969600333300FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F002F
              2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADADADADADADADA969696003333
              DADADADADADADADADA96969600333300FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F002F
              2FCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADADADADA969696003333003333
              DADADADADADA96969600333300FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF00002F
              2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00003333DADADA96969600333300FF00003333
              DADADA96969600333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF00002F
              2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000333396969600333300FF0000FF00003333
              96969600333300FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000FF0000FF00002F
              2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000333300333300FF0000FF0000FF00003333
              00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPCTTomarDatosClick
          end
          object btnTrabAceptar: TButton
            Left = 321
            Top = 207
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 10
            OnClick = btnTrabAceptarClick
          end
          object btnTrabCancelar: TButton
            Left = 399
            Top = 207
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 11
          end
          object edCT_CUIL: TMaskEdit
            Left = 111
            Top = 8
            Width = 81
            Height = 21
            EditMask = '99-########-c;0; '
            MaxLength = 13
            TabOrder = 0
            OnKeyPress = edCT_CUILKeyPress
          end
          inline fraCT_DOCUMENTOTIPO: TfraStaticCTB_TABLAS
            Left = 110
            Top = 59
            Width = 271
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            inherited edCodigo: TPatternEdit
              Top = 0
              Width = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 58
              Top = 0
              Width = 213
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
          object edCT_NOMBRE: TEdit
            Left = 111
            Top = 34
            Width = 362
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 50
            TabOrder = 1
          end
          object edCT_EDAD: TIntEdit
            Left = 417
            Top = 59
            Width = 56
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 3
            MaxLength = 2
          end
          object edCT_ANTIGUEDAD: TIntEdit
            Left = 111
            Top = 86
            Width = 56
            Height = 21
            TabOrder = 4
            Alignment = taRightJustify
            MaxLength = 3
          end
          object cmbCT_UNIDAD: TComboBox
            Left = 168
            Top = 86
            Width = 137
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 5
            Items.Strings = (
              'D'#237'as'
              'Meses'
              'A'#241'os')
          end
          object edCT_CATEGORIA: TEdit
            Left = 111
            Top = 112
            Width = 363
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 20
            TabOrder = 6
          end
          object edAutoCO_ANTIGUEDAD: TIntEdit
            Left = 112
            Top = 173
            Width = 56
            Height = 21
            TabOrder = 8
            Alignment = taRightJustify
            MaxLength = 3
          end
          object cmbAutoCO_UNIDAD: TComboBox
            Left = 169
            Top = 173
            Width = 137
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 9
            Items.Strings = (
              'D'#237'as'
              'Meses'
              'A'#241'os')
          end
          object edAutoCO_NOMBRE: TDBLookupComboBox
            Left = 112
            Top = 147
            Width = 335
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            KeyField = 'CX_IDSECTOR'
            ListField = 'CX_IDSECTOR'
            ListSource = dsSectoresDisponibles
            TabOrder = 7
          end
        end
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 431
    Top = 458
  end
  inherited btnCancelar: TButton
    Left = 509
    Top = 458
  end
  inherited btnAplicar: TButton
    Left = 352
    Top = 458
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16461
      end
      item
        Key = 16430
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
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 528
    Top = 4
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 472
    Top = 4
  end
  inherited FormStorage: TFormStorage
    Left = 500
    Top = 4
  end
  inherited sdqConsulta: TSDQuery
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    SQL.Strings = (
      ' SELECT'
      '    CI_ID,'
      '    CI_FECHA,'
      '    CI_RESP_CUILCUIT,'
      '    CI_RESP_NOMBRE,'
      '    CI_RESP_TIPODOCUMENTO,'
      '    CI_REPRESENTACION,'
      '    CI_PERS_TOTAL,'
      '    CI_PERS_ADMINISTRACION,'
      '    CI_PERS_PRODUCCION,'
      '    CI_FECHABAJA,'
      '    CI_FECHAEXPORT,'
      '    CI_USUEXPORT,'
      '    CI_USUALTA USUARIO'
      ' FROM HYS.PCI_CANCERIGENOINFORME'
      'WHERE CI_ID = :CI_ID'
      ' ')
    UpdateObject = sduConsulta
    Left = 472
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 500
    Top = 32
  end
  object sdqEmpresa: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT MP_CUIT, '
      '               MP_NOMBRE, '
      '               MP_CONTRATO, '
      '               AFILIACION.CHECK_COBERTURA(MP_CUIT) ESTADO'
      'FROM CMP_EMPRESAS'
      'WHERE 0=1')
    Left = 160
  end
  object dsEmpresa: TDataSource
    Left = 188
  end
  object sduConsulta: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCI_CANCERIGENOINFORME'
      '   SET CI_FECHA = :CI_FECHA,'
      '       CI_RESP_CUILCUIT = :CI_RESP_CUILCUIT,'
      '       CI_RESP_NOMBRE = :CI_RESP_NOMBRE,'
      '       CI_RESP_TIPODOCUMENTO = :CI_RESP_TIPODOCUMENTO,'
      '       CI_REPRESENTACION = :CI_REPRESENTACION,'
      '       CI_PERS_TOTAL = :CI_PERS_TOTAL,'
      '       CI_PERS_ADMINISTRACION = :CI_PERS_ADMINISTRACION,'
      '       CI_PERS_PRODUCCION = :CI_PERS_PRODUCCION,'
      '       CI_FECHAMODIF = SYSDATE,'
      '       CI_USUMODIF = :USUARIO,'
      '       CI_FECHABAJA = NULL,'
      '       CI_USUBAJA = NULL'
      ' WHERE CI_ID = :CI_ID')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCI_CANCERIGENOINFORME'
      
        '(CI_ID, CI_FECHA, CI_RESP_CUILCUIT, CI_RESP_NOMBRE, CI_RESP_TIPO' +
        'DOCUMENTO,'
      ' CI_REPRESENTACION, CI_PERS_TOTAL, CI_PERS_ADMINISTRACION,'
      ' CI_PERS_PRODUCCION, CI_FECHAALTA, CI_USUALTA)'
      'VALUES'
      
        '(:CI_ID, :CI_FECHA, :CI_RESP_CUILCUIT, :CI_RESP_NOMBRE, :CI_RESP' +
        '_TIPODOCUMENTO,'
      ' :CI_REPRESENTACION, :CI_PERS_TOTAL, :CI_PERS_ADMINISTRACION,'
      ' :CI_PERS_PRODUCCION, SYSDATE, :USUARIO)'
      ' ')
    DeleteSQL.Strings = (
      'UPDATE HYS.PCI_CANCERIGENOINFORME'
      'SET CI_USUBAJA = :USUARIO,'
      '    CI_FECHABAJA = SYSDATE'
      'WHERE CI_ID = :CI_ID'
      '')
    Left = 528
    Top = 32
  end
  object sdqPCE_CANCERESTABLECI: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    SQL.Strings = (
      
        'SELECT CE_IDCANCERIGENOINFORME, CE_CUIT, EM_NOMBRE, CE_NUMEROEST' +
        'ABLECI, CE_NOMBRE,'
      
        '       CE_CALLE, CE_NUMERO, CE_PISO, CE_DEPARTAMENTO, CE_LOCALID' +
        'AD, CE_PARTIDO,'
      '       CE_PROVINCIA, CE_CPOSTALA, CE_CIIU, CE_CIIU_SECUNDARIO,'
      '       CE_FECHABAJA, CE_USUBAJA, CE_USUALTA USUARIO'
      '  FROM HYS.PCE_CANCERESTABLECI, AEM_EMPRESA'
      ' WHERE CE_CUIT = EM_CUIT (+)'
      '   AND CE_IDCANCERIGENOINFORME = :CI_ID'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = sduPCE_CANCERESTABLECI
    Left = 472
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCE_CANCERESTABLECI: TDataSource
    DataSet = sdqPCE_CANCERESTABLECI
    Left = 500
    Top = 60
  end
  object sduPCE_CANCERESTABLECI: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCE_CANCERESTABLECI'
      '   SET CE_CUIT = :CE_CUIT,'
      '       CE_NUMEROESTABLECI = :CE_NUMEROESTABLECI,'
      '       CE_NOMBRE = :CE_NOMBRE,'
      '       CE_CALLE = :CE_CALLE,'
      '       CE_NUMERO = :CE_NUMERO,'
      '       CE_PISO = :CE_PISO,'
      '       CE_DEPARTAMENTO = :CE_DEPARTAMENTO,'
      '       CE_LOCALIDAD = :CE_LOCALIDAD,'
      '       CE_PARTIDO = :CE_PARTIDO,'
      '       CE_PROVINCIA = :CE_PROVINCIA,'
      '       CE_CPOSTALA = :CE_CPOSTALA,'
      '       CE_CIIU = :CE_CIIU,'
      '       CE_CIIU_SECUNDARIO = :CE_CIIU_SECUNDARIO,'
      '       CE_FECHAMODIF = SYSDATE,'
      '       CE_USUMODIF = :USUARIO,'
      '       CE_FECHABAJA = :CE_FECHABAJA,'
      '       CE_USUBAJA = :CE_USUBAJA'
      ' WHERE CE_IDCANCERIGENOINFORME = :OLD_CE_IDCANCERIGENOINFORME'
      '   AND CE_CUIT = :OLD_CE_CUIT'
      '   AND CE_NUMEROESTABLECI = :OLD_CE_NUMEROESTABLECI'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCE_CANCERESTABLECI'
      
        '(CE_IDCANCERIGENOINFORME, CE_CUIT, CE_NUMEROESTABLECI, CE_NOMBRE' +
        ', CE_CALLE, CE_NUMERO, CE_PISO, CE_DEPARTAMENTO,'
      
        ' CE_LOCALIDAD, CE_PARTIDO, CE_PROVINCIA, CE_CPOSTALA, CE_CIIU, C' +
        'E_CIIU_SECUNDARIO, CE_FECHAALTA, CE_USUALTA)'
      'VALUES'
      
        '(:CE_IDCANCERIGENOINFORME, :CE_CUIT, :CE_NUMEROESTABLECI, :CE_NO' +
        'MBRE, :CE_CALLE, :CE_NUMERO, :CE_PISO, :CE_DEPARTAMENTO,'
      
        ' :CE_LOCALIDAD, :CE_PARTIDO, :CE_PROVINCIA, :CE_CPOSTALA, :CE_CI' +
        'IU, :CE_CIIU_SECUNDARIO, SYSDATE, :USUARIO)'
      ' '
      ' ')
    Left = 528
    Top = 60
  end
  object sdqPCT_CANCERTRABAJADOR: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    AfterScroll = sdqPCT_CANCERTRABAJADORAfterScroll
    SQL.Strings = (
      
        'SELECT CT_IDCANCERIGENOINFORME, CT_CUIL, CT_DOCUMENTOTIPO, CT_NO' +
        'MBRE, CT_EDAD, CT_ANTIGUEDAD,'
      
        '       CT_UNIDAD, CT_CATEGORIA, CT_USUALTA USUARIO, CT_FECHABAJA' +
        ', CT_USUBAJA'
      ' FROM HYS.PCT_CANCERTRABAJADOR'
      'WHERE CT_IDCANCERIGENOINFORME = :CI_ID'
      ' '
      ' ')
    UpdateObject = sduPCT_CANCERTRABAJADOR
    Left = 472
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCT_CANCERTRABAJADOR: TDataSource
    DataSet = sdqPCT_CANCERTRABAJADOR
    Left = 500
    Top = 88
  end
  object sduPCT_CANCERTRABAJADOR: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCT_CANCERTRABAJADOR'
      '   SET CT_DOCUMENTOTIPO = :CT_DOCUMENTOTIPO,'
      '       CT_NOMBRE = :CT_NOMBRE,'
      '       CT_EDAD = :CT_EDAD,'
      '       CT_ANTIGUEDAD = :CT_ANTIGUEDAD,'
      '       CT_UNIDAD = :CT_UNIDAD,'
      '       CT_CATEGORIA = :CT_CATEGORIA,'
      '       CT_FECHAMODIF = SYSDATE,'
      '       CT_USUMODIF = :USUARIO,'
      '       CT_FECHABAJA = :CT_FECHABAJA,'
      '       CT_USUBAJA = :CT_USUBAJA'
      ' WHERE CT_IDCANCERIGENOINFORME = :CT_IDCANCERIGENOINFORME'
      '   AND CT_CUIL = :CT_CUIL'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCT_CANCERTRABAJADOR'
      
        '(CT_IDCANCERIGENOINFORME, CT_CUIL, CT_DOCUMENTOTIPO, CT_NOMBRE, ' +
        'CT_EDAD, CT_ANTIGUEDAD, CT_UNIDAD, CT_CATEGORIA, CT_FECHAALTA, C' +
        'T_USUALTA )'
      'VALUES'
      
        '(:CT_IDCANCERIGENOINFORME, :CT_CUIL, :CT_DOCUMENTOTIPO, :CT_NOMB' +
        'RE, :CT_EDAD, :CT_ANTIGUEDAD, :CT_UNIDAD, :CT_CATEGORIA, SYSDATE' +
        ', :USUARIO)'
      ' ')
    Left = 528
    Top = 88
  end
  object sdqPCO_CANCERSECTORTRAB: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    OnFilterRecord = sdqPCO_CANCERSECTORTRABFilterRecord
    SQL.Strings = (
      
        'SELECT CO_IDCANCERIGENOINFORME, CO_CUIL, CO_NOMBRE, CO_ANTIGUEDA' +
        'D, CO_UNIDAD,'
      '       CO_USUALTA USUARIO, CO_FECHABAJA, CO_USUBAJA'
      'FROM HYS.PCO_CANCERSECTORTRAB'
      'WHERE CO_IDCANCERIGENOINFORME = :CI_ID'
      ''
      ' ')
    UpdateObject = sduPCO_CANCERSECTORTRAB
    Left = 472
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCO_CANCERSECTORTRAB: TDataSource
    DataSet = sdqPCO_CANCERSECTORTRAB
    Left = 500
    Top = 116
  end
  object sduPCO_CANCERSECTORTRAB: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCO_CANCERSECTORTRAB'
      '   SET CO_ANTIGUEDAD = :CO_ANTIGUEDAD,'
      '       CO_UNIDAD = :CO_UNIDAD,'
      '       CO_FECHAMODIF = SYSDATE,'
      '       CO_USUMODIF = :USUARIO,'
      '       CO_FECHABAJA = :CO_FECHABAJA,'
      '       CO_USUBAJA = :CO_USUBAJA'
      ' WHERE CO_IDCANCERIGENOINFORME = :CO_IDCANCERIGENOINFORME'
      '   AND CO_CUIL = :CO_CUIL'
      '   AND CO_NOMBRE = :CO_NOMBRE'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCO_CANCERSECTORTRAB'
      
        '(CO_IDCANCERIGENOINFORME, CO_CUIL, CO_NOMBRE, CO_ANTIGUEDAD, CO_' +
        'UNIDAD, CO_FECHAALTA, CO_USUALTA)'
      'VALUES'
      
        '(:CO_IDCANCERIGENOINFORME, :CO_CUIL, :CO_NOMBRE, :CO_ANTIGUEDAD,' +
        ' :CO_UNIDAD, SYSDATE, :USUARIO)'
      ' ')
    Left = 528
    Top = 116
  end
  object sdqPCP_CANCERPROVEEDOR: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    AfterScroll = sdqPCP_CANCERPROVEEDORAfterScroll
    SQL.Strings = (
      
        'SELECT CP_IDCANCERIGENOINFORME, CP_CUIT, CP_NOMBRE, CP_CALLE, CP' +
        '_NUMERO,'
      
        '       CP_PISO, CP_DEPARTAMENTO, CP_LOCALIDAD, CP_PARTIDO, CP_PR' +
        'OVINCIA,'
      
        '       CP_CPOSTALA, CP_TELEFONO, CP_INDICADOR, CP_USUALTA USUARI' +
        'O,'
      '       CP_FECHAMODIF, CP_USUMODIF, CP_FECHABAJA, CP_USUBAJA'
      '  FROM HYS.PCP_CANCERPROVEEDOR'
      ' WHERE CP_IDCANCERIGENOINFORME = :CI_ID')
    UpdateObject = sduPCP_CANCERPROVEEDOR
    Left = 472
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCP_CANCERPROVEEDOR: TDataSource
    DataSet = sdqPCP_CANCERPROVEEDOR
    Left = 500
    Top = 144
  end
  object sduPCP_CANCERPROVEEDOR: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCP_CANCERPROVEEDOR'
      '   SET CP_IDCANCERIGENOINFORME = :CP_IDCANCERIGENOINFORME,'
      '       CP_CUIT = :CP_CUIT,'
      '       CP_NOMBRE = :CP_NOMBRE,'
      '       CP_CALLE = :CP_CALLE,'
      '       CP_NUMERO = :CP_NUMERO,'
      '       CP_PISO = :CP_PISO,'
      '       CP_DEPARTAMENTO = :CP_DEPARTAMENTO,'
      '       CP_LOCALIDAD = :CP_LOCALIDAD,'
      '       CP_PARTIDO = :CP_PARTIDO,'
      '       CP_PROVINCIA = :CP_PROVINCIA,'
      '       CP_CPOSTALA = :CP_CPOSTALA,'
      '       CP_TELEFONO = :CP_TELEFONO,'
      '       CP_INDICADOR = :CP_INDICADOR,'
      '       CP_FECHAMODIF = SYSDATE,'
      '       CP_USUMODIF = :USUARIO,'
      '       CP_FECHABAJA = :CP_FECHABAJA,'
      '       CP_USUBAJA = :CP_USUBAJA'
      ' WHERE CP_IDCANCERIGENOINFORME = :CP_IDCANCERIGENOINFORME'
      '   AND CP_CUIT = :CP_CUIT'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCP_CANCERPROVEEDOR'
      
        '(CP_IDCANCERIGENOINFORME, CP_CUIT, CP_NOMBRE, CP_CALLE, CP_NUMER' +
        'O, CP_PISO, CP_DEPARTAMENTO, CP_LOCALIDAD, CP_PARTIDO, CP_PROVIN' +
        'CIA, CP_CPOSTALA, CP_TELEFONO, CP_INDICADOR, CP_FECHAALTA, CP_US' +
        'UALTA)'
      'VALUES'
      
        '(:CP_IDCANCERIGENOINFORME, :CP_CUIT, :CP_NOMBRE, :CP_CALLE, :CP_' +
        'NUMERO, :CP_PISO, :CP_DEPARTAMENTO, :CP_LOCALIDAD, :CP_PARTIDO, ' +
        ':CP_PROVINCIA, :CP_CPOSTALA, :CP_TELEFONO, :CP_INDICADOR, SYSDAT' +
        'E, :USUARIO)'
      ''
      ' ')
    Left = 528
    Top = 144
  end
  object sdqPCD_CANCERPRODUCTOS: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    OnFilterRecord = sdqPCD_CANCERPRODUCTOSFilterRecord
    SQL.Strings = (
      'SELECT CD_IDCANCERIGENOINFORME, CD_CUIT, CD_CODIGO,'
      '       CD_NOMBRE_QUIMICO, CD_NOMBRE_COMERCIAL,'
      '       CD_USUALTA USUARIO, CD_FECHAMODIF, CD_USUMODIF,'
      '       CD_FECHABAJA, CD_USUBAJA'
      '  FROM HYS.PCD_CANCERPRODUCTOS'
      ' WHERE CD_IDCANCERIGENOINFORME = :CI_ID')
    UpdateObject = sduPCD_CANCERPRODUCTOS
    Left = 472
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCD_CANCERPRODUCTOS: TDataSource
    DataSet = sdqPCD_CANCERPRODUCTOS
    Left = 500
    Top = 172
  end
  object sduPCD_CANCERPRODUCTOS: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCD_CANCERPRODUCTOS'
      'SET CD_NOMBRE_QUIMICO = :CD_NOMBRE_QUIMICO,'
      '    CD_NOMBRE_COMERCIAL = :CD_NOMBRE_COMERCIAL,'
      '    CD_FECHAMODIF = SYSDATE,'
      '    CD_USUMODIF = :USUARIO,'
      '    CD_FECHABAJA = :CD_FECHABAJA,'
      '    CD_USUBAJA = :CD_USUBAJA'
      'WHERE CD_IDCANCERIGENOINFORME = :CD_IDCANCERIGENOINFORME'
      '  AND CD_CUIT = :CD_CUIT'
      '  AND CD_CODIGO = :CD_CODIGO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCD_CANCERPRODUCTOS'
      
        '(CD_IDCANCERIGENOINFORME, CD_CUIT, CD_CODIGO, CD_NOMBRE_QUIMICO,' +
        ' CD_NOMBRE_COMERCIAL, CD_FECHAALTA, CD_USUALTA)'
      'VALUES'
      
        '(:CD_IDCANCERIGENOINFORME, :CD_CUIT, :CD_CODIGO, :CD_NOMBRE_QUIM' +
        'ICO, :CD_NOMBRE_COMERCIAL, SYSDATE, :USUARIO)'
      ' ')
    Left = 528
    Top = 172
  end
  object sdqPCS_CANCERSUSTANCIA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    AfterScroll = sdqPCS_CANCERSUSTANCIAAfterScroll
    SQL.Strings = (
      'SELECT CS_IDCANCERIGENOINFORME, CS_CODIGO, RG_DESCRIPCION,'
      '       CS_INFORMACION, CS_CAPACITACION,'
      
        '       CS_ESTUDIOS, CS_MEDIDAS, CS_EXAMEN_PREOCUPACIONAL, CS_EXA' +
        'MEN_PERIODICO,'
      
        '       CS_EXAMEN_EGRESO, CS_USUALTA USUARIO, CS_FECHAMODIF, CS_U' +
        'SUMODIF,'
      '       CS_FECHABAJA, CS_USUBAJA'
      '  FROM HYS.PCS_CANCERSUSTANCIA, PRG_RIESGOS'
      'WHERE CS_CODIGO = RG_CODIGO'
      '  AND CS_IDCANCERIGENOINFORME = :CI_ID')
    UpdateObject = sduPCS_CANCERSUSTANCIA
    Left = 472
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCS_CANCERSUSTANCIA: TDataSource
    DataSet = sdqPCS_CANCERSUSTANCIA
    Left = 500
    Top = 200
  end
  object sduPCS_CANCERSUSTANCIA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCS_CANCERSUSTANCIA'
      '   SET CS_INFORMACION = :CS_INFORMACION,'
      '       CS_CAPACITACION = :CS_CAPACITACION,'
      '       CS_ESTUDIOS = :CS_ESTUDIOS,'
      '       CS_MEDIDAS = :CS_MEDIDAS,'
      '       CS_EXAMEN_PREOCUPACIONAL = :CS_EXAMEN_PREOCUPACIONAL,'
      '       CS_EXAMEN_PERIODICO = :CS_EXAMEN_PERIODICO,'
      '       CS_EXAMEN_EGRESO = :CS_EXAMEN_EGRESO,'
      '       CS_FECHAMODIF = SYSDATE,'
      '       CS_USUMODIF = :USUARIO,'
      '       CS_FECHABAJA = :CS_FECHABAJA,'
      '       CS_USUBAJA = :CS_USUBAJA'
      ' WHERE CS_IDCANCERIGENOINFORME = :CS_IDCANCERIGENOINFORME and'
      '       CS_CODIGO = :CS_CODIGO')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCS_CANCERSUSTANCIA'
      
        '(CS_IDCANCERIGENOINFORME, CS_CODIGO, CS_INFORMACION, CS_CAPACITA' +
        'CION, CS_ESTUDIOS, CS_MEDIDAS, CS_EXAMEN_PREOCUPACIONAL, CS_EXAM' +
        'EN_PERIODICO, CS_EXAMEN_EGRESO, CS_FECHAALTA, CS_USUALTA)'
      'VALUES'
      
        '(:CS_IDCANCERIGENOINFORME, :CS_CODIGO, :CS_INFORMACION, :CS_CAPA' +
        'CITACION, :CS_ESTUDIOS, :CS_MEDIDAS, :CS_EXAMEN_PREOCUPACIONAL, ' +
        ':CS_EXAMEN_PERIODICO, :CS_EXAMEN_EGRESO, SYSDATE, :USUARIO)'
      ' ')
    Left = 528
    Top = 200
  end
  object sdqPCC_CANCERESTUDIO: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    OnFilterRecord = sdqPCC_CANCERESTUDIOFilterRecord
    SQL.Strings = (
      'SELECT CC_IDCANCERIGENOINFORME, CC_IDCANCERSUSTANCIA,'
      
        '       CC_TIPO, DECODE(CC_TIPO, '#39'A'#39', '#39'Ambiental'#39', '#39'B'#39', '#39'Biol'#243'gic' +
        'a'#39') TIPO,'
      
        '       CC_DETERMINACIONES, CC_FRECUENCIA, DECODE(CC_FRECUENCIA, ' +
        #39'1'#39', '#39'Trimestral'#39', '#39'2'#39', '#39'Semestral'#39', '#39'3'#39', '#39'Anual'#39', '#39'4'#39', '#39'Otra'#39') ' +
        'FRECUENCIA,'
      '       CC_USUALTA USUARIO, CC_FECHABAJA, CC_USUBAJA'
      '  FROM HYS.PCC_CANCERESTUDIO'
      ' WHERE CC_IDCANCERIGENOINFORME = :CI_ID'
      ' ')
    UpdateObject = sduPCC_CANCERESTUDIO
    Left = 472
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCC_CANCERESTUDIO: TDataSource
    DataSet = sdqPCC_CANCERESTUDIO
    Left = 500
    Top = 228
  end
  object sduPCC_CANCERESTUDIO: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCC_CANCERESTUDIO'
      '   SET CC_IDCANCERIGENOINFORME = :CC_IDCANCERIGENOINFORME,'
      '       CC_IDCANCERSUSTANCIA = :CC_IDCANCERSUSTANCIA,'
      '       CC_TIPO = :CC_TIPO,'
      '       CC_DETERMINACIONES = :CC_DETERMINACIONES,'
      '       CC_FRECUENCIA = :CC_FRECUENCIA,'
      '       CC_FECHAMODIF = SYSDATE,'
      '       CC_USUMODIF = :USUARIO,'
      '       CC_FECHABAJA = :CC_FECHABAJA,'
      '       CC_USUBAJA = :CC_USUBAJA'
      ' WHERE CC_IDCANCERIGENOINFORME = :CC_IDCANCERIGENOINFORME'
      '   AND CC_IDCANCERSUSTANCIA = :CC_IDCANCERSUSTANCIA'
      '   AND CC_TIPO = :CC_TIPO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCC_CANCERESTUDIO'
      
        '(CC_IDCANCERIGENOINFORME, CC_IDCANCERSUSTANCIA, CC_TIPO, CC_DETE' +
        'RMINACIONES, CC_FRECUENCIA, CC_FECHAALTA, CC_USUALTA)'
      'VALUES'
      
        '(:CC_IDCANCERIGENOINFORME, :CC_IDCANCERSUSTANCIA, :CC_TIPO, :CC_' +
        'DETERMINACIONES, :CC_FRECUENCIA, SYSDATE, :USUARIO)'
      ' ')
    Left = 528
    Top = 228
  end
  object sdqPCX_CANCERSUSTTRAB: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    AfterScroll = sdqPCX_CANCERSUSTTRABAfterScroll
    SQL.Strings = (
      
        'SELECT CX_IDCANCERIGENOINFORME, CX_IDCANCERSUSTANCIA, RG_DESCRIP' +
        'CION, CX_IDSECTOR,'
      
        '       CX_TRAB_PERMANENTE, CX_TRAB_NOPERMANENTE1, CX_TRAB_NOPERM' +
        'ANENTE2,'
      
        '       CX_USUALTA USUARIO, CX_FECHAMODIF, CX_USUMODIF, CX_FECHAB' +
        'AJA, CX_USUBAJA'
      '  FROM HYS.PCX_CANCERSUSTTRAB, ART.PRG_RIESGOS'
      ' WHERE CX_IDCANCERSUSTANCIA = RG_CODIGO'
      '   AND CX_IDCANCERIGENOINFORME = :CI_ID')
    UpdateObject = sduPCX_CANCERSUSTTRAB
    Left = 472
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCX_CANCERSUSTTRAB: TDataSource
    DataSet = sdqPCX_CANCERSUSTTRAB
    Left = 500
    Top = 256
  end
  object sduPCX_CANCERSUSTTRAB: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCX_CANCERSUSTTRAB'
      '   SET CX_TRAB_PERMANENTE = :CX_TRAB_PERMANENTE,'
      '       CX_TRAB_NOPERMANENTE1 = :CX_TRAB_NOPERMANENTE1,'
      '       CX_TRAB_NOPERMANENTE2 = :CX_TRAB_NOPERMANENTE2,'
      '       CX_FECHAMODIF = SYSDATE,'
      '       CX_USUMODIF = :USUARIO,'
      '       CX_FECHABAJA = :CX_FECHABAJA,'
      '       CX_USUBAJA = :CX_USUBAJA'
      ' WHERE CX_IDCANCERIGENOINFORME = :CX_IDCANCERIGENOINFORME'
      '   AND CX_IDCANCERSUSTANCIA = :CX_IDCANCERSUSTANCIA'
      '   AND CX_IDSECTOR = :CX_IDSECTOR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCX_CANCERSUSTTRAB'
      
        '(CX_IDCANCERIGENOINFORME, CX_IDCANCERSUSTANCIA, CX_IDSECTOR, CX_' +
        'TRAB_PERMANENTE, CX_TRAB_NOPERMANENTE1, CX_TRAB_NOPERMANENTE2, C' +
        'X_FECHAALTA, CX_USUALTA)'
      'VALUES'
      
        '(:CX_IDCANCERIGENOINFORME, :CX_IDCANCERSUSTANCIA, :CX_IDSECTOR, ' +
        ':CX_TRAB_PERMANENTE, :CX_TRAB_NOPERMANENTE1, :CX_TRAB_NOPERMANEN' +
        'TE2, SYSDATE, :USUARIO)'
      ' ')
    Left = 528
    Top = 256
  end
  object sdqPCU_CANCERUSOSUSTANCIAS: TSDQuery
    DatabaseName = 'dbPrincipal'
    Filtered = True
    AfterOpen = sdqRelacionesAfterOpen
    AfterPost = sdqPCU_CANCERUSOSUSTANCIASAfterPost
    SQL.Strings = (
      
        'SELECT CU_IDCANCERIGENOINFORME, CU_IDCANCERSUSTANCIA, CU_IDSECTO' +
        'R, CU_IDPRODUCTO,'
      '       CD_NOMBRE_QUIMICO, CD_NOMBRE_COMERCIAL,'
      
        '       CU_USOS, CU_MODOS_USO, CU_OTROS_MODOS_EMPLEO, CU_CANTIDAD' +
        ', CU_UNIDAD,'
      
        '       DECODE(CU_UNIDAD, '#39'G'#39', '#39'Gramos'#39', '#39'K'#39', '#39'Kilogramos'#39', '#39'T'#39', ' +
        #39'Toneladas'#39', '#39'L'#39', '#39'Litros'#39', '#39'C'#39', '#39'Centr'#237'metros C'#250'bicos'#39', '#39'M'#39', '#39'M' +
        'etros C'#250'bicos'#39') UNIDAD,'
      
        '       CU_USUALTA USUARIO, CU_FECHAMODIF, CU_USUMODIF, CU_FECHAB' +
        'AJA, CU_USUBAJA'
      '  FROM HYS.PCU_CANCERUSOSUSTANCIAS, HYS.PCD_CANCERPRODUCTOS'
      ' WHERE CU_IDPRODUCTO = CD_CODIGO'
      '   AND CU_IDCANCERIGENOINFORME = :CI_ID')
    UpdateObject = sduPCU_CANCERUSOSUSTANCIAS
    Left = 472
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsPCU_CANCERUSOSUSTANCIAS: TDataSource
    DataSet = sdqPCU_CANCERUSOSUSTANCIAS
    Left = 500
    Top = 284
  end
  object sduPCU_CANCERUSOSUSTANCIAS: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PCU_CANCERUSOSUSTANCIAS'
      '   SET CU_MODOS_USO = :CU_MODOS_USO,'
      '       CU_OTROS_MODOS_EMPLEO = :CU_OTROS_MODOS_EMPLEO,'
      '       CU_UNIDAD = :CU_UNIDAD,'
      '       CU_CANTIDAD = :CU_CANTIDAD,'
      '       CU_FECHAMODIF = SYSDATE,'
      '       CU_USUMODIF = :USUARIO,'
      '       CU_FECHABAJA = :CU_FECHABAJA,'
      '       CU_USUBAJA = :CU_USUBAJA'
      ' WHERE CU_IDCANCERIGENOINFORME = :CU_IDCANCERIGENOINFORME'
      '   AND CU_IDCANCERSUSTANCIA = :CU_IDCANCERSUSTANCIA'
      '   AND CU_IDPRODUCTO = :CU_IDPRODUCTO'
      '   AND CU_IDSECTOR = :CU_IDSECTOR'
      '   AND CU_USOS = :CU_USOS'
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCU_CANCERUSOSUSTANCIAS'
      
        '(CU_IDCANCERIGENOINFORME, CU_IDCANCERSUSTANCIA, CU_IDPRODUCTO, C' +
        'U_IDSECTOR, CU_USOS, CU_MODOS_USO, CU_OTROS_MODOS_EMPLEO, CU_UNI' +
        'DAD, CU_CANTIDAD, CU_FECHAALTA, CU_USUALTA)'
      'VALUES'
      
        '(:CU_IDCANCERIGENOINFORME, :CU_IDCANCERSUSTANCIA, :CU_IDPRODUCTO' +
        ', :CU_IDSECTOR, :CU_USOS, :CU_MODOS_USO, :CU_OTROS_MODOS_EMPLEO,' +
        ' :CU_UNIDAD, :CU_CANTIDAD, SYSDATE, :USUARIO)'
      ' '
      ' ')
    Left = 528
    Top = 284
  end
  object sdqSectoresDisponibles: TSDQuery
    DatabaseName = 'dbPrincipal'
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT DISTINCT CX_IDSECTOR'
      '  FROM HYS.PCX_CANCERSUSTTRAB'
      ' WHERE CX_IDCANCERIGENOINFORME = :CI_ID')
    UniDirectional = True
    Left = 472
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CI_ID'
        ParamType = ptInput
      end>
  end
  object dsSectoresDisponibles: TDataSource
    AutoEdit = False
    DataSet = sdqSectoresDisponibles
    Left = 500
    Top = 312
  end
end
