inherited frmInfInvestigacionAccidentes: TfrmInfInvestigacionAccidentes
  Left = 276
  Top = 157
  Caption = 'Informe de Investigaci'#243'n de Accidentes de Trabajo'
  ClientHeight = 545
  ClientWidth = 765
  Constraints.MinHeight = 475
  Constraints.MinWidth = 773
  OldCreateOrder = True
  Scaled = False
  OnMouseWheel = FSFormMouseWheel
  ExplicitWidth = 773
  ExplicitHeight = 572
  DesignSize = (
    765
    545)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 765
    Height = 52
    ExplicitWidth = 765
    ExplicitHeight = 52
    DesignSize = (
      765
      52)
    inline fraTrabajadorSinGraveBusq: TfraPAE_ACCIDENTEESTABLECIMIENTO
      Left = -1
      Top = 2
      Width = 766
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = -1
      ExplicitTop = 2
      ExplicitWidth = 766
      DesignSize = (
        766
        46)
      inherited lbNroDenSRT: TLabel [0]
      end
      inherited lbSiniestro: TLabel [1]
        Left = 631
        ExplicitLeft = 631
      end
      inherited cmbNombre: TArtComboBox
        Width = 717
        ExplicitWidth = 717
      end
      inherited edSiniestro: TSinEdit
        Left = 681
        Width = 82
        ViewStyle = [etSiniestro, etOrden]
        ExplicitLeft = 681
        ExplicitWidth = 82
      end
      inherited edDG_NRODENUNCIASRT: TPatternEdit
        Width = 77
        ExplicitWidth = 77
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 52
    Width = 765
    Height = 30
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 759
      end>
    ExplicitTop = 52
    ExplicitWidth = 765
    ExplicitHeight = 30
    inherited ToolBar: TToolBar
      Width = 752
      DisabledImages = frmPrincipal.ilByN
      ExplicitWidth = 752
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
        OnClick = tbImprimirClick
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = -1
        Visible = False
      end
      object tbManTrabajadores: TToolButton
        Left = 174
        Top = 0
        ImageIndex = 19
        OnClick = tbManTrabajadoresClick
      end
      object ToolButton2: TToolButton
        Left = 199
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 207
        Top = 0
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 84
    Width = 764
    Height = 430
    ExplicitTop = 84
    ExplicitWidth = 764
    ExplicitHeight = 430
    object pcDatos: TPageControl
      Left = 0
      Top = 0
      Width = 764
      Height = 430
      ActivePage = tsCausasMedidasSeguim
      Align = alClient
      TabOrder = 0
      OnChange = pcDatosChange
      object tsDatosSiniestro: TTabSheet
        Caption = 'Datos del Siniestro'
        object ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 756
          Height = 402
          HorzScrollBar.Range = 268
          VertScrollBar.Position = 796
          VertScrollBar.Range = 1730
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          DesignSize = (
            736
            398)
          object lbPrograma: TLabel
            Left = 8
            Top = -380
            Width = 45
            Height = 13
            Caption = 'Programa'
          end
          object Operativo: TLabel
            Left = 8
            Top = -352
            Width = 46
            Height = 13
            Caption = 'Operativo'
          end
          object Label7: TLabel
            Left = 8
            Top = -787
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
            Top = -770
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object lbObservaciones: TLabel
            Left = 8
            Top = 223
            Width = 56
            Height = 13
            Caption = 'Otros Datos'
          end
          object btnTop: TSpeedButton
            Left = 736
            Top = 811
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
            OnClick = btnTopClick
          end
          object lbNroDenSRT: TLabel
            Left = 219
            Top = -756
            Width = 86
            Height = 13
            Caption = 'N'#186' Denuncia SRT'
            FocusControl = edNroDenunciaSRT
          end
          object lbSiniestro: TLabel
            Left = 8
            Top = -757
            Width = 40
            Height = 13
            Caption = 'Siniestro'
            FocusControl = edSiniestro
          end
          object Bevel6: TBevel
            Left = 6
            Top = -734
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label16: TLabel
            Left = 374
            Top = -692
            Width = 62
            Height = 13
            Caption = 'Nacionalidad'
          end
          object Label17: TLabel
            Left = 207
            Top = -692
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label18: TLabel
            Left = 8
            Top = -692
            Width = 86
            Height = 13
            Caption = 'Fecha Nacimiento'
          end
          object Label19: TLabel
            Left = 8
            Top = -721
            Width = 24
            Height = 13
            Caption = 'CUIL'
          end
          object lbCA: TLabel
            Left = 8
            Top = -608
            Width = 47
            Height = 13
            Caption = 'C'#243'd. Area'
          end
          object lbTel: TLabel
            Left = 170
            Top = -608
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object lbTarea: TLabel
            Left = 8
            Top = -580
            Width = 52
            Height = 13
            Caption = 'Ocupaci'#243'n'
          end
          object lbActividad: TLabel
            Left = 485
            Top = -579
            Width = 26
            Height = 13
            Caption = 'CIUO'
          end
          object Label20: TLabel
            Left = 8
            Top = -552
            Width = 47
            Height = 13
            Caption = 'F. Ingreso'
          end
          object Label25: TLabel
            Left = 207
            Top = -552
            Width = 79
            Height = 13
            Caption = 'Tipo de Contrato'
          end
          object Label21: TLabel
            Left = 8
            Top = -522
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
            Top = -505
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label22: TLabel
            Left = 8
            Top = -491
            Width = 25
            Height = 13
            Caption = 'CUIT'
          end
          object Label23: TLabel
            Left = 8
            Top = -406
            Width = 47
            Height = 13
            Caption = 'C'#243'd. Area'
          end
          object Label24: TLabel
            Left = 170
            Top = -406
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object Label26: TLabel
            Left = 8
            Top = -324
            Width = 21
            Height = 13
            Caption = 'CIIU'
          end
          object Label27: TLabel
            Left = 8
            Top = -298
            Width = 43
            Height = 13
            Caption = 'Dotaci'#243'n'
          end
          object Label1: TLabel
            Left = 8
            Top = -270
            Width = 293
            Height = 13
            Caption = 'Codificaci'#243'n de los Datos del Accidente de Trabajo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel8: TBevel
            Left = 4
            Top = -253
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label28: TLabel
            Left = 8
            Top = -239
            Width = 25
            Height = 13
            Caption = 'Zona'
          end
          object Label29: TLabel
            Left = 401
            Top = -239
            Width = 51
            Height = 13
            Caption = 'Naturaleza'
          end
          object Label30: TLabel
            Left = 8
            Top = -212
            Width = 29
            Height = 13
            Caption = 'Forma'
          end
          object Label31: TLabel
            Left = 401
            Top = -212
            Width = 34
            Height = 13
            Caption = 'Agente'
          end
          object Label32: TLabel
            Left = 8
            Top = -182
            Width = 389
            Height = 13
            Caption = 
              'Datos del Lugar y Centro de Trabajo donde ha ocurrido el Acciden' +
              'te'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel9: TBevel
            Left = 4
            Top = -165
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label33: TLabel
            Left = 614
            Top = -151
            Width = 25
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CUIT'
            FocusControl = fraTrabajadorSinGraveBusq.mskCUIL
          end
          object Label34: TLabel
            Left = 8
            Top = -151
            Width = 63
            Height = 13
            Caption = 'Raz'#243'n Social'
          end
          object Label35: TLabel
            Left = 8
            Top = -125
            Width = 21
            Height = 13
            Caption = 'CIIU'
          end
          object Label36: TLabel
            Left = 8
            Top = -42
            Width = 47
            Height = 13
            Caption = 'C'#243'd. Area'
          end
          object Label37: TLabel
            Left = 170
            Top = -42
            Width = 18
            Height = 13
            Caption = 'Tel.'
          end
          object Label38: TLabel
            Left = 435
            Top = -42
            Width = 22
            Height = 13
            Caption = 'ART'
          end
          object Label39: TLabel
            Left = 8
            Top = -15
            Width = 45
            Height = 13
            Caption = 'Programa'
          end
          object Label40: TLabel
            Left = 8
            Top = 13
            Width = 46
            Height = 13
            Caption = 'Operativo'
          end
          object Label41: TLabel
            Left = 499
            Top = 44
            Width = 43
            Height = 13
            Caption = 'Dotaci'#243'n'
          end
          object Label42: TLabel
            Left = 342
            Top = 44
            Width = 82
            Height = 13
            Caption = 'Nro. de Establec.'
          end
          object Label43: TLabel
            Left = 8
            Top = 80
            Width = 97
            Height = 13
            Caption = 'Lugar de Ocurrencia'
          end
          object Label44: TLabel
            Left = 387
            Top = 80
            Width = 79
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Recepc. Obra'
          end
          object Label45: TLabel
            Left = 566
            Top = 80
            Width = 67
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Inicio Activ.'
          end
          object Label48: TLabel
            Left = 8
            Top = 108
            Width = 47
            Height = 13
            Caption = 'Superficie'
          end
          object Label46: TLabel
            Left = 205
            Top = 108
            Width = 58
            Height = 13
            Caption = 'Nro. Plantas'
          end
          object Label47: TLabel
            Left = 316
            Top = 108
            Width = 62
            Height = 13
            Caption = 'Tipo de Obra'
          end
          object Label49: TLabel
            Left = 8
            Top = 136
            Width = 89
            Height = 13
            Caption = 'Activ. a Desarrollar'
          end
          object Label50: TLabel
            Left = 398
            Top = 136
            Width = 54
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Etapa Obra'
          end
          object Label51: TLabel
            Left = 136
            Top = 165
            Width = 79
            Height = 13
            Caption = 'Progr. Seguridad'
          end
          object Label52: TLabel
            Left = 8
            Top = 190
            Width = 99
            Height = 26
            Caption = 'F. Fin de la Actividad de la Obra'
            WordWrap = True
          end
          object Label53: TLabel
            Left = 208
            Top = 194
            Width = 65
            Height = 13
            Caption = 'F. Susp. Obra'
          end
          object Label54: TLabel
            Left = 378
            Top = 194
            Width = 76
            Height = 13
            Caption = 'F. Reinicio Obra'
          end
          object Label55: TLabel
            Left = 8
            Top = 303
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
            Top = 320
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label56: TLabel
            Left = 171
            Top = 364
            Width = 68
            Height = 13
            Caption = 'Horario Desde'
          end
          object Label57: TLabel
            Left = 324
            Top = 364
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object Label58: TLabel
            Left = 8
            Top = 335
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object Label59: TLabel
            Left = 215
            Top = 335
            Width = 23
            Height = 13
            Caption = 'Hora'
          end
          object Label60: TLabel
            Left = 8
            Top = 393
            Width = 86
            Height = 13
            Caption = 'Tareas Habituales'
          end
          object Label61: TLabel
            Left = 8
            Top = 472
            Width = 94
            Height = 26
            Caption = 'Tareas al Momento del Accidente'
            WordWrap = True
          end
          object Label62: TLabel
            Left = 8
            Top = 551
            Width = 99
            Height = 13
            Caption = 'Descr. del Accidente'
          end
          object Label63: TLabel
            Left = 8
            Top = 631
            Width = 37
            Height = 13
            Caption = 'Hechos'
          end
          object Bevel1: TBevel
            Left = 4
            Top = 835
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label2: TLabel
            Left = 8
            Top = 818
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
            Left = 8
            Top = 842
            Width = 46
            Height = 13
            Caption = 'Preventor'
          end
          object Label4: TLabel
            Left = 522
            Top = 842
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'T'#237'tulo'
          end
          object Label5: TLabel
            Left = 8
            Top = 888
            Width = 84
            Height = 13
            Caption = 'Tipo de Matr'#237'cula'
          end
          object Label6: TLabel
            Left = 546
            Top = 888
            Width = 83
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Nro. de Matr'#237'cula'
          end
          object Label12: TLabel
            Left = 8
            Top = 914
            Width = 98
            Height = 13
            Caption = 'Instituci'#243'n Otorgante'
          end
          object Label13: TLabel
            Left = 546
            Top = 914
            Width = 75
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F. Investigaci'#243'n'
          end
          object Label66: TLabel
            Left = 8
            Top = 707
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
            Left = 4
            Top = 724
            Width = 730
            Height = 3
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object SpeedButton1: TSpeedButton
            Left = 400
            Top = -188
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
            Left = 306
            Top = 842
            Width = 62
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Responsable'
          end
          inline fraAE_PROGRAMA: TfraStaticCTB_TABLAS
            Left = 112
            Top = -384
            Width = 620
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 18
            ExplicitLeft = 112
            ExplicitTop = -384
            ExplicitWidth = 620
            DesignSize = (
              620
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 31
              Width = 586
              ExplicitLeft = 31
              ExplicitWidth = 586
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
            Left = 112
            Top = -356
            Width = 618
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 19
            ExplicitLeft = 112
            ExplicitTop = -356
            ExplicitWidth = 618
            DesignSize = (
              618
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              MaxLength = 6
              Pattern = '0123456789'
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 557
              ExplicitLeft = 59
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
          object edAE_DOTACION: TIntEdit
            Left = 113
            Top = -301
            Width = 56
            Height = 21
            TabOrder = 21
            MaxLength = 6
            MaxValue = 999999
          end
          object edAE_OBSERVACIONES: TMemo
            Left = 113
            Top = 220
            Width = 611
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 51
          end
          object edNroDenunciaSRT: TPatternEdit
            Left = 311
            Top = -760
            Width = 81
            Height = 21
            TabOrder = 1
            OnExit = edNroDenunciaSRTExit
          end
          object edSiniestro: TSinEdit
            Left = 113
            Top = -761
            Width = 82
            Height = 21
            Hint = 'C'#243'digo de Siniestro '
            OnExit = edSiniestroExit
            TabOrder = 0
            ViewStyle = [etSiniestro, etOrden]
          end
          inline fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion
            Left = 440
            Top = -697
            Width = 156
            Height = 23
            TabOrder = 5
            ExplicitLeft = 440
            ExplicitTop = -697
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
              Width = 128
              ExplicitLeft = 26
              ExplicitWidth = 128
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
            Top = -697
            Width = 135
            Height = 23
            TabOrder = 4
            ExplicitLeft = 236
            ExplicitTop = -697
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
              Width = 108
              ExplicitLeft = 26
              ExplicitWidth = 108
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
            Top = -696
            Width = 88
            Height = 21
            TabOrder = 3
          end
          inline fraTrabajador: TfraTrabajador
            Left = 113
            Top = -724
            Width = 617
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 113
            ExplicitTop = -724
            ExplicitWidth = 617
            DesignSize = (
              617
              22)
            inherited cmbNombre: TArtComboBox
              Width = 533
              ExplicitWidth = 533
            end
          end
          inline fraDomicilioTrabaj: TfraDomicilioTrab
            Left = 8
            Top = -667
            Width = 720
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            ExplicitLeft = 8
            ExplicitTop = -667
            ExplicitWidth = 720
            DesignSize = (
              720
              50)
            inherited lbNro: TLabel
              Left = 505
              ExplicitLeft = 505
            end
            inherited lbPiso: TLabel
              Left = 577
              Width = 20
              ExplicitLeft = 577
              ExplicitWidth = 20
            end
            inherited lbDto: TLabel
              Left = 653
              Width = 20
              ExplicitLeft = 653
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
              Left = 558
              Width = 44
              ExplicitLeft = 558
              ExplicitWidth = 44
            end
            inherited cmbCalle: TArtComboBox
              Left = 105
              Width = 394
              ExplicitLeft = 105
              ExplicitWidth = 394
            end
            inherited edNumero: TEdit
              Left = 527
              ExplicitLeft = 527
            end
            inherited edPiso: TEdit
              Left = 603
              ExplicitLeft = 603
            end
            inherited edDto: TEdit
              Left = 675
              ExplicitLeft = 675
            end
            inherited edCPostal: TIntEdit
              Left = 105
              ExplicitLeft = 105
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 301
              Width = 250
              ExplicitLeft = 301
              ExplicitWidth = 250
            end
            inherited edProvincia: TEdit
              Left = 607
              ExplicitLeft = 607
            end
            inherited edCPA: TPatternEdit
              Left = 186
              ExplicitLeft = 186
            end
          end
          object edTJ_CODAREATELEFONO: TPatternEdit
            Left = 113
            Top = -612
            Width = 50
            Height = 21
            MaxLength = 4
            TabOrder = 8
            Pattern = '0123456789'
          end
          object edTJ_TELEFONO: TPatternEdit
            Left = 194
            Top = -612
            Width = 232
            Height = 21
            MaxLength = 30
            TabOrder = 9
            Pattern = ' 0123456789()-/'
          end
          object edRL_TAREA: TEdit
            Left = 113
            Top = -584
            Width = 364
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 150
            TabOrder = 10
          end
          object cmbRL_FECHAINGRESO: TDateComboBox
            Left = 113
            Top = -556
            Width = 88
            Height = 21
            TabOrder = 12
          end
          inline fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion
            Left = 291
            Top = -556
            Width = 262
            Height = 23
            TabOrder = 13
            ExplicitLeft = 291
            ExplicitTop = -556
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
              Width = 226
              ExplicitLeft = 34
              ExplicitWidth = 226
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
            Top = -584
            Width = 215
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 11
            ExplicitLeft = 516
            ExplicitTop = -584
            ExplicitWidth = 215
            DesignSize = (
              215
              23)
            inherited edCodigo: TPatternEdit
              Width = 30
              ExplicitWidth = 30
            end
            inherited cmbDescripcion: TComboGrid
              Left = 34
              Width = 178
              CharCase = ecUpperCase
              ExplicitLeft = 34
              ExplicitWidth = 178
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
            Top = -494
            Width = 616
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
            TabOrder = 14
            ExplicitLeft = 113
            ExplicitTop = -494
            ExplicitWidth = 616
            ExplicitHeight = 21
            DesignSize = (
              616
              21)
            inherited lbContrato: TLabel
              Left = 514
              ExplicitLeft = 514
            end
            inherited edContrato: TIntEdit
              Left = 559
              ExplicitLeft = 559
            end
            inherited cmbRSocial: TArtComboBox
              Width = 377
              ExplicitWidth = 377
            end
          end
          object edDC_CODAREATELEFONOS: TPatternEdit
            Left = 113
            Top = -410
            Width = 50
            Height = 21
            MaxLength = 4
            TabOrder = 16
            Pattern = '0123456789'
          end
          object edDC_TELEFONOS: TPatternEdit
            Left = 194
            Top = -410
            Width = 232
            Height = 21
            MaxLength = 30
            TabOrder = 17
            Pattern = ' 0123456789()-/'
          end
          inline fraDomicilioEmpresa: TfraDomicilioTrab
            Left = 9
            Top = -466
            Width = 720
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 15
            ExplicitLeft = 9
            ExplicitTop = -466
            ExplicitWidth = 720
            DesignSize = (
              720
              50)
            inherited lbNro: TLabel
              Left = 505
              ExplicitLeft = 505
            end
            inherited lbPiso: TLabel
              Left = 577
              Width = 20
              ExplicitLeft = 577
              ExplicitWidth = 20
            end
            inherited lbDto: TLabel
              Left = 653
              Width = 20
              ExplicitLeft = 653
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
              Left = 558
              Width = 44
              ExplicitLeft = 558
              ExplicitWidth = 44
            end
            inherited cmbCalle: TArtComboBox
              Left = 104
              Width = 394
              ExplicitLeft = 104
              ExplicitWidth = 394
            end
            inherited edNumero: TEdit
              Left = 527
              ExplicitLeft = 527
            end
            inherited edPiso: TEdit
              Left = 603
              ExplicitLeft = 603
            end
            inherited edDto: TEdit
              Left = 675
              ExplicitLeft = 675
            end
            inherited edCPostal: TIntEdit
              Left = 104
              ExplicitLeft = 104
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 301
              Width = 250
              ExplicitLeft = 301
              ExplicitWidth = 250
            end
            inherited edProvincia: TEdit
              Left = 607
              ExplicitLeft = 607
            end
            inherited edCPA: TPatternEdit
              Left = 186
              TabStop = True
              ExplicitLeft = 186
            end
          end
          inline fraCO_IDACTIVIDAD: TfraStaticCodigoDescripcion
            Left = 112
            Top = -329
            Width = 620
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 20
            ExplicitLeft = 112
            ExplicitTop = -329
            ExplicitWidth = 620
            DesignSize = (
              620
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 557
              ExplicitLeft = 59
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
          inline fraAE_ZONA: TfraStaticCTB_TABLAS
            Left = 113
            Top = -243
            Width = 279
            Height = 23
            TabOrder = 22
            ExplicitLeft = 113
            ExplicitTop = -243
            ExplicitWidth = 279
            DesignSize = (
              279
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 245
              ExplicitLeft = 32
              ExplicitWidth = 245
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
          inline fraAE_NATURALEZA: TfraStaticCTB_TABLAS
            Left = 458
            Top = -242
            Width = 271
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 23
            ExplicitLeft = 458
            ExplicitTop = -242
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
              Width = 237
              ExplicitLeft = 32
              ExplicitWidth = 237
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
          inline fraAE_FORMA: TfraStaticCTB_TABLAS
            Left = 113
            Top = -216
            Width = 279
            Height = 23
            TabOrder = 24
            ExplicitLeft = 113
            ExplicitTop = -216
            ExplicitWidth = 279
            DesignSize = (
              279
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 245
              ExplicitLeft = 32
              ExplicitWidth = 245
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
          inline fraAE_AGENTE: TfraStaticCTB_TABLAS
            Left = 458
            Top = -215
            Width = 271
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 25
            ExplicitLeft = 458
            ExplicitTop = -215
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
              Width = 237
              ExplicitLeft = 32
              ExplicitWidth = 237
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
          object mskAE_CUIT: TMaskEdit
            Left = 646
            Top = -155
            Width = 81
            Height = 21
            Hint = 'CUIL del Trabajador'
            Anchors = [akTop, akRight]
            EditMask = '99-99999999-c;0;'
            MaxLength = 13
            TabOrder = 27
            OnExit = mskAE_CUITExit
          end
          object edAE_EMPRESA: TPatternEdit
            Left = 113
            Top = -155
            Width = 485
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 60
            TabOrder = 26
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          inline fraAE_IDACTIVIDAD: TfraStaticCodigoDescripcion
            Left = 112
            Top = -130
            Width = 620
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 28
            ExplicitLeft = 112
            ExplicitTop = -130
            ExplicitWidth = 620
            DesignSize = (
              620
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 557
              ExplicitLeft = 59
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
          inline fraDomicilioAccidenteEstabl: TfraDomicilioTrab
            Left = 9
            Top = -102
            Width = 718
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 29
            ExplicitLeft = 9
            ExplicitTop = -102
            ExplicitWidth = 718
            DesignSize = (
              718
              50)
            inherited lbNro: TLabel
              Left = 503
              ExplicitLeft = 503
            end
            inherited lbPiso: TLabel
              Left = 575
              Width = 20
              ExplicitLeft = 575
              ExplicitWidth = 20
            end
            inherited lbDto: TLabel
              Left = 651
              Width = 20
              ExplicitLeft = 651
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
              Left = 556
              Width = 44
              ExplicitLeft = 556
              ExplicitWidth = 44
            end
            inherited cmbCalle: TArtComboBox
              Left = 104
              Width = 393
              ExplicitLeft = 104
              ExplicitWidth = 393
            end
            inherited edNumero: TEdit
              Left = 525
              ExplicitLeft = 525
            end
            inherited edPiso: TEdit
              Left = 601
              ExplicitLeft = 601
            end
            inherited edDto: TEdit
              Left = 673
              ExplicitLeft = 673
            end
            inherited edCPostal: TIntEdit
              Left = 104
              ExplicitLeft = 104
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 301
              Width = 249
              ExplicitLeft = 301
              ExplicitWidth = 249
            end
            inherited edProvincia: TEdit
              Left = 605
              ExplicitLeft = 605
            end
            inherited edCPA: TPatternEdit
              Left = 186
              TabStop = True
              ExplicitLeft = 186
            end
          end
          object edCodAreaAccidenteEstabl: TPatternEdit
            Left = 113
            Top = -46
            Width = 50
            Height = 21
            MaxLength = 4
            TabOrder = 30
            Pattern = '0123456789'
          end
          object edAE_TELEFONOS: TPatternEdit
            Left = 194
            Top = -46
            Width = 232
            Height = 21
            MaxLength = 30
            TabOrder = 31
            Pattern = ' 0123456789()-/'
          end
          inline fraAE_IDART: TfraStaticCodigoDescripcion
            Left = 462
            Top = -47
            Width = 267
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 32
            ExplicitLeft = 462
            ExplicitTop = -47
            ExplicitWidth = 267
            DesignSize = (
              267
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              MaxLength = 6
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 206
              ExplicitLeft = 59
              ExplicitWidth = 206
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
          inline fraAE_PROGRAMAEMPRESA: TfraStaticCTB_TABLAS
            Left = 112
            Top = -19
            Width = 620
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 33
            ExplicitLeft = 112
            ExplicitTop = -19
            ExplicitWidth = 620
            DesignSize = (
              620
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 31
              Width = 583
              ExplicitLeft = 31
              ExplicitWidth = 583
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
          inline fraAE_IDOPERATIVOEMPRESA: TfraStaticCodigoDescripcion
            Left = 112
            Top = 9
            Width = 618
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 34
            ExplicitLeft = 112
            ExplicitTop = 9
            ExplicitWidth = 618
            DesignSize = (
              618
              23)
            inherited edCodigo: TPatternEdit
              Width = 56
              MaxLength = 6
              Pattern = '0123456789'
              ExplicitWidth = 56
            end
            inherited cmbDescripcion: TComboGrid
              Left = 59
              Width = 555
              ExplicitLeft = 59
              ExplicitWidth = 555
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
            Left = 111
            Top = 33
            Width = 207
            Height = 38
            Caption = 'Tipo de Establecimiento'
            Columns = 2
            Items.Strings = (
              'Establecimiento'
              'Obra')
            TabOrder = 35
            TabStop = True
            OnClick = rgAE_TIPOESTABLECIMIENTOClick
          end
          object edAE_DOTACIONESTABLECIMIENTO: TIntEdit
            Left = 548
            Top = 41
            Width = 56
            Height = 21
            TabOrder = 37
            MaxLength = 6
            MaxValue = 999999
          end
          object edAE_NROESTABLECIMIENTO: TIntEdit
            Left = 434
            Top = 41
            Width = 56
            Height = 21
            TabOrder = 36
            MaxLength = 8
            MaxValue = 99999999
          end
          inline fraAE_LUGARDEOCURRENCIA: TfraStaticCTB_TABLAS
            Left = 112
            Top = 76
            Width = 272
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 38
            ExplicitLeft = 112
            ExplicitTop = 76
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
              Width = 238
              ExplicitLeft = 32
              ExplicitWidth = 238
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
            Left = 473
            Top = 76
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 39
          end
          object edAE_FINICIOACTIVIDAD: TDateComboBox
            Left = 638
            Top = 76
            Width = 88
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 40
          end
          object edAE_SUPERFICIE: TCurrencyEdit
            Left = 113
            Top = 105
            Width = 82
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxLength = 12
            MaxValue = 999999999.990000000000000000
            TabOrder = 41
          end
          object edAE_PLANTAS: TIntEdit
            Left = 270
            Top = 105
            Width = 34
            Height = 21
            TabOrder = 42
            MaxLength = 2
            MaxValue = 99
          end
          inline fraAE_TIPOOBRA: TfraStaticCTB_TABLAS
            Left = 384
            Top = 104
            Width = 342
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 43
            ExplicitLeft = 384
            ExplicitTop = 104
            ExplicitWidth = 342
            DesignSize = (
              342
              23)
            inherited edCodigo: TPatternEdit
              Width = 28
              ExplicitWidth = 28
            end
            inherited cmbDescripcion: TComboGrid
              Left = 32
              Width = 310
              ExplicitLeft = 32
              ExplicitWidth = 310
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
            Top = 132
            Width = 272
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 44
            ExplicitLeft = 112
            ExplicitTop = 132
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
              Width = 238
              ExplicitLeft = 32
              ExplicitWidth = 238
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
            Left = 456
            Top = 132
            Width = 272
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 45
            ExplicitLeft = 456
            ExplicitTop = 132
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
              Width = 238
              ExplicitLeft = 32
              ExplicitWidth = 238
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
            Top = 163
            Width = 121
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Programa Aprobado'
            TabOrder = 46
          end
          inline fraAE_PROGRAMASEGURIDAD: TfraStaticCTB_TABLAS
            Left = 222
            Top = 161
            Width = 328
            Height = 23
            TabOrder = 47
            ExplicitLeft = 222
            ExplicitTop = 161
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
              Width = 294
              ExplicitLeft = 32
              ExplicitWidth = 294
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
            Top = 191
            Width = 88
            Height = 21
            TabOrder = 48
          end
          object edAE_FSUSPOBRA: TDateComboBox
            Left = 281
            Top = 191
            Width = 88
            Height = 21
            TabOrder = 49
          end
          object edAE_FREINICIOOBRA: TDateComboBox
            Left = 460
            Top = 191
            Width = 88
            Height = 21
            TabOrder = 50
          end
          object edEX_FECHAACCIDENTE: TDateComboBox
            Left = 113
            Top = 331
            Width = 88
            Height = 21
            TabOrder = 52
          end
          object chkAE_TURNOROTATIVO: TCheckBox
            Left = 6
            Top = 363
            Width = 120
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Turno Rotativo'
            TabOrder = 55
          end
          object chkAE_HORASEXTRAS: TCheckBox
            Left = 445
            Top = 363
            Width = 83
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Horas Extras'
            TabOrder = 58
          end
          object edEX_HORAACCIDENTE: TDateTimePicker
            Left = 246
            Top = 332
            Width = 68
            Height = 21
            Date = 37372.500000000000000000
            Time = 37372.500000000000000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 53
          end
          object edAE_HORARIODESDE: TDateTimePicker
            Left = 246
            Top = 361
            Width = 68
            Height = 21
            Date = 37372.500000000000000000
            Time = 37372.500000000000000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 56
          end
          object edAE_HORARIOHASTA: TDateTimePicker
            Left = 357
            Top = 361
            Width = 68
            Height = 21
            Date = 37372.500000000000000000
            Time = 37372.500000000000000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 57
          end
          object edAE_TAREASHABITUALES: TMemo
            Left = 113
            Top = 390
            Width = 611
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 59
          end
          object edAE_TAREASACCIDENTE: TMemo
            Left = 113
            Top = 469
            Width = 611
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 60
          end
          object edAE_DESCRIPCIONACCIDENTE: TMemo
            Left = 113
            Top = 548
            Width = 611
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 3000
            TabOrder = 61
          end
          object edAE_HECHOSADICIONALES: TMemo
            Left = 113
            Top = 628
            Width = 611
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 2000
            TabOrder = 62
          end
          object edAE_TITULO: TPatternEdit
            Left = 522
            Top = 856
            Width = 200
            Height = 21
            Anchors = [akTop, akRight]
            MaxLength = 60
            TabOrder = 64
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          inline fraAE_TIPOMATRICULA: TfraStaticCTB_TABLAS
            Left = 112
            Top = 884
            Width = 426
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 65
            ExplicitLeft = 112
            ExplicitTop = 884
            ExplicitWidth = 426
            DesignSize = (
              426
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
          object edAE_INSTITUCIONOTORGANTE: TPatternEdit
            Left = 113
            Top = 910
            Width = 422
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 60
            TabOrder = 67
            Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
          end
          object edAE_FECHA: TDateComboBox
            Left = 637
            Top = 910
            Width = 86
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 68
          end
          object edAE_OTROSDATOS: TMemo
            Left = 113
            Top = 736
            Width = 611
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1000
            TabOrder = 63
          end
          object edAE_NUMEROMATRICULA: TEdit
            Left = 636
            Top = 885
            Width = 86
            Height = 21
            Anchors = [akTop, akRight]
            MaxLength = 15
            TabOrder = 66
          end
          object edTJ_OTRANACIONALIDAD: TEdit
            Left = 597
            Top = -696
            Width = 131
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 30
            TabOrder = 6
          end
          inline fraPreventor: TfraCodigoDescripcion
            Left = 7
            Top = 855
            Width = 282
            Height = 23
            TabOrder = 69
            ExplicitLeft = 7
            ExplicitTop = 855
            ExplicitWidth = 282
            DesignSize = (
              282
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 217
              CharCase = ecUpperCase
              OnCloseUp = fraPreventorcmbDescripcionCloseUp
              OnDropDown = fraPreventorcmbDescripcionDropDown
              ExplicitWidth = 217
            end
            inherited edCodigo: TPatternEdit
              CharCase = ecNormal
            end
          end
          object edAE_RESPONSABLE: TPatternEdit
            Left = 306
            Top = 856
            Width = 200
            Height = 21
            Anchors = [akTop, akRight]
            Color = clInactiveCaptionText
            Enabled = False
            MaxLength = 60
            TabOrder = 70
          end
          object cbPRAM: TCheckBox
            Left = 324
            Top = 334
            Width = 80
            Height = 17
            Alignment = taLeftJustify
            Caption = 'PRAM'
            TabOrder = 54
          end
        end
      end
      object tsEntrevistas: TTabSheet
        Caption = 'Personas Entrevistadas/Testigos'
        ImageIndex = 1
        object dbgPPE_PERSONAENTREVISTADA: TRxDBGrid
          Left = 0
          Top = 29
          Width = 756
          Height = 373
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
          Width = 756
          Height = 29
          Bands = <
            item
              Control = tBarPPE_PERSONAENTREVISTADA
              ImageIndex = -1
              MinHeight = 27
              Width = 750
            end>
          object tBarPPE_PERSONAENTREVISTADA: TToolBar
            Left = 9
            Top = 0
            Width = 743
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
      object tsCausasMedidasSeguim: TTabSheet
        Caption = 'Causas/Medidas/Seguimiento'
        ImageIndex = 2
        object pcCausasMedidasSeguim: TPageControl
          Left = 0
          Top = 0
          Width = 756
          Height = 402
          ActivePage = tsCausas
          Align = alClient
          TabOrder = 0
          OnChange = pcCausasMedidasSeguimChange
          object tsCausas: TTabSheet
            Caption = 'Causas'
            object CoolBar2: TCoolBar
              Left = 0
              Top = 0
              Width = 748
              Height = 29
              Bands = <
                item
                  Control = tBarPDC_DIAGNOSTICOCAUSA
                  ImageIndex = -1
                  MinHeight = 27
                  Width = 742
                end>
              object tBarPDC_DIAGNOSTICOCAUSA: TToolBar
                Left = 9
                Top = 0
                Width = 735
                Height = 27
                BorderWidth = 1
                Caption = 'ToolBar'
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
                  Enabled = False
                  ImageIndex = 8
                  OnClick = tbPDCEliminarClick
                end
              end
            end
            object dbgPDC_DIAGNOSTICOCAUSA: TRxDBGrid
              Left = 0
              Top = 29
              Width = 748
              Height = 345
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
              RowColor2 = 16776176
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
              Left = 80
              Top = 58
              Width = 505
              Height = 209
              Caption = 'Causa'
              FormWidth = 0
              FormHeigth = 0
              FormLeft = 0
              FormTop = 0
              BorderIcons = []
              Position = poScreenCenter
              ActiveControl = edDC_DESCRIPCION
              Constraints.MaxHeight = 209
              Constraints.MaxWidth = 505
              Constraints.MinHeight = 209
              Constraints.MinWidth = 505
              OnEnter = fpPCD_DIAGNOSTICOCAUSAEnter
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
              object cbNoDeterminada: TCheckBox
                Left = 10
                Top = 184
                Width = 97
                Height = 17
                Caption = 'No determinada'
                TabOrder = 4
              end
            end
          end
          object tsMedidasCorrectivas: TTabSheet
            Caption = 'Medidas Correctivas'
            ImageIndex = 1
            object Splitter1: TSplitter
              Left = 499
              Top = 0
              Width = 5
              Height = 374
              Align = alRight
            end
            object pcCausasVisitas: TPageControl
              Left = 504
              Top = 0
              Width = 244
              Height = 374
              ActivePage = tsSeguimientoVisitas
              Align = alRight
              TabOrder = 0
              OnChange = pcCausasVisitasChange
              object tsCausaMedidas: TTabSheet
                Caption = 'Causas'
                object CoolBar4: TCoolBar
                  Left = 0
                  Top = 0
                  Width = 236
                  Height = 29
                  Bands = <
                    item
                      Control = tBarPCM_CAUSAYMEDIDA
                      ImageIndex = -1
                      MinHeight = 27
                      Width = 230
                    end>
                  object tBarPCM_CAUSAYMEDIDA: TToolBar
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
                    object tbPCMNuevo: TToolButton
                      Left = 0
                      Top = 0
                      Hint = 'Nuevo (Ctrl+N)'
                      ImageIndex = 6
                      OnClick = tbPCMNuevoClick
                    end
                    object tbPCMEliminar: TToolButton
                      Left = 23
                      Top = 0
                      Hint = 'Eliminar (Cltr+Del)'
                      Enabled = False
                      ImageIndex = 8
                      OnClick = tbPCMEliminarClick
                    end
                  end
                end
                object dbgPCM_CAUSAYMEDIDA: TRxDBGrid
                  Left = 0
                  Top = 29
                  Width = 236
                  Height = 317
                  Align = alClient
                  DataSource = dsPCM_CAUSAYMEDIDA
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  IniStorage = FormStorage
                  RowColor2 = 16776176
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
                      Width = 171
                      Visible = True
                    end>
                end
                object fpPCM_CAUSAYMEDIDA: TFormPanel
                  Left = -146
                  Top = 79
                  Width = 428
                  Height = 103
                  Caption = 'Causa relacionada con la Medida Correctiva'
                  FormWidth = 0
                  FormHeigth = 0
                  FormLeft = 0
                  FormTop = 0
                  BorderIcons = []
                  Position = poScreenCenter
                  ActiveControl = fraPDC_DIAGNOSTICOCAUSA_ESTABL.edCodigo
                  Constraints.MaxHeight = 103
                  Constraints.MinHeight = 103
                  Constraints.MinWidth = 428
                  OnEnter = fpPCM_CAUSAYMEDIDAEnter
                  DesignSize = (
                    428
                    103)
                  object Bevel13: TBevel
                    Left = 4
                    Top = 68
                    Width = 420
                    Height = 3
                    Anchors = [akLeft, akRight, akBottom]
                    Shape = bsTopLine
                  end
                  object Label67: TLabel
                    Left = 8
                    Top = 12
                    Width = 73
                    Height = 13
                    Caption = 'Nro. de Medida'
                  end
                  object Label68: TLabel
                    Left = 8
                    Top = 41
                    Width = 30
                    Height = 13
                    Caption = 'Causa'
                  end
                  object btPCMAceptar: TButton
                    Left = 269
                    Top = 74
                    Width = 75
                    Height = 25
                    Anchors = [akRight, akBottom]
                    Caption = '&Aceptar'
                    TabOrder = 2
                    OnClick = btPCMAceptarClick
                  end
                  object btPCMCancelar: TButton
                    Left = 348
                    Top = 74
                    Width = 75
                    Height = 25
                    Anchors = [akRight, akBottom]
                    Cancel = True
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 3
                  end
                  object edMC_MEDIDACAUSA: TIntEdit
                    Left = 87
                    Top = 9
                    Width = 38
                    Height = 21
                    TabOrder = 0
                    MaxLength = 0
                  end
                  inline fraPDC_DIAGNOSTICOCAUSA_ESTABL: TfraStaticCodigoDescripcion
                    Left = 86
                    Top = 36
                    Width = 360
                    Height = 23
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ExplicitLeft = 86
                    ExplicitTop = 36
                    ExplicitWidth = 360
                    DesignSize = (
                      360
                      23)
                    inherited edCodigo: TPatternEdit
                      Width = 36
                      ExplicitWidth = 36
                    end
                    inherited cmbDescripcion: TComboGrid
                      Left = 39
                      Width = 297
                      ExplicitLeft = 39
                      ExplicitWidth = 297
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
              end
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
                  Height = 317
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
              Width = 499
              Height = 374
              Align = alClient
              TabOrder = 1
              object CoolBar3: TCoolBar
                Left = 1
                Top = 1
                Width = 497
                Height = 29
                Bands = <
                  item
                    Control = tBarPMC_MEDIDACORRECTIVA
                    ImageIndex = -1
                    MinHeight = 27
                    Width = 491
                  end>
                object tBarPMC_MEDIDACORRECTIVA: TToolBar
                  Left = 9
                  Top = 0
                  Width = 484
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
                Width = 497
                Height = 343
                Align = alClient
                DataSource = dsPMC_MEDIDACORRECTIVA
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = tbPMCModificarClick
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
                Top = 8
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
      object tsAccidentesMultiples: TTabSheet
        Caption = 'Accidentes M'#250'ltiples'
        ImageIndex = 3
        object dbgPAM_ACCIDENTEMULTIPLE: TRxDBGrid
          Left = 0
          Top = 29
          Width = 756
          Height = 373
          Align = alClient
          DataSource = dsPAM_ACCIDENTEMULTIPLE
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = tbPAMModificarClick
          IniStorage = FormStorage
          RowColor2 = 16776176
          Columns = <
            item
              Expanded = False
              FieldName = 'EX_SINIESTRO'
              Title.Alignment = taCenter
              Title.Caption = 'Siniestro'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EX_ORDEN'
              Title.Alignment = taCenter
              Title.Caption = 'Orden'
              Width = 41
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TJ_CUIL'
              Title.Alignment = taCenter
              Title.Caption = 'CUIL'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TJ_NOMBRE'
              Title.Caption = 'Trabajador'
              Width = 184
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AM_DETALLELESION'
              Title.Caption = 'Diagn'#243'stico'
              Width = 388
              Visible = True
            end>
        end
        object CoolBar6: TCoolBar
          Left = 0
          Top = 0
          Width = 756
          Height = 29
          Bands = <
            item
              Control = tBarPAM_ACCIDENTEMULTIPLE
              ImageIndex = -1
              MinHeight = 27
              Width = 750
            end>
          object tBarPAM_ACCIDENTEMULTIPLE: TToolBar
            Left = 9
            Top = 0
            Width = 743
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbTraerSiniestrosMultiples: TToolButton
              Left = 0
              Top = 0
              Hint = 'Traer siniestros m'#250'ltiples'
              Caption = 'Traer siniestros m'#250'ltiples'
              ImageIndex = 22
              OnClick = tbTraerSiniestrosMultiplesClick
            end
            object tbPAMModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              ImageIndex = 7
              OnClick = tbPAMModificarClick
            end
          end
        end
        object fpPAM_ACCIDENTEMULTIPLE: TFormPanel
          Left = 32
          Top = 76
          Width = 505
          Height = 182
          Caption = 'Detalle de la Lesi'#243'n'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderIcons = []
          Position = poScreenCenter
          ActiveControl = edAM_DETALLELESION
          Constraints.MaxHeight = 182
          Constraints.MaxWidth = 505
          Constraints.MinHeight = 182
          Constraints.MinWidth = 505
          DesignSize = (
            505
            182)
          object Bevel14: TBevel
            Left = 4
            Top = 147
            Width = 497
            Height = 3
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object btPAMAceptar: TButton
            Left = 346
            Top = 153
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 1
            OnClick = btPAMAceptarClick
          end
          object btPAMCancelar: TButton
            Left = 425
            Top = 153
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 2
          end
          object edAM_DETALLELESION: TMemo
            Left = 5
            Top = 10
            Width = 493
            Height = 129
            Anchors = [akLeft, akTop, akRight, akBottom]
            MaxLength = 1000
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 611
    Top = 519
    ExplicitLeft = 611
    ExplicitTop = 519
  end
  inherited btnCancelar: TButton
    Left = 689
    Top = 519
    ExplicitLeft = 689
    ExplicitTop = 519
  end
  inherited btnAplicar: TButton
    Left = 529
    Top = 519
    ExplicitLeft = 529
    ExplicitTop = 519
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 16467
        LinkControl = tbSalir2
      end>
    Left = 674
    Top = 4
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 618
    Top = 4
  end
  inherited FormStorage: TFormStorage
    Left = 646
    Top = 4
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT'
      '    AE_ID,'
      '    AE_NRODENUNCIASRT,'
      '    AE_PROGRAMA,'
      '    AE_IDOPERATIVO,'
      '    AE_DOTACION,'
      '    AE_ZONA,'
      '    AE_NATURALEZA,'
      '    AE_FORMA,'
      '    AE_AGENTE,'
      '    AE_EMPRESA,'
      '    AE_CUIT,'
      '    AE_IDACTIVIDAD,'
      '    AE_CPOSTAL,'
      '    AE_CALLE,'
      '    AE_LOCALIDAD,'
      '    AE_PROVINCIA,'
      '    AE_NUMERO,'
      '    AE_PISO,'
      '    AE_DEPARTAMENTO,'
      '    AE_CPOSTALA,'
      '    AE_TELEFONOS,'
      '    AE_IDART,'
      '    AE_PROGRAMAEMPRESA,'
      '    AE_IDOPERATIVOEMPRESA,'
      '    AE_TIPOESTABLECIMIENTO,'
      '    AE_NROESTABLECIMIENTO,'
      '    AE_DOTACIONESTABLECIMIENTO,'
      '    AE_LUGARDEOCURRENCIA,'
      '    AE_FRECEPCIONOBRA,'
      '    AE_FINICIOACTIVIDAD,'
      '    AE_SUPERFICIE,'
      '    AE_PLANTAS,'
      '    AE_TIPOOBRA,'
      '    AE_ACTIVIDADOBRA,'
      '    AE_ETAPAOBRA,'
      '    AE_PROGRAMAAPROBADO,'
      '    AE_PROGRAMASEGURIDAD,'
      '    AE_FFINOBRA,'
      '    AE_FSUSPOBRA,'
      '    AE_FREINICIOOBRA,'
      '    AE_OBSERVACIONES,'
      '    AE_TURNOROTATIVO,'
      '    AE_HORARIODESDE,'
      '    AE_HORARIOHASTA,'
      '    AE_HORASEXTRAS,'
      '    AE_TAREASHABITUALES,'
      '    AE_TAREASACCIDENTE,'
      '    AE_DESCRIPCIONACCIDENTE,'
      '    AE_HECHOSADICIONALES,'
      '    AE_OTROSDATOS,'
      '    AE_RESPONSABLE,'
      '    AE_TITULO,'
      '    AE_TIPOMATRICULA,'
      '    AE_NUMEROMATRICULA,'
      '    AE_INSTITUCIONOTORGANTE,'
      '    AE_FECHA,'
      '    AE_USUALTA USUARIO,'
      '    AE_FECHABAJA,'
      '    PV_DESCRIPCION PROVACCESTABL,'
      '    AE_IDIT,'
      '    AE_PRAM,'
      '    AE_IDEXPEDIENTE'
      'FROM CPV_PROVINCIAS, PAE_ACCIDENTEESTABLECIMIENTO'
      'WHERE AE_ID = :ID'
      '  AND AE_PROVINCIA=PV_CODIGO(+)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = sduConsulta
    Left = 618
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 646
    Top = 32
  end
  object sduConsulta: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PAE_ACCIDENTEESTABLECIMIENTO'
      '   SET AE_NRODENUNCIASRT = :AE_NRODENUNCIASRT,'
      '       AE_PROGRAMA = :AE_PROGRAMA,'
      '       AE_IDOPERATIVO = :AE_IDOPERATIVO,'
      '       AE_DOTACION = :AE_DOTACION,'
      '       AE_ZONA = :AE_ZONA,'
      '       AE_NATURALEZA = :AE_NATURALEZA,'
      '       AE_FORMA = :AE_FORMA,'
      '       AE_AGENTE = :AE_AGENTE,'
      '       AE_EMPRESA = :AE_EMPRESA,'
      '       AE_CUIT = :AE_CUIT,'
      '       AE_IDACTIVIDAD = :AE_IDACTIVIDAD,'
      '       AE_CPOSTAL = :AE_CPOSTAL,'
      '       AE_CALLE = :AE_CALLE,'
      '       AE_LOCALIDAD = :AE_LOCALIDAD,'
      '       AE_PROVINCIA = :AE_PROVINCIA,'
      '       AE_NUMERO = :AE_NUMERO,'
      '       AE_PISO = :AE_PISO,'
      '       AE_DEPARTAMENTO = :AE_DEPARTAMENTO,'
      '       AE_CPOSTALA = :AE_CPOSTALA,'
      '       AE_TELEFONOS = :AE_TELEFONOS,'
      '       AE_IDART = :AE_IDART,'
      '       AE_PROGRAMAEMPRESA = :AE_PROGRAMAEMPRESA,'
      '       AE_IDOPERATIVOEMPRESA = :AE_IDOPERATIVOEMPRESA,'
      '       AE_TIPOESTABLECIMIENTO = :AE_TIPOESTABLECIMIENTO,'
      '       AE_NROESTABLECIMIENTO = :AE_NROESTABLECIMIENTO,'
      '       AE_DOTACIONESTABLECIMIENTO = :AE_DOTACIONESTABLECIMIENTO,'
      '       AE_LUGARDEOCURRENCIA = :AE_LUGARDEOCURRENCIA,'
      '       AE_FRECEPCIONOBRA = :AE_FRECEPCIONOBRA,'
      '       AE_FINICIOACTIVIDAD = :AE_FINICIOACTIVIDAD,'
      '       AE_SUPERFICIE = :AE_SUPERFICIE,'
      '       AE_PLANTAS = :AE_PLANTAS,'
      '       AE_TIPOOBRA = :AE_TIPOOBRA,'
      '       AE_ACTIVIDADOBRA = :AE_ACTIVIDADOBRA,'
      '       AE_ETAPAOBRA = :AE_ETAPAOBRA,'
      '       AE_PROGRAMAAPROBADO = :AE_PROGRAMAAPROBADO,'
      '       AE_PROGRAMASEGURIDAD = :AE_PROGRAMASEGURIDAD,'
      '       AE_FFINOBRA = :AE_FFINOBRA,'
      '       AE_FSUSPOBRA = :AE_FSUSPOBRA,'
      '       AE_FREINICIOOBRA = :AE_FREINICIOOBRA,'
      '       AE_OBSERVACIONES = :AE_OBSERVACIONES,'
      '       AE_TURNOROTATIVO = :AE_TURNOROTATIVO,'
      '       AE_HORARIODESDE = :AE_HORARIODESDE,'
      '       AE_HORARIOHASTA = :AE_HORARIOHASTA,'
      '       AE_HORASEXTRAS = :AE_HORASEXTRAS,'
      '       AE_TAREASHABITUALES = :AE_TAREASHABITUALES,'
      '       AE_TAREASACCIDENTE = :AE_TAREASACCIDENTE,'
      '       AE_DESCRIPCIONACCIDENTE = :AE_DESCRIPCIONACCIDENTE,'
      '       AE_HECHOSADICIONALES = :AE_HECHOSADICIONALES,'
      '       AE_OTROSDATOS = :AE_OTROSDATOS,'
      '       AE_RESPONSABLE = :AE_RESPONSABLE,'
      '       AE_TITULO = :AE_TITULO,'
      '       AE_TIPOMATRICULA = :AE_TIPOMATRICULA,'
      '       AE_NUMEROMATRICULA = :AE_NUMEROMATRICULA,'
      '       AE_INSTITUCIONOTORGANTE = :AE_INSTITUCIONOTORGANTE,'
      '       AE_FECHA = :AE_FECHA,'
      '       AE_FECHAMODIF = SYSDATE,'
      '       AE_USUMODIF = :USUARIO,'
      '       AE_IDIT = :AE_IDIT,'
      '       AE_PRAM = :AE_PRAM,'
      '       AE_IDEXPEDIENTE = :AE_IDEXPEDIENTE'
      ' WHERE AE_ID = :AE_ID')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PAE_ACCIDENTEESTABLECIMIENTO'
      '(AE_ID, AE_NRODENUNCIASRT, AE_PROGRAMA, AE_IDOPERATIVO,'
      ' AE_DOTACION, AE_ZONA, AE_NATURALEZA, AE_FORMA,'
      ' AE_AGENTE, AE_EMPRESA, AE_CUIT, AE_IDACTIVIDAD,'
      ' AE_CPOSTAL, AE_CALLE, AE_LOCALIDAD, AE_PROVINCIA,'
      ' AE_NUMERO, AE_PISO, AE_DEPARTAMENTO, AE_CPOSTALA,'
      
        ' AE_TELEFONOS, AE_IDART, AE_PROGRAMAEMPRESA, AE_IDOPERATIVOEMPRE' +
        'SA,'
      
        ' AE_TIPOESTABLECIMIENTO, AE_NROESTABLECIMIENTO, AE_DOTACIONESTAB' +
        'LECIMIENTO, AE_LUGARDEOCURRENCIA,'
      
        ' AE_FRECEPCIONOBRA, AE_FINICIOACTIVIDAD, AE_SUPERFICIE, AE_PLANT' +
        'AS,'
      
        ' AE_TIPOOBRA, AE_ACTIVIDADOBRA, AE_ETAPAOBRA, AE_PROGRAMAAPROBAD' +
        'O,'
      
        ' AE_PROGRAMASEGURIDAD, AE_FFINOBRA, AE_FSUSPOBRA, AE_FREINICIOOB' +
        'RA,'
      
        ' AE_OBSERVACIONES, AE_TURNOROTATIVO, AE_HORARIODESDE, AE_HORARIO' +
        'HASTA,'
      
        ' AE_HORASEXTRAS, AE_TAREASHABITUALES, AE_TAREASACCIDENTE, AE_DES' +
        'CRIPCIONACCIDENTE,'
      
        ' AE_HECHOSADICIONALES, AE_RESPONSABLE, AE_TITULO, AE_TIPOMATRICU' +
        'LA,'
      
        ' AE_NUMEROMATRICULA, AE_INSTITUCIONOTORGANTE, AE_FECHA, AE_OTROS' +
        'DATOS,'
      ' AE_FECHAALTA, AE_USUALTA, AE_IDIT, AE_PRAM, AE_IDEXPEDIENTE)'
      'VALUES'
      '(:AE_ID, :AE_NRODENUNCIASRT, :AE_PROGRAMA, :AE_IDOPERATIVO,'
      ' :AE_DOTACION, :AE_ZONA, :AE_NATURALEZA, :AE_FORMA,'
      ' :AE_AGENTE, :AE_EMPRESA, :AE_CUIT, :AE_IDACTIVIDAD,'
      ' :AE_CPOSTAL, :AE_CALLE, :AE_LOCALIDAD, :AE_PROVINCIA,'
      ' :AE_NUMERO, :AE_PISO, :AE_DEPARTAMENTO, :AE_CPOSTALA,'
      
        ' :AE_TELEFONOS, :AE_IDART, :AE_PROGRAMAEMPRESA, :AE_IDOPERATIVOE' +
        'MPRESA,'
      
        ' :AE_TIPOESTABLECIMIENTO, :AE_NROESTABLECIMIENTO, :AE_DOTACIONES' +
        'TABLECIMIENTO, :AE_LUGARDEOCURRENCIA,'
      
        ' :AE_FRECEPCIONOBRA, :AE_FINICIOACTIVIDAD, :AE_SUPERFICIE, :AE_P' +
        'LANTAS,'
      
        ' :AE_TIPOOBRA, :AE_ACTIVIDADOBRA, :AE_ETAPAOBRA, :AE_PROGRAMAAPR' +
        'OBADO,'
      
        ' :AE_PROGRAMASEGURIDAD, :AE_FFINOBRA, :AE_FSUSPOBRA, :AE_FREINIC' +
        'IOOBRA,'
      
        ' :AE_OBSERVACIONES, :AE_TURNOROTATIVO, :AE_HORARIODESDE, :AE_HOR' +
        'ARIOHASTA,'
      
        ' :AE_HORASEXTRAS, :AE_TAREASHABITUALES, :AE_TAREASACCIDENTE, :AE' +
        '_DESCRIPCIONACCIDENTE,'
      
        ' :AE_HECHOSADICIONALES, :AE_RESPONSABLE, :AE_TITULO, :AE_TIPOMAT' +
        'RICULA,'
      
        ' :AE_NUMEROMATRICULA, :AE_INSTITUCIONOTORGANTE, :AE_FECHA, :AE_O' +
        'TROSDATOS,'
      ' SYSDATE, :USUARIO,:AE_IDIT, :AE_PRAM, :AE_IDEXPEDIENTE)')
    DeleteSQL.Strings = (
      'delete from HYS.PAE_ACCIDENTEESTABLECIMIENTO'
      'where'
      '  AE_ID = :OLD_AE_ID')
    Left = 674
    Top = 32
  end
  object sdqPPE_PERSONAENTREVISTADA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRelacionesAfterOpen
    SQL.Strings = (
      'SELECT'
      '    PE_ID,'
      '    PE_IDACCIDENTEESTABLECIMIENTO,'
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
      'FROM CTB_TABLAS TIPODOCUMENTO, HYS.PPE_PERSONAENTREVISTADA'
      'WHERE PE_IDACCIDENTEESTABLECIMIENTO = :ID'
      '  AND TIPODOCUMENTO.TB_CODIGO(+)=PE_TIPODOCUMENTO'
      '  AND TIPODOCUMENTO.TB_CLAVE(+)='#39'TDOCN'#39
      'ORDER BY PE_ID'
      ' '
      ' '
      ' ')
    UpdateObject = sduPPE_PERSONAENTREVISTADA
    Left = 618
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPPE_PERSONAENTREVISTADA: TDataSource
    DataSet = sdqPPE_PERSONAENTREVISTADA
    Left = 646
    Top = 60
  end
  object sduPPE_PERSONAENTREVISTADA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PPE_PERSONAENTREVISTADA'
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
      'INSERT INTO HYS.PPE_PERSONAENTREVISTADA'
      
        '(PE_ID, PE_IDACCIDENTEESTABLECIMIENTO, PE_TIPODOCUMENTO, PE_DOCU' +
        'MENTO, PE_CUIL, PE_NOMBRE, PE_CARGO, PE_FECHA_ENTREVISTA, PE_TIP' +
        'O_ENTREVISTA, PE_FECHAALTA, PE_USUALTA)'
      'VALUES'
      
        '(:PE_ID, :PE_IDACCIDENTEESTABLECIMIENTO, :PE_TIPODOCUMENTO, :PE_' +
        'DOCUMENTO, :PE_CUIL, :PE_NOMBRE, :PE_CARGO, :PE_FECHA_ENTREVISTA' +
        ', :PE_TIPO_ENTREVISTA, SYSDATE, :USUARIO)'
      '')
    DeleteSQL.Strings = (
      'delete from HYS.PPE_PERSONAENTREVISTADA'
      'where'
      '  PE_ID = :OLD_PE_ID and'
      
        '  PE_IDACCIDENTEESTABLECIMIENTO = :OLD_PE_IDACCIDENTEESTABLECIMI' +
        'ENTO')
    Left = 674
    Top = 60
  end
  object sdqPDC_DIAGNOSTICOCAUSA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRelacionesAfterOpen
    SQL.Strings = (
      'SELECT DC_ID,'
      '       DC_IDACCIDENTEESTABLECIMIENTO,'
      '       DC_NUMERO,'
      '       DC_DESCRIPCION,'
      '       DC_USUALTA USUARIO,'
      '       DC_USUBAJA,'
      '       DC_FECHABAJA,'
      '       DC_FECHAEXPORT,'
      '       DC_NODETERMINADA'
      '  FROM HYS.PDC_DIAGNOSTICOCAUSA'
      ' WHERE DC_IDACCIDENTEESTABLECIMIENTO = :ID'
      'ORDER BY DC_NUMERO'
      '')
    UpdateObject = sduPDC_DIAGNOSTICOCAUSA
    Left = 618
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPDC_DIAGNOSTICOCAUSA: TDataSource
    DataSet = sdqPDC_DIAGNOSTICOCAUSA
    Left = 646
    Top = 88
  end
  object sduPDC_DIAGNOSTICOCAUSA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PDC_DIAGNOSTICOCAUSA'
      '   SET DC_DESCRIPCION = :DC_DESCRIPCION,'
      '       DC_FECHAMODIF = SYSDATE,'
      '       DC_USUMODIF = :USUARIO,'
      '       DC_FECHABAJA = :DC_FECHABAJA,'
      '       DC_USUBAJA = :DC_USUBAJA'
      ' WHERE DC_ID = :DC_ID'
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO HYS.PDC_DIAGNOSTICOCAUSA'
      
        '(DC_ID, DC_IDACCIDENTEESTABLECIMIENTO, DC_NUMERO, DC_DESCRIPCION' +
        ', DC_FECHAALTA, DC_USUALTA)'
      'VALUES'
      
        '(:DC_ID, :DC_IDACCIDENTEESTABLECIMIENTO, :DC_NUMERO, :DC_DESCRIP' +
        'CION, SYSDATE, :USUARIO)'
      '')
    DeleteSQL.Strings = (
      'delete from HYS.PDC_DIAGNOSTICOCAUSA'
      'where'
      '  DC_ID = :OLD_DC_ID')
    Left = 674
    Top = 88
  end
  object sdqPMC_MEDIDACORRECTIVA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRelacionesAfterOpen
    AfterScroll = sdqPMC_MEDIDACORRECTIVAAfterScroll
    SQL.Strings = (
      'SELECT MC_ID,'
      '       MC_IDACCIDENTEESTABLECIMIENTO,'
      '       MC_MEDIDA,'
      '       MC_FECHAEJECUCION,'
      '       MC_FECHAVERIFICACION,'
      '       MC_DESCRIPCION,'
      '       MC_USUALTA USUARIO,'
      '       MC_USUBAJA,'
      '       MC_FECHABAJA,'
      '       MC_FECHAEXPORT'
      '  FROM HYS.PMC_MEDIDACORRECTIVA'
      ' WHERE MC_IDACCIDENTEESTABLECIMIENTO = :ID'
      'ORDER BY MC_MEDIDA')
    UpdateObject = sduPMC_MEDIDACORRECTIVA
    Left = 618
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPMC_MEDIDACORRECTIVA: TDataSource
    DataSet = sdqPMC_MEDIDACORRECTIVA
    Left = 646
    Top = 116
  end
  object sduPMC_MEDIDACORRECTIVA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PMC_MEDIDACORRECTIVA'
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
      'INSERT INTO HYS.PMC_MEDIDACORRECTIVA'
      
        '(MC_ID, MC_IDACCIDENTEESTABLECIMIENTO, MC_MEDIDA, MC_DESCRIPCION' +
        ', MC_FECHAEJECUCION, MC_FECHAVERIFICACION, MC_FECHAALTA, MC_USUA' +
        'LTA)'
      'VALUES'
      
        '(:MC_ID, :MC_IDACCIDENTEESTABLECIMIENTO, :MC_MEDIDA, :MC_DESCRIP' +
        'CION, :MC_FECHAEJECUCION, :MC_FECHAVERIFICACION, SYSDATE, :USUAR' +
        'IO)'
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HYS.PMC_MEDIDACORRECTIVA'
      'where'
      '  MC_ID = :OLD_MC_ID')
    Left = 674
    Top = 116
  end
  object sdqPSV_SEGUIMIENTOVISITA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRelacionesAfterOpen
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
      '  FROM HYS.PSV_SEGUIMIENTOVISITA'
      ' WHERE SV_IDMEDIDACORRECTIVA = :ID'
      'ORDER BY SV_ID'
      ' '
      ' '
      ' ')
    UpdateObject = sduPSV_SEGUIMIENTOVISITA
    Left = 527
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPSV_SEGUIMIENTOVISITA: TDataSource
    DataSet = sdqPSV_SEGUIMIENTOVISITA
    Left = 555
    Top = 60
  end
  object sduPSV_SEGUIMIENTOVISITA: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PSV_SEGUIMIENTOVISITA'
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
      'INSERT INTO HYS.PSV_SEGUIMIENTOVISITA'
      
        '(SV_ID, SV_IDMEDIDACORRECTIVA, SV_TIPO, SV_FECHA, SV_FECHAALTA, ' +
        'SV_USUALTA)'
      'VALUES'
      
        '(:SV_ID, :SV_IDMEDIDACORRECTIVA, :SV_TIPO, :SV_FECHA, SYSDATE, :' +
        'USUARIO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HYS.PSV_SEGUIMIENTOVISITA'
      'where'
      '  SV_ID = :OLD_SV_ID')
    Left = 583
    Top = 60
  end
  object sdqPCM_CAUSAYMEDIDA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRelacionesPCMAfterOpen
    SQL.Strings = (
      'SELECT CM_ID,'
      '       CM_IDDIAGNOSTICOCAUSA,'
      '       CM_IDMEDIDACORRECTIVA,'
      '       DC_NUMERO,'
      '       DC_DESCRIPCION'
      '  FROM HYS.PDC_DIAGNOSTICOCAUSA, HYS.PCM_CAUSAYMEDIDA'
      ' WHERE CM_IDMEDIDACORRECTIVA = :ID'
      '   AND CM_IDDIAGNOSTICOCAUSA = DC_ID'
      'ORDER BY DC_NUMERO'
      ''
      ' ')
    UpdateObject = sduPCM_CAUSAYMEDIDA
    Left = 527
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPCM_CAUSAYMEDIDA: TDataSource
    DataSet = sdqPCM_CAUSAYMEDIDA
    Left = 555
    Top = 88
  end
  object sduPCM_CAUSAYMEDIDA: TSDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO HYS.PCM_CAUSAYMEDIDA'
      '(CM_ID, CM_IDDIAGNOSTICOCAUSA, CM_IDMEDIDACORRECTIVA)'
      'VALUES'
      '(:CM_ID, :CM_IDDIAGNOSTICOCAUSA, :CM_IDMEDIDACORRECTIVA)'
      ''
      ' ')
    DeleteSQL.Strings = (
      'delete from HYS.PCM_CAUSAYMEDIDA'
      'where'
      '  CM_ID = :OLD_CM_ID'
      ' ')
    Left = 583
    Top = 88
  end
  object sdqPAM_ACCIDENTEMULTIPLE: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT AM_ID,'
      '       AM_DETALLELESION,'
      '       EX_SINIESTRO,'
      '       EX_ORDEN,'
      '       TJ_CUIL,'
      '       TJ_NOMBRE,'
      '       AM_USUALTA USUARIO'
      '  FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES, PAM_ACCIDENTEMULTIPLE'
      ' WHERE AM_IDEXPEDIENTE=EX_ID'
      '   AND EX_CUIL=TJ_CUIL'
      '   AND AM_IDACCIDENTEESTABLECIMIENTO = :ID'
      'ORDER BY EX_SINIESTRO, EX_ORDEN')
    UpdateObject = sduPAM_ACCIDENTEMULTIPLE
    Left = 527
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPAM_ACCIDENTEMULTIPLE: TDataSource
    DataSet = sdqPAM_ACCIDENTEMULTIPLE
    Left = 555
    Top = 116
  end
  object sduPAM_ACCIDENTEMULTIPLE: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HYS.PAM_ACCIDENTEMULTIPLE'
      '   SET AM_DETALLELESION = :AM_DETALLELESION,'
      '       AM_FECHAMODIF = SYSDATE,'
      '       AM_USUMODIF = :USUARIO'
      ' WHERE AM_ID = :AM_ID')
    Left = 583
    Top = 116
  end
  object KeepConn: TTimer
    Interval = 1800000
    OnTimer = KeepConnTimer
    Left = 20
    Top = 324
  end
end
