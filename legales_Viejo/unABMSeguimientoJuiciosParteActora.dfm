inherited frmAdminstracionJuicioParteActora: TfrmAdminstracionJuicioParteActora
  Left = 246
  Top = 175
  ActiveControl = edNroCarpeta
  ClientWidth = 883
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 891
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCabecera: TPanel
    Width = 883
    Height = 302
    ExplicitWidth = 883
    ExplicitHeight = 302
    inherited lblDetalle: TLabel
      Top = 261
      ExplicitTop = 261
    end
    inherited fraDatosJuzgado: TfraJuzgados
      Top = 164
      Width = 880
      ExplicitTop = 164
      ExplicitWidth = 880
      inherited gbJuzgados: TGroupBox
        Width = 880
        ExplicitWidth = 880
        inherited lblFechaIngreso: TLabel
          Left = 637
          Visible = True
          ExplicitLeft = 637
        end
        inherited fraFuero: TfraCodigoDescripcionExt
          Width = 522
          ExplicitWidth = 522
          inherited cmbDescripcion: TArtComboBox
            Width = 457
            ExplicitWidth = 457
          end
        end
        inherited fraSecretaria: TfraCodigoDescripcionExt
          Width = 521
          ExplicitWidth = 521
          inherited cmbDescripcion: TArtComboBox
            Width = 456
            ExplicitWidth = 456
          end
        end
        inherited btnMasDatosJuzgado: TBitBtn
          Left = 778
          ExplicitLeft = 778
        end
        inherited dteFechaIngreso: TDateComboBox
          Left = 686
          MinDateCombo = edFECHANOTIFICACION
          ExplicitLeft = 686
        end
        inherited cbSinExpediente: TCheckBox
          Left = 595
          ExplicitLeft = 595
        end
      end
      inherited sdqJuzgado: TSDQuery
        DataSource = fraDatosJuzgado.fraJuzgado.dsDatos
      end
    end
    inherited edtDescripcion: TMemo
      Left = 47
      Top = 261
      Width = 739
      ExplicitLeft = 47
      ExplicitTop = 261
      ExplicitWidth = 739
    end
    inherited gbJuicio: TGroupBox
      Height = 164
      ExplicitHeight = 164
      DesignSize = (
        362
        164)
      inherited lbConcurso: TLabel
        Width = 37
        Caption = 'F.Inicio:'
        ExplicitWidth = 37
      end
      inherited fraTipoJuicio: TfraCodigoDescripcion
        TabOrder = 2
        inherited cmbDescripcion: TArtComboBox
          Width = 192
          ExplicitWidth = 192
        end
      end
      inherited edFECHANOTIFICACION: TDateComboBox
        MaxDateCombo = fraDatosJuzgado.dteFechaIngreso
        TabOrder = 1
      end
      inherited fraAbogadosPropios: TfraAbogadosLegales
        TabOrder = 6
        inherited cmbDescripcion: TArtComboBox
          Width = 149
          ExplicitWidth = 149
        end
      end
      inherited edCARATULA: TEdit
        TabOrder = 5
      end
      inherited tbEdicionAbogado: TToolBar
        TabOrder = 7
      end
      inherited edFECHAASIGNADO: TDateComboBox
        TabOrder = 8
      end
      inherited edNroCarpeta: TIntEdit
        TabOrder = 0
      end
      inherited edDemandante: TEdit
        TabOrder = 3
      end
      inherited edDemandado: TEdit
        TabOrder = 4
      end
      object chkDemInterruptiva: TCheckBox
        Left = 189
        Top = 135
        Width = 135
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Demanda Interruptiva'
        TabOrder = 9
      end
    end
    inherited gbDetalleJuicio: TGroupBox
      Width = 514
      Height = 164
      ExplicitWidth = 514
      ExplicitHeight = 164
      inherited lblEstadoJuicio: TLabel
        Left = 22
        ExplicitLeft = 22
      end
      inherited Label1: TLabel
        Left = 22
        Top = 41
        ExplicitLeft = 22
        ExplicitTop = 41
      end
      inherited fraEstado: TfraCodigoDescripcion
        Left = 88
        Width = 320
        ExplicitLeft = 88
        ExplicitWidth = 320
        inherited cmbDescripcion: TArtComboBox
          Width = 252
          ExplicitWidth = 252
        end
      end
      inherited tbEdicionMotivo: TToolBar
        Left = 432
        ExplicitLeft = 432
      end
      inherited tbExplorarHistoricoEstado: TToolBar
        Left = 414
        Height = 26
        ExplicitLeft = 414
        ExplicitHeight = 26
      end
      inherited psSentenciaMediacion: TPageControl
        Top = 55
        Width = 493
        Height = 107
        ExplicitTop = 55
        ExplicitWidth = 493
        ExplicitHeight = 107
        inherited Sentencia: TTabSheet
          ExplicitWidth = 485
          ExplicitHeight = 97
          inherited lblSentencia: TLabel
            Top = 0
            ExplicitTop = 0
          end
          inherited lbFechaFinJuicio: TLabel
            Left = 350
            ExplicitLeft = 257
          end
          inherited fraTipoResultadoJuicio: TfraCodigoDescripcion
            Width = 262
            ExplicitWidth = 262
            inherited cmbDescripcion: TArtComboBox
              Width = 229
              ExplicitWidth = 229
            end
          end
          inherited edFECHASENTENCIA: TDateComboBox
            Left = 388
            ExplicitLeft = 388
          end
          inherited mSentencia: TRxRichEdit
            Width = 401
            ExplicitWidth = 401
          end
        end
        inherited Mediacion: TTabSheet
          ExplicitWidth = 485
          ExplicitHeight = 97
          inherited pnSentencia: TPanel
            Width = 485
            Height = 97
            ExplicitWidth = 485
            ExplicitHeight = 97
            inherited fraMediador: TfraAbogadosLegales
              Width = 285
              ExplicitWidth = 285
              inherited cmbDescripcion: TArtComboBox
                Width = 232
                ExplicitWidth = 232
              end
            end
            inherited fraTipoMediacion: TfraCodigoDescripcion
              Width = 297
              ExplicitWidth = 297
              inherited cmbDescripcion: TArtComboBox
                Width = 232
                ExplicitWidth = 232
              end
            end
            inherited fraOrganismoMediacion: TfraCodigoDescripcionExt
              Width = 297
              ExplicitWidth = 297
              inherited cmbDescripcion: TArtComboBox
                Width = 232
                ExplicitWidth = 232
              end
            end
          end
        end
      end
      inherited edFECHAFINJUICIO: TDateComboBox
        Left = 89
        Top = 37
        ExplicitLeft = 89
        ExplicitTop = 37
      end
    end
  end
  inherited tbGestionDeuda: TToolBar
    Width = 883
    ExplicitWidth = 883
    inherited tbBloquearPagosSiniestros: TToolButton
      Visible = False
    end
    inherited tbImprimir: TToolButton
      DropdownMenu = fraPuntosRevisionJuicioEnTramite.pmPuntosRevision
    end
    object tbLiquidacionFinal: TToolButton
      Left = 626
      Top = 0
      Hint = 'Liquidaci'#243'n Final(Ctrl-L)'
      Caption = 'tbLiquidacionFinal'
      ImageIndex = 33
      OnClick = tbLiquidacionFinalClick
    end
  end
  inherited pnDetalle: TPanel
    Top = 329
    Width = 883
    Height = 241
    ExplicitTop = 329
    ExplicitWidth = 883
    ExplicitHeight = 241
    inherited pgDetallesJuicio: TPageControl
      Width = 883
      Height = 241
      ActivePage = tsPagos
      ExplicitWidth = 883
      ExplicitHeight = 241
      inherited tbOrigenSiniestro: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 298
        inherited cbOrigenDemanda: TCoolBar
          Width = 875
          Bands = <
            item
              Control = tbOrigenDemanda
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited tbOrigenDemanda: TToolBar
            Width = 862
            ExplicitWidth = 862
          end
        end
        inherited dbgOrigenDemanda: TRxDBGrid
          Width = 875
          Height = 184
        end
      end
      inherited tsReclamos: TTabSheet
        Caption = 'Objeto del Proceso'
        ExplicitWidth = 875
        ExplicitHeight = 213
        inherited fraReclamoSentenciaReclamo: TfraReclamoSentencia
          Width = 875
          Height = 213
          ExplicitWidth = 875
          ExplicitHeight = 213
          inherited dbReclamos: TArtDBGrid
            Width = 875
            Height = 184
            Columns = <
              item
                Expanded = False
                FieldName = 'RC_DESCRIPCION'
                Title.Caption = 'Objeto del Proceso'
                Width = 502
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_IMPORTENOMINAL'
                Title.Caption = 'Importe Nominal'
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_INTERESES'
                Title.Caption = 'Intereses'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_PORCENTAJESENTENCIA'
                Title.Caption = '% Sentencia'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_PORCENTAJEINCAPACIDAD'
                Title.Caption = '% Incapacidad'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_ID'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'RT_IDRECLAMO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'RT_IDJUICIOENTRAMITE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'RT_FECHABAJA'
                Visible = False
              end>
          end
          inherited cbReclamoSentencia: TCoolBar
            Width = 875
            Bands = <
              item
                Control = fraReclamoSentenciaReclamo.tbrReclamo
                ImageIndex = -1
                MinHeight = 27
                Width = 869
              end>
            ExplicitWidth = 875
            inherited tbrReclamo: TToolBar
              Width = 862
              ExplicitWidth = 862
            end
          end
          inherited fpReclamo: TFormPanel
            inherited ScrollBox1: TScrollBox
              inherited pnImporteReclamo: TPanel
                inherited pnReclamoIncapacidad: TPanel
                  inherited edPorcentajeIncapacidadDemanda: TCurrencyEdit
                    Margins.Left = 1
                    Margins.Top = 1
                  end
                  inherited edPorcentajeIncapacidadSegunPerito: TCurrencyEdit
                    Margins.Left = 1
                    Margins.Top = 1
                  end
                end
                inherited edtImporteDemandadoReclamo: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
              end
              inherited pnImporteSentencia: TPanel
                inherited ceImporteSentencia: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
                inherited cePorcentajeSolidario: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
                inherited ceImporteAPagar: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
              end
              inherited pnl2: TPanel
                inherited edImporteNominal: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
                inherited edIntereses: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
                inherited edMontoDemanda: TCurrencyEdit
                  Margins.Left = 1
                  Margins.Top = 1
                end
              end
            end
          end
        end
      end
      inherited tbEventosSeguimiento: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 213
        inherited dbgEventosJuicioEnTramite: TRxDBGrid
          Width = 875
          Height = 184
        end
        inherited cbEventos: TCoolBar
          Width = 875
          Bands = <
            item
              Control = tbrEventos
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited tbrEventos: TToolBar
            Width = 862
            ExplicitWidth = 862
          end
        end
        inherited fpEventoSeguimiento: TFormPanel
          Left = 262
          Top = 289
          ExplicitLeft = 262
          ExplicitTop = 289
          object lblEventoRE: TLabel [6]
            Left = 104
            Top = 34
            Width = 71
            Height = 13
            Caption = 'lblEventoRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      inherited tbTareas: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 213
        inherited jvnsSeparador: TJvNetscapeSplitter
          Left = 520
          Height = 182
          ExplicitLeft = 520
          ExplicitHeight = 185
        end
        inherited psTareas: TPageControl
          Width = 520
          Height = 182
          ExplicitWidth = 520
          ExplicitHeight = 267
          inherited Dia: TTabSheet
            ExplicitWidth = 512
            ExplicitHeight = 257
            inherited ProgramacionSemanal: TJvTFWeeks
              Width = 512
              Height = 172
              Cells = <
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end>
              ExplicitWidth = 512
              ExplicitHeight = 257
            end
            inherited ProgramacionMensual: TJvTFMonths
              Width = 512
              Height = 172
              Cells = <
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end>
              ExplicitWidth = 512
              ExplicitHeight = 257
            end
            inherited ProgramacionDiaria: TJvTFDays
              Width = 512
              Height = 172
              Cols = <
                item
                  SchedDate = 37987.000000000000000000
                  SchedName = 'Tareas Programadas'
                  Title = 'Tareas Programadas - 01/01/2004'
                  Width = 441
                end>
              ExplicitWidth = 512
              ExplicitHeight = 257
            end
          end
          inherited Semana: TTabSheet
            ExplicitWidth = 512
            ExplicitHeight = 257
            inherited jvwTareasSemanales: TJvTFWeeks
              Width = 512
              Cells = <
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end>
              ExplicitWidth = 512
              ExplicitHeight = 310
            end
          end
          inherited Mes: TTabSheet
            ExplicitWidth = 512
            ExplicitHeight = 257
            inherited jvmTareasMensuales: TJvTFMonths
              Width = 512
              Cells = <
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellPics = <>
                  CanSelect = True
                end>
              ExplicitWidth = 512
            end
          end
          inherited PuntosRevision: TTabSheet
            ExplicitWidth = 512
            ExplicitHeight = 257
          end
        end
        inherited cbTareas: TCoolBar
          Width = 875
          Bands = <
            item
              Control = tbrAgenda
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited tbrAgenda: TToolBar
            Width = 862
            ExplicitWidth = 862
          end
        end
        inherited pnCalendario: TPanel
          Left = 529
          Height = 182
          ExplicitLeft = 529
          ExplicitHeight = 267
        end
      end
      inherited tsPeritajes: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 213
        inherited cbPeritaje: TCoolBar
          Width = 875
          Bands = <
            item
              Control = tbPeritajes
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited tbPeritajes: TToolBar
            Width = 862
            ExplicitWidth = 862
          end
        end
        inherited dbgPeritajes: TRxDBGrid
          Width = 875
          Height = 184
        end
        inherited fpPeritajes: TFormPanel
          Left = 209
          Top = 10
          ExplicitLeft = 209
          ExplicitTop = 10
          inherited pnPorcentajeIncapacidad: TPanel
            inherited edPorcentajeIncPeritoMedico: TCurrencyEdit
              Margins.Left = 1
              Margins.Top = 1
            end
          end
          inherited pnIBM: TPanel
            inherited edIBMArt: TCurrencyEdit
              Margins.Left = 1
              Margins.Top = 1
            end
            inherited edIBMPericial: TCurrencyEdit
              Margins.Left = 1
              Margins.Top = 1
            end
          end
        end
      end
      inherited tsImportes: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 298
        inherited gbImportes: TGroupBox
          Width = 875
          ExplicitWidth = 875
        end
        inherited gbReservasAsigandas: TGroupBox
          Width = 875
          ExplicitWidth = 875
          inherited tbAprobacionDeReservas: TToolBar
            Left = 925
            ExplicitLeft = 925
          end
          inherited ToolBar3: TToolBar
            Left = 803
            ExplicitLeft = 803
          end
        end
      end
      inherited tsPagos: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 213
        inherited dbgPagosEfectuados: TRxDBGrid
          Width = 875
          Height = 155
          OnDrawColumnCell = dbgPagosEfectuadosDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'PL_IDLIQUIDACION'
              Title.Caption = 'Nro Liquidaci'#243'n'
              Width = 88
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ESTADO'
              Title.Alignment = taCenter
              Title.Caption = 'Estado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CP_DENPAGO'
              Title.Alignment = taCenter
              Title.Caption = 'Concepto'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BP_DESCRIPCION'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Acreedor'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_DETALLEBENEFICIARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Descripci'#243'n'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_CUITCUIL'
              Title.Alignment = taCenter
              Title.Caption = 'CUIL/CUIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_IMPORTECONRETENCION'
              Title.Alignment = taCenter
              Title.Caption = 'Importe c/Ret.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_IMPORTEPAGO'
              Title.Alignment = taCenter
              Title.Caption = 'Importe s/Ret.'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NROFACTURA'
              Title.Alignment = taCenter
              Title.Caption = 'Factura'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL_FECHAFACTURA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha Factura'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDENNRO'
              Title.Alignment = taCenter
              Title.Caption = 'Nro.Orden'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ORDENFECHA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha Orden'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHEQUENRO'
              Title.Alignment = taCenter
              Title.Caption = 'Nro.Cheque'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CHEQUEFECHA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha Cheque'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_COMENTARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Observaciones'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TO_DESCRIPCION'
              Title.Alignment = taCenter
              Title.Caption = 'Operaci'#243'n'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADODUPLICADO'
              Title.Caption = 'Estado Duplicado'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_FECHAAPROBACION'
              Title.Caption = 'Fecha Aprobaci'#243'n'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_MOTIVOAPROBACION'
              Title.Caption = 'Motivo Aprobaci'#243'n'
              Width = 108
              Visible = True
            end>
        end
        inherited cbEdicionPagosEfectudos: TCoolBar
          Width = 875
          Bands = <
            item
              Control = tbPagos
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited tbPagos: TToolBar
            Width = 862
            Height = 27
            ExplicitWidth = 862
            ExplicitHeight = 27
            inherited tbIngresoPago: TToolButton
              OnClick = tbIngresoPagoClick
              ExplicitHeight = 22
            end
            inherited tbEdicionPago: TToolButton
              ExplicitHeight = 22
            end
            inherited tbEliminarPago: TToolButton
              ExplicitHeight = 22
            end
            inherited tbSeparadorPagos: TToolButton
              ExplicitHeight = 22
            end
            inherited tbImprimirPagos: TToolButton
              ExplicitHeight = 22
            end
            inherited tbObtenerEstadoPago: TToolButton
              ExplicitHeight = 22
            end
            inherited tbAprobacionConceptosDuplicados: TToolButton
              ExplicitHeight = 22
            end
            inherited tbseparator4: TToolButton
              ExplicitHeight = 22
            end
          end
        end
        inherited plTotalesPago: TPanel
          Top = 184
          Width = 875
          Enabled = False
          ExplicitTop = 184
          ExplicitWidth = 875
          object lbSumatoria: TLabel
            Left = 8
            Top = 8
            Width = 3
            Height = 13
          end
          object lblSumatoriaPagosConRet: TEdit
            Left = 538
            Top = 4
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = '0'
          end
          object lblSumatoriaPagosSinRet: TEdit
            Left = 661
            Top = 4
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Text = '0'
          end
        end
      end
      inherited tsPuntosRevision: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 213
        inherited fraPuntosRevisionJuicioEnTramite: TfraPuntosRevision
          Width = 875
          Height = 213
          ExplicitWidth = 875
          ExplicitHeight = 213
          inherited nsSplitter: TJvNetscapeSplitter
            Height = 184
            ExplicitHeight = 187
          end
          inherited tlPuntosRevision: TJvTimeLine
            Height = 184
            Items = <
              item
                Left = 0
                Top = 0
                Caption = 'Revisi'#243'n de Progreso'
                Color = clMoneyGreen
                Date = 38417.000000000000000000
                Hint = 'Revisi'#243'n de Progreso'
                ImageIndex = 1
              end
              item
                Left = 0
                Top = 0
                Caption = 'Revision de Prueba'
                Date = 38421.000000000000000000
                Hint = 'Revision de Prueba'
                ImageIndex = 2
                Level = 1
              end
              item
                Left = 0
                Top = 0
                Caption = 'Revisi'#243'n de Comprobantes de Contestaci'#243'n de Prueba'
                Date = 38462.000000000000000000
                Hint = 'Revisi'#243'n de Comprobantes de Contestaci'#243'n de Prueba'
                ImageIndex = 2
                Level = 2
              end>
            ExplicitHeight = 269
          end
          inherited dbgPuntosRevision: TDBGrid
            Width = 364
            Height = 184
          end
          inherited cbPuntosRevision: TCoolBar
            Width = 875
            Bands = <
              item
                Control = fraPuntosRevisionJuicioEnTramite.tbPuntosRevisio
                ImageIndex = -1
                MinHeight = 27
                Width = 869
              end>
            ExplicitWidth = 875
            inherited tbPuntosRevisio: TToolBar
              Width = 862
              ExplicitWidth = 862
              inherited tbNuevoPeritaje: TToolButton
                ExplicitHeight = 22
              end
              inherited tbEditarPeritaje: TToolButton
                ExplicitHeight = 22
              end
              inherited tbEliminarPeritaje: TToolButton
                ExplicitHeight = 22
              end
              inherited ToolButton47: TToolButton
                ExplicitHeight = 22
              end
              inherited ToolButton1: TToolButton
                ExplicitHeight = 22
              end
              inherited tbCalendario: TToolButton
                ExplicitHeight = 22
              end
              inherited ToolButton49: TToolButton
                ExplicitHeight = 22
              end
              inherited ToolButton50: TToolButton
                ExplicitHeight = 22
              end
            end
          end
          inherited il16: TImageList
            Bitmap = {
              494C01010800340038000E001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              000000000000360000002800000038000000360000000100200000000000402F
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
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FF000000FF000000FF000000FF000000FF000000
              00000000000000000000000000000000000000000000000000000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF000000000000000000000000000000000000000000000000000000
              0000000000000000FF000000FF000000FF00FFFFFF000000FF000000FF000000
              FF000000000000000000000000000000000000000000000000000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
              0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00000000000000
              0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
              FF000000FF00000000000000000000000000000000000000FF000000FF00FFFF
              FF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000
              FF0000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF000084
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
              0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              FF000000FF000000FF000000FF000000FF00FFFFFF000000FF000000FF000000
              FF000000FF000000FF000000000000000000000000000000FF000000FF000000
              FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
              FF0000000000000000000000000084848400FFFFFF00FFFFFF00008400000084
              000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF000000FF000000000000000000000000000000FF000000FF000000
              FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              FF0000000000000000000000000084848400FFFFFF00FFFFFF0000840000FFFF
              FF000084000000840000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
              0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              FF000000FF000000FF000000FF000000FF00FFFFFF000000FF000000FF000000
              FF000000FF000000FF000000000000000000000000000000FF000000FF000000
              FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
              FF0000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF000084000000840000FFFFFF00FFFFFF0000000000000000000000
              00000000000084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
              000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
              FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
              FF000000FF000000FF000000000000000000000000000000FF000000FF00FFFF
              FF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000
              FF0000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF0000000000000000000000
              00000000000084848400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
              000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
              FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
              FF000000FF000000FF00000000000000000000000000000000000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
              0000000000000000000084848400FFFFFF00FFFFFF0000000000000000000000
              0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
              FF000000FF0000000000000000000000000000000000000000000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF000000000000000000000000000000000000000000000000000000
              0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF00000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
              0000000000000000000000000000000000000000000000000000848484008484
              8400848484008484840084848400000000000000000000000000000000000000
              0000000000000000000000000000000000008484840084848400848484008484
              8400848484000000000000000000000000000000000000000000000000000000
              000000000000000000000000FF000000FF000000FF000000FF000000FF000000
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
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FF000000FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000FF000000FF000000FF000000FF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000FF000000
              FF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              FF000000FF000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000FF000000FF000000FF000000
              FF000000FF000000FF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000FF000000FF000000FF000000
              FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              FF000000FF000000FF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FF000000FF000000FF00FFFFFF00FFFF
              FF000000FF000000FF000000FF00000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              FF000000FF000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000FF000000
              FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              FF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
              FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
              FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
              FF000000FF000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
              FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000FF000000FF000000FF000000
              FF00000000000000FF000000FF000000FF000000FF00000000000000FF000000
              FF000000FF000000FF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FF000000FF000000FF000000FF00FFFFFF00FFFF
              FF000000FF000000FF000000FF000000FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF00000000000000FF000000FF00000000000000FF000000FF000000
              FF000000FF000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FF000000FF000000FF00FFFFFF00FFFF
              FF000000FF000000FF000000FF00000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000FF000000
              FF000000FF000000FF0000000000000000000000FF000000FF000000FF000000
              FF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000FF000000FF000000FF000000
              FF000000FF000000FF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000FF000000
              FF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000FF000000FF000000FF000000FF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FF000000FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000424D3E000000000000003E000000
              2800000038000000360000000100010000000000B00100000000000000000000
              000000000000000000000000FFFFFF0000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00
              F07FC1FF07FC1F00C01F80FE03F80F00C01F007C01F00700800E003800E00300
              800E003800E00300800E003800E00300800E003800E00300800E003800E00300
              C01F007C01F00700C01F80FE03F80F00F07FC1FF07FC1F00FFFFFFFFFFFFFF00
              FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FCFFF3FFFFFFFF00F87FE1FFFFFFFF00
              F03FC0FFFFFFFF00E01F807FCFFFFF00C00F003F87FFFF008006001F03FF7F00
              0000000E01FE3F008006001C00FC1F00C00F003800780F00E01F807000300700
              9026409800780F000840210C00FC1F008486121E01FE3F00C30F0C3F03FF7F00
              E01F807F87FFFF00F03FC0FFCFFFFF00F87FE1FFFFFFFF00FCFFF3FFFFFFFF00
              00000000000000000000000000000000000000000000}
          end
          inherited ilPuntosRevision: TImageList
            Bitmap = {
              494C010109003400380018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              000000000000360000002800000060000000480000000100200000000000006C
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
              000000000000000000000000000000000000000000000000000000000000C6C6
              C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
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
              00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
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
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
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
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C6000000000000000000000000000000
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
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6C600848484008484
              8400848484000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600C6C6C600848484008484
              8400848484008484840000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600C6C6C600848484008484
              8400848484008484840084848400848484000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400C6C6C600C6C6C6008484
              84008484840084848400C6C6C600C6C6C60084848400FFFFFF00C6C6C6008484
              8400848484008484840084848400848484008484840084848400848484000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
              C600848484008484840084848400848484008484840084848400848484000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
              C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C6C6C6008484840084848400848484008484840084848400848484000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400C6C6C60084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00FFFF
              FF00FFFFFF00C6C6C60084848400848484008484840000000000848484008484
              8400848484008484840084848400000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C60084848400848484008484840084848400C6C6
              C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0084848400C6C6C60084848400C6C6C600FFFFFF00C6C6C600FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840084848400C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484
              8400C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6
              C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008484
              8400FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00C6C6C600FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840084848400C6C6C600FFFF
              FF00FFFFFF00FFFFFF0084848400848484000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
              84000000000084848400FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008484
              8400C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00000000008484
              8400C6C6C600C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008484840000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008484
              84008484840084848400848484008484840084848400FFFFFF00000000008484
              8400C6C6C600C6C6C60084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008484
              8400FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF0084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484000000
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
              0000FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840084848400C6C6C600FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
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
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008484840084848400848484000000000000000000000000000000
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
              0000000000000000000000000000848484008484840084848400848484000000
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
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C6C6
              C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C6C6
              C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000084848400C6C6C600FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000084848400C6C6C600FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C60000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C60000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000084840000000000008484
              0000848400008484000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C600C6C6C60000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C6000000000084848400848484008484
              8400848484008484840084848400848484008484840084848400848484008484
              84008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C600C6C6C60000000000FFFFFF00FFFF
              FF00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C6000000000000000000848400000000
              0000848400000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF0000000000FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000848484008484
              8400848484008484840084848400848484008484840084848400848484008484
              84008484840084848400848484000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF0000000000FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
              FF0000000000FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000084848400FFFFFF00FFFF
              FF0000000000FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF0000FF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00C6C6C600000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00C6C6C600C6C6
              C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000084840000FFFF00FFFF
              FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF0084848400000000000000
              0000000000008400840084008400000000008400840084008400840084000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000008484
              84008484840084848400FFFFFF00FFFFFF00C6C6C60000008400000084000000
              8400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              000084848400848484008484840000FFFF00C6C6C6000084840084848400C6C6
              C60000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0000FFFF000000000000000000000000000000000000000000000000008484
              84008484840084848400C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0084848400C6C6C600C6C6C600840084000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6
              C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C6000000840000008400000084000000
              840000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              0000FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00C6C6C6000084
              8400C6C6C600FFFFFF0000FFFF00C6C6C600FFFFFF00FFFFFF0000FFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              00000000000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00848484000000
              000000000000C6C6C600C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6
              C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00000084000000840000008400000084000000
              840000008400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              000000FFFF00FFFFFF0000FFFF0000848400FFFFFF0000FFFF0000FFFF00C6C6
              C6000084840000FFFF00C6C6C6000084840000FFFF00FFFFFF00FFFFFF00FFFF
              FF0000FFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
              000084848400C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0000000000C6C6C60084848400000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF000000840000008400FFFFFF00FFFFFF00C6C6
              C6000000840000008400C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
              FF008484840000000000000000000000000000000000000000000000000000FF
              FF0000FFFF00FFFFFF0000FFFF0000FFFF00C6C6C6008484840000FFFF00C6C6
              C60000FFFF0000FFFF00C6C6C60000FFFF00FFFFFF00C6C6C60000848400FFFF
              FF00FFFFFF0000FFFF0084848400000000000000000000000000000000000000
              0000C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0000000000C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6
              C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF0000008400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C6C6C6000000840084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000C6C6C600FFFF
              FF00FFFFFF0000FFFF00FFFFFF00C6C6C60000FFFF00C6C6C600C6C6C6000084
              8400C6C6C600FFFFFF0000FFFF00C6C6C600C6C6C60000848400FFFFFF00C6C6
              C600FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
              0000C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
              8400C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6
              C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00000084000000840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000FFFFFF0000FF
              FF0000FFFF00C6C6C60000FFFF0000FFFF00FFFFFF000084840000848400C6C6
              C60084848400C6C6C600FFFFFF0000FFFF0000FFFF00FFFFFF000084840000FF
              FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
              0000FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00FFFFFF000000
              0000C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000840000008400C6C6
              C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0000008400C6C6C600C6C6C600FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000FFFF00FFFFFF0000FF
              FF0000848400C6C6C60000FFFF0084848400C6C6C60000FFFF0000FFFF00FFFF
              FF0000FFFF00008484008484840084848400C6C6C600FFFFFF0000FFFF0000FF
              FF00FFFFFF008484840000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF0000008400C6C6C600FFFFFF000000
              8400FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008400C6C6C600C6C6C600FFFF
              FF008484840000000000000000000000000000000000FFFFFF0000FFFF00FFFF
              FF00FFFFFF0000FFFF00C6C6C600C6C6C60000848400C6C6C600FFFFFF0000FF
              FF00FFFFFF00FFFFFF0000FFFF00C6C6C600C6C6C60000FFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
              000000000000C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
              FF00FFFFFF00C6C6C600FFFFFF00FFFFFF0000008400FFFFFF00FFFFFF000000
              8400FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000840000008400C6C6C600FFFF
              FF00848484000000000000000000000000000000000000FFFF00FFFFFF0000FF
              FF0000FFFF00FFFFFF0000FFFF0000FFFF00C6C6C6000084840000FFFF00C6C6
              C60000FFFF0000FFFF00FFFFFF0000FFFF0000848400FFFFFF0000FFFF0000FF
              FF00848484000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000008484
              840084848400C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000840000008400C6C6
              C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008400FFFF
              FF00848484000000000000000000000000000000000000000000848484008484
              840000FFFF00FFFFFF0000FFFF0000FFFF00FFFFFF0000FFFF0000848400FFFF
              FF0000FFFF0084848400C6C6C60000FFFF0000FFFF00FFFFFF0000FFFF008484
              8400000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6
              C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              00008484840000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000084
              8400C6C6C6008484840084848400C6C6C600FFFFFF0000FFFF00FFFFFF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
              C600C6C6C6008484840084848400848484000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
              C600C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6
              C600FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              000000000000848484008484840000FFFF00FFFFFF0000FFFF0000FFFF00FFFF
              FF0000FFFF0000FFFF00C6C6C6000084840000FFFF00FFFFFF0000FFFF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
              C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000848484008484840084848400848484008484840084848400848484008484
              8400848484008484840084848400848484008484840084848400848484008484
              8400848484008484840084848400000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
              84008484840084848400848484008484840000000000C6C6C600FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000848484008484840000FFFF00FFFF
              FF0000FFFF0000FFFF00FFFFFF0000FFFF0000FFFF00FFFFFF00848484000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000848484008484
              8400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000848484008400000084000000840000008400000084000000840000008400
              0000840000008400000084848400848484008484840084848400848484008484
              8400848484008484840084848400000000000000000000000000000000000000
              0000000000008484840084848400848484008484840084848400848484008484
              8400848484008484840084848400848484000000000084848400848484008484
              8400000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000008484840000FF
              FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0084848400000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000848484008400000084000000840000008400000084000000840000008400
              0000840000008400000084848400848484008484840084848400848484008484
              8400848484008484840084848400000000000000000000000000000000000000
              0000000000000000000000000000000000000000000084848400C6C6C600C6C6
              C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008484
              84008484840000FFFF00FFFFFF0000FFFF0000FFFF0084848400000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000848484008484
              8400848484008484840084848400848484000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000084848400848484000000000000000000000000000000
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
              000000000000000000000000000000000000000000000000000000000000C6C6
              C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C6C6
              C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C6C6
              C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00848400008484
              0000848400008484000084840000848400008484000084840000848400008484
              00008484000084840000000000000000000000000000C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000008484840000000000000000000000
              000000000000000000000000000084848400000000008484840000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00000000000000
              00000000000000000000FFFFFF008484840000000000C6C6C60084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000084848400848484008484
              8400848484008484840084848400848484008484840084848400848484008484
              84008484840084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400000000008484840000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
              8400848484008484840084848400848484008484840084848400848484008484
              84008484840084848400000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF0000FFFF00FFFFFF00FFFF
              FF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008484840000000000C6C6C60084848400FFFF
              FF00FFFFFF008400000084000000840000008400000084000000840000008400
              0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084008400000000008400
              8400840084008400840000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0084848400000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF0000FFFF00FFFF
              FF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
              84008484840084848400840084008400840000000000FFFFFF00840084000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008484
              840084848400848484000000000084848400FFFFFF00FFFFFF00848484000000
              000084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF008484
              84008484840084848400FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
              FF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C6C6
              C600FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400000000008484840000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              000000000000000000008400840000000000FFFFFF00FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF0000848400C6C6C6000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF0000FF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
              FF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008484840000000000C6C6C60084848400FFFF
              FF00FFFFFF008400000084000000840000008400000084000000840000008400
              0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000000000000FFFFFF00FFFFFF00C6C6C600000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF0000848400FFFFFF000000
              000084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00C6C6C600FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C6C6C600C6C6
              C600C6C6C60000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00C6C6C60000FF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000848484000084840000FFFF00000000008484
              840084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF0000FFFF00FFFFFF00C6C6C600FFFFFF00C6C6C60084848400FFFFFF00FFFF
              FF00FFFFFF0084848400C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF0000FF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400000000008484840000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00848484000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000008484000084840000FFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000FFFF00C6C6C6008484840000FFFF0000FFFF00FFFF
              FF0000FFFF00FFFFFF0084848400C6C6C600FFFFFF00FFFFFF0000FFFF00FFFF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008484840000000000C6C6C60084848400FFFF
              FF00FFFFFF008400000084000000840000008400000084000000840000008400
              0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              00000000000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00848484000000
              0000000000008484840000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000084840000FFFF00FFFFFF00848484008484
              840084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0000FFFF00FFFFFF008484840000FFFF00FFFFFF00FFFFFF0000FF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000C6C6C600C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00000000000000000084848400FFFFFF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000FFFF00FFFFFF0000000000848484008484
              840084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF0000FF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0084848400000000008484840000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000084840000FFFF0000FFFF0000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0084848400C6C6C600FFFF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008484840000000000C6C6C60084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
              000000000000FFFFFF0000000000000000000000000000000000000000000000
              0000C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
              84000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000848400FFFFFF0000000000FFFFFF00848484008484
              840084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF008484840000FF
              FF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600C6C6
              C600C6C6C6000000000000000000000000000000000000000000000000000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
              0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000084840000FFFF0000000000FFFFFF00FFFFFF00848484008484
              840084848400848484008484840084848400848484008484840084848400FFFF
              FF00FFFFFF008484840000000000000000000000000084848400C6C6C6008484
              8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
              8400C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400848484008484
              840084848400848484008484840084848400C6C6C600FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
              000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
              C6000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              000084848400000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00848484000000000000000000000000008484840084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
              FF008484840084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
              00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              000000008400000084000000840084848400FFFFFF00FFFFFF00848484008484
              8400848484008484840084848400848484008484840084848400FFFFFF00FFFF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
              FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF000000
              00000000000000000000C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
              0000000084000000840000000000848484008400000084000000840000008400
              0000840000008400000084000000840000008400000084000000840000008400
              0000840000008484840000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000000000000848484008400000084000000840000008400
              0000840000008400000084000000840000008400000084000000840000008400
              0000840000008484840000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000000000000848484000000000084848400848484000000
              0000848484008484840000000000848484008484840000000000848484008484
              8400000000008484840000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
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
              0000000000000000000000000000000000000000000000000000848484008484
              840084848400000000000000000000000000424D3E000000000000003E000000
              2800000060000000480000000100010000000000600300000000000000000000
              000000000000000000000000FFFFFF00E3FFFF00000000000000000081FFFF00
              000000000000000080FFFF000000000000000000007FFF000000000000000000
              001FFF0000000000000000000003FF0000000000000000008000FF0000000000
              0000000080007F00000000000000000000000F00000000000000000000000700
              0000000000000000000003000000000000000000000000000000000000000000
              000000000000000000000000800000000000000000000000C000000000000000
              00000000E00000000000000000000000F00000000000000000000000F0000300
              0000000000000000E00003000000000000000000E00007000000000000000000
              E0001F000000000000000000F0007F000000000000000000F000FF0000000000
              00000000FE1FFF000000000000000000F1FFFFE3FFFFF1FFFFE3FFFFC0FFFF81
              FFFFC0FFFF81FFFF807FFF80FFFF803FFF807FFF803FFF000007800FFF0003FF
              803FFF0000038007FF0003FF8000000000038000FF000FFF8000008000038000
              3F801FFF80000080000380001F80001FF00000E00003F00003E0007FF00000F0
              0003E00000F000FFF00000F00003E00000F000FFF00000F00003C00001F000FF
              F00000F00003800001F000FFF00000F00003800003F000FFF00000F000038000
              03F0003FF00000F00003000007F0007FF00000F00003000007F800FFF00000F0
              0003C0000FFE00FFF00000F00003F0001FFF007FF00000F00003F8001FFF007F
              F00000F00003FF001FFFC3FFF00000F8000FFFC03FFFFFFFF00000FF807FFFE0
              3FFFFFFFFFFFFFFFC0FFFFFCFFFFFFFFE3FFFFE3FFFFE3FFFFFF800181FFFF81
              FFFF81FFFFFF000180FFFF80FFFF80FFFF3C0001007FFF007FFF007FFF000001
              007FFF007FFF007FFF000001007FFF00000300000300000180FFFF8000038000
              030000018083FF800003800003000001E007FFE20003800003000001F00FFFFE
              0003800003000001F81FFFFE0003800003000001FC07FFFE0003800003000001
              F807FFFE0003800003000001F008FFFE0003800003000001F0061FFE00038000
              03000001F0071FFC0003800003000001F00F07FC0003800003000001F00C01F8
              0003800003000001F00800F0000380000300FE00F00000F0000380000381FE00
              FE3800F00003FFFFFFFFFE00FFFC01FE0003FFFFFFFFFF01FFFE03FE0003FFFF
              FFFFFF01FFFFFFFFFFFFFFFFFFFFFFC700000000000000000000000000000000
              000000000000}
          end
        end
      end
      inherited tsEmbargos: TTabSheet
        ExplicitWidth = 875
        ExplicitHeight = 298
        inherited CoolBar1: TCoolBar
          Width = 875
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited ToolBar1: TToolBar
            Width = 862
            ExplicitWidth = 862
          end
        end
        inherited dbgEmbargos: TRxDBGrid
          Width = 875
          Height = 155
        end
        inherited Panel3: TPanel
          Top = 184
          Width = 875
          ExplicitTop = 269
          ExplicitWidth = 875
        end
      end
      inherited tsRecursosExtraordinarios: TTabSheet
        TabVisible = False
        ExplicitWidth = 875
        ExplicitHeight = 298
        inherited CoolBar2: TCoolBar
          Width = 875
          Bands = <
            item
              Control = ToolBar2
              ImageIndex = -1
              MinHeight = 27
              Width = 869
            end>
          ExplicitWidth = 875
          inherited ToolBar2: TToolBar
            Width = 862
            ExplicitWidth = 862
          end
        end
        inherited dbgRecExtraord: TArtDBGrid
          Width = 875
          Height = 155
        end
        inherited Panel4: TPanel
          Top = 184
          Width = 875
          ExplicitTop = 269
          ExplicitWidth = 875
        end
      end
      object tsGastos: TTabSheet
        Caption = 'Gastos'
        ImageIndex = 10
        ExplicitHeight = 298
      end
      object tsMedidasCautelares: TTabSheet
        Caption = 'Medidas Cautelares'
        ImageIndex = 11
        ExplicitHeight = 298
      end
    end
  end
  inherited fpVerAplicaciones: TFormPanel
    Left = 38
    Top = 415
    ExplicitLeft = 38
    ExplicitTop = 415
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbGuardar
      end
      item
        Key = 16460
        LinkControl = tbLiquidacionFinal
      end
      item
        Key = 16453
        LinkControl = tbFijarSentencia
      end
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16468
      end>
    Left = 333
  end
  inherited iStates: TImageList
    Bitmap = {
      494C010102003000340010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A5
      A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A50000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000009C
      FF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF00009CFF00009C
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A5
      A500A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5006B6B
      6B0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000009C
      FF00009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE00CECECE00CECECE00A5A5A500A5A5A500A5A5A5006B6B6B000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000031CEFF0031CEFF0031CEFF00009CFF00009CFF00009CFF0000639C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000006B6B6B006B6B6B006B6B6B000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000639C0000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000006B6B6B0039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000639C000031630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00393939006B6B6B006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000031630000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000003939390039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000003163000031630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000F81F000000000000E00700000000
      0000E007000000000000F00F000000000000F00F000000000000F00F00000000
      0000F00F000000000000F00F000000000000F81F000000000000FC7F00000000
      0000FC7F000000000000FC3F000000000000FC3F000000000000FC3F00000000
      0000FC3F000000000000FC7F0000000000000000000000000000000000000000
      000000000000}
  end
  inherited sdqEventoJuicioEnTramite: TSDQuery
    SQL.Strings = (
      'SELECT et_id, et_fechaevento, et_observaciones, et_respuesta,'
      '       et_fechavencimiento, TO_CHAR (et_idtipoevento),'
      '       lte_tipoevento.te_descripcion, et_fechabaja,'
      '       NVL ((SELECT DISTINCT '#39'S'#39
      '                        FROM legales.lea_eventoarchivoasociado'
      '                       WHERE ea_ideventojuicioentramite = et_id'
      '                         AND ea_fechabaja IS NULL),'
      '            '#39'N'#39
      '           ) tieneadjunto,'
      '       '#39'J'#39' procedencia'
      '  FROM legales.let_eventojuicioentramite, legales.lte_tipoevento'
      ' WHERE (et_idtipoevento = lte_tipoevento.te_id)'
      '   AND et_idjuicioentramite = :idjuicioentramite'
      'UNION ALL'
      
        'SELECT re_id, re_fecha, TO_CLOB (re_observaciones), NULL, NULL, ' +
        'tb_codigo,'
      '       tb_descripcion, NULL,'
      '       NVL ((SELECT DISTINCT '#39'S'#39
      '                        FROM legales.ler_eventoarchivorecupero'
      '                       WHERE er_ideventorecupero = re_id'
      '                         AND er_fechabaja IS NULL),'
      '            '#39'N'#39
      '           ) tieneadjunto,'
      '       '#39'R'#39' procedencia'
      '  FROM legales.lod_origendemanda,'
      '       legales.lsj_siniestrosjuicioentramite,'
      '       art.ctb_tablas,'
      '       art.lre_recuperoeventos'
      ' WHERE tb_codigo = re_codigo'
      '   AND tb_clave = '#39'EVRES'#39
      '   AND od_idjuicioentramite = :idjuicioentramite'
      '   AND sj_idorigendemanda = od_id'
      '   AND sj_fechabaja IS NULL'
      '   AND od_fechabaja IS NULL'
      '   AND re_siniestro = sj_siniestro'
      '   AND re_orden = sj_orden'
      '   AND re_nroevento > 0'
      'UNION ALL'
      
        'SELECT ge_id, ge_fecha, TO_CLOB (ge_observaciones), NULL, ge_cod' +
        'igo,'
      '       tb_descripcion, NULL,'
      '       NVL ((SELECT DISTINCT '#39'S'#39
      '                        FROM legales.leg_eventoarchivogd'
      
        '                       WHERE eg_ideventogd = ge_id AND eg_fechab' +
        'aja IS NULL),'
      '            '#39'N'#39
      '           ) tieneadjunto,'
      '       '#39'GD'#39' procedencia'
      '  FROM ctb_tablas, art.lge_eventosgdeuda, art.lgd_gestiondeuda'
      ' WHERE tb_codigo = ge_codigo'
      '   AND tb_clave = '#39'EVEGD'#39
      '   AND ge_nroorden = gd_nroorden'
      '   AND gd_contrato IN ('
      '          SELECT od_contrato'
      '            FROM legales.lod_origendemanda'
      '           WHERE od_idjuicioentramite = :idjuicioentramite'
      '             AND od_fechabaja IS NULL)'
      '   AND ge_nroevento > 0')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end>
  end
  inherited sdqOrigenDemanda: TSDQuery
    SQL.Strings = (
      
        'SELECT od_id, od_idreclamante, od_dentrodelregimen, (SELECT COUN' +
        'T(*)'
      
        '                                                       FROM lega' +
        'les.lsj_siniestrosjuicioentramite'
      
        '                                                      WHERE sj_i' +
        'dorigendemanda = od_id) tienesiniestros,'
      
        '       lre_reclamante.re_descripcion, lbo_abogado.bo_nombre, leg' +
        'ales.get_descripcionorigendemanda(od_id), od_idabogado,'
      
        '       od_cuitcuil, od_dentrodelregimen, od_cumplenormashys, od_' +
        'nombre, od_representantelegal, od_telefono,'
      
        '       od_domiciliolegalconstituido, od_numerodocumento, od_idti' +
        'podocumento, od_idcaracterabogado, od_fechabaja,'
      
        '       od_fechahechogenerador, od_salariodeclarado, od_idjuicioe' +
        'ntramite, od_contrato, od_idmedico, od_presestudiosmedicos,'
      
        '       od_prescertificadosmedicos,OD_FECHANACIMIENTO,OD_FECHAACC' +
        'IDENTE'
      
        '  FROM legales.lod_origendemanda, legales.lre_reclamante, legale' +
        's.lbo_abogado'
      ' WHERE od_idreclamante = lre_reclamante.re_id'
      '   AND od_idabogado = lbo_abogado.bo_id(+)'
      '   AND od_idjuicioentramite = :idjuicioentramite')
  end
  inherited sdqPagoLegal: TSDQuery
    SQL.Strings = (
      
        'SELECT lbp.bp_descripcion, lpl.pl_detallebeneficiario, lpl.pl_id' +
        ','
      
        '       lpl.pl_numpago, lpl.pl_fechapago, lpl.pl_conpago, lpl.pl_' +
        'fechaemision,'
      
        '       lpl.pl_cuitcuil, lpl.pl_letrafactura, lpl.pl_situacionfac' +
        'tura,'
      
        '       lpl.pl_numerofactura, lpl.pl_fechafactura, lpl.pl_importe' +
        'pago,'
      
        '       lpl.pl_formapago, lpl.pl_comentario, lpl.pl_estado, lpl.p' +
        'l_usualta,'
      '       lpl.pl_fechaalta, lpl.pl_usumodif, lpl.pl_fechamodif,'
      
        '       lpl.pl_fechavencimiento, lpl.pl_usuarioaprobado, lpl.pl_f' +
        'echaaprobado,'
      
        '       lpl.pl_importeconretencion, lpl.pl_chequenombre,lpl.PL_FE' +
        'CHARECEPFACTURA,'
      '       lpl.pl_prestadormutual, lpl.pl_proxdigfactura_fncl,'
      
        '       lpl.pl_telegramapago, lpl.pl_cai, lpl.pl_idjuicioentramit' +
        'e,'
      
        '       lpl.pl_idtipooperacion, lpl.pl_idbeneficiariopago, lpl.pl' +
        '_idembargo,'
      '       lpl.pl_detallebeneficiario, lpl.pl_iddetallebeneficiario,'
      '       pl_fechavencimientopago, scp.cp_denpago, scp.cp_ctapago,'
      
        '       scp.cp_especie, scp.cp_codigossn, scp.cp_retencion, scp.c' +
        'p_tipo,'
      '       scp.cp_autorizacion, scp.cp_altamedica, scp.cp_fbaja,'
      '       scp.cp_descripcion, scp.cp_tipomonto, scp.cp_telegrama,'
      
        '       scp.cp_nomenclado, scp.cp_legales, scp.cp_grado, scp.cp_c' +
        'aracter,'
      
        '       scp.cp_adelanto, scp.cp_espagomensual, scp.cp_aporycontri' +
        ','
      '       scp.cp_retiva, lto.to_descripcion, lto.to_idmomento,'
      
        '       ce_ordenpago ordennro, ce_fechaop ordenfecha, ce_numero c' +
        'hequenro, '
      
        '       ce_fechacheque chequefecha, lpl.pl_paguesea, lpl.pl_pagoe' +
        'xclusivo, '
      '       lpl.pl_letrafactura || '#39'-'#39' || lpl.pl_situacionfactura'
      '       || '#39'-'#39' || lpl.pl_numerofactura AS nrofactura,'
      '       DECODE(lpl.pl_estado,'
      '              '#39'C'#39', '#39'Cargado'#39','
      '              '#39'A'#39', '#39'Anulado'#39','
      '              '#39'X'#39', '#39'Cancelado'#39','
      '              '#39'E'#39', '#39'Aprobado'#39','
      '              '#39#39') estado,pl_idintereses,'
      ''
      '       llj.lj_fechaaprobado pl_fechaaprobacion,'
      '       llj.lj_usuarioaprobado pl_usuaprobacion,'
      ''
      '       pl_duplicado, pl_estadoduplicidad, pl_motivoaprobacion, '
      
        '       DECODE(PL_ESTADODUPLICIDAD, '#39'A'#39', '#39'Aprobado'#39', '#39'R'#39', '#39'Rechaz' +
        'ado'#39', '#39#39') AS estadoduplicado,'
      '       pl_idliquidacion  '
      
        '  FROM rce_chequeemitido, legales.lpl_pagolegal lpl, legales.lbp' +
        '_beneficiariopago lbp,'
      '       art.scp_conpago scp, legales.lto_tipooperacion lto,'
      '         legales.llj_liquidacionjuicio llj'
      ' WHERE (    (lpl.pl_idbeneficiariopago = lbp.bp_id(+))'
      '        AND (lpl.pl_conpago = scp.cp_conpago)'
      '        AND (lpl.pl_idtipooperacion = lto.to_id(+)))'
      '        AND lpl.pl_idjuicioentramite = :idjuicioentramite'
      '        AND ce_id(+) = pl_idchequeemitido'
      '        AND lpl.pl_idliquidacion = llj.lj_id(+)'
      '        order by llj.LJ_FECHAAPROBADO')
  end
  inherited QueryPrint: TQueryPrint
    Left = 588
    Top = 484
  end
  inherited PrintDialog: TPrintDialog
    Left = 615
    Top = 481
  end
  inherited QueryPrintRecExtraord: TQueryPrint
    Left = 644
    Top = 480
  end
end
