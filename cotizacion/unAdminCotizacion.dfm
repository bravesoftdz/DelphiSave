inherited frmAdminCotizacion: TfrmAdminCotizacion
  Left = 396
  Top = 106
  Caption = 'Administraci'#243'n de Cotizaciones'
  ClientHeight = 610
  ClientWidth = 840
  Constraints.MinHeight = 640
  Constraints.MinWidth = 848
  Font.Name = 'Tahoma'
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnMouseWheel = FSFormMouseWheel
  OnShow = FSFormShow
  ExplicitWidth = 848
  ExplicitHeight = 640
  DesignSize = (
    840
    610)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Top = 33
    Width = 840
    Height = 5
    ExplicitTop = 33
    ExplicitWidth = 840
    ExplicitHeight = 5
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 840
    Height = 33
    BandMaximize = bmDblClick
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        Width = 834
      end>
    ExplicitTop = 0
    ExplicitWidth = 840
    ExplicitHeight = 33
    inherited ToolBar: TToolBar
      Width = 827
      Height = 25
      Align = alClient
      ButtonWidth = 24
      Wrapable = False
      ExplicitWidth = 827
      ExplicitHeight = 25
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        ParentShowHint = False
        Visible = False
        ExplicitWidth = 24
      end
      inherited tbModificar: TToolButton
        Left = 24
        ImageIndex = 7
        ParentShowHint = False
        ExplicitLeft = 24
        ExplicitWidth = 24
      end
      inherited tbEliminar: TToolButton
        Left = 48
        Hint = 'Eliminar'
        ImageIndex = 8
        ParentShowHint = False
        Visible = False
        OnClick = btnAceptarClick
        ExplicitLeft = 48
        ExplicitWidth = 24
      end
      inherited ToolButton4: TToolButton
        Left = 72
        Width = 4
        Visible = False
        ExplicitLeft = 72
        ExplicitWidth = 4
      end
      inherited tbLimpiar: TToolButton
        Left = 76
        Hint = 'Limpiar'
        ImageIndex = 1
        ParentShowHint = False
        Visible = False
        ExplicitLeft = 76
        ExplicitWidth = 24
      end
      inherited ToolButton6: TToolButton
        Left = 100
        Width = 4
        Visible = False
        ExplicitLeft = 100
        ExplicitWidth = 4
      end
      inherited tbImprimir: TToolButton
        Left = 104
        ImageIndex = 4
        ParentShowHint = False
        OnClick = tbImprimirClick
        ExplicitLeft = 104
        ExplicitWidth = 24
      end
      inherited ToolButton11: TToolButton
        Left = 128
        Width = 4
        ExplicitLeft = 128
        ExplicitWidth = 4
      end
      inherited tbSalir: TToolButton
        Left = 132
        ImageIndex = 5
        ParentShowHint = False
        ExplicitLeft = 132
        ExplicitWidth = 24
      end
      object tbGrabar: TToolButton
        Left = 156
        Top = 0
        Hint = 'Grabar (Ctrl+G)'
        Caption = 'tbGrabar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAceptarClick
      end
      object tbSeparador: TToolButton
        Left = 180
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbAprobar: TToolButton
        Left = 188
        Top = 0
        Hint = 'Autorizar '
        Caption = 'tbAprobar'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        OnClick = tbAprobarClick
      end
      object tbRecuperarDatosCotizacionesAnteriores: TToolButton
        Left = 212
        Top = 0
        Hint = 'Recuperar Datos de Cotizaciones Anteriores'
        Caption = 'tbRecuperarDatosCotizacionesAnteriores'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = tbRecuperarDatosCotizacionesAnterioresClick
      end
      object lbHistorico: TLabel
        Left = 236
        Top = 0
        Width = 144
        Height = 22
        Align = alRight
        Alignment = taRightJustify
        Caption = '* Cotizaciones Anteriores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbClonacion: TLabel
        Left = 380
        Top = 0
        Width = 417
        Height = 22
        Align = alLeft
        Caption = 'Clonaci'#243'n correspondiente a la cotizaci'#243'n n'#186' 99999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 40
    Width = 837
    Height = 588
    UseDockManager = False
    ExplicitTop = 40
    ExplicitWidth = 837
    ExplicitHeight = 588
    DesignSize = (
      837
      588)
    object Label2: TLabel
      Left = 392
      Top = 54
      Width = 39
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Vigencia'
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 166
      Top = 6
      Width = 24
      Height = 13
      Caption = 'CUIT'
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 298
      Top = 6
      Width = 60
      Height = 13
      Caption = 'Raz'#243'n Social'
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 27
      Top = 30
      Width = 22
      Height = 13
      Caption = 'CIIU'
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 16
      Top = 78
      Width = 33
      Height = 13
      Caption = 'Solicit'#243
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 390
      Top = 30
      Width = 44
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Contacto'
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 705
      Top = 30
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tel'#233'fono'
      Layout = tlCenter
    end
    object Bevel2: TBevel
      Left = 0
      Top = 167
      Width = 833
      Height = 6
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label20: TLabel
      Left = 532
      Top = 54
      Width = 23
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nivel'
    end
    object Label1: TLabel
      Left = 0
      Top = 6
      Width = 49
      Height = 13
      Caption = 'Cotizaci'#243'n'
      Layout = tlCenter
    end
    object Label32: TLabel
      Left = 706
      Top = 126
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Trabajadores'
    end
    object Label33: TLabel
      Left = 706
      Top = 102
      Width = 62
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Masa Salarial'
    end
    object Label38: TLabel
      Left = 16
      Top = 54
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbHolding: TLabel
      Left = 390
      Top = 78
      Width = 35
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Holding'
    end
    object Label41: TLabel
      Left = 701
      Top = 54
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Apertura'
    end
    object Label46: TLabel
      Left = 595
      Top = 54
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Comisi'#243'n'
    end
    object Label47: TLabel
      Left = 8
      Top = 98
      Width = 87
      Height = 13
      Caption = 'Obs. de Comercial'
    end
    object Label66: TLabel
      Left = 706
      Top = 150
      Width = 55
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '# Establec.'
    end
    object cmbCO_FECHAVIGENCIA: TDateComboBox
      Left = 436
      Top = 50
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    inline fraCO_IDACTIVIDAD: TfraStaticActividad
      Left = 52
      Top = 26
      Width = 334
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 52
      ExplicitTop = 26
      ExplicitWidth = 334
      ExplicitHeight = 26
      DesignSize = (
        334
        26)
      inherited cmbDescripcion: TComboGrid
        Width = 270
        ExplicitWidth = 270
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
    object edCO_CUIT: TMaskEdit
      Left = 192
      Top = 2
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 2
      OnChange = edCO_CUITChange
    end
    object edCO_RAZONSOCIAL: TEdit
      Left = 365
      Top = 2
      Width = 469
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 60
      TabOrder = 3
    end
    object edCO_CONTACTO: TEdit
      Left = 436
      Top = 26
      Width = 253
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 5
    end
    object edCO_TELEFONO: TEdit
      Left = 758
      Top = 26
      Width = 76
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 6
    end
    inline fraCO_USUARIOSOLICITADO: TfraUsuarios
      Left = 52
      Top = 74
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      ExplicitLeft = 52
      ExplicitTop = 74
      ExplicitWidth = 334
      DesignSize = (
        334
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 107
        Width = 227
        ExplicitLeft = 107
        ExplicitWidth = 227
      end
      inherited edCodigo: TPatternEdit
        Width = 102
        ExplicitWidth = 102
      end
    end
    object PCCotizaciones: TPageControl
      Left = 0
      Top = 176
      Width = 837
      Height = 396
      ActivePage = tsSolicitud
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 21
      OnChange = PCCotizacionesChange
      object tsSolicitud: TTabSheet
        Caption = 'Solicitud'
        ImageIndex = 9
        object scrollSolicitud: TScrollBox
          Left = 0
          Top = 0
          Width = 829
          Height = 368
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            829
            368)
          object Label53: TLabel
            Left = 609
            Top = 115
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Total:'
          end
          object Label54: TLabel
            Left = 17
            Top = 48
            Width = 31
            Height = 13
            Caption = 'CIIU 1'
            Layout = tlCenter
          end
          object Label55: TLabel
            Left = 17
            Top = 70
            Width = 31
            Height = 13
            Caption = 'CIIU 2'
            Layout = tlCenter
          end
          object Label56: TLabel
            Left = 17
            Top = 92
            Width = 31
            Height = 13
            Caption = 'CIIU 3'
            Layout = tlCenter
          end
          object Label57: TLabel
            Left = 661
            Top = 27
            Width = 72
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'tbj x CIIU'
          end
          object Label60: TLabel
            Left = 3
            Top = 115
            Width = 44
            Height = 13
            Caption = 'Act. Real'
            Layout = tlCenter
          end
          object Label29: TLabel
            Left = 512
            Top = 5
            Width = 36
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Entidad'
          end
          object Label30: TLabel
            Left = 21
            Top = 4
            Width = 27
            Height = 13
            Caption = 'Canal'
          end
          object Label64: TLabel
            Left = 2
            Top = 26
            Width = 46
            Height = 13
            Caption = 'Vendedor'
          end
          object Label67: TLabel
            Left = 741
            Top = 27
            Width = 80
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Masa Salarial'
          end
          object GroupBox4: TGroupBox
            Left = 1
            Top = 130
            Width = 821
            Height = 39
            Anchors = [akLeft, akTop, akRight]
            Caption = 'ART Actual'
            TabOrder = 0
            DesignSize = (
              821
              39)
            object Label70: TLabel
              Left = 316
              Top = 17
              Width = 66
              Height = 13
              Caption = 'ART Anterior:'
            end
            inline fraSC_IDARTANTERIOR: TfraStaticCodigoDescripcion
              Left = 384
              Top = 12
              Width = 391
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 384
              ExplicitTop = 12
              ExplicitWidth = 391
              DesignSize = (
                391
                23)
              inherited cmbDescripcion: TComboGrid
                Left = 65
                Width = 328
                ExplicitLeft = 65
                ExplicitWidth = 328
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
            inline fraStatusSRT: TfraStaticCTB_TABLAS
              Left = 16
              Top = 12
              Width = 296
              Height = 23
              TabOrder = 1
              OnExit = fraStatusSRTExit
              ExplicitLeft = 16
              ExplicitTop = 12
              ExplicitWidth = 296
              DesignSize = (
                296
                23)
              inherited edCodigo: TPatternEdit
                Width = 49
                ExplicitWidth = 49
              end
              inherited cmbDescripcion: TComboGrid
                Left = 54
                Width = 232
                ExplicitLeft = 54
                ExplicitWidth = 232
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
            object btnHistorialVigencias: TBitBtn
              Left = 789
              Top = 12
              Width = 23
              Height = 23
              Hint = 'Ver Historial de Vigencias'
              Anchors = [akTop, akRight]
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FFFFFF000000
                000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF3630297E4014612E163D1F112417110E0E0E03030300
                0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42382BAA4A08
                DEA077E6B18AC37B4F99522A592E172418120E0E0E020303000000000000FFFF
                FFFFFFFFFFFFFFFFFFFF483C2CAD4E0EE5BB9CFFF4D8FFE7C6FFDBB2F1B789CA
                804D9E552842291B020303000000FFFFFFFFFFFFFFFFFFFFFFFF473D2EB45514
                E8C1A6FFECD4FFE3C4F2DCBFFFE1BDFFD186FBAD5D713917050506000000FFFF
                FFFFFFFFFFFFFFFFFFFF4E3F31B85C1BEDCDB6FFF3DBCCD7CC4EAECAFADBB1FF
                C25BF5B6795E341B010101000000000000FFFFFFFFFFFFFFFFFF564533BD611F
                F6D9C5D8E7DF4DB0CD3DACD1BABDA7919175D49A627B400F0B05000000000000
                00000000000000FFFFFF614B36C36725F8E5D773C4DCBCD7D6A7D0D477BACAA8
                9B82EAB680FAC993C57F3B773B03201102000000000000000000685139C76D2C
                F6EAE3F7F6EEFFF6E4D7E2D974BFD1FFEBCAE2AA76C6864DF3C696F8C692BA91
                633435660B0B2800000072573CCE7738F9F2F0FFFDF7FFF6EBFCF2E395CAD4F6
                EEDDEAB8915A2804432101C4772EA697943059D1041392000000816044CF7C42
                FCFBFBFFFFFFFFF8F2FFF9ECA8D3DCCCE2E0F4BD934929150000000000007759
                3B121F92000280FFFFFF896748CF7E47FAF8FAFFFFFFFFFFFFFFFFFED4EAECC3
                E5E8F0B68A462911000000000000FFFFFFFFFFFFFFFFFFFFFFFF9B7954CA6410
                C3713BD19468DCB397E8CEC1F7E9E0FFFEFBE9BA93462910000000000000FFFF
                FFFFFFFFFFFFFFFFFFFFA7916FE4892ED16706CA5B00C45300BF5100C05D10C8
                7B48CC78394A2E16000000000000FFFFFFFFFFFFFFFFFFFFFFFF4B4944837C65
                988463AE8E61BC8E53CB8D45D28330D77310D66B044C351F000000000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A514F2D3338464D4B6163586E
                6753897553433D34000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnHistorialVigenciasClick
            end
          end
          object GroupBox2: TGroupBox
            Left = 2
            Top = 169
            Width = 416
            Height = 39
            Caption = ' Status BCRA '
            TabOrder = 1
            DesignSize = (
              416
              39)
            inline fraStatusBCRA: TfraStaticCTB_TABLAS
              Left = 16
              Top = 12
              Width = 392
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 16
              ExplicitTop = 12
              ExplicitWidth = 392
              DesignSize = (
                392
                23)
              inherited edCodigo: TPatternEdit
                Width = 49
                ExplicitWidth = 49
              end
              inherited cmbDescripcion: TComboGrid
                Left = 54
                Width = 328
                ExplicitLeft = 54
                ExplicitWidth = 328
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
          object edfpSC_CANTTRABAJADOR: TIntEdit
            Left = 661
            Top = 110
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 2
            Alignment = taRightJustify
            MaxLength = 9
          end
          inline frafpSC_IDACTIVIDAD: TfraStaticActividad
            Left = 49
            Top = 43
            Width = 591
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            ExplicitLeft = 49
            ExplicitTop = 43
            ExplicitWidth = 591
            ExplicitHeight = 26
            DesignSize = (
              591
              26)
            inherited cmbDescripcion: TComboGrid
              Width = 528
              ExplicitWidth = 528
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
          inline frafpSC_IDACTIVIDAD2: TfraStaticActividad
            Left = 49
            Top = 65
            Width = 591
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            ExplicitLeft = 49
            ExplicitTop = 65
            ExplicitWidth = 591
            ExplicitHeight = 26
            DesignSize = (
              591
              26)
            inherited cmbDescripcion: TComboGrid
              Width = 528
              ExplicitWidth = 528
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
          inline frafpSC_IDACTIVIDAD3: TfraStaticActividad
            Left = 49
            Top = 87
            Width = 591
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            ExplicitLeft = 49
            ExplicitTop = 87
            ExplicitWidth = 591
            ExplicitHeight = 26
            DesignSize = (
              591
              26)
            inherited cmbDescripcion: TComboGrid
              Width = 528
              ExplicitWidth = 528
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
          object edfpSC_CANTTRABAJADOR1: TIntEdit
            Left = 661
            Top = 44
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 6
            OnChange = CalcularTrabajadores
            Alignment = taRightJustify
            MaxLength = 9
          end
          object edfpSC_CANTTRABAJADOR2: TIntEdit
            Left = 661
            Top = 66
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 7
            OnChange = CalcularTrabajadores
            Alignment = taRightJustify
            MaxLength = 9
          end
          object edfpSC_CANTTRABAJADOR3: TIntEdit
            Left = 661
            Top = 88
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 8
            OnChange = CalcularTrabajadores
            Alignment = taRightJustify
            MaxLength = 9
          end
          object edfpSC_ACTIVIDADREAL: TEdit
            Left = 50
            Top = 110
            Width = 535
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 200
            TabOrder = 9
          end
          inline frafpSC_ENTIDAD: TfraEntidades
            Left = 553
            Top = 0
            Width = 272
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 10
            ExplicitLeft = 553
            ExplicitWidth = 272
            DesignSize = (
              272
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 207
              ExplicitWidth = 207
            end
          end
          inline frafpSC_CANAL: TfraCanal
            Left = 49
            Top = -1
            Width = 439
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 11
            ExplicitLeft = 49
            ExplicitTop = -1
            ExplicitWidth = 439
            DesignSize = (
              439
              23)
            inherited cmbDescripcion: TComboGrid
              Width = 376
              ExplicitWidth = 376
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
          inline frafpSC_VENDEDOR: TfraVendedores
            Left = 49
            Top = 21
            Width = 439
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 12
            ExplicitLeft = 49
            ExplicitTop = 21
            ExplicitWidth = 439
            DesignSize = (
              439
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 63
              Width = 376
              ExplicitLeft = 63
              ExplicitWidth = 376
            end
          end
          object GroupBox3: TGroupBox
            Left = 2
            Top = 208
            Width = 416
            Height = 88
            Caption = 'Datos de tarifa - ART Actual'
            TabOrder = 13
            object Label19: TLabel
              Left = 12
              Top = 28
              Width = 165
              Height = 13
              Alignment = taRightJustify
              Caption = 'Resultado Mensual por Trabajador'
            end
            object Label24: TLabel
              Left = 225
              Top = 28
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Suma Fija'
            end
            object Label26: TLabel
              Left = 341
              Top = 28
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'Variable'
            end
            object edPorcVariable: TCurrencyEdit
              Left = 312
              Top = 48
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = '% ,0.000;% -,0.000'
              MaxLength = 12
              ReadOnly = True
              TabOrder = 0
            end
            object edSumaFija: TCurrencyEdit
              Left = 200
              Top = 48
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              MaxLength = 12
              ReadOnly = True
              TabOrder = 1
            end
            object edResultadoMensualTrabajador: TCurrencyEdit
              Left = 46
              Top = 48
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              MaxLength = 12
              ReadOnly = True
              TabOrder = 2
            end
          end
          object edfpSC_MASASALARIAL: TCurrencyEdit
            Left = 741
            Top = 110
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Anchors = [akTop, akRight]
            MaxLength = 12
            TabOrder = 14
            ZeroEmpty = False
          end
          object GroupBox1: TGroupBox
            Left = 424
            Top = 170
            Width = 399
            Height = 88
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Motivo de Ampliaci'#243'n'
            TabOrder = 15
            DesignSize = (
              399
              88)
            object Label51: TLabel
              Left = 104
              Top = 10
              Width = 54
              Height = 13
              Caption = 'Descripci'#243'n'
            end
            object Label68: TLabel
              Left = 13
              Top = 12
              Width = 30
              Height = 13
              Caption = 'Desde'
            end
            object Label69: TLabel
              Left = 13
              Top = 50
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object edSC_MOTIVOSUSPENSION: TMemo
              Left = 104
              Top = 27
              Width = 289
              Height = 58
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object edSC_FECHASUSPDESDE: TDateComboBox
              Left = 12
              Top = 28
              Width = 89
              Height = 21
              TabOrder = 0
            end
            object edSC_FECHASUSPHASTA: TDateComboBox
              Left = 12
              Top = 64
              Width = 89
              Height = 21
              TabOrder = 1
            end
          end
          object edMasaSalarial1: TCurrencyEdit
            Left = 741
            Top = 44
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Anchors = [akTop, akRight]
            MaxLength = 12
            TabOrder = 17
            ZeroEmpty = False
          end
          object edMasaSalarial2: TCurrencyEdit
            Left = 741
            Top = 66
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Anchors = [akTop, akRight]
            MaxLength = 12
            TabOrder = 18
            ZeroEmpty = False
          end
          object edMasaSalarial3: TCurrencyEdit
            Left = 741
            Top = 88
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Anchors = [akTop, akRight]
            MaxLength = 12
            TabOrder = 19
            ZeroEmpty = False
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 296
            Width = 92
            Height = 44
            Caption = ' Edad Promedio '
            TabOrder = 20
            object edSC_EDADPROMEDIO: TCurrencyEdit
              Left = 10
              Top = 16
              Width = 72
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0;0'
              MaxValue = 100.000000000000000000
              TabOrder = 0
            end
          end
          object GroupBox9: TGroupBox
            Left = 228
            Top = 296
            Width = 264
            Height = 44
            Caption = ' Zona Geogr'#225'fica '
            TabOrder = 23
            DesignSize = (
              264
              44)
            inline fraZonaGeografica: TfraCodDesc
              Left = 12
              Top = 16
              Width = 238
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 12
              ExplicitTop = 16
              ExplicitWidth = 238
              DesignSize = (
                238
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 51
                Top = 0
                Width = 188
                ExplicitLeft = 51
                ExplicitTop = 0
                ExplicitWidth = 188
              end
              inherited edCodigo: TPatternEdit
                Left = 0
                Top = 0
                Width = 48
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 48
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                ExtraFields = ', ZG_IDPROVINCIA '
                FieldBaja = 'ZG_FECHABAJA'
                FieldCodigo = 'ZG_ID'
                FieldDesc = 'ZG_DESCRIPCION'
                FieldID = 'ZG_ID'
                IdType = ctInteger
                TableName = 'AFI.AZG_ZONASGEOGRAFICAS'
              end
            end
          end
          object GroupBox10: TGroupBox
            Left = 496
            Top = 296
            Width = 327
            Height = 44
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Sector '
            TabOrder = 24
            DesignSize = (
              327
              44)
            inline fraSector: TfraCtbTablas
              Left = 8
              Top = 16
              Width = 311
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 8
              ExplicitTop = 16
              ExplicitWidth = 311
              ExplicitHeight = 24
              DesignSize = (
                311
                24)
              inherited cmbDescripcion: TArtComboBox
                Left = 51
                Top = 0
                Width = 258
                ExplicitLeft = 51
                ExplicitTop = 0
                ExplicitWidth = 258
              end
              inherited edCodigo: TPatternEdit
                Left = 0
                Top = 0
                ExplicitLeft = 0
                ExplicitTop = 0
              end
            end
          end
          object GroupBox12: TGroupBox
            Left = 96
            Top = 296
            Width = 60
            Height = 44
            Caption = 'Establec.'
            TabOrder = 21
            object edSC_ESTABLECIMIENTOS: TCurrencyEdit
              Left = 10
              Top = 16
              Width = 40
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0;0'
              MaxValue = 100.000000000000000000
              TabOrder = 0
            end
          end
          object GroupBox13: TGroupBox
            Left = 160
            Top = 296
            Width = 64
            Height = 44
            Caption = 'Per'#237'odo'
            TabOrder = 22
            object edPeriodo: TPeriodoPicker
              Left = 8
              Top = 15
              Width = 49
              Height = 21
              TabOrder = 0
              Color = clWindow
              Periodo.AllowNull = True
              Periodo.Orden = poAnoMes
              Periodo.Separador = #0
              Periodo.Mes = 0
              Periodo.Ano = 0
              Periodo.MaxPeriodo = '205507'
              Periodo.MinPeriodo = '199606'
              WidthMes = 19
              Separation = 0
              ShowButton = False
              ShowOrder = poAnoMes
              ReadOnly = False
              Enabled = True
              Fuente.Charset = DEFAULT_CHARSET
              Fuente.Color = clWindowText
              Fuente.Height = -11
              Fuente.Name = 'MS Sans Serif'
              Fuente.Style = []
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              NullDropDown = SetMax
              AutoExit = True
            end
          end
          object GroupBox15: TGroupBox
            Left = 424
            Top = 258
            Width = 399
            Height = 40
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Motivo Clonaci'#243'n '
            TabOrder = 16
            DesignSize = (
              399
              40)
            object edMotivoClonacion: TEdit
              Left = 12
              Top = 14
              Width = 379
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
          end
        end
      end
      object tsSRT: TTabSheet
        Caption = 'SRT'
        ImageIndex = 7
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tsSRTLiteral: TTabSheet
        Caption = 'SRT Literal'
        ImageIndex = -1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tsDatos: TTabSheet
        Caption = 'Datos'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GridDatos: TStaticGrid
          Left = 0
          Top = 27
          Width = 829
          Height = 341
          Align = alClient
          ColCount = 22
          DefaultColWidth = 130
          DefaultRowHeight = 16
          RowCount = 23
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goTabs]
          TabOrder = 0
          OnKeyDown = GridDatosKeyDown
          OnKeyPress = KeyPressGrilla
          OnSetEditText = GridDatosSetEditText
          OnGetCellParams = GridDatosGetCellParams
          ColWidths = (
            160
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54
            54)
          RowHeights = (
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16)
          Cells = (
            ''
            '1996'
            '1997'
            '1998'
            '1999'
            '2000'
            '2001'
            '2002'
            '2003'
            '2004'
            '2005'
            '2006'
            '2007'
            '2008'
            '2009'
            '2010'
            '2011'
            '2012'
            '2013'
            '2014'
            '2015'
            'Total'
            'Per'#237'odos Cubiertos'
            '1'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Promedio de trabajadores'
            '2'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Cantidad de Siniestros'
            '3'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros sin baja'
            '4'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros con baja'
            '5'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros Mortales'
            '6'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Mortales in Itinere'
            '7'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Accidentes de Trabajo'
            '8'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros In Itinere'
            '9'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros Sin Tipo'
            '10'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'AT y EP con baja (no incluye acc. in itinere ni reagravaciones)'
            '11'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Acc. de Trabajo con baja'
            '12'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Enfer. Profesionales con baja'
            '13'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros Con Incapacidad'
            '14'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'IPP Menores al 50%'
            '15'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'IPP entre 50% y 66%'
            '16'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'IP Totales'
            '17'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Siniestros Sin Porcentaje'
            '18'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'D'#237'as ILT Total'
            '19'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'D'#237'as ILT a cargo del empleador'
            '20'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'D'#237'as ILT a cargo de ART'
            '21'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            #205'ndice de Incidencia'
            '22')
        end
        object tlbDatos: TToolBar
          Left = 0
          Top = 0
          Width = 829
          Height = 27
          BorderWidth = 1
          ButtonWidth = 24
          Caption = 'ToolBar'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Wrapable = False
          object tbPegarDatosSRT: TToolButton
            Left = 0
            Top = 0
            Hint = 'Pegar Datos SRT'
            ImageIndex = 13
            ParentShowHint = False
            ShowHint = True
            OnClick = tbPegarDatosSRTClick
          end
          object tbObtenerDatosSRT: TToolButton
            Left = 24
            Top = 0
            Hint = 'Obtener Datos desde la  SRT'
            Caption = 'tbDescargarDatosSRT'
            ImageIndex = 17
            ParentShowHint = False
            ShowHint = True
            OnClick = tbObtenerDatosSRTClick
          end
          object ToolButton2: TToolButton
            Left = 48
            Top = 0
            Width = 4
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbLimpiarDatosSRT: TToolButton
            Left = 52
            Top = 0
            Hint = 'Limpiar (Ctrl+L)'
            ImageIndex = 1
            ParentShowHint = False
            ShowHint = True
            OnClick = tbLimpiarDatosSRTClick
          end
        end
      end
      object TSDetalleILP: TTabSheet
        Caption = 'Detalle ILP/Mortales'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          829
          368)
        object GridDetalleILP: TStaticGrid
          Left = 0
          Top = 82
          Width = 829
          Height = 286
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 7
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 0
          OnGetCellParams = GridDetalleILPGetCellParams
          ColWidths = (
            33
            76
            35
            64
            64
            64
            95)
          RowHeights = (
            16
            16)
          Cells = (
            'Sexo'
            'Fecha Nac.'
            'Edad'
            'A'#241'o'
            'Porcentaje'
            'Mortales'
            'Fecha Accidente')
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 55
          Width = 735
          Height = 27
          Align = alNone
          BorderWidth = 1
          ButtonWidth = 24
          Caption = 'ToolBar'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Wrapable = False
          object tbNuevoDetalle: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nuevo (Ctrl+U)'
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            OnClick = NuevoDetalle
          end
          object tbEliminarDetalle: TToolButton
            Left = 24
            Top = 0
            Hint = 'Eliminar (Ctrl+D)'
            ImageIndex = 8
            ParentShowHint = False
            ShowHint = True
            OnClick = EliminarDetalle
          end
          object tbSeparador1: TToolButton
            Left = 48
            Top = 0
            Width = 8
            Caption = 'tbSeparador1'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object tbRecuperarDatosCotizacionesAnteriores2: TToolButton
            Left = 56
            Top = 0
            Hint = 'Recuperar Datos de Cotizaciones Anteriores'
            Caption = 'tbRecuperarDatosCotizacionesAnteriores'
            ImageIndex = 19
            ParentShowHint = False
            ShowHint = True
            OnClick = tbRecuperarDatosCotizacionesAnteriores2Click
          end
          object ToolButton5: TToolButton
            Left = 80
            Top = 0
            Width = 4
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbLimpiarDetalle: TToolButton
            Left = 84
            Top = 0
            Hint = 'Limpiar (Ctrl+E)'
            ImageIndex = 1
            ParentShowHint = False
            ShowHint = True
            OnClick = LimpiarDetalle
          end
        end
        object gbDetalleILP: TGroupBox
          Left = 0
          Top = -5
          Width = 829
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          object Label49: TLabel
            Left = 149
            Top = 14
            Width = 79
            Height = 13
            Caption = 'Fecha Accidente'
          end
          object Label25: TLabel
            Left = 335
            Top = 14
            Width = 19
            Height = 13
            Caption = 'A'#241'o'
          end
          object Label22: TLabel
            Left = 143
            Top = 38
            Width = 84
            Height = 13
            Caption = 'Fecha Nacimiento'
          end
          object Label23: TLabel
            Left = 329
            Top = 38
            Width = 24
            Height = 13
            Caption = 'Edad'
          end
          object Label18: TLabel
            Left = 3
            Top = 14
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label27: TLabel
            Left = 409
            Top = 14
            Width = 25
            Height = 13
            Caption = 'Porc.'
          end
          object Label43: TLabel
            Left = 499
            Top = 14
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object Label45: TLabel
            Left = 652
            Top = 14
            Width = 59
            Height = 13
            Caption = 'Multiplicador'
          end
          object cmbDI_FECHAACCIDENTE: TDateComboBox
            Left = 234
            Top = 10
            Width = 88
            Height = 21
            MinDateCombo = cmbDI_FECHANAC
            OnValidate = cmbDI_FECHANACValidate
            TabOrder = 1
            OnAcceptDate = cmbDI_FECHANACAcceptDate
            OnExit = cmbDI_FECHANACExit
          end
          object edDI_ANIO: TIntEdit
            Left = 358
            Top = 10
            Width = 41
            Height = 21
            TabOrder = 2
            Text = '1996'
            MaxLength = 0
            MaxValue = 2010
            MinValue = 1990
            Value = 1996
          end
          object cmbDI_FECHANAC: TDateComboBox
            Left = 234
            Top = 34
            Width = 88
            Height = 21
            MaxDateCombo = cmbDI_FECHAACCIDENTE
            OnValidate = cmbDI_FECHANACValidate
            TabOrder = 3
            OnAcceptDate = cmbDI_FECHANACAcceptDate
            OnExit = cmbDI_FECHANACExit
          end
          object edDI_EDAD: TCardinalEdit
            Left = 358
            Top = 34
            Width = 41
            Height = 21
            TabOrder = 4
            OnExit = edDI_EDADExit
          end
          object cmbDI_SEXO: TComboBox
            Left = 30
            Top = 10
            Width = 110
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            Items.Strings = (
              'Masculino'
              'Femenino')
          end
          object edDI_PORCENTAJE: TCurrencyEdit
            Left = 436
            Top = 10
            Width = 57
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '% ,0.00'
            TabOrder = 5
            OnExit = edDI_PORCENTAJEExit
          end
          object cmbDI_MUERTE: TComboBox
            Left = 535
            Top = 10
            Width = 110
            Height = 21
            Style = csDropDownList
            TabOrder = 6
            Items.Strings = (
              'Incapacidad'
              'Mortal'
              'Mortal In Itinere')
          end
          object edMultiplicador: TIntEdit
            Left = 714
            Top = 10
            Width = 31
            Height = 21
            TabOrder = 7
            Text = '1'
            Value = 1
          end
        end
      end
      object tsCostos: TTabSheet
        Caption = 'Costos'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          829
          368)
        object Label28: TLabel
          Left = 9
          Top = 7
          Width = 64
          Height = 13
          Caption = 'Costo M'#233'dico'
        end
        object GridCosto: TStaticGrid
          Left = 1
          Top = 30
          Width = 828
          Height = 332
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 12
          DefaultColWidth = 175
          DefaultRowHeight = 16
          RowCount = 21
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goTabs]
          TabOrder = 0
          OnKeyPress = KeyPressGrilla
          OnGetCellParams = GridCostoGetCellParams
          OnGetCellDisplayText = GridCostoGetCellDisplayText
          ColWidths = (
            175
            55
            55
            55
            55
            55
            55
            55
            55
            55
            55
            80)
          RowHeights = (
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16
            16)
          Cells = (
            ''
            '1996'
            '1997'
            '1998'
            '1999'
            '2000'
            '2001'
            '2002'
            '2003'
            '2004'
            '2005'
            'Total'
            'D'#237'as Prom. por siniestro c/baja'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Dias ART prom. por siniestro c/baja'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Costo M'#233'dico Total'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Costo M'#233'dico por persona'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILT'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILT por persona'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILP < 50% '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILP < 50% p/persona '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILP 50% y 66% '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILP 50% y 66%  p/persona '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILP > 66% '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'ILP > 66% p/persona '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Mortales'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Mortales p/persona'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Reserva IBNR-IBNER'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Reserva IBNR-IBNER p/persona'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Gastos Admin. (40%)'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Gastos Admin. (40%) p/persona'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Total '
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Total p/persona')
        end
        object edCO_COSTOMEDICO: TCurrencyEdit
          Left = 79
          Top = 3
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object GridEvolucionAnual: TStaticGrid
          Left = 1
          Top = 310
          Width = 829
          Height = 56
          Anchors = [akLeft, akRight, akBottom]
          ColCount = 12
          DefaultColWidth = 60
          DefaultRowHeight = 16
          RowCount = 2
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goTabs]
          TabOrder = 2
          Visible = False
          OnKeyPress = KeyPressGrilla
          OnGetCellDisplayText = GridEvolucionAnualGetCellDisplayText
          ColWidths = (
            180
            60
            60
            60
            60
            60
            60
            60
            60
            60
            60
            60)
          RowHeights = (
            16
            16)
          Cells = (
            'Tasa de Incidencia'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            'Tarifa a Cobrar s/siniestralidad (SRT)')
        end
      end
      object tsCostoCartera: TTabSheet
        Caption = 'Precio Cartera'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          829
          368)
        object Label10: TLabel
          Left = 2
          Top = 200
          Width = 114
          Height = 13
          Caption = 'Tarifarios Competencia:'
          Visible = False
        end
        object Label11: TLabel
          Left = 4
          Top = 0
          Width = 84
          Height = 13
          Caption = 'Precio de Cartera'
        end
        object Label42: TLabel
          Left = 4
          Top = 144
          Width = 53
          Height = 13
          Caption = 'ART Actual'
        end
        object lblDatosPrecioCartera: TLabel
          Left = 96
          Top = 0
          Width = 75
          Height = 13
          Caption = 'NO HAY DATOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblDatosPrecioCompetencia: TLabel
          Left = 116
          Top = 200
          Width = 75
          Height = 13
          Caption = 'NO HAY DATOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object GridCostoCartera1: TStaticGrid
          Left = 0
          Top = 13
          Width = 579
          Height = 124
          Anchors = [akLeft, akTop, akRight]
          ColCount = 6
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 0
          OnGetCellParams = AlinearGrilla
          OnGetCellDisplayText = GridCostoCartera1GetCellDisplayText
          ColWidths = (
            200
            58
            46
            64
            69
            54)
          RowHeights = (
            16
            16
            16
            16
            16)
          Cells = (
            'Raz'#243'n Social'
            '$'
            '%'
            'Salario'
            'Trabajadores'
            'Precio')
        end
        object GridCostoCartera2: TStaticGrid
          Left = 0
          Top = 215
          Width = 829
          Height = 153
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 6
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 1
          Visible = False
          OnGetCellParams = AlinearGrilla
          OnGetCellDisplayText = GridCostoCartera2GetCellDisplayText
          ColWidths = (
            200
            64
            64
            64
            70
            64)
          RowHeights = (
            16
            16
            16)
          Cells = (
            'Aseguradora Riesgo de Trabajo'
            '$'
            '%'
            'Salario'
            'Trabajadores'
            'Precio')
        end
        object gbCartera: TGroupBox
          Left = 598
          Top = 1
          Width = 205
          Height = 147
          Anchors = [akTop, akRight]
          Caption = 'Rango de Empresas en Cartera'
          TabOrder = 2
          object Label36: TLabel
            Left = 20
            Top = 46
            Width = 46
            Height = 13
            Caption = 'Empresas'
          end
          object Label37: TLabel
            Left = 5
            Top = 72
            Width = 59
            Height = 13
            Caption = 'Precio Lineal'
          end
          object Label35: TLabel
            Left = 119
            Top = 20
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object Label34: TLabel
            Left = 6
            Top = 20
            Width = 59
            Height = 13
            Caption = 'Empl. Desde'
          end
          object Label44: TLabel
            Left = 6
            Top = 98
            Width = 60
            Height = 13
            Caption = 'Precio Pond.'
          end
          object btnActualizarRango: TButton
            Left = 71
            Top = 119
            Width = 75
            Height = 25
            Caption = 'Actualizar'
            TabOrder = 5
            OnClick = btnActualizarRangoClick
          end
          object edCO_CARTERAPROMEDIO: TCurrencyEdit
            Left = 69
            Top = 68
            Width = 100
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            TabOrder = 3
          end
          object edCO_CANTEMPRESAS: TIntEdit
            Left = 69
            Top = 42
            Width = 100
            Height = 21
            TabOrder = 2
            Text = '0'
            MaxLength = 10
            MaxValue = 999999
          end
          object edCO_CANTEMPLHASTA: TIntEdit
            Left = 150
            Top = 16
            Width = 45
            Height = 21
            TabOrder = 1
            Text = '999999'
            MaxLength = 10
            MaxValue = 999999
            Value = 999999
          end
          object edCO_CANTEMPLDESDE: TIntEdit
            Left = 69
            Top = 16
            Width = 45
            Height = 21
            TabOrder = 0
            Text = '1'
            MaxLength = 10
            MaxValue = 999999
            Value = 1
          end
          object edCO_CARTERAPROMEDIOPOND: TCurrencyEdit
            Left = 69
            Top = 94
            Width = 100
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            TabOrder = 4
          end
        end
        object GridCostoCartera3: TStaticGrid
          Left = 0
          Top = 157
          Width = 785
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          ColCount = 7
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 3
          OnGetCellParams = GridCostoCartera3GetCellParams
          OnGetCellDisplayText = GridCostoCartera3GetCellDisplayText
          ColWidths = (
            200
            64
            64
            64
            70
            64
            169)
          RowHeights = (
            16
            16)
          Cells = (
            'Aseguradora Riesgo de Trabajo'
            '$'
            '%'
            'Salario'
            'Trabajadores'
            'Precio'
            'Observaciones')
        end
      end
      object TsFidelitas: TTabSheet
        Caption = 'Situaci'#243'n Financiera'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          829
          368)
        object Bevel5: TBevel
          Left = -9
          Top = 82
          Width = 838
          Height = 6
          Anchors = [akLeft, akTop, akRight]
          Shape = bsBottomLine
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 42
          Width = 825
          Height = 40
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Estado'
          TabOrder = 0
          DesignSize = (
            825
            40)
          inline fraCO_IDFIDELITAS: TfraStaticCTB_TABLAS
            Left = 8
            Top = 13
            Width = 810
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 13
            ExplicitWidth = 810
            DesignSize = (
              810
              23)
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Width = 740
              ExplicitLeft = 64
              ExplicitWidth = 740
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
        object tlbFidelitas: TToolBar
          Left = 0
          Top = 91
          Width = 807
          Height = 27
          Align = alNone
          Anchors = [akLeft, akTop, akRight]
          BorderWidth = 1
          ButtonWidth = 24
          Caption = 'ToolBar'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Wrapable = False
          object tbObtenerFidelitas: TToolButton
            Left = 0
            Top = 0
            Hint = 'Obtener Fidelitas (Ctrl+O)'
            ImageIndex = 13
            ParentShowHint = False
            ShowHint = True
            OnClick = tbObtenerFidelitasClick
          end
          object ToolButton9: TToolButton
            Left = 24
            Top = 0
            Width = 4
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbLimpiarFidelitas: TToolButton
            Left = 28
            Top = 0
            Hint = 'Limpiar (Ctrl+L)'
            ImageIndex = 1
            ParentShowHint = False
            ShowHint = True
            OnClick = tbLimpiarFidelitasClick
          end
        end
        object edCO_TEXTOFIDELITAS: TRxRichEdit
          Left = 1
          Top = 118
          Width = 824
          Height = 249
          DrawEndPage = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PlainText = True
          ScrollBars = ssVertical
          StreamFormat = sfPlainText
          TabOrder = 2
          UndoLimit = 1
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 825
          Height = 40
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Status BCRA '
          TabOrder = 1
          DesignSize = (
            825
            40)
          object lbStatusBCRALink: TLabel
            Left = 8
            Top = 0
            Width = 67
            Height = 13
            Cursor = crHandPoint
            Caption = ' Status BCRA '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = lbStatusBCRALinkClick
          end
          inline fraStatusBCRA2: TfraStaticCTB_TABLAS
            Left = 8
            Top = 13
            Width = 810
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 13
            ExplicitWidth = 810
            DesignSize = (
              810
              23)
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Width = 740
              ExplicitLeft = 64
              ExplicitWidth = 740
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
      end
      object tsClausulas: TTabSheet
        Caption = 'Cl'#225'usulas Adicionales'
        ImageIndex = 6
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          829
          368)
        object Label31: TLabel
          Left = 4
          Top = 54
          Width = 28
          Height = 13
          Caption = 'Texto'
        end
        object edCO_CLAUSULASADICIONALES: TMemo
          Left = 1
          Top = 69
          Width = 832
          Height = 289
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 4000
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 834
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Tipo de Cl'#225'usula'
          TabOrder = 1
          DesignSize = (
            834
            41)
          inline fraCO_IDCLAUSULA: TfraStaticCodigoDescripcion
            Left = 5
            Top = 13
            Width = 825
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 13
            ExplicitWidth = 825
            DesignSize = (
              825
              23)
            inherited cmbDescripcion: TComboGrid
              Width = 774
              ExplicitWidth = 774
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
      object tsFinal: TTabSheet
        Caption = 'Cotizaci'#243'n'
        ImageIndex = 3
        DesignSize = (
          829
          368)
        object Label21: TLabel
          Left = 8
          Top = 96
          Width = 92
          Height = 13
          Caption = 'Hist'#243'rico de Tarifas'
        end
        object Label40: TLabel
          Left = 384
          Top = 258
          Width = 122
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Observaciones Generales'
        end
        object Label12: TLabel
          Left = 384
          Top = 96
          Width = 171
          Height = 13
          Caption = 'Observaciones para Area Comercial'
        end
        object gbConfecciono: TGroupBox
          Left = 4
          Top = 0
          Width = 368
          Height = 44
          Caption = ' Confeccion'#243' '
          TabOrder = 0
          DesignSize = (
            368
            44)
          object Label16: TLabel
            Left = 96
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object cmbCO_FECHACONFECCIONO: TDateComboBox
            Left = 4
            Top = 16
            Width = 88
            Height = 21
            TabOrder = 0
          end
          inline fraCO_USUARIOCONFECCIONO: TfraUsuarios
            Left = 136
            Top = 16
            Width = 230
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 136
            ExplicitTop = 16
            ExplicitWidth = 230
            DesignSize = (
              230
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 63
              Width = 166
              ExplicitLeft = 63
              ExplicitWidth = 166
            end
            inherited edCodigo: TPatternEdit
              Width = 60
              ExplicitWidth = 60
            end
          end
        end
        object gbTecnica: TGroupBox
          Left = 384
          Top = 0
          Width = 442
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Autoriz'#243' '
          TabOrder = 2
          DesignSize = (
            442
            44)
          object Label17: TLabel
            Left = 96
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object cmbTC_FECHATECNICA: TDateComboBox
            Left = 4
            Top = 16
            Width = 88
            Height = 21
            TabOrder = 0
          end
          object edTC_USUTECNICA: TEdit
            Left = 136
            Top = 16
            Width = 298
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
        object GridHistorico: TDBGrid
          Left = 4
          Top = 110
          Width = 368
          Height = 257
          Anchors = [akLeft, akTop, akBottom]
          DataSource = dsConsulta
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TC_FECHAALTA'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TC_SUMAFIJA'
              Title.Caption = 'Costo Fijo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TC_PORCVARIABLE'
              Title.Caption = 'Costo Var.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TC_COSTOFINAL'
              Title.Caption = 'Costo Final'
              Visible = True
            end>
        end
        object edCO_OBSERVACIONES: TMemo
          Left = 384
          Top = 274
          Width = 442
          Height = 92
          Anchors = [akLeft, akRight, akBottom]
          MaxLength = 2048
          ScrollBars = ssVertical
          TabOrder = 6
        end
        object gbCierreCotizacion: TGroupBox
          Left = 384
          Top = 48
          Width = 442
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Notific'#243' Cotizaci'#243'n '
          TabOrder = 3
          DesignSize = (
            442
            44)
          object Label39: TLabel
            Left = 96
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object cmbCO_FECHACERRADO: TDateComboBox
            Left = 4
            Top = 16
            Width = 88
            Height = 21
            TabOrder = 0
          end
          inline fraCO_USUCERRADO: TfraUsuarios
            Left = 136
            Top = 16
            Width = 298
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 136
            ExplicitTop = 16
            ExplicitWidth = 298
            DesignSize = (
              298
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 63
              Width = 233
              ExplicitLeft = 63
              ExplicitWidth = 233
            end
            inherited edCodigo: TPatternEdit
              Width = 60
              ExplicitWidth = 60
            end
          end
        end
        object edTC_OBSERVACIONES: TMemo
          Left = 384
          Top = 110
          Width = 442
          Height = 146
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object GroupBox14: TGroupBox
          Left = 4
          Top = 48
          Width = 368
          Height = 44
          Caption = ' Carg'#243' Tarifa '
          TabOrder = 1
          DesignSize = (
            368
            44)
          object Label50: TLabel
            Left = 96
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object edFechaCargaTarifa: TDateComboBox
            Left = 4
            Top = 16
            Width = 88
            Height = 21
            TabOrder = 0
          end
          inline fraUsuarioCargaTarifa: TfraUsuarios
            Left = 136
            Top = 16
            Width = 230
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 136
            ExplicitTop = 16
            ExplicitWidth = 230
            DesignSize = (
              230
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 63
              Width = 166
              ExplicitLeft = 63
              ExplicitWidth = 166
            end
            inherited edCodigo: TPatternEdit
              Width = 60
              ExplicitWidth = 60
            end
          end
        end
      end
      object tsReporte: TTabSheet
        Caption = 'Final'
        ImageIndex = 8
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          829
          368)
        object Label48: TLabel
          Left = 4
          Top = 296
          Width = 171
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Observaciones para '#193'rea Comercial'
        end
        object PreviewCotizacion: TQRPreview
          Left = 0
          Top = 0
          Width = 829
          Height = 124
          HorzScrollBar.Tracking = True
          VertScrollBar.Tracking = True
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnPageAvailable = PreviewCotizacionPageAvailable
          PageNumber = 1
          Zoom = 100
        end
        object gbTarifaSugerida: TGroupBox
          Left = 4
          Top = 128
          Width = 192
          Height = 168
          Anchors = [akLeft, akBottom]
          Caption = ' Tarifa Sugerida '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object Label13: TLabel
            Left = 8
            Top = 32
            Width = 87
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Fijo'
          end
          object Label14: TLabel
            Left = 8
            Top = 55
            Width = 87
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Variable'
          end
          object Label15: TLabel
            Left = 8
            Top = 78
            Width = 87
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Final'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 8
            Top = 101
            Width = 87
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Comisi'#243'n Cotizada'
          end
          object Label157: TLabel
            Left = 32
            Top = 124
            Width = 69
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'ACPO'
          end
          object Label160: TLabel
            Left = 8
            Top = 147
            Width = 87
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'OE'
          end
          object edTC_SUMAFIJA: TCurrencyEdit
            Left = 104
            Top = 28
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            MaxLength = 10
            TabOrder = 1
            OnChange = ActualizarCotizacionCosto
          end
          object edTC_PORCVARIABLE: TCurrencyEdit
            Left = 104
            Top = 51
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 10
            TabOrder = 2
            OnChange = ActualizarCotizacionPorc
          end
          object edTC_COSTOFINAL: TCurrencyEdit
            Left = 104
            Top = 74
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 3
            OnChange = ActualizarCotizacionCostoFinal
          end
          object edComisionCotizada: TCurrencyEdit
            Left = 104
            Top = 97
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            TabOrder = 4
            OnChange = ActualizarCotizacionPorc
          end
          object btnCopiarTarifaPiso: TButton
            Left = 8
            Top = 14
            Width = 64
            Height = 16
            Caption = 'Copiar'
            TabOrder = 0
            TabStop = False
            OnClick = btnCopiarTarifaPisoClick
          end
          object edAcpo: TCurrencyEdit
            Left = 104
            Top = 120
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            TabOrder = 5
            OnChange = edComisionTPChange
          end
          object edOE: TCurrencyEdit
            Left = 104
            Top = 143
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            ReadOnly = True
            TabOrder = 6
            OnChange = ActualizarCotizacionCosto
          end
        end
        object btnCotizador: TButton
          Left = 545
          Top = 136
          Width = 64
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Cotizador'
          TabOrder = 1
          OnClick = btnCotizadorClick
        end
        object btnRefrescar: TButton
          Left = 617
          Top = 136
          Width = 64
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Actualizar'
          TabOrder = 2
          OnClick = btnRefrescarClick
        end
        object btnImprimir: TButton
          Left = 689
          Top = 136
          Width = 64
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Imprimir'
          TabOrder = 3
          OnClick = btnImprimirClick
        end
        object btnExportarPDF: TBitBtn
          Left = 761
          Top = 136
          Width = 64
          Height = 25
          Hint = 'Exportar a PDF'
          Anchors = [akRight, akBottom]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F8F8F8FF6363
            63FF606060FF132581FF5E5E62FF616161FF626262FF142781FF162981FF1527
            7CFF16287FFF162981FF162981FF1A2C81FFE2E2E2FFFF00FF00ECECECFFFFFF
            FFFFC2C7FDFF0818F1FFE9E9E6FFE0E0E1FFDDDEDFFF1526F2FF2432F1FF2333
            F3FF1C25B3FF2434F6FF2432F1FF1827F9FF9697A0FFFF00FF00EAEAEAFFFFFF
            FFFF646EF4FF2D3BEFFFFFFFFAFFF3F3F3FFECEDEEFF1523EFFF2432EEFF2432
            EEFF212DD8FF1E28C4FF2533F2FF5661F5FFA3A39EFFFF00FF00EAEAEAFFEEF0
            FFFF0918ECFFB3B8F9FFFFFFFFFFFFFFFFFFFDFDFFFF1322EDFF2432EEFF2432
            EEFF2433F2FF1E28BCFF1724D5FFB7BCFEFF9E9E9DFFFF00FF00EBEBEAFF5562
            FFFF3844EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A29EDFF2432EEFF2432
            EEFF2432EEFF2533F2FF0F1AB1FFFFFFF2FF9D9D9EFFFF00FF00EAEAEAFF1222
            FAFFF1F2FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D3BEEFF2533EEFF2432
            EEFF2432EEFF2331EEFF4E59EBFFD0CEC4FF9C9C9CFFFF00FF00EAEAEAFFCCD0
            FFFFFDFEFEFFF7F7F7FFF0F0F0FFEEEEEDFFF6F5F2FF676FEEFF2634EFFF2432
            F2FF2432F1FF1E2CEEFF9198F6FFF0EEEDFF979696FFFF00FF00EBEAEAFFE8E5
            D6FFC6C4C1FFC6C4C2FFC8C6C4FFC8C6C4FFCCCAC4FF7175BCFF1D27B4FF1D26
            B8FF202BC9FF1A28E2FFBBBFFAFFFFFFFFFF9C9C9CFFFF00FF00EAEAEAFF2F38
            C5FF797EC0FFD9D5C7FFCECCC6FFCAC8C6FFC9C7C6FFA5A5C3FF141FB8FF1D27
            B9FF1D27B9FF1620B5FFA3A4BEFFD9D8D7FF9C9C9CFFFF00FF00EAEAEAFF6F74
            C8FF0A15B6FF0F19B7FF545ABDFFD9D6C7FFC9C7C6FFD6D3C7FF0E19B8FF1D27
            B9FF1D27B9FF151FB8FFB3B3C5FFCECBCBFF989897FFFF00FF00EAEAEAFFFFFF
            FCFFFBFBF5FFB9BCECFF1623D5FF1924BFFFB2B3C2FFD5D2C6FF4951BCFF1E28
            B9FF1D27B9FF151FB8FFB7B6C5FFCECCCBFF989898FFFF00FF00EAEAEAFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF6D76F5FF0919EFFF9C9FE2FFB2B2CAFF1019
            B3FF1D27B9FF1520B8FFACADC4FFCDCBCBFF989898FFFF00FF00EBEBEBFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EAFDFF1B2BEDFF8C94F8FF2F3C
            EEFF1F2BC3FF1520B2FFA0A1C3FFCECCCBFF979797FFFF00FF00F7F7F7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5763F7FF3D4A
            F4FF1D2BF4FF1A28F0FF8388CFFFD0CECCFFADADACFFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Visible = False
          OnClick = btnExportarPDFClick
        end
        object gbTarifaPiso: TGroupBox
          Left = 204
          Top = 128
          Width = 168
          Height = 168
          Anchors = [akLeft, akBottom]
          Caption = ' Tarifa Piso '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object Label74: TLabel
            Left = 8
            Top = 32
            Width = 69
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Fijo'
          end
          object Label152: TLabel
            Left = 8
            Top = 55
            Width = 69
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Variable'
          end
          object Label153: TLabel
            Left = 8
            Top = 78
            Width = 69
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Final'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label154: TLabel
            Left = 8
            Top = 101
            Width = 69
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Comisi'#243'n'
          end
          object Label156: TLabel
            Left = 8
            Top = 124
            Width = 69
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'ACPO'
          end
          object Label161: TLabel
            Left = 8
            Top = 147
            Width = 69
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'OE'
          end
          object edCostoFijoTP: TCurrencyEdit
            Left = 80
            Top = 28
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            MaxLength = 10
            TabOrder = 2
            OnChange = edCostoFijoTPChange
          end
          object edCostoVariableTP: TCurrencyEdit
            Left = 80
            Top = 51
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 10
            TabOrder = 3
            OnChange = edCostoVariableTPChange
          end
          object edCostoFinalTP: TCurrencyEdit
            Left = 80
            Top = 74
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 4
            OnChange = edCostoFinalTPChange
          end
          object edComisionTP: TCurrencyEdit
            Left = 80
            Top = 97
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            TabOrder = 5
            OnChange = edComisionTPChange
          end
          object btnRecuperarTarifaPiso: TButton
            Left = 80
            Top = 10
            Width = 80
            Height = 16
            Caption = 'Recuperar'
            TabOrder = 1
            TabStop = False
            OnClick = btnRecuperarTarifaPisoClick
          end
          object edAcpoTP: TCurrencyEdit
            Left = 80
            Top = 120
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            TabOrder = 6
            OnChange = edComisionTPChange
          end
          object btnCopiarTarifaSugerida: TButton
            Left = 8
            Top = 14
            Width = 64
            Height = 16
            Caption = 'Copiar'
            TabOrder = 0
            TabStop = False
            OnClick = btnCopiarTarifaSugeridaClick
          end
          object edOETP: TCurrencyEdit
            Left = 80
            Top = 143
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            ReadOnly = True
            TabOrder = 7
            OnChange = edCostoFijoTPChange
          end
        end
        object gbFinalVarios: TGroupBox
          Left = 380
          Top = 164
          Width = 445
          Height = 132
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 7
          object Label155: TLabel
            Left = 160
            Top = 72
            Width = 85
            Height = 13
            Caption = #205'ndice Combinado'
          end
          object chkIltEmpleador: TCheckBox
            Left = 8
            Top = 16
            Width = 160
            Height = 17
            Caption = 'ILT A/C EMPLEADOR'
            TabOrder = 0
          end
          object chkFrecuencuaSiniestral: TCheckBox
            Left = 8
            Top = 44
            Width = 160
            Height = 17
            Caption = 'FRECUENCIA SINIESTRAL'
            TabOrder = 1
          end
          object chkJuicios: TCheckBox
            Left = 8
            Top = 72
            Width = 120
            Height = 17
            Caption = 'JUICIOS'
            TabOrder = 2
          end
          object chkPrecioCompetencia: TCheckBox
            Left = 160
            Top = 44
            Width = 160
            Height = 17
            Caption = 'PRECIO COMPETENCIA'
            TabOrder = 5
          end
          object chkIlp: TCheckBox
            Left = 160
            Top = 16
            Width = 160
            Height = 17
            Caption = 'ILP'
            TabOrder = 4
          end
          object edIndiceCombinado: TCurrencyEdit
            Left = 257
            Top = 68
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            MaxValue = 999.000000000000000000
            ReadOnly = True
            TabOrder = 6
            OnChange = ActualizarCotizacionPorc
          end
          object chkTarifaUnificada: TCheckBox
            Left = 8
            Top = 100
            Width = 120
            Height = 17
            Caption = 'TARIFA UNIFICADA'
            TabOrder = 3
          end
          object chkCargaManual: TCheckBox
            Left = 344
            Top = 72
            Width = 88
            Height = 17
            Caption = 'Carga Manual'
            TabOrder = 7
            OnClick = chkCargaManualClick
          end
        end
        object pnObservaciones: TPanel
          Left = 0
          Top = 308
          Width = 829
          Height = 60
          Align = alBottom
          Caption = 'pnObservaciones'
          TabOrder = 8
          object edTC_OBSERVACIONESAlta: TMemo
            Left = 1
            Top = 1
            Width = 827
            Height = 58
            Align = alClient
            Lines.Strings = (
              '111'
              '222'
              '333'
              '444'
              '555')
            MaxLength = 2048
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object tsHistorico: TTabSheet
        Caption = 'Hist'#243'rico'
        ImageIndex = 11
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PreviewHistorico: TQRPreview
          Left = 0
          Top = 0
          Width = 829
          Height = 297
          HorzScrollBar.Tracking = True
          VertScrollBar.Tracking = True
          Align = alClient
          TabOrder = 0
          PageNumber = 1
          Zoom = 100
        end
        object gbCotizacionesHistoricas: TGroupBox
          Left = 0
          Top = 297
          Width = 829
          Height = 71
          Align = alBottom
          Caption = 'Hist'#243'rico de cotizaciones previas'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            829
            71)
          object btnRefrescarHistorico: TButton
            Left = 750
            Top = 13
            Width = 70
            Height = 25
            Anchors = [akTop, akRight, akBottom]
            Caption = 'Actualizar'
            Enabled = False
            TabOrder = 0
            OnClick = btnRefrescarHistoricoClick
          end
          object btnImprimirHistorico: TButton
            Left = 750
            Top = 41
            Width = 70
            Height = 25
            Anchors = [akTop, akRight, akBottom]
            Caption = 'Imprimir'
            Enabled = False
            TabOrder = 1
            OnClick = btnImprimirHistoricoClick
          end
          object GridCotizacionHistorica: TArtDBGrid
            Left = 2
            Top = 15
            Width = 739
            Height = 54
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsCotizacionesHistoricas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            FooterBand = False
            TitleHeight = 17
            AutoTitleHeight = True
            Columns = <
              item
                Expanded = False
                FieldName = 'CO_NROCOTIZACION'
                Title.Caption = 'N'#186' Cotizaci'#243'n'
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CO_FECHAVIGENCIA'
                Title.Caption = 'F. Vigencia'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CO_CANTTRABAJADOR'
                Title.Caption = 'Cant. Trabajadores'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CO_NIVEL'
                Title.Caption = 'Nivel'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CO_MASASALARIAL'
                Title.Caption = 'Masa Salarial'
                Width = 94
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TC_SUMAFIJA'
                Title.Caption = 'Suma Fija'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TC_PORCVARIABLE'
                Title.Caption = '% Variable'
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TC_COSTOFINAL'
                Title.Caption = 'Costo Final'
                Width = 84
                Visible = True
              end>
          end
        end
      end
      object tsPrevencion: TTabSheet
        Caption = 'Prevenci'#243'n'
        ImageIndex = 12
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 829
          Height = 368
          Align = alClient
          TabOrder = 0
          object Label77: TLabel
            Left = 8
            Top = 12
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Total Peri'#243'dicos'
          end
          object Label78: TLabel
            Left = 8
            Top = 36
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Promedio por Visita'
          end
          object Label79: TLabel
            Left = 8
            Top = 60
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Cantidad de Visitas Totales'
          end
          object Label80: TLabel
            Left = 8
            Top = 84
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total Visitas'
          end
          object Label81: TLabel
            Left = 8
            Top = 108
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Otras Erogaciones'
          end
          object Label82: TLabel
            Left = 8
            Top = 132
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Costo Total Prevenci'#243'n'
          end
          object Label83: TLabel
            Left = 8
            Top = 180
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Usuario'
          end
          object Label84: TLabel
            Left = 8
            Top = 156
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Fecha'
          end
          object Label158: TLabel
            Left = 8
            Top = 204
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Prevenci'#243'n 1'
          end
          object Label159: TLabel
            Left = 8
            Top = 228
            Width = 129
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Prevenci'#243'n 2'
          end
          object edCostoTotalPeriodicos: TCurrencyEdit
            Left = 144
            Top = 8
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
          object edCostoPromedioVisita: TCurrencyEdit
            Left = 144
            Top = 32
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 1
          end
          object edCantidadVisitasTotales: TCurrencyEdit
            Left = 144
            Top = 56
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 0
            DisplayFormat = '0;-0'
            ReadOnly = True
            TabOrder = 2
          end
          object edTotalVisitas: TCurrencyEdit
            Left = 144
            Top = 80
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
          end
          object edOtrasErogaciones: TCurrencyEdit
            Left = 144
            Top = 104
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 4
          end
          object edCostoTotalPrevencion: TCurrencyEdit
            Left = 144
            Top = 128
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 5
          end
          object edFechaPrevencion: TDateEdit
            Left = 144
            Top = 152
            Width = 88
            Height = 21
            Color = clBtnFace
            NumGlyphs = 2
            ReadOnly = True
            TabOrder = 6
          end
          object edUsuarioPrevencion: TEdit
            Left = 144
            Top = 176
            Width = 120
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 7
            Text = '-'
          end
          object Panel2: TPanel
            Left = 280
            Top = 8
            Width = 232
            Height = 120
            Color = 15001560
            TabOrder = 10
            object Label85: TLabel
              Left = 8
              Top = 20
              Width = 64
              Height = 13
              Caption = '% Expuestos'
            end
            object Label86: TLabel
              Left = 8
              Top = 44
              Width = 69
              Height = 13
              Caption = 'Costo ex'#225'men'
            end
            object Label87: TLabel
              Left = 8
              Top = 68
              Width = 117
              Height = 13
              Caption = 'Trabajadores expuestos'
            end
            object Label88: TLabel
              Left = 8
              Top = 92
              Width = 79
              Height = 13
              Caption = 'Costo per'#237'odicos'
            end
            object Label89: TLabel
              Left = 80
              Top = 1
              Width = 51
              Height = 13
              Caption = 'Agente 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edCostoExamen1: TCurrencyEdit
              Left = 144
              Top = 40
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 1
            end
            object edPorcentajeExpuestos1: TCurrencyEdit
              Left = 144
              Top = 16
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00 %;-,0.00 %'
              ParentColor = True
              ReadOnly = True
              TabOrder = 0
            end
            object edTrabajadoresExpuestos1: TCurrencyEdit
              Left = 144
              Top = 64
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '0;-0'
              ParentColor = True
              ReadOnly = True
              TabOrder = 2
            end
            object edCostoPeriodicos1: TCurrencyEdit
              Left = 144
              Top = 88
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel3: TPanel
            Left = 512
            Top = 8
            Width = 232
            Height = 120
            Color = 13292983
            TabOrder = 11
            object Label95: TLabel
              Left = 8
              Top = 20
              Width = 64
              Height = 13
              Caption = '% Expuestos'
            end
            object Label96: TLabel
              Left = 8
              Top = 44
              Width = 69
              Height = 13
              Caption = 'Costo ex'#225'men'
            end
            object Label97: TLabel
              Left = 8
              Top = 68
              Width = 117
              Height = 13
              Caption = 'Trabajadores expuestos'
            end
            object Label98: TLabel
              Left = 8
              Top = 92
              Width = 79
              Height = 13
              Caption = 'Costo per'#237'odicos'
            end
            object Label99: TLabel
              Left = 80
              Top = 1
              Width = 51
              Height = 13
              Caption = 'Agente 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edCostoExamen2: TCurrencyEdit
              Left = 144
              Top = 40
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 1
            end
            object edPorcentajeExpuestos2: TCurrencyEdit
              Left = 144
              Top = 16
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00 %;-,0.00 %'
              ParentColor = True
              ReadOnly = True
              TabOrder = 0
            end
            object edTrabajadoresExpuestos2: TCurrencyEdit
              Left = 144
              Top = 64
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '0;-0'
              ParentColor = True
              ReadOnly = True
              TabOrder = 2
            end
            object edCostoPeriodicos2: TCurrencyEdit
              Left = 144
              Top = 88
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel4: TPanel
            Left = 280
            Top = 128
            Width = 232
            Height = 120
            Color = 12047822
            TabOrder = 12
            object Label90: TLabel
              Left = 8
              Top = 20
              Width = 64
              Height = 13
              Caption = '% Expuestos'
            end
            object Label91: TLabel
              Left = 8
              Top = 44
              Width = 69
              Height = 13
              Caption = 'Costo ex'#225'men'
            end
            object Label92: TLabel
              Left = 8
              Top = 68
              Width = 117
              Height = 13
              Caption = 'Trabajadores expuestos'
            end
            object Label93: TLabel
              Left = 8
              Top = 92
              Width = 79
              Height = 13
              Caption = 'Costo per'#237'odicos'
            end
            object Label94: TLabel
              Left = 80
              Top = 1
              Width = 51
              Height = 13
              Caption = 'Agente 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edCostoExamen3: TCurrencyEdit
              Left = 144
              Top = 40
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 1
            end
            object edPorcentajeExpuestos3: TCurrencyEdit
              Left = 144
              Top = 16
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00 %;-,0.00 %'
              ParentColor = True
              ReadOnly = True
              TabOrder = 0
            end
            object edTrabajadoresExpuestos3: TCurrencyEdit
              Left = 144
              Top = 64
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '0;-0'
              ParentColor = True
              ReadOnly = True
              TabOrder = 2
            end
            object edCostoPeriodicos3: TCurrencyEdit
              Left = 144
              Top = 88
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel5: TPanel
            Left = 512
            Top = 128
            Width = 232
            Height = 120
            Color = 11974870
            TabOrder = 13
            object Label100: TLabel
              Left = 8
              Top = 20
              Width = 64
              Height = 13
              Caption = '% Expuestos'
            end
            object Label101: TLabel
              Left = 8
              Top = 44
              Width = 69
              Height = 13
              Caption = 'Costo ex'#225'men'
            end
            object Label102: TLabel
              Left = 8
              Top = 68
              Width = 117
              Height = 13
              Caption = 'Trabajadores expuestos'
            end
            object Label103: TLabel
              Left = 8
              Top = 92
              Width = 79
              Height = 13
              Caption = 'Costo per'#237'odicos'
            end
            object Label104: TLabel
              Left = 80
              Top = 1
              Width = 51
              Height = 13
              Caption = 'Agente 4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edCostoExamen4: TCurrencyEdit
              Left = 144
              Top = 40
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 1
            end
            object edPorcentajeExpuestos4: TCurrencyEdit
              Left = 144
              Top = 16
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00 %;-,0.00 %'
              ParentColor = True
              ReadOnly = True
              TabOrder = 0
            end
            object edTrabajadoresExpuestos4: TCurrencyEdit
              Left = 144
              Top = 64
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '0;-0'
              ParentColor = True
              ReadOnly = True
              TabOrder = 2
            end
            object edCostoPeriodicos4: TCurrencyEdit
              Left = 144
              Top = 88
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 3
            end
          end
          object dbgridEstablecimientos: TArtDBGrid
            Left = 0
            Top = 264
            Width = 808
            Height = 160
            Align = alBottom
            DataSource = dsEstablecimientos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 14
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
                FieldName = 'zg_descripcion'
                Title.Caption = 'Provincia'
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cp_localidadcap'
                Title.Caption = 'Localidad'
                Width = 163
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ta_detalle'
                Title.Caption = 'Actividad'
                Width = 98
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ac_codigo'
                Title.Caption = 'C'#243'digo CIIU'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ac_descripcion'
                Title.Caption = 'Descripci'#243'n CIIU'
                Width = 175
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'eu_trabajadores'
                Title.Alignment = taRightJustify
                Title.Caption = '# Trabajadores'
                Width = 86
                Visible = True
              end>
          end
          object Panel6: TPanel
            Left = 0
            Top = 248
            Width = 808
            Height = 16
            Align = alBottom
            Alignment = taLeftJustify
            Caption = '    Establecimientos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
          end
          object edPrevencion1: TCurrencyEdit
            Left = 144
            Top = 200
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 8
          end
          object edPrevencion2: TCurrencyEdit
            Left = 144
            Top = 224
            Width = 88
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 9
          end
          object toolPrevencion1: TToolBar
            Left = 232
            Top = 198
            Width = 48
            Height = 25
            Align = alNone
            Caption = 'toolPrevencion1'
            Ctl3D = False
            Images = frmPrincipal.ilColor
            TabOrder = 16
            object tbEditar: TToolButton
              Left = 0
              Top = 0
              Hint = 'Editar'
              Caption = 'tbEditar'
              ImageIndex = 7
              ParentShowHint = False
              ShowHint = True
              OnClick = tbEditarClick
            end
            object tbCancelar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Cancelar'
              Caption = 'tbCancelar'
              ImageIndex = 39
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = tbCancelarClick
            end
          end
        end
      end
      object tsJuicios: TTabSheet
        Caption = 'Juicios'
        ImageIndex = 13
        object gridJuicios: TArtDBGrid
          Left = 0
          Top = 27
          Width = 829
          Height = 341
          Align = alClient
          DataSource = dsJuicios
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = gridJuiciosDblClick
          IniStorage = FormStorage
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'art'
              Title.Caption = 'ART'
              Width = 151
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_numeroexpediente'
              Title.Alignment = taRightJustify
              Title.Caption = 'N'#186' Expediente'
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ju_caratula'
              Title.Caption = 'Car'#225'tula'
              Width = 382
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'caracterart'
              Title.Caption = 'Car'#225'cter ART'
              Width = 113
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ju_fechanotificacion'
              Title.Alignment = taCenter
              Title.Caption = 'F. Notificaci'#243'n'
              Width = 86
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ju_juzgadotribunal'
              Title.Alignment = taCenter
              Title.Caption = 'Juzgado / Tribunal'
              Width = 95
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'cuiltrabajador'
              Title.Alignment = taCenter
              Title.Caption = 'CUIL Trabajador'
              Width = 115
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_numerosiniestro'
              Title.Alignment = taRightJustify
              Title.Caption = 'N'#186' Siniestro'
              Width = 88
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ju_fechaaccidente'
              Title.Alignment = taCenter
              Title.Caption = 'F. Accidente'
              Width = 94
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_numeroexpedientecmohv'
              Title.Alignment = taRightJustify
              Title.Caption = 'N'#186' Expediente CMOHV'
              Width = 118
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_montoreclamado'
              Title.Alignment = taRightJustify
              Title.Caption = 'Monto Reclamado'
              Width = 95
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'presentaronem'
              Title.Alignment = taCenter
              Title.Caption = 'Presentaron Estudios M'#233'dicos'
              Width = 149
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'presentaroncm'
              Title.Alignment = taCenter
              Title.Caption = 'Presentaron Certificados M'#233'dicos'
              Width = 166
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_abogadosactora'
              Title.Alignment = taRightJustify
              Title.Caption = '# Abogados Actora'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_medicosactora'
              Title.Alignment = taRightJustify
              Title.Caption = '# M'#233'dicos Actora'
              Width = 94
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_peritosoficiales'
              Title.Alignment = taRightJustify
              Title.Caption = '# Peritos Oficiales'
              Width = 96
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'reclamaincapacidad'
              Title.Alignment = taCenter
              Title.Caption = 'Reclama Incapacidad'
              Width = 113
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_porcincapacidadperito'
              Title.Alignment = taRightJustify
              Title.Caption = '% Incapacidad Perito'
              Width = 109
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ju_porcincapacidadart'
              Title.Alignment = taRightJustify
              Title.Caption = '% Incapacidad ART'
              Width = 104
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'artrevaluacion'
              Title.Alignment = taCenter
              Title.Caption = 'ART Revaluaci'#243'n del Siniestro'
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'provincia'
              Title.Caption = 'Provincia'
              Width = 192
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ju_fechaproceso'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha Proceso'
              Width = 108
              Visible = True
            end>
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 829
          Height = 27
          BorderWidth = 1
          ButtonWidth = 24
          Caption = 'ToolBar'
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          object tbDescargarDatosUART: TToolButton
            Left = 0
            Top = 0
            Hint = 'Obtener Datos desde la UART'
            Caption = 'tbDescargarDatosUART'
            ImageIndex = 17
            ParentShowHint = False
            ShowHint = True
            OnClick = tbDescargarDatosUARTClick
          end
          object ToolButton7: TToolButton
            Left = 24
            Top = 0
            Width = 4
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbVerDetalles: TToolButton
            Left = 28
            Top = 0
            Hint = 'Ver Detalles'
            ImageIndex = 13
            ParentShowHint = False
            ShowHint = True
            OnClick = tbVerDetallesClick
          end
        end
        inline fraImportUART: TfraImportUART
          Left = 276
          Top = 152
          Width = 205
          Height = 25
          TabOrder = 1
          Visible = False
          ExplicitLeft = 276
          ExplicitTop = 152
          ExplicitWidth = 205
          ExplicitHeight = 25
          DesignSize = (
            205
            25)
          inherited edResultados: TRichEdit
            Width = 183
            Height = 10
            ExplicitWidth = 183
            ExplicitHeight = 10
          end
        end
      end
    end
    object edCO_NROCOTIZACION: TIntEdit
      Left = 53
      Top = 2
      Width = 81
      Height = 21
      TabOrder = 0
      OnKeyPress = edCO_NROCOTIZACIONKeyPress
    end
    object edCO_MASASALARIAL: TCurrencyEdit
      Left = 770
      Top = 98
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Anchors = [akTop, akRight]
      MaxLength = 10
      TabOrder = 18
    end
    inline fraCO_ESTADO: TfraStaticCTB_TABLAS
      Left = 52
      Top = 50
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      OnExit = fraCO_ESTADOExit
      ExplicitLeft = 52
      ExplicitTop = 50
      ExplicitWidth = 334
      DesignSize = (
        334
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 270
        ExplicitWidth = 270
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
    object edCO_CANTTRABAJADOR: TIntEdit
      Left = 770
      Top = 122
      Width = 64
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 19
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 9
    end
    object cmbCO_FECHAAPERTURA: TDateComboBox
      Left = 758
      Top = 50
      Width = 78
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 11
    end
    object edCO_COMISION: TCurrencyEdit
      Left = 641
      Top = 50
      Width = 52
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = '% ,0.00;-% ,0.00'
      Anchors = [akTop, akRight]
      MaxValue = 100.000000000000000000
      ReadOnly = True
      TabOrder = 10
    end
    object edSC_OBSERVACIONES: TMemo
      Left = 8
      Top = 116
      Width = 160
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssVertical
      TabOrder = 15
    end
    object edCO_NIVEL: TIntEdit
      Left = 562
      Top = 50
      Width = 29
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 9
      Text = '0'
      MaxLength = 10
    end
    object gbRevision: TGroupBox
      Left = 440
      Top = 98
      Width = 264
      Height = 68
      Anchors = [akTop, akRight]
      Caption = ' Revisi'#243'n '
      TabOrder = 17
      object Label58: TLabel
        Left = 7
        Top = 44
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object Label59: TLabel
        Left = 4
        Top = 20
        Width = 32
        Height = 13
        Cursor = crHandPoint
        Caption = 'Motivo'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = Label59Click
      end
      object Label71: TLabel
        Left = 134
        Top = 44
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      inline fraMotivoRevision: TfraStaticCTB_TABLAS
        Left = 40
        Top = 16
        Width = 222
        Height = 23
        TabOrder = 0
        ExplicitLeft = 40
        ExplicitTop = 16
        ExplicitWidth = 222
        DesignSize = (
          222
          23)
        inherited edCodigo: TPatternEdit
          Width = 56
          Visible = False
          ExplicitWidth = 56
        end
        inherited cmbDescripcion: TComboGrid
          Left = 2
          Width = 218
          ExplicitLeft = 2
          ExplicitWidth = 218
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
      object dcbFechaRevision: TDateComboBox
        Left = 42
        Top = 40
        Width = 86
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edUsuarioRevision: TEdit
        Left = 172
        Top = 40
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 2
      end
    end
    object gbExcepcion: TGroupBox
      Left = 174
      Top = 98
      Width = 264
      Height = 68
      Anchors = [akTop, akRight]
      Caption = ' Excepci'#243'n '
      TabOrder = 16
      object Label61: TLabel
        Left = 7
        Top = 44
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object Label62: TLabel
        Left = 4
        Top = 20
        Width = 32
        Height = 13
        Cursor = crHandPoint
        Caption = 'Motivo'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = Label62Click
      end
      object Label63: TLabel
        Left = 134
        Top = 44
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      inline fraMotivoExcepcion: TfraStaticCTB_TABLAS
        Left = 40
        Top = 16
        Width = 222
        Height = 23
        TabOrder = 0
        ExplicitLeft = 40
        ExplicitTop = 16
        ExplicitWidth = 222
        DesignSize = (
          222
          23)
        inherited edCodigo: TPatternEdit
          Visible = False
        end
        inherited cmbDescripcion: TComboGrid
          Left = 2
          Width = 218
          ExplicitLeft = 2
          ExplicitWidth = 218
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
      object dcbFechaExcepcion: TDateComboBox
        Left = 42
        Top = 40
        Width = 86
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edUsuarioExcepcion: TEdit
        Left = 172
        Top = 40
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 2
      end
    end
    inline fraCO_IDGRUPOECONOMICO: TfraCodDesc
      Left = 435
      Top = 74
      Width = 402
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 12
      ExplicitLeft = 435
      ExplicitTop = 74
      ExplicitWidth = 402
      DesignSize = (
        402
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 331
        ExplicitLeft = 63
        ExplicitWidth = 331
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'GE_FECHABAJA'
        FieldCodigo = 'GE_CODIGO'
        FieldDesc = 'GE_DESCRIPCION'
        FieldID = 'GE_ID'
        ShowBajas = True
        TableName = 'AGE_GRUPOECONOMICO'
      end
    end
    object edCO_ESTABLECIMIENTOS: TIntEdit
      Left = 770
      Top = 146
      Width = 64
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 20
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edUsuarioSolicito: TEdit
      Left = 52
      Top = 75
      Width = 334
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 14
      Text = 'edUsuarioSolicito'
    end
    object frmImpresion: TFormPanel
      Left = 670
      Top = 7
      Width = 208
      Height = 72
      Caption = 'Opciones de Impresi'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      Constraints.MaxHeight = 72
      Constraints.MaxWidth = 208
      Constraints.MinHeight = 72
      Constraints.MinWidth = 208
      DesignSize = (
        208
        72)
      object Bevel1: TBevel
        Left = -68
        Top = 30
        Width = 289
        Height = 11
        Anchors = [akRight, akBottom]
        Shape = bsBottomLine
      end
      object btnAceptarImpresion: TButton
        Left = 53
        Top = 44
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
        TabOrder = 2
        OnClick = btnAceptarImpresionClick
      end
      object btnCancelarImpresion: TButton
        Left = 128
        Top = 44
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        TabOrder = 3
        OnClick = btnCancelarImpresionClick
      end
      object chkTasa: TCheckBox
        Left = 6
        Top = 4
        Width = 197
        Height = 17
        Caption = 'Tasa de Incidencia / Costo Siniestral'
        TabOrder = 0
      end
      object chkFidelitas: TCheckBox
        Left = 6
        Top = 21
        Width = 97
        Height = 17
        Caption = 'Fidelitas'
        TabOrder = 1
      end
    end
    object edOrden: TIntEdit
      Left = 136
      Top = 2
      Width = 18
      Height = 21
      TabOrder = 1
      OnKeyPress = edOrdenKeyPress
    end
  end
  inherited btnAceptar: TButton
    Left = 742
    Top = 714
    Visible = False
    ExplicitLeft = 742
    ExplicitTop = 714
  end
  inherited btnCancelar: TButton
    Left = 820
    Top = 714
    Visible = False
    ExplicitLeft = 820
    ExplicitTop = 714
  end
  inherited btnAplicar: TButton
    Left = 665
    Top = 714
    Visible = False
    ExplicitLeft = 665
    ExplicitTop = 714
  end
  object fpObservacionesExcepcion: TFormPanel [6]
    Left = 696
    Top = -16
    Width = 360
    Height = 128
    Caption = 'Observaciones de la Excepci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpObservacionesExcepcionKeyPress
    object memoObservacionesExcepcion: TMemo
      Left = 0
      Top = 0
      Width = 360
      Height = 88
      Align = alTop
      Color = clBtnFace
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555'
        '666'
        '777')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnCerrar: TButton
      Left = 280
      Top = 96
      Width = 72
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCerrarClick
    end
  end
  object fpObervacionesRevision: TFormPanel [7]
    Left = 704
    Top = -48
    Width = 360
    Height = 128
    Caption = 'Observaciones de la Revisi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpObervacionesRevisionKeyPress
    object memoObservacionesRevision: TMemo
      Left = 0
      Top = 0
      Width = 360
      Height = 88
      Align = alTop
      Color = clBtnFace
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555'
        '666'
        '777')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnCerrar2: TButton
      Left = 280
      Top = 96
      Width = 72
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCerrar2Click
    end
  end
  object fpEstado: TFormPanel [8]
    Left = 298
    Top = 19
    Width = 336
    Height = 157
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpEstadoBeforeShow
    DesignSize = (
      336
      157)
    object Bevel6: TBevel
      Left = 4
      Top = 117
      Width = 328
      Height = 10
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptar2: TButton
      Left = 176
      Top = 125
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptar2Click
    end
    object btnCancelar2: TButton
      Left = 256
      Top = 125
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelar2Click
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 336
      Height = 32
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 2
      object Label65: TLabel
        Left = 8
        Top = 8
        Width = 324
        Height = 13
        Caption = 'Indique el estado en el que desea que quede la cotizaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox11: TGroupBox
      Left = 8
      Top = 40
      Width = 320
      Height = 73
      TabOrder = 3
      object rbEnPreparacion: TRadioButton
        Left = 8
        Top = 28
        Width = 240
        Height = 17
        Caption = 'En preparaci'#243'n'
        TabOrder = 0
      end
      object rbPendienteAutorizar: TRadioButton
        Left = 8
        Top = 48
        Width = 240
        Height = 17
        Caption = 'Pendiente de autorizar'
        TabOrder = 1
      end
      object rbAutorizada: TRadioButton
        Left = 8
        Top = 8
        Width = 240
        Height = 17
        Caption = 'Autorizada'
        TabOrder = 2
      end
    end
  end
  object fpRecuperarDatos: TFormPanel [9]
    Left = 720
    Top = -120
    Width = 776
    Height = 280
    Caption = 'Recuperar Datos de Cotizaciones Anteriores'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpRecuperarDatosBeforeShow
    KeyPreview = True
    OnKeyPress = fpRecuperarDatosKeyPress
    object gridCotizacionesAnteriores: TArtDBGrid
      Left = 0
      Top = 32
      Width = 776
      Height = 248
      Align = alClient
      DataSource = dsCotizacionesHistoricas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = gridCotizacionesAnterioresDblClick
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'NROCOTIZACION'
          Title.Alignment = taRightJustify
          Title.Caption = 'N'#186' Cotizaci'#243'n'
          Width = 78
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CO_FECHAVIGENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'F. Vigencia'
          Width = 120
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'CO_CANTTRABAJADOR'
          Title.Alignment = taRightJustify
          Title.Caption = '# Trabajadores'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CO_NIVEL'
          Title.Alignment = taCenter
          Title.Caption = 'Nivel'
          Width = 63
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'CO_MASASALARIAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Masa Salarial'
          Width = 94
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TC_SUMAFIJA'
          Title.Alignment = taRightJustify
          Title.Caption = 'Suma Fija'
          Width = 75
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TC_PORCVARIABLE'
          Title.Alignment = taRightJustify
          Title.Caption = '% Variable'
          Width = 84
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TC_COSTOFINAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Costo Final'
          Width = 84
          Visible = True
        end>
    end
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 776
      Height = 32
      Align = alTop
      TabOrder = 1
      object checkMostrarSoloUltimaCotizacion: TCheckBox
        Left = 464
        Top = 8
        Width = 208
        Height = 17
        Caption = 'Mostrar solo la '#250'ltima Cotizaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = checkMostrarSoloUltimaCotizacionClick
      end
    end
  end
  object fpDetalleJuicio: TFormPanel [10]
    Left = 712
    Top = -368
    Width = 600
    Height = 488
    Caption = 'Detalle Juicio'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpDetalleJuicioBeforeShow
    ActiveControl = edJuicioArt
    KeyPreview = True
    OnKeyPress = fpDetalleJuicioKeyPress
    object scrollJuicios: TScrollBox
      Left = 0
      Top = 0
      Width = 600
      Height = 448
      VertScrollBar.Position = 1045
      Align = alTop
      TabOrder = 0
      OnMouseWheel = scrollJuiciosMouseWheel
      object Label75: TLabel
        Left = 8
        Top = -1033
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A.R.T.'
      end
      object Label76: TLabel
        Left = 8
        Top = -933
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Car'#225'cter A.R.T.'
      end
      object Label105: TLabel
        Left = 8
        Top = -1009
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'N'#186' Expediente'
      end
      object Label106: TLabel
        Left = 8
        Top = -985
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Car'#225'tula'
      end
      object Label107: TLabel
        Left = 8
        Top = -909
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fecha Notificaci'#243'n'
      end
      object Label108: TLabel
        Left = 8
        Top = -809
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'C.U.I.L. Trabajador'
      end
      object Label109: TLabel
        Left = 8
        Top = -885
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Departamento Judicial'
      end
      object Label110: TLabel
        Left = 8
        Top = -833
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Juzgado / Tribunal'
      end
      object Label111: TLabel
        Left = 8
        Top = -785
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'N'#186' Siniestro'
      end
      object Label112: TLabel
        Left = 8
        Top = -713
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Monto Reclamado'
      end
      object Label113: TLabel
        Left = 8
        Top = -761
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fecha Accidente'
      end
      object Label114: TLabel
        Left = 8
        Top = -737
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'N'#186' Expediente CMOHV'
      end
      object Label115: TLabel
        Left = 8
        Top = -689
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Presentaron Estudios M'#233'dicos'
      end
      object Label117: TLabel
        Left = 8
        Top = -665
        Width = 160
        Height = 13
        Caption = 'Presentaron Certificados M'#233'dicos'
      end
      object Label118: TLabel
        Left = 8
        Top = -641
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '# Abogados Actora'
      end
      object Label116: TLabel
        Left = 8
        Top = -617
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '# M'#233'dicos Actora'
      end
      object Label119: TLabel
        Left = 8
        Top = -593
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '# Peritos Oficiales'
      end
      object Label120: TLabel
        Left = 8
        Top = -569
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Reclaman Incapacidad'
      end
      object Label121: TLabel
        Left = 8
        Top = -545
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Incapacidad Perito'
      end
      object Label122: TLabel
        Left = 8
        Top = -521
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Incapacidad A.R.T.'
      end
      object Label123: TLabel
        Left = 8
        Top = -497
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A.R.T. Revaluaci'#243'n'
      end
      object Label124: TLabel
        Left = 8
        Top = -473
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Actuaci'#243'n A.R.T.'
      end
      object Label125: TLabel
        Left = 8
        Top = -449
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'V'#237'nculo Laboral'
      end
      object Label126: TLabel
        Left = 8
        Top = -425
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Mediaci'#243'n'
      end
      object Label127: TLabel
        Left = 8
        Top = -401
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sentencia Corte Provincial'
      end
      object Label128: TLabel
        Left = 8
        Top = -349
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sentencia Corte Suprema'
      end
      object Label129: TLabel
        Left = 8
        Top = -297
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sentencia 1ra.'
      end
      object Label130: TLabel
        Left = 8
        Top = -245
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Monto 1ra.'
      end
      object Label131: TLabel
        Left = 8
        Top = -221
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Incapacidad 1ra. Sentencia'
      end
      object Label132: TLabel
        Left = 8
        Top = -197
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sentencia 2da.'
      end
      object Label133: TLabel
        Left = 8
        Top = -145
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Monto 2da.'
      end
      object Label134: TLabel
        Left = 8
        Top = -121
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Incapacidad 2da. Sentencia'
      end
      object Label135: TLabel
        Left = 8
        Top = -97
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Contingencia 1'
      end
      object Label136: TLabel
        Left = 8
        Top = -73
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Contingencia 2'
      end
      object Label137: TLabel
        Left = 8
        Top = -49
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Contingencia 3'
      end
      object Label138: TLabel
        Left = 8
        Top = -25
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Enfermedad Reclamada 1'
      end
      object Label139: TLabel
        Left = 8
        Top = -1
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Enfermedad Reclamada 2'
      end
      object Label140: TLabel
        Left = 8
        Top = 23
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Enfermedad Reclamada 3'
      end
      object Label141: TLabel
        Left = 8
        Top = 47
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Enfermedad Reclamada 4'
      end
      object Label142: TLabel
        Left = 8
        Top = 71
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Objeto A.R.T. 1'
      end
      object Label143: TLabel
        Left = 8
        Top = 123
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Objeto A.R.T. 2'
      end
      object Label144: TLabel
        Left = 8
        Top = 175
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Objeto A.R.T. 3'
      end
      object Label145: TLabel
        Left = 8
        Top = 227
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Objeto A.R.T. 4'
      end
      object Label146: TLabel
        Left = 8
        Top = 279
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Objeto A.R.T. 5'
      end
      object Label147: TLabel
        Left = 8
        Top = 331
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tipo Operaci'#243'n'
      end
      object Label148: TLabel
        Left = 8
        Top = 355
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Provincia'
      end
      object Label149: TLabel
        Left = 8
        Top = 379
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Zona Cuerpo'
      end
      object Label150: TLabel
        Left = 8
        Top = 403
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Diagn'#243'stico'
      end
      object Label151: TLabel
        Left = 8
        Top = 427
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fecha Proceso'
      end
      object edJuicioArt: TEdit
        Left = 176
        Top = -1037
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
        Text = 'edJuicioArt'
      end
      object edJuicioNumeroExpediente: TEdit
        Left = 176
        Top = -1013
        Width = 160
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit1'
      end
      object edJuicioCaracterArt: TEdit
        Left = 176
        Top = -937
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        Text = 'Edit1'
      end
      object edJuicioJuzgadoTribunal: TEdit
        Left = 176
        Top = -837
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        Text = 'Edit1'
      end
      object edJuicioCuilTrabajador: TEdit
        Left = 176
        Top = -813
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
        Text = 'Edit1'
      end
      object edJuicioNumeroSiniestro: TEdit
        Left = 176
        Top = -789
        Width = 160
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
        Text = 'Edit1'
      end
      object edJuicioNumeroExpedienteCMOHV: TEdit
        Left = 176
        Top = -741
        Width = 160
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 10
        Text = 'Edit1'
      end
      object edJuicioPresentaronEstudiosMedicos: TEdit
        Left = 176
        Top = -693
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 12
        Text = 'Edit1'
      end
      object edJuicioPresentaronCertificadosMedicos: TEdit
        Left = 176
        Top = -669
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 13
        Text = 'Edit1'
      end
      object edJuicioAbogadosActora: TEdit
        Left = 176
        Top = -645
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 14
        Text = 'Edit1'
      end
      object edJuicioMedicosActora: TEdit
        Left = 176
        Top = -621
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 15
        Text = 'Edit1'
      end
      object edJuicioPeritosOficiales: TEdit
        Left = 176
        Top = -597
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 16
        Text = 'Edit1'
      end
      object edJuicioReclamanIncapacidad: TEdit
        Left = 176
        Top = -573
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 17
        Text = 'Edit1'
      end
      object edJuicioArtRevaluacion: TEdit
        Left = 176
        Top = -501
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 20
        Text = 'Edit1'
      end
      object edJuicioActuacionArt: TEdit
        Left = 176
        Top = -477
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 21
        Text = 'Edit1'
      end
      object edJuicioVinculoLaboral: TEdit
        Left = 176
        Top = -453
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 22
        Text = 'Edit1'
      end
      object edJuicioMediacion: TEdit
        Left = 176
        Top = -429
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 23
        Text = 'Edit1'
      end
      object edJuicioEnfermedadReclamada1: TEdit
        Left = 176
        Top = -29
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 35
        Text = 'Edit1'
      end
      object edJuicioContingencia3: TEdit
        Left = 176
        Top = -53
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 34
        Text = 'Edit1'
      end
      object edJuicioContingencia2: TEdit
        Left = 176
        Top = -77
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 33
        Text = 'Edit1'
      end
      object edJuicioContingencia1: TEdit
        Left = 176
        Top = -101
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 32
        Text = 'Edit1'
      end
      object edJuicioEnfermedadReclamada4: TEdit
        Left = 176
        Top = 43
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 38
        Text = 'Edit1'
      end
      object edJuicioEnfermedadReclamada3: TEdit
        Left = 176
        Top = 19
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 37
        Text = 'Edit1'
      end
      object edJuicioEnfermedadReclamada2: TEdit
        Left = 176
        Top = -5
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 36
        Text = 'Edit1'
      end
      object edJuicioDiagnostico: TEdit
        Left = 176
        Top = 399
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 47
        Text = 'Edit1'
      end
      object edJuicioZonaCuerpo: TEdit
        Left = 176
        Top = 375
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 46
        Text = 'Edit1'
      end
      object edJuicioProvincia: TEdit
        Left = 176
        Top = 351
        Width = 400
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 45
        Text = 'Edit1'
      end
      object edJuicioTipoOperacion: TEdit
        Left = 176
        Top = 327
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 44
        Text = 'Edit1'
      end
      object memoJuicioCaratula: TMemo
        Left = 176
        Top = -989
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          '11111'
          '2222'
          '3333'
          '4444'
          '55555')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object memoJuicioDepartamentoJudicial: TMemo
        Left = 176
        Top = -889
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioDepartamentoJudicial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object memoJuicioSentenciaCorteProvincial: TMemo
        Left = 176
        Top = -405
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 24
      end
      object memoJuicioSentenciaCorteSuprema: TMemo
        Left = 176
        Top = -353
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 25
      end
      object memoJuicioSentencia1ra: TMemo
        Left = 176
        Top = -301
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 26
      end
      object memoJuicioSentencia2da: TMemo
        Left = 176
        Top = -201
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 29
      end
      object memoJuicioObjetoArt1: TMemo
        Left = 176
        Top = 67
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 39
      end
      object memoJuicioObjetoArt2: TMemo
        Left = 176
        Top = 119
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 40
      end
      object memoJuicioObjetoArt3: TMemo
        Left = 176
        Top = 171
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 41
      end
      object memoJuicioObjetoArt4: TMemo
        Left = 176
        Top = 223
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 42
      end
      object memoJuicioObjetoArt5: TMemo
        Left = 176
        Top = 275
        Width = 400
        Height = 48
        Color = clBtnFace
        Lines.Strings = (
          'memoJuicioSentenciaCorteProvincial')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 43
      end
      object edJuicioFechaNotificacion: TDateComboBox
        Left = 176
        Top = -913
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
      object edJuicioFechaAccidente: TDateComboBox
        Left = 176
        Top = -765
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
      end
      object edJuicioMontoReclamado: TCurrencyEdit
        Left = 176
        Top = -717
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 11
        OnChange = ActualizarCotizacionCosto
      end
      object edJuicioIncapacidadPerito: TCurrencyEdit
        Left = 176
        Top = -549
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;% -,0.000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 18
        OnChange = ActualizarCotizacionPorc
      end
      object edJuicioIncapacidadArt: TCurrencyEdit
        Left = 176
        Top = -525
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;% -,0.000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 19
        OnChange = ActualizarCotizacionPorc
      end
      object edJuicioIncapacidad1raSentencia: TCurrencyEdit
        Left = 176
        Top = -225
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;% -,0.000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 28
        OnChange = ActualizarCotizacionPorc
      end
      object edJuicioMonto1ra: TCurrencyEdit
        Left = 176
        Top = -249
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 27
        OnChange = ActualizarCotizacionCosto
      end
      object edJuicioMonto2da: TCurrencyEdit
        Left = 176
        Top = -149
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 30
        OnChange = ActualizarCotizacionCosto
      end
      object edJuicioIncapacidad2daSentencia: TCurrencyEdit
        Left = 176
        Top = -125
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;% -,0.000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 31
        OnChange = ActualizarCotizacionPorc
      end
      object edJuicioFechaProceso: TDateComboBox
        Left = 176
        Top = 423
        Width = 88
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 48
      end
    end
    object btnCerrar3: TButton
      Left = 520
      Top = 456
      Width = 72
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCerrar3Click
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16455
        LinkControl = btnAceptar
      end
      item
        Key = 16463
        LinkControl = tbObtenerFidelitas
      end
      item
        Key = 16470
      end
      item
        Key = 16460
        LinkControl = tbLimpiarFidelitas
      end
      item
        Key = 16452
        LinkControl = tbEliminarDetalle
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16469
        LinkControl = tbNuevoDetalle
      end
      item
        Key = 16453
        LinkControl = tbLimpiarDetalle
      end
      item
        Key = 16458
      end
      item
        Key = 16466
      end>
    Left = 566
    Top = 25
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PuedeCotizar'
      end
      item
        Name = 'Prevencion1'
      end>
    DBLogin = frmPrincipal.DBLogin
    Left = 510
    Top = 25
  end
  inherited FormStorage: TFormStorage
    Left = 538
    Top = 25
  end
  inherited sdqConsulta: TSDQuery
    Left = 594
    Top = 25
  end
  inherited dsConsulta: TDataSource
    DataSet = sdqHistorico
    Left = 649
    Top = 25
  end
  object sdqHistorico: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqHistoricoAfterScroll
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TC_FECHAALTA, TC_SUMAFIJA, TC_PORCVARIABLE, TC_COSTOFINAL' +
        ' '
      'FROM ATC_TARIFACOBRAR')
    Left = 621
    Top = 25
  end
  object sdqCotizacionesHistoricas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqCotizacionesHistoricasAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT   co_id, co_fechavigencia, co_canttrabajador, co_' +
        'masasalarial, co_nivel,'
      
        '                 co_nrocotizacion || '#39'/'#39' || co_orden nrocotizaci' +
        'on, tc_sumafija, tc_porcvariable, tc_costofinal'
      '            FROM afi.aco_cotizacion, afi.atc_tarifacobrar'
      '           WHERE co_id = tc_idcotizacion'
      '             AND co_cuit = :co_cuit'
      '             AND co_id < :co_id'
      '             AND tc_fechaalta = (SELECT MAX(tc_fechaalta)'
      '                                   FROM afi.atc_tarifacobrar'
      '                                  WHERE tc_idcotizacion = co_id)'
      '        ORDER BY co_nrocotizacion DESC, co_orden DESC)'
      ' WHERE ROWNUM < :cantfilas')
    Left = 677
    Top = 25
    ParamData = <
      item
        DataType = ftString
        Name = 'CO_CUIT'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'CO_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'cantfilas'
        ParamType = ptInput
      end>
  end
  object dsCotizacionesHistoricas: TDataSource
    DataSet = sdqCotizacionesHistoricas
    Left = 705
    Top = 25
  end
  object dsEstablecimientos: TDataSource
    DataSet = sdqEstablecimientos
    Left = 482
    Top = 25
  end
  object sdqEstablecimientos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT   ac_codigo, ac_descripcion, cp_localidadcap, eu_trabajad' +
        'ores, ta_detalle, zg_descripcion'
      
        '    FROM afi.aeu_establecimientos, afi.azg_zonasgeograficas, art' +
        '.ccp_codigopostal, afi.ata_tipoactividad, cac_actividad'
      '   WHERE eu_idzonageografica = zg_id(+)'
      '     AND eu_idlocalidad = cp_id(+)'
      '     AND eu_idtipoactividad = ta_id(+)'
      '     AND eu_idactividad = ac_id(+)'
      '     AND eu_idsolicitud = :idsolicitud'
      '     AND eu_fechabaja IS NULL'
      '     AND eu_idsolicitud > 0'
      'ORDER BY eu_id')
    Left = 454
    Top = 25
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsolicitud'
        ParamType = ptInput
      end>
  end
  object sdqJuicios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqJuiciosAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT   co_id, co_nrocotizacion || '#39'/'#39' || co_orden co_nrocotiza' +
        'cion, co_fechavigencia, co_canttrabajador, co_nivel,'
      
        '         co_masasalarial, tc_sumafija, tc_porcvariable, tc_costo' +
        'final'
      '    FROM afi.aco_cotizacion, afi.atc_tarifacobrar'
      '   WHERE co_id = tc_idcotizacion'
      '     AND co_cuit = :co_cuit'
      '     AND co_id < :co_id'
      '     AND tc_fechaalta = (SELECT MAX(tc_fechaalta)'
      '                           FROM afi.atc_tarifacobrar'
      '                          WHERE tc_idcotizacion = co_id)'
      'ORDER BY co_nrocotizacion DESC')
    Left = 677
    Top = 53
    ParamData = <
      item
        DataType = ftString
        Name = 'CO_CUIT'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'CO_ID'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsJuicios: TDataSource
    DataSet = sdqJuicios
    Left = 705
    Top = 53
  end
  object sdspGetCotizacion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.COTIZACION.GET_VALOR_ONLINE'
    Left = 648
    Top = 53
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NID_CIIU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NMASA_SALARIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NCANT_TRABAJADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NDESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'SERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NSUMA_FIJA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NVARIABLE'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_CAPITAS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_MENSUAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_ANUAL'
        ParamType = ptOutput
      end>
  end
  object sdspGetCotizacionPrevencion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'art.hys.get_cotizacionprevencion'
    Left = 620
    Top = 53
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CANTEMPLEADOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTESTAB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODPROVINCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COSTO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDACTIVIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LICITACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MSGRESULTADO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'SECTOREMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOEMPRESA'
        ParamType = ptInput
      end>
  end
end
