inherited frmConsultaDictamenesAcustorios: TfrmConsultaDictamenesAcustorios
  Left = 440
  Top = 148
  Caption = 'Busqueda...(Sumarios)'
  ClientHeight = 500
  ClientWidth = 792
  Constraints.MinHeight = 450
  Constraints.MinWidth = 800
  OldCreateOrder = True
  ExplicitWidth = 800
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 175
    ExplicitWidth = 792
    ExplicitHeight = 175
    object pcFiltrosBusqueda: TPageControl
      Left = 0
      Top = 0
      Width = 792
      Height = 175
      ActivePage = tsGeneralAdm
      Align = alClient
      TabOrder = 0
      object tsGeneralAdm: TTabSheet
        Caption = 'General Administrativo'
        DesignSize = (
          784
          147)
        object Label1: TLabel
          Left = 315
          Top = 8
          Width = 5
          Height = 13
          Caption = '/'
        end
        object Label4: TLabel
          Left = 5
          Top = 81
          Width = 25
          Height = 13
          Caption = 'Area:'
        end
        object lblEstadoJuicio: TLabel
          Left = 5
          Top = 58
          Width = 36
          Height = 13
          Caption = 'Estado:'
        end
        object lblNroExpedienteMediacion: TLabel
          Left = 4
          Top = 6
          Width = 56
          Height = 13
          Caption = 'N'#186' Sumario:'
        end
        object Label2: TLabel
          Left = 151
          Top = 6
          Width = 81
          Height = 13
          Caption = 'Expediente SRT:'
        end
        object lblAreaSRT: TLabel
          Left = 5
          Top = 105
          Width = 50
          Height = 13
          Caption = 'Area SRT:'
        end
        object lblFirmanteSRT: TLabel
          Left = 5
          Top = 130
          Width = 68
          Height = 13
          Caption = 'Firmante SRT:'
        end
        object lblArts: TLabel
          Left = 5
          Top = 34
          Width = 61
          Height = 13
          Caption = 'C'#243'digo ART:'
        end
        object Label6: TLabel
          Left = 633
          Top = 33
          Width = 78
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Resp. Provincia:'
          Visible = False
        end
        object edExpedienteSRT: TPatternEdit
          Left = 236
          Top = 3
          Width = 75
          Height = 21
          MaxLength = 6
          TabOrder = 1
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edAnioExpedienteSRT: TPatternEdit
          Left = 324
          Top = 3
          Width = 75
          Height = 21
          MaxLength = 4
          TabOrder = 2
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        inline fraAreas: TfraCodigoDescripcion
          Left = 81
          Top = 76
          Width = 696
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          ExplicitLeft = 81
          ExplicitTop = 76
          ExplicitWidth = 696
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 641
            ExplicitLeft = 56
            ExplicitWidth = 641
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
        inline fraEstado: TfraCodigoDescripcion
          Left = 81
          Top = 52
          Width = 696
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 81
          ExplicitTop = 52
          ExplicitWidth = 696
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 641
            ExplicitLeft = 56
            ExplicitWidth = 641
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
        object edNroSumario: TPatternEdit
          Left = 66
          Top = 3
          Width = 75
          Height = 21
          MaxLength = 5
          TabOrder = 0
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        inline fraAreaSRT: TfraCodigoDescripcion
          Left = 81
          Top = 100
          Width = 696
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          ExplicitLeft = 81
          ExplicitTop = 100
          ExplicitWidth = 696
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 641
            ExplicitLeft = 56
            ExplicitWidth = 641
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
        inline fraFirmanteSRT: TfraCodigoDescripcion
          Left = 81
          Top = 124
          Width = 696
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          ExplicitLeft = 81
          ExplicitTop = 124
          ExplicitWidth = 696
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 641
            ExplicitLeft = 56
            ExplicitWidth = 641
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
        inline fraArts: TfraCodigoDescripcion
          Left = 81
          Top = 28
          Width = 382
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitLeft = 81
          ExplicitTop = 28
          ExplicitWidth = 382
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 323
            ExplicitLeft = 56
            ExplicitWidth = 323
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
        object cbResponsabilidadProvart: TExComboBox
          Left = 712
          Top = 29
          Width = 66
          Height = 22
          Style = csOwnerDrawFixed
          Anchors = [akTop, akRight]
          Enabled = False
          TabOrder = 4
          Text = 'T=Todos'
          Visible = False
          Items.Strings = (
            'T=Todos'
            'S=S'#237
            'N=No')
          ItemIndex = 0
          Options = []
          ValueWidth = 64
        end
      end
      object tsGeneralJudicial: TTabSheet
        Caption = 'General Judicial'
        ImageIndex = 7
        object lblMulta: TLabel
          Left = 8
          Top = 17
          Width = 61
          Height = 13
          Caption = 'Multa desde:'
        end
        object lblMopresJuidicialdde: TLabel
          Left = 8
          Top = 41
          Width = 70
          Height = 13
          Caption = 'Mopres desde:'
        end
        object lblTotalCostosGastosDemanda: TLabel
          Left = 8
          Top = 111
          Width = 27
          Height = 13
          Caption = 'Total:'
        end
        object lblGastosJudicial: TLabel
          Left = 392
          Top = 40
          Width = 68
          Height = 13
          Caption = 'Gastos desde:'
        end
        object lblMultaTasaJusticia: TLabel
          Left = 392
          Top = 63
          Width = 44
          Height = 13
          Caption = 'Multa TJ:'
        end
        object lblTasaJusticia: TLabel
          Left = 392
          Top = 17
          Width = 84
          Height = 13
          Caption = 'Tasa Just. desde:'
        end
        object lblCostasJudicial: TLabel
          Left = 8
          Top = 64
          Width = 67
          Height = 13
          Caption = 'Costas desde:'
        end
        object lblHonorarioAbogado: TLabel
          Left = 8
          Top = 87
          Width = 85
          Height = 13
          Caption = 'Hon. Abog. Prop.:'
        end
        object Label5: TLabel
          Left = 192
          Top = 17
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label7: TLabel
          Left = 192
          Top = 62
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label9: TLabel
          Left = 577
          Top = 38
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label10: TLabel
          Left = 192
          Top = 41
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label11: TLabel
          Left = 577
          Top = 17
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label12: TLabel
          Left = 192
          Top = 87
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label13: TLabel
          Left = 577
          Top = 62
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label14: TLabel
          Left = 192
          Top = 111
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object edMultaJudicialdde: TCurrencyEdit
          Left = 94
          Top = 14
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 0
        end
        object edMopersJudicialdde: TPatternEdit
          Left = 94
          Top = 38
          Width = 93
          Height = 21
          MaxLength = 6
          TabOrder = 3
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edHonorarioAbogadoPropiodde: TCurrencyEdit
          Left = 94
          Top = 84
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 11
        end
        object edTotaldde: TCurrencyEdit
          Left = 94
          Top = 107
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 15
        end
        object edMultaTJdde: TCurrencyEdit
          Left = 478
          Top = 59
          Width = 93
          Height = 20
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 13
        end
        object edGastosJudicialdde: TCurrencyEdit
          Left = 478
          Top = 37
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 9
        end
        object edTasaJusticiadde: TCurrencyEdit
          Left = 478
          Top = 14
          Width = 93
          Height = 20
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 5
        end
        object edCostasJudicialdde: TCurrencyEdit
          Left = 94
          Top = 61
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 7
        end
        object edMultaJudicialhta: TCurrencyEdit
          Left = 222
          Top = 14
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 1
        end
        object edCostasJudicialhta: TCurrencyEdit
          Left = 222
          Top = 61
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 8
        end
        object edGastosJudicialhta: TCurrencyEdit
          Left = 607
          Top = 37
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 10
        end
        object edMopersJudicialhta: TPatternEdit
          Left = 222
          Top = 38
          Width = 93
          Height = 21
          MaxLength = 6
          TabOrder = 4
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edTasaJusticiahta: TCurrencyEdit
          Left = 607
          Top = 14
          Width = 93
          Height = 20
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 6
        end
        object edHonorarioAbogadoPropiohta: TCurrencyEdit
          Left = 222
          Top = 84
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 12
        end
        object edMultaTJhta: TCurrencyEdit
          Left = 607
          Top = 59
          Width = 93
          Height = 20
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 14
        end
        object edTotalhta: TCurrencyEdit
          Left = 222
          Top = 107
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 16
        end
        object cbMulta: TCheckBox
          Left = 318
          Top = 17
          Width = 66
          Height = 17
          Caption = 'Sin Multa'
          TabOrder = 2
          OnClick = cbMultaClick
        end
      end
      object tsLetrados: TTabSheet
        Caption = 'Letrados'
        ImageIndex = 1
        DesignSize = (
          784
          147)
        object Label3: TLabel
          Left = 10
          Top = 35
          Width = 46
          Height = 13
          Caption = 'Abogado:'
        end
        object lblFechaAbogadoSumariante: TLabel
          Left = 10
          Top = 76
          Width = 73
          Height = 13
          Caption = 'Abogado Sum.:'
        end
        inline fraAbogadosPropios: TfraAbogadosLegales
          Left = 90
          Top = 32
          Width = 660
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 90
          ExplicitTop = 32
          ExplicitWidth = 660
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 605
            ExplicitLeft = 56
            ExplicitWidth = 605
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
        inline fraAbogadoSumariante: TfraAbogadosLegales
          Left = 90
          Top = 73
          Width = 660
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 90
          ExplicitTop = 73
          ExplicitWidth = 660
          inherited cmbDescripcion: TArtComboBox
            Left = 56
            Width = 605
            ExplicitLeft = 56
            ExplicitWidth = 605
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
        end
      end
      object tsJuzgados: TTabSheet
        Caption = 'Juzgados'
        ImageIndex = 2
        DesignSize = (
          784
          147)
        object lbFuero: TLabel
          Left = 9
          Top = 49
          Width = 30
          Height = 13
          Caption = 'Fuero:'
        end
        object lbJurisdiccion: TLabel
          Left = 9
          Top = 17
          Width = 58
          Height = 13
          Caption = 'Jurisdicci'#243'n:'
        end
        object lbJuzgado: TLabel
          Left = 9
          Top = 77
          Width = 63
          Height = 13
          Caption = 'Juzgado Nro:'
        end
        object lbSecretaria: TLabel
          Left = 9
          Top = 107
          Width = 53
          Height = 13
          Caption = 'Secretar'#237'a:'
        end
        inline fraFuero: TfraCodigoDescripcion
          Left = 81
          Top = 43
          Width = 680
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 81
          ExplicitTop = 43
          ExplicitWidth = 680
          DesignSize = (
            680
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 615
            ExplicitWidth = 615
          end
        end
        inline fraJurisdiccion: TfraCodigoDescripcion
          Left = 81
          Top = 12
          Width = 680
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 81
          ExplicitTop = 12
          ExplicitWidth = 680
          DesignSize = (
            680
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 615
            ExplicitWidth = 615
          end
        end
        inline fraJuzgado: TfraCodigoDescripcion
          Left = 81
          Top = 73
          Width = 680
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 81
          ExplicitTop = 73
          ExplicitWidth = 680
          DesignSize = (
            680
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 615
            ExplicitWidth = 615
          end
        end
        inline fraSecretaria: TfraCodigoDescripcion
          Left = 81
          Top = 103
          Width = 680
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitLeft = 81
          ExplicitTop = 103
          ExplicitWidth = 680
          DesignSize = (
            680
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 615
            ExplicitWidth = 615
          end
        end
      end
      object tsFechas: TTabSheet
        Caption = 'Fechas'
        ImageIndex = 3
        object lblFechaSentenciaDesde: TLabel
          Left = 5
          Top = 17
          Width = 94
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F.Sentencia desde:'
        end
        object LblFechaCierrehasta: TLabel
          Left = 195
          Top = 17
          Width = 26
          Height = 13
          Caption = 'hasta'
        end
        object Label23: TLabel
          Left = 5
          Top = 52
          Width = 85
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Fecha Fin desde:'
        end
        object Label24: TLabel
          Left = 195
          Top = 52
          Width = 26
          Height = 13
          Caption = 'hasta'
        end
        object CmbSentenciahta: TDateComboBox
          Left = 225
          Top = 13
          Width = 88
          Height = 21
          MinDateCombo = CmbSentenciadde
          TabOrder = 1
        end
        object CmbSentenciadde: TDateComboBox
          Left = 103
          Top = 13
          Width = 88
          Height = 21
          MaxDateCombo = CmbSentenciahta
          TabOrder = 0
        end
        object chkFechadeSentencia: TCheckBox
          Left = 329
          Top = 15
          Width = 161
          Height = 17
          Caption = 'Sin Fecha de Sentencia'
          TabOrder = 2
          OnClick = chkFechadeSentenciaClick
        end
        object edFechaFindde: TDateComboBox
          Left = 103
          Top = 48
          Width = 88
          Height = 21
          MaxDateCombo = edFechaFinhta
          TabOrder = 3
        end
        object edFechaFinhta: TDateComboBox
          Left = 225
          Top = 48
          Width = 88
          Height = 21
          MinDateCombo = edFechaFindde
          TabOrder = 4
        end
        object chkFechadeFin: TCheckBox
          Left = 329
          Top = 50
          Width = 161
          Height = 17
          Caption = 'Sin Fecha de Fin'
          TabOrder = 5
          OnClick = chkFechadeSentenciaClick
        end
      end
      object tsSiniestros: TTabSheet
        Caption = 'Siniestros'
        ImageIndex = 5
        DesignSize = (
          784
          147)
        object gbOrigenDemanda: TGroupBox
          Left = 4
          Top = 0
          Width = 533
          Height = 137
          Caption = ' Reclamos'
          TabOrder = 0
          inline fraNormaLegalImputada: TfraNormaLegal
            Left = 2
            Top = 12
            Width = 524
            Height = 106
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 12
            ExplicitWidth = 524
            ExplicitHeight = 106
            inherited lblDescripcionSentencia: TLabel
              Width = 34
              ExplicitWidth = 34
            end
            inherited lblNombre: TLabel
              Width = 40
              ExplicitWidth = 40
            end
            inherited lblNro: TLabel
              Left = 263
              Width = 59
              ExplicitLeft = 263
              ExplicitWidth = 59
            end
            inherited lblInciso: TLabel
              Left = 178
              Width = 31
              ExplicitLeft = 178
              ExplicitWidth = 31
            end
            inherited lblFechaPublicacion: TLabel
              Width = 67
              ExplicitWidth = 67
            end
            inherited lblFechaDerogacion: TLabel
              Left = 359
              Width = 67
              ExplicitLeft = 359
              ExplicitWidth = 67
            end
            inherited Label1: TLabel
              Left = 263
              Width = 46
              ExplicitLeft = 263
              ExplicitWidth = 46
            end
            inherited Label2: TLabel
              Left = 385
              Width = 33
              ExplicitLeft = 385
              ExplicitWidth = 33
            end
            inherited fraNorma: TfraCodigoDescripcionExt
              Width = 445
              ExplicitWidth = 445
              inherited cmbDescripcion: TArtComboBox
                Width = 380
                ExplicitWidth = 380
              end
            end
            inherited fraNombreNorma: TfraCodigoDescripcionExt
              Width = 183
              ExplicitWidth = 183
              inherited cmbDescripcion: TArtComboBox
                Width = 118
                ExplicitWidth = 118
              end
            end
            inherited edInciso: TPatternEdit
              Left = 216
              Width = 29
              Color = clWhite
              TabOrder = 6
              ExplicitLeft = 216
              ExplicitWidth = 29
            end
            inherited edDescripcion: TPatternEdit
              Left = 327
              Width = 192
              TabOrder = 9
              ExplicitLeft = 327
              ExplicitWidth = 192
            end
            inherited tbExporarTextoNorma: TToolBar
              Left = 480
              Top = 79
              Width = 36
              TabOrder = 10
              ExplicitLeft = 480
              ExplicitTop = 79
              ExplicitWidth = 36
              inherited tbHistoricoEstados: TToolButton
                Visible = False
              end
            end
            inherited edFechaNorma: TDateComboBox
              TabStop = True
              TabOrder = 2
            end
            inherited edFechaPublicacion: TDateComboBox
              TabStop = True
              TabOrder = 3
            end
            inherited edFechaDerogacion: TDateComboBox
              Left = 430
              TabStop = True
              TabOrder = 4
              ExplicitLeft = 430
            end
            inherited edArticulo: TIntEdit
              Width = 84
              Color = clWhite
              TabOrder = 5
              ExplicitWidth = 84
            end
            inherited edApartado: TPatternEdit
              Left = 315
              TabOrder = 7
              ExplicitLeft = 315
            end
            inherited edanexo: TPatternEdit
              Left = 422
              TabOrder = 8
              ExplicitLeft = 422
            end
          end
        end
        object gbEmpresaRelacionada: TGroupBox
          Left = 539
          Top = 0
          Width = 242
          Height = 137
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Empresa'
          TabOrder = 1
          DesignSize = (
            242
            137)
          object lbSiniestro: TLabel
            Left = 7
            Top = 99
            Width = 41
            Height = 13
            Caption = 'Nro. Sin:'
            FocusControl = fraEmpresaDemandante.edContrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          inline fraEmpresaDemandante: TfraEmpresa
            Left = 2
            Top = 23
            Width = 234
            Height = 74
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
            ExplicitLeft = 2
            ExplicitTop = 23
            ExplicitWidth = 234
            ExplicitHeight = 74
            inherited lbRSocial: TLabel
              Left = 5
              Top = 28
              ExplicitLeft = 5
              ExplicitTop = 28
            end
            inherited lbContrato: TLabel
              Left = 135
              Top = 52
              Visible = False
              ExplicitLeft = 135
              ExplicitTop = 52
            end
            inherited mskCUIT: TMaskEdit
              Left = 51
              ExplicitLeft = 51
            end
            inherited edContrato: TIntEdit
              Left = 51
              Top = 48
              Width = 138
              Anchors = [akLeft, akTop, akRight]
              ExplicitLeft = 51
              ExplicitTop = 48
              ExplicitWidth = 138
            end
            inherited cmbRSocial: TArtComboBox
              Left = 51
              Top = 24
              Width = 179
              ExplicitLeft = 51
              ExplicitTop = 24
              ExplicitWidth = 179
            end
            inherited sdqDatos: TSDQuery
              Left = 208
              Top = 8
            end
            inherited dsDatos: TDataSource
              Left = 236
              Top = 8
            end
          end
          object StaticText1: TStaticText
            Left = 6
            Top = 26
            Width = 32
            Height = 17
            Caption = 'CUIT:'
            TabOrder = 1
          end
          object StaticText2: TStaticText
            Left = 6
            Top = 74
            Width = 47
            Height = 17
            Caption = 'Contrato:'
            TabOrder = 2
          end
          object edSiniestro: TIntEdit
            Left = 53
            Top = 96
            Width = 98
            Height = 21
            Hint = 'N'#250'mero de Siniestro'
            TabOrder = 3
            MaxLength = 8
          end
        end
      end
      object tsDACSAL: TTabSheet
        Caption = 'DAC-SAL'
        ImageIndex = 6
        object lblNroDac: TLabel
          Left = 11
          Top = 7
          Width = 45
          Height = 13
          Caption = 'Nro.DAC:'
        end
        object lblFechaDAC: TLabel
          Left = 11
          Top = 31
          Width = 90
          Height = 13
          Caption = 'Fecha.DAC desde:'
        end
        object Label8: TLabel
          Left = 11
          Top = 55
          Width = 94
          Height = 13
          Caption = 'F.Notif. DAC desde:'
        end
        object lblDispocisionSAL: TLabel
          Left = 11
          Top = 79
          Width = 80
          Height = 13
          Caption = 'Dispocisi'#243'n SAL:'
        end
        object lblFechaSal: TLabel
          Left = 11
          Top = 105
          Width = 56
          Height = 13
          Caption = 'Fecha SAL:'
        end
        object Label15: TLabel
          Left = 210
          Top = 31
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label16: TLabel
          Left = 211
          Top = 55
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label17: TLabel
          Left = 211
          Top = 105
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object lblFechaAudienciaDescargo: TLabel
          Left = 11
          Top = 129
          Width = 86
          Height = 13
          Caption = 'Fecha.Aud.Desc.:'
        end
        object Label22: TLabel
          Left = 211
          Top = 129
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object lblNroResolucion: TLabel
          Left = 452
          Top = 7
          Width = 76
          Height = 13
          Caption = 'Nro.Resoluci'#243'n:'
        end
        object lblFechaResolucion: TLabel
          Left = 452
          Top = 31
          Width = 58
          Height = 13
          Caption = 'Fecha.Res.:'
        end
        object lblFechaNotificacionResolucion: TLabel
          Left = 452
          Top = 55
          Width = 93
          Height = 13
          Caption = 'F.Notificaci'#243'n Res.:'
        end
        object lblMultaSRT: TLabel
          Left = 452
          Top = 105
          Width = 54
          Height = 13
          Caption = 'Multa SRT:'
        end
        object lblMopresAdministrativo: TLabel
          Left = 452
          Top = 129
          Width = 38
          Height = 13
          Caption = 'Mopres:'
        end
        object Label21: TLabel
          Left = 648
          Top = 129
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label20: TLabel
          Left = 648
          Top = 105
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label18: TLabel
          Left = 648
          Top = 55
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object Label19: TLabel
          Left = 648
          Top = 31
          Width = 29
          Height = 13
          Caption = 'hasta:'
        end
        object edNroDAC: TPatternEdit
          Left = 110
          Top = 3
          Width = 94
          Height = 21
          MaxLength = 6
          TabOrder = 0
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edFechaDacdde: TDateComboBox
          Left = 110
          Top = 27
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 1
        end
        object edFechaNotificacionDacdde: TDateComboBox
          Left = 110
          Top = 51
          Width = 98
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 3
        end
        object edDisposicionSAL: TPatternEdit
          Left = 110
          Top = 75
          Width = 94
          Height = 21
          MaxLength = 6
          TabOrder = 6
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edFechaSaldde: TDateComboBox
          Left = 110
          Top = 100
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 7
        end
        object edFechaDachta: TDateComboBox
          Left = 243
          Top = 27
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 2
        end
        object edFechaNotificacionDachta: TDateComboBox
          Left = 243
          Top = 51
          Width = 98
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 4
        end
        object edFechaSalhta: TDateComboBox
          Left = 243
          Top = 100
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 8
        end
        object edFechaAudienciaDescargodde: TDateComboBox
          Left = 110
          Top = 124
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 9
        end
        object edFechaAudienciaDescargohta: TDateComboBox
          Left = 243
          Top = 124
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 10
        end
        object edMopresdde: TPatternEdit
          Left = 548
          Top = 124
          Width = 93
          Height = 21
          MaxLength = 6
          TabOrder = 20
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edMultaSRTdde: TCurrencyEdit
          Left = 548
          Top = 100
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 18
        end
        object edFechaNotificacionResoluciondde: TDateComboBox
          Left = 548
          Top = 51
          Width = 98
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 15
        end
        object edFechaResoluciondde: TDateComboBox
          Left = 548
          Top = 27
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 13
        end
        object edNroResolucion: TPatternEdit
          Left = 548
          Top = 3
          Width = 94
          Height = 21
          MaxLength = 6
          TabOrder = 12
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object edFechaResolucionhta: TDateComboBox
          Left = 681
          Top = 27
          Width = 96
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 14
        end
        object edFechaNotificacionResolucionhta: TDateComboBox
          Left = 681
          Top = 51
          Width = 98
          Height = 21
          MinDate = 35431.000000000000000000
          TabOrder = 16
        end
        object edMultaSRThta: TCurrencyEdit
          Left = 681
          Top = 100
          Width = 93
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.000000000000000000
          TabOrder = 19
        end
        object edMopreshta: TPatternEdit
          Left = 681
          Top = 124
          Width = 93
          Height = 21
          MaxLength = 6
          TabOrder = 21
          Alignment = taRightJustify
          Pattern = '0123456789'
        end
        object cbFechaNotifDac: TCheckBox
          Left = 344
          Top = 55
          Width = 102
          Height = 17
          Caption = 'Sin F.Notif. DAC'
          TabOrder = 5
          OnClick = cbFechaNotifDacClick
        end
        object cbFechaAudDesc: TCheckBox
          Left = 344
          Top = 129
          Width = 105
          Height = 17
          Caption = 'Sin F. Aud. Desc.'
          TabOrder = 11
          OnClick = cbFechaAudDescClick
        end
        object cbFNotifRes: TCheckBox
          Left = 612
          Top = 73
          Width = 105
          Height = 17
          Caption = 'Sin F.Notif. Res.'
          TabOrder = 17
          OnClick = cbFNotifResClick
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 175
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 175
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 779
      ButtonWidth = 25
      HotImages = frmPrincipal.ilByN
      Images = frmPrincipal.ilColor
      ExplicitWidth = 779
      inherited ToolButton5: TToolButton
        Left = 25
        ExplicitLeft = 25
      end
      inherited tbNuevo: TToolButton
        Left = 33
        Visible = True
        OnClick = tbNuevoClick
        ExplicitLeft = 33
      end
      inherited tbModificar: TToolButton
        Left = 58
        Visible = True
        OnClick = tbModificarClick
        ExplicitLeft = 58
      end
      inherited tbEliminar: TToolButton
        Left = 83
        ExplicitLeft = 83
      end
      inherited ToolButton4: TToolButton
        Left = 108
        ExplicitLeft = 108
      end
      inherited tbPropiedades: TToolButton
        Left = 116
        ExplicitLeft = 116
      end
      inherited ToolButton3: TToolButton
        Left = 141
        ExplicitLeft = 141
      end
      inherited tbLimpiar: TToolButton
        Left = 149
        ExplicitLeft = 149
      end
      inherited tbOrdenar: TToolButton
        Left = 174
        ExplicitLeft = 174
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 199
        Visible = True
        ExplicitLeft = 199
      end
      inherited ToolButton6: TToolButton
        Left = 224
        ExplicitLeft = 224
      end
      inherited tbImprimir: TToolButton
        Left = 232
        ExplicitLeft = 232
      end
      inherited tbExportar: TToolButton
        Left = 257
        ExplicitLeft = 257
      end
      inherited tbEnviarMail: TToolButton
        Left = 282
        ExplicitLeft = 282
      end
      inherited ToolButton8: TToolButton
        Left = 307
        ExplicitLeft = 307
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 315
        Visible = False
        ExplicitLeft = 315
      end
      inherited tbMaxRegistros: TToolButton
        Left = 340
        Visible = False
        ExplicitLeft = 340
      end
      inherited ToolButton11: TToolButton
        Left = 365
        ExplicitLeft = 365
      end
      inherited tbSalir: TToolButton
        Left = 373
        ExplicitLeft = 373
      end
      object ToolButton1: TToolButton
        Left = 398
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object ckbDetalleSiniestros: TCheckBox
        Left = 406
        Top = 0
        Width = 159
        Height = 22
        Alignment = taLeftJustify
        Caption = 'Exportar Detalle de Siniestros'
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 204
    Width = 792
    Height = 277
    TabStop = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'ar_nombre'
        Title.Caption = 'Art'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_NUMEROSUMARIO'
        Title.Caption = 'Nro.Sumario'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_INSTANCIAADMINISTRATIVA'
        Title.Caption = 'Instancia Adm.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TR_DESCRIPCION'
        Title.Caption = 'Sentencia'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_REGISTRACION'
        Title.Caption = 'Registraci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_NUMEROEXPEDIENTE'
        Title.Caption = 'Nro.Expediente'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_ANIOEXPEDIENTE'
        Title.Caption = 'A'#241'o Expediente'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_NUMERODAC'
        Title.Caption = 'Nro.DAC'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHADAC'
        Title.Caption = 'Fecha DAC'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHANOTIFICACIONDAC'
        Title.Caption = 'F.Notif.DAC'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_DISPOSICIONSAL'
        Title.Caption = 'Disp.SAL'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHASAL'
        Title.Caption = 'Fecha SAL'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_NUMERORESOLUCION'
        Title.Caption = 'Nro.Resoluci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHARESOLUCION'
        Title.Caption = 'F.Resol.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHANOTIFRESOL'
        Title.Caption = 'F.Notific.Resol'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_MULTASRT'
        Title.Caption = 'Multa S.R.T.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_MULTASENTECIA'
        Title.Caption = 'Multa Sentencia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_COSTAS'
        Title.Caption = 'Costas'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_GASTOS'
        Title.Caption = 'Gastos'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_HONORARIOSABOGADOSPROPIOS'
        Title.Caption = 'H.Abog.Prop.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_TASASJUSTICIA'
        Title.Caption = 'Tasa Justicia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_MULTATASASJUSTICIA'
        Title.Caption = 'Multas Justicia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_IMPORTERESERVAHONORARIOS'
        Title.Caption = 'Imp.Reserv.Hon.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_IMPORTERESERVA'
        Title.Caption = 'Importe Reserva'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_RESERVAHONORARIOCALCULADA'
        Title.Caption = 'Res.Hon.Calc'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_RESERVACAPITALCALCULADA'
        Title.Caption = 'Res.Cap.Calc'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_USUARIOAPROBACIONRESERVAS'
        Title.Caption = 'Usuario Apr.Res'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHAAPROBACIONRESERVAS'
        Title.Caption = 'Fecha Aprb.Res.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_MONTOEMBARGO'
        Title.Caption = 'Monto Embargo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHAEMBARGO'
        Title.Caption = 'Fecha Embargo'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHASENTENCIA'
        Title.Caption = 'F.Sentencia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHAFIN'
        Title.Caption = 'Fecha Fin Sumario'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DESCRIPCION'
        Title.Caption = 'Juzgado'
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JU_DESCRIPCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 337
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Title.Caption = 'Area'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABOGADO'
        Title.Caption = 'Abogado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABOGADOSUM'
        Title.Caption = 'Abogado Sumariante'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHANOTIFSENTENCIA'
        Title.Caption = 'Fecha Notif. Sentencia'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOPORRESOLUCION'
        Title.Caption = 'Pago por Resoluci'#243'n'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_GPBAINCUMPLIMIENTO'
        Title.Caption = 'GPBA Incumplimiento'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_FECHAINCUMPLIMIENTO'
        Title.Caption = 'Fecha Incumplimiento'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOPRES'
        Title.Caption = 'Mopres'
        Width = 93
        Visible = True
      end>
  end
  object TotalStatusBar: TStatusBar [3]
    Left = 0
    Top = 481
    Width = 792
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT DISTINCT su_id, su_numerosumario, su_instanciaadministrat' +
        'iva,'
      
        '                su_registracion, su_numeroexpediente, su_anioexp' +
        'ediente,'
      
        '                su_area, su_abogado, su_abogadosumariante, su_ar' +
        'easrt,'
      '                su_firmantesrt, su_numerodac, su_fechadac,'
      
        '                su_fechanotificaciondac, su_disposicionsal, su_f' +
        'echasal,'
      
        '                su_numeroresolucion, su_fecharesolucion, su_mult' +
        'asrt,'
      
        '                su_multasentecia, su_idtiporesultadosentencia, s' +
        'u_costas,'
      
        '                su_gastos, su_honorariosabogadospropios, su_tasa' +
        'sjusticia,'
      '                su_multatasasjusticia, su_idmesaentradalegal,'
      
        '                su_idjurisdiccion, su_idfuero, su_idjuzgado, su_' +
        'idsecretaria,'
      '                su_importereservahonorarios, su_importereserva,'
      
        '                su_reservahonorariocalculada, su_reservacapitalc' +
        'alculada,'
      
        '                su_usuarioaprobacionreservas, su_fechaaprobacion' +
        'reservas,'
      '                su_montoembargo, su_fechaembargo, su_bloqueado,'
      
        '                su_fechanotifresol, su_fechasentencia, su_fechaf' +
        'in,'
      
        '                su_textosentencia, su_fechaalta, su_usualta, su_' +
        'fechamodif,'
      '                su_usumodif, lju_jurisdiccion.ju_descripcion,'
      '                ljz_juzgado.jz_descripcion, su_idestado,'
      '                lej_estadojuicio.ej_descripcion estado,'
      
        '                usc.sc_descripcion area, lbo_abogado.bo_nombre a' +
        'bogado,'
      '                abogadosum.bo_nombre abogadosum, tr_descripcion,'
      
        '                aar.ar_nombre, su_fechanotifbudi, su_fechanotifs' +
        'entencia,'
      '                (SELECT NVL'
      '                           (  SUM (NVL (ps_importepago, 0))'
      
        '                            + SUM (NVL (ps_importeconretencion, ' +
        '0)),'
      '                            0'
      '                           )'
      '                   FROM legales.lps_pagosumario'
      '                  WHERE ps_idsumario = su_id'
      '                    AND ps_estado NOT IN ('#39'A'#39')'
      
        '                    AND ps_conpago IN (180, 183)) AS pagoporreso' +
        'lucion,'
      '                su_gpbaincumplimiento, su_fechaincumplimiento,'
      '                NVL2'
      '                   (su_fechaincumplimiento,'
      '                    ROUND (su_multasrt / 80),'
      '                    ROUND (  su_multasrt'
      '                           / (SELECT am_valorampo'
      '                                FROM art.cam_topeampos cam'
      '                               WHERE am_periodo ='
      
        '                                        (SELECT MAX (a.am_period' +
        'o)'
      
        '                                           FROM art.cam_topeampo' +
        's a'
      '                                          WHERE a.am_periodo <='
      '                                                   TO_CHAR'
      
        '                                                      (su_fechai' +
        'ncumplimiento,'
      '                                                       '#39'YYYYMM'#39
      '                                                      )))'
      '                          )'
      '                   ) mopres'
      '           FROM legales.lsu_sumario lsu,'
      '                art.usc_sectores usc,'
      '                legales.lej_estadojuicio,'
      '                legales.lbo_abogado,'
      '                legales.lbo_abogado abogadosum,'
      '                legales.lju_jurisdiccion,'
      '                legales.lfu_fuero,'
      '                legales.ljz_juzgado,'
      '                legales.lsc_secretaria,'
      
        '                legales.ltr_tiporesultadosentencia tiporesultado' +
        ','
      '                afi.aar_art aar'
      
        '          WHERE (lsu.su_idjurisdiccion = lju_jurisdiccion.ju_id(' +
        '+))'
      '            AND (lsu.su_idfuero = lfu_fuero.fu_id(+))'
      '            AND (lsu.su_idjuzgado = ljz_juzgado.jz_id(+))'
      '            AND (lsu.su_idsecretaria = lsc_secretaria.sc_id(+))'
      '            AND (lsu.su_abogado = lbo_abogado.bo_id(+))'
      '            AND (lsu.su_abogadosumariante = abogadosum.bo_id(+))'
      '            AND (lsu.su_idestado = lej_estadojuicio.ej_id(+))'
      
        '            AND (lsu.su_idtiporesultadosentencia = tiporesultado' +
        '.tr_id(+))'
      '            AND (lsu.su_area = usc.sc_id(+))'
      '            AND aar.ar_id = lsu.su_idart'
      '            AND 1 = 2')
    Left = 36
    Top = 404
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 404
  end
  inherited SortDialog: TSortDialog
    Left = 120
    Top = 376
  end
  inherited ExportDialog: TExportDialog
    Left = 120
    Top = 404
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Reporte de Juicios'
    Headers.Font.Height = -8
    Detail.Font.Height = -7
    SubTotals.Font.Height = -7
    SubTotals.Font.Style = [fsBold]
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 148
    Top = 404
  end
  inherited Seguridad: TSeguridad
    Left = 36
    Top = 376
  end
  inherited FormStorage: TFormStorage
    Left = 64
    Top = 376
  end
  inherited PrintDialog: TPrintDialog
    Left = 148
    Top = 376
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
    Left = 92
    Top = 376
  end
  inherited FieldHider: TFieldHider
    Left = 92
    Top = 404
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.lsu_sumario'
      'WHERE su_id = :su_id')
    Left = 84
    Top = 268
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'su_id'
        ParamType = ptInput
      end>
  end
  object sdqConsultaRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.lsu_sumario'
      'WHERE su_id = :su_id')
    Left = 140
    Top = 268
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'su_id'
        ParamType = ptInput
      end>
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
    Left = 176
    Top = 408
  end
end
