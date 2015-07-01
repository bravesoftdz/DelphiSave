object frmModificacionContrato: TfrmModificacionContrato
  Left = 497
  Top = 170
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Contrato'
  ClientHeight = 553
  ClientWidth = 1006
  Color = clBtnFace
  Constraints.MinHeight = 582
  Constraints.MinWidth = 960
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  DesignSize = (
    1006
    553)
  PixelsPerInch = 96
  TextHeight = 13
  object PgContrato: TPageControl
    Left = 3
    Top = 34
    Width = 1001
    Height = 544
    ActivePage = tbContrato
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabHeight = 22
    TabOrder = 0
    object tbContrato: TTabSheet
      Caption = '&Contrato'
      DesignSize = (
        993
        512)
      object lbOrigen: TLabel
        Left = 51
        Top = 98
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Or'#237'gen'
      end
      object lbFechaAfiliacion: TLabel
        Left = 832
        Top = 97
        Width = 66
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'F. Suscripci'#243'n'
        ExplicitLeft = 714
      end
      object lbFRecepcion: TLabel
        Left = 441
        Top = 98
        Width = 66
        Height = 13
        Caption = 'F. Recepci'#243'n:'
      end
      object lbARTAnterior: TLabel
        Left = 444
        Top = 192
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'ART Anterior'
      end
      object lbMotivoAlta: TLabel
        Left = 14
        Top = 193
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Motivo de Alta'
      end
      object Label12: TLabel
        Left = 1
        Top = 169
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejecutivo Cuenta'
      end
      object Label13: TLabel
        Left = 435
        Top = 169
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Gestor de Cta.'
      end
      object lbCO_IDARTFUTURA: TLabel
        Left = 451
        Top = 216
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'ART Futura'
      end
      object Label15: TLabel
        Left = 30
        Top = 215
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Baja'
      end
      object Label16: TLabel
        Left = 192
        Top = 216
        Width = 36
        Height = 13
        Caption = 'Motivo:'
      end
      object lbObservacion: TLabel
        Left = 9
        Top = 333
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object lbRazonSocial: TLabel
        Left = 20
        Top = 6
        Width = 60
        Height = 13
        Caption = 'Raz'#243'n Social'
      end
      object lbCUIT: TLabel
        Left = 855
        Top = 7
        Width = 40
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'C.U.I.T.'
        ExplicitLeft = 737
      end
      object lbFormaJuridica: TLabel
        Left = 14
        Top = 122
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Forma Jur'#237'dica'
      end
      object lbSector: TLabel
        Left = 475
        Top = 122
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sector'
      end
      object lbHolding: TLabel
        Left = 48
        Top = 145
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Holding'
      end
      object lbSUSS: TLabel
        Left = 481
        Top = 146
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'SUSS'
      end
      object lbFInicioAct: TLabel
        Left = 611
        Top = 98
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'F. Inicio Act.'
      end
      object lblAfiliacion: TLabel
        Left = 838
        Top = 334
        Width = 147
        Height = 31
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 720
      end
      object Label20: TLabel
        Left = 229
        Top = 138
        Width = 43
        Height = 26
        Caption = 'Estudio'#13#10'Contable'
      end
      object lbComentariosAddenda: TLabel
        Left = 839
        Top = 397
        Width = 106
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Comentarios Addenda'
        Visible = False
        ExplicitLeft = 721
        ExplicitTop = 506
      end
      object NroContratoPanel: TPanel
        Left = 2
        Top = 31
        Width = 839
        Height = 59
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DesignSize = (
          839
          59)
        object Label5: TLabel
          Left = 3
          Top = 9
          Width = 86
          Height = 13
          Caption = 'Nro. de Contrato:'
        end
        object Label6: TLabel
          Left = 180
          Top = 7
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object Label7: TLabel
          Left = 3
          Top = 36
          Width = 79
          Height = 13
          Caption = 'Fecha Impresi'#243'n'
        end
        object Label8: TLabel
          Left = 179
          Top = 35
          Width = 127
          Height = 13
          Caption = 'Fecha Recepci'#243'n Contrato'
        end
        object lbNroFormulario: TLabel
          Left = 660
          Top = 35
          Width = 67
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nro. de Form.'
          ExplicitLeft = 542
        end
        object cmbCO_FECHAIMPRESION: TDateComboBox
          Left = 86
          Top = 31
          Width = 88
          Height = 21
          TabOrder = 2
        end
        object cmbCO_RECEPCONTRATO: TDateComboBox
          Left = 312
          Top = 31
          Width = 88
          Height = 21
          TabOrder = 3
          OnExit = cmbCO_RECEPCONTRATOExit
        end
        inline fraCO_ESTADO: TfraStaticCTB_TABLAS
          Left = 216
          Top = 3
          Width = 618
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnExit = fraCO_ESTADOExit
          ExplicitLeft = 216
          ExplicitTop = 3
          ExplicitWidth = 618
          DesignSize = (
            618
            23)
          inherited edCodigo: TPatternEdit
            Left = 2
            Width = 43
            ExplicitLeft = 2
            ExplicitWidth = 43
          end
          inherited cmbDescripcion: TComboGrid
            Left = 46
            Width = 571
            ExplicitLeft = 46
            ExplicitWidth = 571
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
        object edFO_FORMULARIO: TEdit
          Left = 727
          Top = 31
          Width = 106
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 4
          OnExit = edFO_FORMULARIOExit
        end
        object edCO_CONTRATO: TIntEdit
          Left = 86
          Top = 4
          Width = 89
          Height = 21
          TabOrder = 0
          OnExit = edCO_CONTRATOExit
          AutoExit = True
          MaxLength = 8
        end
      end
      object grbVigenciaContrato: TGroupBox
        Left = 845
        Top = 25
        Width = 142
        Height = 65
        Anchors = [akTop, akRight]
        Caption = 'Vigencia del Contrato'
        TabOrder = 3
        object Label2: TLabel
          Left = 11
          Top = 18
          Width = 30
          Height = 13
          Caption = 'Desde'
        end
        object Label4: TLabel
          Left = 12
          Top = 43
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object cmbCO_VIGENCIADESDE: TDateComboBox
          Left = 46
          Top = 14
          Width = 88
          Height = 21
          MinDateCombo = edCO_FECHAAFILIACION
          TabOrder = 0
        end
        object cmbCO_VIGENCIAHASTA: TDateComboBox
          Left = 46
          Top = 39
          Width = 88
          Height = 21
          TabOrder = 1
        end
      end
      inline fraCO_ORIGEN: TfraStaticCTB_TABLAS
        Left = 85
        Top = 92
        Width = 296
        Height = 23
        Color = clBtnFace
        ParentColor = False
        TabOrder = 4
        ExplicitLeft = 85
        ExplicitTop = 92
        ExplicitWidth = 296
        DesignSize = (
          296
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 251
          ExplicitLeft = 43
          ExplicitWidth = 251
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
      object edCO_FECHAAFILIACION: TDateComboBox
        Left = 900
        Top = 93
        Width = 88
        Height = 21
        TabStop = False
        MaxDateCombo = cmbCO_VIGENCIADESDE
        Enabled = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 14
      end
      object edCO_FECHARECEPCION: TDateComboBox
        Left = 509
        Top = 94
        Width = 88
        Height = 21
        TabOrder = 5
      end
      inline fraCO_MOTIVOALTA: TfraStaticCTB_TABLAS
        Left = 85
        Top = 188
        Width = 346
        Height = 23
        TabOrder = 10
        ExplicitLeft = 85
        ExplicitTop = 188
        ExplicitWidth = 346
        DesignSize = (
          346
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 303
          ExplicitLeft = 43
          ExplicitWidth = 303
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
      inline fraAR_NOMBRE: TfraStaticCodigoDescripcion
        Left = 508
        Top = 187
        Width = 492
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 18
        ExplicitLeft = 508
        ExplicitTop = 187
        ExplicitWidth = 492
        DesignSize = (
          492
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 437
          ExplicitLeft = 43
          ExplicitWidth = 437
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
      inline fraCO_IDARTFUTURA: TfraStaticCodigoDescripcion
        Left = 508
        Top = 211
        Width = 492
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 19
        ExplicitLeft = 508
        ExplicitTop = 211
        ExplicitWidth = 492
        DesignSize = (
          492
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 437
          ExplicitLeft = 43
          ExplicitWidth = 437
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
      object cmbCO_FECHABAJA: TDateComboBox
        Left = 86
        Top = 212
        Width = 88
        Height = 21
        TabOrder = 11
      end
      object grbCuadroTarifario: TGroupBox
        Left = 27
        Top = 236
        Width = 959
        Height = 93
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Cuadro Tarifario'
        TabOrder = 20
        DesignSize = (
          959
          93)
        object lbCIIU: TLabel
          Left = 24
          Top = 19
          Width = 29
          Height = 13
          Caption = 'CIIU I'
        end
        object lbNivel: TLabel
          Left = 894
          Top = 20
          Width = 23
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nivel'
          ExplicitLeft = 776
        end
        object lbMasaSalarial: TLabel
          Left = 769
          Top = 68
          Width = 62
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Masa Salarial'
          ExplicitLeft = 651
        end
        object lbCantEmpleados: TLabel
          Left = 778
          Top = 44
          Width = 56
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Cant. Empl.'
          ExplicitLeft = 660
        end
        object Label3: TLabel
          Left = 21
          Top = 44
          Width = 33
          Height = 13
          Caption = 'CIIU II'
        end
        object Label33: TLabel
          Left = 18
          Top = 70
          Width = 37
          Height = 13
          Caption = 'CIIU III'
        end
        object edNIVEL: TPatternEdit
          Left = 922
          Top = 16
          Width = 28
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 1
          TabOrder = 5
          Pattern = '1234'
        end
        object edMASATOTAL: TCurrencyEdit
          Left = 838
          Top = 64
          Width = 112
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Anchors = [akTop, akRight]
          MaxLength = 13
          TabOrder = 7
        end
        object edTOTEMPLEADOS: TCurrencyEdit
          Left = 838
          Top = 40
          Width = 112
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          Anchors = [akTop, akRight]
          MaxLength = 6
          TabOrder = 6
        end
        inline fraCIIU: TfraStaticActividad
          Left = 57
          Top = 13
          Width = 699
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 57
          ExplicitTop = 13
          ExplicitWidth = 699
          DesignSize = (
            699
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 635
            ExplicitWidth = 635
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
        inline fraCIIU2: TfraStaticActividad
          Left = 57
          Top = 39
          Width = 699
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 57
          ExplicitTop = 39
          ExplicitWidth = 699
          DesignSize = (
            699
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 635
            ExplicitWidth = 635
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
        inline fraCIIU3: TfraStaticActividad
          Left = 57
          Top = 65
          Width = 699
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 57
          ExplicitTop = 65
          ExplicitWidth = 699
          ExplicitHeight = 22
          DesignSize = (
            699
            22)
          inherited cmbDescripcion: TComboGrid
            Width = 635
            ExplicitWidth = 635
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
        object btnGuardar: TBitBtn
          Left = 862
          Top = 16
          Width = 23
          Height = 23
          Hint = 'Guardar Empleados y Masa Salarial'
          Anchors = [akTop, akRight]
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FF00FF00848484008484
            8400848484008484840084848400000000000000000000000000000000000000
            000000000000848484008484840084848400848484000000000084848400FFFF
            FF00C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
            840000000000C6C6C600FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C600C6C6C600C6C6C6008484840000000000C6C6C600848484008484
            840000000000C6C6C600FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C600C6C6C600C6C6C6008484840000000000C6C6C600848484008484
            840000000000C6C6C600FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840084848400848484008484
            84008484840084848400C6C6C600C6C6C600848484000000000084848400FFFF
            FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000000084848400FFFF
            FF00C6C6C600C6C6C60084848400848484008484840084848400848484008484
            84008484840084848400C6C6C600C6C6C600848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF0000000000848484000000000084848400FFFF
            FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
            FF00CEFFFF00CEFFFF00FFFFFF00C6C6C6008484840000000000FF00FF008484
            8400848484008484840084848400848484008484840084848400848484008484
            84008484840084848400848484008484840084848400FF00FF00}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnGuardarClick
        end
        object btnEditar: TBitBtn
          Left = 838
          Top = 16
          Width = 23
          Height = 23
          Hint = 'Editar Empleados y Masa Salarial'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400CECECE00CECECE00CECECE00CECECE00CECECE00CECE
            CE00CECECE00CECECE00CECECE00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
            FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF00CE310000CE310000CE310000CE310000CE31
            0000CE310000CE3100009CFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
            FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF00FF000000FF000000FF000000FF000000FF00
            0000FF000000FF0000009CFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
            FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF00FF000000FF000000FF000000FF000000FF00
            0000FF000000FF0000009CFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
            FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
            FF00FF00FF0031CEFF00FFFFFF00FF633100FF633100FF633100FF633100FF63
            31009CFFFF00FFFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF0031CE
            FF00FF00FF0031CEFF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFF
            FF00FFFFFF0084848400000000000000000000000000FF00FF00FF00FF00FF00
            FF0031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0084848400FFFFFF0000000000FF00FF00FF00FF0031CEFF0031CE
            FF0031CEFF008484840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0031CEFF0031CEFF0031CEFF00848484008484840084848400848484008484
            84008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0031CE
            FF00FF00FF0031CEFF00FF00FF0031CEFF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0031CEFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnEditarClick
        end
      end
      object edCO_OBSERVACIONES: TMemo
        Left = 85
        Top = 332
        Width = 749
        Height = 116
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 250
        TabOrder = 21
      end
      object grbFranquicia: TGroupBox
        Left = 0
        Top = 452
        Width = 251
        Height = 38
        Anchors = [akLeft, akBottom]
        Caption = 'Franquicia'
        TabOrder = 25
        object Label1: TLabel
          Left = 8
          Top = 18
          Width = 20
          Height = 13
          Caption = 'Dias'
        end
        object Label9: TLabel
          Left = 83
          Top = 17
          Width = 71
          Height = 13
          Caption = 'Vigencia desde'
        end
        object edCO_DIASFRANQUICIA: TCurrencyEdit
          Left = 32
          Top = 14
          Width = 39
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          MaxLength = 7
          TabOrder = 0
        end
        object cmbCO_VIGENCIAFRANQUICIA: TDateComboBox
          Left = 159
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 1
        end
      end
      object grbClausulasEspeciales: TGroupBox
        Left = 253
        Top = 452
        Width = 738
        Height = 38
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Clausulas Especial'
        TabOrder = 26
        object Label10: TLabel
          Left = 5
          Top = 18
          Width = 45
          Height = 13
          Caption = 'Cl'#225'usulas'
        end
        object Label11: TLabel
          Left = 375
          Top = 17
          Width = 39
          Height = 13
          Caption = 'Vigencia'
        end
        object cmbCO_VIGENCIACLAUSULA: TDateComboBox
          Left = 418
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 1
        end
        inline fraCO_CLAUSULAESPECIAL: TfraStaticCTB_TABLAS
          Left = 52
          Top = 13
          Width = 317
          Height = 23
          TabOrder = 0
          OnExit = fraCO_CLAUSULAESPECIALExit
          ExplicitLeft = 52
          ExplicitTop = 13
          ExplicitWidth = 317
          DesignSize = (
            317
            23)
          inherited edCodigo: TPatternEdit
            Left = 2
            Top = 2
            Width = 42
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 42
          end
          inherited cmbDescripcion: TComboGrid
            Left = 48
            Top = 2
            Width = 268
            ExplicitLeft = 48
            ExplicitTop = 2
            ExplicitWidth = 268
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
      object edEM_CUIT: TMaskEdit
        Left = 900
        Top = 2
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 1
        OnExit = edEM_CUITExit
        OnKeyPress = edEM_CUITKeyPress
      end
      inline fraEM_FORMAJ: TfraStaticCTB_TABLAS
        Left = 85
        Top = 116
        Width = 354
        Height = 23
        TabOrder = 6
        ExplicitLeft = 85
        ExplicitTop = 116
        ExplicitWidth = 354
        DesignSize = (
          354
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 303
          ExplicitLeft = 43
          ExplicitWidth = 303
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
      inline fraEM_SECTOR: TfraStaticCTB_TABLAS
        Left = 507
        Top = 116
        Width = 485
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
        ExplicitLeft = 507
        ExplicitTop = 116
        ExplicitWidth = 485
        DesignSize = (
          485
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Top = 2
          Width = 39
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 44
          Width = 437
          ExplicitLeft = 44
          ExplicitWidth = 437
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
      inline fraEM_SUSS: TfraStaticCTB_TABLAS
        Left = 508
        Top = 140
        Width = 480
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 16
        ExplicitLeft = 508
        ExplicitTop = 140
        ExplicitWidth = 480
        ExplicitHeight = 25
        DesignSize = (
          480
          25)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 437
          ExplicitLeft = 43
          ExplicitWidth = 437
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
      object edEM_FEINICACTIV: TDateComboBox
        Left = 675
        Top = 94
        Width = 88
        Height = 21
        TabOrder = 13
      end
      object cmbEM_NOMBRE: TArtComboBox
        Left = 88
        Top = 3
        Width = 753
        Height = 21
        CharCase = ecUpperCase
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 200
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FO_FORMULARIO'
            Title.Caption = 'Nro. de Form.'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CO_CONTRATO'
            Title.Caption = 'Nro. de Contrato'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CO_VIGENCIADESDE'
            Title.Caption = 'Vigencia Desde'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIGENCIAHASTA'
            Title.Caption = 'Vigencia Hasta'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Title.Caption = 'Estado del Contrato'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TB_DESCRIPCION'
            Title.Caption = 'Motivo de Baja'
            Width = 150
            Visible = True
          end>
        DataSource = dsNombresEmpresas
        FieldList = 'EM_NOMBRE'
        FieldKey = 'EM_ID'
        OnCloseUp = cmbEM_NOMBRECloseUp
        OnDropDown = cmbEM_NOMBREDropDown
        OnGetCellParams = cmbEM_NOMBREGetCellParams
      end
      inline fraCO_MOTIVOBAJA: TfraStaticCTB_TABLAS
        Left = 228
        Top = 211
        Width = 203
        Height = 23
        TabOrder = 12
        OnExit = fraCO_MOTIVOBAJAExit
        ExplicitLeft = 228
        ExplicitTop = 211
        ExplicitWidth = 203
        DesignSize = (
          203
          23)
        inherited edCodigo: TPatternEdit
          Width = 36
          ExplicitWidth = 36
        end
        inherited cmbDescripcion: TComboGrid
          Left = 39
          Width = 164
          ExplicitLeft = 39
          ExplicitWidth = 164
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
      inline fraCO_IDGESTOR: TfraStaticCodigoDescripcion
        Left = 508
        Top = 164
        Width = 480
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 17
        ExplicitLeft = 508
        ExplicitTop = 164
        ExplicitWidth = 480
        DesignSize = (
          480
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 437
          ExplicitLeft = 43
          ExplicitWidth = 437
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
      inline fraCO_IDEJECUTIVO: TfraStaticCodigoDescripcion
        Left = 85
        Top = 164
        Width = 348
        Height = 23
        TabOrder = 9
        ExplicitLeft = 85
        ExplicitTop = 164
        ExplicitWidth = 348
        DesignSize = (
          348
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 303
          ExplicitLeft = 43
          ExplicitWidth = 303
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
      object cbCO_ADDENDA: TCheckBox
        Left = 838
        Top = 348
        Width = 80
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Addenda ILT'
        TabOrder = 23
      end
      inline fraCO_IDESTUDIOCONTABLE: TfraStaticCodigoDescripcion
        Left = 273
        Top = 139
        Width = 159
        Height = 23
        TabOrder = 8
        ExplicitLeft = 273
        ExplicitTop = 139
        ExplicitWidth = 159
        DesignSize = (
          159
          23)
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited cmbDescripcion: TComboGrid
          Left = 43
          Width = 115
          ExplicitLeft = 43
          ExplicitWidth = 115
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
      inline fraEM_IDGRUPOECONOMICO: TfraCodDesc
        Left = 85
        Top = 139
        Width = 144
        Height = 23
        TabOrder = 7
        ExplicitLeft = 85
        ExplicitTop = 139
        ExplicitWidth = 144
        DesignSize = (
          144
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 43
          Width = 99
          ExplicitLeft = 43
          ExplicitWidth = 99
        end
        inherited edCodigo: TPatternEdit
          Width = 39
          ExplicitWidth = 39
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND GE_TEMPORAL IS NULL'
          FieldBaja = 'GE_FECHABAJA'
          FieldCodigo = 'GE_CODIGO'
          FieldDesc = 'GE_DESCRIPCION'
          FieldID = 'GE_ID'
          IdType = ctInteger
          TableName = 'AGE_GRUPOECONOMICO'
          Left = 60
        end
      end
      object checkPagoDirecto: TCheckBox
        Left = 838
        Top = 332
        Width = 80
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Pago Directo'
        TabOrder = 22
      end
      object cbCO_ADDENDA_DDJJ: TCheckBox
        Left = 838
        Top = 364
        Width = 96
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Addenda DDJJ'
        TabOrder = 24
      end
      object fpErroresEndoso: TFormPanel
        Left = 950
        Top = -26
        Width = 501
        Height = 305
        Caption = 'Errores del proceso'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        Position = poMainFormCenter
        OnBeforeShow = fpErroresEndosoBeforeShow
        DesignSize = (
          501
          305)
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 501
          Height = 30
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = [ebTop, ebBottom]
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbExcel: TToolButton
            Left = 0
            Top = 0
            Hint = 'Exportar a Excel'
            Caption = 'tbGuardar'
            ImageIndex = 3
            OnClick = tbExcelClick
          end
          object tbImprimirErrores: TToolButton
            Left = 23
            Top = 0
            Hint = 'Imprimir'
            Caption = 'Imprimir'
            ImageIndex = 4
            OnClick = tbImprimirErroresClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 4
          Top = 40
          Width = 493
          Height = 229
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Errores detectados'
          TabOrder = 1
          object GridSrt: TAdvStringGrid
            Left = 2
            Top = 15
            Width = 489
            Height = 212
            Cursor = crDefault
            Align = alClient
            ColCount = 7
            DefaultRowHeight = 18
            DrawingStyle = gdsClassic
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
            ScrollBars = ssBoth
            TabOrder = 0
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'Tahoma'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FixedRowHeight = 18
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Look = glClassic
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            ScrollWidth = 14
            SearchFooter.Color = clBtnFace
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SelectionColor = clHighlight
            SelectionTextColor = clHighlightText
            SortSettings.Show = True
            SortSettings.IndexShow = True
            SortSettings.IndexColor = clGray
            Version = '5.8.7.0'
            ColWidths = (
              64
              64
              89
              97
              96
              163
              199)
          end
        end
        object btnAceptarErrores: TButton
          Left = 404
          Top = 272
          Width = 91
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Cerrar'
          TabOrder = 2
          OnClick = btnAceptarErroresClick
        end
      end
      object edComentariosAddenda: TMemo
        Left = 839
        Top = 413
        Width = 125
        Height = 33
        Anchors = [akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 28
        Visible = False
      end
      object cbCO_ADDENDAESPECIAL: TCheckBox
        Left = 838
        Top = 380
        Width = 110
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Addenda Especial'
        TabOrder = 29
        OnClick = cbCO_ADDENDAESPECIALClick
      end
      object fpTarifaPCP: TFormPanel
        Left = 919
        Top = 10
        Width = 557
        Height = 202
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        Position = poOwnerFormCenter
        OnShow = fpTarifaPCPShow
        object pnlPCP: TPanel
          Left = 0
          Top = 0
          Width = 557
          Height = 162
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            557
            162)
          object Label80: TLabel
            Left = 2
            Top = 11
            Width = 229
            Height = 13
            Caption = 'Cuadro Tarifario Personal De Casas Particulares'
          end
          object GroupBox7: TGroupBox
            Left = 2
            Top = 25
            Width = 835
            Height = 131
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              835
              131)
            object Bevel3: TBevel
              Left = 0
              Top = 31
              Width = 833
              Height = 5
              Anchors = [akLeft, akRight]
              ExplicitWidth = 773
            end
            object Label81: TLabel
              Left = 6
              Top = 11
              Width = 158
              Height = 13
              Caption = 'Horas Trabajadas Semanalmente'
            end
            object Label82: TLabel
              Left = 256
              Top = 11
              Width = 125
              Height = 13
              Caption = 'Cantidad de Trabajadores'
            end
            object Label83: TLabel
              Left = 469
              Top = 11
              Width = 38
              Height = 13
              Caption = 'Al'#237'cuota'
            end
            object Label84: TLabel
              Left = 14
              Top = 48
              Width = 129
              Height = 13
              Caption = 'Menos de 12hs. semanales'
            end
            object Label85: TLabel
              Left = 14
              Top = 67
              Width = 201
              Height = 13
              Caption = 'Desde 12hs. a menos de 16hs. semanales'
            end
            object Label86: TLabel
              Left = 14
              Top = 86
              Width = 114
              Height = 13
              Caption = '16 o m'#225's hs. semanales'
            end
            object Label87: TLabel
              Left = 14
              Top = 109
              Width = 107
              Height = 13
              Caption = 'Cuota incial resultante'
            end
            object Label88: TLabel
              Left = 311
              Top = 43
              Width = 6
              Height = 13
              Caption = 'x'
            end
            object Label89: TLabel
              Left = 311
              Top = 65
              Width = 6
              Height = 13
              Caption = 'x'
            end
            object Label90: TLabel
              Left = 311
              Top = 87
              Width = 6
              Height = 13
              Caption = 'x'
            end
            object edCantTrabMenosDe12: TIntEdit
              Left = 248
              Top = 40
              Width = 51
              Height = 21
              TabOrder = 0
              Text = '0'
              OnExit = edCantTrabMenosDe12Exit
            end
            object edCantTrabDe12a16: TIntEdit
              Left = 248
              Top = 62
              Width = 51
              Height = 21
              TabOrder = 1
              Text = '0'
              OnExit = edCantTrabDe12a16Exit
            end
            object edCantTrabMasDe16: TIntEdit
              Left = 248
              Top = 84
              Width = 51
              Height = 21
              TabOrder = 2
              Text = '0'
              OnExit = edCantTrabMasDe16Exit
            end
            object edAlicuotaMenosDe12: TCurrencyEdit
              Left = 451
              Top = 40
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 3
              ZeroEmpty = False
            end
            object edAlicuotaDe12a16: TCurrencyEdit
              Left = 451
              Top = 62
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 4
              ZeroEmpty = False
            end
            object edAlicuotaMasDe16: TCurrencyEdit
              Left = 451
              Top = 84
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 5
              ZeroEmpty = False
            end
            object edAlicuota: TCurrencyEdit
              Left = 451
              Top = 106
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 6
              ZeroEmpty = False
            end
            object edValorMenosDe12: TCurrencyEdit
              Left = 326
              Top = 40
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 7
              ZeroEmpty = False
            end
            object edValorDesde12a16: TCurrencyEdit
              Left = 326
              Top = 62
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 8
              ZeroEmpty = False
            end
            object edValorMasDe16: TCurrencyEdit
              Left = 326
              Top = 84
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clMoneyGreen
              MaxLength = 12
              ReadOnly = True
              TabOrder = 9
              ZeroEmpty = False
            end
          end
        end
        object btnAceptarPCP: TButton
          Left = 384
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Aceptar'
          TabOrder = 1
          OnClick = btnAceptarPCPClick
        end
        object btnCancelarPCP: TButton
          Left = 476
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarPCPClick
        end
      end
      object btnCambiarOrigen: TBitBtn
        Left = 382
        Top = 92
        Width = 23
        Height = 23
        Hint = 'Editar el or'#237'gen del contrato'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400CECECE00CECECE00CECECE00CECECE00CECECE00CECE
          CE00CECECE00CECECE00CECECE00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00CE310000CE310000CE310000CE310000CE31
          0000CE310000CE3100009CFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FF000000FF000000FF000000FF000000FF00
          0000FF000000FF0000009CFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FF000000FF000000FF000000FF000000FF00
          0000FF000000FF0000009CFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF00FF00
          FF00FF00FF0031CEFF00FFFFFF00FF633100FF633100FF633100FF633100FF63
          31009CFFFF00FFFFFF00FFFFFF00CECECE0000000000FF00FF00FF00FF0031CE
          FF00FF00FF0031CEFF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFF
          FF00FFFFFF0084848400000000000000000000000000FF00FF00FF00FF00FF00
          FF0031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0084848400FFFFFF0000000000FF00FF00FF00FF0031CEFF0031CE
          FF0031CEFF008484840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0031CEFF0031CEFF0031CEFF00848484008484840084848400848484008484
          84008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0031CE
          FF00FF00FF0031CEFF00FF00FF0031CEFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0031CEFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 31
        OnClick = btnCambiarOrigenClick
      end
      object btnGuardarOrigen: TBitBtn
        Left = 408
        Top = 92
        Width = 23
        Height = 23
        Hint = 'Guardar nuevo or'#237'gen'
        Enabled = False
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00848484008484
          8400848484008484840084848400000000000000000000000000000000000000
          000000000000848484008484840084848400848484000000000084848400FFFF
          FF00C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
          840000000000C6C6C600FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C600C6C6C600C6C6C6008484840000000000C6C6C600848484008484
          840000000000C6C6C600FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C600C6C6C600C6C6C6008484840000000000C6C6C600848484008484
          840000000000C6C6C600FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840084848400848484008484
          84008484840084848400C6C6C600C6C6C600848484000000000084848400FFFF
          FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000000084848400FFFF
          FF00C6C6C600C6C6C60084848400848484008484840084848400848484008484
          84008484840084848400C6C6C600C6C6C600848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF00C6C6C600848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF0000000000848484000000000084848400FFFF
          FF00C6C6C60084848400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00CEFFFF00FFFFFF00C6C6C6008484840000000000FF00FF008484
          8400848484008484840084848400848484008484840084848400848484008484
          84008484840084848400848484008484840084848400FF00FF00}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 32
        OnClick = btnGuardarOrigenClick
      end
    end
    object tsDomicilio: TTabSheet
      Caption = '&Domicilio'
      ImageIndex = 1
      DesignSize = (
        993
        512)
      object Label31: TLabel
        Left = 39
        Top = 394
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Correo electr'#243'nico'
      end
      object Label24: TLabel
        Left = 70
        Top = 418
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'P'#225'gina Web'
      end
      object Label46: TLabel
        Left = 688
        Top = 394
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Origen Dato'
        ExplicitLeft = 570
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 0
        Width = 971
        Height = 384
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Domicilio '
        TabOrder = 2
        DesignSize = (
          971
          384)
        object Label45: TLabel
          Left = 24
          Top = 360
          Width = 106
          Height = 13
          Caption = 'Formulario Rec. Datos'
        end
        object edNumeroFormRectificacionDatos: TIntEdit
          Left = 136
          Top = 356
          Width = 88
          Height = 21
          TabOrder = 0
          OnExit = edNumeroFormRectificacionDatosExit
          OnKeyUp = edNumeroFormRectificacionDatosKeyUp
          MaxLength = 8
        end
        object edDetalleRectificacionDatos: TEdit
          Left = 356
          Top = 356
          Width = 595
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edNumeroFormRectificacionDatosActual: TIntEdit
          Left = 264
          Top = 356
          Width = 88
          Height = 21
          TabOrder = 2
          MaxLength = 8
        end
      end
      object grbDomicilioLegal: TGroupBox
        Left = 24
        Top = 12
        Width = 941
        Height = 168
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Constituido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          941
          168)
        object lbCAFAX: TLabel
          Left = 600
          Top = 64
          Width = 18
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'C.A'
          ExplicitLeft = 482
        end
        object lbFAX: TLabel
          Left = 679
          Top = 64
          Width = 18
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fax'
          ExplicitLeft = 561
        end
        object Label17: TLabel
          Left = 57
          Top = 112
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Label43: TLabel
          Left = 8
          Top = 88
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E-mail'
        end
        object edDC_FAX: TPatternEdit
          Left = 699
          Top = 60
          Width = 234
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 60
          TabOrder = 3
          Pattern = '0123456789()-/'
        end
        object edDC_CODAREAFAX: TPatternEdit
          Left = 623
          Top = 60
          Width = 50
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 4
          TabOrder = 2
          Pattern = '0123456789'
        end
        object edDC_OBSERVACIONESLegal: TMemo
          Left = 136
          Top = 108
          Width = 797
          Height = 52
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 250
          ScrollBars = ssVertical
          TabOrder = 5
        end
        inline fraTelefonoLegal: TfraTelefono
          Left = 8
          Top = 60
          Width = 587
          Height = 21
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 8
          ExplicitTop = 60
          ExplicitWidth = 587
          DesignSize = (
            587
            21)
          inherited lbTelefonoTitulo: TLabel
            Left = 22
            Width = 18
            Caption = 'Tel.'
            ExplicitLeft = 22
            ExplicitWidth = 18
          end
          inherited btnABMTelefonos: TButton
            Left = 564
            Width = 21
            Anchors = [akTop, akRight]
            ExplicitLeft = 564
            ExplicitWidth = 21
          end
          inherited cmbTelefonos: TComboGrid
            Width = 515
            Anchors = [akLeft, akTop, akRight]
            ExplicitWidth = 515
            Cells = ()
            ColWidths = (
              64
              64)
          end
        end
        inline fraDOMICILIO_LEGAL: TfraDomicilio
          Left = 8
          Top = 12
          Width = 924
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 12
          ExplicitWidth = 924
          ExplicitHeight = 48
          DesignSize = (
            924
            48)
          inherited lbNro: TLabel
            Left = 709
            ExplicitLeft = 591
          end
          inherited lbPiso: TLabel
            Left = 781
            Width = 20
            ExplicitLeft = 663
            ExplicitWidth = 20
          end
          inherited lbDto: TLabel
            Left = 857
            Width = 20
            ExplicitLeft = 739
            ExplicitWidth = 20
          end
          inherited lbCPostal: TLabel
            Top = 28
            Width = 39
            ExplicitTop = 28
            ExplicitWidth = 39
          end
          inherited lbCPA: TLabel
            Top = 28
            Width = 21
            ExplicitTop = 28
            ExplicitWidth = 21
          end
          inherited lbLocalidad: TLabel
            Top = 28
            Width = 46
            ExplicitTop = 28
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 762
            Top = 28
            Width = 44
            ExplicitLeft = 644
            ExplicitTop = 28
            ExplicitWidth = 44
          end
          inherited cmbCalle: TArtComboBox
            Width = 627
            ExplicitWidth = 627
          end
          inherited edNumero: TEdit
            Left = 731
            ExplicitLeft = 731
          end
          inherited edPiso: TEdit
            Left = 807
            ExplicitLeft = 807
          end
          inherited edDto: TEdit
            Left = 879
            ExplicitLeft = 879
          end
          inherited edCPostal: TIntEdit
            Top = 24
            ExplicitTop = 24
          end
          inherited cmbLocalidad: TArtComboBox
            Top = 24
            Width = 492
            ExplicitTop = 24
            ExplicitWidth = 492
          end
          inherited edProvincia: TEdit
            Left = 811
            Top = 24
            ExplicitLeft = 811
            ExplicitTop = 24
          end
          inherited edCPA: TPatternEdit
            Top = 24
            ExplicitTop = 24
          end
          inherited btnBuscar: TButton
            Left = 676
            Width = 21
            ExplicitLeft = 676
            ExplicitWidth = 21
          end
        end
        object edDC_MAIL: TEdit
          Left = 56
          Top = 84
          Width = 877
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object btnCopiarDomicilio: TBitBtn
          Left = 5
          Top = 139
          Width = 23
          Height = 23
          Hint = 'Copia los datos del domicilio postal al Constituido'
          Anchors = [akLeft]
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000C40E0000C40E00000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
            000000FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
            00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
            00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFD000000
            00F900000000FDFDFDFDFDFDFD00F9F9F9F9F9F9F900FDFDFDFDFDFDFDFD00F9
            F9F9F9F900FDFDFDFDFDFDFDFDFD00F9F9F9F9F900FDFDFDFDFDFDFDFDFDFD00
            F9F9F900FDFDFDFDFDFDFDFDFDFDFD00F9F9F900FDFDFDFDFDFDFDFDFDFDFDFD
            00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
            FD00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD00FDFDFDFDFDFDFDFD}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnCopiarDomicilioClick
        end
      end
      object grbDomicilioPostal: TGroupBox
        Left = 24
        Top = 184
        Width = 941
        Height = 168
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Postal '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          941
          168)
        object lbCAFaxPostal: TLabel
          Left = 600
          Top = 64
          Width = 18
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'C.A'
          ExplicitLeft = 482
        end
        object lbFaxPostal: TLabel
          Left = 676
          Top = 64
          Width = 18
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fax'
          ExplicitLeft = 558
        end
        object Label18: TLabel
          Left = 57
          Top = 112
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Label44: TLabel
          Left = 8
          Top = 88
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E-mail'
        end
        object edDC_CODAREAFAX_POST: TPatternEdit
          Left = 623
          Top = 60
          Width = 50
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 5
          TabOrder = 2
          Pattern = '0123456789'
        end
        object edDC_FAX_POST: TPatternEdit
          Left = 699
          Top = 60
          Width = 234
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 3
          Pattern = '0123456789()-/'
        end
        object edDC_OBSERVACIONESPostal: TMemo
          Left = 136
          Top = 108
          Width = 797
          Height = 52
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 250
          ScrollBars = ssVertical
          TabOrder = 5
        end
        inline fraTelefonoPostal: TfraTelefono
          Left = 6
          Top = 60
          Width = 587
          Height = 21
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 6
          ExplicitTop = 60
          ExplicitWidth = 587
          DesignSize = (
            587
            21)
          inherited btnABMTelefonos: TButton
            Left = 564
            Width = 21
            Anchors = [akTop, akRight]
            ExplicitLeft = 564
            ExplicitWidth = 21
          end
          inherited cmbTelefonos: TComboGrid
            Left = 50
            Width = 515
            Anchors = [akLeft, akTop, akRight]
            ExplicitLeft = 50
            ExplicitWidth = 515
            Cells = ()
            ColWidths = (
              64
              64)
          end
        end
        inline fraDOMICILIO_POSTAL: TfraDomicilio
          Left = 8
          Top = 12
          Width = 924
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 12
          ExplicitWidth = 924
          ExplicitHeight = 48
          DesignSize = (
            924
            48)
          inherited lbNro: TLabel
            Left = 709
            ExplicitLeft = 591
          end
          inherited lbPiso: TLabel
            Left = 781
            Width = 20
            ExplicitLeft = 663
            ExplicitWidth = 20
          end
          inherited lbDto: TLabel
            Left = 857
            Width = 20
            ExplicitLeft = 739
            ExplicitWidth = 20
          end
          inherited lbCPostal: TLabel
            Top = 28
            Width = 39
            ExplicitTop = 28
            ExplicitWidth = 39
          end
          inherited lbCPA: TLabel
            Top = 28
            Width = 21
            ExplicitTop = 28
            ExplicitWidth = 21
          end
          inherited lbLocalidad: TLabel
            Top = 28
            Width = 46
            ExplicitTop = 28
            ExplicitWidth = 46
          end
          inherited lbProvincia: TLabel
            Left = 762
            Top = 28
            Width = 44
            ExplicitLeft = 644
            ExplicitTop = 28
            ExplicitWidth = 44
          end
          inherited cmbCalle: TArtComboBox
            Width = 627
            ExplicitWidth = 627
          end
          inherited edNumero: TEdit
            Left = 731
            ExplicitLeft = 731
          end
          inherited edPiso: TEdit
            Left = 807
            ExplicitLeft = 807
          end
          inherited edDto: TEdit
            Left = 879
            ExplicitLeft = 879
          end
          inherited edCPostal: TIntEdit
            Top = 24
            Width = 52
            ExplicitTop = 24
            ExplicitWidth = 52
          end
          inherited cmbLocalidad: TArtComboBox
            Top = 24
            Width = 492
            ExplicitTop = 24
            ExplicitWidth = 492
          end
          inherited edProvincia: TEdit
            Left = 811
            Top = 24
            ExplicitLeft = 811
            ExplicitTop = 24
          end
          inherited edCPA: TPatternEdit
            Top = 24
            ExplicitTop = 24
          end
          inherited btnBuscar: TButton
            Left = 676
            Width = 21
            OnClick = fraDOMICILIO_POSTALbtnBuscarClick
            ExplicitLeft = 676
            ExplicitWidth = 21
          end
        end
        object edDC_MAIL_POST: TEdit
          Left = 56
          Top = 84
          Width = 877
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
      end
      object edCO_DIRELECTRONICA: TEdit
        Left = 132
        Top = 390
        Width = 547
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        MaxLength = 120
        ReadOnly = True
        TabOrder = 3
      end
      object edCO_PAGINAWEB: TEdit
        Left = 132
        Top = 414
        Width = 833
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        MaxLength = 120
        ReadOnly = True
        TabOrder = 6
      end
      object chkNoTieneEmail: TCheckBox
        Left = 903
        Top = 392
        Width = 64
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'No tiene.'
        TabOrder = 5
        OnClick = chkNoTieneEmailClick
      end
      inline fraOrigenDatoEmail: TfraCodigoDescripcion
        Left = 751
        Top = 390
        Width = 136
        Height = 23
        Anchors = [akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 751
        ExplicitTop = 390
        ExplicitWidth = 136
        DesignSize = (
          136
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 28
          Width = 106
          ExplicitLeft = 28
          ExplicitWidth = 106
        end
        inherited edCodigo: TPatternEdit
          Width = 24
          ExplicitWidth = 24
        end
      end
    end
    object tsEndosos: TTabSheet
      Caption = '&Endosos'
      ImageIndex = 2
      DesignSize = (
        993
        512)
      object lbVigencia: TLabel
        Left = 47
        Top = 38
        Width = 39
        Height = 13
        Caption = 'Vigencia'
        Visible = False
      end
      object Label34: TLabel
        Left = 56
        Top = 12
        Width = 32
        Height = 13
        Caption = 'Motivo'
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 64
        Width = 971
        Height = 249
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Endoso Anterior '
        TabOrder = 5
        DesignSize = (
          971
          249)
        object Label22: TLabel
          Left = 284
          Top = 20
          Width = 39
          Height = 13
          Caption = 'Vigencia'
        end
        object Label21: TLabel
          Left = 46
          Top = 44
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Motivo'
        end
        object Label23: TLabel
          Left = 19
          Top = 20
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Endoso'
        end
        object Label19: TLabel
          Left = 819
          Top = 20
          Width = 78
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nro. Movimiento'
          ExplicitLeft = 701
        end
        object Label25: TLabel
          Left = 31
          Top = 116
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impresi'#243'n'
        end
        object Label26: TLabel
          Left = 250
          Top = 116
          Width = 80
          Height = 13
          Caption = 'Fecha envio SRT'
        end
        object Label27: TLabel
          Left = 757
          Top = 116
          Width = 100
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Fecha recepci'#243'n SRT'
          ExplicitLeft = 639
        end
        object Label28: TLabel
          Left = 30
          Top = 116
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Envio SRT'
        end
        object Label29: TLabel
          Left = 15
          Top = 164
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rechazo SRT'
        end
        object Label30: TLabel
          Left = 17
          Top = 192
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observ. SRT'
        end
        object Label38: TLabel
          Left = 20
          Top = 68
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usuario Alta'
        end
        object Label39: TLabel
          Left = 806
          Top = 66
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Fecha Alta'
          ExplicitLeft = 688
        end
        object lbFechaRecepcionAfiliaciones: TLabel
          Left = 740
          Top = 212
          Width = 118
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F. Recepci'#243'n Afiliaciones'
          ExplicitLeft = 622
        end
        object lbDesmarcarEnvioSRT: TLabel
          Left = 106
          Top = 228
          Width = 51
          Height = 13
          Cursor = crHandPoint
          Caption = 'Desmarcar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = lbDesmarcarEnvioSRTClick
          OnMouseEnter = lbDesmarcarEnvioSRTMouseEnter
          OnMouseLeave = lbDesmarcarEnvioSRTMouseLeave
        end
        object lbFechaRecepcionFax: TLabel
          Left = 524
          Top = 212
          Width = 115
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F. Recepci'#243'n Fax/e-Mail'
          ExplicitLeft = 406
        end
        object lbUsuRevision: TLabel
          Left = 4
          Top = 92
          Width = 79
          Height = 13
          Caption = 'Usuario Revisi'#243'n'
          WordWrap = True
        end
        object lbFechaRevision: TLabel
          Left = 771
          Top = 92
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Fecha de Revisi'#243'n'
          ExplicitLeft = 653
        end
        object cmbEN_VIGENCIAENDOSO: TDateComboBox
          Left = 328
          Top = 16
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object edEN_USUALTA: TEdit
          Left = 88
          Top = 64
          Width = 672
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object cmbEN_FECHAALTA: TDateComboBox
          Left = 864
          Top = 64
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 5
        end
        object cmbEN_FECHAIMPRESION: TDateComboBox
          Left = 88
          Top = 112
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object cmbEN_FENVIOSTR: TDateComboBox
          Left = 332
          Top = 112
          Width = 88
          Height = 21
          TabOrder = 7
        end
        object cmbEN_FRECEPCIONSTR: TDateComboBox
          Left = 864
          Top = 112
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 8
        end
        object edEN_TIPOENVIOSTR: TEdit
          Left = 88
          Top = 136
          Width = 864
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
        end
        object edEN_CODRECHAZOSTR: TEdit
          Left = 88
          Top = 160
          Width = 864
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
        end
        object edEN_CODOBSERVACIONSTR: TEdit
          Left = 88
          Top = 184
          Width = 864
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 11
        end
        object edEN_ENDOSO: TEdit
          Left = 88
          Top = 16
          Width = 47
          Height = 21
          TabOrder = 0
        end
        object edEN_MOVIMIENTO: TEdit
          Left = 905
          Top = 16
          Width = 47
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        inline fraEN_MOTIVO: TfraStaticCTB_TABLAS
          Left = 87
          Top = 40
          Width = 865
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitLeft = 87
          ExplicitTop = 40
          ExplicitWidth = 865
          DesignSize = (
            865
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 613
            ExplicitWidth = 613
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
        object cbEN_ENVIOSRT_C: TCheckBox
          Left = 87
          Top = 212
          Width = 97
          Height = 17
          Caption = 'Env'#237'o a la SRT'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 12
        end
        object cbEN_ENVIOCARTA_C: TCheckBox
          Left = 189
          Top = 212
          Width = 97
          Height = 17
          Caption = 'Env'#237'o de Carta'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 13
        end
        object cbEN_NOTASRT_C: TCheckBox
          Left = 293
          Top = 212
          Width = 97
          Height = 17
          Caption = 'Env'#237'o Nota SRT'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 14
        end
        object dcbFechaRecepcionAfiliaciones: TDateComboBox
          Left = 864
          Top = 208
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 15
        end
        object dcbRecepcionFechaFax: TDateComboBox
          Left = 648
          Top = 208
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 16
        end
        object edUsuarioRevision: TEdit
          Left = 88
          Top = 88
          Width = 672
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          ReadOnly = True
          TabOrder = 17
        end
        object edFechaRevision: TEdit
          Left = 863
          Top = 88
          Width = 89
          Height = 21
          Anchors = [akTop, akRight]
          Enabled = False
          ReadOnly = True
          TabOrder = 18
        end
      end
      object cmbEN_VIGENCIAENDOSO_Alta: TDateComboBox
        Left = 96
        Top = 34
        Width = 88
        Height = 21
        TabOrder = 1
        Visible = False
      end
      object cbEN_ENVIOSRT: TCheckBox
        Left = 194
        Top = 37
        Width = 97
        Height = 17
        Caption = 'Env'#237'o a la SRT'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
      end
      object cbEN_ENVIOCARTA: TCheckBox
        Left = 298
        Top = 37
        Width = 97
        Height = 17
        Caption = 'Env'#237'o de Carta'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 3
      end
      object cbEN_NOTASRT: TCheckBox
        Left = 402
        Top = 37
        Width = 97
        Height = 17
        Caption = 'Env'#237'o Nota SRT'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 4
      end
      inline fraEN_MOTIVO_Alta: TfraMotivoEndoso
        Left = 96
        Top = 8
        Width = 886
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraEN_MOTIVO_AltaExit
        ExplicitLeft = 96
        ExplicitTop = 8
        ExplicitWidth = 886
        DesignSize = (
          886
          23)
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
        inherited cmbDescripcion: TComboGrid
          Width = 636
          ExplicitWidth = 636
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'Tipo Movimiento')
          ColWidths = (
            40
            300
            -1
            -1
            150)
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 356
        Width = 971
        Height = 88
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Recepci'#243'n del Contrato '
        TabOrder = 6
        object Label51: TLabel
          Left = 23
          Top = 28
          Width = 60
          Height = 13
          Caption = 'F. Impresi'#243'n'
        end
        object Label52: TLabel
          Left = 8
          Top = 60
          Width = 75
          Height = 13
          Caption = 'Cod. Recepci'#243'n'
        end
        object Label53: TLabel
          Left = 412
          Top = 28
          Width = 62
          Height = 13
          Caption = 'F. Recepci'#243'n'
        end
        object Label54: TLabel
          Left = 224
          Top = 60
          Width = 149
          Height = 13
          Caption = 'F. Recepci'#243'n Contrato Firmado'
        end
        object Label55: TLabel
          Left = 508
          Top = 60
          Width = 137
          Height = 13
          Caption = 'F. Recepci'#243'n Anexo Firmado'
        end
        object edFechaImpresion: TDateComboBox
          Left = 88
          Top = 24
          Width = 88
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object rgRecepcionOk: TRadioGroup
          Left = 240
          Top = 16
          Width = 142
          Height = 32
          Caption = 'Recepci'#243'n O&K'
          Columns = 2
          Enabled = False
          Items.Strings = (
            '&Si'
            '&No')
          TabOrder = 1
          OnClick = rgRecepOkClick
        end
        object edFechaRecepcion: TDateComboBox
          Left = 480
          Top = 24
          Width = 88
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
        object edCodigoRecepcion: TEdit
          Left = 88
          Top = 56
          Width = 120
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
        end
        object edFechaRecepcionAnexoFirmado: TDateComboBox
          Left = 648
          Top = 56
          Width = 88
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 5
        end
        object edFechaRecepcionContratoFirmado2: TDateComboBox
          Left = 376
          Top = 56
          Width = 88
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 312
        Width = 972
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Usuario Recepci'#243'n Afiliaci'#243'n'
        TabOrder = 7
        DesignSize = (
          972
          45)
        object Label59: TLabel
          Left = 28
          Top = 20
          Width = 88
          Height = 13
          Caption = 'Usuario Recepci'#243'n'
        end
        object Label64: TLabel
          Left = 747
          Top = 20
          Width = 81
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fecha Recepci'#243'n'
          ExplicitLeft = 629
        end
        object edCO_USUARIORECEPCIONSECTORAFI: TEdit
          Left = 120
          Top = 16
          Width = 616
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edCO_FECHAALTASECTORAFI: TEdit
          Left = 831
          Top = 16
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          Enabled = False
          TabOrder = 1
        end
      end
    end
    object tsIndicadores: TTabSheet
      Caption = 'Indicadores'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label60: TLabel
        Left = 8
        Top = 16
        Width = 125
        Height = 16
        Caption = 'ALTA DE CONTRATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label61: TLabel
        Left = 8
        Top = 48
        Width = 112
        Height = 16
        Caption = 'APROBACI'#211'N SRT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label62: TLabel
        Left = 8
        Top = 80
        Width = 183
        Height = 16
        Caption = 'ENV'#205'O CONTRATO AL CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label63: TLabel
        Left = 8
        Top = 112
        Width = 200
        Height = 96
        AutoSize = False
        Caption = 
          'Total de d'#237'as desde la recepci'#243'n de la Solicitud de Cobertura en' +
          ' Afiliaciones hasta el env'#237'o del contrato al cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object edAltaContrato: TEdit
        Left = 208
        Top = 16
        Width = 160
        Height = 22
        TabStop = False
        BiDiMode = bdLeftToRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
      end
      object edAprobacionSrt: TEdit
        Left = 208
        Top = 48
        Width = 160
        Height = 22
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edEnvioContratoCliente: TEdit
        Left = 208
        Top = 80
        Width = 160
        Height = 22
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edTotalDias: TEdit
        Left = 208
        Top = 112
        Width = 160
        Height = 22
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object tsFirmante: TTabSheet
      Caption = 'P. &Firmante'
      ImageIndex = 4
      OnEnter = tsFirmanteEnter
      DesignSize = (
        993
        512)
      object fpTareaSIC: TFormPanel
        Left = 1004
        Top = -25
        Width = 512
        Height = 305
        Caption = 'Gesti'#243'n de Tareas'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsDialog
        Position = poOwnerFormCenter
        OnShow = fpTareaSICShow
        object Label58: TLabel
          Left = 4
          Top = 36
          Width = 76
          Height = 26
          Caption = 'Documentaci'#243'n Faltante'
          WordWrap = True
        end
        object Label65: TLabel
          Left = 4
          Top = 172
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object edObservacionSIC: TMemo
          Left = 80
          Top = 172
          Width = 417
          Height = 89
          TabOrder = 0
        end
        object btnAceptarSIC: TButton
          Left = 336
          Top = 268
          Width = 75
          Height = 25
          Caption = 'Aceptar'
          TabOrder = 1
          OnClick = btnAceptarSICClick
        end
        object btnCancelarSIC: TButton
          Left = 420
          Top = 268
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarSICClick
        end
        object GridDocFaltante: TAdvStringGrid
          Left = 80
          Top = 36
          Width = 417
          Height = 129
          Cursor = crDefault
          ColCount = 2
          DrawingStyle = gdsClassic
          FixedCols = 0
          FixedRows = 0
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
          ScrollBars = ssBoth
          TabOrder = 3
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ControlLook.FixedGradientHoverFrom = clGray
          ControlLook.FixedGradientHoverTo = clWhite
          ControlLook.FixedGradientDownFrom = clGray
          ControlLook.FixedGradientDownTo = clSilver
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'Tahoma'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDownClear = '(All)'
          FixedRowHeight = 18
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          Look = glClassic
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          ScrollWidth = 16
          SearchFooter.Color = clBtnFace
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurence'
          SearchFooter.HintFindPrev = 'Find previous occurence'
          SearchFooter.HintHighlight = 'Highlight occurences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SelectionColor = clHighlight
          SelectionTextColor = clHighlightText
          Version = '5.8.7.0'
          ColWidths = (
            64
            329)
        end
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 512
          Height = 25
          Caption = 'ToolBar'
          EdgeBorders = [ebTop, ebBottom]
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          TabOrder = 4
          object tbCheckSic: TToolButton
            Left = 0
            Top = 0
            Hint = 'Tildar todos los items'
            Caption = 'tbCheckSic'
            ImageIndex = 59
            ParentShowHint = False
            ShowHint = True
            OnClick = tbCheckSicClick
          end
          object tbUncheckSic: TToolButton
            Left = 23
            Top = 0
            Hint = 'Destildar todos los items'
            Caption = 'tbUncheckSic'
            ImageIndex = 60
            ParentShowHint = False
            ShowHint = True
            OnClick = tbUncheckSicClick
          end
          object ToolButton11: TToolButton
            Left = 46
            Top = 0
            Width = 3
            Caption = 'ToolButton9'
            ImageIndex = 9
            Marked = True
            Style = tbsDivider
          end
          object tbSalirSic: TToolButton
            Left = 49
            Top = 0
            Hint = 'Salir (Ctrl + S)'
            Caption = 'tblSalir'
            ImageIndex = 5
            ParentShowHint = False
            ShowHint = True
            OnClick = tbSalirSicClick
          end
        end
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 993
        Height = 486
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        object tbFirmante: TToolBar
          Left = 0
          Top = 0
          Width = 1085
          Height = 30
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = [ebTop, ebRight, ebBottom]
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = True
          object tbRefresh: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar'
            Caption = 'tbRefresh'
            ImageIndex = 0
            OnClick = tbRefreshClick
          end
          object tbNuevoFirmante: TToolButton
            Left = 23
            Top = 0
            Hint = 'Nuevo Contacto'
            Caption = 'tbNuevoFirmante'
            ImageIndex = 6
            OnClick = tbNuevoFirmanteClick
          end
          object tbModif: TToolButton
            Left = 46
            Top = 0
            Hint = 'Modificar Contacto'
            Caption = 'tbModif'
            ImageIndex = 7
            OnClick = tbModifClick
          end
          object tbElim: TToolButton
            Left = 69
            Top = 0
            Hint = 'Eliminar Contacto'
            Caption = 'tbElim'
            ImageIndex = 8
            OnClick = tbElimClick
          end
          object ToolButton13: TToolButton
            Left = 92
            Top = 0
            Width = 8
            Caption = 'ToolButton13'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tbGuarda: TToolButton
            Left = 100
            Top = 0
            Hint = 'Guardar cambios'
            Caption = 'tbGuarda'
            Enabled = False
            ImageIndex = 3
            OnClick = tbGuardaClick
          end
          object tbCancel: TToolButton
            Left = 123
            Top = 0
            Hint = 'Cancelar'
            Caption = 'tbCancel'
            Enabled = False
            ImageIndex = 39
            OnClick = tbCancelClick
          end
          object ToolButton9: TToolButton
            Left = 146
            Top = 0
            Width = 8
            Caption = 'ToolButton9'
            ImageIndex = 40
            Style = tbsSeparator
          end
          object tbReactivar: TToolButton
            Left = 154
            Top = 0
            Hint = 'Reactivar contacto seleccionado'
            Caption = 'tbReactivar'
            Enabled = False
            ImageIndex = 46
            OnClick = tbReactivarClick
          end
          object tbEliminarSucesos: TToolButton
            Left = 177
            Top = 0
            Hint = 'Eliminar'
            Caption = 'tbEliminarSucesos'
            ImageIndex = 56
            OnClick = tbEliminarSucesosClick
          end
        end
        inline fraEmpresaFirmante: TfraEmpresa
          Left = 216
          Top = 8
          Width = 477
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ExplicitLeft = 216
          ExplicitTop = 8
          ExplicitWidth = 477
          ExplicitHeight = 21
          inherited lbContrato: TLabel
            Left = 373
            ExplicitLeft = 373
          end
          inherited edContrato: TIntEdit
            Left = 420
            ExplicitLeft = 420
          end
          inherited cmbRSocial: TArtComboBox
            Width = 238
            ExplicitWidth = 238
          end
        end
        object pnlFirmante: TPanel
          Left = 699
          Top = 1
          Width = 218
          Height = 28
          Alignment = taRightJustify
          BevelOuter = bvNone
          TabOrder = 2
          TabStop = True
          object Label66: TLabel
            Left = 118
            Top = 8
            Width = 34
            Height = 13
            Alignment = taCenter
            Caption = 'Suceso'
            Layout = tlCenter
          end
          object ToolBar1: TToolBar
            Left = 5
            Top = 3
            Width = 92
            Height = 22
            Align = alNone
            AutoSize = True
            Caption = 'tbHerramientas'
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            TabOrder = 0
            Transparent = True
            object tbPrimerSuceso: TToolButton
              Left = 0
              Top = 0
              Hint = 'Primero'
              ImageIndex = 33
              ParentShowHint = False
              ShowHint = True
              OnClick = tbPrimerSucesoClick
            end
            object tbAnteriorSuceso: TToolButton
              Left = 23
              Top = 0
              Hint = 'Anterior'
              ImageIndex = 34
              ParentShowHint = False
              ShowHint = True
              OnClick = tbAnteriorSucesoClick
            end
            object tbProximoSuceso: TToolButton
              Left = 46
              Top = 0
              Hint = 'Siguiente'
              ImageIndex = 35
              ParentShowHint = False
              ShowHint = True
              OnClick = tbProximoSucesoClick
            end
            object tbUltimoSuceso: TToolButton
              Left = 69
              Top = 0
              Hint = #218'ltimo'
              ImageIndex = 36
              ParentShowHint = False
              ShowHint = True
              OnClick = tbUltimoSucesoClick
            end
          end
          object edSuceso: TEdit
            Left = 165
            Top = 4
            Width = 47
            Height = 21
            TabStop = False
            Color = clSilver
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
        end
        object dbGridContactos: TArtDBGrid
          Left = 0
          Top = 30
          Width = 1085
          Height = 169
          Align = alTop
          DataSource = sdDatosContacto
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbGridContactosCellClick
          OnGetCellParams = dbGridContactosGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CT_CONTACTO'
              Title.Caption = 'Nombre'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARGO'
              Title.Caption = 'Cargo'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CF_CARACTER'
              Title.Caption = 'Caracter'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONOS'
              Title.Caption = 'Tel'#233'fonos'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_DIRELECTRONICA'
              Title.Caption = 'Dir. Electronica'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPODOCUMENTO'
              Title.Caption = 'Tipo de Documento'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CT_NUMERODOCUMENTO'
              Title.Caption = 'N'#250'mero Doc.'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEXO'
              Title.Caption = 'Sexo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOFIRMA'
              Title.Caption = 'Tipo de Firmante'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ULTPROC'
              Title.Caption = 'Fecha. Ult. Proc.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO'
              Title.Caption = 'Resultado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESPEP'
              Title.Caption = 'Es Pep'
              Visible = True
            end>
        end
        object gbContacto: TGroupBox
          Left = 4
          Top = 208
          Width = 525
          Height = 189
          Caption = 'Contacto'
          TabOrder = 4
          DesignSize = (
            525
            189)
          object Label67: TLabel
            Left = 364
            Top = 140
            Width = 69
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'N'#186' Documento'
          end
          object Label68: TLabel
            Left = 4
            Top = 140
            Width = 77
            Height = 13
            Caption = 'Tipo Documento'
          end
          object Label70: TLabel
            Left = 32
            Top = 164
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label74: TLabel
            Left = 180
            Top = 164
            Width = 80
            Height = 13
            Caption = 'Tipo de Firmante'
          end
          object Label69: TLabel
            Left = 16
            Top = 116
            Width = 42
            Height = 13
            Caption = 'Car'#225'cter'
          end
          inline fraContacto: TfraContacto
            Left = 9
            Top = 16
            Width = 508
            Height = 93
            Anchors = [akLeft, akRight, akBottom]
            Constraints.MinHeight = 90
            Constraints.MinWidth = 480
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 9
            ExplicitTop = 16
            ExplicitWidth = 508
            ExplicitHeight = 93
            DesignSize = (
              508
              93)
            inherited lbContacto: TLabel
              Left = 10
              Width = 37
              Caption = 'Nombre'
              ExplicitLeft = 10
              ExplicitWidth = 37
            end
            inherited lbArea: TLabel
              Left = 364
              Top = 41
              Width = 22
              Caption = 'area'
              ExplicitLeft = 364
              ExplicitTop = 41
              ExplicitWidth = 22
            end
            inherited lbeMail: TLabel
              Left = 23
              ExplicitLeft = 23
            end
            inherited lbCAFAX: TLabel
              Left = 249
              ExplicitLeft = 249
            end
            inherited lbFAX: TLabel
              Left = 295
              ExplicitLeft = 295
            end
            inherited CheckBox1: TCheckBox
              Left = 472
              Top = 75
              ExplicitLeft = 472
              ExplicitTop = 75
            end
            inherited edContacto: TEdit
              Left = 51
              Width = 457
              ExplicitLeft = 51
              ExplicitWidth = 457
            end
            inherited edAreaFax: TPatternEdit
              Left = 269
              ExplicitLeft = 269
            end
            inherited edFax: TPatternEdit
              Left = 316
              Width = 178
              ExplicitLeft = 316
              ExplicitWidth = 178
            end
            inherited edEmail: TEdit
              Left = 51
              Width = 349
              ExplicitLeft = 51
              ExplicitWidth = 349
            end
            inherited fraArea: TfraStaticCTB_TABLAS
              Left = 408
              Top = 30
              Width = 227
              Visible = False
              ExplicitLeft = 408
              ExplicitTop = 30
              ExplicitWidth = 227
              inherited cmbDescripcion: TComboGrid
                Left = 64
                Width = 163
                ExplicitLeft = 64
                ExplicitWidth = 163
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
            inherited fraCargo: TfraStaticCTB_TABLAS
              Left = 50
              Width = 453
              ExplicitLeft = 50
              ExplicitWidth = 453
              inherited cmbDescripcion: TComboGrid
                Left = 64
                Width = 389
                ExplicitLeft = 64
                ExplicitWidth = 389
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
            inherited fraTelefonos: TfraTelefono
              Left = -3
              ExplicitLeft = -3
              inherited lbTelefonoTitulo: TLabel
                Left = 36
                Top = 5
                ExplicitLeft = 36
                ExplicitTop = 5
              end
              inherited btnABMTelefonos: TButton
                Left = 229
                ExplicitLeft = 229
              end
              inherited cmbTelefonos: TComboGrid
                Left = 54
                Width = 173
                ExplicitLeft = 54
                ExplicitWidth = 173
                Cells = ()
                ColWidths = (
                  64
                  64)
              end
            end
            inherited chkRemitenteCarta: TCheckBox
              Left = 404
              Visible = False
              ExplicitLeft = 404
            end
            inherited sdqDatos: TSDQuery
              Left = 4
              Top = 12
            end
            inherited dsDatos: TDataSource
              Left = 0
              Top = 60
            end
          end
          inline fraCaracter: TfraCodigoDescripcion
            Left = 59
            Top = 112
            Width = 453
            Height = 23
            TabOrder = 1
            ExplicitLeft = 59
            ExplicitTop = 112
            ExplicitWidth = 453
            inherited cmbDescripcion: TArtComboBox
              Width = 388
              ExplicitWidth = 388
            end
          end
          object edNumeroDocumento: TEdit
            Left = 435
            Top = 136
            Width = 74
            Height = 21
            Anchors = [akTop, akRight]
            MaxLength = 8
            TabOrder = 3
            Text = '99998888'
            OnExit = edNumeroDocumentoExit
          end
          inline fraTipoDocumento: TfraCtbTablas
            Left = 84
            Top = 136
            Width = 277
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 84
            ExplicitTop = 136
            ExplicitWidth = 277
            inherited cmbDescripcion: TArtComboBox
              Width = 224
              ExplicitWidth = 224
            end
          end
          object cboxSexo: TComboBox
            Left = 60
            Top = 160
            Width = 101
            Height = 21
            Style = csDropDownList
            TabOrder = 4
            Items.Strings = (
              'Masculino'
              'Femenino')
          end
          inline fraTipoFirmante: TfraCtbTablas
            Left = 262
            Top = 160
            Width = 251
            Height = 23
            TabOrder = 5
            ExplicitLeft = 262
            ExplicitTop = 160
            ExplicitWidth = 251
            inherited cmbDescripcion: TArtComboBox
              Width = 198
              ExplicitWidth = 198
            end
          end
          object btnBuscarContacto: TButton
            Left = 452
            Top = 16
            Width = 69
            Height = 21
            Caption = 'Buscar'
            TabOrder = 6
            OnClick = btnBuscarContactoClick
          end
        end
        object gbFirmaPersoneriaFirmante: TGroupBox
          Left = 536
          Top = 208
          Width = 385
          Height = 78
          Caption = ' Personer'#237'a Firmante '
          TabOrder = 5
          object Label71: TLabel
            Left = 147
            Top = 12
            Width = 69
            Height = 26
            Caption = 'Firma Titular / Apoderado'
            WordWrap = True
          end
          object Label72: TLabel
            Left = 246
            Top = 12
            Width = 46
            Height = 26
            Caption = 'Firma Vendedor'
            WordWrap = True
          end
          object Label73: TLabel
            Left = 333
            Top = 16
            Width = 40
            Height = 13
            Caption = 'Faltante'
          end
        end
        object gbFormulariosAnexosFirmante: TGroupBox
          Left = 536
          Top = 292
          Width = 385
          Height = 73
          Caption = 'Formularios y Anexos'
          TabOrder = 6
          DesignSize = (
            385
            73)
          object rbRefreshDocFirmante: TBitBtn
            Left = 339
            Top = 50
            Width = 23
            Height = 23
            Hint = 'Revisar estado de documentac'#237'on faltante'
            Anchors = [akTop, akRight]
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000C40E0000C40E00000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
              000000FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
              00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
              00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFD000000
              00F900000000FDFDFDFDFDFDFD00F9F9F9F9F9F9F900FDFDFDFDFDFDFDFD00F9
              F9F9F9F900FDFDFDFDFDFDFDFDFD00F9F9F9F9F900FDFDFDFDFDFDFDFDFDFD00
              F9F9F900FDFDFDFDFDFDFDFDFDFDFD00F9F9F900FDFDFDFDFDFDFDFDFDFDFDFD
              00F900FDFDFDFDFDFDFDFDFDFDFDFDFD00F900FDFDFDFDFDFDFDFDFDFDFDFDFD
              FD00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD00FDFDFDFDFDFDFDFD}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = rbRefreshDocFirmanteClick
          end
        end
        object gbPep: TGroupBox
          Left = 536
          Top = 368
          Width = 385
          Height = 85
          Caption = 'Personas Expuestas Pol'#237'ticamente'
          TabOrder = 7
          DesignSize = (
            385
            85)
          object Label75: TLabel
            Left = 166
            Top = 12
            Width = 35
            Height = 13
            Anchors = [akTop]
            Caption = 'Firma 1'
          end
          object Label76: TLabel
            Left = 250
            Top = 12
            Width = 35
            Height = 13
            Anchors = [akTop]
            Caption = 'Firma 2'
          end
          object Label77: TLabel
            Left = 304
            Top = 12
            Width = 68
            Height = 13
            Anchors = [akTop]
            Caption = 'Es PEP (Si/No)'
          end
          object lbWorldsys: TLabel
            Left = 128
            Top = 48
            Width = 250
            Height = 25
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Worldsys'
            Constraints.MinWidth = 250
            WordWrap = True
          end
          object chkPep: TCheckBox
            Left = 11
            Top = 28
            Width = 61
            Height = 17
            Anchors = [akTop]
            Caption = 'PEPs'
            TabOrder = 0
          end
          object chkFirma1: TCheckBox
            Left = 175
            Top = 28
            Width = 25
            Height = 17
            Anchors = [akTop]
            TabOrder = 1
            OnClick = chkFirma1Click
          end
          object chkFirma2: TCheckBox
            Left = 258
            Top = 28
            Width = 33
            Height = 17
            Anchors = [akTop]
            TabOrder = 2
          end
          object cboxEsPep: TComboBox
            Left = 304
            Top = 28
            Width = 73
            Height = 21
            Style = csDropDownList
            Anchors = [akTop]
            TabOrder = 3
            Items.Strings = (
              'No'
              'Si'
              'En Blanco')
          end
          object btnWorldSys: TButton
            Left = 8
            Top = 48
            Width = 109
            Height = 21
            Caption = 'Buscar en Worldsys'
            TabOrder = 4
            WordWrap = True
            OnClick = btnWorldSysClick
          end
        end
        object gbInformeComercial: TGroupBox
          Left = 536
          Top = 456
          Width = 385
          Height = 53
          Caption = 'Informe Comercial'
          TabOrder = 8
          object Label56: TLabel
            Left = 276
            Top = 8
            Width = 94
            Height = 13
            Caption = 'Ultima Actualizaci'#243'n'
          end
          object btnInformeComercial: TButton
            Left = 8
            Top = 20
            Width = 117
            Height = 25
            Caption = 'Informe Comercial'
            TabOrder = 0
            OnClick = btnInformeComercialClick
          end
          object btnVisualizar: TButton
            Left = 140
            Top = 20
            Width = 117
            Height = 25
            Caption = 'Visualizar'
            TabOrder = 1
            OnClick = btnVisualizarClick
          end
          object edInformeFecha: TEdit
            Left = 260
            Top = 24
            Width = 121
            Height = 21
            Color = clBtnFace
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object gbContrato: TGroupBox
          Left = 536
          Top = 512
          Width = 385
          Height = 49
          Caption = 'Contrato'
          TabOrder = 9
          object chkContratoFirmadoPep: TCheckBox
            Left = 12
            Top = 20
            Width = 112
            Height = 17
            Caption = 'Contrato Firmado'
            TabOrder = 0
          end
          object ToolBar2: TToolBar
            Left = 122
            Top = 11
            Width = 31
            Height = 30
            Align = alNone
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TabStop = True
            object tbGuardarEstadoContrato: TToolButton
              Left = 0
              Top = 0
              Hint = 'Guardar estado del contrato'
              Caption = 'tbGuarda'
              ImageIndex = 3
              OnClick = tbGuardarEstadoContratoClick
            end
          end
        end
        object cboxComentario: TGroupBox
          Left = 4
          Top = 396
          Width = 525
          Height = 73
          Caption = 'Comentario'
          TabOrder = 10
          DesignSize = (
            525
            73)
          object edComentarios: TMemo
            Left = 8
            Top = 16
            Width = 509
            Height = 53
            Anchors = [akLeft, akTop, akRight]
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object btnRevisionPep: TButton
          Left = 4
          Top = 476
          Width = 117
          Height = 37
          Caption = 'Revisi'#243'n PEP'
          TabOrder = 11
          OnClick = btnRevisionPepClick
        end
        object gbRevisionPepComentario: TGroupBox
          Left = 124
          Top = 472
          Width = 405
          Height = 81
          Caption = 'Revisi'#243'n PEP'
          TabOrder = 12
          object Label57: TLabel
            Left = 4
            Top = 40
            Width = 32
            Height = 13
            Caption = 'Riesgo'
          end
          object edRevisionPep: TEdit
            Left = 4
            Top = 16
            Width = 101
            Height = 21
            TabOrder = 0
          end
          object edRevisionPepComentario: TMemo
            Left = 108
            Top = 16
            Width = 293
            Height = 61
            TabOrder = 1
          end
          object edExposicion: TEdit
            Left = 4
            Top = 52
            Width = 101
            Height = 21
            TabOrder = 2
          end
          object edExpNum: TEdit
            Left = 68
            Top = 40
            Width = 33
            Height = 21
            TabOrder = 3
            Visible = False
          end
          object edExp: TEdit
            Left = 32
            Top = 40
            Width = 33
            Height = 21
            TabOrder = 4
            Visible = False
          end
        end
        object gbDatosModificacionFirmante: TGroupBox
          Left = 0
          Top = 523
          Width = 529
          Height = 49
          Caption = ' Datos Modificaci'#243'n '
          TabOrder = 13
          object Label78: TLabel
            Left = 12
            Top = 24
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object Label79: TLabel
            Left = 244
            Top = 24
            Width = 29
            Height = 13
            Caption = 'Fecha'
          end
          object edUsuarioFirmante: TEdit
            Left = 56
            Top = 20
            Width = 176
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
            Text = 'edUsuario'
          end
          object edFechaFirmante: TDateComboBox
            Left = 276
            Top = 20
            Width = 105
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 1
          end
        end
        object chkVerBajas: TCheckBox
          Left = 924
          Top = 12
          Width = 161
          Height = 17
          Caption = 'Ver contactos dados de baja'
          Checked = True
          State = cbChecked
          TabOrder = 14
          OnClick = chkVerBajasClick
        end
      end
    end
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 1006
    Height = 30
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = [ebTop, ebBottom]
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tbLimpiar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'tbLimpiar'
      ImageIndex = 1
      OnClick = tbLimpiarClick
    end
    object tbGuardar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tbGuardar'
      ImageIndex = 3
      OnClick = tbGuardarClick
    end
    object ToolButton4: TToolButton
      Left = 46
      Top = 0
      Width = 8
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tblNomina: TToolButton
      Left = 54
      Top = 0
      Hint = 'Nomina (Ctrl + O)'
      Caption = 'tblNomina'
      ImageIndex = 19
      OnClick = tblNominaClick
    end
    object tblEstablecimiento: TToolButton
      Left = 77
      Top = 0
      Hint = 'Establecimiento (Ctrl + E)'
      Caption = 'tblEstablecimiento'
      ImageIndex = 20
      OnClick = tblEstablecimientoClick
    end
    object tblLugarTrabajo: TToolButton
      Left = 100
      Top = 0
      Hint = 'Lugar de trabajo PCP'
      Caption = 'tblLugarTrabajo'
      ImageIndex = 61
      OnClick = tblLugarTrabajoClick
    end
    object tblSRT: TToolButton
      Left = 123
      Top = 0
      Hint = 'Informaci'#243'n de la SRT (Ctrl+R)'
      Caption = 'tblSRT'
      ImageIndex = 17
      OnClick = tblSRTClick
    end
    object ToolButton2: TToolButton
      Left = 146
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbVendedor: TToolButton
      Left = 154
      Top = 0
      Hint = 'Vendedores (Ctrl-V)'
      Caption = 'Vendedores'
      ImageIndex = 26
      OnClick = tbVendedorClick
    end
    object tbContactos: TToolButton
      Left = 177
      Top = 0
      Hint = 'Contactos (Ctrl-C)'
      Caption = 'Contactos'
      ImageIndex = 7
      OnClick = tbContactosClick
    end
    object tbTarifa: TToolButton
      Left = 200
      Top = 0
      Hint = 'Tarifa (Ctrl-T)'
      Caption = 'Tarifa'
      ImageIndex = 25
      OnClick = tbTarifaClick
    end
    object tbEndosos: TToolButton
      Left = 223
      Top = 0
      Hint = 'Endosos (Ctrl-D)'
      Caption = 'Endosos'
      ImageIndex = 16
      OnClick = tbEndososClick
    end
    object tbCartas: TToolButton
      Left = 246
      Top = 0
      Hint = 'Cartas (Ctrl-A)'
      Caption = 'Cartas'
      ImageIndex = 30
      OnClick = tbCartasClick
    end
    object tbTraspasoIngreso: TToolButton
      Left = 269
      Top = 0
      Hint = 'Eventos Traspaso Ingreso'
      Caption = 'tbTraspasoIngreso'
      ImageIndex = 9
      OnClick = tbTraspasoIngresoClick
    end
    object tbGestorCuenta: TToolButton
      Left = 292
      Top = 0
      Hint = 'Gestor de Cuenta (Ctrl-U)'
      Caption = 'Gestor de Cuenta'
      ImageIndex = 7
      OnClick = tbGestorCuentaClick
    end
    object tbGestorAumento: TToolButton
      Left = 315
      Top = 0
      Hint = 'Gestor de Aumento (Ctrl-Q)'
      ImageIndex = 37
      OnClick = tbGestorAumentoClick
    end
    object tbEjecutivoCuenta: TToolButton
      Left = 338
      Top = 0
      Hint = 'Ejecutivo de Cuenta (Ctrl-J)'
      Caption = 'Ejecutivo de Cuenta'
      ImageIndex = 13
      OnClick = tbEjecutivoCuentaClick
    end
    object tblImprimir: TToolButton
      Left = 361
      Top = 0
      Hint = 'Imprimir (Ctrl + I)'
      Caption = 'Imprimir'
      ImageIndex = 4
      OnClick = tblImprimirClick
    end
    object tbImprimirUltimaRenovacion: TToolButton
      Left = 384
      Top = 0
      Hint = 'Imprimir el '#250'ltimo endoso de renovaci'#243'n autom'#225'tica'
      Caption = 'tbImprimirUltimaRenovacion'
      DropdownMenu = mnuRenovacionAutomatica
      ImageIndex = 52
      Style = tbsDropDown
      OnClick = tbImprimirUltimaRenovacionClick
    end
    object tbCambiarCuit: TToolButton
      Left = 422
      Top = 0
      Hint = 'Cambio de CUIT (Ctrl + M)'
      Caption = 'tbCambiarCuit'
      ImageIndex = 29
      OnClick = tbCambiarCuitClick
    end
    object tbCuentasBancarias: TToolButton
      Left = 445
      Top = 0
      Hint = 'Cuentas Bancarias (Ctrl+U)'
      ImageIndex = 23
      OnClick = tbCuentasBancariasClick
    end
    object ToolButton6: TToolButton
      Left = 468
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 23
      Style = tbsSeparator
    end
    object tbExtensionVigencia: TToolButton
      Left = 476
      Top = 0
      Hint = 'Extensi'#243'n Vigencia (Ctrl+S)'
      Caption = 'tbExtensionVigencia'
      ImageIndex = 22
      OnClick = tbExtensionVigenciaClick
    end
    object ToolButton7: TToolButton
      Left = 499
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbModificarEndoso: TToolButton
      Left = 507
      Top = 0
      Hint = 'Modifica Endoso'
      Caption = 'tbModificarEndoso'
      ImageIndex = 7
      OnClick = tbModificarEndosoClick
    end
    object ToolButton8: TToolButton
      Left = 530
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbFechaSRT: TToolButton
      Left = 538
      Top = 0
      Hint = 'Modificar la fecha de env'#237'o y recepci'#243'n a la SRT'
      Caption = 'tbFechaSRT'
      ImageIndex = 15
      OnClick = tbFechaSRTClick
    end
    object ToolButton12: TToolButton
      Left = 561
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object tbDelegacion: TToolButton
      Left = 569
      Top = 0
      Hint = 'Delegaci'#243'n'
      ImageIndex = 20
      OnClick = tbDelegacionClick
    end
    object tbPreventor: TToolButton
      Left = 592
      Top = 0
      Hint = 'Preventor'
      ImageIndex = 26
      OnClick = tbPreventorClick
    end
    object tbRecepcionCarta: TToolButton
      Left = 615
      Top = 0
      Hint = 'Recepci'#243'n Contrato'
      Caption = 'tbRecepcionCarta'
      ImageIndex = 18
      OnClick = tbRecepcionCartaClick
    end
    object tblRiesgoPCP: TToolButton
      Left = 638
      Top = 0
      Hint = 'Riesgos Personal Casas Particulares'
      Caption = 'tblRiesgoPCP'
      ImageIndex = 59
      OnClick = tblRiesgoPCPClick
    end
    object tbDocumentacion: TToolButton
      Left = 661
      Top = 0
      Hint = 'Documentaci'#243'n'
      Caption = 'tbDocumentacion'
      ImageIndex = 45
      Visible = False
      OnClick = tbDocumentacionClick
    end
    object tbVisualizadorDocumentacionDigitalizada: TToolButton
      Left = 684
      Top = 0
      Hint = 'Visualizador de documentaci'#243'n digitalizada'
      Caption = 'tbVisualizadorDocumentacionDigitalizada'
      ImageIndex = 21
      OnClick = tbVisualizadorDocumentacionDigitalizadaClick
    end
    object ToolButton10: TToolButton
      Left = 707
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tblSalir: TToolButton
      Left = 715
      Top = 0
      Hint = 'Salir (Ctrl + S)'
      Caption = 'tblSalir'
      ImageIndex = 5
      OnClick = tblSalirClick
    end
  end
  object fpDialogCambioCuit: TFormPanel
    Left = 958
    Top = 329
    Width = 183
    Height = 94
    Caption = 'Cambio de CUIT'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 94
    Constraints.MaxWidth = 183
    Constraints.MinHeight = 94
    Constraints.MinWidth = 183
    DesignSize = (
      183
      94)
    object BevelAbm: TBevel
      Left = 4
      Top = 58
      Width = 175
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbCuitAnterior: TLabel
      Left = 8
      Top = 10
      Width = 73
      Height = 13
      Caption = 'C.U.I.T. Actual'
    end
    object lbCuitNuevo: TLabel
      Left = 8
      Top = 36
      Width = 74
      Height = 13
      Caption = 'C.U.I.T. Nuevo'
    end
    object btnAceptarCambioCuit: TButton
      Left = 24
      Top = 64
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
      TabOrder = 1
      OnClick = btnAceptarCambioCuitClick
    end
    object btnCancelarCambioCuit: TButton
      Left = 103
      Top = 64
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edCuitActual: TMaskEdit
      Left = 94
      Top = 6
      Width = 84
      Height = 21
      TabStop = False
      Color = clBtnFace
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      ReadOnly = True
      TabOrder = 3
      OnExit = edEM_CUITExit
    end
    object edCuitNuevo: TMaskEdit
      Left = 94
      Top = 32
      Width = 84
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edEM_CUITExit
    end
  end
  object tbHerramientas: TToolBar
    Left = 308
    Top = 34
    Width = 551
    Height = 22
    Align = alNone
    Caption = 'tbHerramientas'
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    TabOrder = 3
    Transparent = True
    DesignSize = (
      551
      22)
    object tbPrimero: TToolButton
      Left = 0
      Top = 0
      Hint = 'Primero (Ctrl+Home)'
      Enabled = False
      ImageIndex = 33
      ParentShowHint = False
      ShowHint = True
      OnClick = tbPrimeroClick
    end
    object tbAnterior: TToolButton
      Left = 23
      Top = 0
      Hint = 'Anterior (Ctrl+PgDn)'
      Enabled = False
      ImageIndex = 34
      ParentShowHint = False
      ShowHint = True
      OnClick = tbAnteriorClick
    end
    object tbSiguiente: TToolButton
      Left = 46
      Top = 0
      Hint = 'Siguiente (Ctrl+PgUp)'
      Enabled = False
      ImageIndex = 35
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSiguienteClick
    end
    object tbUltimo: TToolButton
      Left = 69
      Top = 0
      Hint = #218'ltimo (Ctrl+End)'
      Enabled = False
      ImageIndex = 36
      ParentShowHint = False
      ShowHint = True
      OnClick = tbUltimoClick
    end
    object ToolBu5: TToolButton
      Left = 92
      Top = 0
      Width = 8
      Caption = 'tbSeparador3'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object edtbDesc: TEdit
      Left = 100
      Top = 0
      Width = 144
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 244
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object Label35: TLabel
      Left = 252
      Top = 0
      Width = 41
      Height = 22
      Alignment = taCenter
      Caption = ' Endoso '
      Layout = tlCenter
    end
    object edtbEndoso: TEdit
      Left = 293
      Top = 0
      Width = 32
      Height = 22
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object ToolButton3: TToolButton
      Left = 325
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Label36: TLabel
      Left = 333
      Top = 0
      Width = 30
      Height = 22
      Alignment = taCenter
      Caption = ' Mov. '
      Layout = tlCenter
    end
    object edtbMov: TEdit
      Left = 363
      Top = 0
      Width = 32
      Height = 22
      Anchors = [akTop, akRight]
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object ToolButton5: TToolButton
      Left = 395
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object Label37: TLabel
      Left = 403
      Top = 0
      Width = 45
      Height = 22
      Alignment = taCenter
      Caption = ' Vigencia '
      Layout = tlCenter
    end
    object edtbVigencia: TDateComboBox
      Left = 448
      Top = 0
      Width = 88
      Height = 22
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object ToolButton15: TToolButton
      Left = 536
      Top = 0
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 13
      Style = tbsSeparator
    end
  end
  object fpModificaFechasSRT: TFormPanel
    Left = 958
    Top = 224
    Width = 200
    Height = 144
    Caption = 'Modificaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpModificaFechasSRTBeforeShow
    Constraints.MaxHeight = 144
    Constraints.MaxWidth = 200
    Constraints.MinHeight = 144
    Constraints.MinWidth = 200
    DesignSize = (
      200
      144)
    object Bevel1: TBevel
      Left = 4
      Top = 108
      Width = 192
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label32: TLabel
      Left = 16
      Top = 18
      Width = 68
      Height = 13
      Caption = 'Env'#237'o a la SRT'
    end
    object Label40: TLabel
      Left = 16
      Top = 54
      Width = 71
      Height = 13
      Caption = 'Recepci'#243'n SRT'
    end
    object btnAceptarModFecSRT: TButton
      Left = 41
      Top = 114
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
      OnClick = btnAceptarModFecSRTClick
    end
    object btnCancelarModFecSRT: TButton
      Left = 120
      Top = 114
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object cmbEnvioSRT: TDateComboBox
      Left = 98
      Top = 15
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object cmbRecepcionSRT: TDateComboBox
      Left = 98
      Top = 51
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object checkLimpiarRechazo: TCheckBox
      Left = 16
      Top = 80
      Width = 94
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Limpiar rechazo'
      TabOrder = 2
    end
  end
  object fpRecepcionCarta: TFormPanel
    Left = 942
    Top = 19
    Width = 400
    Height = 184
    Caption = 'Recepci'#243'n del Acuse de Recibo del Contrato'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpRecepcionCartaShow
    Constraints.MinHeight = 126
    Constraints.MinWidth = 400
    DesignSize = (
      400
      184)
    object Bevel2: TBevel
      Left = 4
      Top = 148
      Width = 392
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label41: TLabel
      Left = 8
      Top = 44
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Recepci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbCodRecepcion: TLabel
      Left = 8
      Top = 72
      Width = 77
      Height = 13
      AutoSize = False
      Caption = 'Cod. Recepci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label42: TLabel
      Left = 8
      Top = 20
      Width = 57
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Impresi'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbFechaRecepcionContratoFirmado: TLabel
      Left = 8
      Top = 96
      Width = 147
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Recepci'#243'n Contrato Firmado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label47: TLabel
      Left = 8
      Top = 120
      Width = 137
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Recepci'#243'n Anexo Firmado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbRecepcionSi: TComboBox
      Left = 88
      Top = 68
      Width = 304
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbRecepcionSiChange
      Items.Strings = (
        'FIRMADO'
        'NO FIRMADO')
    end
    object btnRecepcionAceptar: TButton
      Left = 240
      Top = 154
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btnRecepcionAceptarClick
    end
    object btnCancelar: TButton
      Left = 320
      Top = 154
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object dcbFechaRecepcion: TDateComboBox
      Left = 88
      Top = 40
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object rgRecepOk: TRadioGroup
      Left = 184
      Top = 32
      Width = 142
      Height = 32
      Caption = 'Recepci'#243'n O&K'
      Columns = 2
      Items.Strings = (
        '&Si'
        '&No')
      TabOrder = 2
      OnClick = rgRecepOkClick
    end
    object dcbFechaImpresion: TDateComboBox
      Left = 88
      Top = 16
      Width = 88
      Height = 21
      TabStop = False
      Color = clBtnFace
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object btnCerrar: TButton
      Left = 320
      Top = 154
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 6
      OnClick = btnCancelarClick
    end
    object edFechaRecepcionContratoFirmado: TDateComboBox
      Left = 160
      Top = 92
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object edFechaRecepcionVentanillaElectronica: TDateComboBox
      Left = 160
      Top = 116
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    inline fraRecepcionNo: TfraCodigoDescripcion
      Left = 87
      Top = 66
      Width = 306
      Height = 23
      TabOrder = 9
      ExplicitLeft = 87
      ExplicitTop = 66
      ExplicitWidth = 306
      inherited cmbDescripcion: TArtComboBox
        Width = 241
        ExplicitWidth = 241
      end
    end
  end
  object fpDocumentacion: TFormPanel
    Left = 960
    Top = 352
    Width = 496
    Height = 161
    Caption = 'Documentaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpDocumentacionBeforeShow
    object pbControles: TPanel
      Left = 4
      Top = 8
      Width = 496
      Height = 145
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        496
        145)
      object gbPresentoRgrl: TGroupBox
        Left = 8
        Top = 73
        Width = 240
        Height = 32
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        object chkContratoFirmado: TCheckBox
          Left = 16
          Top = 12
          Width = 112
          Height = 17
          Caption = 'Contrato Firmado'
          TabOrder = 0
        end
      end
      object gbCotizacion: TGroupBox
        Left = 8
        Top = 1
        Width = 240
        Height = 72
        Anchors = [akLeft, akBottom]
        Caption = ' Cotizaci'#243'n '
        TabOrder = 0
        object chkCotizacionTitular: TCheckBox
          Left = 16
          Top = 34
          Width = 112
          Height = 17
          Caption = 'Titular / Apoderado'
          TabOrder = 1
        end
        object chkCotizacionVendedor: TCheckBox
          Left = 16
          Top = 52
          Width = 112
          Height = 17
          Caption = 'Vendedor'
          TabOrder = 2
        end
        object chkCotizacionCotizacion: TCheckBox
          Left = 16
          Top = 16
          Width = 112
          Height = 17
          Caption = 'Cotizaci'#243'n'
          TabOrder = 0
        end
      end
      object btnAceptar: TButton
        Left = 336
        Top = 113
        Width = 72
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Aceptar'
        Default = True
        TabOrder = 3
        OnClick = btnAceptarClick
      end
      object btnCerrar2: TButton
        Left = 416
        Top = 113
        Width = 72
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Cerrar'
        TabOrder = 4
        OnClick = btnCerrar2Click
      end
      object gbDatosModificacion: TGroupBox
        Left = 252
        Top = 1
        Width = 240
        Height = 72
        Anchors = [akLeft, akBottom]
        Caption = ' Datos Modificaci'#243'n '
        TabOrder = 2
        object Label14: TLabel
          Left = 12
          Top = 24
          Width = 36
          Height = 13
          Caption = 'Usuario'
        end
        object Label48: TLabel
          Left = 12
          Top = 48
          Width = 29
          Height = 13
          Caption = 'Fecha'
        end
        object edUsuario: TEdit
          Left = 56
          Top = 20
          Width = 176
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          Text = 'edUsuario'
        end
        object edFecha: TDateComboBox
          Left = 56
          Top = 44
          Width = 88
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
      end
      object pnBotones: TPanel
        Left = 8
        Top = 119
        Width = 296
        Height = 30
        Anchors = [akLeft, akBottom]
        TabOrder = 5
        object Label49: TLabel
          Left = 111
          Top = 8
          Width = 41
          Height = 13
          Alignment = taCenter
          Caption = ' Endoso '
          Layout = tlCenter
        end
        object Label50: TLabel
          Left = 210
          Top = 8
          Width = 30
          Height = 13
          Alignment = taCenter
          Caption = ' Mov. '
          Layout = tlCenter
        end
        object tbBotones: TToolBar
          Left = 5
          Top = 3
          Width = 92
          Height = 22
          Align = alNone
          AutoSize = True
          Caption = 'tbHerramientas'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          TabOrder = 0
          Transparent = True
          object tbPrimero2: TToolButton
            Left = 0
            Top = 0
            Hint = 'Primero'
            Enabled = False
            ImageIndex = 33
            ParentShowHint = False
            ShowHint = True
            OnClick = tbPrimero2Click
          end
          object tbAnterior2: TToolButton
            Left = 23
            Top = 0
            Hint = 'Anterior'
            Enabled = False
            ImageIndex = 34
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAnterior2Click
          end
          object tbSiguiente2: TToolButton
            Left = 46
            Top = 0
            Hint = 'Siguiente'
            Enabled = False
            ImageIndex = 35
            ParentShowHint = False
            ShowHint = True
            OnClick = tbSiguiente2Click
          end
          object tbUltimo2: TToolButton
            Left = 69
            Top = 0
            Hint = #218'ltimo'
            Enabled = False
            ImageIndex = 36
            ParentShowHint = False
            ShowHint = True
            OnClick = tbUltimo2Click
          end
        end
        object edEndoso: TEdit
          Left = 153
          Top = 4
          Width = 47
          Height = 21
          TabStop = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object edMovimiento: TEdit
          Left = 241
          Top = 4
          Width = 47
          Height = 21
          TabStop = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object btnRevisionLegajo: TButton
        Left = 336
        Top = 81
        Width = 128
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Revisi'#243'n del Legajo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = btnRevisionLegajoClick
      end
    end
  end
  object fpGuardarFirmante: TFormPanel
    Left = 956
    Top = 44
    Width = 245
    Height = 177
    Caption = 'Guardar Datos del Firmante'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpGuardarFirmanteShow
    object btnCerrarFirmante: TButton
      Left = 160
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCerrarFirmanteClick
    end
    object btnAceptarFirmante: TButton
      Left = 84
      Top = 144
      Width = 71
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = btnAceptarFirmanteClick
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 8
      Width = 229
      Height = 129
      Caption = 'Tipo de Revisi'#243'n'
      TabOrder = 0
      object rbRevisionLegajo: TRadioButton
        Left = 16
        Top = 20
        Width = 113
        Height = 17
        Caption = 'Revisi'#243'n de Legajo'
        TabOrder = 0
      end
      object rbRevisionIncorporaDoc: TRadioButton
        Left = 16
        Top = 48
        Width = 205
        Height = 17
        Caption = 'Incorpora Documentaci'#243'n'
        TabOrder = 1
      end
      object rbRevisionDDJJ: TRadioButton
        Left = 16
        Top = 76
        Width = 113
        Height = 17
        Caption = 'DDJJ PEP'
        TabOrder = 2
      end
      object rbRevisionNada: TRadioButton
        Left = 16
        Top = 104
        Width = 169
        Height = 17
        Caption = 'Nuevo Suceso del Firmante'
        TabOrder = 3
      end
    end
  end
  object ToolBar5: TToolBar
    Left = 855
    Top = 36
    Width = 151
    Height = 17
    Align = alNone
    Anchors = [akTop, akRight]
    ButtonHeight = 21
    Caption = 'ToolBar5'
    TabOrder = 8
    object lbRE: TLabel
      Left = 0
      Top = 0
      Width = 150
      Height = 21
      Align = alRight
      Caption = 'R'#201'GIMEN ESPECIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoModificarContratoSinSRT'
      end
      item
        Name = 'PermisoModificarCuit'
      end
      item
        Name = 'PermisoSuperUsuarioSinValidar'
      end
      item
        Name = 'PermisoModificarEndoso'
      end
      item
        Name = 'PermisoModificarDomicilio'
      end
      item
        Name = 'ModalidadCampa'#241'a'
      end
      item
        Name = 'PermisoModificarContratoRecepcionado'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 748
    Top = 4
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16457
        LinkControl = tblImprimir
      end
      item
        Key = 16467
        LinkControl = tblSalir
      end
      item
        Key = 16463
        LinkControl = tblNomina
      end
      item
        Key = 16453
        LinkControl = tblEstablecimiento
      end
      item
        Key = 16466
        LinkControl = tblSRT
      end
      item
        Key = 16449
        LinkControl = tbCartas
      end
      item
        Key = 16461
        LinkControl = tbCambiarCuit
      end
      item
        Key = 16469
        LinkControl = tbCuentasBancarias
      end
      item
        Key = 16467
        LinkControl = tbExtensionVigencia
      end
      item
        Key = 16465
        LinkControl = tbGestorAumento
      end>
    Left = 776
    Top = 4
  end
  object sdqNombresEmpresas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT AHM.HM_NOMBRE, AHM.HM_ID, AFO.FO_FORMULARIO, AHC.HC_CONTR' +
        'ATO, AHC.HC_VIGENCIADESDE, NVL(AHC.HC_FECHABAJA, '
      
        '       AHC.HC_VIGENCIAHASTA) AS VIGENCIAHASTA, EST.TB_DESCRIPCIO' +
        'N as ESTADO, BAJ.TB_DESCRIPCION'
      
        '  FROM AHC_HISTORICOCONTRATO AHC, AHM_HISTORICOEMPRESA AHM, CTB_' +
        'TABLAS EST, AFO_FORMULARIO AFO, CTB_TABLAS BAJ'
      ' WHERE HC_IDEMPRESA = HM_ID'
      ' AND HC_IDFORMULARIO = FO_ID'
      ' AND HC_ESTADO = EST.TB_CODIGO'
      ' AND EST.TB_CLAVE = '#39'AFEST'#39
      ' AND BAJ.TB_CODIGO (+) = HC_MOTIVOBAJA'
      ' AND BAJ.TB_CLAVE (+) = '#39'MOTIB'#39)
    Left = 40
    Top = 417
  end
  object dsNombresEmpresas: TDataSource
    DataSet = sdqNombresEmpresas
    Left = 68
    Top = 417
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 12
    Top = 445
  end
  object popupNominas: TPopupMenu
    Left = 12
    Top = 417
    object mnuNominaIndividual: TMenuItem
      Caption = 'N'#243'mina Individual'
      OnClick = mnuNominaIndividualClick
    end
    object mnuNominaMasiva: TMenuItem
      Caption = 'N'#243'mina Masiva'
      OnClick = mnuNominaMasivaClick
    end
  end
  object JvApplicationHotKey: TJvApplicationHotKey
    Active = True
    HotKey = 24689
    OnHotKey = JvApplicationHotKeyHotKey
    Left = 804
    Top = 4
  end
  object sdqDocumentacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDocumentacionAfterScroll
    SQL.Strings = (
      
        'SELECT DISTINCT hc_contratofirmado, hc_cotizacion, en_endoso, en' +
        '_fechaalta, en_id, en_movimiento, se_nombre'
      '           FROM art.ado_documentacion '
      
        '                JOIN art.adf_documentoafi ON df_id = do_iddocume' +
        'ntoafi'
      
        '                --JOIN aco_contrato ON co_idformulario = do_idfo' +
        'rmulario'
      '                JOIN aen_endoso ON en_id = do_idendoso'
      
        '                JOIN ahc_historicocontrato on hc_id = en_idhisto' +
        'ricocontrato'
      '                JOIN art.use_usuarios ON se_usuario = en_usualta'
      '          WHERE hc_contrato = :contrato'
      
        '               AND (en_motivo = 506 or en_motivo = 505 or en_mot' +
        'ivo= 0.01)'
      '       ORDER BY en_id')
    Left = 12
    Top = 473
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqDatosContacto: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosContactoAfterScroll
    SQL.Strings = (
      
        'SELECT carea.tb_descripcion area, cargo.tb_descripcion cargo, ct' +
        '_area, ct_areacarga, ct_cargo, ct_codareafax, ct_contacto,'
      
        '       ct_direlectronica, ct_idcaracterfirma, firma.cf_caracter,' +
        ' ct_fax, ct_fechabaja, ct_firmante, ct_id, ct_idempresa,'
      
        '       ct_numerodocumento, ct_remitentecarta, ct_tipodocumento, ' +
        'TRUNC(ct_fechaalta) fechaalta, TRUNC(ct_fechamodif) fechamodif,'
      
        '       DECODE(ct_firmante, '#39'S'#39', '#39'S'#237#39', '#39'No'#39') firmante, DECODE(ct_' +
        'remitentecarta, '#39'S'#39', '#39'Si'#39', '#39'No'#39') remitentecarta,'
      '       CASE'
      '         WHEN(ct_sexo = '#39'M'#39') THEN '#39'Masculino'#39
      '         WHEN(ct_sexo = '#39'F'#39') THEN '#39'Femenino'#39
      
        '       END sexo, tfirm.tb_descripcion tipofirma, art.afi.get_tel' +
        'efonos('#39'ATN_TELEFONOCONTACTO'#39', ct_id) telefonos,'
      
        '       tdoc.tb_descripcion tipodocumento, use1.se_nombre usualta' +
        ', use2.se_nombre usumodif, ct_sexo, ct_tipofirma,'
      '       sf_fecha AS ultproc,'
      '       sf_resultado AS resultado,'
      '       CASE'
      '         WHEN (SELECT MAX(pe_expuesta)'
      '                 FROM art.ape_personaexpuesta'
      
        '                WHERE pe_idrelapersonaexpuesta = sf_idrelaperson' +
        'aexpuesta) = '#39'S'#39' THEN '#39'Si'#39
      '         ELSE '#39'No'#39
      '       END espep'
      
        '  FROM aco_contrato JOIN act_contacto ON ct_idempresa = co_idemp' +
        'resa'
      '                                    AND (   ct_firmante = '#39'S'#39
      
        '                                         OR ct_tipofirma IS NOT ' +
        'NULL)'
      
        '       LEFT JOIN art.ctb_tablas cargo ON cargo.tb_codigo = ct_ca' +
        'rgo'
      '                                    AND cargo.tb_clave = '#39'CARGO'#39
      
        '       LEFT JOIN art.ctb_tablas carea ON carea.tb_codigo = ct_ar' +
        'ea'
      '                                    AND carea.tb_clave = '#39'CAREA'#39
      
        '       LEFT JOIN art.ctb_tablas tdoc ON tdoc.tb_codigo = ct_tipo' +
        'documento'
      '                                   AND tdoc.tb_clave = '#39'TDOC'#39
      
        '       LEFT JOIN art.use_usuarios use2 ON use2.se_usuario = ct_u' +
        'sumodif'
      
        '       LEFT JOIN art.acf_caracterfirma firma ON firma.cf_id = ct' +
        '_idcaracterfirma'
      
        '       LEFT JOIN art.ctb_tablas tfirm ON tfirm.tb_codigo = ct_ti' +
        'pofirma'
      '                                    AND tfirm.tb_clave = '#39'TFIRM'#39
      
        '       LEFT JOIN art.use_usuarios use1 ON use1.se_usuario = ct_u' +
        'sualta'
      '       LEFT JOIN art.asf_sucesofirmante a'
      
        '       ON a.sf_idformulario = co_idformulario and sf_idcontacto ' +
        '= ct_id'
      
        '     AND a.sf_id = pep.firmante.get_ult_suceso(co_contrato, a.sf' +
        '_idcontacto)'
      ' WHERE co_contrato = :co_contrato')
    Left = 68
    Top = 444
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CO_CONTRATO'
        ParamType = ptInput
      end>
  end
  object sdDatosContacto: TDataSource
    DataSet = sdqDatosContacto
    Left = 40
    Top = 444
  end
  object sdqSucesos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqSucesosAfterScroll
    Left = 808
    Top = 444
  end
  object sdPep: TDataSource
    DataSet = sdqSucesos
    Left = 836
    Top = 444
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 44
    Top = 472
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 72
    Top = 472
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 100
    Top = 472
  end
  object mnuRenovacionAutomatica: TPopupMenu
    Left = 374
    Top = 162
    object mnuImprimirRenovacionAutomatica: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirRenovacionAutomaticaClick
    end
    object mnuMailRenovacionAutomatica: TMenuItem
      Caption = 'Mail'
      OnClick = mnuMailRenovacionAutomaticaClick
    end
  end
  object sdspExposicion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'pep.controlpep.calculo_exposicion'
    Left = 94
    Top = 445
    ParamData = <
      item
        DataType = ftInteger
        Name = 'n_contrato'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_contacto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 's_es_pep'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftString
        Name = 's_exposicion'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'n_valor'
        ParamType = ptOutput
      end>
  end
end
