inherited FrmConsultaCarpetas: TFrmConsultaCarpetas
  Left = 57
  Top = 53
  Caption = 'Consulta de Carpetas'
  ClientHeight = 798
  ClientWidth = 934
  Constraints.MinHeight = 420
  Constraints.MinWidth = 820
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnShow = FSFormShow
  ExplicitLeft = 57
  ExplicitTop = 53
  ExplicitWidth = 942
  ExplicitHeight = 828
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 934
    Height = 267
    ExplicitWidth = 934
    ExplicitHeight = 267
    DesignSize = (
      934
      267)
    object pcOpcionesBusquedaCarpeta: TJvPageControl
      Left = -2
      Top = -1
      Width = 1002
      Height = 240
      ActivePage = tsBusquedaSectorUsuario
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ClientBorderWidth = 0
      ExplicitHeight = 242
      object tsBusquedaSectorUsuario: TTabSheet
        Caption = 'Generales'
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          1002
          220)
        object gbOpcionesBusqueda: TGroupBox
          Left = 7
          Top = 0
          Width = 927
          Height = 217
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Opciones de B'#250'squeda '
          TabOrder = 0
          ExplicitHeight = 204
          DesignSize = (
            927
            217)
          object lblSector: TLabel
            Left = 9
            Top = 24
            Width = 35
            Height = 13
            Caption = 'Sector:'
          end
          object lblUsuario: TLabel
            Left = 9
            Top = 50
            Width = 40
            Height = 13
            Caption = 'Usuario:'
          end
          object lblFechaMovimientoDesde: TLabel
            Left = 10
            Top = 75
            Width = 71
            Height = 13
            Caption = 'F. Movimiento:'
          end
          object lblFechaMovimientoHasta: TLabel
            Left = 188
            Top = 75
            Width = 30
            Height = 13
            Caption = 'hasta '
          end
          object Label3: TLabel
            Left = 318
            Top = 75
            Width = 94
            Height = 13
            Caption = 'Est. Legal/Abogado'
          end
          inline fraUsuariosBusqueda: TfraUsuarios
            Left = 90
            Top = 45
            Width = 828
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 90
            ExplicitTop = 45
            ExplicitWidth = 828
            DesignSize = (
              828
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 85
              Width = 743
              DataSource = nil
              ExplicitLeft = 85
              ExplicitWidth = 743
            end
            inherited edCodigo: TPatternEdit
              Width = 81
              ExplicitWidth = 81
            end
          end
          inline fraSectoresBusqueda: TfraCodigoDescripcion
            Left = 90
            Top = 20
            Width = 828
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 90
            ExplicitTop = 20
            ExplicitWidth = 828
            DesignSize = (
              828
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 763
              DataSource = nil
              ExplicitWidth = 763
            end
          end
          object edFechaMovimientoDesde: TDateComboBox
            Left = 91
            Top = 71
            Width = 88
            Height = 21
            TabOrder = 2
          end
          object edFechaMovimientoHasta: TDateComboBox
            Left = 226
            Top = 71
            Width = 88
            Height = 21
            TabOrder = 3
          end
          object gbBusquedaGeneral2: TGroupBox
            Left = 5
            Top = 92
            Width = 912
            Height = 59
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            DesignSize = (
              912
              59)
            object CUIL: TLabel
              Left = 5
              Top = 35
              Width = 23
              Height = 13
              Caption = 'CUIL'
            end
            object lbCUIT: TLabel
              Left = 5
              Top = 15
              Width = 24
              Height = 13
              Caption = 'CUIT'
            end
            inline fraEmpresaCD: TfraEmpresa
              Left = 35
              Top = 10
              Width = 870
              Height = 21
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
              TabStop = True
              ExplicitLeft = 35
              ExplicitTop = 10
              ExplicitWidth = 870
              ExplicitHeight = 21
              DesignSize = (
                870
                21)
              inherited lbContrato: TLabel
                Left = 766
                ExplicitLeft = 766
              end
              inherited edContrato: TIntEdit
                Left = 813
                ExplicitLeft = 813
              end
              inherited cmbRSocial: TArtComboBox
                Width = 631
                DataSource = nil
                ExplicitWidth = 631
              end
            end
            inline fraTrabajadorSiniestroCD: TfraTrabajadorSiniestro
              Left = 35
              Top = 33
              Width = 871
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              ExplicitLeft = 35
              ExplicitTop = 33
              ExplicitWidth = 871
              DesignSize = (
                871
                21)
              inherited lbSiniestro: TLabel
                Left = 705
                ExplicitLeft = 705
              end
              inherited cmbNombre: TArtComboBox
                Width = 618
                DataSource = nil
                ExplicitWidth = 618
              end
              inherited edSiniestro: TSinEdit
                Left = 770
                ExplicitLeft = 770
              end
              inherited ToolBar: TToolBar
                Left = 747
                ExplicitLeft = 747
                inherited tbLimpiar: TToolButton
                  Hint = 'Limpiar'
                  OnClick = fraTrabajadorSiniestroCDtbLimpiarClick
                end
              end
              inherited ImageList: TImageList
                Bitmap = {
                  494C010101003C00400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
                  0000000000000000000000000000848484008484840000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000084848400F7FFFF00A5A5A50084848400000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000084848400F7FFFF00A5A5A500F7FFFF00A5A5A500848484000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000848400A5A5A500F7FFFF00C6C6C600C6DEC600C6C6C6008484
                  8400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000084848400C6C6C600F7FFFF00C6C6C600C6DEC600F7FFFF00A5A5A500F7FF
                  FF00848484000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000008484
                  840084848400F7FFFF00C6C6C600C6DEC600F7FFFF00A5A5A500F7FFFF00A5A5
                  A500C6C6C6008484840000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000008484
                  840084848400C6C6C600C6DEC600F7FFFF00A5A5A500F7FFFF00A5A5A500C6C6
                  C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000008484
                  84008484840084848400C6C6C600A5A5A500F7FFFF00A5A5A500C6C6C600C6C6
                  C600C6C6C6000084840000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000000000A5A5
                  A500A5A5A5008484840084848400F7FFFF00C6C6C600C6C6C600C6C6C600A5A5
                  A500848484000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000000000A5A5
                  A500C6C6C600C6C6C6008484840084848400C6C6C60000848400848484008484
                  8400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000A5A5A500C6C6
                  C600C6C6C600C6C6C60084848400848484008484840084848400000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000A5A5A500C6C6C6008484
                  8400A5A5A5000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000A5A5A500A5A5A50084848400A5A5
                  A500000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000008484840084848400A5A5A5000000
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
          object gbBusquedaGeneral3: TGroupBox
            Left = 5
            Top = 92
            Width = 912
            Height = 82
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            DesignSize = (
              912
              82)
            object Label7: TLabel
              Left = 5
              Top = 15
              Width = 24
              Height = 13
              Caption = 'CUIT'
            end
            object Label8: TLabel
              Left = 5
              Top = 59
              Width = 23
              Height = 13
              Caption = 'CUIL'
            end
            object Label9: TLabel
              Left = 459
              Top = 59
              Width = 48
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Operativo'
            end
            object Label10: TLabel
              Left = 566
              Top = 59
              Width = 51
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'F. Examen'
            end
            object Label12: TLabel
              Left = 722
              Top = 59
              Width = 39
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Carpeta'
            end
            object Label13: TLabel
              Left = 827
              Top = 59
              Width = 16
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '>>'
            end
            inline fraEmpresaAMP: TfraEmpresa
              Left = 32
              Top = 10
              Width = 873
              Height = 21
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
              ExplicitLeft = 32
              ExplicitTop = 10
              ExplicitWidth = 873
              ExplicitHeight = 21
              DesignSize = (
                873
                21)
              inherited lbContrato: TLabel
                Left = 769
                ExplicitLeft = 769
              end
              inherited edContrato: TIntEdit
                Left = 816
                ExplicitLeft = 816
              end
              inherited cmbRSocial: TArtComboBox
                Width = 634
                DataSource = nil
                ExplicitWidth = 634
              end
            end
            inline fraTrabajadorAMP: TfraTrabajador
              Left = 32
              Top = 56
              Width = 426
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ExplicitLeft = 32
              ExplicitTop = 56
              ExplicitWidth = 426
              DesignSize = (
                426
                22)
              inherited cmbNombre: TArtComboBox
                Width = 342
                DataSource = nil
                ExplicitWidth = 342
              end
            end
            object edOperativoAMP: TPeriodoPicker
              Left = 509
              Top = 56
              Width = 53
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 2
              TabStop = True
              Color = clWindow
              Periodo.AllowNull = True
              Periodo.Orden = poAnoMes
              Periodo.Separador = #0
              Periodo.Mes = 0
              Periodo.Ano = 0
              Periodo.MaxPeriodo = '209606'
              Periodo.MinPeriodo = '199606'
              WidthMes = 19
              Separation = 2
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
            end
            object edFechaExamenAMP: TDateComboBox
              Left = 620
              Top = 56
              Width = 101
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 3
            end
            object edCarpetaDesdeAMP: TIntEdit
              Left = 765
              Top = 56
              Width = 62
              Height = 21
              Hint = 'N'#250'mero de Contrato'
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              MaxLength = 0
            end
            object edCarpetaHastaAMP: TIntEdit
              Left = 844
              Top = 56
              Width = 62
              Height = 21
              Hint = 'N'#250'mero de Contrato'
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              MaxLength = 0
            end
          end
          inline fraEstudiosCarpeta: TfraCodigoDescripcion
            Left = 416
            Top = 70
            Width = 503
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            ExplicitLeft = 416
            ExplicitTop = 70
            ExplicitWidth = 503
            DesignSize = (
              503
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 438
              DataSource = nil
              ExplicitWidth = 438
            end
          end
        end
      end
      object tsTipoArchivo: TTabSheet
        Caption = 'Tipo de Carpeta'
        ImageIndex = 1
        DesignSize = (
          1002
          220)
        object gbTipoArchivo: TGroupBox
          Left = 7
          Top = -1
          Width = 927
          Height = 218
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object lblCodigoArchivo: TLabel
            Left = 6
            Top = 15
            Width = 59
            Height = 13
            Caption = 'Nro. Archivo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edCodigoArchivo: TIntEdit
            Left = 70
            Top = 11
            Width = 155
            Height = 21
            TabOrder = 0
            MaxLength = 8
          end
          inline fraFiltroArchivoBusqueda: TfraFiltroArchivo
            Left = 17
            Top = 39
            Width = 594
            Height = 108
            VertScrollBar.Visible = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ExplicitLeft = 17
            ExplicitTop = 39
            ExplicitWidth = 594
            ExplicitHeight = 108
            inherited pcFormulario: TJvPageControl
              Width = 594
              ExplicitWidth = 594
              inherited tsNone: TTabSheet
                ExplicitWidth = 594
              end
              inherited tsCuit: TTabSheet
                inherited fraEmpresaCUIT: TfraEmpresa
                  Width = 539
                  ExplicitWidth = 539
                  DesignSize = (
                    539
                    21)
                  inherited lbContrato: TLabel
                    Left = 444
                    ExplicitLeft = 444
                  end
                  inherited edContrato: TIntEdit
                    Left = 489
                    ExplicitLeft = 489
                  end
                  inherited cmbRSocial: TArtComboBox
                    Width = 309
                    DataSource = nil
                    ExplicitWidth = 309
                  end
                end
              end
              inherited tsSiniestro: TTabSheet
                ExplicitWidth = 526
                ExplicitHeight = 84
                inherited lblFechaSiniestro: TLabel
                  Left = 419
                  ExplicitLeft = 419
                end
                inherited lbRSocial: TLabel
                  FocusControl = fraFiltroArchivoBusqueda.fraEmpresaSiniestro.cmbRSocial
                end
                inherited fraEmpresaSiniestro: TfraEmpresa
                  Width = 539
                  ExplicitWidth = 539
                  DesignSize = (
                    539
                    21)
                  inherited lbContrato: TLabel
                    Left = 435
                    ExplicitLeft = 435
                  end
                  inherited edContrato: TIntEdit
                    Left = 481
                    ExplicitLeft = 481
                  end
                  inherited cmbRSocial: TArtComboBox
                    Width = 300
                    DataSource = nil
                    ExplicitWidth = 300
                  end
                end
                inherited edFechaSiniestro: TDateComboBox
                  Left = 494
                  Width = 96
                  ExplicitLeft = 494
                  ExplicitWidth = 96
                end
                inherited fraTrabajadorSiniestro: TfraTrabajador
                  Width = 362
                  ExplicitWidth = 362
                  DesignSize = (
                    362
                    22)
                  inherited cmbNombre: TArtComboBox
                    Width = 276
                    DataSource = nil
                    ExplicitWidth = 276
                  end
                end
              end
              inherited tsTipoNumero: TTabSheet
                inherited fraCodDescTipo: TfraCodigoDescripcion
                  Width = 418
                  ExplicitWidth = 418
                  DesignSize = (
                    418
                    23)
                  inherited cmbDescripcion: TArtComboBox
                    Width = 353
                    DataSource = nil
                    ExplicitWidth = 353
                  end
                end
              end
              inherited tsNumero: TTabSheet
                inherited edInfoAdicionalNro: TMemo
                  Width = 538
                  ExplicitWidth = 538
                end
              end
              inherited tsJuicio: TTabSheet
                inherited fraJuicio: TfraArchJuicio
                  Width = 540
                  ExplicitWidth = 540
                  DesignSize = (
                    540
                    23)
                  inherited cmbDescripcion: TArtComboBox
                    Width = 475
                    DataSource = nil
                    ExplicitWidth = 475
                  end
                end
              end
              inherited tsCuitEstableci: TTabSheet
                inherited fraEmpresaEmpresa: TfraEmpresa
                  Width = 541
                  ExplicitWidth = 541
                  DesignSize = (
                    541
                    21)
                  inherited lbContrato: TLabel
                    Left = 439
                    ExplicitLeft = 439
                  end
                  inherited edContrato: TIntEdit
                    Left = 484
                    ExplicitLeft = 484
                  end
                  inherited cmbRSocial: TArtComboBox
                    Width = 302
                    DataSource = nil
                    ExplicitWidth = 302
                  end
                end
              end
              inherited tsBiblioratoNota: TTabSheet
                inherited lbCUIT: TLabel
                  FocusControl = fraFiltroArchivoBusqueda.fraEmpresaNota.mskCUIT
                end
                inherited fraEmpresaNota: TfraEmpresa
                  Width = 539
                  ExplicitWidth = 539
                  DesignSize = (
                    539
                    21)
                  inherited lbContrato: TLabel
                    Left = 437
                    ExplicitLeft = 437
                  end
                  inherited edContrato: TIntEdit
                    Left = 481
                    ExplicitLeft = 481
                  end
                  inherited cmbRSocial: TArtComboBox
                    Width = 302
                    DataSource = nil
                    ExplicitWidth = 302
                  end
                end
                inherited edObservaciones: TEdit
                  Width = 539
                  ExplicitWidth = 539
                end
              end
              inherited tsFecha: TTabSheet
                ExplicitWidth = 526
                ExplicitHeight = 84
              end
              inherited tsProveedor: TTabSheet
                inherited fraProveedor: TfraProveedor
                  Width = 577
                  ExplicitWidth = 577
                  DesignSize = (
                    577
                    25)
                  inherited cmbDescripcion: TArtComboBox
                    Width = 280
                    DataSource = nil
                    ExplicitWidth = 280
                  end
                end
              end
              inherited tsEntidadVendedor: TTabSheet
                inherited fraEntidadCUIT: TfraEntidadCUIT
                  inherited cmbDescripcion: TArtComboBox
                    DataSource = nil
                  end
                end
                inherited fraVendedorCUIT: TfraVendedoresCUIT
                  inherited cmbDescripcion: TArtComboBox
                    DataSource = nil
                  end
                end
              end
              inherited tsVendedor: TTabSheet
                inherited fraVendedoresCUIT: TfraVendedoresCUIT
                  inherited cmbDescripcion: TArtComboBox
                    DataSource = nil
                  end
                end
              end
              inherited tsTrabajador: TTabSheet
                inherited fraTrabajad: TfraTrabajador
                  inherited cmbNombre: TArtComboBox
                    DataSource = nil
                  end
                end
              end
              inherited tsEmpresaTrab: TTabSheet
                inherited fraEmpresaTrab: TfraEmpresa
                  inherited cmbRSocial: TArtComboBox
                    DataSource = nil
                  end
                end
                inherited fraTrabajadorTrab: TfraTrabajador
                  inherited cmbNombre: TArtComboBox
                    DataSource = nil
                  end
                end
              end
              inherited tsExtractoBanc: TTabSheet
                ExplicitWidth = 526
                ExplicitHeight = 84
                inherited fraBancoExtracto: TfraStaticCodigoDescripcion
                  inherited cmbDescripcion: TComboGrid
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
                inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
                  inherited cmbDescripcion: TComboGrid
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
              inherited tsAnioPeriodo: TTabSheet
                ExplicitWidth = 526
                ExplicitHeight = 84
              end
              inherited tsCBU: TTabSheet
                inherited fraCuentaPago: TfraCodigoDescripcion
                  inherited cmbDescripcion: TArtComboBox
                    DataSource = nil
                  end
                end
              end
              inherited tsPrestador: TTabSheet
                inherited fraPrestador: TfraPrestador
                  inherited cmbPrestFantasia: TArtComboBox
                    DataSource = nil
                  end
                  inherited cmbPrestador: TArtComboBox
                    DataSource = nil
                  end
                end
              end
              inherited tsTexto: TTabSheet
                ExplicitWidth = 526
                ExplicitHeight = 84
              end
            end
            inherited pnSeleccionArchivo: TPanel
              Width = 594
              ExplicitWidth = 594
              DesignSize = (
                594
                24)
              inherited btnCargarCodigoBarras: TJvXPButton
                Left = 499
                ExplicitLeft = 499
              end
              inherited fraTipoArchivo: TfraCodDesc
                Width = 440
                ExplicitWidth = 440
                DesignSize = (
                  440
                  23)
                inherited cmbDescripcion: TArtComboBox
                  Width = 377
                  DataSource = nil
                  ExplicitWidth = 377
                end
              end
            end
            inherited ImageList: TImageList
              Bitmap = {
                494C010101004000480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                0000000000003600000028000000400000001000000001002000000000000010
                0000000000000000000000000000000000000000000000000000EFEFEF00CECE
                CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0073635A007373
                73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
                FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF00E7E7E700BDBDBD005A5A
                630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000AD390800CE421800E7523100F763
                4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
                B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000C6421000EF5A4200FF6B5A00FF7B
                6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
                B500A5847B00847B7B00F7F7F700000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000AD421000FF6B5200FF846300FF94
                7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
                DE00FFFFEF00E7CEC60073737300FFFFFF000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000DEDEDE00CE4A2100FF8C7300BD4A
                1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
                EF00FFFFFF00FFFFF700AD7B7300DEDEDE000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF00B5B5B5005A2100000008
                6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
                EF00FFFFEF00FFFFDE00EFD6B500ADADAD000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000004242420008080800000000001039
                A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
                D600FFFFDE00FFFFD600EFD6AD00A5A5A5000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000101010001818180010398C00185A
                BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
                BD00FFF7BD00FFFFCE00C6948400D6D6D6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000212121002929290018529C002173
                DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
                A500FFF7C600FFD6AD005A525200FFFFFF000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000292929003939390000101800319C
                FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
                B500EFBDA500635A5A00EFEFEF00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000080808004A4A4A00525252001818
                1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
                B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000C6C6C600424242006B6B6B008C8C
                8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
                7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000424D3E000000000000003E000000
                2800000040000000100000000100010000000000800000000000000000000000
                000000000000000000000000FFFFFF00C3FF00000000000081FF000000000000
                80FF000000000000007F00000000000000030000000000000001000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000010000000000000003000000000000
                00FF00000000000001FF00000000000000000000000000000000000000000000
                000000000000}
            end
          end
          object chkEnResguardo: TCheckBox
            Left = 417
            Top = 13
            Width = 88
            Height = 17
            Caption = 'En Resguardo'
            TabOrder = 1
          end
        end
      end
      object tsSolicitud: TTabSheet
        Caption = 'Solicitudes'
        ImageIndex = 2
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 222
        DesignSize = (
          1002
          220)
        object gbSolicitud: TGroupBox
          Left = 3
          Top = 2
          Width = 927
          Height = 216
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          DesignSize = (
            927
            216)
          object ChkGrp: TCheckGroup
            Left = 5
            Top = 51
            Width = 96
            Height = 117
            Caption = 'Tipo de Solicitud'
            TabOrder = 2
            Items.Strings = (
              '&2 Horas'
              '&4 Horas'
              '&24 &Horas')
            Value = '000'
          end
          object rgEstado: TRadioGroup
            Left = 106
            Top = 51
            Width = 501
            Height = 117
            Hint = 
              'Pendiente de  Envio. La solicitud de carpeta por parte del usuar' +
              'io no ha sido '#13#10'                                  cursada a la A' +
              'dministradora aun.'#13#10'Pendiente de Recepci'#243'n. La solicitud a sido ' +
              'cursada a la Administradora'#13#10'                                   ' +
              '      pero aun no se a recibido.'#13#10'Pendiente de Devoluci'#243'n El usu' +
              'ario ha solicitado se retire la carpeta pero el'#13#10'               ' +
              '                          la devoluci'#243'n aun no se completa.'#13#10'Tod' +
              'os. Todos los estados posibles.'
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Estado'
            ItemIndex = 4
            Items.Strings = (
              'Pendientes de Envio &Solicitud'
              'Pendientes de &Recepci'#243'n y Entrega a Destinatario'
              'Pendiente de &Devoluci'#243'n desde Destinatario'
              'Pendiente de Devoluci'#243'n desde Destinatario y &Entrega a Usuario'
              'T&odos')
            TabOrder = 3
          end
          object gbFechaSolicitud: TGroupBox
            Left = 612
            Top = 51
            Width = 145
            Height = 66
            Anchors = [akTop, akRight]
            Caption = ' Fecha de Solicitud '
            TabOrder = 4
            object lblFechaSolicitudDesde: TLabel
              Left = 9
              Top = 18
              Width = 37
              Height = 13
              Caption = 'Desde: '
            end
            object lblFechaSolicitudHasta: TLabel
              Left = 9
              Top = 41
              Width = 32
              Height = 13
              Caption = 'Hasta:'
            end
            object edtFechaDesde: TDateComboBox
              Left = 49
              Top = 14
              Width = 88
              Height = 21
              TabOrder = 0
            end
            object edtFechaHasta: TDateComboBox
              Left = 49
              Top = 37
              Width = 88
              Height = 21
              TabOrder = 1
            end
          end
          object gbUbicacion: TGroupBox
            Left = 612
            Top = 117
            Width = 309
            Height = 96
            Anchors = [akTop, akRight]
            Caption = ' Ubicaci'#243'n '
            TabOrder = 6
            object cbGuardaDigitalizacion: TCheckBox
              Left = 9
              Top = 13
              Width = 102
              Height = 17
              Caption = 'Administradora'
              TabOrder = 0
            end
            object cbUsuario: TCheckBox
              Left = 9
              Top = 44
              Width = 102
              Height = 17
              Caption = 'Usuario'
              TabOrder = 2
            end
            object cbOtrasUbic: TCheckBox
              Left = 159
              Top = 7
              Width = 145
              Height = 29
              Caption = 'Otras Ubicaciones (Extrav., Anuladas, etc.)'
              TabOrder = 1
              WordWrap = True
            end
            object cbDyG: TCheckBox
              Left = 159
              Top = 37
              Width = 145
              Height = 29
              Caption = 'Digitalizaci'#243'n y Guarda (Pend. Generar Remito)'
              TabOrder = 3
              WordWrap = True
            end
            object cbExtraviadas: TCheckBox
              Left = 9
              Top = 73
              Width = 102
              Height = 17
              Caption = 'Solo Extraviadas'
              TabOrder = 4
            end
          end
          object gbEstado: TGroupBox
            Left = 761
            Top = 51
            Width = 160
            Height = 66
            Anchors = [akTop, akRight]
            Caption = 'Estado'
            TabOrder = 5
            object cbPendienteDevolucion: TCheckBox
              Left = 9
              Top = 13
              Width = 145
              Height = 17
              Hint = 'El plazo establecido para devolver '#13#10'la carpeta se ha vencido'
              Caption = 'Plazo Devol. Excedido'
              TabOrder = 0
            end
            object cbSolicitadoOtroUsuario: TCheckBox
              Left = 9
              Top = 29
              Width = 145
              Height = 17
              Caption = 'Solicitado Otro Usuario'
              TabOrder = 1
            end
            object cbConMotivoRetencion: TCheckBox
              Left = 9
              Top = 45
              Width = 145
              Height = 17
              Caption = 'Con Motivo de Retenci'#243'n'
              TabOrder = 2
            end
          end
          object cbSoloUltimaSolicitud: TCheckBox
            Left = 14
            Top = 172
            Width = 215
            Height = 17
            Caption = 'Carpetas solo con Ultima Solicitud/Devol.'
            Checked = True
            State = cbChecked
            TabOrder = 7
          end
          object GroupBox1: TGroupBox
            Left = 359
            Top = 167
            Width = 248
            Height = 45
            Anchors = [akTop, akRight]
            Caption = ' Carpetas Extraviadas'
            TabOrder = 9
            object Label21: TLabel
              Left = 6
              Top = 22
              Width = 29
              Height = 13
              Caption = 'Fecha'
            end
            object Label23: TLabel
              Left = 133
              Top = 22
              Width = 16
              Height = 13
              Caption = '>>'
            end
            object edFExtraviadaDesde: TDateComboBox
              Left = 40
              Top = 18
              Width = 89
              Height = 21
              MaxDateCombo = edFExtraviadaHasta
              TabOrder = 0
            end
            object edFExtraviadaHasta: TDateComboBox
              Left = 151
              Top = 18
              Width = 89
              Height = 21
              MinDateCombo = edFExtraviadaDesde
              TabOrder = 1
            end
          end
          object gbUsuario: TGroupBox
            Left = 5
            Top = 6
            Width = 602
            Height = 45
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Usuario'
            TabOrder = 0
            DesignSize = (
              602
              45)
            inline fraUsuariosSolicitud: TfraUsuarios
              Left = 6
              Top = 14
              Width = 592
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 6
              ExplicitTop = 14
              ExplicitWidth = 592
              DesignSize = (
                592
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 85
                Width = 502
                DataSource = nil
                ExplicitLeft = 85
                ExplicitWidth = 502
              end
              inherited edCodigo: TPatternEdit
                Width = 81
                ExplicitWidth = 81
              end
            end
          end
          object gbFechaRecepcion: TGroupBox
            Left = 613
            Top = 6
            Width = 308
            Height = 45
            Anchors = [akTop, akRight]
            Caption = 'Fecha de Recepci'#243'n'
            TabOrder = 1
            object Label29: TLabel
              Left = 9
              Top = 22
              Width = 29
              Height = 13
              Caption = 'Fecha'
            end
            object Label30: TLabel
              Left = 164
              Top = 22
              Width = 16
              Height = 13
              Caption = '>>'
            end
            object edtFechaRecepDesde: TDateComboBox
              Left = 55
              Top = 18
              Width = 89
              Height = 21
              MaxDateCombo = edtFechaRecepHasta
              TabOrder = 0
            end
            object edtFechaRecepHasta: TDateComboBox
              Left = 200
              Top = 18
              Width = 89
              Height = 21
              MinDateCombo = edtFechaRecepDesde
              TabOrder = 1
            end
          end
          object cbSolicitudesCanceladas: TCheckBox
            Left = 14
            Top = 189
            Width = 215
            Height = 17
            Caption = 'Solo Solicitudes Canceladas'
            TabOrder = 8
          end
        end
      end
      object tsRemito: TTabSheet
        Caption = 'Remitos de Devoluci'#243'n'
        ImageIndex = 3
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          1002
          220)
        object gbRemito: TGroupBox
          Left = 7
          Top = 3
          Width = 927
          Height = 214
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitHeight = 201
          object Label14: TLabel
            Left = 6
            Top = 16
            Width = 93
            Height = 13
            Caption = 'F. Generac. Remito'
          end
          object Label15: TLabel
            Left = 196
            Top = 17
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object Label16: TLabel
            Left = 6
            Top = 42
            Width = 93
            Height = 13
            AutoSize = False
            Caption = 'N'#186' Remito'
          end
          object Label17: TLabel
            Left = 196
            Top = 42
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object lblNroCaja: TLabel
            Left = 6
            Top = 65
            Width = 93
            Height = 13
            AutoSize = False
            Caption = 'N'#186' Caja'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 196
            Top = 67
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object edFechaRemitoDesde: TDateComboBox
            Left = 103
            Top = 13
            Width = 89
            Height = 21
            MaxDateCombo = edFechaRemitoHasta
            TabOrder = 0
          end
          object edFechaRemitoHasta: TDateComboBox
            Left = 214
            Top = 13
            Width = 89
            Height = 21
            MinDateCombo = edFechaRemitoDesde
            TabOrder = 1
          end
          object edRemitoDesde: TIntEdit
            Left = 103
            Top = 38
            Width = 89
            Height = 21
            TabOrder = 2
          end
          object edRemitoHasta: TIntEdit
            Left = 214
            Top = 38
            Width = 89
            Height = 21
            TabOrder = 3
          end
          object cbRemitoGenerado: TCheckBox
            Left = 7
            Top = 88
            Width = 141
            Height = 19
            Caption = 'Solo Remitos Generados'
            TabOrder = 6
            WordWrap = True
          end
          object edNroCajaDesde: TIntEdit
            Left = 103
            Top = 63
            Width = 89
            Height = 21
            TabOrder = 4
            MaxLength = 8
          end
          object edNroCajaHasta: TIntEdit
            Left = 214
            Top = 63
            Width = 89
            Height = 21
            TabOrder = 5
            MaxLength = 8
          end
        end
      end
      object tsEstadoCarpeta: TTabSheet
        Caption = 'Estado de la Carpeta'
        ImageIndex = 4
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          1002
          220)
        object gbEstadoCarpeta: TGroupBox
          Left = 7
          Top = 3
          Width = 927
          Height = 214
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitHeight = 201
          DesignSize = (
            927
            214)
          object Label24: TLabel
            Left = 6
            Top = 41
            Width = 79
            Height = 13
            AutoSize = False
            Caption = 'Fecha Estado'
          end
          object Label25: TLabel
            Left = 196
            Top = 42
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object Label26: TLabel
            Left = 6
            Top = 68
            Width = 79
            Height = 13
            AutoSize = False
            Caption = 'Estado'
          end
          object Label27: TLabel
            Left = 6
            Top = 17
            Width = 79
            Height = 13
            AutoSize = False
            Caption = 'Fecha Solicitud'
          end
          object Label28: TLabel
            Left = 195
            Top = 17
            Width = 16
            Height = 13
            Caption = '>>'
          end
          object Label31: TLabel
            Left = 6
            Top = 89
            Width = 79
            Height = 13
            AutoSize = False
            Caption = 'Usuario Estado'
          end
          object edFechaEstadoDesde: TDateComboBox
            Left = 103
            Top = 38
            Width = 89
            Height = 21
            MaxDateCombo = edFechaEstadoHasta
            TabOrder = 3
          end
          object edFechaEstadoHasta: TDateComboBox
            Left = 214
            Top = 38
            Width = 89
            Height = 21
            MinDateCombo = edFechaEstadoDesde
            TabOrder = 4
          end
          object cmbEstadosCarpeta: TDBCheckCombo
            Left = 103
            Top = 63
            Width = 815
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            ItemsSeparator = ';'
            DataSource = dsEstado
            KeyField = 'TB_CODIGO'
            ListField = 'TB_DESCRIPCION'
          end
          object chkSoloCarpetasUsuLog: TCheckBox
            Left = 314
            Top = 16
            Width = 210
            Height = 15
            Caption = 'Solicitada Solo por el Usuario Logueado'
            TabOrder = 2
            WordWrap = True
          end
          object edFechaSolicitudDesde: TDateComboBox
            Left = 103
            Top = 13
            Width = 89
            Height = 21
            MaxDateCombo = edFechaSolicitudHasta
            TabOrder = 0
          end
          object edFechaSolicitudHasta: TDateComboBox
            Left = 214
            Top = 13
            Width = 89
            Height = 21
            MinDateCombo = edFechaSolicitudDesde
            TabOrder = 1
          end
          object chkSoloCarpetasPendRecepGyD: TCheckBox
            Left = 6
            Top = 113
            Width = 248
            Height = 15
            Caption = 'Carpetas Pendientes de Recepci'#243'n desde GyD'
            TabOrder = 7
            WordWrap = True
          end
          object chkSoloCarpetasPendDevolGyD: TCheckBox
            Left = 6
            Top = 131
            Width = 248
            Height = 15
            Caption = 'Carpetas Pendientes de Devoluci'#243'n a GyD'
            TabOrder = 8
            WordWrap = True
          end
          inline fraUsuEstadoCarpeta: TfraUsuarios
            Left = 102
            Top = 86
            Width = 816
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            ExplicitLeft = 102
            ExplicitTop = 86
            ExplicitWidth = 816
            DesignSize = (
              816
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 85
              Width = 730
              DataSource = nil
              ExplicitLeft = 85
              ExplicitWidth = 730
            end
            inherited edCodigo: TPatternEdit
              Width = 81
              ExplicitWidth = 81
            end
          end
        end
      end
    end
    object gbLeyenda: TGroupBox
      Left = 4
      Top = 236
      Width = 929
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        929
        29)
      object lblReferenciaPeriodoEstimado: TLabel
        Left = 27
        Top = 10
        Width = 96
        Height = 13
        Caption = 'Solicitado Pendiente'
      end
      object lblReferenciaPeriodoRecalculo: TLabel
        Left = 145
        Top = 10
        Width = 91
        Height = 13
        Caption = 'Vencido Plazo Dev.'
      end
      object lblExcedidoPlazoEntrega: TLabel
        Left = 257
        Top = 10
        Width = 112
        Height = 13
        Caption = 'Excedido Plazo Entrega'
      end
      object lblObsGD: TLabel
        Left = 391
        Top = 10
        Width = 147
        Height = 13
        Caption = 'Observac. GyD todo Concepto'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 562
        Top = 10
        Width = 67
        Height = 13
        Caption = 'En Resguardo'
      end
      object pnColorSolicitadoPendiente: TPanel
        Left = 6
        Top = 11
        Width = 16
        Height = 12
        BevelOuter = bvLowered
        Color = 14811135
        TabOrder = 0
      end
      object pnColorVencidoPlazoDevolucion: TPanel
        Left = 125
        Top = 11
        Width = 16
        Height = 12
        BevelOuter = bvLowered
        Color = 7314361
        TabOrder = 1
      end
      object pnColorExcedidoPlazoEntrega: TPanel
        Left = 237
        Top = 11
        Width = 16
        Height = 12
        BevelOuter = bvLowered
        Color = 14269862
        TabOrder = 2
      end
      object pnlSeleccionados: TPanel
        Left = 767
        Top = 7
        Width = 159
        Height = 20
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Seleccionados: '
        TabOrder = 3
        object edCantSelecc: TCardinalEdit
          Left = 107
          Top = 0
          Width = 51
          Height = 19
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 372
        Top = 11
        Width = 16
        Height = 12
        BevelOuter = bvLowered
        Color = clWindow
        TabOrder = 4
      end
      object pnColorEnResguardo: TPanel
        Left = 541
        Top = 11
        Width = 16
        Height = 12
        BevelOuter = bvLowered
        Color = 14811135
        TabOrder = 5
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 267
    Width = 934
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 928
      end>
    ExplicitTop = 267
    ExplicitWidth = 934
    inherited ToolBar: TToolBar
      Width = 919
      ButtonWidth = 28
      HotImages = ilColor
      Images = ilByN
      ExplicitWidth = 919
      inherited tbRefrescar: TToolButton
        ExplicitWidth = 28
      end
      inherited ToolButton5: TToolButton
        Left = 28
        ExplicitLeft = 28
      end
      inherited tbNuevo: TToolButton
        Left = 36
        Visible = True
        ExplicitLeft = 36
        ExplicitWidth = 28
      end
      inherited tbModificar: TToolButton
        Left = 64
        Hint = 'Modificar Observaciones Caja (Ctrl+M)'
        Visible = True
        OnClick = tbModificarClick
        ExplicitLeft = 64
        ExplicitWidth = 28
      end
      inherited tbEliminar: TToolButton
        Left = 92
        Hint = 'Cancelaci'#243'n de Solicitud'
        Visible = True
        OnClick = tbEliminarClick
        ExplicitLeft = 92
        ExplicitWidth = 28
      end
      inherited ToolButton4: TToolButton
        Left = 120
        Visible = True
        ExplicitLeft = 120
      end
      inherited tbPropiedades: TToolButton
        Left = 128
        Hint = 'Ver Detalles de la Carpeta'
        Visible = True
        OnClick = tbPropiedadesClick
        ExplicitLeft = 128
        ExplicitWidth = 28
      end
      inherited ToolButton3: TToolButton
        Left = 156
        Visible = False
        ExplicitLeft = 156
      end
      inherited tbLimpiar: TToolButton
        Left = 164
        ExplicitLeft = 164
        ExplicitWidth = 28
      end
      inherited tbOrdenar: TToolButton
        Left = 192
        ExplicitLeft = 192
        ExplicitWidth = 28
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 220
        Visible = True
        ExplicitLeft = 220
        ExplicitWidth = 28
      end
      inherited ToolButton6: TToolButton
        Left = 248
        ExplicitLeft = 248
      end
      inherited tbImprimir: TToolButton
        Left = 256
        DropdownMenu = pmnuImpresion
        Enabled = True
        Style = tbsDropDown
        ExplicitLeft = 256
        ExplicitWidth = 43
      end
      inherited tbExportar: TToolButton
        Left = 299
        Enabled = True
        ExplicitLeft = 299
        ExplicitWidth = 28
      end
      inherited tbEnviarMail: TToolButton
        Left = 327
        Enabled = True
        ExplicitLeft = 327
        ExplicitWidth = 28
      end
      inherited ToolButton8: TToolButton
        Left = 355
        ExplicitLeft = 355
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 363
        ExplicitLeft = 363
        ExplicitWidth = 28
      end
      inherited tbMaxRegistros: TToolButton
        Left = 391
        Visible = False
        ExplicitLeft = 391
        ExplicitWidth = 28
      end
      inherited ToolButton11: TToolButton
        Left = 419
        ExplicitLeft = 419
      end
      inherited tbSalir: TToolButton
        Left = 427
        Visible = False
        ExplicitLeft = 427
        ExplicitWidth = 28
      end
      object tbVerImagenes: TToolButton
        Left = 455
        Top = 0
        Hint = 'Visualizar Im'#225'genes'
        ImageIndex = 51
        OnClick = tbVerImagenesClick
      end
      object tbDetallesMultCarpetas: TToolButton
        Left = 483
        Top = 0
        Hint = 'Ver Detalles de M'#250'ltiples Carpetas'
        ImageIndex = 41
        OnClick = tbDetallesMultCarpetasClick
      end
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Wrap = True
        Style = tbsSeparator
      end
      object tbSolicitarCarpeta: TToolButton
        Left = 0
        Top = 30
        Hint = 'Solicitar el Envio de la Carpeta'
        DropdownMenu = pmSolicitarCarpetas
        ImageIndex = 54
        Style = tbsDropDown
        OnClick = tbSolicitarCarpetaClick
      end
      object tbObservacionesSolicitud: TToolButton
        Left = 43
        Top = 30
        Hint = 'Observaci'#243'n GyD por todo Concepto'
        ImageIndex = 55
        OnClick = tbObservacionesSolicitudClick
      end
      object tbAgregarCuerpos: TToolButton
        Left = 71
        Top = 30
        Hint = 'Cargar Cantidad de Cuerpos'
        ImageIndex = 16
        OnClick = tbAgregarCuerposClick
      end
      object tbEnviarSolicitudes: TToolButton
        Left = 99
        Top = 30
        Hint = 'Envio de Solicitudes'
        ImageIndex = 31
        OnClick = tbEnviarSolicitudesClick
      end
      object tbModificarCajas: TToolButton
        Left = 127
        Top = 30
        Hint = 'Modificar Contenido de Cajas'
        ImageIndex = 40
        OnClick = tbModificarCajasClick
      end
      object tbSeparador1: TToolButton
        Left = 155
        Top = 30
        Width = 8
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbRecepcionCarpetas: TToolButton
        Left = 163
        Top = 30
        Hint = 'Recepci'#243'n de Carpetas de la Administradora/Usuario'
        ImageIndex = 15
        OnClick = tbRecepcionCarpetasClick
      end
      object tbDevolucionCarpetas: TToolButton
        Left = 191
        Top = 30
        Hint = 'Devoluciones de Carpetas'
        DropdownMenu = pmnuDevolCarpetas
        ImageIndex = 22
        Style = tbsDropDown
        OnClick = tbDevolucionCarpetasClick
      end
      object tbMovimientoCarpetas: TToolButton
        Left = 234
        Top = 30
        Hint = 'Movimiento de Carpetas'
        ImageIndex = 13
        OnClick = tbMovimientoCarpetasClick
      end
      object tbReemplazoCarpetas: TToolButton
        Left = 262
        Top = 30
        Hint = 'Reemplazo de Carpetas'
        ImageIndex = 32
        OnClick = tbReemplazoCarpetasClick
      end
      object ToolButton7: TToolButton
        Left = 290
        Top = 30
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbBuscarCodigoBarras: TToolButton
        Left = 298
        Top = 30
        Hint = 'Buscar C'#243'digo de Barras - Clave Carpeta (F4)'
        ImageIndex = 14
        OnClick = tbBuscarCodigoBarrasClick
      end
      object tbCargaMasiva: TToolButton
        Left = 326
        Top = 30
        Hint = 'Carga (B'#250'squeda) Masiva de Carpetas'
        ImageIndex = 21
        OnClick = tbCargaMasivaClick
      end
      object ToolButton9: TToolButton
        Left = 354
        Top = 30
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbCarpetasSolicUsuarios: TToolButton
        Left = 362
        Top = 30
        Hint = 'Recepci'#243'n/Devoluci'#243'n de Carpetas por el Usuario'
        DropdownMenu = pmnuCarpetasSolicUsu
        ImageIndex = 47
        Style = tbsDropDown
        OnClick = tbCarpetasSolicUsuariosClick
      end
      object ToolButton1: TToolButton
        Left = 405
        Top = 30
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 413
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 296
    Width = 934
    Height = 502
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmnuGrilla
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyUp = GridKeyUp
    OnGetCellParams = GridGetCellParams
    TitleHeight = 32
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Tipo Archivo'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_DESCRIPCIONCLAVE'
        Title.Caption = 'Clave'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOUBICACION'
        Title.Caption = 'Tipo Ubicaci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UBICACION'
        Title.Caption = 'Ubicaci'#243'n'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_FECHAMOVIMIENTO'
        Title.Caption = 'F. Movimiento'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_CAJA'
        Title.Caption = 'Caja'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHARECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHADEVOLUCION'
        Title.Caption = 'F. Devoluci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHAPREVISTADEVOLUCION'
        Title.Caption = 'F. Prevista Dev.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_EMISOR'
        Title.Caption = 'Emisor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_RECEPTOR'
        Title.Caption = 'Receptor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUARIOSOLICITUD'
        Title.Caption = 'Usuario Solicitud'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_TIPOSOLICITUD'
        Title.Caption = 'Tipo Solicitud'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHASOLICITUD'
        Title.Caption = 'Fecha Solicitud'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_OBSERVACIONES'
        Title.Caption = 'Observaciones Solicitud'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_OBSERVACPENDIENTE'
        Title.Caption = 'Observaciones GyD por todo Concepto'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATOCD'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato Carta Doc.'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROEXPEDIENTECD'
        Title.Alignment = taCenter
        Title.Caption = 'Expediente Carta Doc.'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIOLEG'
        Title.Caption = 'Estudio Legal / Abogado'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_OBSERVACIONES'
        Title.Caption = 'Observaciones Carpeta'
        Width = 236
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHAMOTIVORETENCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Retenci'#243'n'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_MOTIVORETENCION'
        Title.Caption = 'Motivo Retenci'#243'n'
        Width = 295
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREEMPR'
        Title.Caption = 'Empresa'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROESTABLECI'
        Title.Alignment = taCenter
        Title.Caption = 'Est.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREESTABLECI'
        Title.Caption = 'Nombre Establecimiento'
        Width = 197
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRETRAB'
        Title.Caption = 'Trabajador'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AR_CANTCUERPOS'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Cuerpos'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDREMITODEVOL'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Remito Devol.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FALTAREMITODEVOL'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta Remito Devol.'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FBAJAREMITODEVOL'
        Title.Caption = 'F. Baja Remito Devol.'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LISTACODUBICCARPETAS'
        Title.Caption = 'Ubic. en Administradora'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRESTADOCARPETA'
        Title.Caption = 'Estado'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUESTADOCARPETA'
        Title.Caption = 'Usuario Estado'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAESTADOCARPETA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Estado'
        Width = 80
        Visible = True
      end>
  end
  object fpDevolucionCarpetas: TFormPanel [3]
    Left = 188
    Top = 331
    Width = 620
    Height = 440
    Caption = 'Devoluci'#243'n de Carpetas del Usuario'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpDevolucionCarpetasEnter
    object Label2: TLabel
      Left = 11
      Top = 416
      Width = 70
      Height = 13
      Caption = 'Cant. Carpetas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 145
      Width = 71
      Height = 13
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 13
      Top = 121
      Width = 37
      Height = 13
      Caption = 'N'#186' Caja'
    end
    object Label18: TLabel
      Left = 169
      Top = 121
      Width = 70
      Height = 13
      Caption = 'Cant. Cuerpos'
    end
    object btnAceptarDevol: TBitBtn
      Left = 425
      Top = 411
      Width = 90
      Height = 26
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
      TabOrder = 6
      OnClick = btnAceptarDevolClick
    end
    object btnCancelarDevol: TBitBtn
      Left = 519
      Top = 411
      Width = 90
      Height = 26
      Caption = '&Salir'
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
      TabOrder = 7
      OnClick = btnCancelarDevolClick
    end
    object GridDevolCarpeta: TDBGrid
      Left = 12
      Top = 234
      Width = 596
      Height = 172
      DataSource = dsDevolCarpeta
      TabOrder = 5
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TA_DESCRIPCION'
          Width = 224
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AR_DESCRIPCIONCLAVE'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AR_CAJA'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Caja'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AR_CANTCUERPOS'
          Title.Alignment = taCenter
          Title.Caption = 'Cant. Cuerpos'
          Width = 76
          Visible = True
        end>
    end
    object edCantCarpetasDevol: TIntEdit
      Left = 86
      Top = 414
      Width = 91
      Height = 21
      TabStop = False
      TabOrder = 8
      MaxLength = 8
    end
    inline fraFiltroArchivoDevolCarpeta: TfraFiltroArchivo
      Left = 8
      Top = 8
      Width = 600
      Height = 108
      VertScrollBar.Visible = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 600
      ExplicitHeight = 108
      inherited pcFormulario: TJvPageControl
        Width = 600
        ExplicitWidth = 600
        inherited tsNone: TTabSheet
          ExplicitWidth = 600
        end
        inherited tsCuit: TTabSheet
          inherited fraEmpresaCUIT: TfraEmpresa
            Width = 545
            ExplicitWidth = 545
            DesignSize = (
              545
              21)
            inherited lbContrato: TLabel
              Left = 450
              ExplicitLeft = 450
            end
            inherited edContrato: TIntEdit
              Left = 495
              ExplicitLeft = 495
            end
            inherited cmbRSocial: TArtComboBox
              Width = 315
              DataSource = nil
              ExplicitWidth = 315
            end
          end
        end
        inherited tsSiniestro: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited lblFechaSiniestro: TLabel
            Left = 427
            ExplicitLeft = 427
          end
          inherited lbRSocial: TLabel
            FocusControl = fraFiltroArchivoDevolCarpeta.fraEmpresaSiniestro.cmbRSocial
          end
          inherited fraEmpresaSiniestro: TfraEmpresa
            Width = 544
            ExplicitWidth = 544
            DesignSize = (
              544
              21)
            inherited lbContrato: TLabel
              Left = 440
              ExplicitLeft = 440
            end
            inherited edContrato: TIntEdit
              Left = 486
              ExplicitLeft = 486
            end
            inherited cmbRSocial: TArtComboBox
              Width = 305
              DataSource = nil
              ExplicitWidth = 305
            end
          end
          inherited edFechaSiniestro: TDateComboBox
            Left = 502
            ExplicitLeft = 502
          end
          inherited fraTrabajadorSiniestro: TfraTrabajador
            Width = 371
            ExplicitWidth = 371
            DesignSize = (
              371
              22)
            inherited cmbNombre: TArtComboBox
              Width = 287
              DataSource = nil
              ExplicitWidth = 287
            end
          end
        end
        inherited tsTipoNumero: TTabSheet
          inherited fraCodDescTipo: TfraCodigoDescripcion
            Width = 424
            ExplicitWidth = 424
            DesignSize = (
              424
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 359
              DataSource = nil
              ExplicitWidth = 359
            end
          end
        end
        inherited tsJuicio: TTabSheet
          inherited fraJuicio: TfraArchJuicio
            Width = 546
            ExplicitWidth = 546
            DesignSize = (
              546
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 481
              DataSource = nil
              ExplicitWidth = 481
            end
          end
        end
        inherited tsCuitEstableci: TTabSheet
          inherited fraEmpresaEmpresa: TfraEmpresa
            Width = 546
            ExplicitWidth = 546
            DesignSize = (
              546
              21)
            inherited lbContrato: TLabel
              Left = 444
              ExplicitLeft = 444
            end
            inherited edContrato: TIntEdit
              Left = 489
              ExplicitLeft = 489
            end
            inherited cmbRSocial: TArtComboBox
              Width = 307
              DataSource = nil
              ExplicitWidth = 307
            end
          end
        end
        inherited tsBiblioratoNota: TTabSheet
          inherited lbCUIT: TLabel
            FocusControl = fraFiltroArchivoDevolCarpeta.fraEmpresaNota.mskCUIT
          end
          inherited fraEmpresaNota: TfraEmpresa
            Width = 543
            ExplicitWidth = 543
            DesignSize = (
              543
              21)
            inherited lbContrato: TLabel
              Left = 441
              ExplicitLeft = 441
            end
            inherited edContrato: TIntEdit
              Left = 485
              ExplicitLeft = 485
            end
            inherited cmbRSocial: TArtComboBox
              Width = 306
              DataSource = nil
              ExplicitWidth = 306
            end
          end
          inherited edObservaciones: TEdit
            Width = 543
            ExplicitWidth = 543
          end
        end
        inherited tsFecha: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
        inherited tsProveedor: TTabSheet
          inherited fraProveedor: TfraProveedor
            Width = 582
            ExplicitWidth = 582
            DesignSize = (
              582
              25)
            inherited cmbDescripcion: TArtComboBox
              Width = 285
              DataSource = nil
              ExplicitWidth = 285
            end
          end
        end
        inherited tsEntidadVendedor: TTabSheet
          inherited fraEntidadCUIT: TfraEntidadCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
          inherited fraVendedorCUIT: TfraVendedoresCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsVendedor: TTabSheet
          inherited fraVendedoresCUIT: TfraVendedoresCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsTrabajador: TTabSheet
          inherited fraTrabajad: TfraTrabajador
            inherited cmbNombre: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsEmpresaTrab: TTabSheet
          inherited fraEmpresaTrab: TfraEmpresa
            inherited cmbRSocial: TArtComboBox
              DataSource = nil
            end
          end
          inherited fraTrabajadorTrab: TfraTrabajador
            inherited cmbNombre: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsExtractoBanc: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited fraBancoExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
          inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
        inherited tsAnioPeriodo: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
        inherited tsCBU: TTabSheet
          inherited fraCuentaPago: TfraCodigoDescripcion
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsPrestador: TTabSheet
          inherited fraPrestador: TfraPrestador
            inherited cmbPrestFantasia: TArtComboBox
              DataSource = nil
            end
            inherited cmbPrestador: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsTexto: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
      end
      inherited pnSeleccionArchivo: TPanel
        Width = 600
        ExplicitWidth = 600
        DesignSize = (
          600
          24)
        inherited btnCargarCodigoBarras: TJvXPButton
          Left = 505
          OnClick = fraFiltroArchivoDevolCarpetabtnCargarCodigoBarrasClick
          ExplicitLeft = 505
        end
        inherited fraTipoArchivo: TfraCodDesc
          Width = 445
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 382
            DataSource = nil
            ExplicitWidth = 382
          end
        end
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010101004000480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000EFEFEF00CECE
          CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF0073635A007373
          73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
          FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00E7E7E700BDBDBD005A5A
          630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD390800CE421800E7523100F763
          4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6421000EF5A4200FF6B5A00FF7B
          6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
          B500A5847B00847B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD421000FF6B5200FF846300FF94
          7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
          DE00FFFFEF00E7CEC60073737300FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000DEDEDE00CE4A2100FF8C7300BD4A
          1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
          EF00FFFFFF00FFFFF700AD7B7300DEDEDE000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00B5B5B5005A2100000008
          6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
          EF00FFFFEF00FFFFDE00EFD6B500ADADAD000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004242420008080800000000001039
          A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
          D600FFFFDE00FFFFD600EFD6AD00A5A5A5000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101010001818180010398C00185A
          BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
          BD00FFF7BD00FFFFCE00C6948400D6D6D6000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000212121002929290018529C002173
          DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
          A500FFF7C600FFD6AD005A525200FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000292929003939390000101800319C
          FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
          B500EFBDA500635A5A00EFEFEF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000080808004A4A4A00525252001818
          1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6C6C600424242006B6B6B008C8C
          8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
          7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00C3FF00000000000081FF000000000000
          80FF000000000000007F00000000000000030000000000000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000003000000000000
          00FF00000000000001FF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object edObservDevolCarpeta: TMemo
      Left = 12
      Top = 162
      Width = 596
      Height = 69
      MaxLength = 250
      TabOrder = 4
    end
    object edNroCajaDevolCarpeta: TIntEdit
      Left = 57
      Top = 119
      Width = 89
      Height = 21
      TabOrder = 1
      MaxLength = 6
    end
    object edCantCuerposDevolCarpeta: TIntEdit
      Left = 246
      Top = 119
      Width = 89
      Height = 21
      TabOrder = 2
      Text = '1'
      MaxLength = 3
      MaxValue = 999
      MinValue = 1
      Value = 1
    end
    object chkMoverAdminDevolCarpeta: TCheckBox
      Left = 413
      Top = 120
      Width = 194
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Mover Carpeta a la Administradora'
      TabOrder = 3
    end
  end
  object fpRecepcionCarpetas: TFormPanel [4]
    Left = 840
    Top = 366
    Width = 620
    Height = 329
    Caption = 'Recepci'#243'n de Carpetas de la Administradora/Usuario'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpRecepcionCarpetasEnter
    object Label1: TLabel
      Left = 11
      Top = 303
      Width = 70
      Height = 13
      Caption = 'Cant. Carpetas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnAceptarRecep: TBitBtn
      Left = 425
      Top = 298
      Width = 90
      Height = 26
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
      OnClick = btnAceptarRecepClick
    end
    object btnCancelarRecep: TBitBtn
      Left = 519
      Top = 298
      Width = 90
      Height = 26
      Caption = '&Salir'
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
      TabOrder = 2
      OnClick = btnCancelarRecepClick
    end
    object GridRecepCarpeta: TDBGrid
      Left = 12
      Top = 121
      Width = 596
      Height = 172
      DataSource = dsRecepCarpeta
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TA_DESCRIPCION'
          Width = 224
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AR_DESCRIPCIONCLAVE'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SC_USUARIOSOLICITUD'
          Width = 206
          Visible = True
        end>
    end
    object edCantCarpetasRecep: TIntEdit
      Left = 86
      Top = 301
      Width = 91
      Height = 21
      TabStop = False
      TabOrder = 4
      MaxLength = 8
    end
    inline fraFiltroArchivoRecCarpeta: TfraFiltroArchivo
      Left = 8
      Top = 6
      Width = 600
      Height = 108
      VertScrollBar.Visible = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 6
      ExplicitWidth = 600
      ExplicitHeight = 108
      inherited pcFormulario: TJvPageControl
        Width = 600
        ExplicitWidth = 600
        inherited tsNone: TTabSheet
          ExplicitWidth = 600
        end
        inherited tsCuit: TTabSheet
          inherited fraEmpresaCUIT: TfraEmpresa
            Width = 544
            ExplicitWidth = 544
            DesignSize = (
              544
              21)
            inherited lbContrato: TLabel
              Left = 449
              ExplicitLeft = 449
            end
            inherited edContrato: TIntEdit
              Left = 494
              ExplicitLeft = 494
            end
            inherited cmbRSocial: TArtComboBox
              Width = 314
              DataSource = nil
              ExplicitWidth = 314
            end
          end
        end
        inherited tsSiniestro: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited lblFechaSiniestro: TLabel
            Left = 426
            ExplicitLeft = 426
          end
          inherited lbRSocial: TLabel
            FocusControl = fraFiltroArchivoRecCarpeta.fraEmpresaSiniestro.cmbRSocial
          end
          inherited fraEmpresaSiniestro: TfraEmpresa
            Width = 543
            ExplicitWidth = 543
            DesignSize = (
              543
              21)
            inherited lbContrato: TLabel
              Left = 439
              ExplicitLeft = 439
            end
            inherited edContrato: TIntEdit
              Left = 485
              ExplicitLeft = 485
            end
            inherited cmbRSocial: TArtComboBox
              Width = 304
              DataSource = nil
              ExplicitWidth = 304
            end
          end
          inherited edFechaSiniestro: TDateComboBox
            Left = 501
            ExplicitLeft = 501
          end
          inherited fraTrabajadorSiniestro: TfraTrabajador
            Width = 370
            ExplicitWidth = 370
            DesignSize = (
              370
              22)
            inherited cmbNombre: TArtComboBox
              Width = 286
              DataSource = nil
              ExplicitWidth = 286
            end
          end
        end
        inherited tsTipoNumero: TTabSheet
          inherited fraCodDescTipo: TfraCodigoDescripcion
            Width = 427
            ExplicitWidth = 427
            DesignSize = (
              427
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 362
              DataSource = nil
              ExplicitWidth = 362
            end
          end
        end
        inherited tsJuicio: TTabSheet
          inherited fraJuicio: TfraArchJuicio
            Width = 549
            ExplicitWidth = 549
            DesignSize = (
              549
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 484
              DataSource = nil
              ExplicitWidth = 484
            end
          end
        end
        inherited tsCuitEstableci: TTabSheet
          inherited fraEmpresaEmpresa: TfraEmpresa
            Width = 546
            ExplicitWidth = 546
            DesignSize = (
              546
              21)
            inherited lbContrato: TLabel
              Left = 444
              ExplicitLeft = 444
            end
            inherited edContrato: TIntEdit
              Left = 489
              ExplicitLeft = 489
            end
            inherited cmbRSocial: TArtComboBox
              Width = 307
              DataSource = nil
              ExplicitWidth = 307
            end
          end
        end
        inherited tsBiblioratoNota: TTabSheet
          inherited lbCUIT: TLabel
            FocusControl = fraFiltroArchivoRecCarpeta.fraEmpresaNota.mskCUIT
          end
          inherited fraEmpresaNota: TfraEmpresa
            Width = 546
            ExplicitWidth = 546
            DesignSize = (
              546
              21)
            inherited lbContrato: TLabel
              Left = 444
              ExplicitLeft = 444
            end
            inherited edContrato: TIntEdit
              Left = 488
              ExplicitLeft = 488
            end
            inherited cmbRSocial: TArtComboBox
              Width = 309
              DataSource = nil
              ExplicitWidth = 309
            end
          end
          inherited edObservaciones: TEdit
            Width = 546
            ExplicitWidth = 546
          end
        end
        inherited tsFecha: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
        inherited tsProveedor: TTabSheet
          inherited fraProveedor: TfraProveedor
            Width = 583
            ExplicitWidth = 583
            DesignSize = (
              583
              25)
            inherited cmbDescripcion: TArtComboBox
              Width = 286
              DataSource = nil
              ExplicitWidth = 286
            end
          end
        end
        inherited tsEntidadVendedor: TTabSheet
          inherited fraEntidadCUIT: TfraEntidadCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
          inherited fraVendedorCUIT: TfraVendedoresCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsVendedor: TTabSheet
          inherited fraVendedoresCUIT: TfraVendedoresCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsTrabajador: TTabSheet
          inherited fraTrabajad: TfraTrabajador
            inherited cmbNombre: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsEmpresaTrab: TTabSheet
          inherited fraEmpresaTrab: TfraEmpresa
            inherited cmbRSocial: TArtComboBox
              DataSource = nil
            end
          end
          inherited fraTrabajadorTrab: TfraTrabajador
            inherited cmbNombre: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsExtractoBanc: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited fraBancoExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
          inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
        inherited tsAnioPeriodo: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
        inherited tsCBU: TTabSheet
          inherited fraCuentaPago: TfraCodigoDescripcion
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsPrestador: TTabSheet
          inherited fraPrestador: TfraPrestador
            inherited cmbPrestFantasia: TArtComboBox
              DataSource = nil
            end
            inherited cmbPrestador: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsTexto: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
      end
      inherited pnSeleccionArchivo: TPanel
        Width = 600
        ExplicitWidth = 600
        DesignSize = (
          600
          24)
        inherited btnCargarCodigoBarras: TJvXPButton
          Left = 505
          OnClick = fraFiltroArchivoRecCarpetabtnCargarCodigoBarrasClick
          ExplicitLeft = 505
        end
        inherited fraTipoArchivo: TfraCodDesc
          Width = 445
          ExplicitWidth = 445
          DesignSize = (
            445
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 382
            DataSource = nil
            ExplicitWidth = 382
          end
        end
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010101004000480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000EFEFEF00CECE
          CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF0073635A007373
          73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
          FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00E7E7E700BDBDBD005A5A
          630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD390800CE421800E7523100F763
          4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6421000EF5A4200FF6B5A00FF7B
          6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
          B500A5847B00847B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD421000FF6B5200FF846300FF94
          7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
          DE00FFFFEF00E7CEC60073737300FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000DEDEDE00CE4A2100FF8C7300BD4A
          1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
          EF00FFFFFF00FFFFF700AD7B7300DEDEDE000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00B5B5B5005A2100000008
          6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
          EF00FFFFEF00FFFFDE00EFD6B500ADADAD000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004242420008080800000000001039
          A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
          D600FFFFDE00FFFFD600EFD6AD00A5A5A5000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101010001818180010398C00185A
          BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
          BD00FFF7BD00FFFFCE00C6948400D6D6D6000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000212121002929290018529C002173
          DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
          A500FFF7C600FFD6AD005A525200FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000292929003939390000101800319C
          FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
          B500EFBDA500635A5A00EFEFEF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000080808004A4A4A00525252001818
          1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6C6C600424242006B6B6B008C8C
          8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
          7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00C3FF00000000000081FF000000000000
          80FF000000000000007F00000000000000030000000000000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000003000000000000
          00FF00000000000001FF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
  end
  object fpDetalleMultiplesCarpetas: TFormPanel [5]
    Left = 875
    Top = 390
    Width = 620
    Height = 329
    Caption = 'Detalles de M'#250'ltiples Carpetas'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpDetalleMultiplesCarpetasEnter
    object Label11: TLabel
      Left = 11
      Top = 303
      Width = 70
      Height = 13
      Caption = 'Cant. Carpetas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnAceptarSelMult: TBitBtn
      Left = 415
      Top = 297
      Width = 90
      Height = 28
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
      OnClick = btnAceptarSelMultClick
    end
    object btnCancelarSelMult: TBitBtn
      Left = 519
      Top = 297
      Width = 90
      Height = 28
      Caption = '&Salir'
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
      TabOrder = 3
      OnClick = btnCancelarSelMultClick
    end
    object edCantCarpetasSelMult: TIntEdit
      Left = 86
      Top = 301
      Width = 91
      Height = 21
      TabStop = False
      TabOrder = 5
      MaxLength = 8
    end
    inline fraFiltroArchivoSelMultCarpeta: TfraFiltroArchivo
      Left = 8
      Top = 6
      Width = 600
      Height = 108
      VertScrollBar.Visible = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 6
      ExplicitWidth = 600
      ExplicitHeight = 108
      inherited pcFormulario: TJvPageControl
        Width = 600
        ExplicitWidth = 600
        inherited tsNone: TTabSheet
          ExplicitWidth = 600
        end
        inherited tsCuit: TTabSheet
          inherited fraEmpresaCUIT: TfraEmpresa
            Width = 544
            ExplicitWidth = 544
            DesignSize = (
              544
              21)
            inherited lbContrato: TLabel
              Left = 449
              ExplicitLeft = 449
            end
            inherited edContrato: TIntEdit
              Left = 494
              ExplicitLeft = 494
            end
            inherited cmbRSocial: TArtComboBox
              Width = 314
              DataSource = nil
              ExplicitWidth = 314
            end
          end
        end
        inherited tsSiniestro: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited lblFechaSiniestro: TLabel
            Left = 426
            ExplicitLeft = 426
          end
          inherited lbRSocial: TLabel
            FocusControl = fraFiltroArchivoRecCarpeta.fraEmpresaSiniestro.cmbRSocial
          end
          inherited fraEmpresaSiniestro: TfraEmpresa
            Width = 543
            ExplicitWidth = 543
            DesignSize = (
              543
              21)
            inherited lbContrato: TLabel
              Left = 439
              ExplicitLeft = 439
            end
            inherited edContrato: TIntEdit
              Left = 485
              ExplicitLeft = 485
            end
            inherited cmbRSocial: TArtComboBox
              Width = 304
              DataSource = nil
              ExplicitWidth = 304
            end
          end
          inherited edFechaSiniestro: TDateComboBox
            Left = 501
            ExplicitLeft = 501
          end
          inherited fraTrabajadorSiniestro: TfraTrabajador
            Width = 370
            ExplicitWidth = 370
            DesignSize = (
              370
              22)
            inherited cmbNombre: TArtComboBox
              Width = 286
              DataSource = nil
              ExplicitWidth = 286
            end
          end
        end
        inherited tsTipoNumero: TTabSheet
          inherited fraCodDescTipo: TfraCodigoDescripcion
            Width = 427
            ExplicitWidth = 427
            DesignSize = (
              427
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 362
              DataSource = nil
              ExplicitWidth = 362
            end
          end
        end
        inherited tsJuicio: TTabSheet
          inherited fraJuicio: TfraArchJuicio
            Width = 549
            ExplicitWidth = 549
            DesignSize = (
              549
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 484
              DataSource = nil
              ExplicitWidth = 484
            end
          end
        end
        inherited tsCuitEstableci: TTabSheet
          inherited fraEmpresaEmpresa: TfraEmpresa
            Width = 546
            ExplicitWidth = 546
            DesignSize = (
              546
              21)
            inherited lbContrato: TLabel
              Left = 444
              ExplicitLeft = 444
            end
            inherited edContrato: TIntEdit
              Left = 489
              ExplicitLeft = 489
            end
            inherited cmbRSocial: TArtComboBox
              Width = 307
              DataSource = nil
              ExplicitWidth = 307
            end
          end
        end
        inherited tsBiblioratoNota: TTabSheet
          inherited lbCUIT: TLabel
            FocusControl = fraFiltroArchivoRecCarpeta.fraEmpresaNota.mskCUIT
          end
          inherited fraEmpresaNota: TfraEmpresa
            Width = 546
            ExplicitWidth = 546
            DesignSize = (
              546
              21)
            inherited lbContrato: TLabel
              Left = 444
              ExplicitLeft = 444
            end
            inherited edContrato: TIntEdit
              Left = 488
              ExplicitLeft = 488
            end
            inherited cmbRSocial: TArtComboBox
              Width = 309
              DataSource = nil
              ExplicitWidth = 309
            end
          end
          inherited edObservaciones: TEdit
            Width = 546
            ExplicitWidth = 546
          end
        end
        inherited tsFecha: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
        inherited tsProveedor: TTabSheet
          inherited fraProveedor: TfraProveedor
            Width = 583
            ExplicitWidth = 583
            DesignSize = (
              583
              25)
            inherited cmbDescripcion: TArtComboBox
              Width = 286
              DataSource = nil
              ExplicitWidth = 286
            end
          end
        end
        inherited tsEntidadVendedor: TTabSheet
          inherited fraEntidadCUIT: TfraEntidadCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
          inherited fraVendedorCUIT: TfraVendedoresCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsVendedor: TTabSheet
          inherited fraVendedoresCUIT: TfraVendedoresCUIT
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsTrabajador: TTabSheet
          inherited fraTrabajad: TfraTrabajador
            inherited cmbNombre: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsEmpresaTrab: TTabSheet
          inherited fraEmpresaTrab: TfraEmpresa
            inherited cmbRSocial: TArtComboBox
              DataSource = nil
            end
          end
          inherited fraTrabajadorTrab: TfraTrabajador
            inherited cmbNombre: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsExtractoBanc: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
          inherited fraBancoExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
          inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
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
        inherited tsAnioPeriodo: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
        inherited tsCBU: TTabSheet
          inherited fraCuentaPago: TfraCodigoDescripcion
            inherited cmbDescripcion: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsPrestador: TTabSheet
          inherited fraPrestador: TfraPrestador
            inherited cmbPrestFantasia: TArtComboBox
              DataSource = nil
            end
            inherited cmbPrestador: TArtComboBox
              DataSource = nil
            end
          end
        end
        inherited tsTexto: TTabSheet
          ExplicitWidth = 526
          ExplicitHeight = 84
        end
      end
      inherited pnSeleccionArchivo: TPanel
        Width = 600
        ExplicitWidth = 600
        DesignSize = (
          600
          24)
        inherited btnCargarCodigoBarras: TJvXPButton
          Left = 503
          ExplicitLeft = 503
        end
        inherited fraTipoArchivo: TfraCodDesc
          Width = 447
          ExplicitWidth = 447
          DesignSize = (
            447
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 382
            DataSource = nil
            ExplicitWidth = 382
          end
        end
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010101004000480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000EFEFEF00CECE
          CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF0073635A007373
          73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
          FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00E7E7E700BDBDBD005A5A
          630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD390800CE421800E7523100F763
          4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6421000EF5A4200FF6B5A00FF7B
          6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
          B500A5847B00847B7B00F7F7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AD421000FF6B5200FF846300FF94
          7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
          DE00FFFFEF00E7CEC60073737300FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000DEDEDE00CE4A2100FF8C7300BD4A
          1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
          EF00FFFFFF00FFFFF700AD7B7300DEDEDE000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00B5B5B5005A2100000008
          6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
          EF00FFFFEF00FFFFDE00EFD6B500ADADAD000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004242420008080800000000001039
          A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
          D600FFFFDE00FFFFD600EFD6AD00A5A5A5000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101010001818180010398C00185A
          BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
          BD00FFF7BD00FFFFCE00C6948400D6D6D6000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000212121002929290018529C002173
          DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
          A500FFF7C600FFD6AD005A525200FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000292929003939390000101800319C
          FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
          B500EFBDA500635A5A00EFEFEF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000080808004A4A4A00525252001818
          1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
          B500DEDEDE00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000C6C6C600424242006B6B6B008C8C
          8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
          7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00C3FF00000000000081FF000000000000
          80FF000000000000007F00000000000000030000000000000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000003000000000000
          00FF00000000000001FF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object btnAgregarSelMult: TBitBtn
      Left = 321
      Top = 297
      Width = 90
      Height = 28
      Caption = 'Agrega&r'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAgregarSelMultClick
    end
    object GridSelMultCarpeta: TArtDBGrid
      Left = 12
      Top = 121
      Width = 596
      Height = 172
      DataSource = dsSelMultCarpeta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 4
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      MultiSelect = True
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TA_DESCRIPCION'
          Width = 357
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AR_DESCRIPCIONCLAVE'
          Width = 200
          Visible = True
        end>
    end
  end
  object fpModificarCajas: TFormPanel [6]
    Left = 900
    Top = 655
    Width = 611
    Height = 94
    Caption = 'Modificaci'#243'n de Contenido de Cajas'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpModificarCajasEnter
    DesignSize = (
      611
      94)
    object Label22: TLabel
      Left = 9
      Top = 10
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'N'#186' Caja'
    end
    object BevelAbm: TBevel
      Left = 4
      Top = 58
      Width = 605
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label20: TLabel
      Left = 9
      Top = 36
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Tipo Archivo'
    end
    object btnAceptarModifCajas: TBitBtn
      Left = 416
      Top = 64
      Width = 90
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
      TabOrder = 2
      OnClick = btnAceptarModifCajasClick
    end
    object btnCancelarModifCajas: TBitBtn
      Left = 510
      Top = 64
      Width = 90
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
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
      TabOrder = 3
    end
    object edNroCajaModifCaja: TIntEdit
      Left = 74
      Top = 6
      Width = 90
      Height = 21
      TabOrder = 0
      MaxLength = 6
    end
    inline fraTipoArchivoModifCaja: TfraCodigoDescripcion
      Left = 72
      Top = 31
      Width = 531
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 72
      ExplicitTop = 31
      ExplicitWidth = 531
      DesignSize = (
        531
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 96
        Width = 433
        DataSource = nil
        ExplicitLeft = 96
        ExplicitWidth = 433
      end
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 90
        ExplicitLeft = 2
        ExplicitWidth = 90
      end
      inherited sdqDatos: TSDQuery
        SQL.Strings = ()
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeOpen = sdqConsultaBeforeOpen
    SQL.Strings = (
      'SELECT ar_id, ar_tipo, ta_descripcion, ta_fechabaja,'
      '       DECODE (ar_tipoubicacion,'
      '               '#39'D'#39', '#39'Delegaci'#243'n'#39','
      '               '#39'L'#39', '#39'Lugar'#39','
      '               '#39'S'#39', '#39'Sector'#39','
      '               '#39'U'#39', '#39'Usuario'#39','
      '               '#39'G'#39', '#39'Administradora'#39
      '              ) tipoubicacion, ar_ubicacion,'
      '       art.archivo.getubicacionnombre (ar_tipoubicacion,'
      '                                       ar_ubicacion'
      '                                      ) ubicacion,'
      '       ar_fechamovimiento, ar_caja, ar_receptor, ar_emisor,'
      '       archivo.getdescripcionclave (tc_id, ar_clave) ar_clave,'
      '       sc_fechasolicitud, sc_horasolicitud,'
      '       sc_usuariosolicitud, sc_tiposolicitud, sc_fechaimpresion,'
      
        '       sc_fecharecepcion, sc_observaciones, sc_usuarioimpresion,' +
        ' sc_fechaprevistadevolucion'
      
        '  FROM rar_archivo r, rta_tipoarchivo t, rtc_tipoclave c, rsc_so' +
        'licitudcarpeta s'
      ' WHERE ar_tipo = ta_id'
      '   AND ta_formulario  = tc_clave'
      '   AND ar_id          = sc_idarchivo(+)')
    Left = 28
    Top = 356
  end
  inherited dsConsulta: TDataSource
    Left = 56
    Top = 356
  end
  inherited SortDialog: TSortDialog
    Left = 28
    Top = 384
  end
  inherited ExportDialog: TExportDialog
    Left = 56
    Top = 384
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 75
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 56
    Top = 412
  end
  inherited Seguridad: TSeguridad
    Left = 28
    Top = 328
  end
  inherited FormStorage: TFormStorage
    Left = 56
    Top = 328
  end
  inherited PrintDialog: TPrintDialog
    Left = 28
    Top = 412
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end>
    Enabled = False
    Left = 84
    Top = 328
  end
  inherited FieldHider: TFieldHider
    Left = 84
    Top = 356
  end
  object pmnuImpresion: TPopupMenu
    Left = 84
    Top = 384
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirRemitoEstudio: TMenuItem
      Caption = 'Imprimir Remito Est. Legal/Abogado'
      OnClick = mnuImprimirRemitoEstudioClick
    end
    object mnuImprimirEtiquetas: TMenuItem
      Caption = 'Imprimir Etiquetas'
      OnClick = mnuImprimirEtiquetasClick
    end
  end
  object pmnuGrilla: TPopupMenu
    Left = 84
    Top = 412
    object mnuSelectAll: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuSelectAllClick
    end
    object mnuUnselectAll: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuUnselectAllClick
    end
    object mnuToggleSelection: TMenuItem
      Caption = 'Invertir Selecci'#243'n'
      OnClick = mnuToggleSelectionClick
    end
  end
  object pmSolicitarCarpetas: TPopupMenu
    Left = 112
    Top = 412
    object mnuSolicitarResaltado: TMenuItem
      Caption = 'Solicitar &Resaltado'
      OnClick = mnuSolicitarResaltadoClick
    end
    object mnuSolicitarMultiple: TMenuItem
      Caption = 'Solicitar &Multiples'
      OnClick = mnuSolicitarMultipleClick
    end
  end
  object dsRecepCarpeta: TDataSource
    DataSet = cdsRecepCarpeta
    Left = 53
    Top = 484
  end
  object cdsRecepCarpeta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecepCarpeta'
    Left = 81
    Top = 484
    object cdsRecepCarpetaTA_DESCRIPCION: TStringField
      DisplayLabel = 'Tipo Archivo'
      FieldName = 'TA_DESCRIPCION'
      Size = 50
    end
    object cdsRecepCarpetaAR_DESCRIPCIONCLAVE: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'AR_DESCRIPCIONCLAVE'
      Size = 4000
    end
    object cdsRecepCarpetaSC_USUARIOSOLICITUD: TStringField
      DisplayLabel = 'Usuario Solicitud'
      FieldName = 'SC_USUARIOSOLICITUD'
    end
  end
  object sdqRecepCarpeta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLA' +
        'VE) AR_DESCRIPCIONCLAVE, '
      '       SC_USUARIOSOLICITUD'
      
        '  FROM RTA_TIPOARCHIVO, RSC_SOLICITUDCARPETA, RTC_TIPOCLAVE, RAR' +
        '_ARCHIVO'
      ' WHERE AR_TIPO = TA_ID'
      '   AND TA_FORMULARIO = TC_CLAVE'
      '   AND AR_ID = SC_IDARCHIVO(+)'
      '   AND 1=2'
      '')
    Left = 25
    Top = 484
    object sdqRecepCarpetaTA_DESCRIPCION: TStringField
      DisplayLabel = 'Tipo Archivo'
      FieldName = 'TA_DESCRIPCION'
      Size = 50
    end
    object sdqRecepCarpetaAR_DESCRIPCIONCLAVE: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'AR_DESCRIPCIONCLAVE'
      Size = 4000
    end
    object sdqRecepCarpetaSC_USUARIOSOLICITUD: TStringField
      DisplayLabel = 'Usuario Solicitud'
      FieldName = 'SC_USUARIOSOLICITUD'
    end
  end
  object dspRecepCarpeta: TDataSetProvider
    DataSet = sdqRecepCarpeta
    Left = 109
    Top = 484
  end
  object sdqDevolCarpeta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLA' +
        'VE) AR_DESCRIPCIONCLAVE, AR_CAJA,'
      '       AR_CANTCUERPOS'
      
        '  FROM RTA_TIPOARCHIVO, RSC_SOLICITUDCARPETA, RTC_TIPOCLAVE, RAR' +
        '_ARCHIVO'
      ' WHERE AR_TIPO = TA_ID'
      '   AND TA_FORMULARIO = TC_CLAVE'
      '   AND AR_ID = SC_IDARCHIVO(+)'
      '   AND 1 = 2'
      '')
    Left = 24
    Top = 516
    object StringField1: TStringField
      DisplayLabel = 'Tipo Archivo'
      FieldName = 'TA_DESCRIPCION'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'AR_DESCRIPCIONCLAVE'
      Size = 4000
    end
    object sdqDevolCarpetaAR_CAJA: TFloatField
      FieldName = 'AR_CAJA'
    end
    object sdqDevolCarpetaAR_CANTCUERPOS: TFloatField
      FieldName = 'AR_CANTCUERPOS'
    end
  end
  object dsDevolCarpeta: TDataSource
    DataSet = cdsDevolCarpeta
    Left = 52
    Top = 516
  end
  object cdsDevolCarpeta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevolCarpeta'
    Left = 80
    Top = 516
    object StringField4: TStringField
      DisplayLabel = 'Tipo Archivo'
      FieldName = 'TA_DESCRIPCION'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'AR_DESCRIPCIONCLAVE'
      Size = 4000
    end
    object cdsDevolCarpetaAR_CAJA: TFloatField
      FieldName = 'AR_CAJA'
    end
    object cdsDevolCarpetaAR_CANTCUERPOS: TFloatField
      FieldName = 'AR_CANTCUERPOS'
    end
  end
  object dspDevolCarpeta: TDataSetProvider
    DataSet = sdqDevolCarpeta
    Left = 108
    Top = 516
  end
  object ShortCutControl1: TShortCutControl
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
        LinkControl = tbSalir2
      end
      item
        Key = 115
        LinkControl = tbBuscarCodigoBarras
      end>
    Left = 113
    Top = 328
  end
  object sdqSelMultCarpeta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLA' +
        'VE) AR_DESCRIPCIONCLAVE, AR_ID'
      '  FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO'
      ' WHERE AR_TIPO = TA_ID'
      '   AND TA_FORMULARIO = TC_CLAVE'
      '   AND 1=2'
      '')
    Left = 25
    Top = 548
    object StringField3: TStringField
      DisplayLabel = 'Tipo Archivo'
      FieldName = 'TA_DESCRIPCION'
      Size = 50
    end
    object StringField6: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'AR_DESCRIPCIONCLAVE'
      Size = 4000
    end
    object sdqSelMultCarpetaAR_ID: TFloatField
      FieldName = 'AR_ID'
      Required = True
    end
  end
  object dsSelMultCarpeta: TDataSource
    DataSet = cdsSelMultCarpeta
    Left = 53
    Top = 548
  end
  object cdsSelMultCarpeta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelMultCarpeta'
    Left = 81
    Top = 548
    object StringField8: TStringField
      DisplayLabel = 'Tipo Archivo'
      FieldName = 'TA_DESCRIPCION'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'AR_DESCRIPCIONCLAVE'
      Size = 4000
    end
    object cdsSelMultCarpetaAR_ID: TFloatField
      FieldName = 'AR_ID'
      Required = True
    end
  end
  object dspSelMultCarpeta: TDataSetProvider
    DataSet = sdqSelMultCarpeta
    Left = 109
    Top = 548
  end
  object ilByN: TImageList
    Left = 28
    Top = 444
    Bitmap = {
      494C01013B007800400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000F0000000010020000000000000F0
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      840063636300424242000000000084848400B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B5000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600B5B5
      B500B5B5B500BDBDBD00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00B5B5B500FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000525252008484
      840084848400848484000000000084848400C6C6C60052525200525252005252
      520052525200B5B5B5000000000073737300FFFFFF00CECECE00C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C600BDBD
      BD00B5B5B500FFFFFF00ADADAD00FFFFFF00FFFFFF00ADADAD00FFFFFF00ADAD
      AD00B5B5B500B5B5B500B5B5B500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      520084848400848484004242420084848400E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B5007373730042424200FFFFFF00CECECE00CECECE00C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600CECECE00CECECE00CECECE00FFFFFF00FFFFFF00C6C6C600CECECE00C6C6
      C600BDBDBD00BDBDBD00ADADAD00FFFFFF00FFFFFF00B5B5B500BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052525200949494004242420084848400C6C6C60063636300636363006363
      630063636300636363004242420000000000FFFFFF00D6D6D600BDBDBD00CECE
      CE00C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600CECECE00CECE
      CE00D6D6D600BDBDBD00D6D6D600FFFFFF00FFFFFF00FFFFFF00C6C6C600CECE
      CE00C6C6C600C6C6C600B5B5B500FFFFFF00FFFFFF00B5B5B500C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400525252006363630042424200E7E7E700C6C6C600E7E7E700C6C6
      C60063636300424242000000000000000000FFFFFF00B5B5B500C6C6C600BDBD
      BD00C6C6C600BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600D6D6
      D600BDBDBD00FFFFFF00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      D600CECECE00C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00D6D6
      D600D6D6D600FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E70052525200636363004242420084848400848484006363
      630042424200B5B5B5000000000000000000FFFFFF00FFFFFF00C6C6C600FFFF
      FF00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBD
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600D6D6
      D600CECECE00A5A5A500BDBDBD00FFFFFF00FFFFFF00BDBDBD00CECECE00D6D6
      D600D6D6D600D6D6D600FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B50084848400C6C6C60063636300525252006363630042424200636363004242
      420084848400000000000000000000000000FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A5A5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6005252
      520084848400E7E7E700C6C6C60084848400525252006363630042424200E7E7
      E70084848400000000000000000000000000FFFFFF00FFFFFF00CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C60084848400C6C6C60084848400848484006363630042424200636363004242
      420084848400000000000000000000000000FFFFFF00FFFFFF00D6D6D600FFFF
      FF00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600BDBDBD00BDBDBD00B5B5B500FFFFFF00FFFFFF00B5B5B500CECECE00BDBD
      BD00C6C6C600C6C6C600CECECE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6006363
      630084848400E7E7E70084848400636363004242420084848400000000006363
      630042424200000000000000000000000000FFFFFF00A5A5A500CECECE00B5B5
      B500ADADAD00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00B5B5B500FFFFFF00ADADAD00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00ADADAD008C8C8C007B7B7B008484840094949400BDBDBD00C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C6004A4A4A004A4A4A006363630042424200E7E7E70084848400000000000000
      000063636300424242000000000000000000FFFFFF00BDBDBD00B5B5B500BDBD
      BD00BDBDBD00BDBDBD00C6C6C600FFFFFF00FFFFFF00C6C6C600CECECE00C6C6
      C600BDBDBD00B5B5B500B5B5B500FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600C6C6C600CECECE00B5B5B500FFFFFF00FFFFFF00B5B5B500CECECE00CECE
      CE00CECECE00C6C6C600FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484004A4A4A004A4A
      4A00848484006363630042424200848484008484840084848400000000000000
      000000000000636363004242420000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600CECE
      CE00C6C6C600C6C6C600BDBDBD00FFFFFF00FFFFFF00C6C6C600C6C6C600CECE
      CE00CECECE00D6D6D600B5B5B500FFFFFF00FFFFFF00ADADAD00D6D6D600CECE
      CE00CECECE00C6C6C600C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420084848400000000000000000000000000000000000000
      000000000000000000007373730042424200FFFFFF00CECECE00CECECE00CECE
      CE00C6C6C600D6D6D600D6D6D600D6D6D600CECECE00CECECE00CECECE00C6C6
      C600CECECE00C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600D6D6D600D6D6
      D600BDBDBD00B5B5B500B5B5B500FFFFFF00FFFFFF00ADADAD00B5B5B500B5B5
      B500CECECE00CECECE00BDBDBD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      630042424200E7E7E70084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00DEDE
      DE00D6D6D600CECECE00CECECE00FFFFFF00FFFFFF00FFFFFF00BDBDBD00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B500BDBDBD00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD0000000000000000000000000000000000000000000000
      0000000000008C8C8C006B6B6B00525252004A4A4A005A5A5A007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00F7F7F7007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00000000000000000000000000000000004A4A4A004242
      42004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A005A5A5A006363
      63005A5A5A007373730000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B00F7F7F700F7F7F700F7F7F7007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD0000000000000000000000000084848400636363006363
      63005A5A5A00525252004A4A4A004A4A4A004A4A4A0052525200525252005A5A
      5A005A5A5A00636363004A4A4A00000000000000000000000000000000000000
      0000000000007B7B7B00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F7007B7B
      7B007B7B7B007B7B7B00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484840084848400C6C6
      C600C6C6C6000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00000000000000000000000000636363007B7B7B007373
      730073737300737373006B6B6B006B6B6B006B6B6B0063636300636363005252
      52005A5A5A006B6B6B0063636300000000000000000000000000000000007B7B
      7B00F7F7F700F7F7F700B5B5B500B5B5B500F7F7F700F7F7F700F7F7F7007B7B
      7B007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00848484008484
      8400C6C6C6000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD000000000000000000000000007B7B7B00737373008484
      84007B7B7B0073737300737373008484840084848400848484006B6B6B005A5A
      5A00525252005A5A5A006363630000000000000000007B7B7B00F7F7F700F7F7
      F7007B7B7B00F7F7F700B5B5B5009C9C9C009C9C9C00F7F7F700F7F7F7007B7B
      7B007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD000000000000000000000000000000000073737300848484008484
      84007B7B7B008484840084848400BDBDBD00CECECE00D6D6D600A5A5A5007B7B
      7B00525252005252520052525200000000007B7B7B00F7F7F700F7F7F7007B7B
      7B007B7B7B00F7F7F700F7F7F700F7F7F7009C9C9C00F7F7F700F7F7F7007B7B
      7B007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD0000000000000000000000000000000000000000007B7B7B007B7B7B008484
      840094949400B5B5B500C6C6C600CECECE00DEDEDE00D6D6D600D6D6D6008C8C
      8C00525252005252520042424200000000007B7B7B00F7F7F7007B7B7B00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F7007B7B7B00F7F7F700F7F7F7007B7B
      7B007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000006B6B6B00636363007373
      73008C8C8C00A5A5A500C6C6C600DEDEDE00D6D6D600CECECE00E7E7E700A5A5
      A5006B6B6B00636363004A4A4A00000000007B7B7B00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F7007B7B7B007B7B7B00F7F7F700F7F7F7007B7B
      7B007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00000000000000000000000000292929005A5A5A007373
      730063636300525252003939390042424200636363007B7B7B007B7B7B004A4A
      4A006B6B6B006363630084848400000000007B7B7B00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F7007B7B7B007B7B7B00F7F7F700F7F7F700F7F7F7007B7B
      7B007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD0000000000000000000000000039393900636363006363
      63006B6B6B006B6B6B00737373007B7B7B00848484007B7B7B006B6B6B006363
      6300636363005252520000000000000000007B7B7B00F7F7F7009C9C9C00B5B5
      B500F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00C6C6C6007B7B7B00DEDE
      DE007B7B7B0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00000000000000000000000000000000004A4A4A006B6B
      6B006B6B6B006B6B6B0063636300636363005A5A5A005A5A5A005A5A5A005A5A
      5A004A4A4A000000000000000000000000007B7B7B00F7F7F700B5B5B500B5B5
      B500F7F7F700F7F7F7007B7B7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE007B7B
      7B000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD0000000000000000000000000000000000000000005A5A
      5A00848484006B6B6B0063636300636363005A5A5A005A5A5A005A5A5A004A4A
      4A00737373000000000000000000000000007B7B7B00F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C6007B7B7B00DEDEDE00DEDEDE00DEDEDE00C6C6C6000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0000000000000000000000000000000000000000000000
      0000636363006B6B6B00636363004A4A4A004A4A4A004A4A4A00525252000000
      0000000000000000000000000000000000007B7B7B00F7F7F700F7F7F700C6C6
      C6007B7B7B00DEDEDE00DEDEDE007B7B7B00C6C6C6007B7B7B00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD000000000000000000000000000000000000000000000000000000
      00000000000073737300525252004A4A4A004242420042424200000000000000
      0000000000000000000000000000000000007B7B7B00C6C6C6007B7B7B00DEDE
      DE00DEDEDE007B7B7B0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00DEDEDE007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00CECECE00B5B5B500BDBD
      BD00C6C6C600C6C6C600ADADAD00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000636363007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      310000000000000000000000000000000000FFFFFF00B5B5B5009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00525252005A5A5A006B6B6B005252
      5200525252005252520063636300F7F7F700000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      00000000000000000000636363006B6B6B00A5A5A50063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031313100A5A5
      A50042424200000000000000000000000000FFFFFF004A4A4A004A4A4A002929
      29001818180010101000101010002929290031313100525252006B6B6B005252
      52005A5A5A00525252005A5A5A00F7F7F70000000000000000005A5A5A005A5A
      5A005A5A5A00FFFFFF0000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      000063636300BDBDBD00C6C6C6007B7B7B00F7F7F700E7E7E700737373005252
      5200848484006B6B6B0000000000000000000000000000000000000000000000
      000000000000313131003131310031313100313131003131310031313100DEDE
      DE00A5A5A500424242000000000000000000FFFFFF0039393900393939002929
      29001818180008080800080808001010100018181800525252005A5A5A005A5A
      5A005A5A5A004A4A4A005A5A5A00F7F7F7000000000000000000000000005A5A
      5A005A5A5A005A5A5A00FFFFFF00000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000007B7B
      7B00B5B5B500CECECE00BDBDBD007B7B7B00F7F7F700DEDEDE00737373004A4A
      4A00A5A5A5009494940000000000000000000000000000000000000000000000
      0000000000004242420094949400A5A5A500B5B5B500DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A5004242420000000000FFFFFF009C9C9C00737373003939
      39003131310018181800313131003131310029292900525252005A5A5A005252
      52005A5A5A005A5A5A005A5A5A00F7F7F7000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00EFEF
      EF00DEDEDE00C6C6C600BDBDBD0084848400FFFFFF00DEDEDE006B6B6B004242
      4200A5A5A5009494940000000000000000000000000000000000000000000000
      00000000000042424200424242005A5A5A005A5A5A005A5A5A005A5A5A00A5A5
      A50094949400424242000000000000000000000000004A4A4A00525252003939
      39004242420029292900424242005A5A5A0031313100525252005A5A5A005252
      52005A5A5A00525252005A5A5A00F7F7F7000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500EFEF
      EF00E7E7E700CECECE00B5B5B5007B7B7B00FFFFFF00E7E7E700BDBDBD007373
      7300A5A5A5009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A009494
      940042424200000000000000000000000000FFFFFF005A5A5A005A5A5A003939
      390052525200393939004A4A4A007B7B7B004A4A4A005A5A5A00525252005A5A
      5A005A5A5A005A5A5A005A5A5A00F7F7F7000000000000000000000000000000
      000000000000000000005A5A5A005A5A5A005A5A5A00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500DEDE
      DE00ADADAD0094949400B5B5B5009C9C9C0084848400EFEFEF00DEDEDE00CECE
      CE00C6C6C6008C8C8C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A0000000000000000000000000000000000FFFFFF004A4A4A00525252004A4A
      4A006B6B6B006B6B6B00636363008C8C8C002121210031313100424242005252
      52005252520052525200000000008C8C8C000000000000000000000000000000
      00000000000000000000FFFFFF005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5008C8C
      8C008C8C8C00ADADAD00B5B5B500B5B5B50094949400DEDEDE00E7E7E700CECE
      CE00C6C6C6008484840000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0063636300737373004A4A
      4A00636363006363630063636300848484001010100000000000000000003131
      3100393939004A4A4A0000000000C6C6C6000000000000000000000000000000
      000000000000FFFFFF005A5A5A005A5A5A005A5A5A0000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00B5B5B500A5A5
      A500949494009C9C9C00A5A5A500BDBDBD00BDBDBD00848484009C9C9C00C6C6
      C6008C8C8C009C9C9C0094949400000000000000000000000000000000004242
      4200A5A5A5003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00ADAD
      AD00B5B5B500B5B5B500BDBDBD00BDBDBD000808080000000000000000000000
      0000080808002929290000000000949494000000000000000000000000000000
      0000FFFFFF005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500D6D6D600B5B5
      B5009C9C9C00949494009C9C9C00B5B5B500BDBDBD00A5A5A500848484008484
      840084848400949494000000000000000000000000000000000042424200A5A5
      A500DEDEDE005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      00000000000000000000000000000000000000000000ADADAD00A5A5A500ADAD
      AD00ADADAD00B5B5B500B5B5B5005A5A5A000000000000000000000000000000
      0000000000005252520084848400B5B5B500000000000000000000000000FFFF
      FF005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000000000008C8C8C00CECE
      CE00BDBDBD009494940094949400A5A5A500ADADAD00BDBDBD00ADADAD00A5A5
      A500949494000000000000000000000000000000000042424200A5A5A500DEDE
      DE00DEDEDE00DEDEDE00B5B5B500A5A5A500949494005A5A5A00000000000000
      00000000000000000000000000000000000000000000ADADAD0094949400A5A5
      A5009C9C9C00ADADAD00ADADAD00101010000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000FFFFFF005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000005A5A5A000000000000000000000000000000000000000000B5B5
      B500CECECE00A5A5A500949494009C9C9C00ADADAD00ADADAD009C9C9C008C8C
      8C00000000000000000000000000000000000000000000000000424242009494
      9400A5A5A5003131310031313100313131005A5A5A005A5A5A00000000000000
      00000000000000000000000000000000000000000000949494009C9C9C009494
      94009C9C9C00A5A5A500ADADAD00424242000000000000000000000000000000
      00000000000000000000000000008C8C8C0000000000FFFFFF005A5A5A005A5A
      5A005A5A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A5A5A0000000000000000000000000000000000000000000000
      000094949400ADADAD00949494008C8C8C00737373008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200949494003131310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C00A5A5A500B5B5B500292929000000000000000000000000000000
      0000000000000000000084848400BDBDBD00000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      00000000000094949400ADADAD0000000000525252006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C006B6B6B009494
      9400ADADAD00ADADAD0094949400212121000000000000000000000000000808
      0800000000000000000008080800D6D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700EFEF
      EF00FFFFFF00EFEFEF00F7F7F700EFEFEF00F7F7F700FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C006363630000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252002929290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002184
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C006B6B6B008C8C8C0063636300000000000000
      00000000000000000000000000000000000084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      630000000000000000000000000000000000000000000000000000000000A5A5
      A5005A5A5A005252520029292900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000218429002994
      310052BD5A000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5007B7B7B000000000000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000007373
      73005A5A5A005A5A5A0052525200292929000000000000000000000000000000
      00000000000000000000737373000000000000000000399C4A00000000000000
      000000000000000000000000000000000000084A1000298C3100299431002194
      310031A542000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C0073737300000000000000000000000000848484000000
      00000000000000000000000000000000000084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000000000000ADADAD005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A002929290000000000000000000000
      00000000000000000000636363000000000000000000318C3900000000000000
      0000000000000000000000000000084A10002994310029943100299431002994
      3100299431005AC663000000000000000000000000000000000000000000A5A5
      A5007B7B7B0084848400848484006B6B6B000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      73006363630000000000000000000000000000000000000000007B7B7B005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A0029292900000000000000
      000000000000000000004A4A4A000000000000000000187329006BDE7B000000
      000000000000000000000842100029943100299C310029943100299431002994
      31002194310039A5420000000000000000000000000000000000000000000000
      000084848400848484007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000000000ADADAD005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00525252005A5A5A004A4A4A00000000000000
      000000000000ADADAD00393939000000000000000000105A18005ACE6B000000
      00000000000000000000217B2900299431002184290029943100299431002994
      310021943100299431005ACE6B00000000000000000000000000000000000000
      0000ADADAD007B7B7B0000000000000000000000000000000000636363000000
      00000000000000000000000000000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000000000949494005A5A5A006B6B
      6B00636363005A5A5A005A5A5A00424242000000000000000000000000000000
      0000000000008C8C8C00000000000000000000000000000000004AB552000000
      000000000000000000000000000000000000186B2100299C310029943100319C
      390042AD4A00218C290042B55200000000000000000000000000000000000000
      000000000000737373000000000000000000000000005A5A5A0084848400A5A5
      A5000000000000000000000000000000000084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000007373730063636300000000000000000000000000000000000000
      0000949494005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      0000000000006363630000000000000000000000000000000000298C39000000
      000000000000000000000000000000000000298C310029943100218C310052C6
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520084848400848484007B7B
      7B00BDBDBD0000000000000000000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363000000000000000000000000000000
      0000000000006B6B6B005A5A5A005A5A5A004242420000000000000000000000
      0000A5A5A5004242420000000000000000000000000000000000106B21005ACE
      6B00000000000000000000000000105A1800299C31002194310039A542000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000000000000000737373007B7B7B00848484007B7B
      7B009C9C9C0000000000000000000000000084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000000000000000000000000
      000000000000ADADAD005A5A5A005A5A5A005A5A5A0029292900000000000000
      00007B7B7B0000000000000000000000000000000000000000000000000042B5
      52000000000000000000084A1000298C310029943100219431005ACE6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000006B6B6B008C8C8C000000
      00000000000000000000000000000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00525252005A5A5A0052525200393939006B6B
      6B004A4A4A000000000000000000000000000000000000000000000000001873
      2100319C4200186B2100218C310029943100218C290042B55200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009494940000000000000000007B7B7B00A5A5A5000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484005A5A5A005A5A5A005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000218C2900299C390029943100218C31004ABD5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300848484007373730084848400000000000000
      000000000000000000000000000000000000000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C006B6B6B00525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002184290031A5420052BD5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363008C8C8C00ADADAD00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE001010
      100000000000000000000000FF006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C6005252520052525200525252005252
      5200B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60052525200525252005252
      520052525200B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE001010
      100000000000000000000000CE006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000084848400B5B5B50084848400E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE001010
      100000000000000000000000CE00000000000000000000000000000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C6006363630063636300636363006363
      6300B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C60084848400C6C6C60063636300636363006363
      630063636300B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE001010
      100000000000000000000000CE00FFFFFF00FFFFFF00F7FFFF00000000000000
      9C000000FF000000000000000000000000000000000000000000000000008484
      8400B5B5B500B5B5B50084848400E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000000000000000000000000000000000000000000008484
      8400B5B5B50084848400E7E7E70084848400E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000CE000000CE0000009C00000000000000
      9C000000FF000000000000000000000000000000000000000000000000008484
      8400C6C6C6005252520084848400C6C6C600848484008484840084848400C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400848484008484
      8400C6C6C600B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C000000000000000000DEDEDE00FFFFFF00FFFFFF00F7FFFF00000000000000
      9C000000FF000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C60084848400E7E7E700C6C6C600E7E7E700C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400E7E7E70084848400E7E7E70084848400E7E7E700C6C6C600E7E7E700C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C004242
      420000000000000000000000CE000000CE000000CE0000009C00000000000000
      9C000000FF000000000000000000000000000000000000000000000000008484
      8400C6C6C6006363630084848400E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400C6C6C60084848400C6C6C60084848400E7E7E700E7E7E700E7E7E700E7E7
      E700848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C000000
      000000000000000000000000CE00FFFFFF00FFFFFF00F7FFFF00000000000000
      9C000000FF000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C60084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400E7E7E70084848400E7E7E700848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C000000
      00000000000000000000000000006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000000000000000000006363
      6300C6C6C600848484008484840084848400C6C6C600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300C6C6C60084848400E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      000000000000000000000000CE006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000063636300000000006363
      6300E7E7E7008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      000000000000000000000000CE006300FF000000CE000000CE000000CE000000
      9C00000000000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E7008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E7008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      00000000000000000000000000000000CE00000000000000000000009C000000
      9C00000000000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300848484008484840000000000000000000000
      0000000000000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000525252000000000000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242004242
      42000000000000000000C6C6C6000000000000BD0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C009C9C9C009C9C9C00DEDEDE009C9C9C0000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000424242000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042424200737373008484840000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300C6C6C600B5B5B500424242000000000000000000525252008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000005252
      5200848484008484840042424200000000000000000000000000000000000000
      0000000000000000000073737300424242000000000000000000000000005A5A
      5A00737373008484840000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300C6C6
      C600B5B5B5004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      0000525252009494940042424200000000000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000007373
      7300B5B5B5008484840084848400000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      0000000000005252520063636300424242000000000000000000000000000000
      000063636300424242000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B50084848400949494000000000000000000000000000000
      0000B5B5B5000000000000000000000000000000000000000000000000000000
      00004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052525200636363004242420000000000000000006363
      630042424200000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C0000000000000000000000
      0000B5B5B5000000000000000000000000000000000000000000000000004242
      4200CECECE00CECECE00D6D6D600C6C6C6004242420084848400424242000000
      000000000000000000000000000000000000000000000000000042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000525252006363630042424200636363004242
      420000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000B5B5B500000000000000000000000000000000000000000042424200CECE
      CE00CECECE00D6D6D600D6D6D600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520063636300424242000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600CECECE00DEDEDE009C9C9C000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200CECE
      CE00F7F7F700E7E7E700D6D6D600C6C6C600C6C6C60042424200000000000000
      00000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484006363630042424200636363004242
      420000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE009C9C9C00000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200D6D6
      D600D6D6D600D6D6D600C6C6C600A5A5A500A5A5A50042424200000000000000
      00000000000000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400636363004242420000000000000000006363
      630042424200000000000000000000000000000000000000000000000000C6C6
      C600DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200B5B5
      B500B5B5B500B5B5B500C6C6C600848484008484840042424200000000000000
      00000000000000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0063636300424242000000000000000000000000000000
      000063636300424242000000000000000000000000000000000000000000C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000000000000000000004242
      4200B5B5B500C6C6C60094949400848484004242420000000000000000000000
      00000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A50042424200000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200000000000000000000000000000000000000
      000000000000636363004242420000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C600848484004242420000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000073737300424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400848484004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700D6D6
      D600D6D6D600D6D6D600848484004A4A4A004A4A4A004A4A4A00000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484004A4A4A00E7E7
      E700D6D6D600D6D6D600CECECE00C6C6C600C6C6C6004A4A4A004A4A4A006363
      6300636363006363630063636300636363000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400B5B5B500B5B5B5004A4A
      4A00E7E7E700E7E7E700DEDEDE00DEDEDE00CECECE00CECECE004A4A4A008484
      8400848484008484840084848400848484000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000848484007373
      73005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400737373005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600525252005252
      520084848400E7E7E700E7E7E700DEDEDE00D6D6D600CECECE004A4A4A008484
      8400848484008484840084848400848484000000000000000000000000008484
      840000000000000000000000000000000000000000008484840084848400B5B5
      B500737373000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400B5B5B50073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600636363006363630063636300636363006363630000000000B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000000000000000B5B5
      B500000000000000000000000000000000009494940084848400B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000009494940084848400B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      00000000000000000000000000000000000084848400C6C6C600636363006363
      63006363630063636300B5B5B500000000000000000000000000000000006363
      630063636300636363006363630063636300000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6C600B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00C6C6C600C6C6C600B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600E7E7E700B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      00000000000000000000000000000000000084848400C6C6C600848484008484
      840084848400C6C6C600B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000009C9C9C00DEDEDE00CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700E7E7E700E7E7
      E700E7E7E7008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE000000000000000000000000000000000000000000000000009C9C9C00DEDE
      DE00C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000008484
      84000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000084848400848484008484
      84008484840084848400C6C6C600C6C6C6008484840000000000C6C6C6008484
      84008484840000000000848484000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C00000000008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848400000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500636363009494940063636300000000000000000084848400C6C6C6008484
      84008484840084848400FFFFFF00FFFFFF008484840000000000C6C6C6008484
      840084848400848484000000000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A000000000084848400B5B5B500EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B500B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C60063636300B5B5
      B500636363009494940063636300000000000000000084848400C6C6C6008484
      8400FFFFFF00C6C6C60084848400FFFFFF008484840000000000848484008484
      84008484840084848400848484000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B5000000000084848400EFEFEF00B5B5B500EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C600B5B5B500B5B5B500848484000000000084848400E7E7E7005252
      5200525252005252520052525200525252005252520052525200636363006363
      630063636300949494006363630000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00C6C6C600FFFFFF008484840000000000848484008484
      8400C6C6C60084848400848484000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C6000000000084848400EFEFEF00EFEFEF00B5B5
      B500E7E7E700D6D6D600C6C6C600A5A5A500B5B5B500DEDEDE00DEDEDE00D6D6
      D600B5B5B500D6D6D600B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600636363009C9C
      9C0063636300636363006363630000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000848484008484
      8400C6C6C600C6C6C600848484000000000042424200E7E7E7005A5A5A00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00DEDEDE005A5A5A00C6C6C6000000000084848400EFEFEF00EFEFEF00E7E7
      E700B5B5B500C6C6C600B5B5B500D6D6D600D6D6D600A5A5A500DEDEDE00B5B5
      B500D6D6D600D6D6D600B5B5B500848484000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300636363009C9C
      9C00B5B5B500636363000000000000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF0084848400FFFFFF008484840000000000848484008484
      840084848400848484008484840000000000424242005A5A5A0000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDE
      DE00EFEFEF00000000005A5A5A000000000084848400E7E7E700EFEFEF00D6D6
      D600C6C6C600B5B5B500DEDEDE00DEDEDE00DEDEDE00DEDEDE00A5A5A500DEDE
      DE00CECECE00D6D6D600B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600636363006363
      6300636363006363630063636300000000000000000084848400C6C6C6008484
      8400C6C6C6008484840084848400FFFFFF008484840000000000C6C6C600C6C6
      C60084848400C6C6C600848484000000000042424200B5B5B50000000000EFEF
      EF00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600DEDE
      DE00EFEFEF0000000000B5B5B5000000000084848400E7E7E700DEDEDE00C6C6
      C600B5B5B500E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00A5A5
      A500D6D6D600DEDEDE00B5B5B500848484000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500000000000000000000000000000000000000000084848400FFFFFF008484
      84008484840084848400FFFFFF00C6C6C6008484840000000000C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000000000008484840000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00EFEFEF0000000000212121000000000084848400E7E7E700D6D6D600B5B5
      B500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E700A5A5A500D6D6D600C6C6C600848484000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00848484008484840084848400848484008484840084848400000000008484
      8400C6C6C600C6C6C6008484840000000000000000000000000021212100EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF0000000000000000000000000084848400DEDEDE00B5B5B500F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00B5B5B500B5B5B500848484000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400C6C6C600C6C6C600848484008484
      840084848400000000000000000000000000000000000000000000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6E7
      E700DEDEDE0000000000000000000000000084848400B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700A5A5A500848484000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      000000000000000000000000000000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600848484008484840000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A000000000000000000000000008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848400000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400C6C6C60084848400848484008484840084848400C6C6C6008484
      840084848400848484000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF0084848400EFEF
      EF00DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A0052525200737373006363630063636300636363005A5A5A007373
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000007373
      73005A5A5A004A4A4A0094949400A5A5A5008484840063636300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      0000000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A500737373003939390073737300000000009C9C9C00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60052525200000000000000000000000000000000005252
      520094949400C6C6C600B5B5B500A5A5A5008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000212121005252
      5200848484008484840042424200636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000000000008484
      8400CECECE00C6C6C600B5B5B500A5A5A5008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      520000000000000000000000000000000000000000003939390063636300B5B5
      B500525252009494940042424200FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600636363004242420039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000848484008484
      840084848400C6C6C600B5B5B500A5A5A5008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      520000000000000000000000000000000000000000003939390063636300B5B5
      B500D6D6D6005252520063636300424242006363630063636300FFFFFF00F7F7
      F70063636300424242006363630039393900000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000848484008484
      84008484840084848400C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600848484000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      630052525200000000000000000000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700525252006363630042424200FFFFFF00FFFFFF006363
      630042424200B5B5B5006363630039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      8400848484008484840084848400DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600848484000000000000000000000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      63005252520000000000000000000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300525252006363630042424200636363004242
      4200C6C6C6009C9C9C004A4A4A0000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E70094949400E7E7E7009494940063636300CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      84008484840084848400C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600848484008484840000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500636363005252520000000000000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF0063636300525252006363630042424200CECE
      CE00B5B5B500848484003939390000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE00636363006363630063636300CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400C6C6C600DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500636363005252520000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600848484006363630042424200636363004242
      42009C9C9C00393939000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE006363630094949400E7E7E70094949400E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      84008484840084848400C6C6C600DEDEDE00DEDEDE00DEDEDE005A5A5A00DEDE
      DE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A00000000000000000000000000000000000000
      000039393900636363008484840063636300424242009C9C9C009C9C9C006363
      630042424200000000000000000000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400848484008484840084848400DEDEDE00DEDEDE00848484008484
      8400848484000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000063636300525252000000000000000000000000000000
      00004A4A4A004A4A4A0063636300424242005A5A5A005A5A5A00313131000000
      000063636300424242000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400848484008484840084848400C6C6C600DEDEDE00DEDEDE00CECE
      CE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      00000000000000000000000000006363630000000000000000004A4A4A004A4A
      4A008484840063636300424242007373730094949400848484004A4A4A000000
      000000000000636363004242420000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000848484008484
      84008484840084848400848484008484840084848400C6C6C600DEDEDE00CECE
      CE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420094949400B5B5B500A5A5A500DEDEDE00848484003939
      390000000000000000007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A0000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600D6D6D600D6D6D600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A5007373730039393900000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600C6C6C600C6C6C600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE004A4A4A000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      630094949400636363000000000000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C0039393900000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A0000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B5000000000094949400000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B50094949400000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      63006363630094949400636363000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A00A5A5A500A5A5A5004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000009494940094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B500848484003939390000000000000000004A4A4A00A5A5A5004A4A
      4A00CECECE004A4A4A00A5A5A5004A4A4A00CECECE004A4A4A00A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B50094949400000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B5006363630000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C0039393900000000000000000000000000000000004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A004A4A4A00CECECE00CECECE004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      7300393939000000000000000000000000000000000000000000000000004A4A
      4A00CECECE00CECECE00CECECE004A4A4A00CECECE00CECECE00CECECE004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A00CECECE004A4A4A00000000004A4A4A00CECECE004A4A4A000000
      00004A4A4A00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A4A000000
      0000000000004A4A4A004A4A4A0000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A000000000000000000000000004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFEF
      EF00D6D6D600B5B5B500C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363005A5A5A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      94009C9C9C009C9C9C00F7F7F700B5B5B5009C9C9C009C9C9C00B5B5B500FFFF
      FF00B5B5B500949494009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000006363630073737300737373007373
      730063636300C6C6C600636363005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0084848400C6C6C60094949400949494009C9C
      9C009494940094949400F7F7F700B5B5B5009494940094949400CECECE00DEDE
      DE00949494009C9C9C0094949400B5B5B50084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400949494009C9C9C00F7F7F700B5B5B5009C9C9C0094949400F7F7F700B5B5
      B500949494009C9C9C009C9C9C009C9C9C0084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      630000000000000000000000000000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400D6D6D600C6C6C600CECECE00CECE
      CE00B5B5B50094949400F7F7F700C6C6C600B5B5B500DEDEDE00DEDEDE009494
      9400949494009C9C9C00949494009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A5008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0084848400F7F7F700CECECE00C6C6C600CECE
      CE00F7F7F700D6D6D600F7F7F700DEDEDE00DEDEDE00EFEFEF00D6D6D600B5B5
      B500F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C600949494009C9C9C009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400C6C6C600F7F7
      F700F7F7F7009C9C9C0094949400B5B5B50084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      940094949400EFEFEF00FFFFFF00B5B5B500949494009494940094949400FFFF
      FF00F7F7F700B5B5B5009C9C9C009C9C9C0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400B5B5B500FFFF
      FF00F7F7F7009C9C9C009C9C9C009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C6009494940094949400C6C6
      C600F7F7F700C6C6C600FFFFFF00C6C6C600C6C6C600CECECE00EFEFEF00DEDE
      DE00F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000007373730063636300000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600B5B5B500EFEFEF00EFEF
      EF00B5B5B5009C9C9C00CECECE00D6D6D600D6D6D600CECECE00C6C6C6009C9C
      9C00F7F7F7009C9C9C0094949400B5B5B50084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600F7F7F700C6C6C6009494
      94009C9C9C0094949400949494009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00C6C6C600949494009494
      9400949494009C9C9C0094949400949494009494940094949400949494009494
      9400F7F7F7009C9C9C009C9C9C009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C6009C9C9C009494
      9400949494009C9C9C00949494009C9C9C00949494009C9C9C009C9C9C009494
      9400F7F7F700B5B5B5009C9C9C009C9C9C008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400DEDEDE00F7F7F700B5B5B5009C9C
      9C00B5B5B500B5B5B50094949400949494009C9C9C00D6D6D600D6D6D600CECE
      CE00FFFFFF00D6D6D600D6D6D600DEDEDE00000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600CECECE00F7F7F700E7E7
      E700F7F7F700CECECE009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400FFFFFF00DEDEDE009494
      940094949400FFFFFF0094949400949494009494940094949400FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400FFFFFF00FFFFFF00A5A5
      A500A5A5A500FFFFFF00A5A5A500A5A5A500A5A5A500A5A5A500FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00DEDEDE00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400FFFFFF00FFFFFF00B5B5
      B500B5B5B500FFFFFF00B5B5B500B5B5B500B5B5B500B5B5B500FFFFFF00CECE
      CE00000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00FFFFFF00DEDE
      DE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE000808080000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400FFFFFF00CECECE00CECE
      CE00DEDEDE00FFFFFF00DEDEDE00CECECE0000000000CECECE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400FFFFFF00003100000031
      0000CECECE00FFFFFF00CECECE0000310000CECECE0000000000CECECE00CECE
      CE000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400FFFFFF009C9C9C00D6D6
      D60000310000CECECE0000310000CECECE0094949400CECECE00000000000000
      00000808080000000000080808000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00FFFFFF009C9C
      9C00D6D6D60000310000CECECE0094949400CECECE00949494009C9C9C009C9C
      9C009C9C9C00000000009C9C9C009C9C9C0042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000008484840084848400848484008484
      84009C9C9C00D6D6D60000310000CECECE0094949400C6C6C600C6C6C600C6C6
      C6009C9C9C009C9C9C00B5B5B500B5B5B50042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D60000310000E7E7E700E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7
      E700E7E7E7009C9C9C00CECECE00CECECE00000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFFFFF009C9C9C009C9C9C000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00949494009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A5009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A500A5A5
      A500949494009494940094949400636363000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700E7E7E70063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000063636300636363006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      63000000000084848400848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840063636300CECECE0042424200A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840063636300CECECE00FFFFFF00A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400E7E7E700A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400E7E7E700A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400E7E7
      E700424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
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
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000F00000000100010000000000800700000000000000000000
      000000000000000000000000FFFFFF0086010000000000008201000000000000
      C200000000000000E000000000000000F001000000000000F001000000000000
      8001000000000000800100000000000080030000000000008007000000000000
      800700000000000080130000000000008039000000000000807C000000000000
      00FF00000000000001FF000000000000C7E3FFFFFFC7E001C7E3F81FFF81C001
      C7E3C003FE008001C7E38001F8038001C7E38001E0078001C7E3800180078001
      C007800100078001C00F800100078001C007800100078001C7E3800100078001
      C7E3800300078001C7E3C007000F8001C7E3E007001F8001C003F01F003F8001
      C007F83F03FF8003C00FFFFF8FFF8007FFFFFFFFFFFF80008003FE7FFFCF0000
      8003FC3FFFC70000C3FBF003F8030000E1FBE003F8010000F0FFC003F8038000
      F87FC003FFC70000FC3FC003FFCF0000FC3FC003F3FF0000F87F8001E3FF8000
      F0FF8003C03F8000E1FBC007803F8000C3FBE00FC03F80008003F03FE3FF8000
      8003F93FF3FF8000FFFFFFFFFFFF803EFFBFFFFFFFFFFFFF001FFFFFFFFFFE7F
      001FF3FFFFEFFC3F0007E1FFFFC7F9BF0007E0FDBF07F9DF0007C07DBE03E0FF
      0007C03D9C03F1FF000380399C01F3DF000380FBDF01FB8F0001F0FBDF0FFF07
      0004F873CE1FFB070006F837EC1FFD9F0007FC07E03FFD9F0007FE0FF07FFC3F
      C007FF1FF8FFFE3FC007FFFFFFFFFFFFFC03FE01FFFFCE0FFC03FE01FFFFC007
      FC03F801FCFFC007FC03F801F33FC007E003E001F7B7C007E003E001EFE3C807
      E003E001EFCFC807E003E001F41FC807E007E003F5FFC807E00FE007F83FC807
      E01FE00FFBFF8807A01FA01FF3FF9C07C03FC03FF3FF9C0B007F007FF3FF9E13
      C7FFC7FFFFFF8007ABFFABFFFFFFC003FFFFFFFFFFF887FFCFE3FFFFFFF083FF
      C7E3FFE3FFE0C3FEC3E3FFC3FFC1E1FCC1E3FF83FF83F1F9C0E3FF07FF07F8F3
      C063F00FE00FFC67C023E01FC01FFE0FC023C03F803FFF1FC063C03F003FFE0F
      C0E3C03F003FFC67C1E3C03F003FF0F3C3E3E07F003FC1F9C7E3F0FF807F83FC
      CFE3FFFFC0FF07FFFFFFFFFFE1FF0FFFFFFFFFFFFFFFFFFF00FFC7F3FF9FF3FF
      0020C7E3FF1FF1FF0000C7C3FE1FF0FF0000C783FC1FF07F0000C703F81FF03F
      0020C603F01FF01F00E0C403E01FF00F00FFC403E01FF00F00FFC603F01FF01F
      00FFC703F81FF03F01FFC783FC1FF07F03FFC7C3FE1FF0FFFFFFC7E3FF1FF1FF
      FFFFC7F3FF9FF3FFFFFFFFFFFFFFFFFFFE07FE3F0000FFFFFDE3E0070000FFFF
      8001800100000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000080010000
      80070000C003000080070000C003000080070000C0030000800FC001C003FFFF
      801FF80FC007FFFF803FFFFFC00FFFFF8007FFFFC00FFFBF80038001E01F8007
      C0008001E03F8007C0008001E00F800780008001C007800780008001C0078007
      8000800180078007C001800180038003C001800180078003E003800180078001
      F007800180078004F013800180078006C0198001C007800F800C8001C007801F
      000F8001E007803F080FFFFFF00FFFFFFFFFFFFFFFFFF007000FFFFFFFFFE003
      0007E000FE07E0010003C000FDE3C0010001C000FBF180000001800080718000
      0001800080518000000100008041C001000100008041C001800100008043E003
      C00180008041F007E0018000807FFC1FF1118000807FFC1FF999C07F80FFF80F
      FDDDE0FF81FFF80FFFFFFFFFFFFFF80FFE000000FFBF007F00000000001F007F
      00000000001F8003000000000007C003000000000007C0070000000000078007
      0000000000070007000000000003000300000000000300030000000000010001
      000000000004000300000000000680030000000000078001000000000007C001
      00000000C007FC01FFFF0000C007FE0780010007FF18FFFFFFFF0007FC000000
      80010007F0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000700010000000100078001000055D9000700000000
      000000000000000077760000000000008001000000010000FFFFF80080030000
      8001FC00C0070000FFFFFE00E00FFFFF87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object ilColor: TImageList
    Left = 56
    Top = 444
    Bitmap = {
      494C01013B007800400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000F0000000010020000000000000F0
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C000000000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000CEFF0000CEFF0000CE
      FF0000CEFF0000CEFF000000000000000000000000000000000000CEFF0000AD
      FF0000B5FF0000BDFF0000BDFF000000000000000000000000000000000000AD
      FF00000000000000000000000000000000000000000000000000000000000000
      000000A5FF0000ADFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE0000000000848484009CFFFF00CE310000CE310000CE31
      0000CE310000C6C6C600000000000000FF000000000000D6FF0000D6FF0000CE
      FF0000C6FF0000000000000000000000000000000000000000000000000000C6
      FF0000C6FF0000CEFF0000CEFF0000000000000000000000000000C6FF0000BD
      FF0000ADFF000000000000A5FF00000000000000000000A5FF000000000000A5
      FF0000ADFF0000ADFF0000B5FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      CE00319CFF000000FF0000009C0084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00C6C6C6000000FF0000009C000000000000DEFF0008D6FF0000D6
      FF0000CEFF0000CEFF000000000000000000000000000000000000C6FF0000CE
      FF0000D6FF0000D6FF0000DEFF00000000000000000000CEFF0000D6FF0000CE
      FF0000C6FF0000B5FF0000A5FF00000000000000000000ADFF0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000063FF0000009C00848484009CFFFF00FF000000FF000000FF00
      0000FF0000000000FF0000009C00000000000000000000E7FF0010BDFF0000D6
      FF0000CEFF0000CEFF0000CEFF00000000000000000000CEFF0000D6FF0000DE
      FF0000E7FF0000BDFF0000EFFF0000000000000000000000000000D6FF0000D6
      FF0000CEFF0000C6FF0000ADFF00000000000000000000B5FF0000CEFF0000CE
      FF0000CEFF0000CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000CE000000FF0000009C00FFFFFF009CFFFF00FFFFFF009CFF
      FF000000FF0000009C0000000000000000000000000000B5FF00FFCEAD0000BD
      FF0000CEFF0000BDFF000000000000000000000000000000000000C6FF0000EF
      FF0000BDFF000000000000B5FF000000000000000000000000000000000000E7
      FF0000DEFF00CECEBD00D6D6C600FFD6B500FFD6B500EFCEB500E7CEB50000DE
      FF0000DEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000CE000000FF0000009C00FF633100FF6331000000
      FF0000009C00C6C6C60000000000000000000000000000000000FFCEAD000000
      000000B5FF0000000000000000000000000000000000000000000000000000BD
      FF0000000000000000000000000000000000000000000000000000EFFF0000E7
      FF0000DEFF007BA5A50000BDFF00000000000000000000C6FF0084DED60000E7
      FF0000E7FF0000E7FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600848484009CFFFF00FF0000000000CE000000FF0000009C000000FF000000
      9C00848484000000000000000000000000000000000000000000FFCEAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADA59C0000000000000000000000000000000000FFD6B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484009CFFFF00CE31
      000084848400FFFFFF009CFFFF00848484000000CE000000FF0000009C00FFFF
      FF00848484000000000000000000000000000000000000000000FFCEBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5A50000000000000000000000000000000000FFD6B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00848484009CFFFF00FF6331000000CE000000FF0000009C000000CE000000
      9C00848484000000000000000000000000000000000000000000FFDEBD000000
      000000ADFF0000000000000000000000000000000000000000000000000000B5
      FF0000000000000000000000000000000000000000000000000000CEFF0000C6
      FF0000BDFF00ADBDBD0000B5FF00000000000000000000B5FF00BDCECE0000C6
      FF0000C6FF0000D6FF0000D6FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484009CFFFF00FF00
      000084848400FFFFFF000000CE000000FF0000009C0084848400000000000000
      CE0000009C0000000000000000000000000000000000009CFF00FFCEBD0000AD
      FF0000A5FF0000B5FF000000000000000000000000000000000000BDFF0000BD
      FF0000B5FF0000000000009CFF0000000000000000000000000000C6FF0000BD
      FF0000BDFF007BB5BD00528C9C00848473008C847B007B9494008CC6C60000D6
      FF0000D6FF0000CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF000000CE000000CE000000FF0000009C00FFFFFF0084848400000000000000
      00000000CE0000009C0000000000000000000000000000BDFF0010B5FF0000BD
      FF0000BDFF0000B5FF0000C6FF00000000000000000000CEFF0000D6FF0000CE
      FF0000C6FF0000B5FF0000B5FF0000000000000000000000000000C6FF0000C6
      FF0000CEFF0000D6FF0000B5FF00000000000000000000ADFF0000DEFF0000D6
      FF0000D6FF0000C6FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000CE000000
      CE00319CFF000000FF0000009C00848484008484840084848400000000000000
      0000000000000000CE0000009C00000000000000000000CEFF0008CEFF0000CE
      FF0000CEFF0000C6FF000000000000000000000000000000000000CEFF0000D6
      FF0000CEFF0000C6FF0000BDFF00000000000000000000C6FF0000D6FF0000D6
      FF0000DEFF0000E7FF0000B5FF00000000000000000000A5FF0000E7FF0000DE
      FF0000D6FF0000CEFF0000C6FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0084848400000000000000000000000000000000000000
      000000000000000000000000CE0000009C000000000000DEFF0000DEFF0031DE
      EF0039CEEF00FFD6B500FFD6B500FFD6B500FFD6B500FFCEAD00FFCEAD0031CE
      EF0031D6EF0000D6FF0000CEFF00000000000000000000C6FF0000E7FF0000E7
      FF0000BDFF0000B5FF0000B5FF00000000000000000000A5FF0000ADFF0000B5
      FF0000DEFF0000D6FF0000C6FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000EFFF0000EFFF0000EF
      FF0000EFFF0000CEFF000000000000000000000000000000000000D6FF0000F7
      FF0000E7FF0000DEFF0000D6FF0000000000000000000000000000C6FF0000C6
      FF00000000000000000000000000000000000000000000000000000000000000
      000000B5FF0000BDFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C00848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B9C8C006B9C
      8C006B9C94000000000000000000000000000000000000000000000000006B9C
      8C006B9C8C006B9C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA594000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA58C0000000000000000000000000000000000000000000000
      0000000000008C7BAD0073529C00523984004A31840063398400846BA5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6F7FF000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA594000000000000000000000000000000000000000000000000006BA5
      94006BA58C006BA58C0000000000000000000000000000000000523184004210
      9C004218AD004218B5004218B5004210B5004218B5004218B5005221C6006331
      C6005A29B5007352B50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6F7FF00D6F7FF00D6F7FF000000
      0000000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600C6C6
      C600C6C6C60000000000000000000000000000000000000000006BA58C006BA5
      8C006BA594000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA58C000000000000000000000000008463CE005A29CE005229
      CE005229C6004A21BD004A18B5004218B5004218BD005221BD004A18BD005229
      C6005229CE005A29CE004218BD00000000000000000000000000000000000000
      00000000000000000000D6F7FF00D6F7FF00D6F7FF00D6F7FF00D6F7FF000000
      0000000000004A4A4A00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484840084848400C6C6
      C600C6C6C60000000000000000000000000000000000000000006BA58C006BA5
      8C006BA594000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA594000000000000000000000000006331C600734AE7006B42
      DE006B42E7006B42DE006331D6006339D6006B39D6005A31C6005A29C6005221
      BD005221C6006339D6005A29CE00000000000000000000000000000000000000
      0000D6F7FF00D6F7FF00DE4A0000DE4A0000D6F7FF00D6F7FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00848484008484
      8400C6C6C60000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA594000000000000000000000000006B42DE006B42DE007B52
      E700734AE7006B42E7006B42E7007B4AE7007B52E700845AE7006B39CE005A29
      C6004A18BD005229C6005A29CE00000000000000000000000000D6F7FF00D6F7
      FF0000009400D6F7FF00DE4A00009431000094310000D6F7FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008484
      84008484840000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C006BA58C0063A58C0063A58C0063A58C006BA58C006BA58C006BA5
      8C006BA58C00000000000000000000000000000000006B42E7007B4AE7008452
      EF00734AE7007B52EF00845AE700BDA5E700D6CEDE00DECEE700A57BE700734A
      DE005221BD004A21BD005229AD000000000000000000D6F7FF00D6F7FF000000
      940000009400D6F7FF00D6F7FF00D6F7FF0094310000D6F7FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      00008484840000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C006BA58C006BA58C006BA58C006BA58C006BA58C006BA58C006BA5
      8C000000000000000000000000000000000000000000734AE7007B4AE7007B52
      EF00946BE700B59CDE00D6C6D600DECED600E7DEDE00DED6D600D6CEE7008C63
      E7005221BD005221BD0042188C000000000000000000D6F7FF0000009400D6F7
      FF00D6F7FF00D6F7FF00D6F7FF00D6F7FF00734A0000D6F7FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C0063A594006BA594006BA594006BA594006BA58C006BA58C006BA5
      8C006BA58C00000000000000000000000000000000006339BD006B42A500845A
      94009C849C00AD9CAD00CEC6CE00E7DEE700DED6DE00D6C6CE00EFE7E700AD8C
      C6006339CE005A31C6004A2984000000000000000000D6F7FF000000DE00D6F7
      FF00D6F7FF00D6F7FF00D6F7FF00734A0000734A0000D6F7FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA58C0000000000000000000000000039104A00634284008463
      94007B5A7B006B426B00522952005A315A007B5273008C6B8C008C738C006339
      6300734AAD006339BD008C73A5000000000000000000D6F7FF000000DE00D6F7
      FF00D6F7FF00D6F7FF00734A0000734A0000D6F7FF00D6F7FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA594000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA59400000000000000000000000000421873006331BD006B39
      BD006B39C6006B39BD007B4ABD008452BD008C63B5008463A5007B5A94007352
      840073527B0063397300000000000000000000000000D6F7FF000000DE000000
      FF00D6F7FF00D6F7FF00D6F7FF00D6F7FF00FFFFFF00B5E7FF004A4A4A008CD6
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA58C0000000000000000000000000000000000522994007342
      C6006B39C6006B39C6006B39BD006331BD006331BD005A29B5005A29B5005A29
      B5004A21840000000000000000000000000000000000D6F7FF000000FF000000
      FF00D6F7FF00D6F7FF004A4A4A008CD6FF008CD6FF008CD6FF008CD6FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C000000000000000000000000000000000000000000000000006BA5
      8C006BA58C006BA58C0000000000000000000000000000000000000000005A31
      9C008C5AD6006B39C6006B39BD006331BD006331B5005A29B5005A29B5005229
      9C007B63940000000000000000000000000000000000D6F7FF00D6F7FF00D6F7
      FF00D6F7FF00B5E7FF004A4A4A008CD6FF008CD6FF008CD6FF00D6F7FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C006BA58C006BA594006BA594006BA594006BA58C006BA58C006BA5
      8C006BA58C006BA58C0000000000000000000000000000000000000000000000
      00006B429C006B42C6006339BD004A21A5004A18A5004A18A500633194000000
      00000000000000000000000000000000000000000000D6F7FF00D6F7FF00B5E7
      FF004A4A4A008CD6FF008CD6FF0000000000D6F7FF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000006BA58C006BA5
      8C006BA58C006BA58C006BA58C006BA58C006BA58C006BA58C006BA58C006BA5
      8C006BA58C000000000000000000000000000000000000000000000000000000
      0000000000007B5AA5005221AD004218A5004218940042217300000000000000
      00000000000000000000000000000000000000000000B5E7FF004A4A4A008CD6
      FF008CD6FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000073A5940073A5
      940073A5940073A5940073A5940073A5940073A5940073A594006BA594006BA5
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CD6FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5BDBD00C6CECE00B5B5B500B5BD
      BD00C6C6C600BDC6C600ADADAD00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094636300A57B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000000000000000000000000000000000000FFFFFF00B5B5B5009C9C9C009C9C
      9400949C9C00949C9C00949C9C009C9C94002131B5001829D600636B73002931
      A5001029BD001829A5004A637B00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C636300946B6B00BDA59C0094636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      310084000000000000000000000000000000FFFFFF0021730800316310001042
      000010210800081008000810080018311000293921001839A500425AA5001831
      BD001829CE001021C60039526B00F7F7F7000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C5A6300E7C69C00FFCE94009C737B00FFF7F700F7E7D600A57B6B007B52
      4A00AD8473009463630000000000000000000000000000000000000000000000
      0000000000009C0000008400000084000000840000008400000084000000FFFF
      9C00FFCE3100840000000000000000000000FFFFFF0018630000215A10001042
      000010290000001000000010000008180000102108001829C6001829C6001829
      C6001829C6001021BD00395A6B00F7F7F7000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C73
      7300D6BDAD00F7D6A500F7C68C009C737B00FFF7EF00F7DED600A57363006B42
      4200D6AD8C00CE946B0000000000000000000000000000000000000000000000
      00000000000084000000FFCE3100FFCE3100FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFCE31008400000000000000FFFFFF00949C9C00637B7300215A
      1000214210000831000021421000184A1000213918001829C6001829C6001829
      C6001829CE001829C600425A6B00F7F7F7000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD9C9C00FFF7
      E700FFE7CE00F7CEA500FFC68C00A5848400FFFFFF00F7E7D6009C6B63006342
      4200D6A58400CE94730000000000000000000000000000000000000000000000
      00000000000084000000840000009C0000009C0000009C0000009C000000FFCE
      3100FFCE31009C0000000000000000000000000000002163210031841000215A
      0800295A2100084200002963180039733100214221001021BD002131CE001829
      C6001829C6001829C600425A6B00F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA59C00FFEF
      DE00FFE7CE00FFD6A500EFB584009C7B7B00FFFFFF00FFEFDE00DEBDAD009C6B
      6B00D6A58400CE94730000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      31009C000000000000000000000000000000FFFFFF00317B290031842100105A
      000031732100185A0800296B1800529C5200214A63001829CE001829C6001829
      C6001829CE001829C6004A5A6B00F7F7F7000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000CEB5B500FFDE
      CE00B5ADA500087BCE00009CF7000084D60073849400FFF7E700FFE7CE00F7D6
      AD00F7CE9C00BD8C6B0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C0000009C00
      000000000000000000000000000000000000FFFFFF00216B1800297B21002173
      1000428C3900429439003184290063AD63001021390010107B0018189C001821
      BD001029C6001829C60000000800848C8C000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C005284
      A5000873C6000094F70000A5FF0000A5FF00087BCE00F7DECE00FFEFD600F7D6
      AD00F7CE9C00C68C630000000000000000000000000000000000000000000000
      0000840000009C00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF003184310031944A00106B
      210031844200298C290031843900529C63001010100000000000000000001818
      6B0018188C001821AD0000000800BDC6C6000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008CD60000A5E700008C
      EF00007BE700007BE700008CEF0000ADFF0000ADFF00217BB500BD9C9400F7CE
      A500B58C73000084D6000884CE00000000000000000000000000000000008400
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042C6E70008BDF70000B5
      EF0008B5F70000B5EF0000C6F70018C6F7000808080000000000000000000000
      0000080808002121420000000800949494000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000894DE0000CEFF0000A5
      EF000084E7000073E7000084EF0000A5F70000ADFF00008CEF00397BAD00A584
      7300317BAD000884CE000000000000000000000000000000000084000000FFCE
      3100FFFF9C008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000042ADCE0000A5E70000AD
      E70000ADE70008BDF70000BDF700215A73000000000000000000000000000000
      0000000000004A525A007B7B8400B5B5B500000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000087BC60000C6
      FF0000ADF700007BE7000073DE00008CEF00009CF70000ADFF000094FF001894
      D6001084CE000000000000000000000000000000000084000000FFCE3100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE310084000000000000000000
      0000000000000000000000000000000000000000000042ADCE000094D60008A5
      E700009CE70008ADEF0000B5E700181018000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A5
      E70000C6FF00008CE7000073DE000084EF000094F700009CEF00088CDE00087B
      C6000000000000000000000000000000000000000000000000009C000000FFCE
      3100FFCE31009C0000009C0000009C0000008400000084000000000000000000
      00000000000000000000000000000000000000000000318CC6000894DE000094
      DE00009CDE0000ADE70000B5E700424242000000000000000000000000000000
      00000000000000000000000000008C8C940000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000884CE0000A5E7000884D600087BC6000839CE000863DE00000000000000
      0000000000000000000000000000000000000000000000000000000000009C00
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000399CC600189CD6000894
      E7000094DE00089CE70010B5EF00292929000000000000000000000000000000
      0000000000000000080084848C00B5BDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000087BCE0000A5E70000000000084A8400105A9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C0000009C00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319CBD004A6B8400008C
      DE0031ADDE0008ADEF00189CBD00212110000800000000000000000000000808
      0800000000000000000008080800D6D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEF7FF00FFEFF700C6EF
      FF00FFFFFF00C6EFFF00C6F7FF00F7EFEF00CEF7FF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000319C39001873210000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE4A18008C21080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002184
      3100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000319C3900187B210039A54A0018732100000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000000000000FFAD
      6B00FF4A0000EF4200008C210800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000218429002994
      310052BD5A000000000000000000000000000000000000000000000000000000
      0000000000004AB55200218C290000000000000000004AB55A00000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000000000000FF73
      2900FF420000FF4A0000F74200008C2108000000000000000000000000000000
      00000000000000000000D67339000000000000000000399C4A00000000000000
      000000000000000000000000000000000000084A1000298C3100299431002194
      310031A542000000000000000000000000000000000000000000000000000000
      000000000000319C390021842900000000000000000000000000319442000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000FFAD6B00FF42
      0000FF4A0000FF4A0000FF4A0000FF4A00008C21080000000000000000000000
      00000000000000000000DE6329000000000000000000318C3900000000000000
      0000000000000000000000000000084A10002994310029943100299431002994
      3100299431005AC6630000000000000000000000000000000000000000004AB5
      5200218C29002994310029943100187B29000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000FF732900FF42
      0000FF4A0000FF4A0000FF4A0000FF4A0000F74A00008C210800000000000000
      00000000000000000000CE4210000000000000000000187329006BDE7B000000
      000000000000000000000842100029943100299C310029943100299431002994
      31002194310039A5420000000000000000000000000000000000000000000000
      0000319C390029943100218C3100000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C00000000000000000000000000FFB57300FF4A0000FF42
      0000FF420000FF4A0000FF4A0000EF420000FF4A0000CE390000000000000000
      000000000000FFAD6300B52900000000000000000000105A18005ACE6B000000
      00000000000000000000217B2900299431002184290029943100299431002994
      310021943100299431005ACE6B00000000000000000000000000000000000000
      00005AC66300218C310000000000000000000000000000000000217329000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C00000000000000000000000000FF944A00FF390000FF63
      1800FF5A1000FF420000FF4A0000C63100000000000000000000000000000000
      000000000000FF8C4200000000000000000000000000000000004AB552000000
      000000000000000000000000000000000000186B2100299C310029943100319C
      390042AD4A00218C290042B55200000000000000000000000000000000000000
      00000000000029843100000000000000000000000000186B2100299431004AB5
      52000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C00000000000000000000000000000000000000
      0000FF9C5200FF420000FF4A0000FF4A00000000000000000000000000000000
      000000000000F75A180000000000000000000000000000000000298C39000000
      000000000000000000000000000000000000298C310029943100218C310052C6
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000105A180029943100299431002994
      310063CE730000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE0000009C000000000000000000000000000000
      000000000000FF632100FF420000FF4A0000C631000000000000000000000000
      0000FFAD6300C631000000000000000000000000000000000000106B21005ACE
      6B00000000000000000000000000105A1800299C31002194310039A542000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003194420000000000000000002184290029943100299431002994
      310042AD4A0000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000CE000000000000000000000000000000
      000000000000FFB57300FF4A0000FF420000FF4A000094210800000000000000
      0000FF73290000000000000000000000000000000000000000000000000042B5
      52000000000000000000084A1000298C310029943100219431005ACE6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BDE73000000000000000000217B2900319C39000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF8C4A00FF420000FF4A0000EF420000A5290800E763
      2100D63908000000000000000000000000000000000000000000000000001873
      2100319C4200186B2100218C310029943100218C290042B55200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042A54A000000000000000000218C29004AB552000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF843900FF420000FF420000FF4A0000F742
      0000000000000000000000000000000000000000000000000000000000000000
      0000218C2900299C390029943100218C31004ABD5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000018732100319439002184290029943100000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9C5A00FF631800EF4200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002184290031A5420052BD5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000018732100319C390052C66300000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000CECECE001010
      100000000000000000000000FF006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484009CFFFF00CE310000CE310000CE31
      0000CE310000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000848484009CFFFF00CE310000CE310000CE31
      0000CE310000C6C6C6000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000CECECE001010
      100000000000000000000000CE006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      00000000000084848400C6C6C60084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00C6C6C6000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000CECECE001010
      100000000000000000000000CE00000000000000000000000000000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484009CFFFF00FF000000FF000000FF00
      0000FF000000C6C6C60000000000000000000000000000000000000000000000
      000000000000848484009CFFFF00848484009CFFFF00FF000000FF000000FF00
      0000FF000000C6C6C6000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000CECECE001010
      100000000000000000000000CE00FFFFFF00FFFFFF00F7FFFF00000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C60084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000008484
      8400C6C6C60084848400FFFFFF0084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00C6C6C6000000000000000000FF000000FF000000FF000000FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF0000000000000000000000000000000000
      000000000000000000000000CE000000CE000000CE0000009C00000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000848484009CFFFF00CE310000848484009CFFFF00FF633100FF633100FF63
      31009CFFFF00C6C6C60000000000000000000000000000000000000000008484
      84009CFFFF00848484009CFFFF00848484009CFFFF00FF633100FF633100FF63
      31009CFFFF00C6C6C6000000000000000000FF000000FF000000FF000000FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF0000000000000000000000000000009C9C
      9C000000000000000000DEDEDE00FFFFFF00FFFFFF00F7FFFF00000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF009CFFFF0084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF00848484000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF0084848400FFFFFF009CFFFF00FFFFFF009CFF
      FF0084848400000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF00000000000000000000009C9C9C004242
      420000000000000000000000CE000000CE000000CE0000009C00000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      0000848484009CFFFF00FF00000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000008484
      84009CFFFF00848484009CFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000000000009C9C9C000000
      000000000000000000000000CE00FFFFFF00FFFFFF00F7FFFF00000000000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF009CFFFF00848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400FFFFFF0084848400FFFFFF00848484008484840084848400848484008484
      840084848400000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000000000009C9C9C000000
      00000000000000000000000000006300FF000000CE000000CE000000CE000000
      9C000000FF000000000000000000000000000000000000000000000000000000
      000031CEFF009CFFFF00FF633100FF633100FF6331009CFFFF00C6C6C6000000
      00000000000000000000000000000000000000000000000000000000000031CE
      FF009CFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000424242000000
      000000000000000000000000CE006300FF000000CE000000CE000000CE000000
      9C000000FF00000000000000000000000000000000000000000031CEFF000000
      000031CEFF00FFFFFF0031CEFF00FFFFFF009CFFFF0084848400000000000000
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000424242000000
      000000000000000000000000CE006300FF000000CE000000CE000000CE000000
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000424242000000
      00000000000000000000000000000000CE00000000000000000000009C000000
      9C00000000000000000000000000000000000000000031CEFF0031CEFF0031CE
      FF008484840031CEFF0031CEFF0031CEFF008484840084848400000000000000
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00848484008484840000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000424242000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00005252520000000000000000000000000000000000000000000000000031CE
      FF0031CEFF0031CEFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000424242004242
      42000000000000000000C6C6C6000000000000BD0000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000031CEFF000000
      000031CEFF000000000031CEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000009C9C
      9C009C9C9C009C9C9C00DEDEDE009C9C9C0000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031636300639CCE0000000000000000003131CE003131CE000063
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000316363009CCECE00C6D6EF000000000000000000000000003131CE00319C
      FF000063FF000000CE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000003131
      CE00319CFF000000FF0000009C00000000000000000000000000000000000000
      000000000000000000000000FF0000009C00000000000000000000000000FF63
      0000FF633100FF63000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000316363009CCE
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      00000000CE000063FF0000009C00000000000000000000000000000000000000
      0000000000000000FF0000009C0000000000000000000000000000000000FF63
      3100FF9C3100FF633100FF630000000000000000000000000000000000000000
      0000FF6331000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE00C6D6
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE000000FF0000009C000000000000000000000000000000
      00000000FF0000009C000000000000000000000000000000000000000000FF9C
      3100FF9C3100FF9C3100FF633100FF6300000000000000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE009CCECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF0000009C0000000000000000000000
      FF0000009C00000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FFCE3100FFCE3100FF633100FF63310000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000000000000000
      0000CECE3100CECE3100FFFF9C00CECE310000000000319CCE00000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF0000009C000000FF000000
      9C0000000000000000000000000000000000000000000000000000000000FF9C
      3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      0000FF9C3100000000000000000000000000000000000000000000000000CECE
      3100CECE3100FFFF9C00FFFF9C00CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE000000FF0000009C000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFCE3100FFFF9C00FFFFCE00FF6331000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000FFFF
      CE00FFFFFF00FFEFCE00FFFF9C00CECE3100CECE310000000000000000000000
      00000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF0000009C000000CE000000
      9C0000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFF9C00FFFFCE00FF633100000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000FFFF
      9C00FFFF9C00FFFF9C00FFCE6300CE9C3100CE9C310000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF0000009C0000000000000000000000
      CE0000009C00000000000000000000000000000000000000000000000000FFCE
      3100FFFFCE00FF63310000000000000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000CECE
      6300CECE6300CECE6300CECE31009C9C31009C9C310000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000CE000000FF0000009C000000000000000000000000000000
      00000000CE0000009C000000000000000000000000000000000000000000FFCE
      3100FF9C63000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      0000CECE6300CECE3100CE9C31009C9C31000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE00319CFF000000FF0000009C00000000000000000000000000000000000000
      0000000000000000CE0000009C0000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C31000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      000000000000000000000000CE0000009C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700D6D6
      D600D6D6D600D6D6D60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000E7E7
      E700D6D6D600D6D6D600CECECE00C6C6C600C6C6C60000000000000000009C00
      9C009C009C009C009C009C009C009C009C00000000000000000000000000FF63
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF630000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C6000000
      0000E7E7E700E7E7E700DEDEDE00DEDEDE00CECECE00CECECE0000000000CE00
      CE00CE00CE00CE00CE00CE00CE00CE00CE00000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000FF630000FF63
      3100FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000FF633100FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      000000000000000000000000000000000000848484009CFFFF00CE310000CE31
      000084848400E7E7E700E7E7E700DEDEDE00D6D6D600CECECE0000000000CE00
      CE00CE00CE00CE00CE00CE00CE00CE00CE00000000000000000000000000FF63
      31000000000000000000000000000000000000000000FF630000FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FF633100FF9C3100FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00848484004242420063636300636363006363630000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF9C
      310000000000000000000000000000000000FF630000FF633100FF9C3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF9C3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      000000000000000000000000000000000000848484009CFFFF00FF000000FF00
      0000FF000000FF000000C6C6C600000000000000000000000000000000008400
      840084008400840084008400840084008400000000000000000000000000FF9C
      3100000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FF633100FFCE3100FFCE3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      000000000000000000000000000000000000848484009CFFFF00FF633100FF63
      3100FF6331009CFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE31000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      31000000000000000000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000FF633100FFFF
      CE00FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF633100FFFFCE00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000000000000000000000000000FF9C
      6300FFCE31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9C6300FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000000000000084
      00000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000084848400008400000084
      0000008400000084840084848400C6C6C600008400000084000000FFFF000084
      84000084000000000000848484000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C0000000000848400005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00848400000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE000000CE000000FF000000CE00000000000000000000840000848484000084
      84000084000000840000C6C6C600FFFFFF000084000000840000C6C6C6000084
      8400008484000000FF000084000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A00000000004A4A4A009C9C9C00EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B5009C9C9C004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE00CECE
      CE000000CE000000FF000000CE00000000000000000000848400848484000084
      0000C6C6C6008484840000840000FFFFFF000084000000840000008484000084
      00000084840000840000008484000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B500000000004A4A4A00EFEFEF009C9C9C00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C6009C9C9C00B5B5B5004A4A4A000000000084848400FFFFFF00CE31
      0000CE310000CE310000CE310000CE310000CE310000CE3100000000CE000000
      CE000000CE000000FF000000CE00000000000000000084848400008400000084
      8400FFFFFF00C6C6C60000FF0000FFFFFF000084000000840000008400000084
      8400C6C6C60000848400008484000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C600000000004A4A4A00EFEFEF00EFEFEF009C9C
      9C00E7E7E700D6D6D600C6C6C600949494009C9C9C00DEDEDE00DEDEDE00D6D6
      D6009C9C9C00D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE000000
      FF000000CE000000CE000000CE00000000000000000084848400008400008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
      8400C6C6C600C6C6C600008484000000000042424200E7E7E7005A5A5A00C6D6
      EF00C6D6EF00C6D6EF00C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00C6D6EF005A5A5A00C6C6C600000000004A4A4A00EFEFEF00EFEFEF00E7E7
      E7009C9C9C00C6C6C60094949400D6D6D600D6D6D60094949400DEDEDE009C9C
      9C00D6D6D600D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000000000CE000000
      FF00847BFF000000CE00000000000000000000000000848484000084000000FF
      0000FFFFFF00C6C6C60000840000FFFFFF000084000000840000008484000084
      000000848400008400000084840000000000424242005A5A5A0000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6D6
      EF00CEFFFF00000000005A5A5A00000000004A4A4A00E7E7E700EFEFEF00D6D6
      D600C6C6C60094949400DEDEDE00DEDEDE00DEDEDE00DEDEDE0094949400DEDE
      DE00CECECE00D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE000000
      CE000000CE000000CE000000CE00000000000000000084848400848400000084
      0000848484000084000000840000FFFFFF000084000000840000C6C6C6008484
      840000840000C6C6C600008484000000000042424200B5B5B50000000000CEFF
      FF00C6D6EF00C6D6EF00C6C6C600C6D6EF00C6D6EF00C6C6C600C6C6C600C6D6
      EF00CEFFFF0000000000B5B5B500000000004A4A4A00E7E7E700DEDEDE00C6C6
      C60094949400E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE009494
      9400D6D6D600DEDEDE00B5B5B5004A4A4A000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF000084
      00000084000000840000FFFFFF00C6C6C6000084000000840000C6C6C600C6C6
      C600C6C6C600C6C6C6000084840000000000000000008484840000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00CEFFFF000000000021212100000000004A4A4A00E7E7E700D6D6D6009494
      9400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E70094949400D6D6D600C6C6C6004A4A4A000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000848400FFFFFF00C6C6
      C600008484000084000000840000008400000084000000840000008400000084
      000000FFFF00C6C6C6000000840000000000000000000000000021212100CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000004A4A4A00DEDEDE0094949400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF0094949400B5B5B5004A4A4A000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000848400848484008484840084848400848484000084
      000000840000008400000084000000000000000000000000000000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600CEFFFF00CEFFFF00CEFFFF00CEFFFF00D6E7
      E700C6D6EF000000000000000000000000004A4A4A0094949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700949494004A4A4A000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000840000008484008484
      8400C6C6C6008484840000840000008400000084000000840000008400008484
      8400C6C6C600848484000084000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A00000000000000000000000000848400004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00848400000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000084
      000000848400C6C6C60000840000008484000084000000840000C6C6C6000084
      840000840000008400000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00848484009CFF
      FF009CCECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008484000084000000840000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031000000
      310000009C00000084000000FF000000CE000000CE0000009C00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      000000000000000000000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C0000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000009C000000840094949400A5A5A5008484840063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD0000848400000000000000FF000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      840094949400C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE00000000000000000000000000000000000000000000000000212121003131
      CE00319CFF000000FF0000009C00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD000000FF0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000CECECE00C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000008484009CCE
      CE000000CE000063FF0000009C00FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE000000FF0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000001818
      180000000000C6C6C600B5B5B500A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C00000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE000000CE000000FF0000009C008484000084840000FFFFFF00F7F7
      F7000000FF0000009C0000848400000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000181818001818
      18000000000000000000C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E7000000CE000000FF0000009C00FFFFFF00FFFFFF000000
      FF0000009C009CCECE0000848400000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000018181800181818001818
      1800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C0000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E700848400000000CE000000FF0000009C000000FF000000
      9C009CCECE0094ADAD004A4A4A00000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF009C6331009CFFFF009C63310084000000C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000021212100181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400000000CE000000FF0000009C00D6D6
      D60094ADAD00009C9C0010101000000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C600840000008400000084000000C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000018181800181818000000
      000000000000C6C6C600EFEFEF00EFEFEF00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD000000CE000000FF0000009C000000CE000000
      9C0094ADAD004242420000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C600840000009C6331009CFFFF009C6331009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000018181800181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00DEDEDE00FF000000EFEF
      EF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C00000000000000000000000000000000000000
      000021212100009C9C000000CE000000FF0000009C00639C9C00639C9C000000
      CE0000009C000000000000000000000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000021212100181818001818
      180000000000000000000000000000000000DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C000000000000000000000000000000
      00000000CE000000CE000000FF0000009C000084840000848400313131000000
      00000000CE0000009C0000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000018181800181818001818
      180000000000000000000000000000000000C6C6C600DEDEDE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE0000000000000000000000CE000000
      CE00319CFF000000FF0000009C00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000CE0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000181818002121
      21001818180000000000000000000000000000000000C6C6C600DEDEDE00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      100000000000000000000000CE0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000181818002121
      2100212121001818180021212100181818000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000181818000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C0000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121001818180021212100181818001818180018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE00000000000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A00000000000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C00212121000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C63000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C6331000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      00000000000000000000000000000000000084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE63310084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C63310084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C63310084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE63310084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C63310084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C63310084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C63310084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C00000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE63310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE00000084000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C63310084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C6331008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA500000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
      CE00000000000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000808080000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF009CCECE009CCE
      CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
      CE00000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00003100000031
      00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
      CE000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00639C9C00CEFF
      FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
      00000808080000000000080808000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF63310000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000008484840084848400848484008484
      8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C310000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C00000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000F00000000100010000000000800700000000000000000000
      000000000000000000000000FFFFFF008601FFFFFFFF0000820183C1EFF30000
      C20087E1C5A10000E00083C181810000F0018181C1830000F00183C5E0070000
      8001D7EFC18300008001DFFFFBDF00008003DFFFFBDF00008007D7EFC1810000
      800783C5C003000080138181C1830000803983C181810000807C800181810000
      00FF83C1CFF3000001FFFFFFFFFF0000C7E3FFFFFFC7E001C7E3F81FFF81C001
      C7E3C003FE008001C7E38001F8038001C7E38001E0078001C7E3800180078001
      C007800100078001C00F800100078001C007800100078001C7E3800100078001
      C7E3800300078001C7E3C007000F8001C7E3E007001F8001C003F01F003F8001
      C007F83F03FF8003C00FFFFF8FFF8007FFFFFFFFFFFF80008003FE7FFFCF0000
      8003FC3FFFC70000C3FBF003F8030000E1FBE003F8010000F0FFC003F8038000
      F87FC003FFC70000FC3FC003FFCF0000FC3FC003F3FF0000F87F8001E3FF8000
      F0FF8003C03F8000E1FBC007803F8000C3FBE00FC03F80008003F03FE3FF8000
      8003F93FF3FF8000FFFFFFFFFFFF803EFFBFFFFFFFFFFFFF001FFFFFFFFFFE7F
      001FF3FFFFEFFC3F0007E1FFFFC7F9BF0007E0FDBF07F9DF0007C07DBE03E0FF
      0007C03D9C03F1FF000380399C01F3DF000380FBDF01FB8F0001F0FBDF0FFF07
      0004F873CE1FFB070006F837EC1FFD9F0007FC07E03FFD9F0007FE0FF07FFC3F
      C007FF1FF8FFFE3FC007FFFFFFFFFFFFFE01FE010000CE0FFE01FE010000C007
      FE01F8010000C007FE01F8010000C007F001E0010000C007F001E0010000C807
      F001E0010000C807F001E0010000C807F003E0030000C807F007E0070000C807
      F00FE00F00008807D00FA01F00009C07E01FC03F00009C0B803F007F00009E13
      E3FFC7FF00008007D5FFABFF0000C003FFFFFFFFFFF887FFCFE3FFFFFFF083FF
      C7E3FFE3FFE0C3FEC3E3FFC3FFC1E1FCC1E3FF83FF83F1F9C0E3FF07FF07F8F3
      C063F00FE00FFC67C023E01FC01FFE0FC023C03F803FFF1FC063C03F003FFE0F
      C0E3C03F003FFC67C1E3C03F003FF0F3C3E3E07F003FC1F9C7E3F0FF807F83FC
      CFE3FFFFC0FF07FFFFFFFFFFE1FF0FFFFFFFFFFFFFFFFFFF00FFC7F3FF9FF3FF
      0020C7E3FF1FF1FF0000C7C3FE1FF0FF0000C783FC1FF07F0000C703F81FF03F
      0020C603F01FF01F00E0C403E01FF00F00FFC403E01FF00F00FFC603F01FF01F
      00FFC703F81FF03F01FFC783FC1FF07F03FFC7C3FE1FF0FFFFFFC7E3FF1FF1FF
      FFFFC7F3FF9FF3FFFFFFFFFFFFFFFFFFFE07FE3F0000FFFFFDE3E0070000FFFF
      8001800100000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000080010000
      80070000C003000080070000C003000080070000C0030000800FC001C003FFFF
      801FF80FC007FFFF803FFFFFC00FFFFF8007FFFFC00FFFBF80038001E01F8007
      C0008001E03F8007C0008001E00F800780008001C007800780008001C0078007
      8000800180078007C001800180038003C001800180078003E003800180078001
      F007800180078004F013800180078006C0198001C007800F800C8001C007801F
      000F8001E007803F080FFFFFF00FFFFFFFFFFFFFFFFFF007000FFFFFFFFFE003
      0007E000FE07E0010003C000FDE3C0010001C000FBF180000001800080718000
      0001800080518000000100008041C001000100008041C001800100008043E003
      C00180008041F007E0018000807FFC1FF1118000807FFC1FF999C07F80FFF80F
      FDDDE0FF81FFF80FFFFFFFFFFFFFF80FFE000000FFBF007F00000000001F007F
      00000000001F8003000000000007C003000000000007C0070000000000078007
      0000000000070007000000000003000300000000000300030000000000010001
      000000000004000300000000000680030000000000078001000000000007C001
      00000000C007FC01FFFF0000C007FE0780010007FF18FFFFFFFF0007FC000000
      80010007F0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000700010000000100078001000055D9000700000000
      000000000000000077760000000000008001000000010000FFFFF80080030000
      8001FC00C0070000FFFFFE00E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object pmnuDevolCarpetas: TPopupMenu
    Left = 140
    Top = 412
    object pmnuDevolCarpeta: TMenuItem
      Caption = 'Devoluci'#243'n de Carpetas del Usuario'
      OnClick = pmnuDevolCarpetaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuDevolGenerarRemito: TMenuItem
      Caption = 'Generar Remito'
      OnClick = mnuDevolGenerarRemitoClick
    end
    object mnuDevolImprimirRemito: TMenuItem
      Caption = 'Reimprimir Remito'
      OnClick = mnuDevolImprimirRemitoClick
    end
    object mnuDevolEliminarRemito: TMenuItem
      Caption = 'Eliminar Remito'
      OnClick = mnuDevolEliminarRemitoClick
    end
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_DESCRIPCION, TB_CODIGO'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'ESCAR'#39
      '   AND TB_CODIGO <> '#39'0'#39
      ' ORDER BY TB_CODIGO'
      ' '
      '')
    Left = 325
    Top = 75
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 353
    Top = 75
  end
  object pmnuCarpetasSolicUsu: TPopupMenu
    Left = 168
    Top = 412
    object pmnuRecepcionCarpetaUsu: TMenuItem
      Caption = 'Recepci'#243'n de Carpetas desde GyD'
      OnClick = pmnuRecepcionCarpetaUsuClick
    end
    object pmnuDevolucionCarpetaUsu: TMenuItem
      Caption = 'Devoluci'#243'n de Carpetas a GyD'
      OnClick = pmnuDevolucionCarpetaUsuClick
    end
  end
end
