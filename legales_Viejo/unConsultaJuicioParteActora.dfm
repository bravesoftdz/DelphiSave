inherited frmConsultaJuicioParteActora: TfrmConsultaJuicioParteActora
  Left = 421
  Top = 313
  Caption = 'B'#250'squeda...(Administraci'#243'n de Juicios Parte Actora)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    inherited pcFiltrosBusqueda: TPageControl
      inherited tsGeneral: TTabSheet
        inherited gbJuicio: TGroupBox
          inherited fraEmpresaFiltro: TfraEmpresa
            TabOrder = 11
          end
          object chkDemInterruptiva: TCheckBox
            Left = 537
            Top = 10
            Width = 135
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Demanda Interruptiva'
            TabOrder = 10
          end
        end
      end
      inherited tsFechas: TTabSheet
        inherited gbFechas: TGroupBox
          inherited chkSinAbogadoDesignado: TCheckBox
            TabOrder = 7
          end
          inherited chkFechadeCierre: TCheckBox
            TabOrder = 6
          end
        end
      end
      inherited tsImportes: TTabSheet
        inherited gbImporte: TGroupBox
          inherited edImpDemaDesde: TCurrencyEdit
            TabOrder = 3
          end
          inherited edImpDemaHasta: TCurrencyEdit
            TabOrder = 4
          end
          inherited chkSinImporteSentencia: TCheckBox
            TabOrder = 2
          end
        end
      end
      inherited tsOrigenDemanda: TTabSheet
        inherited gbOrigenDemanda: TGroupBox
          inherited lblReclamante: TLabel
            Width = 57
            Caption = 'Reclamado:'
            ExplicitWidth = 57
          end
          inherited lblReclamo: TLabel
            Left = 8
            Top = 37
            Width = 48
            Height = 26
            Caption = 'Objeto del'#13#10'Proceso:'
            ExplicitLeft = 8
            ExplicitTop = 37
            ExplicitWidth = 48
            ExplicitHeight = 26
          end
          inherited lbSiniestro: TLabel
            Visible = False
          end
          inherited edSiniestro: TIntEdit
            Visible = False
          end
        end
        object nbOrigenDemanda: TNotebook
          Left = 4
          Top = 94
          Width = 606
          Height = 112
          PageIndex = 5
          TabOrder = 1
          object TPage
            Left = 0
            Top = 0
            Caption = 'Trabajador'
            object pnTrabajador: TPanel
              Left = 0
              Top = 0
              Width = 606
              Height = 57
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object grpTrabajador: TGroupBox
                Left = 0
                Top = 0
                Width = 606
                Height = 53
                Align = alTop
                Caption = 'Trabajador'
                TabOrder = 0
                inline fraTrabajadorOrigenDemanda: TfraTrabajador
                  Left = 16
                  Top = 16
                  Width = 577
                  Height = 23
                  TabOrder = 0
                  ExplicitLeft = 16
                  ExplicitTop = 16
                  ExplicitWidth = 577
                  ExplicitHeight = 23
                  inherited cmbNombre: TArtComboBox
                    Width = 493
                    ExplicitWidth = 493
                  end
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Empresa Afiliada'
            object pnEmpresaAfiliada: TPanel
              Left = 0
              Top = 0
              Width = 606
              Height = 55
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                606
                55)
              object GroupBox2: TGroupBox
                Left = 4
                Top = -1
                Width = 599
                Height = 46
                Anchors = [akLeft, akTop, akRight]
                Caption = ' Contrato '
                TabOrder = 0
                object lblCuitEmpresa: TLabel
                  Left = 11
                  Top = 18
                  Width = 21
                  Height = 13
                  Caption = 'Cuit:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                inline fraEmpresaDemandante: TfraEmpresa
                  Left = 50
                  Top = 15
                  Width = 538
                  Height = 25
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ExplicitLeft = 50
                  ExplicitTop = 15
                  ExplicitWidth = 538
                  ExplicitHeight = 25
                  inherited lbContrato: TLabel
                    Left = 436
                    ExplicitLeft = 436
                  end
                  inherited edContrato: TIntEdit
                    Left = 481
                    ExplicitLeft = 481
                  end
                  inherited cmbRSocial: TArtComboBox
                    Width = 299
                    ExplicitWidth = 299
                  end
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Empresa'
            DesignSize = (
              606
              112)
            object gbOrigenEmpresa: TGroupBox
              Left = 3
              Top = 2
              Width = 597
              Height = 78
              Anchors = [akLeft, akTop, akRight]
              Caption = ' Datos de la Empresa'
              TabOrder = 0
              object lbCUIT: TLabel
                Left = 18
                Top = 26
                Width = 28
                Height = 13
                Caption = 'CUIT:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lbRSocial: TLabel
                Left = 18
                Top = 49
                Width = 43
                Height = 13
                Caption = 'R.Social:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object edCuitEmpresa: TMaskEdit
                Left = 73
                Top = 22
                Width = 89
                Height = 21
                EditMask = '99-99999999-c;0;'
                MaxLength = 13
                TabOrder = 0
              end
              object edtRazonSocialEmpresa: TEdit
                Left = 73
                Top = 46
                Width = 500
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 250
                TabOrder = 1
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Persona'
            object gbPersona: TGroupBox
              Left = 4
              Top = 2
              Width = 591
              Height = 52
              Caption = ' Datos de la Persona '
              TabOrder = 0
              object lblCuil: TLabel
                Left = 431
                Top = 26
                Width = 27
                Height = 13
                Caption = 'CUIL:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lblTipoDocumento: TLabel
                Left = 170
                Top = 26
                Width = 21
                Height = 13
                Caption = 'Tipo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lblDNI: TLabel
                Left = 7
                Top = 24
                Width = 58
                Height = 13
                Caption = 'Documento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object edCuilPersona: TMaskEdit
                Left = 476
                Top = 21
                Width = 103
                Height = 21
                EditMask = '99-99999999-c;0;'
                MaxLength = 13
                TabOrder = 2
              end
              object edNroDocumentoPersona: TPatternEdit
                Left = 66
                Top = 21
                Width = 97
                Height = 21
                MaxLength = 8
                TabOrder = 0
              end
              inline fraTipoDocumento: TfraCtbTablas
                Left = 197
                Top = 21
                Width = 227
                Height = 23
                TabOrder = 1
                ExplicitLeft = 197
                ExplicitTop = 21
                ExplicitWidth = 227
                inherited cmbDescripcion: TArtComboBox
                  Width = 174
                  ExplicitWidth = 174
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Prestador'
            object GroupBox6: TGroupBox
              Left = 0
              Top = 0
              Width = 606
              Height = 107
              Align = alTop
              Caption = ' Prestador '
              TabOrder = 0
              DesignSize = (
                606
                107)
              object gbContratoOrigenDemandaPrestador: TGroupBox
                Left = 5
                Top = 17
                Width = 597
                Height = 84
                Anchors = [akLeft, akTop, akRight]
                Caption = ' Contrato '
                TabOrder = 0
                inline fraEmpresaPrestador: TfraCPR_PRESTADOR
                  Left = 8
                  Top = 16
                  Width = 585
                  Height = 63
                  VertScrollBar.Range = 49
                  TabOrder = 0
                  ExplicitLeft = 8
                  ExplicitTop = 16
                  ExplicitWidth = 585
                  ExplicitHeight = 63
                  inherited lbCUIT: TLabel
                    Width = 25
                    ExplicitWidth = 25
                  end
                  inherited lbSec: TLabel
                    Width = 22
                    ExplicitWidth = 22
                  end
                  inherited lbIdentif: TLabel
                    Width = 35
                    ExplicitWidth = 35
                  end
                  inherited lbRSocial: TLabel
                    Width = 40
                    ExplicitWidth = 40
                  end
                  inherited lbDomicilio: TLabel
                    Width = 42
                    ExplicitWidth = 42
                  end
                  inherited lbLocalidad: TLabel
                    Width = 46
                    ExplicitWidth = 46
                  end
                  inherited lbCPostal: TLabel
                    Left = 506
                    Width = 20
                    ExplicitLeft = 506
                    ExplicitWidth = 20
                  end
                  inherited cmbCA_DESCRIPCION: TArtComboBox
                    Width = 255
                    ExplicitWidth = 255
                  end
                  inherited edCA_LOCALIDAD: TEdit
                    Width = 131
                    ExplicitWidth = 131
                  end
                  inherited edCA_CODPOSTAL: TEdit
                    Left = 530
                    ExplicitLeft = 530
                  end
                  inherited sdqDatos: TSDQuery
                    Left = 288
                    Top = 27
                  end
                  inherited dsDatos: TDataSource
                    Left = 316
                    Top = 27
                  end
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Proveedor'
            object GroupBox8: TGroupBox
              Left = 0
              Top = 0
              Width = 606
              Height = 107
              Align = alTop
              Caption = ' Proveedor '
              TabOrder = 0
              DesignSize = (
                606
                107)
              object gbContratoOrigenDemandaProveedor: TGroupBox
                Left = 6
                Top = 16
                Width = 592
                Height = 85
                Anchors = [akLeft, akTop, akRight]
                Caption = ' Contrato '
                TabOrder = 0
                inline fraEmpresaProveedor: TfraCPR_PRESTADOR
                  Left = 7
                  Top = 16
                  Width = 576
                  Height = 63
                  VertScrollBar.Range = 49
                  TabOrder = 0
                  ExplicitLeft = 7
                  ExplicitTop = 16
                  ExplicitWidth = 576
                  ExplicitHeight = 63
                  inherited lbCUIT: TLabel
                    Width = 25
                    ExplicitWidth = 25
                  end
                  inherited lbSec: TLabel
                    Width = 22
                    ExplicitWidth = 22
                  end
                  inherited lbIdentif: TLabel
                    Width = 35
                    ExplicitWidth = 35
                  end
                  inherited lbRSocial: TLabel
                    Width = 40
                    ExplicitWidth = 40
                  end
                  inherited lbDomicilio: TLabel
                    Width = 42
                    ExplicitWidth = 42
                  end
                  inherited lbLocalidad: TLabel
                    Width = 46
                    ExplicitWidth = 46
                  end
                  inherited lbCPostal: TLabel
                    Left = 497
                    Width = 20
                    ExplicitLeft = 497
                    ExplicitWidth = 20
                  end
                  inherited cmbCA_DESCRIPCION: TArtComboBox
                    Width = 246
                    ExplicitWidth = 246
                  end
                  inherited edCA_LOCALIDAD: TEdit
                    Width = 122
                    ExplicitWidth = 122
                  end
                  inherited edCA_CODPOSTAL: TEdit
                    Left = 521
                    ExplicitLeft = 521
                  end
                  inherited sdqDatos: TSDQuery
                    Left = 288
                    Top = 8
                  end
                  inherited dsDatos: TDataSource
                    Left = 316
                    Top = 8
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      Width = 739
      inherited tbNuevaMediacion: TToolButton
        Visible = False
      end
    end
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
        LinkControl = tbSalir
      end>
    Left = 156
    Top = 328
  end
end
