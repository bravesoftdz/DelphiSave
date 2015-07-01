inherited frmInfInvestigacionEnfermedades: TfrmInfInvestigacionEnfermedades
  Left = 292
  Top = 261
  Caption = 'Informe de Investigaci'#243'n de Enfermedades Profesionales'
  ClientHeight = 571
  ClientWidth = 790
  OldCreateOrder = True
  OnMouseWheel = FSFormMouseWheel
  ExplicitWidth = 798
  ExplicitHeight = 598
  DesignSize = (
    790
    571)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 790
    Height = 25
    ExplicitWidth = 790
    ExplicitHeight = 25
    object lbCUIT: TLabel
      Left = 8
      Top = 4
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    inline fraTrabajadorSinGraveBusq: TfraTrabajadorSiniestro_D5
      Left = 36
      Top = 0
      Width = 772
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 36
      ExplicitWidth = 772
      ExplicitHeight = 21
      DesignSize = (
        772
        21)
      inherited lbSiniestro: TLabel
        Left = 512
        ExplicitLeft = 512
      end
      inherited mskCUIL: TMaskEdit
        Left = 8
        ExplicitLeft = 8
      end
      inherited cmbNombre: TArtComboBox
        Left = 92
        Width = 409
        Columns = <
          item
            Expanded = False
            FieldName = 'EX_SINIESTRO'
            Title.Caption = 'Siniestro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_RECAIDA'
            Title.Caption = 'Recaida'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Apellido y Nombre'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Caption = 'Contrato'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EM_CUIT'
            Title.Caption = 'CUIT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ES_NROESTABLECI'
            Title.Caption = 'Estab.'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ES_NOMBRE'
            Title.Caption = 'Nombre'
            Width = 180
            Visible = True
          end>
        DataSource = nil
        ExplicitLeft = 92
        ExplicitWidth = 409
      end
      inherited edSiniestro: TSinEdit
        Left = 560
        Width = 82
        ViewStyle = [etSiniestro, etOrden]
        OnSelect = fraTrabajadorSinGraveBusqedSiniestroSelect
        ExplicitLeft = 560
        ExplicitWidth = 82
      end
      inherited sdqDatos: TSDQuery
        Left = 24
        Top = 65356
      end
      inherited dsDatos: TDataSource
        Left = 52
        Top = 65356
      end
    end
  end
  inherited pnlDatos: TPanel [1]
    Top = 54
    Width = 790
    Height = 517
    Align = alClient
    ExplicitTop = 54
    ExplicitWidth = 790
    ExplicitHeight = 517
    object pcDatos: TPageControl
      Left = 0
      Top = 0
      Width = 790
      Height = 476
      ActivePage = tsMedidasSeguim
      Align = alClient
      TabOrder = 0
      OnChange = pcDatosChange
      object tsDatosSiniestro: TTabSheet
        Caption = 'Datos del Siniestro'
        object ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 782
          Height = 448
          HorzScrollBar.Range = 268
          HorzScrollBar.Smooth = True
          VertScrollBar.Range = 1730
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          DesignSize = (
            762
            444)
          object lbPrograma: TLabel
            Left = 8
            Top = 416
            Width = 45
            Height = 13
            Caption = 'Programa'
          end
          object Operativo: TLabel
            Left = 8
            Top = 444
            Width = 46
            Height = 13
            Caption = 'Operativo'
          end
          object Label7: TLabel
            Left = 8
            Top = 9
            Width = 195
            Height = 13
            Caption = 'Datos del Trabajador Accidentado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel3: TBevel
            Left = 6
            Top = 26
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object lbObservaciones: TLabel
            Left = 8
            Top = 931
            Width = 56
            Height = 13
            Caption = 'Otros Datos'
          end
          object btnTop: TSpeedButton
            Left = 736
            Top = 1607
            Width = 23
            Height = 22
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
          end
          object lbSiniestro: TLabel
            Left = 8
            Top = 39
            Width = 40
            Height = 13
            Caption = 'Siniestro'
            FocusControl = edSiniestro
          end
          object Bevel6: TBevel
            Left = 6
            Top = 62
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label16: TLabel
            Left = 374
            Top = 104
            Width = 62
            Height = 13
            Caption = 'Nacionalidad'
          end
          object Label17: TLabel
            Left = 207
            Top = 104
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label18: TLabel
            Left = 8
            Top = 104
            Width = 86
            Height = 13
            Caption = 'Fecha Nacimiento'
          end
          object Label19: TLabel
            Left = 8
            Top = 75
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          object lbCA: TLabel
            Left = 8
            Top = 188
            Width = 47
            Height = 13
            Caption = 'C'#243'd. Area'
          end
          object lbTel: TLabel
            Left = 170
            Top = 188
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object lbTarea: TLabel
            Left = 8
            Top = 216
            Width = 52
            Height = 13
            Caption = 'Ocupaci'#243'n'
          end
          object lbActividad: TLabel
            Left = 485
            Top = 217
            Width = 26
            Height = 13
            Caption = 'CIUO'
          end
          object Label20: TLabel
            Left = 8
            Top = 244
            Width = 47
            Height = 13
            Caption = 'F. Ingreso'
          end
          object Label25: TLabel
            Left = 207
            Top = 244
            Width = 79
            Height = 13
            Caption = 'Tipo de Contrato'
          end
          object Label21: TLabel
            Left = 8
            Top = 274
            Width = 118
            Height = 13
            Caption = 'Datos del Empleador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel7: TBevel
            Left = 6
            Top = 291
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label22: TLabel
            Left = 8
            Top = 305
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label23: TLabel
            Left = 8
            Top = 390
            Width = 47
            Height = 13
            Caption = 'C'#243'd. Area'
          end
          object Label24: TLabel
            Left = 170
            Top = 390
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object Label26: TLabel
            Left = 8
            Top = 472
            Width = 21
            Height = 13
            Caption = 'CIIU'
          end
          object Label27: TLabel
            Left = 8
            Top = 498
            Width = 43
            Height = 13
            Caption = 'Dotaci'#243'n'
          end
          object Label32: TLabel
            Left = 8
            Top = 526
            Width = 397
            Height = 13
            Caption = 
              'Datos del Lugar y Centro de Trabajo donde se ha dado la enfermed' +
              'ad'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel9: TBevel
            Left = 4
            Top = 543
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label33: TLabel
            Left = 609
            Top = 557
            Width = 25
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CUIT'
            FocusControl = fraTrabajadorSinGraveBusq.mskCUIL
          end
          object Label34: TLabel
            Left = 8
            Top = 557
            Width = 63
            Height = 13
            Caption = 'Raz'#243'n Social'
          end
          object Label35: TLabel
            Left = 8
            Top = 583
            Width = 21
            Height = 13
            Caption = 'CIIU'
          end
          object Label36: TLabel
            Left = 8
            Top = 666
            Width = 47
            Height = 13
            Caption = 'C'#243'd. Area'
          end
          object Label37: TLabel
            Left = 170
            Top = 666
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object Label38: TLabel
            Left = 435
            Top = 666
            Width = 22
            Height = 13
            Caption = 'ART'
          end
          object Label39: TLabel
            Left = 8
            Top = 693
            Width = 45
            Height = 13
            Caption = 'Programa'
          end
          object Label40: TLabel
            Left = 8
            Top = 721
            Width = 46
            Height = 13
            Caption = 'Operativo'
          end
          object Label41: TLabel
            Left = 483
            Top = 756
            Width = 43
            Height = 13
            Caption = 'Dotaci'#243'n'
          end
          object Label42: TLabel
            Left = 326
            Top = 756
            Width = 82
            Height = 13
            Caption = 'Nro. de Establec.'
          end
          object Label43: TLabel
            Left = 8
            Top = 788
            Width = 97
            Height = 13
            Caption = 'Lugar de Ocurrencia'
          end
          object Label44: TLabel
            Left = 386
            Top = 788
            Width = 79
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Recepc. Obra'
          end
          object Label45: TLabel
            Left = 565
            Top = 788
            Width = 67
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Inicio Activ.'
          end
          object Label48: TLabel
            Left = 8
            Top = 816
            Width = 47
            Height = 13
            Caption = 'Superficie'
          end
          object Label46: TLabel
            Left = 205
            Top = 816
            Width = 58
            Height = 13
            Caption = 'Nro. Plantas'
          end
          object Label47: TLabel
            Left = 316
            Top = 816
            Width = 62
            Height = 13
            Caption = 'Tipo de Obra'
          end
          object Label49: TLabel
            Left = 8
            Top = 844
            Width = 89
            Height = 13
            Caption = 'Activ. a Desarrollar'
          end
          object Label50: TLabel
            Left = 397
            Top = 844
            Width = 54
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Etapa Obra'
          end
          object Label51: TLabel
            Left = 136
            Top = 873
            Width = 79
            Height = 13
            Caption = 'Progr. Seguridad'
          end
          object Label52: TLabel
            Left = 8
            Top = 898
            Width = 99
            Height = 26
            Caption = 'F. Fin de la Actividad de la Obra'
            WordWrap = True
          end
          object Label53: TLabel
            Left = 208
            Top = 902
            Width = 65
            Height = 13
            Caption = 'F. Susp. Obra'
          end
          object Label54: TLabel
            Left = 378
            Top = 902
            Width = 76
            Height = 13
            Caption = 'F. Reinicio Obra'
          end
          object Label55: TLabel
            Left = 8
            Top = 1019
            Width = 137
            Height = 13
            Caption = 'Datos de la Enfermedad'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel10: TBevel
            Left = 4
            Top = 1036
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label56: TLabel
            Left = 191
            Top = 1080
            Width = 68
            Height = 13
            Caption = 'Horario Desde'
          end
          object Label57: TLabel
            Left = 344
            Top = 1080
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object Label58: TLabel
            Left = 8
            Top = 1131
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object Label59: TLabel
            Left = 235
            Top = 1051
            Width = 23
            Height = 13
            Caption = 'Hora'
            Visible = False
          end
          object Label60: TLabel
            Left = 8
            Top = 1109
            Width = 86
            Height = 13
            Caption = 'Tareas Habituales'
          end
          object Label61: TLabel
            Left = 8
            Top = 1188
            Width = 94
            Height = 26
            Caption = 'Tareas al Momento de la Enfermedad'
            WordWrap = True
          end
          object Label62: TLabel
            Left = 8
            Top = 1267
            Width = 117
            Height = 13
            Caption = 'Descr. de la Enfermedad'
          end
          object Label63: TLabel
            Left = 8
            Top = 1347
            Width = 37
            Height = 13
            Caption = 'Hechos'
          end
          object Bevel1: TBevel
            Left = 0
            Top = 1559
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label2: TLabel
            Left = 4
            Top = 1542
            Width = 333
            Height = 13
            Caption = '(45) Responsable de los Datos contenidos en este Informe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 4
            Top = 1566
            Width = 46
            Height = 13
            Caption = 'Preventor'
          end
          object Label4: TLabel
            Left = 537
            Top = 1566
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'T'#237'tulo'
          end
          object Label5: TLabel
            Left = 4
            Top = 1612
            Width = 84
            Height = 13
            Caption = 'Tipo de Matr'#237'cula'
          end
          object Label6: TLabel
            Left = 541
            Top = 1612
            Width = 83
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Nro. de Matr'#237'cula'
          end
          object Label12: TLabel
            Left = 4
            Top = 1638
            Width = 98
            Height = 13
            Caption = 'Instituci'#243'n Otorgante'
          end
          object Label13: TLabel
            Left = 541
            Top = 1638
            Width = 75
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Investigaci'#243'n'
          end
          object Label66: TLabel
            Left = 4
            Top = 1431
            Width = 251
            Height = 13
            Caption = '(44) Observaciones/Otros Datos del Informe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel11: TBevel
            Left = 0
            Top = 1448
            Width = 729
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object SpeedButton1: TSpeedButton
            Left = 428
            Top = 520
            Width = 23
            Height = 22
            Hint = 'Copiar del empleador'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330FFFFF
              FFF03333337F3FFFF3F73333330F0000F0F03333337F777737373333330FFFFF
              FFF033FFFF7FFF33FFF77000000007F00000377777777FF777770BBBBBBBB0F0
              FF037777777777F7F3730B77777BB0F0F0337777777777F7F7330B7FFFFFB0F0
              0333777F333377F77F330B7FFFFFB0009333777F333377777FF30B7FFFFFB039
              9933777F333377F777FF0B7FFFFFB0999993777F33337777777F0B7FFFFFB999
              9999777F3333777777770B7FFFFFB0399933777FFFFF77F777F3070077007039
              99337777777777F777F30B770077B039993377FFFFFF77F777330BB7007BB999
              93337777FF777777733370000000073333333777777773333333}
            NumGlyphs = 2
            OnClick = SpeedButton1Click
          end
          object Label69: TLabel
            Left = 329
            Top = 1566
            Width = 62
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Responsable'
          end
          inline fraEE_PROGRAMA: TfraStaticCTB_TABLAS
            Left = 112
            Top = 412
            Width = 619
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 17
            ExplicitLeft = 112
            ExplicitTop = 412
            ExplicitWidth = 619
            DesignSize = (
              619
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 31
              Width = 584
              ExplicitLeft = 31
              ExplicitWidth = 584
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
          inline fraEE_IDOPERATIVO: TfraStaticCodigoDescripcion
            Left = 112
            Top = 440
            Width = 617
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 18
            ExplicitLeft = 112
            ExplicitTop = 440
            ExplicitWidth = 617
            DesignSize = (
              617
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              MaxLength = 6
              Pattern = '0123456789'
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 556
              ExplicitLeft = 59
              ExplicitWidth = 556
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
          object edEE_DOTACION: TIntEdit
            Left = 113
            Top = 495
            Width = 56
            Height = 21
            TabOrder = 20
            MaxLength = 6
            MaxValue = 999999
          end
          object edEE_OBSERVACIONES: TMemo
            Left = 113
            Top = 928
            Width = 610
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 46
          end
          object edSiniestro: TSinEdit
            Left = 113
            Top = 35
            Width = 82
            Height = 21
            Hint = 'C'#243'digo de Siniestro '
            OnExit = edSiniestroExit
            TabOrder = 0
            ViewStyle = [etSiniestro, etOrden]
          end
          inline fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion
            Left = 440
            Top = 99
            Width = 156
            Height = 23
            TabOrder = 4
            ExplicitLeft = 440
            ExplicitTop = 99
            ExplicitWidth = 156
            DesignSize = (
              156
              23)
            inherited edCodigo: TPatternEdit
              Width = 22
              ExplicitWidth = 22
            end
            inherited cmbDescripcion: TComboGrid
              Left = 26
              Width = 93
              ExplicitLeft = 26
              ExplicitWidth = 93
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
          inline fraTJ_SEXO: TfraStaticCTB_TABLAS
            Left = 236
            Top = 99
            Width = 135
            Height = 23
            TabOrder = 3
            ExplicitLeft = 236
            ExplicitTop = 99
            ExplicitWidth = 135
            DesignSize = (
              135
              23)
            inherited edCodigo: TPatternEdit
              Width = 22
              ExplicitWidth = 22
            end
            inherited cmbDescripcion: TComboGrid
              Left = 26
              Width = 71
              ExplicitLeft = 26
              ExplicitWidth = 71
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
          object cmbTJ_FNACIMIENTO: TDateComboBox
            Left = 113
            Top = 100
            Width = 88
            Height = 21
            TabOrder = 2
          end
          inline fraTrabajador: TfraTrabajador
            Left = 113
            Top = 72
            Width = 616
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnExit = fraTrabajadorExit
            ExplicitLeft = 113
            ExplicitTop = 72
            ExplicitWidth = 616
            DesignSize = (
              616
              22)
            inherited cmbNombre: TArtComboBox
              Width = 532
              DataSource = nil
              ExplicitWidth = 532
            end
            inherited sdqDatos: TSDQuery
              Left = 24
              Top = 65356
            end
            inherited dsDatos: TDataSource
              Left = 52
              Top = 65356
            end
          end
          inline fraDomicilioTrabaj: TfraDomicilioTrab
            Left = 8
            Top = 129
            Width = 719
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            ExplicitLeft = 8
            ExplicitTop = 129
            ExplicitWidth = 719
            DesignSize = (
              719
              50)
            inherited lbNro: TLabel
              Left = 504
              ExplicitLeft = 504
            end
            inherited lbPiso: TLabel
              Left = 576
              Width = 20
              ExplicitLeft = 576
              ExplicitWidth = 20
            end
            inherited lbDto: TLabel
              Left = 652
              Width = 20
              ExplicitLeft = 652
              ExplicitWidth = 20
            end
            inherited lbCPostal: TLabel
              Width = 39
              ExplicitWidth = 39
            end
            inherited lbCPA: TLabel
              Left = 160
              Width = 21
              ExplicitLeft = 160
              ExplicitWidth = 21
            end
            inherited lbLocalidad: TLabel
              Left = 248
              Width = 46
              ExplicitLeft = 248
              ExplicitWidth = 46
            end
            inherited lbProvincia: TLabel
              Left = 557
              Width = 44
              ExplicitLeft = 557
              ExplicitWidth = 44
            end
            inherited cmbCalle: TArtComboBox
              Left = 105
              Width = 392
              DataSource = nil
              ExplicitLeft = 105
              ExplicitWidth = 392
            end
            inherited edNumero: TEdit
              Left = 526
              ExplicitLeft = 526
            end
            inherited edPiso: TEdit
              Left = 602
              ExplicitLeft = 602
            end
            inherited edDto: TEdit
              Left = 674
              ExplicitLeft = 674
            end
            inherited edCPostal: TIntEdit
              Left = 105
              ExplicitLeft = 105
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 301
              Width = 305
              DataSource = nil
              ExplicitLeft = 301
              ExplicitWidth = 305
            end
            inherited edProvincia: TEdit
              Left = 606
              ExplicitLeft = 606
            end
            inherited edCPA: TPatternEdit
              Left = 186
              ExplicitLeft = 186
            end
            inherited sdqLocalidad: TSDQuery
              Left = 28
              Top = 65392
            end
            inherited dsLocalidad: TDataSource
              Left = 56
              Top = 65392
            end
          end
          object edTJ_CODAREATELEFONO: TPatternEdit
            Left = 113
            Top = 184
            Width = 50
            Height = 21
            MaxLength = 4
            TabOrder = 7
            Pattern = '0123456789'
          end
          object edTJ_TELEFONO: TPatternEdit
            Left = 194
            Top = 184
            Width = 232
            Height = 21
            MaxLength = 30
            TabOrder = 8
            Pattern = ' 0123456789()-/'
          end
          object edRL_TAREA: TEdit
            Left = 113
            Top = 212
            Width = 364
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 150
            TabOrder = 9
          end
          object cmbRL_FECHAINGRESO: TDateComboBox
            Left = 113
            Top = 240
            Width = 88
            Height = 21
            TabOrder = 11
          end
          inline fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion
            Left = 291
            Top = 240
            Width = 262
            Height = 23
            TabOrder = 12
            ExplicitLeft = 291
            ExplicitTop = 240
            ExplicitWidth = 262
            DesignSize = (
              262
              23)
            inherited edCodigo: TPatternEdit
              Width = 30
              ExplicitWidth = 30
            end
            inherited cmbDescripcion: TComboGrid
              Left = 34
              Width = 199
              ExplicitLeft = 34
              ExplicitWidth = 199
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
          inline fraRL_CIUO: TfraStaticCodigoDescripcion
            Left = 516
            Top = 212
            Width = 214
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
            ExplicitLeft = 516
            ExplicitTop = 212
            ExplicitWidth = 214
            DesignSize = (
              214
              23)
            inherited edCodigo: TPatternEdit
              Width = 30
              ExplicitWidth = 30
            end
            inherited cmbDescripcion: TComboGrid
              Left = 34
              Width = 151
              CharCase = ecUpperCase
              ExplicitLeft = 34
              ExplicitWidth = 151
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
          inline fraEmpresa: TfraEmpresa
            Left = 113
            Top = 302
            Width = 615
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
            TabOrder = 13
            ExplicitLeft = 113
            ExplicitTop = 302
            ExplicitWidth = 615
            ExplicitHeight = 21
            DesignSize = (
              615
              21)
            inherited lbContrato: TLabel
              Left = 511
              ExplicitLeft = 511
            end
            inherited edContrato: TIntEdit
              Left = 558
              ExplicitLeft = 558
            end
            inherited cmbRSocial: TArtComboBox
              Width = 376
              DataSource = nil
              ExplicitWidth = 376
            end
            inherited sdqDatos: TSDQuery
              Left = 24
              Top = 65356
            end
            inherited dsDatos: TDataSource
              Left = 52
              Top = 65356
            end
          end
          object edDC_CODAREATELEFONOS: TPatternEdit
            Left = 113
            Top = 386
            Width = 50
            Height = 21
            MaxLength = 4
            TabOrder = 15
            Pattern = '0123456789'
          end
          object edDC_TELEFONOS: TPatternEdit
            Left = 194
            Top = 386
            Width = 232
            Height = 21
            MaxLength = 30
            TabOrder = 16
            Pattern = ' 0123456789()-/'
          end
          inline fraDomicilioEmpresa: TfraDomicilioTrab
            Left = 9
            Top = 330
            Width = 719
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 14
            ExplicitLeft = 9
            ExplicitTop = 330
            ExplicitWidth = 719
            DesignSize = (
              719
              50)
            inherited lbNro: TLabel
              Left = 504
              ExplicitLeft = 504
            end
            inherited lbPiso: TLabel
              Left = 576
              Width = 20
              ExplicitLeft = 576
              ExplicitWidth = 20
            end
            inherited lbDto: TLabel
              Left = 652
              Width = 20
              ExplicitLeft = 652
              ExplicitWidth = 20
            end
            inherited lbCPostal: TLabel
              Width = 39
              ExplicitWidth = 39
            end
            inherited lbCPA: TLabel
              Left = 160
              Width = 21
              ExplicitLeft = 160
              ExplicitWidth = 21
            end
            inherited lbLocalidad: TLabel
              Left = 248
              Width = 46
              ExplicitLeft = 248
              ExplicitWidth = 46
            end
            inherited lbProvincia: TLabel
              Left = 557
              Width = 44
              ExplicitLeft = 557
              ExplicitWidth = 44
            end
            inherited cmbCalle: TArtComboBox
              Left = 104
              Width = 389
              DataSource = nil
              ExplicitLeft = 104
              ExplicitWidth = 389
            end
            inherited edNumero: TEdit
              Left = 526
              ExplicitLeft = 526
            end
            inherited edPiso: TEdit
              Left = 602
              ExplicitLeft = 602
            end
            inherited edDto: TEdit
              Left = 674
              ExplicitLeft = 674
            end
            inherited edCPostal: TIntEdit
              Left = 104
              ExplicitLeft = 104
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 301
              Width = 305
              DataSource = nil
              ExplicitLeft = 301
              ExplicitWidth = 305
            end
            inherited edProvincia: TEdit
              Left = 606
              ExplicitLeft = 606
            end
            inherited edCPA: TPatternEdit
              Left = 186
              TabStop = True
              ExplicitLeft = 186
            end
            inherited sdqLocalidad: TSDQuery
              Left = 28
              Top = 65392
            end
            inherited dsLocalidad: TDataSource
              Left = 56
              Top = 65392
            end
          end
          inline fraCO_IDACTIVIDAD: TfraStaticCodigoDescripcion
            Left = 112
            Top = 467
            Width = 619
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 19
            ExplicitLeft = 112
            ExplicitTop = 467
            ExplicitWidth = 619
            DesignSize = (
              619
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 556
              ExplicitLeft = 59
              ExplicitWidth = 556
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
          object mskEE_CUIT: TMaskEdit
            Left = 641
            Top = 553
            Width = 81
            Height = 21
            Hint = 'CUIL del Trabajador'
            Anchors = [akTop, akRight]
            EditMask = '99-99999999-c;0;'
            MaxLength = 13
            TabOrder = 22
          end
          object edEE_EMPRESA: TPatternEdit
            Left = 113
            Top = 553
            Width = 484
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 60
            TabOrder = 21
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          inline fraEE_IDACTIVIDAD: TfraStaticCodigoDescripcion
            Left = 112
            Top = 578
            Width = 619
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 23
            ExplicitLeft = 112
            ExplicitTop = 578
            ExplicitWidth = 619
            DesignSize = (
              619
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 552
              ExplicitLeft = 59
              ExplicitWidth = 552
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
          inline fraDomicilioEnfermedadEstabl: TfraDomicilioTrab
            Left = 9
            Top = 606
            Width = 717
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 24
            ExplicitLeft = 9
            ExplicitTop = 606
            ExplicitWidth = 717
            DesignSize = (
              717
              50)
            inherited lbNro: TLabel
              Left = 502
              ExplicitLeft = 502
            end
            inherited lbPiso: TLabel
              Left = 574
              Width = 20
              ExplicitLeft = 574
              ExplicitWidth = 20
            end
            inherited lbDto: TLabel
              Left = 650
              Width = 20
              ExplicitLeft = 650
              ExplicitWidth = 20
            end
            inherited lbCPostal: TLabel
              Width = 39
              ExplicitWidth = 39
            end
            inherited lbCPA: TLabel
              Left = 160
              Width = 21
              ExplicitLeft = 160
              ExplicitWidth = 21
            end
            inherited lbLocalidad: TLabel
              Left = 248
              Width = 46
              ExplicitLeft = 248
              ExplicitWidth = 46
            end
            inherited lbProvincia: TLabel
              Left = 555
              Width = 44
              ExplicitLeft = 555
              ExplicitWidth = 44
            end
            inherited cmbCalle: TArtComboBox
              Left = 104
              Width = 389
              DataSource = nil
              ExplicitLeft = 104
              ExplicitWidth = 389
            end
            inherited edNumero: TEdit
              Left = 524
              ExplicitLeft = 524
            end
            inherited edPiso: TEdit
              Left = 600
              ExplicitLeft = 600
            end
            inherited edDto: TEdit
              Left = 672
              Width = 41
              ExplicitLeft = 672
              ExplicitWidth = 41
            end
            inherited edCPostal: TIntEdit
              Left = 104
              ExplicitLeft = 104
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 297
              Width = 303
              DataSource = nil
              ExplicitLeft = 297
              ExplicitWidth = 303
            end
            inherited edProvincia: TEdit
              Left = 604
              Width = 109
              ExplicitLeft = 604
              ExplicitWidth = 109
            end
            inherited edCPA: TPatternEdit
              Left = 186
              TabStop = True
              ExplicitLeft = 186
            end
            inherited sdqLocalidad: TSDQuery
              Left = 28
              Top = 65392
            end
            inherited dsLocalidad: TDataSource
              Left = 56
              Top = 65392
            end
          end
          object edCodAreaEnfermedadEstab: TPatternEdit
            Left = 113
            Top = 662
            Width = 50
            Height = 21
            MaxLength = 4
            TabOrder = 25
            Pattern = '0123456789'
          end
          object edEE_TELEFONOS: TPatternEdit
            Left = 194
            Top = 662
            Width = 232
            Height = 21
            MaxLength = 30
            TabOrder = 26
            Pattern = ' 0123456789()-/'
          end
          inline fraEE_IDART: TfraStaticCodigoDescripcion
            Left = 462
            Top = 661
            Width = 266
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 27
            ExplicitLeft = 462
            ExplicitTop = 661
            ExplicitWidth = 266
            DesignSize = (
              266
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              MaxLength = 6
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 203
              ExplicitLeft = 59
              ExplicitWidth = 203
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
          inline fraEE_PROGRAMAEMPRESA: TfraStaticCTB_TABLAS
            Left = 112
            Top = 689
            Width = 619
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 28
            ExplicitLeft = 112
            ExplicitTop = 689
            ExplicitWidth = 619
            DesignSize = (
              619
              23)
            inherited edCodigo: TPatternEdit
              Width = 50
              ExplicitWidth = 50
            end
            inherited cmbDescripcion: TComboGrid
              Left = 56
              Width = 557
              ExplicitLeft = 56
              ExplicitWidth = 557
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
          inline fraEE_IDOPERATIVOEMPRESA: TfraStaticCodigoDescripcion
            Left = 112
            Top = 717
            Width = 617
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 29
            ExplicitLeft = 112
            ExplicitTop = 717
            ExplicitWidth = 617
            DesignSize = (
              617
              23)
            inherited edCodigo: TPatternEdit
              Width = 50
              MaxLength = 6
              Pattern = '0123456789'
              ExplicitWidth = 50
            end
            inherited cmbDescripcion: TComboGrid
              Left = 56
              Width = 557
              ExplicitLeft = 56
              ExplicitWidth = 557
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
          object rgEE_TIPOESTABLECIMIENTO: TRadioGroup
            Left = 113
            Top = 742
            Width = 207
            Height = 38
            Caption = 'Tipo de Establecimiento'
            Columns = 2
            Items.Strings = (
              'Establecimiento'
              'Obra')
            TabOrder = 30
            TabStop = True
            OnClick = rgEE_TIPOESTABLECIMIENTOClick
          end
          object edEE_DOTACIONESTABLECIMIENTO: TIntEdit
            Left = 532
            Top = 753
            Width = 56
            Height = 21
            TabOrder = 32
            MaxLength = 6
            MaxValue = 999999
          end
          object edEE_NROESTABLECIMIENTO: TIntEdit
            Left = 418
            Top = 753
            Width = 56
            Height = 21
            TabOrder = 31
            MaxLength = 8
            MaxValue = 99999999
          end
          inline fraEE_LUGARDEOCURRENCIA: TfraStaticCTB_TABLAS
            Left = 112
            Top = 784
            Width = 271
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 33
            ExplicitLeft = 112
            ExplicitTop = 784
            ExplicitWidth = 271
            DesignSize = (
              271
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 207
              ExplicitLeft = 32
              ExplicitWidth = 207
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
          object edEE_FRECEPCIONOBRA: TDateComboBox
            Left = 472
            Top = 784
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 34
          end
          object edEE_FINICIOACTIVIDAD: TDateComboBox
            Left = 637
            Top = 784
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 35
          end
          object edEE_SUPERFICIE: TCurrencyEdit
            Left = 113
            Top = 813
            Width = 82
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxLength = 12
            MaxValue = 999999999.990000000000000000
            TabOrder = 36
          end
          object edEE_PLANTAS: TIntEdit
            Left = 270
            Top = 813
            Width = 34
            Height = 21
            TabOrder = 37
            MaxLength = 2
            MaxValue = 99
          end
          inline fraEE_TIPOOBRA: TfraStaticCTB_TABLAS
            Left = 384
            Top = 812
            Width = 341
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 38
            ExplicitLeft = 384
            ExplicitTop = 812
            ExplicitWidth = 341
            DesignSize = (
              341
              23)
            inherited edCodigo: TPatternEdit
              Width = 40
              ExplicitWidth = 40
            end
            inherited cmbDescripcion: TComboGrid
              Left = 48
              Width = 293
              ExplicitLeft = 48
              ExplicitWidth = 293
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
          inline fraEE_ACTIVIDADOBRA: TfraStaticCTB_TABLAS
            Left = 112
            Top = 840
            Width = 271
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 39
            ExplicitLeft = 112
            ExplicitTop = 840
            ExplicitWidth = 271
            DesignSize = (
              271
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 207
              ExplicitLeft = 32
              ExplicitWidth = 207
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
          inline fraEE_ETAPAOBRA: TfraStaticCTB_TABLAS
            Left = 455
            Top = 840
            Width = 272
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 40
            ExplicitLeft = 455
            ExplicitTop = 840
            ExplicitWidth = 272
            DesignSize = (
              272
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 239
              ExplicitLeft = 32
              ExplicitWidth = 239
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
          object chkEE_PROGRAMAAPROBADO: TCheckBox
            Left = 5
            Top = 871
            Width = 121
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Programa Aprobado'
            TabOrder = 41
          end
          inline fraEE_PROGRAMASEGURIDAD: TfraStaticCTB_TABLAS
            Left = 222
            Top = 869
            Width = 328
            Height = 23
            TabOrder = 42
            ExplicitLeft = 222
            ExplicitTop = 869
            ExplicitWidth = 328
            DesignSize = (
              328
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 293
              ExplicitLeft = 32
              ExplicitWidth = 293
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
          object edEE_FFINOBRA: TDateComboBox
            Left = 113
            Top = 899
            Width = 88
            Height = 21
            TabOrder = 43
          end
          object edEE_FSUSPOBRA: TDateComboBox
            Left = 281
            Top = 899
            Width = 88
            Height = 21
            TabOrder = 44
          end
          object edEE_FREINICIOOBRA: TDateComboBox
            Left = 460
            Top = 899
            Width = 88
            Height = 21
            TabOrder = 45
          end
          object edEX_FECHAENFERMEDAD: TDateComboBox
            Left = 133
            Top = 1047
            Width = 88
            Height = 21
            TabOrder = 47
          end
          object chkEE_TURNOROTATIVO: TCheckBox
            Left = 6
            Top = 1079
            Width = 139
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Turno Rotativo'
            TabOrder = 50
          end
          object chkEE_HORASEXTRAS: TCheckBox
            Left = 465
            Top = 1079
            Width = 83
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Horas Extras'
            TabOrder = 53
          end
          object edEX_HORAENFERMEDAD: TDateTimePicker
            Left = 266
            Top = 1048
            Width = 68
            Height = 21
            Date = 37372.500000000000000000
            Time = 37372.500000000000000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 48
            Visible = False
          end
          object edEE_HORARIODESDE: TDateTimePicker
            Left = 266
            Top = 1077
            Width = 68
            Height = 21
            Date = 37372.500000000000000000
            Time = 37372.500000000000000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 51
          end
          object edEE_HORARIOHASTA: TDateTimePicker
            Left = 377
            Top = 1077
            Width = 68
            Height = 21
            Date = 37372.500000000000000000
            Time = 37372.500000000000000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 52
          end
          object edEE_TAREASHABITUALES: TMemo
            Left = 133
            Top = 1106
            Width = 610
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 54
          end
          object edEE_TAREASENFERMEDAD: TMemo
            Left = 133
            Top = 1185
            Width = 610
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 55
          end
          object edEE_DESCRIPCIONENFERMEDAD: TMemo
            Left = 133
            Top = 1264
            Width = 610
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 3000
            TabOrder = 56
          end
          object edEE_HECHOSADICIONALES: TMemo
            Left = 133
            Top = 1344
            Width = 610
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 2000
            TabOrder = 57
          end
          object edEE_TITULO: TPatternEdit
            Left = 537
            Top = 1580
            Width = 200
            Height = 21
            Anchors = [akTop, akRight]
            MaxLength = 60
            TabOrder = 59
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          inline fraEE_TIPOMATRICULA: TfraStaticCTB_TABLAS
            Left = 108
            Top = 1608
            Width = 425
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 60
            ExplicitLeft = 108
            ExplicitTop = 1608
            ExplicitWidth = 425
            DesignSize = (
              425
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 392
              ExplicitLeft = 32
              ExplicitWidth = 392
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
          object edEE_INSTITUCIONOTORGANTE: TPatternEdit
            Left = 109
            Top = 1634
            Width = 421
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 60
            TabOrder = 62
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          object edEE_FECHA: TDateComboBox
            Left = 632
            Top = 1634
            Width = 106
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 63
          end
          object edEE_OTROSDATOS: TMemo
            Left = 125
            Top = 1460
            Width = 610
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 58
          end
          object edEE_NUMEROMATRICULA: TEdit
            Left = 632
            Top = 1609
            Width = 105
            Height = 21
            Anchors = [akTop, akRight]
            MaxLength = 15
            TabOrder = 61
          end
          object edTJ_OTRANACIONALIDAD: TEdit
            Left = 597
            Top = 100
            Width = 130
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 30
            TabOrder = 5
          end
          inline fraPreventor: TfraCodigoDescripcion
            Left = 3
            Top = 1579
            Width = 282
            Height = 23
            TabOrder = 64
            ExplicitLeft = 3
            ExplicitTop = 1579
            ExplicitWidth = 282
            DesignSize = (
              282
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 217
              CharCase = ecUpperCase
              DataSource = nil
              OnCloseUp = fraPreventorcmbDescripcionCloseUp
              OnDropDown = fraPreventorcmbDescripcionDropDown
              ExplicitWidth = 217
            end
            inherited edCodigo: TPatternEdit
              CharCase = ecNormal
            end
            inherited sdqDatos: TSDQuery
              Left = 24
              Top = 65356
            end
            inherited dsDatos: TDataSource
              Left = 52
              Top = 65356
            end
          end
          object edEE_RESPONSABLE: TPatternEdit
            Left = 329
            Top = 1580
            Width = 200
            Height = 21
            Anchors = [akTop, akRight]
            Color = clInactiveCaptionText
            Enabled = False
            MaxLength = 60
            TabOrder = 65
          end
          object cbPRAM: TCheckBox
            Left = 344
            Top = 1050
            Width = 80
            Height = 17
            Alignment = taLeftJustify
            Caption = 'PRAM'
            TabOrder = 49
          end
        end
      end
      object tsEntrevistas: TTabSheet
        Caption = 'Personas Entrevistadas/Testigos'
        ImageIndex = 1
        object dbgPPE_PERSONAENTREVISTADA: TRxDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 419
          Align = alClient
          DataSource = dsPPE_PERSONAENTREVISTADAENF
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FormStorage
          RowColor2 = 16776176
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
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = tBarPPE_PERSONAENTREVISTADA
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object tBarPPE_PERSONAENTREVISTADA: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
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
              Enabled = False
              ImageIndex = 8
              OnClick = tbPPEEliminarClick
            end
          end
        end
        object fpPPE_PERSONAENTREVISTADA: TFormPanel
          Left = 114
          Top = 64
          Width = 505
          Height = 209
          Caption = 'Personas Entrevistadas/Testigos'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderIcons = []
          Position = poScreenCenter
          ActiveControl = fraPE_TIPODOCUMENTO.edCodigo
          Constraints.MaxHeight = 209
          Constraints.MaxWidth = 505
          Constraints.MinHeight = 209
          Constraints.MinWidth = 505
          DesignSize = (
            505
            209)
          object Bevel4: TBevel
            Left = 4
            Top = 174
            Width = 497
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
            FocusControl = fraTrabajadorSinGraveBusq.mskCUIL
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
            FocusControl = fraTrabajadorSinGraveBusq.mskCUIL
          end
          object lbDocumento: TLabel
            Left = 10
            Top = 37
            Width = 55
            Height = 13
            Caption = 'Documento'
            FocusControl = fraTrabajadorSinGraveBusq.mskCUIL
          end
          object btPPEAceptar: TButton
            Left = 345
            Top = 180
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 7
            OnClick = btPPEAceptarClick
          end
          object btnPPECancelar: TButton
            Left = 424
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
            TabOrder = 2
          end
          object edPE_NOMBRE: TPatternEdit
            Left = 112
            Top = 61
            Width = 385
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 35
            TabOrder = 3
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          object edPE_CARGO: TPatternEdit
            Left = 112
            Top = 89
            Width = 385
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
            ExplicitLeft = 111
            ExplicitTop = 5
            ExplicitWidth = 291
            DesignSize = (
              291
              23)
            inherited cmbDescripcion: TComboGrid
              Width = 227
              ExplicitWidth = 227
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
      end
      object tsMedidasSeguim: TTabSheet
        Caption = 'Medidas/Seguimiento'
        ImageIndex = 2
        object pcMedidasSeguim: TPageControl
          Left = 0
          Top = 0
          Width = 782
          Height = 448
          ActivePage = tsMedidasCorrectivas
          Align = alClient
          TabOrder = 0
          OnChange = pcMedidasSeguimChange
          object tsMedidasCorrectivas: TTabSheet
            Caption = 'Medidas Correctivas'
            ImageIndex = 1
            object Splitter1: TSplitter
              Left = 525
              Top = 0
              Width = 5
              Height = 420
              Align = alRight
            end
            object pcCausasVisitas: TPageControl
              Left = 530
              Top = 0
              Width = 244
              Height = 420
              ActivePage = tsSeguimientoVisitas
              Align = alRight
              TabOrder = 0
              object tsSeguimientoVisitas: TTabSheet
                Caption = 'Visitas'
                ImageIndex = 1
                object CoolBar5: TCoolBar
                  Left = 0
                  Top = 0
                  Width = 236
                  Height = 29
                  Bands = <
                    item
                      Control = tBarPSV_SEGUIMIENTOVISITA
                      ImageIndex = -1
                      MinHeight = 27
                      Width = 230
                    end>
                  object tBarPSV_SEGUIMIENTOVISITA: TToolBar
                    Left = 9
                    Top = 0
                    Width = 223
                    Height = 27
                    BorderWidth = 1
                    Caption = 'ToolBar'
                    HotImages = frmPrincipal.ilColor
                    Images = frmPrincipal.ilByN
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    object tbPSVNuevo: TToolButton
                      Left = 0
                      Top = 0
                      Hint = 'Nuevo (Ctrl+N)'
                      ImageIndex = 6
                      OnClick = tbPSVNuevoClick
                    end
                    object tbPSVModificar: TToolButton
                      Left = 23
                      Top = 0
                      Hint = 'Modificar (Ctrl+M)'
                      Caption = 'tbPPEModificar'
                      ImageIndex = 7
                      OnClick = tbPSVModificarClick
                    end
                    object tbPSVEliminar: TToolButton
                      Left = 46
                      Top = 0
                      Hint = 'Eliminar (Cltr+Del)'
                      Enabled = False
                      ImageIndex = 8
                      OnClick = tbPSVEliminarClick
                    end
                  end
                end
                object dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid
                  Left = 0
                  Top = 29
                  Width = 236
                  Height = 363
                  Align = alClient
                  DataSource = dsPSV_SEGUIMIENTOVISITAENF
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = dbgPSV_SEGUIMIENTOVISITADblClick
                  IniStorage = FormStorage
                  RowColor2 = 16776176
                  OnGetCellParams = dbgPSV_SEGUIMIENTOVISITAGetCellParams
                  Columns = <
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
                    end>
                end
                object fpPSV_SEGUIMIENTOVISITA: TFormPanel
                  Left = 13
                  Top = 72
                  Width = 177
                  Height = 106
                  Caption = 'Visita'
                  FormWidth = 0
                  FormHeigth = 0
                  FormLeft = 0
                  FormTop = 0
                  BorderIcons = []
                  Position = poScreenCenter
                  ActiveControl = edSV_TIPO
                  Constraints.MaxHeight = 106
                  Constraints.MaxWidth = 177
                  Constraints.MinHeight = 106
                  Constraints.MinWidth = 177
                  DesignSize = (
                    177
                    106)
                  object Bevel12: TBevel
                    Left = 4
                    Top = 71
                    Width = 169
                    Height = 3
                    Anchors = [akLeft, akRight, akBottom]
                    Shape = bsTopLine
                  end
                  object Label70: TLabel
                    Left = 9
                    Top = 44
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
                  object btPSVAceptar: TButton
                    Left = 16
                    Top = 77
                    Width = 75
                    Height = 25
                    Anchors = [akRight, akBottom]
                    Caption = '&Aceptar'
                    TabOrder = 2
                    OnClick = btPSVAceptarClick
                  end
                  object btPSVCancelar: TButton
                    Left = 96
                    Top = 77
                    Width = 75
                    Height = 25
                    Anchors = [akRight, akBottom]
                    Cancel = True
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 3
                  end
                  object edSV_FECHA: TDateComboBox
                    Left = 47
                    Top = 40
                    Width = 88
                    Height = 21
                    TabOrder = 1
                  end
                  object edSV_TIPO: TExComboBox
                    Left = 47
                    Top = 10
                    Width = 104
                    Height = 22
                    Style = csOwnerDrawFixed
                    TabOrder = 0
                    Items.Strings = (
                      'V=Visita'
                      'C=Cumplimiento'
                      'I=Incumplimiento')
                    ItemIndex = -1
                    Options = []
                    ValueWidth = 64
                  end
                end
              end
            end
            object pnlMedidasCorrectivas: TPanel
              Left = 0
              Top = 0
              Width = 525
              Height = 420
              Align = alClient
              TabOrder = 1
              object CoolBar3: TCoolBar
                Left = 1
                Top = 1
                Width = 523
                Height = 29
                Bands = <
                  item
                    Control = tBarPMC_MEDIDACORRECTIVA
                    ImageIndex = -1
                    MinHeight = 27
                    Width = 517
                  end>
                object tBarPMC_MEDIDACORRECTIVA: TToolBar
                  Left = 9
                  Top = 0
                  Width = 510
                  Height = 27
                  BorderWidth = 1
                  Caption = 'ToolBar'
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
                    Enabled = False
                    ImageIndex = 8
                    OnClick = tbPMCEliminarClick
                  end
                end
              end
              object dbgPMC_MEDIDACORRECTIVA: TRxDBGrid
                Left = 1
                Top = 30
                Width = 523
                Height = 389
                Align = alClient
                DataSource = dsPMC_MEDIDACORRECTIVAENF
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = dbgPMC_MEDIDACORRECTIVADblClick
                IniStorage = FormStorage
                RowColor2 = 16776176
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
              object fpPMC_MEDIDACORRECTIVA: TFormPanel
                Left = 16
                Top = 88
                Width = 505
                Height = 261
                Caption = 'Medida Correctiva'
                FormWidth = 0
                FormHeigth = 0
                FormLeft = 0
                FormTop = 0
                BorderIcons = []
                Position = poScreenCenter
                ActiveControl = edMC_FECHAEJECUCION
                Constraints.MaxWidth = 505
                Constraints.MinHeight = 261
                Constraints.MinWidth = 505
                OnEnter = fpPMC_MEDIDACORRECTIVAEnter
                DesignSize = (
                  505
                  261)
                object Bevel5: TBevel
                  Left = 4
                  Top = 226
                  Width = 497
                  Height = 3
                  Anchors = [akLeft, akRight, akBottom]
                  Shape = bsTopLine
                end
                object Label15: TLabel
                  Left = 10
                  Top = 12
                  Width = 73
                  Height = 13
                  Caption = 'Nro. de Medida'
                end
                object Label64: TLabel
                  Left = 10
                  Top = 42
                  Width = 189
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'F. de Ejecuci'#243'n por parte del Empleador'
                end
                object Label65: TLabel
                  Left = 10
                  Top = 68
                  Width = 216
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'F. de Verificaci'#243'n por parte de la Aseguradora'
                end
                object btPMCAceptar: TButton
                  Left = 346
                  Top = 232
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Caption = '&Aceptar'
                  TabOrder = 4
                  OnClick = btPMCAceptarClick
                end
                object btPMCCancelar: TButton
                  Left = 424
                  Top = 232
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Cancel = True
                  Caption = '&Cancelar'
                  ModalResult = 2
                  TabOrder = 5
                end
                object edMC_MEDIDA: TIntEdit
                  Left = 89
                  Top = 9
                  Width = 38
                  Height = 21
                  TabOrder = 0
                  MaxLength = 0
                end
                object edMC_DESCRIPCION: TMemo
                  Left = 6
                  Top = 91
                  Width = 493
                  Height = 129
                  Anchors = [akLeft, akTop, akBottom]
                  MaxLength = 4000
                  ScrollBars = ssBoth
                  TabOrder = 3
                end
                object edMC_FECHAEJECUCION: TDateComboBox
                  Left = 236
                  Top = 38
                  Width = 88
                  Height = 21
                  TabOrder = 1
                end
                object edMC_FECHAVERIFICACION: TDateComboBox
                  Left = 236
                  Top = 65
                  Width = 88
                  Height = 21
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      object tsDatosAgentes: TTabSheet
        Caption = 'Datos Agentes'
        ImageIndex = 4
        object grdDatosAgentes: TArtDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 419
          Align = alClient
          DataSource = dsPAD_AGENTESDETECTADOS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = grdDatosAgentesDblClick
          OnGetCellParams = grdDatosAgentesGetCellParams
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'AD_ID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_PRGID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_ESOP'
              Title.Caption = 'ESOP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AD_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AD_PRESENCIAAGENTE'
              Title.Caption = 'Presencia Agente'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AD_FRECUENCIAEXPO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_DURACIONEXPO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_MEDICIONESAMB'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_NIVELCONCENTRACION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_SUPERALIMITE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_EPPADECUADOS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_CAPACITATRAB'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_ESTUDIOSERG'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_VACUNACION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSPRESENCIAAGENTE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSFRECUENCIA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSMEDAMB'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSNIVCONCENT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSLIMITELEGAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSEPP'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSCAPACIT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSESTERGO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_OBSVACU'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_EXPEDIENTE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_FECHAALTA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_USUALTA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_FECHAMODIF'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_USUMODIF'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_FECHABAJA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AD_USUBAJA'
              Visible = False
            end>
        end
        object frmPanelESOP: TFormPanel
          Left = 16
          Top = 80
          Width = 757
          Height = 365
          Caption = 'Datos ESOP'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderStyle = bsSingle
          Position = poMainFormCenter
          KeyPreview = True
          OnKeyPress = frmPanelESOPKeyPress
          DesignSize = (
            757
            365)
          object lbESOP: TLabel
            Left = 16
            Top = 16
            Width = 29
            Height = 13
            Caption = 'ESOP'
          end
          inline fraESOP: TfraCodigoDescripcion
            Left = 56
            Top = 8
            Width = 672
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 56
            ExplicitTop = 8
            ExplicitWidth = 672
            DesignSize = (
              672
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 607
              CharCase = ecUpperCase
              DataSource = nil
              ExplicitWidth = 607
            end
            inherited edCodigo: TPatternEdit
              CharCase = ecNormal
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 330
            Width = 757
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              757
              35)
            object btnESOPAceptar: TButton
              Left = 593
              Top = 6
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Aceptar'
              TabOrder = 0
              OnClick = btnESOPAceptarClick
            end
            object btnESOPCancel: TButton
              Left = 672
              Top = 6
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Cancelar'
              TabOrder = 1
              OnClick = btnESOPCancelClick
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 40
            Width = 757
            Height = 290
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 2
            object scbDatosAgente: TScrollBox
              Left = 0
              Top = 0
              Width = 757
              Height = 290
              HorzScrollBar.Smooth = True
              VertScrollBar.Smooth = True
              Align = alClient
              TabOrder = 0
              OnClick = scbDatosAgenteClick
              DesignSize = (
                753
                286)
              object lbPresenciaAgente: TLabel
                Left = 12
                Top = 20
                Width = 128
                Height = 14
                Caption = 'Presencia del Agente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbFrecuencia: TLabel
                Left = 12
                Top = 41
                Width = 335
                Height = 14
                Caption = 'Frecuencia de la exposici'#243'n (diaria - x/semana - x/mes)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbDuracion: TLabel
                Left = 12
                Top = 63
                Width = 329
                Height = 14
                Caption = 'Duraci'#243'n de la exposici'#243'n (Horas/ d'#237'a - semana - mes)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbMedAmbientales: TLabel
                Left = 12
                Top = 85
                Width = 442
                Height = 14
                Caption = 
                  #191'Existen mediciones ambientales en el puesto / sector? (adjuntar' +
                  ' copia)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbVacunacion: TLabel
                Left = 12
                Top = 216
                Width = 473
                Height = 14
                Caption = 
                  #191'Tiene vacunaci'#243'n completa para el agente biol'#243'gico incukpado? (' +
                  'Hep B, etc)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbLimiteLegal: TLabel
                Left = 12
                Top = 128
                Width = 265
                Height = 14
                Caption = #191'Supera l'#237'mite legal (Res MTEySS 295/03)?'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbEPPAdecuados: TLabel
                Left = 12
                Top = 150
                Width = 214
                Height = 14
                Caption = #191'Son adecuados los EPP utlizados?'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbEstErgonom: TLabel
                Left = 12
                Top = 194
                Width = 461
                Height = 14
                Caption = 
                  #191'Existen estudios ergon'#243'micos sobre el puesto inculpado? (adjunt' +
                  'ar copia)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbNivelConcent: TLabel
                Left = 12
                Top = 107
                Width = 223
                Height = 14
                Caption = 'Niveles de concentraci'#243'n informados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbCapacitacion: TLabel
                Left = 12
                Top = 172
                Width = 364
                Height = 14
                Caption = #191'Existe capicitaci'#243'n al trabajador sobre el riesgo espec'#237'fico?'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label72: TLabel
                Left = 492
                Top = 3
                Width = 13
                Height = 14
                Caption = 'SI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label73: TLabel
                Left = 536
                Top = 4
                Width = 17
                Height = 14
                Caption = 'NO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label74: TLabel
                Left = 620
                Top = 3
                Width = 87
                Height = 14
                Caption = 'Observaciones'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label122: TLabel
                Left = 16
                Top = 256
                Width = 174
                Height = 14
                Caption = 'Agente materiales asociados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              inline fraESOPAsociado: TfraCodigoDescripcion
                Left = 204
                Top = 252
                Width = 536
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 20
                ExplicitLeft = 204
                ExplicitTop = 252
                ExplicitWidth = 536
                DesignSize = (
                  536
                  23)
                inherited cmbDescripcion: TArtComboBox
                  Width = 471
                  CharCase = ecUpperCase
                  DataSource = nil
                  ExplicitWidth = 471
                end
                inherited edCodigo: TPatternEdit
                  CharCase = ecNormal
                end
              end
              object cmbFrecuencia: TComboBox
                Left = 492
                Top = 38
                Width = 81
                Height = 21
                Style = csSimple
                Enabled = False
                ItemIndex = 0
                MaxLength = 10
                TabOrder = 10
                Text = 'Diaria'
                Items.Strings = (
                  'Diaria')
              end
              object edDuraExpo: TIntEdit
                Left = 492
                Top = 60
                Width = 81
                Height = 21
                TabOrder = 21
                Text = '0'
                MaxLength = 3
              end
              object edMemPresAgente: TMemo
                Left = 620
                Top = 20
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 0
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemDuraExpo: TMemo
                Left = 620
                Top = 62
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 1
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemMedAmb: TMemo
                Left = 620
                Top = 84
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 2
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemNivConcent: TMemo
                Left = 620
                Top = 105
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 3
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemSuperaLimite: TMemo
                Left = 620
                Top = 126
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 4
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemEPP: TMemo
                Left = 620
                Top = 148
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 5
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemCapacit: TMemo
                Left = 620
                Top = 169
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 6
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemEstErgo: TMemo
                Left = 620
                Top = 190
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 7
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemVacunacion: TMemo
                Left = 620
                Top = 212
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 8
                OnDblClick = edMemPresAgenteDblClick
              end
              object edMemFrecExpo: TMemo
                Left = 620
                Top = 41
                Width = 120
                Height = 20
                MaxLength = 512
                TabOrder = 9
                OnDblClick = edMemPresAgenteDblClick
              end
              object cmbNivelesConce: TComboBox
                Left = 492
                Top = 102
                Width = 81
                Height = 21
                Style = csDropDownList
                MaxLength = 10
                TabOrder = 11
                Items.Strings = (
                  'Ninguno'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10')
              end
              object Panel3: TPanel
                Left = 492
                Top = 16
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 12
                object rbtPresenciaAgenteSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtPresenciaAgenteNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object Panel6: TPanel
                Left = 492
                Top = 80
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 13
                object rbtMedAmbSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtMedAmbNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object Panel7: TPanel
                Left = 492
                Top = 124
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 14
                object rbtSuperaLimiteSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtSuperaLimiteNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object Panel8: TPanel
                Left = 492
                Top = 147
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 15
                object rbtEPPSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtEPPNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object Panel9: TPanel
                Left = 492
                Top = 169
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 16
                object rbtCapacitSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtCapacitNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object Panel10: TPanel
                Left = 492
                Top = 191
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 17
                object rbtEstErgoSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtEstErgoNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object Panel11: TPanel
                Left = 492
                Top = 212
                Width = 73
                Height = 21
                BevelOuter = bvNone
                TabOrder = 18
                object rbtVacunaSI: TRadioButton
                  Left = 0
                  Top = 4
                  Width = 15
                  Height = 15
                  TabOrder = 0
                end
                object rbtVacunaNO: TRadioButton
                  Left = 45
                  Top = 4
                  Width = 17
                  Height = 15
                  TabOrder = 1
                end
              end
              object edMemos: TcxMemo
                Left = 32
                Top = 32
                Properties.ClearKey = 16452
                Properties.MaxLength = 255
                Properties.ScrollBars = ssVertical
                TabOrder = 19
                Visible = False
                OnExit = edMemosExit
                OnKeyPress = edMemosKeyPress
                Height = 105
                Width = 425
              end
            end
          end
        end
        object CoolBar6: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = tBarAgentesDetect
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object tBarAgentesDetect: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbAltaESOP: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbAltaESOPClick
            end
            object tbModESOP: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Caption = 'tbPPEModificar'
              ImageIndex = 7
              OnClick = tbModESOPClick
            end
            object tbBajaESOP: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar (Cltr+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbBajaESOPClick
            end
          end
        end
      end
      object tsDatosAdicionales: TTabSheet
        Caption = 'Datos Adicionales'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object scbDatosAdicionales: TScrollBox
          Left = 0
          Top = 0
          Width = 782
          Height = 448
          Align = alClient
          TabOrder = 0
          object grpBoxDatosSector: TGroupBox
            Left = 0
            Top = 0
            Width = 762
            Height = 125
            Align = alTop
            Caption = 'Datos del Sector / Puesto estudiado'
            TabOrder = 0
            object Label75: TLabel
              Left = 12
              Top = 42
              Width = 45
              Height = 14
              Caption = 'Madera'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label76: TLabel
              Left = 12
              Top = 58
              Width = 60
              Height = 14
              Caption = 'Hormig'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label77: TLabel
              Left = 12
              Top = 75
              Width = 34
              Height = 14
              Caption = 'Tierra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label78: TLabel
              Left = 12
              Top = 92
              Width = 34
              Height = 14
              Caption = 'Otros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label93: TLabel
              Left = 80
              Top = 16
              Width = 31
              Height = 14
              Caption = 'Pisos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label94: TLabel
              Left = 120
              Top = 16
              Width = 48
              Height = 14
              Caption = 'Paredes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label95: TLabel
              Left = 176
              Top = 16
              Width = 42
              Height = 14
              Caption = 'Techos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label96: TLabel
              Left = 328
              Top = 16
              Width = 67
              Height = 14
              Caption = 'Ventilaci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label97: TLabel
              Left = 452
              Top = 16
              Width = 62
              Height = 14
              Caption = 'Localizada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label98: TLabel
              Left = 272
              Top = 56
              Width = 47
              Height = 14
              Caption = 'Forzada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label99: TLabel
              Left = 272
              Top = 40
              Width = 45
              Height = 14
              Caption = 'General'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label100: TLabel
              Left = 328
              Top = 88
              Width = 34
              Height = 14
              Caption = 'Otros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label101: TLabel
              Left = 328
              Top = 56
              Width = 70
              Height = 14
              Caption = 'Extractores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label102: TLabel
              Left = 328
              Top = 40
              Width = 44
              Height = 14
              Caption = 'Natural'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label103: TLabel
              Left = 328
              Top = 72
              Width = 65
              Height = 14
              Caption = 'Inyectores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape1: TShape
              Left = 2
              Top = 36
              Width = 757
              Height = 1
            end
            object Shape2: TShape
              Left = 260
              Top = 20
              Width = 1
              Height = 90
            end
            object Shape3: TShape
              Left = 445
              Top = 20
              Width = 1
              Height = 90
            end
            object Shape4: TShape
              Left = 261
              Top = 55
              Width = 184
              Height = 1
            end
            object Label104: TLabel
              Left = 452
              Top = 40
              Width = 46
              Height = 14
              Caption = 'Rendija'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label105: TLabel
              Left = 452
              Top = 56
              Width = 41
              Height = 14
              Caption = 'Cabina'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label106: TLabel
              Left = 452
              Top = 72
              Width = 56
              Height = 14
              Caption = 'Campana'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label107: TLabel
              Left = 452
              Top = 88
              Width = 34
              Height = 14
              Caption = 'Otros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label108: TLabel
              Left = 540
              Top = 16
              Width = 70
              Height = 14
              Caption = 'Iluminaci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label109: TLabel
              Left = 540
              Top = 40
              Width = 44
              Height = 14
              Caption = 'Natural'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label110: TLabel
              Left = 540
              Top = 56
              Width = 50
              Height = 14
              Caption = 'Artificial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label111: TLabel
              Left = 632
              Top = 16
              Width = 36
              Height = 14
              Caption = 'Ruido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label112: TLabel
              Left = 628
              Top = 40
              Width = 99
              Height = 14
              Caption = 'Aislam. Ac'#250'stico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label113: TLabel
              Left = 628
              Top = 56
              Width = 46
              Height = 14
              Caption = 'Peneles'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape5: TShape
              Left = 535
              Top = 20
              Width = 1
              Height = 90
            end
            object Shape6: TShape
              Left = 321
              Top = 20
              Width = 1
              Height = 90
            end
            object Shape7: TShape
              Left = 622
              Top = 20
              Width = 1
              Height = 90
            end
            object Label123: TLabel
              Left = 184
              Top = 42
              Width = 45
              Height = 14
              Caption = 'Madera'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label124: TLabel
              Left = 96
              Top = 42
              Width = 45
              Height = 14
              Caption = 'Madera'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label125: TLabel
              Left = 96
              Top = 58
              Width = 60
              Height = 14
              Caption = 'Hormig'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label126: TLabel
              Left = 184
              Top = 58
              Width = 52
              Height = 14
              Caption = 'Tinglado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label127: TLabel
              Left = 184
              Top = 74
              Width = 28
              Height = 14
              Caption = 'Loza'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label128: TLabel
              Left = 96
              Top = 74
              Width = 38
              Height = 14
              Caption = 'Chapa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label129: TLabel
              Left = 184
              Top = 92
              Width = 34
              Height = 14
              Caption = 'Otros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label130: TLabel
              Left = 96
              Top = 92
              Width = 34
              Height = 14
              Caption = 'Otros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object chkPisoMad: TCheckBox
              Left = 76
              Top = 42
              Width = 13
              Height = 17
              TabOrder = 0
            end
            object chkPisoHormi: TCheckBox
              Left = 76
              Top = 57
              Width = 13
              Height = 17
              TabOrder = 1
            end
            object chkPisoTierra: TCheckBox
              Left = 76
              Top = 73
              Width = 13
              Height = 17
              TabOrder = 2
            end
            object chkPisoOtros: TCheckBox
              Left = 76
              Top = 89
              Width = 13
              Height = 17
              TabOrder = 3
            end
            object chkParedMad: TCheckBox
              Left = 160
              Top = 42
              Width = 13
              Height = 17
              TabOrder = 4
            end
            object chkParedHormi: TCheckBox
              Left = 160
              Top = 57
              Width = 13
              Height = 17
              TabOrder = 5
            end
            object chkParedChapa: TCheckBox
              Left = 160
              Top = 73
              Width = 13
              Height = 17
              TabOrder = 6
            end
            object chkParedOtros: TCheckBox
              Left = 160
              Top = 89
              Width = 13
              Height = 17
              TabOrder = 7
            end
            object chkTechoMad: TCheckBox
              Left = 240
              Top = 42
              Width = 13
              Height = 17
              TabOrder = 8
            end
            object chkTechoTing: TCheckBox
              Left = 240
              Top = 57
              Width = 13
              Height = 17
              TabOrder = 9
            end
            object chkTechoLoza: TCheckBox
              Left = 240
              Top = 73
              Width = 13
              Height = 17
              TabOrder = 10
            end
            object chkTechoOtros: TCheckBox
              Left = 240
              Top = 89
              Width = 13
              Height = 17
              TabOrder = 11
            end
            object chkVentNat: TCheckBox
              Left = 428
              Top = 40
              Width = 13
              Height = 15
              TabOrder = 12
            end
            object chkVentExtrac: TCheckBox
              Left = 428
              Top = 56
              Width = 13
              Height = 17
              TabOrder = 13
            end
            object chkVentInyec: TCheckBox
              Left = 428
              Top = 72
              Width = 13
              Height = 17
              TabOrder = 14
            end
            object chkVentOtros: TCheckBox
              Left = 428
              Top = 88
              Width = 13
              Height = 17
              TabOrder = 15
            end
            object chkLocRend: TCheckBox
              Left = 516
              Top = 40
              Width = 13
              Height = 17
              TabOrder = 16
            end
            object chkLocCab: TCheckBox
              Left = 516
              Top = 56
              Width = 13
              Height = 17
              TabOrder = 17
            end
            object chkLocCamp: TCheckBox
              Left = 516
              Top = 72
              Width = 13
              Height = 17
              TabOrder = 18
            end
            object chkLocOtros: TCheckBox
              Left = 516
              Top = 88
              Width = 13
              Height = 17
              TabOrder = 19
            end
            object chkRuidoPaneles: TCheckBox
              Left = 736
              Top = 56
              Width = 13
              Height = 17
              TabOrder = 20
            end
            object chkRuidoAisAcust: TCheckBox
              Left = 736
              Top = 40
              Width = 13
              Height = 17
              TabOrder = 21
            end
            object chkIlumArtif: TCheckBox
              Left = 600
              Top = 56
              Width = 13
              Height = 17
              TabOrder = 22
            end
            object chkIlumNat: TCheckBox
              Left = 600
              Top = 40
              Width = 13
              Height = 17
              TabOrder = 23
            end
          end
          object grpBoxAntecedentes: TGroupBox
            Left = 0
            Top = 125
            Width = 762
            Height = 108
            Align = alTop
            Caption = 'Antecedentes'
            TabOrder = 1
            object Label84: TLabel
              Left = 13
              Top = 39
              Width = 596
              Height = 14
              Caption = 
                #191'Se ha declarado como trabajo insalubre el proceso en estudio o ' +
                'alguna otra '#225'rea de la empresa?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label79: TLabel
              Left = 13
              Top = 23
              Width = 430
              Height = 14
              Caption = 
                #191'Existen riesgos anteriores de estudios realizados por casos sim' +
                'ilaries?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label114: TLabel
              Left = 16
              Top = 56
              Width = 87
              Height = 14
              Caption = 'Observaciones'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edAntecedObs: TMemo
              Left = 116
              Top = 60
              Width = 601
              Height = 41
              MaxLength = 256
              TabOrder = 0
            end
            object Panel23: TPanel
              Left = 644
              Top = 20
              Width = 81
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object rbtRiesgosAnteSI: TRadioButton
                Left = 4
                Top = 1
                Width = 29
                Height = 15
                Caption = 'SI'
                TabOrder = 0
              end
              object rbtRiesgosAnteNO: TRadioButton
                Left = 38
                Top = 1
                Width = 39
                Height = 15
                Caption = 'NO'
                TabOrder = 1
              end
            end
            object Panel24: TPanel
              Left = 644
              Top = 40
              Width = 81
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object rbtTrabInsalubSI: TRadioButton
                Left = 4
                Top = 1
                Width = 29
                Height = 15
                Caption = 'SI'
                TabOrder = 0
              end
              object rbtTrabInsalubNO: TRadioButton
                Left = 38
                Top = 1
                Width = 39
                Height = 15
                Caption = 'NO'
                TabOrder = 1
              end
            end
          end
          object grpDiagnostico: TGroupBox
            Left = 0
            Top = 233
            Width = 762
            Height = 240
            Align = alTop
            Caption = 'Diagn'#243'stico de situaci'#243'n de la higiene y seguridad en la empresa'
            TabOrder = 2
            object Label80: TLabel
              Left = 16
              Top = 216
              Width = 467
              Height = 13
              Caption = 
                #191'Hay medidas implementadas tendientes a evitar los esfuerzos f'#237's' +
                'icos repetitivos?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label81: TLabel
              Left = 16
              Top = 195
              Width = 383
              Height = 13
              Caption = 
                #191'Se cuenta con un plan de acci'#243'n en caso de emergencias qu'#237'micas' +
                '?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label82: TLabel
              Left = 16
              Top = 174
              Width = 333
              Height = 13
              Caption = #191'Est'#225'n los productos peligrosos claramente identidficados?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label83: TLabel
              Left = 16
              Top = 153
              Width = 599
              Height = 13
              Caption = 
                #191'Se realizan mediciones peri'#243'dicas de las contracciones de los c' +
                'ontaminantes? '#191'Hay protocoloes escritos?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label85: TLabel
              Left = 16
              Top = 132
              Width = 405
              Height = 13
              Caption = 
                #191'Existen normas establecidas para la utilizaci'#243'n de productos qu' +
                #237'micos?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label86: TLabel
              Left = 16
              Top = 111
              Width = 427
              Height = 13
              Caption = 
                #191'Se realizan mediciones de carga t'#233'rmica en los lugares expuesto' +
                's al calor?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label87: TLabel
              Left = 16
              Top = 90
              Width = 551
              Height = 13
              Caption = 
                #191'Se realizan estudios de iluminaci'#243'n de la planta y sus respecti' +
                'vos informes de estado y mejoras?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label88: TLabel
              Left = 16
              Top = 69
              Width = 585
              Height = 13
              Caption = 
                #191'Se realizan mediciones de ruido y/o vibraciones en todos los se' +
                'ctores de la planta que generan riesgo?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label89: TLabel
              Left = 16
              Top = 48
              Width = 670
              Height = 13
              Caption = 
                #191'Existe uno o m'#225's mapas de riesgo donde se localizan los agentes' +
                ' de riesgo, qu'#237'micos, f'#237'sicos, fisiol'#243'gicos y posturales?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label90: TLabel
              Left = 16
              Top = 28
              Width = 318
              Height = 13
              Caption = #191'Existe un plan escrito o higiene laboral en la emporesa?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label119: TLabel
              Left = 733
              Top = 12
              Width = 14
              Height = 13
              Caption = 'NC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label120: TLabel
              Left = 714
              Top = 12
              Width = 15
              Height = 13
              Caption = 'NO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label121: TLabel
              Left = 698
              Top = 12
              Width = 10
              Height = 13
              Caption = 'SI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Panel5: TPanel
              Left = 692
              Top = 28
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object rbtPlanEscritoSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtPlanEscritoNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtPlanEscritoNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel12: TPanel
              Left = 692
              Top = 48
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object rbtMapasRiesgoSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtMapasRiesgoNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtMapasRiesgoNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel13: TPanel
              Left = 692
              Top = 69
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object rbtMedRuidoSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtMedRuidoNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtMedRuidoNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel14: TPanel
              Left = 692
              Top = 90
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 3
              object rbtEstluminacionSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtEstluminacionNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtEstluminacionNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel15: TPanel
              Left = 692
              Top = 111
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 4
              object rbtMedCargaTermSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtMedCargaTermNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtMedCargaTermNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel16: TPanel
              Left = 692
              Top = 132
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 5
              object rbtNormasEstabSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtNormasEstabNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtNormasEstabNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel17: TPanel
              Left = 692
              Top = 153
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 6
              object rbtMedContracSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtMedContracNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtMedContracNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel18: TPanel
              Left = 692
              Top = 174
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 7
              object rbtProdPeligrosoSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtProdPeligrosoNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtProdPeligrosoNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel19: TPanel
              Left = 692
              Top = 195
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 8
              object rbtPlanAccionSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtPlanAccionNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtPlanAccionNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
            object Panel20: TPanel
              Left = 692
              Top = 216
              Width = 57
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 9
              object rbtMedImplementSI: TRadioButton
                Left = 4
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 0
              end
              object rbtMedImplementNO: TRadioButton
                Left = 22
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 1
              end
              object rbtMedImplementNC: TRadioButton
                Left = 40
                Top = 1
                Width = 15
                Height = 15
                TabOrder = 2
              end
            end
          end
          object grpServiciosProf: TGroupBox
            Left = 0
            Top = 473
            Width = 762
            Height = 80
            Align = alTop
            Caption = 'Servicios Profesionales'
            TabOrder = 3
            object Label91: TLabel
              Left = 12
              Top = 56
              Width = 205
              Height = 14
              Caption = 'Higiene y Seguridad en el Trabajo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label92: TLabel
              Left = 12
              Top = 36
              Width = 125
              Height = 14
              Caption = 'Medicina del Trabajo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label115: TLabel
              Left = 260
              Top = 12
              Width = 36
              Height = 14
              Caption = 'Posee'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label116: TLabel
              Left = 684
              Top = 12
              Width = 26
              Height = 14
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label117: TLabel
              Left = 544
              Top = 12
              Width = 56
              Height = 14
              Caption = 'Matr'#237'cula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label118: TLabel
              Left = 352
              Top = 12
              Width = 77
              Height = 14
              Caption = 'Responsable'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape8: TShape
              Left = 337
              Top = 12
              Width = 1
              Height = 60
            end
            object Shape9: TShape
              Left = 537
              Top = 12
              Width = 1
              Height = 60
            end
            object Shape10: TShape
              Left = 649
              Top = 12
              Width = 1
              Height = 60
            end
            object chkMedTrabTipoInt: TCheckBox
              Left = 656
              Top = 36
              Width = 35
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Int.'
              TabOrder = 0
            end
            object chkMedTrabTipoExt: TCheckBox
              Left = 700
              Top = 36
              Width = 35
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Ext.'
              TabOrder = 1
            end
            object chkHigSegTipoInt: TCheckBox
              Left = 656
              Top = 52
              Width = 35
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Int.'
              TabOrder = 2
            end
            object chkHigSegTipoExt: TCheckBox
              Left = 700
              Top = 52
              Width = 35
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Ext.'
              TabOrder = 3
            end
            object Panel21: TPanel
              Left = 244
              Top = 36
              Width = 81
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 4
              object rbtMedTrabajoSI: TRadioButton
                Left = 4
                Top = 1
                Width = 29
                Height = 15
                Caption = 'SI'
                TabOrder = 0
              end
              object rbtMedTrabajoNO: TRadioButton
                Left = 38
                Top = 1
                Width = 39
                Height = 15
                Caption = 'NO'
                TabOrder = 1
              end
            end
            object Panel22: TPanel
              Left = 244
              Top = 56
              Width = 81
              Height = 15
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 5
              object rbtHigieneSegurSI: TRadioButton
                Left = 4
                Top = 1
                Width = 29
                Height = 15
                Caption = 'SI'
                TabOrder = 0
              end
              object rbtHigieneSegurNO: TRadioButton
                Left = 38
                Top = 1
                Width = 39
                Height = 15
                Caption = 'NO'
                TabOrder = 1
              end
            end
            object edMedTrabResp: TEdit
              Left = 348
              Top = 28
              Width = 181
              Height = 21
              MaxLength = 32
              TabOrder = 6
            end
            object edHigieSegurResp: TEdit
              Left = 348
              Top = 52
              Width = 181
              Height = 21
              MaxLength = 32
              TabOrder = 7
            end
            object edMedTrabRespMatri: TEdit
              Left = 544
              Top = 28
              Width = 97
              Height = 21
              MaxLength = 32
              TabOrder = 8
            end
            object edHigSegRespMatri: TEdit
              Left = 544
              Top = 52
              Width = 97
              Height = 21
              MaxLength = 32
              TabOrder = 9
            end
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 476
      Width = 790
      Height = 41
      Align = alBottom
      TabOrder = 1
    end
  end
  inherited btnAceptar: TButton [2]
    Left = 632
    Top = 541
    ExplicitLeft = 632
    ExplicitTop = 541
  end
  inherited btnCancelar: TButton [3]
    Left = 710
    Top = 541
    ExplicitLeft = 710
    ExplicitTop = 541
  end
  inherited btnAplicar: TButton [4]
    Left = 553
    Top = 541
    Visible = False
    ExplicitLeft = 553
    ExplicitTop = 541
  end
  inherited CoolBar: TCoolBar [5]
    Top = 25
    Width = 790
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 784
      end>
    ExplicitTop = 25
    ExplicitWidth = 790
    inherited ToolBar: TToolBar
      Width = 777
      DisabledImages = frmPrincipal.ilByN
      ExplicitWidth = 777
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
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object tbManTrabajadores: TToolButton
        Left = 174
        Top = 0
        Caption = 'tbManTrabajadores'
        ImageIndex = 19
        OnClick = tbManTrabajadoresClick
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 336
    Top = 168
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 280
    Top = 168
  end
  inherited FormStorage: TFormStorage
    Left = 308
    Top = 168
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT'
      '    EE_ID,'
      '    EE_PROGRAMA,'
      '    EE_IDOPERATIVO,'
      '    EE_DOTACION,'
      '    EE_ZONA,'
      '    EE_NATURALEZA,'
      '    EE_FORMA,'
      '    EE_AGENTE,'
      '    EE_EMPRESA,'
      '    EE_CUIT,'
      '    EE_IDACTIVIDAD,'
      '    EE_CPOSTAL,'
      '    EE_CALLE,'
      '    EE_LOCALIDAD,'
      '    EE_PROVINCIA,'
      '    EE_NUMERO,'
      '    EE_PISO,'
      '    EE_DEPARTAMENTO,'
      '    EE_CPOSTALA,'
      '    EE_TELEFONOS,'
      '    EE_IDART,'
      '    EE_PROGRAMAEMPRESA,'
      '    EE_IDOPERATIVOEMPRESA,'
      '    EE_TIPOESTABLECIMIENTO,'
      '    EE_NROESTABLECIMIENTO,'
      '    EE_DOTACIONESTABLECIMIENTO,'
      '    EE_LUGARDEOCURRENCIA,'
      '    EE_FRECEPCIONOBRA,'
      '    EE_FINICIOACTIVIDAD,'
      '    EE_SUPERFICIE,'
      '    EE_PLANTAS,'
      '    EE_TIPOOBRA,'
      '    EE_ACTIVIDADOBRA,'
      '    EE_ETAPAOBRA,'
      '    EE_PROGRAMAAPROBADO,'
      '    EE_PROGRAMASEGURIDAD,'
      '    EE_FFINOBRA,'
      '    EE_FSUSPOBRA,'
      '    EE_FREINICIOOBRA,'
      '    EE_OBSERVACIONES,'
      '    EE_TURNOROTATIVO,'
      '    EE_HORARIODESDE,'
      '    EE_HORARIOHASTA,'
      '    EE_HORASEXTRAS,'
      '    EE_TAREASHABITUALES,'
      '    EE_TAREASENFERMEDAD,'
      '    EE_DESCRIPCIONENFERMEDAD,'
      '    EE_HECHOSADICIONALES,'
      '    EE_OTROSDATOS,'
      '    EE_RESPONSABLE,'
      '    EE_TITULO,'
      '    EE_TIPOMATRICULA,'
      '    EE_NUMEROMATRICULA,'
      '    EE_INSTITUCIONOTORGANTE,'
      '    EE_FECHA,'
      '    EE_USUALTA USUARIO,'
      '    EE_FECHABAJA,'
      '    PV_DESCRIPCION PROVACCESTABL,'
      '    EE_IDIT,'
      '    EE_PRAM,'
      '    EE_IDEXPEDIENTE'
      'FROM CPV_PROVINCIAS, PEE_ENFERMEDADESTABLECIMIENTO'
      'WHERE EE_ID = :ID'
      '  AND EE_PROVINCIA=PV_CODIGO(+)')
    UpdateObject = sduConsulta
    Left = 280
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 308
    Top = 196
  end
  object sduConsulta: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PEE_ENFERMEDADESTABLECIMIENTO'
      '   SET EE_PROGRAMA = :EE_PROGRAMA,'
      '       EE_IDOPERATIVO = :EE_IDOPERATIVO,'
      '       EE_DOTACION = :EE_DOTACION,'
      '       EE_ZONA = :EE_ZONA,'
      '       EE_NATURALEZA = :EE_NATURALEZA,'
      '       EE_FORMA = :EE_FORMA,'
      '       EE_AGENTE = :EE_AGENTE,'
      '       EE_EMPRESA = :EE_EMPRESA,'
      '       EE_CUIT = :EE_CUIT,'
      '       EE_IDACTIVIDAD = :EE_IDACTIVIDAD,'
      '       EE_CPOSTAL = :EE_CPOSTAL,'
      '       EE_CALLE = :EE_CALLE,'
      '       EE_LOCALIDAD = :EE_LOCALIDAD,'
      '       EE_PROVINCIA = :EE_PROVINCIA,'
      '       EE_NUMERO = :EE_NUMERO,'
      '       EE_PISO = :EE_PISO,'
      '       EE_DEPARTAMENTO = :EE_DEPARTAMENTO,'
      '       EE_CPOSTALA = :EE_CPOSTALA,'
      '       EE_TELEFONOS = :EE_TELEFONOS,'
      '       EE_IDART = :EE_IDART,'
      '       EE_PROGRAMAEMPRESA = :EE_PROGRAMAEMPRESA,'
      '       EE_IDOPERATIVOEMPRESA = :EE_IDOPERATIVOEMPRESA,'
      '       EE_TIPOESTABLECIMIENTO = :EE_TIPOESTABLECIMIENTO,'
      '       EE_NROESTABLECIMIENTO = :EE_NROESTABLECIMIENTO,'
      '       EE_DOTACIONESTABLECIMIENTO = :EE_DOTACIONESTABLECIMIENTO,'
      '       EE_LUGARDEOCURRENCIA = :EE_LUGARDEOCURRENCIA,'
      '       EE_FRECEPCIONOBRA = :EE_FRECEPCIONOBRA,'
      '       EE_FINICIOACTIVIDAD = :EE_FINICIOACTIVIDAD,'
      '       EE_SUPERFICIE = :EE_SUPERFICIE,'
      '       EE_PLANTAS = :EE_PLANTAS,'
      '       EE_TIPOOBRA = :EE_TIPOOBRA,'
      '       EE_ACTIVIDADOBRA = :EE_ACTIVIDADOBRA,'
      '       EE_ETAPAOBRA = :EE_ETAPAOBRA,'
      '       EE_PROGRAMAAPROBADO = :EE_PROGRAMAAPROBADO,'
      '       EE_PROGRAMASEGURIDAD = :EE_PROGRAMASEGURIDAD,'
      '       EE_FFINOBRA = :EE_FFINOBRA,'
      '       EE_FSUSPOBRA = :EE_FSUSPOBRA,'
      '       EE_FREINICIOOBRA = :EE_FREINICIOOBRA,'
      '       EE_OBSERVACIONES = :EE_OBSERVACIONES,'
      '       EE_TURNOROTATIVO = :EE_TURNOROTATIVO,'
      '       EE_HORARIODESDE = :EE_HORARIODESDE,'
      '       EE_HORARIOHASTA = :EE_HORARIOHASTA,'
      '       EE_HORASEXTRAS = :EE_HORASEXTRAS,'
      '       EE_TAREASHABITUALES = :EE_TAREASHABITUALES,'
      '       EE_TAREASENFERMEDAD = :EE_TAREASENFERMEDAD,'
      '       EE_DESCRIPCIONENFERMEDAD = :EE_DESCRIPCIONENFERMEDAD,'
      '       EE_HECHOSADICIONALES = :EE_HECHOSADICIONALES,'
      '       EE_OTROSDATOS = :EE_OTROSDATOS,'
      '       EE_RESPONSABLE = :EE_RESPONSABLE,'
      '       EE_TITULO = :EE_TITULO,'
      '       EE_TIPOMATRICULA = :EE_TIPOMATRICULA,'
      '       EE_NUMEROMATRICULA = :EE_NUMEROMATRICULA,'
      '       EE_INSTITUCIONOTORGANTE = :EE_INSTITUCIONOTORGANTE,'
      '       EE_FECHA = :EE_FECHA,'
      '       EE_FECHAMODIF = SYSDATE,'
      '       EE_USUMODIF = :USUARIO,'
      '       EE_IDIT = :EE_IDIT,'
      '       EE_PRAM = :EE_PRAM,'
      '       EE_IDEXPEDIENTE = :EE_IDEXPEDIENTE'
      ' WHERE EE_ID = :EE_ID')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PEE_ENFERMEDADESTABLECIMIENTO'
      '(EE_ID, EE_PROGRAMA, EE_IDOPERATIVO,'
      ' EE_DOTACION, EE_ZONA, EE_NATURALEZA, EE_FORMA,'
      ' EE_AGENTE, EE_EMPRESA, EE_CUIT, EE_IDACTIVIDAD,'
      ' EE_CPOSTAL, EE_CALLE, EE_LOCALIDAD, EE_PROVINCIA,'
      ' EE_NUMERO, EE_PISO, EE_DEPARTAMENTO, EE_CPOSTALA,'
      
        ' EE_TELEFONOS, EE_IDART, EE_PROGRAMAEMPRESA, EE_IDOPERATIVOEMPRE' +
        'SA,'
      
        ' EE_TIPOESTABLECIMIENTO, EE_NROESTABLECIMIENTO, EE_DOTACIONESTAB' +
        'LECIMIENTO, EE_LUGARDEOCURRENCIA,'
      
        ' EE_FRECEPCIONOBRA, EE_FINICIOACTIVIDAD, EE_SUPERFICIE, EE_PLANT' +
        'AS,'
      
        ' EE_TIPOOBRA, EE_ACTIVIDADOBRA, EE_ETAPAOBRA, EE_PROGRAMAAPROBAD' +
        'O,'
      
        ' EE_PROGRAMASEGURIDAD, EE_FFINOBRA, EE_FSUSPOBRA, EE_FREINICIOOB' +
        'RA,'
      
        ' EE_OBSERVACIONES, EE_TURNOROTATIVO, EE_HORARIODESDE, EE_HORARIO' +
        'HASTA,'
      
        ' EE_HORASEXTRAS, EE_TAREASHABITUALES, EE_TAREASENFERMEDAD, EE_DE' +
        'SCRIPCIONENFERMEDAD,'
      
        ' EE_HECHOSADICIONALES, EE_RESPONSABLE, EE_TITULO, EE_TIPOMATRICU' +
        'LA,'
      
        ' EE_NUMEROMATRICULA, EE_INSTITUCIONOTORGANTE, EE_FECHA, EE_OTROS' +
        'DATOS,'
      ' EE_FECHAALTA, EE_USUALTA, EE_IDIT, EE_PRAM, EE_IDEXPEDIENTE)'
      'VALUES'
      '(:EE_ID, :EE_PROGRAMA, :EE_IDOPERATIVO,'
      ' :EE_DOTACION, :EE_ZONA, :EE_NATURALEZA, :EE_FORMA,'
      ' :EE_AGENTE, :EE_EMPRESA, :EE_CUIT, :EE_IDACTIVIDAD,'
      ' :EE_CPOSTAL, :EE_CALLE, :EE_LOCALIDAD, :EE_PROVINCIA,'
      ' :EE_NUMERO, :EE_PISO, :EE_DEPARTAMENTO, :EE_CPOSTALA,'
      
        ' :EE_TELEFONOS, :EE_IDART, :EE_PROGRAMAEMPRESA, :EE_IDOPERATIVOE' +
        'MPRESA,'
      
        ' :EE_TIPOESTABLECIMIENTO, :EE_NROESTABLECIMIENTO, :EE_DOTACIONES' +
        'TABLECIMIENTO, :EE_LUGARDEOCURRENCIA,'
      
        ' :EE_FRECEPCIONOBRA, :EE_FINICIOACTIVIDAD, :EE_SUPERFICIE, :EE_P' +
        'LANTAS,'
      
        ' :EE_TIPOOBRA, :EE_ACTIVIDADOBRA, :EE_ETAPAOBRA, :EE_PROGRAMAAPR' +
        'OBADO,'
      
        ' :EE_PROGRAMASEGURIDAD, :EE_FFINOBRA, :EE_FSUSPOBRA, :EE_FREINIC' +
        'IOOBRA,'
      
        ' :EE_OBSERVACIONES, :EE_TURNOROTATIVO, :EE_HORARIODESDE, :EE_HOR' +
        'ARIOHASTA,'
      
        ' :EE_HORASEXTRAS, :EE_TAREASHABITUALES, :EE_TAREASENFERMEDAD, :E' +
        'E_DESCRIPCIONENFERMEDAD,'
      
        ' :EE_HECHOSADICIONALES, :EE_RESPONSABLE, :EE_TITULO, :EE_TIPOMAT' +
        'RICULA,'
      
        ' :EE_NUMEROMATRICULA, :EE_INSTITUCIONOTORGANTE, :EE_FECHA, :EE_O' +
        'TROSDATOS,'
      ' SYSDATE, :USUARIO,:EE_IDIT, :EE_PRAM, :EE_IDEXPEDIENTE)')
    DeleteSQL.Strings = (
      'delete from HYS.PEE_ENFERMEDADESTABLECIMIENTO'
      'where'
      '  EE_ID = :OLD_AE_ID')
    Left = 336
    Top = 196
  end
  object sdqPPE_PERSONAENTREVISTADAENF: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPPE_PERSONAENTREVISTADAENFAfterOpen
    SQL.Strings = (
      'SELECT'
      '    PE_ID,'
      '    PE_IDENFERMEDADESTABLECIMIENTO,'
      '    PE_TIPODOCUMENTO,'
      '    PE_CUIL,'
      '    PE_DOCUMENTO,'
      '    PE_NOMBRE,'
      '    PE_CARGO,'
      '    PE_FECHA_ENTREVISTA,'
      '    PE_TIPO_ENTREVISTA,'
      '    PE_USUALTA USUARIO,'
      '    PE_USUBAJA,'
      '    PE_FECHABAJA,'
      '    PE_FECHAEXPORT,'
      
        '    DECODE(PE_TIPO_ENTREVISTA, '#39'E'#39', '#39'Entrevista'#39', '#39'T'#39', '#39'Testigo'#39 +
        ') TIPO_ENTREVISTA,'
      '    TIPODOCUMENTO.TB_DESCRIPCION DESCRTIPODOCUMENTO'
      'FROM CTB_TABLAS TIPODOCUMENTO, HYS.PPE_PERSONAENTREVISTADAENF'
      'WHERE PE_IDENFERMEDADESTABLECIMIENTO = :ID'
      '  AND TIPODOCUMENTO.TB_CODIGO(+)=PE_TIPODOCUMENTO'
      '  AND TIPODOCUMENTO.TB_CLAVE(+)='#39'TDOCN'#39
      'ORDER BY PE_ID'
      ' '
      ' '
      ' ')
    UpdateObject = sduPPE_PERSONAENTREVISTADAENF
    Left = 280
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPPE_PERSONAENTREVISTADAENF: TDataSource
    DataSet = sdqPPE_PERSONAENTREVISTADAENF
    Left = 308
    Top = 224
  end
  object sduPPE_PERSONAENTREVISTADAENF: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PPE_PERSONAENTREVISTADAENF'
      '   SET PE_TIPODOCUMENTO = :PE_TIPODOCUMENTO,'
      '       PE_DOCUMENTO = :PE_DOCUMENTO,'
      '       PE_CUIL = :PE_CUIL,'
      '       PE_NOMBRE = :PE_NOMBRE,'
      '       PE_CARGO = :PE_CARGO,'
      '       PE_FECHA_ENTREVISTA = :PE_FECHA_ENTREVISTA,'
      '       PE_TIPO_ENTREVISTA = :PE_TIPO_ENTREVISTA,'
      '       PE_FECHAMODIF = SYSDATE,'
      '       PE_USUMODIF = :USUARIO,'
      '       PE_FECHABAJA = :PE_FECHABAJA,'
      '       PE_USUBAJA = :PE_USUBAJA'
      ' WHERE PE_ID = :PE_ID'
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO hys.ppe_personaentrevistadaenf ('
      '                                         pe_id,'
      
        '                                         pe_idenfermedadestablec' +
        'imiento,'
      '                                         pe_tipodocumento,'
      '                                         pe_documento,'
      '                                         pe_cuil,'
      '                                         pe_nombre,'
      '                                         pe_cargo,'
      '                                         pe_fecha_entrevista,'
      '                                         pe_tipo_entrevista,'
      '                                         pe_fechaalta,'
      '                                         pe_usualta'
      '                                        )'
      '   VALUES  ('
      '            :pe_id,'
      '            :pe_idenfermedadestablecimiento,'
      '            :pe_tipodocumento,'
      '            :pe_documento,'
      '            :pe_cuil,'
      '            :pe_nombre,'
      '            :pe_cargo,'
      '            :pe_fecha_entrevista,'
      '            :pe_tipo_entrevista,'
      '            SYSDATE,'
      '            :usuario'
      '           )')
    DeleteSQL.Strings = (
      'delete from HYS.PPE_PERSONAENTREVISTADAENF'
      'where'
      '  PE_ID = :OLD_PE_ID and'
      
        '  PE_IDENFERMEDADESTABLECIMIENTO = :OLD_PE_IDENFERMEDADESTABLECI' +
        'MIENTO')
    Left = 336
    Top = 224
  end
  object sdqPMC_MEDIDACORRECTIVAENF: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPMC_MEDIDACORRECTIVAENFAfterOpen
    AfterScroll = sdqPMC_MEDIDACORRECTIVAENFAfterScroll
    SQL.Strings = (
      'SELECT MC_ID,'
      '       MC_IDENFERMEDADESTABLECIMIENTO,'
      '       MC_MEDIDA,'
      '       MC_FECHAEJECUCION,'
      '       MC_FECHAVERIFICACION,'
      '       MC_DESCRIPCION,'
      '       MC_USUALTA USUARIO,'
      '       MC_USUBAJA,'
      '       MC_FECHABAJA,'
      '       MC_FECHAEXPORT'
      '  FROM HYS.PMC_MEDIDACORRECTIVAENF'
      ' WHERE MC_IDENFERMEDADESTABLECIMIENTO = :ID'
      'ORDER BY MC_MEDIDA')
    UpdateObject = sduPMC_MEDIDACORRECTIVAENF
    Left = 280
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPMC_MEDIDACORRECTIVAENF: TDataSource
    DataSet = sdqPMC_MEDIDACORRECTIVAENF
    Left = 308
    Top = 280
  end
  object sduPMC_MEDIDACORRECTIVAENF: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PMC_MEDIDACORRECTIVAENF'
      '   SET MC_DESCRIPCION = :MC_DESCRIPCION,'
      '       MC_FECHAEJECUCION = :MC_FECHAEJECUCION,'
      '       MC_FECHAVERIFICACION = :MC_FECHAVERIFICACION,'
      '       MC_FECHAMODIF = SYSDATE,'
      '       MC_USUMODIF = :USUARIO,'
      '       MC_FECHABAJA = :MC_FECHABAJA,'
      '       MC_USUBAJA = :MC_USUBAJA'
      ' WHERE MC_ID = :MC_ID'
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PMC_MEDIDACORRECTIVAENF'
      
        '(MC_ID, MC_IDENFERMEDADESTABLECIMIENTO, MC_MEDIDA, MC_DESCRIPCIO' +
        'N, MC_FECHAEJECUCION, MC_FECHAVERIFICACION, MC_FECHAALTA, MC_USU' +
        'ALTA)'
      'VALUES'
      
        '(:MC_ID, :MC_IDENFERMEDADESTABLECIMIENTO, :MC_MEDIDA, :MC_DESCRI' +
        'PCION, :MC_FECHAEJECUCION, :MC_FECHAVERIFICACION, SYSDATE, :USUA' +
        'RIO)'
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HYS.PMC_MEDIDACORRECTIVAENF'
      'where'
      '  MC_ID = :OLD_MC_ID')
    Left = 336
    Top = 280
  end
  object sduPSV_SEGUIMIENTOVISITAENF: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PSV_SEGUIMIENTOVISITAENF'
      '   SET SV_TIPO = :SV_TIPO,'
      '       SV_FECHA = :SV_FECHA,'
      '       SV_FECHAMODIF = SYSDATE,'
      '       SV_USUMODIF = :USUARIO,'
      '       SV_FECHABAJA = :SV_FECHABAJA,'
      '       SV_USUBAJA = :SV_USUBAJA'
      ' WHERE SV_ID = :SV_ID'
      ''
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO hys.psv_seguimientovisitaenf ('
      '                                          sv_id,'
      '                                          sv_idmedidacorrectiva,'
      '                                          sv_tipo,'
      '                                          sv_fecha,'
      '                                          sv_fechaalta,'
      '                                          sv_usualta'
      '                                         )'
      '   VALUES  ('
      '            :sv_id,'
      '            :sv_idmedidacorrectiva,'
      '            :sv_tipo,'
      '            :sv_fecha,'
      '            SYSDATE,'
      '            :usuario'
      '           ) ')
    DeleteSQL.Strings = (
      'delete from HYS.PSV_SEGUIMIENTOVISITAENF'
      'where'
      '  SV_ID = :OLD_SV_ID')
    Left = 336
    Top = 308
  end
  object dsPSV_SEGUIMIENTOVISITAENF: TDataSource
    DataSet = sdqPSV_SEGUIMIENTOVISITAENF
    Left = 308
    Top = 308
  end
  object sdqPSV_SEGUIMIENTOVISITAENF: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPSV_SEGUIMIENTOVISITAENFAfterOpen
    SQL.Strings = (
      'SELECT SV_ID,'
      '       SV_IDMEDIDACORRECTIVA,'
      '       SV_TIPO,'
      
        '       DECODE(SV_TIPO, '#39'V'#39', '#39'Visita'#39', '#39'C'#39', '#39'Cumplimiento'#39', '#39'I'#39', ' +
        #39'Incumplimiento'#39') TIPO_VISITA,'
      '       SV_FECHA,'
      '       SV_USUALTA USUARIO,'
      '       SV_USUBAJA,'
      '       SV_FECHABAJA,'
      '       SV_FECHAEXPORT'
      '  FROM HYS.PSV_SEGUIMIENTOVISITAENF'
      ' WHERE SV_IDMEDIDACORRECTIVA = :ID'
      'ORDER BY SV_ID'
      ' '
      ' '
      ' ')
    UpdateObject = sduPSV_SEGUIMIENTOVISITAENF
    Left = 280
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqPED_ENFERMEDADDATAADICIONAL: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT  ed_pisomad,'
      '        ed_pisohormi,'
      '        ed_pisotierra,'
      '        ed_pisootros,'
      '        ed_paredmad,'
      '        ed_paredhormi,'
      '        ed_paredchapa,'
      '        ed_paredotros,'
      '        ed_ventnat,'
      '        ed_ventextrac,'
      '        ed_ventinyec,'
      '        ed_ventotros,'
      '        ed_locrend,'
      '        ed_loccab,'
      '        ed_loccamp,'
      '        ed_locotros,'
      '        ed_ilumnat,'
      '        ed_ilumartif,'
      '        ed_ruidoaisacust,'
      '        ed_ruidopaneles,'
      '        ed_riesgosant,'
      '        ed_trabinsalub,'
      '        ed_planescrito,'
      '        ed_mapariesgo,'
      '        ed_medruido,'
      '        ed_medcargaterm,'
      '        ed_normasestab,'
      '        ed_medcontrac,'
      '        ed_prodpeligroso,'
      '        ed_planaccion,'
      '        ed_medimplement,'
      '        ed_medtrabajo,'
      '        ed_higienesegur,'
      '        ed_medtrabresp,'
      '        ed_higiesegurresp,'
      '        ed_medtrabrespmattri,'
      '        ed_higregrespmatri,'
      '        ed_medtrabtipoint,'
      '        ed_higsegtipoint,'
      '        ed_medtrabtipoext,'
      '        ed_higsegtipoext,'
      '        ed_expediente,'
      '        ed_ilumnplanta,'
      '        ed_id,'
      '        ed_antecedobs,'
      '        ed_techomad,'
      '        ed_techoting,'
      '        ed_techoloza,'
      '        ed_techootros'
      '  FROM  hys.ped_enfermedaddataadicional'
      'WHERE ed_expediente = :sexid')
    Left = 280
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sexid'
        ParamType = ptInput
      end>
  end
  object dsPED_ENFERMEDADDATAADICIONAL: TDataSource
    DataSet = sdqPED_ENFERMEDADDATAADICIONAL
    Left = 308
    Top = 392
  end
  object sdqPAD_AGENTESDETECTADOS: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT  ad_id,'
      '        ad_prgid,'
      '        ad_descripcion,'
      '        ad_presenciaagente,'
      '        ad_frecuenciaexpo,'
      '        ad_duracionexpo,'
      '        ad_medicionesamb,'
      '        ad_nivelconcentracion,'
      '        ad_superalimite,'
      '        ad_eppadecuados,'
      '        ad_capacitatrab,'
      '        ad_estudioserg,'
      '        ad_vacunacion,'
      '        ad_obspresenciaagente,'
      '        ad_obsfrecuencia,'
      '        ad_obsmedamb,'
      '        ad_obsnivconcent,'
      '        ad_obslimitelegal,'
      '        ad_obsepp,'
      '        ad_obscapacit,'
      '        ad_obsestergo,'
      '        ad_obsvacu,'
      '        ad_esop,'
      '        ad_expediente,'
      '        ad_fechaalta,'
      '        ad_usualta,'
      '        ad_fechamodif,'
      '        ad_usumodif,'
      '        ad_fechabaja,'
      '        ad_usubaja,'
      '        ad_fechaexport,'
      '        ad_obsduraexpo,'
      '        ad_esopasociado, '
      '        ad_esopasociadodesc'
      '  FROM  hys.pad_agentesdetectados'
      ' WHERE  ad_expediente = :sexid')
    UpdateObject = sduPAD_AGENTESDETECTADOS
    Left = 280
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sexid'
        ParamType = ptInput
      end>
  end
  object dsPAD_AGENTESDETECTADOS: TDataSource
    DataSet = sdqPAD_AGENTESDETECTADOS
    Left = 308
    Top = 364
  end
  object sduPAD_AGENTESDETECTADOS: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select AD_ID, AD_PRGID, AD_DESCRIPCION, AD_PRESENCIAAGENTE, AD_F' +
        'RECUENCIAEXPO, AD_DURACIONEXPO, AD_MEDICIONESAMB, AD_NIVELCONCEN' +
        'TRACION, AD_SUPERALIMITE, AD_EPPADECUADOS, AD_CAPACITATRAB, AD_E' +
        'STUDIOSERG, AD_VACUNACION, AD_OBSPRESENCIAAGENTE, AD_OBSFRECUENC' +
        'IA, AD_OBSMEDAMB, AD_OBSNIVCONCENT, AD_OBSLIMITELEGAL, AD_OBSEPP' +
        ', AD_OBSCAPACIT, AD_OBSESTERGO, AD_ESOP, AD_EXPEDIENTE, AD_FECHA' +
        'ALTA, AD_USUALTA, AD_FECHAMODIF, AD_USUMODIF, AD_FECHABAJA, AD_U' +
        'SUBAJA, AD_OBSVACU, AD_FECHAEXPORT, AD_OBSDURAEXPO, AD_ESOPASOCI' +
        'ADO, AD_ESOPASOCIADODESC'#13#10'from hys.pad_agentesdetectados'
      'where'
      '  AD_ID = :OLD_AD_ID')
    ModifySQL.Strings = (
      'update hys.pad_agentesdetectados'
      'set'
      '  AD_ID = :AD_ID,'
      '  AD_PRGID = :AD_PRGID,'
      '  AD_DESCRIPCION = :AD_DESCRIPCION,'
      '  AD_PRESENCIAAGENTE = :AD_PRESENCIAAGENTE,'
      '  AD_FRECUENCIAEXPO = :AD_FRECUENCIAEXPO,'
      '  AD_DURACIONEXPO = :AD_DURACIONEXPO,'
      '  AD_MEDICIONESAMB = :AD_MEDICIONESAMB,'
      '  AD_NIVELCONCENTRACION = :AD_NIVELCONCENTRACION,'
      '  AD_SUPERALIMITE = :AD_SUPERALIMITE,'
      '  AD_EPPADECUADOS = :AD_EPPADECUADOS,'
      '  AD_CAPACITATRAB = :AD_CAPACITATRAB,'
      '  AD_ESTUDIOSERG = :AD_ESTUDIOSERG,'
      '  AD_VACUNACION = :AD_VACUNACION,'
      '  AD_OBSPRESENCIAAGENTE = :AD_OBSPRESENCIAAGENTE,'
      '  AD_OBSFRECUENCIA = :AD_OBSFRECUENCIA,'
      '  AD_OBSMEDAMB = :AD_OBSMEDAMB,'
      '  AD_OBSNIVCONCENT = :AD_OBSNIVCONCENT,'
      '  AD_OBSLIMITELEGAL = :AD_OBSLIMITELEGAL,'
      '  AD_OBSEPP = :AD_OBSEPP,'
      '  AD_OBSCAPACIT = :AD_OBSCAPACIT,'
      '  AD_OBSESTERGO = :AD_OBSESTERGO,'
      '  AD_ESOP = :AD_ESOP,'
      '  AD_EXPEDIENTE = :AD_EXPEDIENTE,'
      '  AD_FECHAALTA = :AD_FECHAALTA,'
      '  AD_USUALTA = :AD_USUALTA,'
      '  AD_FECHAMODIF = :AD_FECHAMODIF,'
      '  AD_USUMODIF = :AD_USUMODIF,'
      '  AD_FECHABAJA = :AD_FECHABAJA,'
      '  AD_USUBAJA = :AD_USUBAJA,'
      '  AD_OBSVACU = :AD_OBSVACU,'
      '  AD_FECHAEXPORT = :AD_FECHAEXPORT,'
      '  AD_OBSDURAEXPO = :AD_OBSDURAEXPO,'
      '  AD_ESOPASOCIADO = :AD_ESOPASOCIADO,'
      '  AD_ESOPASOCIADODESC = :AD_ESOPASOCIADODESC'
      'where'
      '  AD_ID = :OLD_AD_ID')
    InsertSQL.Strings = (
      'insert into hys.pad_agentesdetectados'
      
        '  (AD_ID, AD_PRGID, AD_DESCRIPCION, AD_PRESENCIAAGENTE, AD_FRECU' +
        'ENCIAEXPO, AD_DURACIONEXPO, AD_MEDICIONESAMB, AD_NIVELCONCENTRAC' +
        'ION, AD_SUPERALIMITE, AD_EPPADECUADOS, AD_CAPACITATRAB, AD_ESTUD' +
        'IOSERG, AD_VACUNACION, AD_OBSPRESENCIAAGENTE, AD_OBSFRECUENCIA, ' +
        'AD_OBSMEDAMB, AD_OBSNIVCONCENT, AD_OBSLIMITELEGAL, AD_OBSEPP, AD' +
        '_OBSCAPACIT, AD_OBSESTERGO, AD_ESOP, AD_EXPEDIENTE, AD_FECHAALTA' +
        ', AD_USUALTA, AD_FECHAMODIF, AD_USUMODIF, AD_FECHABAJA, AD_USUBA' +
        'JA, AD_OBSVACU, AD_FECHAEXPORT, AD_OBSDURAEXPO, AD_ESOPASOCIADO,' +
        ' AD_ESOPASOCIADODESC)'
      'values'
      
        '  (:AD_ID, :AD_PRGID, :AD_DESCRIPCION, :AD_PRESENCIAAGENTE, :AD_' +
        'FRECUENCIAEXPO, :AD_DURACIONEXPO, :AD_MEDICIONESAMB, :AD_NIVELCO' +
        'NCENTRACION, :AD_SUPERALIMITE, :AD_EPPADECUADOS, :AD_CAPACITATRA' +
        'B, :AD_ESTUDIOSERG, :AD_VACUNACION, :AD_OBSPRESENCIAAGENTE, :AD_' +
        'OBSFRECUENCIA, :AD_OBSMEDAMB, :AD_OBSNIVCONCENT, :AD_OBSLIMITELE' +
        'GAL, :AD_OBSEPP, :AD_OBSCAPACIT, :AD_OBSESTERGO, :AD_ESOP, :AD_E' +
        'XPEDIENTE, :AD_FECHAALTA, :AD_USUALTA, :AD_FECHAMODIF, :AD_USUMO' +
        'DIF, :AD_FECHABAJA, :AD_USUBAJA, :AD_OBSVACU, :AD_FECHAEXPORT, :' +
        'AD_OBSDURAEXPO, :AD_ESOPASOCIADO, :AD_ESOPASOCIADODESC)')
    DeleteSQL.Strings = (
      'delete from hys.pad_agentesdetectados'
      'where'
      '  AD_ID = :OLD_AD_ID')
    Left = 336
    Top = 364
  end
  object KeepConn: TTimer
    Interval = 1800000
    OnTimer = KeepConnTimer
    Left = 280
    Top = 458
  end
end
