inherited frmControlErgonomia: TfrmControlErgonomia
  Left = 187
  Top = 103
  Width = 858
  Height = 682
  Caption = 'Control Ergonomia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 850
    Height = 181
    Visible = True
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 850
      Height = 181
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        DesignSize = (
          842
          153)
        object Label3: TLabel
          Left = 8
          Top = 10
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label10: TLabel
          Left = 10
          Top = 36
          Width = 21
          Height = 13
          Caption = 'CIIU'
        end
        object Label13: TLabel
          Left = 10
          Top = 60
          Width = 33
          Height = 13
          Caption = 'Puesto'
        end
        object Label14: TLabel
          Left = 12
          Top = 104
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label18: TLabel
          Left = 10
          Top = 128
          Width = 85
          Height = 13
          Caption = 'Fecha Agendada:'
        end
        object Label19: TLabel
          Left = 111
          Top = 128
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object Label20: TLabel
          Left = 277
          Top = 128
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 67
          Top = 6
          Width = 415
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
          DesignSize = (
            415
            21)
          inherited lbContrato: TLabel
            Left = 311
          end
          inherited edContrato: TIntEdit
            Left = 358
          end
          inherited cmbRSocial: TArtComboBox
            Left = 128
            Width = 176
          end
        end
        object cbAprobado: TCheckBox
          Left = 8
          Top = 82
          Width = 106
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Aprobado'
          TabOrder = 3
        end
        object cbNoAprobado: TCheckBox
          Left = 176
          Top = 82
          Width = 106
          Height = 17
          Alignment = taLeftJustify
          Caption = 'No Aprobado'
          TabOrder = 4
        end
        inline fraCiiu: TfraCodigoDescripcion
          Left = 65
          Top = 32
          Width = 496
          Height = 23
          TabOrder = 1
          inherited cmbDescripcion: TArtComboBox
            Width = 431
          end
        end
        inline fraPuestoFiltro: TfraCodigoDescripcion
          Left = 65
          Top = 56
          Width = 305
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DesignSize = (
            305
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 240
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            CharCase = ecNormal
          end
        end
        object cmbEstado: TCheckCombo
          Left = 65
          Top = 100
          Width = 305
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object edFechaAgendadaDesde: TDateComboBox
          Left = 149
          Top = 124
          Width = 88
          Height = 21
          TabOrder = 6
        end
        object edFechaAgendadaHasta: TDateComboBox
          Left = 333
          Top = 124
          Width = 88
          Height = 21
          TabOrder = 7
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Siniestros'
        ImageIndex = 1
        object Label11: TLabel
          Left = 220
          Top = 57
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label9: TLabel
          Left = 85
          Top = 57
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object lbFecha: TLabel
          Left = 2
          Top = 57
          Width = 76
          Height = 13
          Caption = 'Fecha de Carga'
        end
        object lbEstadoFiltro: TLabel
          Left = 3
          Top = 33
          Width = 32
          Height = 13
          Caption = 'CIE 10'
        end
        object Label12: TLabel
          Left = 6
          Top = 8
          Width = 24
          Height = 13
          Caption = 'CUIL'
        end
        object edFechaCargaHasta: TDateEdit
          Left = 250
          Top = 54
          Width = 99
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
        end
        object edFechaCargaDesde: TDateEdit
          Left = 119
          Top = 54
          Width = 99
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
        end
        object cbNoInvestigado: TCheckBox
          Left = 354
          Top = 56
          Width = 107
          Height = 17
          Alignment = taLeftJustify
          Caption = 'No Investigado'
          TabOrder = 4
        end
        inline fraCie10Filtro: TfraCodigoDescripcion
          Left = 54
          Top = 29
          Width = 654
          Height = 23
          TabOrder = 1
          inherited cmbDescripcion: TArtComboBox
            Width = 589
          end
        end
        inline fraTrabajadorFiltro: TfraTrabajadorSiniestro
          Left = 56
          Top = 2
          Width = 650
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited lbSiniestro: TLabel
            Left = 484
          end
          inherited cmbNombre: TArtComboBox
            Width = 397
          end
          inherited edSiniestro: TSinEdit
            Left = 549
          end
          inherited ToolBar: TToolBar
            Left = 526
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 181
    Width = 850
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 846
      end>
    inherited ToolBar: TToolBar
      Width = 833
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbTieneRiesgo: TToolButton
        Left = 370
        Top = 0
        Hint = 'Tiene Riesgo (ESOP 80004)'
        Caption = 'tbTieneRiesgo'
        ImageIndex = 27
        OnClick = tbTieneRiesgoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 210
    Width = 850
    Height = 445
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCEDENCIA'
        Title.Caption = 'Procedencia'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APROBADO'
        Title.Caption = 'Aprobado'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IE_FECHAINVESTIGACION'
        Title.Caption = 'Fecha Investigaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PUESTO'
        Title.Caption = 'Puesto'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IE_FECHAAGENDADA'
        Title.Caption = 'Fecha Agendada'
        Width = 105
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 232
    Width = 690
    Height = 493
    inherited BevelAbm: TBevel
      Top = 457
      Width = 682
    end
    inherited btnAceptar: TButton
      Left = 532
      Top = 463
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 610
      Top = 463
      TabOrder = 3
    end
    object PageControl: TPageControl
      Left = 0
      Top = 35
      Width = 690
      Height = 421
      ActivePage = tbInvestigacion
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object tbSiniestro: TTabSheet
        Caption = 'Siniestro'
        object ScrollBoxSiniestro: TScrollBox
          Left = 0
          Top = 0
          Width = 682
          Height = 393
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object gbDatosEmpresa: TGroupBox
            Left = 0
            Top = 0
            Width = 666
            Height = 161
            Align = alTop
            Caption = 'Datos de la Empresa'
            TabOrder = 0
            DesignSize = (
              666
              161)
            object lbCUIT: TLabel
              Left = 8
              Top = 18
              Width = 25
              Height = 13
              Caption = 'CUIT'
            end
            object lbDomicilioempresa: TLabel
              Left = 7
              Top = 36
              Width = 111
              Height = 13
              Caption = 'Domicilio de la empresa'
            end
            object lbTelefonoEmpresa: TLabel
              Left = 5
              Top = 103
              Width = 44
              Height = 26
              Caption = 'Tel'#233'fono'#13#10'Empresa:'
            end
            object lbCIIU: TLabel
              Left = 7
              Top = 138
              Width = 21
              Height = 13
              Caption = 'CIIU'
            end
            object lbDescripcion: TLabel
              Left = 115
              Top = 137
              Width = 56
              Height = 13
              Caption = 'Descripci'#243'n'
            end
            inline fraEmpresaSiniestro: TfraEmpresa
              Left = 51
              Top = 14
              Width = 607
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
              DesignSize = (
                607
                21)
              inherited lbContrato: TLabel
                Left = 503
              end
              inherited edContrato: TIntEdit
                Left = 550
              end
              inherited cmbRSocial: TArtComboBox
                Left = 128
                Width = 368
              end
            end
            inline fraDomicilioEmpresa: TfraDomicilio
              Left = 6
              Top = 54
              Width = 651
              Height = 51
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              DesignSize = (
                651
                51)
              inherited lbCalle: TLabel
                Left = 0
              end
              inherited lbNro: TLabel
                Left = 436
              end
              inherited lbPiso: TLabel
                Left = 508
              end
              inherited lbDto: TLabel
                Left = 584
              end
              inherited lbProvincia: TLabel
                Left = 489
              end
              inherited cmbCalle: TArtComboBox
                Width = 351
              end
              inherited edNumero: TEdit
                Left = 458
              end
              inherited edPiso: TEdit
                Left = 534
              end
              inherited edDto: TEdit
                Left = 606
              end
              inherited cmbLocalidad: TArtComboBox
                Width = 219
              end
              inherited edProvincia: TEdit
                Left = 538
                Width = 112
              end
              inherited btnBuscar: TButton
                Left = 401
              end
            end
            object edTelefonoEmpresa: TPatternEdit
              Left = 54
              Top = 108
              Width = 603
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 60
              TabOrder = 2
              Pattern = '0123456789()-/'
            end
            object edCIIU: TEdit
              Left = 54
              Top = 134
              Width = 51
              Height = 21
              TabStop = False
              TabOrder = 3
            end
            object edCiiuDescripcion: TEdit
              Left = 189
              Top = 134
              Width = 468
              Height = 21
              TabStop = False
              TabOrder = 4
            end
          end
          object gbDatosTrabajador: TGroupBox
            Left = 0
            Top = 161
            Width = 666
            Height = 137
            Align = alTop
            Caption = 'Datos del Trabajador Accidentado'
            TabOrder = 1
            DesignSize = (
              666
              137)
            object Label1: TLabel
              Left = 7
              Top = 39
              Width = 95
              Height = 13
              Caption = 'Lugar del Accidente'
            end
            object lbTelefono: TLabel
              Left = 5
              Top = 59
              Width = 45
              Height = 13
              Caption = 'Tel'#233'fono:'
            end
            object lbCalle: TLabel
              Left = 10
              Top = 19
              Width = 24
              Height = 13
              Caption = 'CUIL'
            end
            inline fraDomicilioAccidente: TfraDomicilio
              Left = 4
              Top = 81
              Width = 650
              Height = 51
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              DesignSize = (
                650
                51)
              inherited lbCalle: TLabel
                Left = 0
              end
              inherited lbNro: TLabel
                Left = 435
              end
              inherited lbPiso: TLabel
                Left = 507
              end
              inherited lbDto: TLabel
                Left = 583
              end
              inherited lbCPA: TLabel
                Left = 109
              end
              inherited lbLocalidad: TLabel
                Left = 217
              end
              inherited lbProvincia: TLabel
                Left = 488
              end
              inherited cmbCalle: TArtComboBox
                Left = 53
                Width = 350
              end
              inherited edNumero: TEdit
                Left = 457
              end
              inherited edPiso: TEdit
                Left = 533
              end
              inherited edDto: TEdit
                Left = 605
              end
              inherited edCPostal: TIntEdit
                Left = 53
              end
              inherited cmbLocalidad: TArtComboBox
                Left = 269
                Width = 218
              end
              inherited edProvincia: TEdit
                Left = 537
              end
              inherited edCPA: TPatternEdit
                Left = 135
              end
              inherited btnBuscar: TButton
                Left = 400
              end
            end
            object edTelefonoAccidente: TPatternEdit
              Left = 57
              Top = 55
              Width = 597
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 60
              TabOrder = 1
              Pattern = '0123456789()-/'
            end
            inline fraTrabajadorABM: TfraTrabajadorSiniestro
              Left = 58
              Top = 15
              Width = 597
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited lbSiniestro: TLabel
                Left = 431
              end
              inherited cmbNombre: TArtComboBox
                Width = 344
              end
              inherited edSiniestro: TSinEdit
                Left = 496
              end
              inherited ToolBar: TToolBar
                Left = 473
                Visible = False
              end
            end
          end
          object gbDescripciones: TGroupBox
            Left = 0
            Top = 342
            Width = 666
            Height = 319
            Align = alTop
            Caption = 'Descripciones y Observaciones'
            TabOrder = 2
            DesignSize = (
              666
              319)
            object lbBreveDescripcion: TLabel
              Left = 4
              Top = -71
              Width = 56
              Height = 52
              Caption = '   Breve'#13#10'Descripci'#243'n'#13#10'      del '#13#10'Expediente:'
            end
            object lbObservacionExpediente: TLabel
              Left = 4
              Top = 23
              Width = 73
              Height = 26
              Caption = 'Observaciones'#13#10'del Expediente:'
            end
            object lbDescripcionDenuncia: TLabel
              Left = 6
              Top = 84
              Width = 71
              Height = 26
              Caption = 'Descripci'#243'n de'#13#10'la Denuncia:'
            end
            object lbObservacionDenuncia: TLabel
              Left = 5
              Top = 138
              Width = 75
              Height = 26
              Caption = 'Observaciones '#13#10'de la Denuncia:'
            end
            object lbDescripcionOtros: TLabel
              Left = 7
              Top = 200
              Width = 59
              Height = 26
              Caption = 'Descripci'#243'n '#13#10'     Otros:'
            end
            object lbObservacionOtros: TLabel
              Left = 5
              Top = 262
              Width = 74
              Height = 26
              Caption = 'Observaciones '#13#10'      Otros:'
            end
            object edObservacionesExpediente: TMemo
              Left = 80
              Top = 22
              Width = 580
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edDescripcionDenuncia: TMemo
              Left = 80
              Top = 80
              Width = 579
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edObservacionDenuncia: TMemo
              Left = 80
              Top = 138
              Width = 579
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edDescripcionOtros: TMemo
              Left = 80
              Top = 198
              Width = 579
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edObservacionOtros: TMemo
              Left = 80
              Top = 260
              Width = 579
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 298
            Width = 666
            Height = 44
            Align = alTop
            TabOrder = 3
            object lbFechaAccidente: TLabel
              Left = 6
              Top = 18
              Width = 96
              Height = 13
              Caption = 'Fecha de Accidente'
            end
            object edFechaAccidente: TDateEdit
              Left = 106
              Top = 14
              Width = 99
              Height = 21
              NumGlyphs = 2
              TabOrder = 0
            end
          end
        end
      end
      object tbInvestigacion: TTabSheet
        Caption = 'Investigaci'#243'n'
        ImageIndex = 1
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 682
          Height = 393
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object gbEmpresa: TGroupBox
            Left = 0
            Top = 91
            Width = 666
            Height = 45
            Align = alTop
            Caption = 'Empresa'
            TabOrder = 1
            DesignSize = (
              666
              45)
            object Label7: TLabel
              Left = 11
              Top = 20
              Width = 25
              Height = 13
              Caption = 'CUIT'
            end
            inline fraEmpresaInvestigacion: TfraEmpresa
              Left = 60
              Top = 16
              Width = 609
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
                Left = 505
              end
              inherited edContrato: TIntEdit
                Left = 552
              end
              inherited cmbRSocial: TArtComboBox
                Width = 370
              end
            end
          end
          object gbLugarInvestigacion: TGroupBox
            Left = 0
            Top = 136
            Width = 666
            Height = 104
            Align = alTop
            Caption = 'Luga de la investigaci'#243'n'
            TabOrder = 2
            DesignSize = (
              666
              104)
            object lbEstablecimientoTrabajador: TLabel
              Left = 5
              Top = 21
              Width = 77
              Height = 13
              Caption = 'Establecimiento:'
            end
            inline fraEstablecimientoTrabajador: TfraEstablecimiento
              Left = 87
              Top = 18
              Width = 586
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              DesignSize = (
                586
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 521
              end
            end
            inline fraDomicilioEstablecimiento: TfraDomicilio
              Left = 6
              Top = 45
              Width = 664
              Height = 51
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              DesignSize = (
                664
                51)
              inherited lbCalle: TLabel
                Left = 0
              end
              inherited lbNro: TLabel
                Left = 449
              end
              inherited lbPiso: TLabel
                Left = 521
              end
              inherited lbDto: TLabel
                Left = 597
              end
              inherited lbCPA: TLabel
                Left = 110
              end
              inherited lbLocalidad: TLabel
                Left = 218
              end
              inherited lbProvincia: TLabel
                Left = 502
              end
              inherited cmbCalle: TArtComboBox
                Left = 54
                Width = 356
              end
              inherited edNumero: TEdit
                Left = 471
              end
              inherited edPiso: TEdit
                Left = 547
              end
              inherited edDto: TEdit
                Left = 619
              end
              inherited edCPostal: TIntEdit
                Left = 54
              end
              inherited cmbLocalidad: TArtComboBox
                Left = 270
                Width = 232
              end
              inherited edProvincia: TEdit
                Left = 551
                Width = 111
              end
              inherited edCPA: TPatternEdit
                Left = 136
              end
              inherited btnBuscar: TButton
                Left = 414
              end
            end
          end
          object gbPreventor: TGroupBox
            Left = 0
            Top = 240
            Width = 666
            Height = 55
            Align = alTop
            Caption = 'Preventor'
            TabOrder = 4
            DesignSize = (
              666
              55)
            object lbPreventorAsignado: TLabel
              Left = 10
              Top = 19
              Width = 49
              Height = 26
              Caption = 'Preventor '#13#10'Asignado:'
            end
            inline fraPreventorAsignado: TfraCodigoDescripcion
              Left = 87
              Top = 18
              Width = 519
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              DesignSize = (
                519
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 454
                CharCase = ecUpperCase
              end
              inherited edCodigo: TPatternEdit
                CharCase = ecNormal
              end
            end
          end
          object gbDatos: TGroupBox
            Left = 0
            Top = 295
            Width = 666
            Height = 113
            Align = alTop
            TabOrder = 3
            DesignSize = (
              666
              113)
            object lbFechaInvestigacion: TLabel
              Left = 8
              Top = 32
              Width = 69
              Height = 26
              Caption = '    Fecha '#13#10'Investigaci'#243'n :'
            end
            object Label2: TLabel
              Left = 128
              Top = 64
              Width = 68
              Height = 13
              Caption = 'Horario Desde'
            end
            object Label4: TLabel
              Left = 280
              Top = 64
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object Label5: TLabel
              Left = 8
              Top = 84
              Width = 39
              Height = 13
              Caption = 'Puesto :'
            end
            object Label8: TLabel
              Left = 8
              Top = 9
              Width = 52
              Height = 13
              Caption = 'Aprobado :'
            end
            object cbAprobadoSI: TCheckBox
              Left = 88
              Top = 8
              Width = 41
              Height = 17
              Alignment = taLeftJustify
              Caption = 'SI'
              TabOrder = 0
              OnClick = cbAprobadoSIClick
            end
            object edFechaInvestigacion: TDateEdit
              Left = 88
              Top = 32
              Width = 97
              Height = 21
              NumGlyphs = 2
              TabOrder = 2
            end
            object edHorarioDesde: TDateTimePicker
              Left = 204
              Top = 60
              Width = 68
              Height = 21
              Date = 37372.500000000000000000
              Time = 37372.500000000000000000
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 4
            end
            object edHorarioHasta: TDateTimePicker
              Left = 319
              Top = 60
              Width = 68
              Height = 21
              Date = 37372.500000000000000000
              Time = 37372.500000000000000000
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 5
            end
            object cbHorasExtras: TCheckBox
              Left = 400
              Top = 64
              Width = 83
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Horas Extras'
              TabOrder = 6
            end
            object cbTurnoRotativo: TCheckBox
              Left = 8
              Top = 64
              Width = 94
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Turno Rotativo'
              TabOrder = 3
            end
            object ToolBar1: TToolBar
              Left = 505
              Top = 79
              Width = 31
              Height = 24
              Align = alNone
              Anchors = [akTop, akRight]
              EdgeBorders = []
              HotImages = frmPrincipal.ilColor
              Images = frmPrincipal.ilByN
              TabOrder = 8
              object tbManPuesto: TToolButton
                Left = 0
                Top = 2
                Hint = 'Mantenimiento de Puesto'
                ImageIndex = 19
                OnClick = tbManPuestoClick
              end
            end
            inline fraPuesto: TfraCodigoDescripcion
              Left = 87
              Top = 82
              Width = 412
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
              DesignSize = (
                412
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 347
                CharCase = ecUpperCase
              end
              inherited edCodigo: TPatternEdit
                CharCase = ecNormal
              end
            end
            object cbAprobadoNo: TCheckBox
              Left = 160
              Top = 8
              Width = 45
              Height = 17
              Alignment = taLeftJustify
              BiDiMode = bdRightToLeftNoAlign
              Caption = 'NO'
              ParentBiDiMode = False
              TabOrder = 1
              OnClick = cbAprobadoNoClick
            end
          end
          object gbhechos: TGroupBox
            Left = 0
            Top = 408
            Width = 666
            Height = 66
            Align = alTop
            TabOrder = 5
            DesignSize = (
              666
              66)
            object lbObservaciones: TLabel
              Left = 8
              Top = 16
              Width = 40
              Height = 13
              Caption = 'Hechos:'
            end
            object edHechos: TMemo
              Left = 66
              Top = 13
              Width = 606
              Height = 41
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
          end
          object gbEstado: TGroupBox
            Left = 0
            Top = 0
            Width = 666
            Height = 91
            Align = alTop
            TabOrder = 0
            DesignSize = (
              666
              91)
            object lbEstado: TLabel
              Left = 9
              Top = 15
              Width = 33
              Height = 13
              Caption = 'Estado'
            end
            object lbObservacionesEstado: TLabel
              Left = 4
              Top = 40
              Width = 74
              Height = 13
              Caption = 'Observaciones:'
            end
            inline fraEstado: TfraCodigoDescripcion
              Left = 79
              Top = 11
              Width = 289
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              DesignSize = (
                289
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 224
                CharCase = ecUpperCase
              end
              inherited edCodigo: TPatternEdit
                Width = 59
                CharCase = ecNormal
              end
            end
            object edObservacionesEstado: TMemo
              Left = 80
              Top = 37
              Width = 574
              Height = 41
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
          end
        end
      end
      object tsPersonasEntrevistadas: TTabSheet
        Caption = 'Personas Entrevistadas'
        ImageIndex = 2
      end
      object TabSheet3: TTabSheet
        Caption = 'Agendado'
        ImageIndex = 3
        DesignSize = (
          682
          393)
        object Label15: TLabel
          Left = 155
          Top = 10
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object Label16: TLabel
          Left = 8
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Fecha:'
        end
        object Label17: TLabel
          Left = 9
          Top = 41
          Width = 46
          Height = 13
          Caption = 'Contacto:'
        end
        object edFechaAgendado: TDateComboBox
          Left = 53
          Top = 6
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edHoraAgendado: TDateTimePicker
          Left = 194
          Top = 7
          Width = 54
          Height = 21
          Date = 37372.833333333340000000
          Format = 'HH:mm'
          Time = 37372.833333333340000000
          DateMode = dmUpDown
          Kind = dtkTime
          TabOrder = 1
        end
        object edContacto: TEdit
          Left = 61
          Top = 36
          Width = 604
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 2
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 690
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        690
        35)
      object Label6: TLabel
        Left = 7
        Top = 9
        Width = 66
        Height = 13
        Caption = 'Procedencia: '
      end
      inline fraProcedencia: TfraCodigoDescripcion
        Left = 77
        Top = 5
        Width = 346
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          346
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 281
          CharCase = ecUpperCase
        end
        inherited edCodigo: TPatternEdit
          CharCase = ecNormal
        end
      end
    end
  end
  object fpRelevamiento: TFormPanel [4]
    Left = 708
    Top = 342
    Width = 275
    Height = 191
    Caption = 'Riesgo Esop'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      275
      191)
    object Bevel1: TBevel
      Left = 4
      Top = 155
      Width = 268
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbRelevamientos: TLabel
      Left = 8
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Relevamientos'
    end
    object btnCancelarCambioPreventor: TButton
      Left = 196
      Top = 161
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object lbRiesgo: TListBox
      Left = 8
      Top = 32
      Width = 258
      Height = 111
      ItemHeight = 13
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, ex_id, ex_recaida, ex_siniestro, ex_orden,'
      
        '       co_contrato, em_cuit, em_nombre, es_nroestableci, tj_cuil' +
        ', tj_nombre,'
      
        '       NVL(ex_fecharecaida, ex_fechaaccidente) fechaaccidente, (' +
        'SELECT ta_descripcion'
      
        '                                                                ' +
        '  FROM SIN.sta_tipoaccidente'
      
        '                                                                ' +
        ' WHERE sex.ex_tipo = ta_codigo) ta_descripcion, it_nombre,'
      
        '       ud_calle, ud_numero, ud_piso, ud_departamento, ud_cpostal' +
        ', ud_cpostala, ud_localidad, ud_provincia,'
      
        '       provaccid.pv_descripcion AS provinciaaccidente, ie_idesta' +
        'doergonomia, ie_observaciones, ee_descripcion,'
      
        '       art.utiles.armar_telefono(ud_codareatelefonos, NULL, ud_t' +
        'elefonos) AS telaccidente, dc_calle, dc_numero, dc_piso,'
      
        '       dc_departamento, dc_cpostal, dc_cpostala, dc_localidad, d' +
        'c_provincia, provdomic.pv_descripcion AS provinciaemp,'
      
        '       art.utiles.armar_telefono(dc_codareatelefonos, NULL, dc_t' +
        'elefonos) AS teldomicilio, ac_relacion, ac_descripcion,'
      
        '       ex_brevedescripcion, ex_observaciones, de_descripcion, de' +
        '_observaciones, sa_descripcion, sa_observaciones, ie_id,'
      
        '       ie_idempresa, ie_estableci, ie_idtrabajador, ie_idexpedie' +
        'nte, ie_idcabeceranomina, ie_procedencia, ie_idreconfirmacion,'
      
        '       ie_aprobado, ie_fechainvestigacion, ie_turnorotativo, NVL' +
        '(ie_horadesde, '#39'00:00'#39') ie_horadesde, ie_fechaagendada,'
      
        '       NVL(ie_horaagendada, '#39'00:00'#39') ie_horaagendada, ie_contact' +
        'o, NVL(ie_horahasta, '#39'00:00'#39') ie_horahasta, ie_horasextras,'
      
        '       ie_idpuesto, ie_hechos, ie_idpreventor, ie_usualta, ie_fe' +
        'chaalta, ie_fechabaja, ie_nroparteevolutivo,'
      '       NVL((SELECT co_contrato'
      '              FROM afi.aco_contrato'
      '             WHERE co_idempresa = ie_idempresa'
      
        '               AND co_contrato = art.afiliacion.get_contratovige' +
        'nte(ex_cuit, art.actualdate)),'
      '           co_contrato) AS contratoinvestigacion,'
      '       (SELECT pr_descripcion'
      '          FROM hys.hpr_procedencia'
      '         WHERE pr_codigo = ie_procedencia'
      
        '           AND pr_fechabaja IS NULL) procedencia, (SELECT pu_des' +
        'cripcion'
      
        '                                                     FROM hys.hp' +
        'u_puesto'
      
        '                                                    WHERE pu_id ' +
        '= ie_idpuesto'
      
        '                                                      AND pu_fec' +
        'habaja IS NULL) puesto,'
      '       DECODE(ie_aprobado, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'No'#39') aprobado'
      
        '  FROM art.cpv_provincias provdomic, art.cpv_provincias provacci' +
        'd, aco_contrato aco, afi.adc_domiciliocontrato, aem_empresa,'
      
        '       hys.hee_estadoergonomia, comunes.cac_actividad, comunes.c' +
        'tj_trabajador, art.sex_expedientes sex, afi.aes_establecimiento,'
      
        '       SIN.ssa_solicitudasistencia, SIN.sde_denuncia, SIN.sud_ub' +
        'icaciondenuncia, art.pit_firmantes, hys.hie_invergonomia'
      ' WHERE ie_idexpediente = ex_id'
      '   AND dc_contrato = co_contrato'
      '   AND es_id(+) = ie_estableci'
      '   AND ee_id(+) = ie_idestadoergonomia'
      '   AND dc_tipo = '#39'P'#39
      '   AND ex_cuit = em_cuit'
      '   AND aco.co_idempresa = em_id'
      
        '   AND aco.co_contrato = art.afiliacion.get_contratovigente(ex_c' +
        'uit, ex_fechaaccidente)'
      '   AND ex_cuil = tj_cuil'
      '   AND co_idactividad = ac_id'
      '   AND ie_idpreventor = it_id(+)'
      '   AND ex_id = sa_idexpediente(+)'
      '   AND ex_id = de_idexpediente(+)'
      '   AND ex_id = ud_idexpediente(+)'
      '   AND ud_provincia = provaccid.pv_codigo(+)'
      '   AND dc_provincia = provdomic.pv_codigo(+)'
      
        '   AND ex_diagnosticooms IN('#39'G56.0'#39', '#39'M65.4'#39', '#39'M65'#39', '#39'M75.1'#39', '#39'M' +
        '65.9'#39', '#39'M77.0'#39', '#39'M77.1'#39', '#39'M53.1'#39')'
      '   AND ie_procedencia = '#39'S'#39
      '   AND 1=2')
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
    Left = 108
    Top = 200
  end
end
