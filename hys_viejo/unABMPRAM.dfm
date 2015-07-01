inherited frmABMPRAM: TfrmABMPRAM
  Left = 221
  Top = 128
  Width = 737
  Height = 568
  Caption = 'P.R.A.M.'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 729
    Height = 58
    Visible = True
    object Label23: TLabel
      Left = 3
      Top = 33
      Width = 74
      Height = 13
      Caption = 'Establecimiento'
    end
    inline fraEmpresaBusq: TfraEmpresa
      Left = 4
      Top = 4
      Width = 715
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
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 613
      end
      inherited edContrato: TIntEdit
        Left = 658
      end
      inherited cmbRSocial: TArtComboBox
        Width = 476
      end
    end
    inline fraEstablecimientoBusq: TfraEstablecimiento
      Left = 87
      Top = 30
      Width = 634
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 569
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 58
    Width = 729
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 725
      end>
    inherited ToolBar: TToolBar
      Width = 712
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 87
    Width = 729
    Height = 454
    Columns = <
      item
        Expanded = False
        FieldName = 'ae_notasp'
        Title.Alignment = taCenter
        Title.Caption = 'Nota SP'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ae_cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_nroestablecimiento'
        Title.Alignment = taCenter
        Title.Caption = 'Nro.Est.'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Establecimiento'
        Width = 272
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ae_fechaaccidente'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Accid.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 37
    Top = 69
    Width = 696
    Height = 484
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 448
      Width = 688
    end
    inherited btnAceptar: TButton
      Left = 457
      Top = 454
    end
    inherited btnCancelar: TButton
      Left = 616
      Top = 454
    end
    object pcDatos: TPageControl
      Left = 0
      Top = 0
      Width = 696
      Height = 445
      ActivePage = tsDatosSiniestro
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      OnChange = pcDatosChange
      object tsDatosSiniestro: TTabSheet
        Caption = 'Datos del Siniestro'
        object ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 688
          Height = 417
          HorzScrollBar.Range = 268
          VertScrollBar.Position = 1239
          VertScrollBar.Range = 1730
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          DesignSize = (
            668
            413)
          object lbPrograma: TLabel
            Left = 8
            Top = -1062
            Width = 45
            Height = 13
            Caption = 'Programa'
          end
          object Operativo: TLabel
            Left = 8
            Top = -1034
            Width = 46
            Height = 13
            Caption = 'Operativo'
          end
          object Label7: TLabel
            Left = 6
            Top = -851
            Width = 156
            Height = 13
            Caption = 'Trabajadores Accidentados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel3: TBevel
            Left = 4
            Top = -1185
            Width = 660
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object lbObservaciones: TLabel
            Left = 8
            Top = -383
            Width = 56
            Height = 13
            Caption = 'Otros Datos'
          end
          object btnTop: TSpeedButton
            Left = 640
            Top = 173
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              B6060000424DB606000000000000360000002800000022000000100000000100
              18000000000080060000C40E0000C40E0000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF00002F2F002F2F002F2F002F2F002F2F002F2F00FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016
              161600333300333300333300333300333300FF0000FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F60FFFF90FFFF
              CFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696CACACAB8B8B8DADADA00333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0010101000
              7F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00161616969696CACACAB8B8B8DADADA0033
              3300FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
              0000FF00101010007F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616969696CACACA
              E3E3E3DADADA00333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF00101010007F7F60FFFFEFF0FFCFFFFF002F2F00FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016
              1616969696CACACAE3E3E3DADADA00333300FF0000FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F60FFFFEFF0FF
              CFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696CACACAE3E3E3DADADA00333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0010101000
              7F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00161616969696CACACAE3E3E3DADADA0033
              3300FF0000FF0000FF0000FF0000FF00000000FF001010101010101010101010
              10101010101010007F7F60FFFFEFF0FFCFFFFF002F2F002F2F002F2F002F2F00
              2F2F002F2F00FF00161616161616161616161616161616161616969696CACACA
              E3E3E3DADADA003333003333003333003333003333003333000000FF00101010
              007F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFFEFF0FFCFFFFFCFFFFFCFFF
              FFCFFFFFCFFFFF007F7F002F2F00FF00161616969696A1A1A1AAAAAAB8B8B8B8
              B8B8C1C1C1CACACAE3E3E3DADADADADADADADADADADADADADADA969696003333
              000000FF0000FF00101010007F7F00909000CFCF00FFFF00FFFF2FFFFFEFF0FF
              CFFFFFEFF0FFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF001616169696
              96A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1E3E3E3DADADAF1F1F1DADADADADADA96
              969600333300FF00000000FF0000FF0000FF00101010007F7F00909000CFCF00
              FFFF00FFFFEFF0FFEFF0FFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF00
              00FF0000FF00161616969696A1A1A1AAAAAAB8B8B8B8B8B8E3E3E3E3E3E3DADA
              DADADADA96969600333300FF0000FF00000000FF0000FF0000FF0000FF001010
              10007F7F00909000CFCF00FFFFEFF0FF2FFFFF2FFFFF007F7F002F2F00FF0000
              FF0000FF0000FF0000FF0000FF0000FF00161616969696A1A1A1AAAAAAB8B8B8
              E3E3E3C1C1C1C1C1C196969600333300FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF00101010007F7F00909000CFCF00FFFF00FFFF007F7F002F
              2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016161696
              9696A1A1A1AAAAAAB8B8B8B8B8B896969600333300FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F00909000CFCF
              007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696A1A1A1AAAAAA96969600333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
              1010007F7F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0016161696969696969600333300FF
              0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF00101010002F2F00FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616
              00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
            NumGlyphs = 2
            OnClick = btnTopClick
          end
          object Label21: TLabel
            Left = 6
            Top = -1200
            Width = 94
            Height = 13
            Caption = 'Empresa afiliada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel7: TBevel
            Left = 4
            Top = -936
            Width = 660
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label22: TLabel
            Left = 9
            Top = -1173
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label24: TLabel
            Left = 9
            Top = -1091
            Width = 50
            Height = 13
            Caption = 'Tel'#233'fonos:'
          end
          object Label26: TLabel
            Left = 8
            Top = -1006
            Width = 21
            Height = 13
            Caption = 'CIIU'
          end
          object Label27: TLabel
            Left = 8
            Top = -980
            Width = 43
            Height = 13
            Caption = 'Dotaci'#243'n'
          end
          object Label41: TLabel
            Left = 8
            Top = -876
            Width = 43
            Height = 13
            Caption = 'Dotaci'#243'n'
          end
          object Label43: TLabel
            Left = 8
            Top = -526
            Width = 97
            Height = 13
            Caption = 'Lugar de Ocurrencia'
          end
          object Label44: TLabel
            Left = 317
            Top = -526
            Width = 79
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Recepc. Obra'
          end
          object Label45: TLabel
            Left = 496
            Top = -526
            Width = 67
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Inicio Activ.'
          end
          object Label48: TLabel
            Left = 8
            Top = -498
            Width = 47
            Height = 13
            Caption = 'Superficie'
          end
          object Label46: TLabel
            Left = 205
            Top = -498
            Width = 58
            Height = 13
            Caption = 'Nro. Plantas'
          end
          object Label47: TLabel
            Left = 316
            Top = -498
            Width = 62
            Height = 13
            Caption = 'Tipo de Obra'
          end
          object Label49: TLabel
            Left = 8
            Top = -470
            Width = 89
            Height = 13
            Caption = 'Activ. a Desarrollar'
          end
          object Label50: TLabel
            Left = 328
            Top = -469
            Width = 54
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Etapa Obra'
          end
          object Label51: TLabel
            Left = 181
            Top = -441
            Width = 79
            Height = 13
            Caption = 'Progr. Seguridad'
          end
          object Label52: TLabel
            Left = 8
            Top = -416
            Width = 99
            Height = 26
            Caption = 'F. Fin de la Actividad de la Obra'
            WordWrap = True
          end
          object Label53: TLabel
            Left = 208
            Top = -412
            Width = 65
            Height = 13
            Caption = 'F. Susp. Obra'
          end
          object Label54: TLabel
            Left = 378
            Top = -412
            Width = 76
            Height = 13
            Caption = 'F. Reinicio Obra'
          end
          object Label55: TLabel
            Left = 6
            Top = -305
            Width = 116
            Height = 13
            Caption = 'Datos del Accidente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel10: TBevel
            Left = 4
            Top = -288
            Width = 660
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label58: TLabel
            Left = 8
            Top = -276
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object Label60: TLabel
            Left = 8
            Top = -251
            Width = 86
            Height = 13
            Caption = 'Tareas Habituales'
          end
          object Label61: TLabel
            Left = 8
            Top = -172
            Width = 94
            Height = 26
            Caption = 'Tareas al Momento del Accidente'
            WordWrap = True
          end
          object Label62: TLabel
            Left = 8
            Top = -93
            Width = 99
            Height = 13
            Caption = 'Descr. del Accidente'
          end
          object Label63: TLabel
            Left = 8
            Top = -13
            Width = 37
            Height = 13
            Caption = 'Hechos'
          end
          object Bevel1: TBevel
            Left = 4
            Top = 167
            Width = 660
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label2: TLabel
            Left = 6
            Top = 171
            Width = 307
            Height = 13
            Caption = 'Responsable de los Datos contenidos en este Informe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 8
            Top = 198
            Width = 46
            Height = 13
            Caption = 'Preventor'
          end
          object Label66: TLabel
            Left = 6
            Top = 66
            Width = 225
            Height = 13
            Caption = 'Observaciones/Otros Datos del Informe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel11: TBevel
            Left = 4
            Top = 83
            Width = 660
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label72: TLabel
            Left = 9
            Top = -1227
            Width = 49
            Height = 13
            Caption = 'Nota S.P.:'
          end
          object Label4: TLabel
            Left = 6
            Top = -953
            Width = 246
            Height = 13
            Caption = 'Establecimiento donde ocurri'#243' el accidente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 6
            Top = -597
            Width = 116
            Height = 13
            Caption = 'Datos de ocurrencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel8: TBevel
            Left = 4
            Top = -579
            Width = 660
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object btnTop2: TSpeedButton
            Left = 640
            Top = -283
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              B6060000424DB606000000000000360000002800000022000000100000000100
              18000000000080060000C40E0000C40E0000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF00002F2F002F2F002F2F002F2F002F2F002F2F00FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016
              161600333300333300333300333300333300FF0000FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F60FFFF90FFFF
              CFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696CACACAB8B8B8DADADA00333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0010101000
              7F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00161616969696CACACAB8B8B8DADADA0033
              3300FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
              0000FF00101010007F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616969696CACACA
              E3E3E3DADADA00333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF00101010007F7F60FFFFEFF0FFCFFFFF002F2F00FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016
              1616969696CACACAE3E3E3DADADA00333300FF0000FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F60FFFFEFF0FF
              CFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696CACACAE3E3E3DADADA00333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0010101000
              7F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00161616969696CACACAE3E3E3DADADA0033
              3300FF0000FF0000FF0000FF0000FF00000000FF001010101010101010101010
              10101010101010007F7F60FFFFEFF0FFCFFFFF002F2F002F2F002F2F002F2F00
              2F2F002F2F00FF00161616161616161616161616161616161616969696CACACA
              E3E3E3DADADA003333003333003333003333003333003333000000FF00101010
              007F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFFEFF0FFCFFFFFCFFFFFCFFF
              FFCFFFFFCFFFFF007F7F002F2F00FF00161616969696A1A1A1AAAAAAB8B8B8B8
              B8B8C1C1C1CACACAE3E3E3DADADADADADADADADADADADADADADA969696003333
              000000FF0000FF00101010007F7F00909000CFCF00FFFF00FFFF2FFFFFEFF0FF
              CFFFFFEFF0FFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF001616169696
              96A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1E3E3E3DADADAF1F1F1DADADADADADA96
              969600333300FF00000000FF0000FF0000FF00101010007F7F00909000CFCF00
              FFFF00FFFFEFF0FFEFF0FFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF00
              00FF0000FF00161616969696A1A1A1AAAAAAB8B8B8B8B8B8E3E3E3E3E3E3DADA
              DADADADA96969600333300FF0000FF00000000FF0000FF0000FF0000FF001010
              10007F7F00909000CFCF00FFFFEFF0FF2FFFFF2FFFFF007F7F002F2F00FF0000
              FF0000FF0000FF0000FF0000FF0000FF00161616969696A1A1A1AAAAAAB8B8B8
              E3E3E3C1C1C1C1C1C196969600333300FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF00101010007F7F00909000CFCF00FFFF00FFFF007F7F002F
              2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016161696
              9696A1A1A1AAAAAAB8B8B8B8B8B896969600333300FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F00909000CFCF
              007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696A1A1A1AAAAAA96969600333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
              1010007F7F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0016161696969696969600333300FF
              0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF00101010002F2F00FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616
              00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
            NumGlyphs = 2
            OnClick = btnTopClick
          end
          object btnTop3: TSpeedButton
            Left = 637
            Top = -572
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              B6060000424DB606000000000000360000002800000022000000100000000100
              18000000000080060000C40E0000C40E0000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF00002F2F002F2F002F2F002F2F002F2F002F2F00FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016
              161600333300333300333300333300333300FF0000FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F60FFFF90FFFF
              CFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696CACACAB8B8B8DADADA00333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0010101000
              7F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00161616969696CACACAB8B8B8DADADA0033
              3300FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
              0000FF00101010007F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616969696CACACA
              E3E3E3DADADA00333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF0000FF00101010007F7F60FFFFEFF0FFCFFFFF002F2F00FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016
              1616969696CACACAE3E3E3DADADA00333300FF0000FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F60FFFFEFF0FF
              CFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696CACACAE3E3E3DADADA00333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0010101000
              7F7F60FFFFEFF0FFCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF00161616969696CACACAE3E3E3DADADA0033
              3300FF0000FF0000FF0000FF0000FF00000000FF001010101010101010101010
              10101010101010007F7F60FFFFEFF0FFCFFFFF002F2F002F2F002F2F002F2F00
              2F2F002F2F00FF00161616161616161616161616161616161616969696CACACA
              E3E3E3DADADA003333003333003333003333003333003333000000FF00101010
              007F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFFEFF0FFCFFFFFCFFFFFCFFF
              FFCFFFFFCFFFFF007F7F002F2F00FF00161616969696A1A1A1AAAAAAB8B8B8B8
              B8B8C1C1C1CACACAE3E3E3DADADADADADADADADADADADADADADA969696003333
              000000FF0000FF00101010007F7F00909000CFCF00FFFF00FFFF2FFFFFEFF0FF
              CFFFFFEFF0FFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF001616169696
              96A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1E3E3E3DADADAF1F1F1DADADADADADA96
              969600333300FF00000000FF0000FF0000FF00101010007F7F00909000CFCF00
              FFFF00FFFFEFF0FFEFF0FFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF00
              00FF0000FF00161616969696A1A1A1AAAAAAB8B8B8B8B8B8E3E3E3E3E3E3DADA
              DADADADA96969600333300FF0000FF00000000FF0000FF0000FF0000FF001010
              10007F7F00909000CFCF00FFFFEFF0FF2FFFFF2FFFFF007F7F002F2F00FF0000
              FF0000FF0000FF0000FF0000FF0000FF00161616969696A1A1A1AAAAAAB8B8B8
              E3E3E3C1C1C1C1C1C196969600333300FF0000FF0000FF00000000FF0000FF00
              00FF0000FF0000FF00101010007F7F00909000CFCF00FFFF00FFFF007F7F002F
              2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016161696
              9696A1A1A1AAAAAAB8B8B8B8B8B896969600333300FF0000FF0000FF0000FF00
              000000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F00909000CFCF
              007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00161616969696A1A1A1AAAAAA96969600333300FF0000FF0000
              FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
              1010007F7F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0016161696969696969600333300FF
              0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF00101010002F2F00FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616
              00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
            NumGlyphs = 2
            OnClick = btnTopClick
          end
          object lbCPostalA: TLabel
            Left = 430
            Top = -875
            Width = 30
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'C.P.A.'
          end
          object Label6: TLabel
            Left = 556
            Top = -875
            Width = 21
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CIIU'
          end
          inline fraAE_PROGRAMA: TfraStaticCTB_TABLAS
            Left = 62
            Top = -1066
            Width = 599
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            inherited edCodigo: TPatternEdit
              Width = 30
            end
            inherited cmbDescripcion: TComboGrid
              Left = 36
              Width = 563
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
          inline fraAE_IDOPERATIVO: TfraStaticCodigoDescripcion
            Left = 62
            Top = -1038
            Width = 597
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            inherited edCodigo: TPatternEdit
              Width = 56
              MaxLength = 6
              Pattern = '0123456789'
            end
            inherited cmbDescripcion: TComboGrid
              Left = 60
              Width = 539
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
          object edAE_DOTACION: TIntEdit
            Left = 70
            Top = -983
            Width = 56
            Height = 21
            TabOrder = 7
            MaxLength = 6
            MaxValue = 999999
          end
          object edAE_OBSERVACIONES: TMemo
            Left = 113
            Top = -389
            Width = 541
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 25
          end
          inline fraEmpresa: TfraEmpresa
            Left = 54
            Top = -1176
            Width = 606
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
            TabOrder = 1
            inherited lbContrato: TLabel
              Left = 504
            end
            inherited edContrato: TIntEdit
              Left = 549
            end
            inherited cmbRSocial: TArtComboBox
              Width = 367
            end
          end
          object edAE_TELEFONOS: TPatternEdit
            Left = 63
            Top = -1095
            Width = 225
            Height = 21
            TabStop = False
            Color = clBtnFace
            MaxLength = 30
            ReadOnly = True
            TabOrder = 3
            Pattern = ' 0123456789()-/'
          end
          inline fraAE_IDACTIVIDAD: TfraStaticCodigoDescripcion
            Left = 62
            Top = -1011
            Width = 599
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            TabOrder = 6
            inherited edCodigo: TPatternEdit
              Width = 56
              TabStop = False
              Color = clBtnFace
            end
            inherited cmbDescripcion: TComboGrid
              Left = 60
              Width = 539
              TabStop = False
              Color = clBtnFace
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
          object rgAE_TIPOESTABLECIMIENTO: TRadioGroup
            Left = 6
            Top = -573
            Width = 238
            Height = 38
            Caption = 'Tipo de Establecimiento'
            Columns = 2
            Items.Strings = (
              'Establecimiento'
              'Obra')
            TabOrder = 11
            TabStop = True
            OnClick = rgAE_TIPOESTABLECIMIENTOClick
          end
          object edAE_DOTACIONESTABLECIMIENTO: TIntEdit
            Left = 63
            Top = -879
            Width = 56
            Height = 21
            TabOrder = 9
            MaxLength = 6
            MaxValue = 999999
          end
          inline fraAE_LUGARDEOCURRENCIA: TfraStaticCTB_TABLAS
            Left = 112
            Top = -530
            Width = 202
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 12
            inherited edCodigo: TPatternEdit
              Width = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 144
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
          object edAE_FRECEPCIONOBRA: TDateComboBox
            Left = 403
            Top = -530
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 13
          end
          object edAE_FINICIOACTIVIDAD: TDateComboBox
            Left = 568
            Top = -530
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 14
          end
          object edAE_SUPERFICIE: TCurrencyEdit
            Left = 113
            Top = -501
            Width = 82
            Height = 21
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxLength = 12
            MaxValue = 999999999.990000000000000000
            TabOrder = 15
          end
          object edAE_PLANTAS: TIntEdit
            Left = 270
            Top = -501
            Width = 34
            Height = 21
            TabOrder = 16
            MaxLength = 2
            MaxValue = 99
          end
          inline fraAE_TIPOOBRA: TfraStaticCTB_TABLAS
            Left = 384
            Top = -502
            Width = 271
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 17
            inherited edCodigo: TPatternEdit
              Width = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 247
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
          inline fraAE_ACTIVIDADOBRA: TfraStaticCTB_TABLAS
            Left = 112
            Top = -474
            Width = 202
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 18
            inherited edCodigo: TPatternEdit
              Width = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 144
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
          inline fraAE_ETAPAOBRA: TfraStaticCTB_TABLAS
            Left = 386
            Top = -474
            Width = 269
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 19
            inherited edCodigo: TPatternEdit
              Width = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 239
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
          object chkAE_PROGRAMAAPROBADO: TCheckBox
            Left = 5
            Top = -443
            Width = 121
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Programa Aprobado'
            TabOrder = 20
          end
          inline fraAE_PROGRAMASEGURIDAD: TfraStaticCTB_TABLAS
            Left = 265
            Top = -445
            Width = 331
            Height = 23
            TabOrder = 21
            inherited edCodigo: TPatternEdit
              Width = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 299
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
          object edAE_FFINOBRA: TDateComboBox
            Left = 113
            Top = -415
            Width = 88
            Height = 21
            TabOrder = 22
          end
          object edAE_FSUSPOBRA: TDateComboBox
            Left = 281
            Top = -415
            Width = 88
            Height = 21
            TabOrder = 23
          end
          object edAE_FREINICIOOBRA: TDateComboBox
            Left = 460
            Top = -415
            Width = 88
            Height = 21
            TabOrder = 24
          end
          object edAE_FECHAACCIDENTE: TDateComboBox
            Left = 113
            Top = -280
            Width = 88
            Height = 21
            TabOrder = 26
          end
          object edAE_TAREASHABITUALES: TMemo
            Left = 113
            Top = -254
            Width = 541
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 27
          end
          object edAE_TAREASACCIDENTE: TMemo
            Left = 113
            Top = -175
            Width = 541
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 28
          end
          object edAE_DESCRIPCIONACCIDENTE: TMemo
            Left = 113
            Top = -96
            Width = 541
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 3000
            TabOrder = 29
          end
          object edAE_HECHOSADICIONALES: TMemo
            Left = 113
            Top = -16
            Width = 541
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 2000
            TabOrder = 30
          end
          object edAE_OTROSDATOS: TMemo
            Left = 5
            Top = 89
            Width = 649
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 31
          end
          inline fraPreventor: TfraCodigoDescripcion
            Left = 61
            Top = 196
            Width = 432
            Height = 23
            TabOrder = 33
            inherited cmbDescripcion: TArtComboBox
              Width = 367
              CharCase = ecUpperCase
              OnDropDown = fraPreventorcmbDescripcionDropDown
            end
            inherited edCodigo: TPatternEdit
              CharCase = ecNormal
            end
          end
          inline fraEstablecimientoAcc: TfraEstablecimientoDomic
            Left = 1
            Top = -927
            Width = 662
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            inherited lbLocalidad: TLabel
              Left = 428
            end
            inherited lbEstableci: TLabel
              Left = 7
              Top = 1
            end
            inherited lbCPostal: TLabel
              Left = 591
            end
            inherited lbDomicilio: TLabel
              Left = 7
            end
            inherited lbProvincia: TLabel
              Left = 428
            end
            inherited cmbDescripcion: TArtComboBox [5]
              Left = 111
              Width = 303
              ReadOnly = False
              OnDropDown = fraEstablecimientoAcccmbDescripcionDropDown
            end
            inherited edCodigo: TIntEdit [6]
              Left = 62
              ReadOnly = False
            end
            inherited edLocalidad: TEdit
              Left = 480
              Width = 105
            end
            inherited edCPostal: TEdit
              Left = 615
            end
            inherited edDomicilio: TEdit
              Left = 62
              Width = 351
            end
            inherited edProvincia: TEdit
              Left = 479
              Width = 182
            end
            inherited sdqDatos: TSDQuery
              Left = 144
              Top = 9
            end
            inherited dsDatos: TDataSource
              Left = 115
              Top = 9
            end
          end
          object dbgTrabajadores: TRxDBGrid
            Left = 6
            Top = -802
            Width = 655
            Height = 193
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsTrabajadores
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 10
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = tbModifTrabClick
            OnGetCellParams = dbgTrabajadoresGetCellParams
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CUIL'
                Title.Alignment = taCenter
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Title.Caption = 'Nombre'
                Width = 471
                Visible = True
              end>
          end
          object fpTrabajador: TFormPanel
            Left = 228
            Top = -750
            Width = 343
            Height = 106
            Caption = 'Datos Trabajador'
            FormWidth = 0
            FormHeigth = 0
            BorderStyle = bsDialog
            Position = poMainFormCenter
            DesignSize = (
              343
              106)
            object Label19: TLabel
              Left = 8
              Top = 9
              Width = 27
              Height = 13
              Caption = 'CUIL:'
            end
            object Label1: TLabel
              Left = 11
              Top = 39
              Width = 40
              Height = 13
              Caption = 'Nombre:'
            end
            object Bevel6: TBevel
              Left = 4
              Top = 67
              Width = 335
              Height = 3
              Anchors = [akLeft, akRight, akBottom]
              Shape = bsTopLine
            end
            object mskCUIL: TMaskEdit
              Left = 54
              Top = 6
              Width = 81
              Height = 21
              Hint = 'CUIL del Trabajador'
              EditMask = '99-99999999-c;0;'
              MaxLength = 13
              TabOrder = 0
            end
            object ed_NOMBRETRABAJADOR: TEdit
              Left = 54
              Top = 36
              Width = 283
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
            end
            object btnAceptarDT: TButton
              Left = 181
              Top = 75
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Aceptar'
              TabOrder = 2
              OnClick = btnAceptarDTClick
            end
            object btnCancelarDT: TButton
              Left = 262
              Top = 75
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Cancel = True
              Caption = '&Cancelar'
              ModalResult = 2
              TabOrder = 3
            end
          end
          object edCiuu: TEdit
            Left = 589
            Top = -879
            Width = 72
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 34
          end
          object edCPA: TEdit
            Left = 480
            Top = -879
            Width = 72
            Height = 21
            TabStop = False
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 36
          end
          object CoolBar6: TCoolBar
            Left = 6
            Top = -834
            Width = 655
            Height = 29
            Align = alNone
            Anchors = [akLeft, akTop, akRight]
            Bands = <
              item
                Control = ToolBar1
                ImageIndex = -1
                MinHeight = 27
                Width = 651
              end>
            object ToolBar1: TToolBar
              Left = 9
              Top = 0
              Width = 638
              Height = 27
              Align = alClient
              BorderWidth = 1
              Caption = 'ToolBar'
              EdgeBorders = []
              Flat = True
              HotImages = frmPrincipal.ilColor
              Images = frmPrincipal.ilByN
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object tbAgregarTrab: TToolButton
                Left = 0
                Top = 0
                Hint = 'Agregar'
                ImageIndex = 6
                OnClick = tbAgregarTrabClick
              end
              object tbModifTrab: TToolButton
                Left = 23
                Top = 0
                Hint = 'Modificar'
                Caption = 'tbPPEModificar'
                ImageIndex = 7
                OnClick = tbModifTrabClick
              end
              object tbBorrarTrab: TToolButton
                Left = 46
                Top = 0
                Hint = 'Eliminar'
                ImageIndex = 8
                OnClick = tbBorrarTrabClick
              end
            end
          end
          inline fraDomicilioEmpresa: TfraDomicilio
            Left = 0
            Top = -1149
            Width = 659
            Height = 51
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            inherited lbCalle: TLabel
              Left = 9
              Top = 3
            end
            inherited lbNro: TLabel
              Left = 444
            end
            inherited lbPiso: TLabel
              Left = 516
            end
            inherited lbDto: TLabel
              Left = 592
            end
            inherited lbCPostal: TLabel
              Left = 9
              Top = 33
            end
            inherited lbCPA: TLabel
              Left = 116
            end
            inherited lbLocalidad: TLabel
              Left = 227
            end
            inherited lbProvincia: TLabel
              Left = 497
            end
            inherited cmbCalle: TArtComboBox
              Left = 54
              Width = 353
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              DataSource = nil
            end
            inherited edNumero: TEdit
              Left = 466
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            inherited edPiso: TEdit
              Left = 542
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            inherited edDto: TEdit
              Left = 614
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            inherited edCPostal: TIntEdit
              Left = 54
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 279
              Width = 212
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              DataSource = nil
            end
            inherited edProvincia: TEdit
              Left = 546
            end
            inherited edCPA: TPatternEdit
              Left = 142
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            inherited btnBuscar: TButton
              Left = 409
              Enabled = False
            end
          end
          object edNota: TMaskEdit
            Left = 63
            Top = -1230
            Width = 64
            Height = 21
            EditMask = '!9999/99;1;_'
            MaxLength = 7
            TabOrder = 0
            Text = '    /  '
            OnExit = edNotaExit
          end
        end
      end
      object tsVisitas: TTabSheet
        Caption = 'Visitas'
        ImageIndex = 3
        object dbgVisitas: TRxDBGrid
          Left = 0
          Top = 26
          Width = 688
          Height = 332
          Align = alClient
          DataSource = dsVisitas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = btnModifVisitaClick
          OnGetCellParams = dbgVisitasGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'rv_id'
              Title.Alignment = taCenter
              Title.Caption = 'Visita'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rv_estableci'
              Title.Alignment = taCenter
              Title.Caption = 'Est.Visita'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'rv_fecha'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'it_nombre'
              Title.Alignment = taCenter
              Title.Caption = 'Preventor'
              Width = 206
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'rv_operativo'
              Title.Alignment = taCenter
              Title.Caption = 'Operativo'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'rv_tipo'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Empresa'
              Width = 75
              Visible = True
            end>
        end
        object tbarVisitas: TToolBar
          Left = 0
          Top = 0
          Width = 688
          Height = 26
          BorderWidth = 1
          DisabledImages = frmPrincipal.ilByN
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object btnRefrescarVisitas: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar (F5)'
            Caption = 'tbDiagRefrescar'
            ImageIndex = 0
            OnClick = btnRefrescarVisitasClick
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnNuevaVisita: TToolButton
            Left = 31
            Top = 0
            Hint = 'Nuevo (Ctrl+N)'
            Caption = 'tbDiagAgregar'
            ImageIndex = 6
            OnClick = btnNuevaVisitaClick
          end
          object btnModifVisita: TToolButton
            Left = 54
            Top = 0
            Hint = 'Modificar (Ctrl+M)'
            ImageIndex = 7
            OnClick = btnModifVisitaClick
          end
          object btnDeleteVisita: TToolButton
            Left = 77
            Top = 0
            Hint = 'Eliminar (Del)'
            Caption = 'tbDiagQuitar'
            ImageIndex = 8
            OnClick = btnDeleteVisitaClick
          end
          object ToolButton9: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object ToolButton10: TToolButton
            Left = 108
            Top = 0
            Hint = 'Ordenar (Ctrl+O)'
            Caption = 'tbDiagOrdenar'
            ImageIndex = 2
            OnClick = ToolButton10Click
          end
          object ToolButton7: TToolButton
            Left = 131
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 5
            Style = tbsSeparator
          end
          object ToolButton12: TToolButton
            Left = 139
            Top = 0
            Hint = 'Exportar (Ctrl+E)'
            Caption = 'tbDiagExportar'
            ImageIndex = 3
          end
          object ToolButton13: TToolButton
            Left = 162
            Top = 0
            Hint = 'Imprimir (Ctrl+I)'
            Caption = 'tbDiagImprimir'
            ImageIndex = 4
          end
          object ToolButton15: TToolButton
            Left = 185
            Top = 0
            Width = 8
            Caption = 'ToolButton15'
            ImageIndex = 5
            Style = tbsSeparator
          end
          inline fraEstabVisitaFiltro: TfraEstablecimiento
            Left = 193
            Top = 0
            Width = 330
            Height = 22
            TabOrder = 0
            inherited cmbDescripcion: TArtComboBox
              Width = 265
            end
          end
        end
        object panObservaciones: TPanel
          Left = 0
          Top = 358
          Width = 688
          Height = 59
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Label18: TLabel
            Left = 0
            Top = 0
            Width = 71
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Observaciones'
            Layout = tlCenter
          end
          object redObservaciones: TRichEdit
            Left = 0
            Top = 13
            Width = 688
            Height = 46
            Align = alClient
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object fpVisita: TFormPanel
          Left = 100
          Top = 83
          Width = 474
          Height = 261
          Caption = 'Carga de Visitas'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu]
          BorderStyle = bsSingle
          Position = poScreenCenter
          DesignSize = (
            474
            261)
          object Bevel9: TBevel
            Left = 4
            Top = 222
            Width = 466
            Height = 5
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object btnAceptarVisita: TButton
            Left = 313
            Top = 230
            Width = 75
            Height = 24
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 2
            OnClick = btnAceptarVisitaClick
          end
          object Button1: TButton
            Left = 393
            Top = 229
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 3
          end
          object tbVisitaAsoc: TToolBar
            Left = 9
            Top = 331
            Width = 61
            Height = 26
            Align = alNone
            BorderWidth = 1
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object ToolButton1: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnLimpiarVisita: TToolButton
              Left = 8
              Top = 0
              Hint = 'Limpiar visitas'
              ImageIndex = 1
              OnClick = btnLimpiarVisitaClick
            end
          end
          object pnlDatos: TPanel
            Left = 0
            Top = 0
            Width = 474
            Height = 217
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              474
              217)
            object Label12: TLabel
              Left = 9
              Top = 3
              Width = 33
              Height = 13
              Caption = 'Fecha:'
            end
            object Label13: TLabel
              Left = 9
              Top = 57
              Width = 49
              Height = 13
              Caption = 'Preventor:'
            end
            object Label17: TLabel
              Left = 9
              Top = 84
              Width = 63
              Height = 13
              Caption = 'Observaci'#243'n:'
            end
            object Label29: TLabel
              Left = 9
              Top = 33
              Width = 57
              Height = 13
              Caption = 'Establecim.:'
            end
            inline fraPreventorVisita: TfraCodigoDescripcion
              Left = 71
              Top = 51
              Width = 396
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              inherited cmbDescripcion: TArtComboBox
                Width = 331
                CharCase = ecUpperCase
                OnDropDown = fraPreventorVisitacmbDescripcionDropDown
              end
              inherited edCodigo: TPatternEdit
                CharCase = ecNormal
              end
            end
            object edObservacion: TMemo
              Left = 72
              Top = 84
              Width = 392
              Height = 133
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edFechaVisita: TDateEdit
              Left = 72
              Top = 0
              Width = 88
              Height = 21
              NumGlyphs = 2
              TabOrder = 0
            end
            inline fraEstabVisita: TfraEstablecimiento
              Left = 71
              Top = 27
              Width = 396
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              inherited cmbDescripcion: TArtComboBox
                Width = 331
              end
            end
          end
        end
      end
      object tsEntrevistas: TTabSheet
        Caption = 'Personas Entrevistadas/Testigos'
        ImageIndex = 1
        object dbgPPE_PERSONAENTREVISTADA: TRxDBGrid
          Left = 0
          Top = 29
          Width = 688
          Height = 388
          Align = alClient
          DataSource = dsPPE_PERSONAENTREVISTADA
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = tbPPEModificarClick
          IniStorage = FormStorage
          OnGetCellParams = dbgPPE_PERSONAENTREVISTADAGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRTIPODOCUMENTO'
              Title.Caption = 'Tipo Documento'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PE_DOCUMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Documento'
              Width = 67
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PE_CUIL'
              Title.Alignment = taCenter
              Title.Caption = 'CUIL'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PE_NOMBRE'
              Title.Caption = 'Apellido y Nombre'
              Width = 256
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PE_CARGO'
              Title.Caption = 'Cargo en la Empresa'
              Width = 178
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PE_FECHA_ENTREVISTA'
              Title.Caption = 'Fecha Entrevista'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ENTREVISTA'
              Title.Caption = 'Tipo Entrevista'
              Width = 81
              Visible = True
            end>
        end
        object fpPPE_PERSONAENTREVISTADA: TFormPanel
          Left = 132
          Top = 121
          Width = 409
          Height = 209
          Caption = 'Personas Entrevistadas/Testigos'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = []
          Position = poScreenCenter
          ActiveControl = fraPE_TIPODOCUMENTO.edCodigo
          Constraints.MaxHeight = 209
          Constraints.MaxWidth = 409
          Constraints.MinHeight = 209
          Constraints.MinWidth = 409
          DesignSize = (
            409
            209)
          object Bevel4: TBevel
            Left = 4
            Top = 174
            Width = 401
            Height = 3
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object lbCUIL: TLabel
            Left = 287
            Top = 37
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          object Label8: TLabel
            Left = 10
            Top = 65
            Width = 85
            Height = 13
            Caption = 'Apellido y Nombre'
          end
          object Label9: TLabel
            Left = 10
            Top = 93
            Width = 98
            Height = 13
            Caption = 'Cargo en la Empresa'
          end
          object Label10: TLabel
            Left = 10
            Top = 121
            Width = 95
            Height = 13
            Caption = 'Fecha de Entrevista'
          end
          object Label11: TLabel
            Left = 10
            Top = 149
            Width = 86
            Height = 13
            Caption = 'Tipo de Entrevista'
          end
          object lbTipoDocumento: TLabel
            Left = 10
            Top = 10
            Width = 94
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object lbDocumento: TLabel
            Left = 10
            Top = 37
            Width = 55
            Height = 13
            Caption = 'Documento'
          end
          object btPPEAceptar: TButton
            Left = 249
            Top = 180
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 7
            OnClick = btPPEAceptarClick
          end
          object btnPPECancelar: TButton
            Left = 328
            Top = 180
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 8
          end
          object mskPE_CUIL: TMaskEdit
            Left = 319
            Top = 33
            Width = 81
            Height = 21
            Hint = 'CUIL del Trabajador'
            EditMask = '99-99999999-c;0;'
            MaxLength = 13
            ReadOnly = True
            TabOrder = 2
          end
          object edPE_NOMBRE: TPatternEdit
            Left = 112
            Top = 61
            Width = 289
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 35
            TabOrder = 3
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          object edPE_CARGO: TPatternEdit
            Left = 112
            Top = 89
            Width = 289
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 30
            TabOrder = 4
          end
          object edPE_FECHA_ENTREVISTA: TDateComboBox
            Left = 112
            Top = 117
            Width = 88
            Height = 21
            TabOrder = 5
          end
          object edPE_TIPO_ENTREVISTA: TExComboBox
            Left = 112
            Top = 146
            Width = 88
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 6
            Items.Strings = (
              'E=Entrevista'
              'T=Testigo')
            ItemIndex = -1
            Options = []
            ValueWidth = 64
          end
          inline fraPE_TIPODOCUMENTO: TfraStaticCTB_TABLAS
            Left = 111
            Top = 5
            Width = 291
            Height = 23
            TabOrder = 0
            inherited cmbDescripcion: TComboGrid
              Width = 227
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
          object edPE_DOCUMENTO: TIntEdit
            Left = 112
            Top = 33
            Width = 81
            Height = 21
            TabOrder = 1
            MaxLength = 8
            MaxValue = 99999999
          end
        end
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 688
          Height = 29
          Bands = <
            item
              Control = tBarPPE_PERSONAENTREVISTADA
              ImageIndex = -1
              MinHeight = 27
              Width = 684
            end>
          object tBarPPE_PERSONAENTREVISTADA: TToolBar
            Left = 9
            Top = 0
            Width = 671
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
            object tbPPENuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbPPENuevoClick
            end
            object tbPPEModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbPPEModificar'
              ImageIndex = 7
              OnClick = tbPPEModificarClick
            end
            object tbPPEEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              ImageIndex = 8
              OnClick = tbPPEEliminarClick
            end
          end
        end
      end
      object tsCausasMedidasSeguim: TTabSheet
        Caption = 'Causas/Medidas/Seguimiento'
        ImageIndex = 2
        object pcCausasMedidasSeguim: TPageControl
          Left = 0
          Top = 0
          Width = 688
          Height = 417
          ActivePage = tsCausas
          Align = alClient
          TabOrder = 0
          OnChange = pcCausasMedidasSeguimChange
          object tsCausas: TTabSheet
            Caption = 'Causas'
            object CoolBar2: TCoolBar
              Left = 0
              Top = 0
              Width = 680
              Height = 29
              Bands = <
                item
                  Control = tBarPDC_DIAGNOSTICOCAUSA
                  ImageIndex = -1
                  MinHeight = 27
                  Width = 676
                end>
              object tBarPDC_DIAGNOSTICOCAUSA: TToolBar
                Left = 9
                Top = 0
                Width = 663
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
                object tbPDCNuevo: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Nuevo (Ctrl+N)'
                  ImageIndex = 6
                  OnClick = tbPDCNuevoClick
                end
                object tbPDCModificar: TToolButton
                  Left = 23
                  Top = 0
                  Hint = 'Modificar (Ctrl+M)'
                  ImageIndex = 7
                  OnClick = tbPDCModificarClick
                end
                object tbPDCEliminar: TToolButton
                  Left = 46
                  Top = 0
                  Hint = 'Eliminar (Cltr+Del)'
                  ImageIndex = 8
                  OnClick = tbPDCEliminarClick
                end
              end
            end
            object dbgPDC_DIAGNOSTICOCAUSA: TRxDBGrid
              Left = 0
              Top = 29
              Width = 680
              Height = 360
              Align = alClient
              DataSource = dsPDC_DIAGNOSTICOCAUSA
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = tbPDCModificarClick
              IniStorage = FormStorage
              OnGetCellParams = dbgPDC_DIAGNOSTICOCAUSAGetCellParams
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DC_NUMERO'
                  Title.Caption = 'N'#250'mero'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DC_DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 682
                  Visible = True
                end>
            end
            object fpPCD_DIAGNOSTICOCAUSA: TFormPanel
              Left = 89
              Top = 100
              Width = 505
              Height = 209
              Caption = 'Causa'
              FormWidth = 0
              FormHeigth = 0
              BorderIcons = []
              Position = poScreenCenter
              ActiveControl = edDC_DESCRIPCION
              Constraints.MaxHeight = 209
              Constraints.MaxWidth = 505
              Constraints.MinHeight = 209
              Constraints.MinWidth = 505
              DesignSize = (
                505
                209)
              object Bevel2: TBevel
                Left = 4
                Top = 174
                Width = 497
                Height = 3
                Anchors = [akLeft, akRight, akBottom]
                Shape = bsTopLine
              end
              object Label14: TLabel
                Left = 10
                Top = 12
                Width = 68
                Height = 13
                Caption = 'Nro. de Causa'
              end
              object btPDCAceptar: TButton
                Left = 346
                Top = 180
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = '&Aceptar'
                TabOrder = 2
                OnClick = btPDCAceptarClick
              end
              object btPDCCancelar: TButton
                Left = 425
                Top = 180
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Cancel = True
                Caption = '&Cancelar'
                ModalResult = 2
                TabOrder = 3
              end
              object edDC_NUMERO: TIntEdit
                Left = 85
                Top = 9
                Width = 38
                Height = 21
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 0
                MaxLength = 0
              end
              object edDC_DESCRIPCION: TMemo
                Left = 6
                Top = 40
                Width = 493
                Height = 129
                Anchors = [akLeft, akTop, akRight, akBottom]
                MaxLength = 4000
                ScrollBars = ssBoth
                TabOrder = 1
              end
            end
          end
          object tsMedidasCorrectivas: TTabSheet
            Caption = 'Medidas Correctivas'
            ImageIndex = 1
            object Splitter1: TSplitter
              Left = 431
              Top = 0
              Width = 5
              Height = 389
              Align = alRight
            end
            object pcVisitasSeguimiento: TPageControl
              Left = 436
              Top = 0
              Width = 244
              Height = 389
              ActivePage = tsSeguimientoVisitas
              Align = alRight
              TabOrder = 0
              object tsSeguimientoVisitas: TTabSheet
                Caption = 'Visitas'
                ImageIndex = 1
                object CoolBar5: TCoolBar
                  Left = 0
                  Top = 28
                  Width = 236
                  Height = 29
                  Bands = <
                    item
                      Control = tBarPSV_SEGUIMIENTOVISITA
                      ImageIndex = -1
                      MinHeight = 27
                      Width = 232
                    end>
                  object tBarPSV_SEGUIMIENTOVISITA: TToolBar
                    Left = 9
                    Top = 0
                    Width = 219
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
                    object tbBuscar: TToolButton
                      Left = 0
                      Top = 0
                      Hint = 'Refrescar'
                      Caption = 'tbBuscar'
                      ImageIndex = 0
                      OnClick = tbBuscarClick
                    end
                    object ToolButton14: TToolButton
                      Left = 23
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton14'
                      ImageIndex = 9
                      Style = tbsSeparator
                    end
                    object tbPSVNuevo: TToolButton
                      Left = 31
                      Top = 0
                      Hint = 'Nuevo (Ctrl+N)'
                      ImageIndex = 6
                      OnClick = tbPSVNuevoClick
                    end
                    object tbPSVModificar: TToolButton
                      Left = 54
                      Top = 0
                      Hint = 'Modificar (Ctrl+M)'
                      Caption = 'tbPPEModificar'
                      ImageIndex = 7
                      OnClick = tbPSVModificarClick
                    end
                    object tbPSVEliminar: TToolButton
                      Left = 77
                      Top = 0
                      Hint = 'Eliminar (Cltr+Del)'
                      ImageIndex = 8
                      OnClick = tbPSVEliminarClick
                    end
                    object ToolButton16: TToolButton
                      Left = 100
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton16'
                      ImageIndex = 9
                      Style = tbsSeparator
                    end
                    object tbInferencia: TToolButton
                      Left = 108
                      Top = 0
                      Hint = 'Efectuar Inferencia'
                      Caption = 'tbInferencia'
                      ImageIndex = 29
                      OnClick = tbInferenciaClick
                    end
                    object Label30: TLabel
                      Left = 131
                      Top = 0
                      Width = 70
                      Height = 22
                      Align = alRight
                      Alignment = taRightJustify
                      AutoSize = False
                      Caption = '     Inferidos'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                end
                object dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid
                  Left = 0
                  Top = 57
                  Width = 236
                  Height = 304
                  Align = alClient
                  DataSource = dsPSV_SEGUIMIENTOVISITA
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = tbPSVModificarClick
                  IniStorage = FormStorage
                  OnGetCellParams = dbgPSV_SEGUIMIENTOVISITAGetCellParams
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SV_ESTABLECI'
                      Title.Caption = 'Estab.'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TIPO_VISITA'
                      Title.Caption = 'Tipo'
                      Width = 91
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'SV_FECHA'
                      Title.Alignment = taCenter
                      Title.Caption = 'Fecha'
                      Width = 66
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'es_nombre'
                      Title.Caption = 'Establecimiento'
                      Visible = True
                    end>
                end
                object fpPSV_SEGUIMIENTOVISITA: TFormPanel
                  Left = -134
                  Top = 159
                  Width = 370
                  Height = 106
                  Caption = 'Visita'
                  FormWidth = 0
                  FormHeigth = 0
                  BorderIcons = []
                  BorderStyle = bsDialog
                  Position = poScreenCenter
                  ActiveControl = edSV_TIPO
                  Constraints.MaxHeight = 370
                  Constraints.MinHeight = 106
                  Constraints.MinWidth = 370
                  DesignSize = (
                    370
                    106)
                  object Bevel12: TBevel
                    Left = 4
                    Top = 71
                    Width = 362
                    Height = 3
                    Anchors = [akLeft, akRight, akBottom]
                    Shape = bsTopLine
                  end
                  object Label70: TLabel
                    Left = 168
                    Top = 12
                    Width = 30
                    Height = 13
                    Caption = 'Fecha'
                  end
                  object Label71: TLabel
                    Left = 9
                    Top = 13
                    Width = 21
                    Height = 13
                    Caption = 'Tipo'
                  end
                  object Label20: TLabel
                    Left = 9
                    Top = 42
                    Width = 57
                    Height = 13
                    Caption = 'Establecim.:'
                  end
                  object btPSVAceptar: TButton
                    Left = 209
                    Top = 77
                    Width = 75
                    Height = 25
                    Anchors = [akRight, akBottom]
                    Caption = '&Aceptar'
                    TabOrder = 3
                    OnClick = btPSVAceptarClick
                  end
                  object btPSVCancelar: TButton
                    Left = 289
                    Top = 77
                    Width = 75
                    Height = 25
                    Anchors = [akRight, akBottom]
                    Cancel = True
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 4
                    OnClick = btPSVCancelarClick
                  end
                  object edSV_FECHA: TDateComboBox
                    Left = 204
                    Top = 9
                    Width = 88
                    Height = 21
                    TabOrder = 1
                  end
                  object edSV_TIPO: TExComboBox
                    Left = 36
                    Top = 9
                    Width = 121
                    Height = 22
                    Style = csOwnerDrawFixed
                    ItemHeight = 16
                    TabOrder = 0
                    Items.Strings = (
                      'C=Cumplimiento'
                      'I=Incumplimiento')
                    ItemIndex = -1
                    Options = []
                    ValueWidth = 64
                  end
                  inline fraEstabSeguimiento: TfraEstablecimiento
                    Left = 69
                    Top = 36
                    Width = 295
                    Height = 23
                    TabOrder = 2
                    inherited cmbDescripcion: TArtComboBox
                      Left = 58
                      Width = 237
                    end
                    inherited edCodigo: TPatternEdit
                      Width = 54
                    end
                  end
                end
                inline fraEstabSV: TfraEstablecimiento
                  Left = 0
                  Top = 0
                  Width = 236
                  Height = 28
                  Align = alTop
                  TabOrder = 3
                  inherited cmbDescripcion: TArtComboBox
                    Left = 58
                    Width = 177
                  end
                  inherited edCodigo: TPatternEdit
                    Width = 54
                  end
                end
              end
              object tsNoVisitados: TTabSheet
                Caption = 'No Visitados'
                ImageIndex = 1
                object RxDBGrid1: TRxDBGrid
                  Left = 0
                  Top = 0
                  Width = 236
                  Height = 445
                  Align = alClient
                  DataSource = dsNoVisitados
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  IniStorage = FormStorage
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'es_nroestableci'
                      Title.Caption = 'Nro.Est.'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'es_nombre'
                      Title.Caption = 'Establecimiento'
                      Width = 148
                      Visible = True
                    end>
                end
              end
            end
            object pnlMedidasCorrectivas: TPanel
              Left = 0
              Top = 0
              Width = 431
              Height = 389
              Align = alClient
              TabOrder = 1
              object CoolBar3: TCoolBar
                Left = 1
                Top = 1
                Width = 429
                Height = 29
                Bands = <
                  item
                    Control = tBarPMC_MEDIDACORRECTIVA
                    ImageIndex = -1
                    MinHeight = 27
                    Width = 425
                  end>
                object tBarPMC_MEDIDACORRECTIVA: TToolBar
                  Left = 9
                  Top = 0
                  Width = 412
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
                  object tbPMCNuevo: TToolButton
                    Left = 0
                    Top = 0
                    Hint = 'Nuevo (Ctrl+N)'
                    ImageIndex = 6
                    OnClick = tbPMCNuevoClick
                  end
                  object tbPMCModificar: TToolButton
                    Left = 23
                    Top = 0
                    Hint = 'Modificar (Ctrl+M)'
                    Caption = 'tbPPEModificar'
                    ImageIndex = 7
                    OnClick = tbPMCModificarClick
                  end
                  object tbPMCEliminar: TToolButton
                    Left = 46
                    Top = 0
                    Hint = 'Eliminar (Cltr+Del)'
                    ImageIndex = 8
                    OnClick = tbPMCEliminarClick
                  end
                end
              end
              object dbgPMC_MEDIDACORRECTIVA: TRxDBGrid
                Left = 1
                Top = 30
                Width = 429
                Height = 273
                Align = alClient
                DataSource = dsPMC_MEDIDACORRECTIVA
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = tbPMCModificarClick
                IniStorage = FormStorage
                MultiSelect = True
                OnGetCellParams = dbgPMC_MEDIDACORRECTIVAGetCellParams
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'MC_MEDIDA'
                    Title.Caption = 'N'#250'mero'
                    Width = 47
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'MC_FECHAEJECUCION'
                    Title.Alignment = taCenter
                    Title.Caption = 'F. Ejecuci'#243'n'
                    Width = 74
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'MC_FECHAVERIFICACION'
                    Title.Alignment = taCenter
                    Title.Caption = 'F. Verificaci'#243'n'
                    Width = 74
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MC_DESCRIPCION'
                    Title.Caption = 'Descripci'#243'n'
                    Width = 282
                    Visible = True
                  end>
              end
              object ArtDBGrid1: TArtDBGrid
                Left = 1
                Top = 303
                Width = 429
                Height = 85
                Align = alBottom
                DataSource = dsPCM_CAUSAYMEDIDA
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 3
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                FooterBand = False
                TitleHeight = 17
                Columns = <
                  item
                    ButtonStyle = cbsNone
                    Expanded = False
                    FieldName = 'ROWNUM'
                    ReadOnly = True
                    Title.Caption = 'Nro.'
                    Width = 26
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DC_NUMERO'
                    Title.Caption = 'Nro. Causa'
                    Width = 69
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsNone
                    Expanded = False
                    FieldName = 'DC_DESCRIPCION'
                    ReadOnly = True
                    Title.Caption = 'Causa'
                    Width = 476
                    Visible = True
                  end>
              end
              object fpPMC_MEDIDACORRECTIVA: TFormPanel
                Left = 82
                Top = -21
                Width = 505
                Height = 400
                Caption = 'Medida Correctiva'
                FormWidth = 0
                FormHeigth = 0
                BorderIcons = []
                Position = poScreenCenter
                Constraints.MaxWidth = 505
                Constraints.MinHeight = 400
                Constraints.MinWidth = 505
                DesignSize = (
                  505
                  400)
                object Bevel5: TBevel
                  Left = 4
                  Top = 365
                  Width = 497
                  Height = 3
                  Anchors = [akLeft, akRight, akBottom]
                  Shape = bsTopLine
                end
                object Label15: TLabel
                  Left = 10
                  Top = 9
                  Width = 73
                  Height = 13
                  Caption = 'Nro. de Medida'
                end
                object Bevel14: TBevel
                  Left = 5
                  Top = 29
                  Width = 495
                  Height = 5
                  Anchors = [akLeft, akTop, akRight]
                  Shape = bsTopLine
                end
                object Label64: TLabel
                  Left = 10
                  Top = 321
                  Width = 189
                  Height = 13
                  Anchors = [akLeft, akBottom]
                  Caption = 'F. de Ejecuci'#243'n por parte del Empleador'
                end
                object Label65: TLabel
                  Left = 10
                  Top = 344
                  Width = 216
                  Height = 13
                  Anchors = [akLeft, akBottom]
                  Caption = 'F. de Verificaci'#243'n por parte de la Aseguradora'
                end
                object Label28: TLabel
                  Left = 9
                  Top = 186
                  Width = 43
                  Height = 13
                  Caption = 'Medidas:'
                end
                object Causas: TLabel
                  Left = 9
                  Top = 36
                  Width = 38
                  Height = 13
                  Caption = 'Causas:'
                end
                object btPMCAceptar: TButton
                  Left = 346
                  Top = 371
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Caption = '&Aceptar'
                  TabOrder = 5
                  OnClick = btPMCAceptarClick
                end
                object btPMCCancelar: TButton
                  Left = 424
                  Top = 371
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Cancel = True
                  Caption = '&Cancelar'
                  ModalResult = 2
                  TabOrder = 6
                end
                object edMC_MEDIDA: TIntEdit
                  Left = 89
                  Top = 6
                  Width = 38
                  Height = 21
                  Color = clBtnFace
                  ReadOnly = True
                  TabOrder = 1
                  MaxLength = 0
                end
                object edMC_DESCRIPCION: TMemo
                  Left = 8
                  Top = 201
                  Width = 489
                  Height = 109
                  Anchors = [akLeft, akTop, akBottom]
                  MaxLength = 4000
                  ScrollBars = ssBoth
                  TabOrder = 2
                end
                object edMC_FECHAEJECUCION: TDateComboBox
                  Left = 236
                  Top = 317
                  Width = 88
                  Height = 21
                  Anchors = [akLeft, akBottom]
                  TabOrder = 3
                end
                object edMC_FECHAVERIFICACION: TDateComboBox
                  Left = 236
                  Top = 341
                  Width = 88
                  Height = 21
                  Anchors = [akLeft, akBottom]
                  TabOrder = 4
                end
                object cbCausas: TRxCheckListBox
                  Left = 9
                  Top = 51
                  Width = 488
                  Height = 134
                  CheckKind = ckCheckMarks
                  AutoScroll = False
                  Columns = 2
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  TabOrder = 0
                  InternalVersion = 202
                end
              end
            end
          end
        end
      end
    end
    object btnAplicar: TButton
      Left = 538
      Top = 454
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'A&plicar'
      TabOrder = 3
      OnClick = btnAplicarClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ae_id, ae_notasp, ae_programa, ae_idoperativo, ae_dotacio' +
        'n, ae_cuit,'
      
        '       ae_programaempresa, ae_tipoestablecimiento, ae_nroestable' +
        'cimiento,'
      
        '       ae_dotacionestablecimiento, ae_lugardeocurrencia, ae_frec' +
        'epcionobra,'
      
        '       ae_finicioactividad, ae_superficie, ae_plantas, ae_tipoob' +
        'ra,'
      
        '       ae_actividadobra, ae_etapaobra, ae_programaaprobado, co_c' +
        'ontrato ae_contrato,'
      
        '       ae_programaseguridad, ae_ffinobra, ae_fsuspobra, ae_frein' +
        'icioobra,'
      '       ae_observaciones, ae_fechaaccidente, ae_tareashabituales,'
      
        '       ae_tareasaccidente, ae_descripcionaccidente, ae_hechosadi' +
        'cionales,'
      
        '       ae_fechaalta, ae_usualta, ae_fechamodif, ae_usumodif, ae_' +
        'fechabaja,'
      '       ae_usubaja, ae_otrosdatos, ae_idit, em_nombre empresa, '
      '       es_nombre establecimiento'
      '  FROM hys.pae_pramaccidenteestab'
      
        '       INNER JOIN aco_contrato ON co_contrato = art.afiliacion.g' +
        'et_contratovigente (ae_cuit, SYSDATE)'
      '       INNER JOIN aem_empresa ON em_id = co_idempresa'
      
        '       INNER JOIN aes_establecimiento ON es_contrato = co_contra' +
        'to'
      
        '                                         AND es_nroestableci = a' +
        'e_nroestablecimiento'
      ' WHERE em_cuit = ae_cuit'
      ' '
      ' '
      ' ')
    Left = 636
    Top = 3
  end
  inherited dsConsulta: TDataSource
    Left = 666
    Top = 3
  end
  inherited SortDialog: TSortDialog
    Left = 546
    Top = 3
  end
  inherited ExportDialog: TExportDialog
    Left = 576
    Top = 3
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Left = 552
    Top = 39
  end
  inherited Seguridad: TSeguridad
    Left = 726
    Top = 3
  end
  inherited FormStorage: TFormStorage
    Left = 756
    Top = 3
  end
  inherited PrintDialog: TPrintDialog
    Left = 486
    Top = 3
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
        LinkControl = tbSalir
      end>
    Left = 786
    Top = 3
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 696
    Top = 3
  end
  object sdqPSV_SEGUIMIENTOVISITA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPSV_SEGUIMIENTOVISITAAfterOpen
    SQL.Strings = (
      'SELECT   sv_id, sv_idmedidacorrectiva, sv_tipo, sv_estableci,'
      '         DECODE(sv_tipo,'
      '                '#39'V'#39', '#39'Visita'#39','
      '                '#39'C'#39', '#39'Cumplimiento'#39','
      '                '#39'I'#39', '#39'Incumplimiento'#39') tipo_visita,'
      '         sv_fecha, sv_usualta usuario, sv_usubaja, sv_fechabaja,'
      '         sv_fechaexport'
      '    FROM hys.psv_pramseguimientovisita'
      '   WHERE sv_idmedidacorrectiva = :ID'
      'ORDER BY sv_estableci, sv_id'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = sduPSV_SEGUIMIENTOVISITA
    Left = 638
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPSV_SEGUIMIENTOVISITA: TDataSource
    DataSet = sdqPSV_SEGUIMIENTOVISITA
    Left = 669
    Top = 33
  end
  object sduPSV_SEGUIMIENTOVISITA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE hys.psv_pramseguimientovisita'
      '   SET sv_tipo = :sv_tipo,'
      '       sv_fecha = :sv_fecha,'
      '       sv_fechamodif = SYSDATE,'
      '       sv_usumodif = :usuario,'
      '       sv_fechabaja = :sv_fechabaja,'
      '       sv_usubaja = :sv_usubaja,'
      '       sv_estableci = :sv_estableci'
      ' WHERE sv_id = :sv_id'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO hys.psv_pramseguimientovisita'
      
        '            (sv_id, sv_idmedidacorrectiva, sv_tipo, sv_fecha, sv' +
        '_fechaalta,'
      '             sv_usualta, sv_estableci, sv_inferida)'
      
        '     VALUES (:sv_id, :sv_idmedidacorrectiva, :sv_tipo, :sv_fecha' +
        ', SYSDATE,'
      '             :usuario, :sv_estableci, :sv_inferida)'
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM hys.psv_pramseguimientovisita'
      '      WHERE sv_id = :old_sv_id')
    Left = 697
    Top = 33
  end
  object sdqPCM_CAUSAYMEDIDA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPSV_SEGUIMIENTOVISITAAfterOpen
    SQL.Strings = (
      'SELECT   ROWNUM, dc_numero, dc_descripcion'
      '    FROM hys.pdc_pramdiagnosticocausa, hys.pcm_pramcausaymedida'
      '   WHERE cm_idmedidacorrectiva = :ID'
      '     AND cm_iddiagnosticocausa = dc_id'
      'ORDER BY ROWNUM'
      ''
      ' ')
    Left = 638
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPCM_CAUSAYMEDIDA: TDataSource
    DataSet = sdqPCM_CAUSAYMEDIDA
    Left = 669
    Top = 61
  end
  object sdqPPE_PERSONAENTREVISTADA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPSV_SEGUIMIENTOVISITAAfterOpen
    SQL.Strings = (
      
        'SELECT   pe_id, pe_idaccidenteestablecimiento, pe_tipodocumento,' +
        ' pe_cuil,'
      '         pe_documento, pe_nombre, pe_cargo, pe_fecha_entrevista,'
      
        '         pe_tipo_entrevista, pe_usualta usuario, pe_usubaja, pe_' +
        'fechabaja,'
      '         pe_fechaexport,'
      '         DECODE(pe_tipo_entrevista,'
      '                '#39'E'#39', '#39'Entrevista'#39','
      '                '#39'T'#39', '#39'Testigo'#39') tipo_entrevista,'
      '         tipodocumento.tb_descripcion descrtipodocumento'
      '    FROM ctb_tablas tipodocumento, hys.ppe_prampersentrevistada'
      '   WHERE pe_idaccidenteestablecimiento = :ID'
      '     AND tipodocumento.tb_codigo(+) = pe_tipodocumento'
      '     AND tipodocumento.tb_clave(+) = '#39'TDOCN'#39
      'ORDER BY pe_id')
    UpdateObject = sduPPE_PERSONAENTREVISTADA
    Left = 732
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPPE_PERSONAENTREVISTADA: TDataSource
    DataSet = sdqPPE_PERSONAENTREVISTADA
    Left = 760
    Top = 33
  end
  object sduPPE_PERSONAENTREVISTADA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE hys.ppe_prampersentrevistada'
      '   SET pe_tipodocumento = :pe_tipodocumento,'
      '       pe_documento = :pe_documento,'
      '       pe_cuil = :pe_cuil,'
      '       pe_nombre = :pe_nombre,'
      '       pe_cargo = :pe_cargo,'
      '       pe_fecha_entrevista = :pe_fecha_entrevista,'
      '       pe_tipo_entrevista = :pe_tipo_entrevista,'
      '       pe_fechamodif = SYSDATE,'
      '       pe_usumodif = :usuario,'
      '       pe_fechabaja = :pe_fechabaja,'
      '       pe_usubaja = :pe_usubaja'
      ' WHERE pe_id = :pe_id'
      ''
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO hys.ppe_prampersentrevistada'
      
        '            (pe_id, pe_idaccidenteestablecimiento, pe_tipodocume' +
        'nto,'
      '             pe_documento, pe_cuil, pe_nombre, pe_cargo,'
      
        '             pe_fecha_entrevista, pe_tipo_entrevista, pe_fechaal' +
        'ta, pe_usualta)'
      
        '     VALUES (:pe_id, :pe_idaccidenteestablecimiento, :pe_tipodoc' +
        'umento,'
      '             :pe_documento, :pe_cuil, :pe_nombre, :pe_cargo,'
      
        '             :pe_fecha_entrevista, :pe_tipo_entrevista, SYSDATE,' +
        ' :usuario)')
    DeleteSQL.Strings = (
      'DELETE FROM hys.ppe_prampersentrevistada'
      '      WHERE pe_id = :old_pe_id'
      
        '        AND pe_idaccidenteestablecimiento = :old_pe_idaccidentee' +
        'stablecimiento')
    Left = 788
    Top = 33
  end
  object sduPDC_DIAGNOSTICOCAUSA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE hys.pdc_pramdiagnosticocausa'
      '   SET dc_descripcion = :dc_descripcion,'
      '       dc_fechamodif = SYSDATE,'
      '       dc_usumodif = :usuario,'
      '       dc_fechabaja = :dc_fechabaja,'
      '       dc_usubaja = :dc_usubaja'
      ' WHERE dc_id = :dc_id'
      ''
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO hys.pdc_pramdiagnosticocausa'
      '            (dc_id, dc_idaccidenteestablecimiento, dc_numero,'
      '             dc_descripcion, dc_fechaalta, dc_usualta)'
      '     VALUES (:dc_id, :dc_idaccidenteestablecimiento, :dc_numero,'
      '             :dc_descripcion, SYSDATE, :usuario)')
    DeleteSQL.Strings = (
      'DELETE FROM hys.pdc_pramdiagnosticocausa'
      '      WHERE dc_id = :old_dc_id')
    Left = 788
    Top = 61
  end
  object dsPDC_DIAGNOSTICOCAUSA: TDataSource
    DataSet = sdqPDC_DIAGNOSTICOCAUSA
    Left = 760
    Top = 61
  end
  object sdqPDC_DIAGNOSTICOCAUSA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPSV_SEGUIMIENTOVISITAAfterOpen
    SQL.Strings = (
      
        'SELECT   dc_id, dc_idaccidenteestablecimiento, dc_numero, dc_des' +
        'cripcion,'
      
        '         dc_usualta usuario, dc_usubaja, dc_fechabaja, dc_fechae' +
        'xport'
      '    FROM hys.pdc_pramdiagnosticocausa'
      '   WHERE dc_idaccidenteestablecimiento = :ID'
      'ORDER BY dc_numero'
      ''
      '')
    UpdateObject = sduPDC_DIAGNOSTICOCAUSA
    Left = 732
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqPMC_MEDIDACORRECTIVA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPSV_SEGUIMIENTOVISITAAfterOpen
    AfterScroll = sdqPMC_MEDIDACORRECTIVAAfterScroll
    SQL.Strings = (
      
        'SELECT   mc_id, mc_idaccidenteestablecimiento, mc_medida, mc_fec' +
        'haejecucion,'
      
        '         mc_fechaverificacion, mc_descripcion, mc_usualta usuari' +
        'o, mc_usubaja,'
      '         mc_fechabaja, mc_fechaexport'
      '    FROM hys.pmc_prammedidacorrectiva'
      '   WHERE mc_idaccidenteestablecimiento = :ID'
      'ORDER BY mc_medida'
      '')
    UpdateObject = sduPMC_MEDIDACORRECTIVA
    Left = 732
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPMC_MEDIDACORRECTIVA: TDataSource
    DataSet = sdqPMC_MEDIDACORRECTIVA
    Left = 760
    Top = 89
  end
  object sduPMC_MEDIDACORRECTIVA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE hys.pmc_prammedidacorrectiva'
      '   SET mc_descripcion = :mc_descripcion,'
      '       mc_fechaejecucion = :mc_fechaejecucion,'
      '       mc_fechaverificacion = :mc_fechaverificacion,'
      '       mc_fechamodif = SYSDATE,'
      '       mc_usumodif = :usuario,'
      '       mc_fechabaja = :mc_fechabaja,'
      '       mc_usubaja = :mc_usubaja'
      ' WHERE mc_id = :mc_id'
      ''
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO hys.pmc_prammedidacorrectiva'
      '            (mc_id, mc_idaccidenteestablecimiento, mc_medida,'
      
        '             mc_descripcion, mc_fechaejecucion, mc_fechaverifica' +
        'cion,'
      '             mc_fechaalta, mc_usualta)'
      '     VALUES (:mc_id, :mc_idaccidenteestablecimiento, :mc_medida,'
      
        '             :mc_descripcion, :mc_fechaejecucion, :mc_fechaverif' +
        'icacion,'
      '             SYSDATE, :usuario)')
    DeleteSQL.Strings = (
      'DELETE FROM hys.pmc_prammedidacorrectiva'
      '      WHERE mc_id = :old_mc_id'
      '')
    Left = 788
    Top = 89
  end
  object memTrabajadores: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CUIL'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BAJA'
        DataType = ftString
        Size = 1
      end>
    Left = 640
    Top = 92
  end
  object dsTrabajadores: TDataSource
    DataSet = memTrabajadores
    Left = 672
    Top = 93
  end
  object sdqTrabajadores: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT pt_cuil cuil, pt_nombre nombre, '#39'N'#39' baja'
      '  FROM hys.ppt_pramtrabajador'
      ' WHERE pt_idpramaccidenteestab = :id')
    Left = 702
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqVisitasAfterScroll
    Left = 190
    Top = 584
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 220
    Top = 584
  end
  object sdqMotivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        '  SELECT ROWNUM motivo, mo_descripcion descripcion, mo_codigo, v' +
        'm_fechabaja'
      '    FROM hys.hvm_visitamotivo, art.pmo_motivos'
      '   WHERE mo_codigo(+) = vm_idmotivo'
      '     AND vm_idvisita = :rv_id'
      '')
    Left = 130
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rv_id'
        ParamType = ptInput
      end>
  end
  object SortDialog2: TSortDialog
    Caption = 'Orden'
    DataSet = sdqVisitas
    SortFields = <
      item
        Title = 'Visita'
        DataField = 'rv_id'
        FieldIndex = 0
      end
      item
        Title = 'Visita Asoc.'
        DataField = 'rv_idvisitaasociada'
        FieldIndex = 1
      end
      item
        Title = 'Estab.'
        DataField = 'estvisitaasoc'
        FieldIndex = 2
      end
      item
        Title = 'Fecha'
        DataField = 'rv_fecha'
        FieldIndex = 3
      end
      item
        Title = 'Preventor'
        DataField = 'it_nombre'
        FieldIndex = 4
      end
      item
        Title = 'Operativo'
        DataField = 'rv_operativo'
        FieldIndex = 5
      end
      item
        Title = 'Tipo Empresa'
        DataField = 'rv_tipo'
        FieldIndex = 6
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 606
    Top = 36
  end
  object sdqDomicEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT dc_calle calle, dc_numero numero,'
      '       dc_piso piso, dc_departamento departamento,'
      '       dc_localidad localidad, dc_cpostal cpostal,'
      '       dc_cpostala cpostala, pv_descripcion provincia,'
      
        '       TRIM(dc_codareatelefonos || '#39' '#39' || dc_telefonos) telefono' +
        's'
      '  FROM afi.adc_domiciliocontrato '
      '       LEFT JOIN cpv_provincias ON pv_codigo = dc_provincia'
      ' WHERE dc_contrato = :pcontrato'
      '   AND dc_tipo = '#39'L'#39)
    Left = 97
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcontrato'
        ParamType = ptInput
      end>
  end
  object qryCausas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT dc_descripcion,'
      '       NVL2((SELECT cm_idmedidacorrectiva'
      '               FROM hys.pcm_pramcausaymedida'
      '              WHERE cm_iddiagnosticocausa = dc_id'
      '                AND cm_idmedidacorrectiva = :pidmc),'
      '            dc_id + 10000, dc_id) checked'
      '  FROM hys.pdc_pramdiagnosticocausa c'
      ' WHERE c.dc_idaccidenteestablecimiento = :pidacc'
      '   AND dc_fechabaja IS NULL')
    Left = 313
    Top = 587
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidmc'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidacc'
        ParamType = ptInput
      end>
  end
  object sdqNoVisitados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'selct 1 from dual')
    Left = 344
    Top = 588
  end
  object dsNoVisitados: TDataSource
    DataSet = sdqNoVisitados
    Left = 374
    Top = 587
  end
end
