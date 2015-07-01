inherited frmConsultaJuiciosEnTramite: TfrmConsultaJuiciosEnTramite
  Left = 378
  Top = 223
  Width = 760
  Height = 533
  Caption = 'Busqueda...(Administraci'#243'n de Juicios)'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 720
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 235
    object pcFiltrosBusqueda: TPageControl
      Left = 0
      Top = 0
      Width = 752
      Height = 235
      ActivePage = tsJuzgados
      Align = alClient
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        object gbJuicio: TGroupBox
          Left = 0
          Top = 0
          Width = 744
          Height = 207
          Align = alClient
          Caption = 'Juicio'
          TabOrder = 0
          DesignSize = (
            744
            207)
          object lbNroJuicio: TLabel
            Left = 16
            Top = 16
            Width = 60
            Height = 13
            Caption = 'Nro Carpeta:'
          end
          object lblTipoJuicio: TLabel
            Left = 16
            Top = 48
            Width = 54
            Height = 13
            Caption = 'Tipo Juicio:'
          end
          object lblCaratula: TLabel
            Left = 16
            Top = 72
            Width = 42
            Height = 13
            Caption = 'Car'#225'tula:'
          end
          object lblEstado: TLabel
            Left = 16
            Top = 120
            Width = 36
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Estado:'
          end
          object lblTipoMediacion: TLabel
            Left = 416
            Top = 120
            Width = 76
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Tipo Mediaci'#243'n:'
          end
          object lblContra: TLabel
            Left = 407
            Top = 72
            Width = 12
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'C/'
          end
          object Label7: TLabel
            Left = 16
            Top = 148
            Width = 25
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            Caption = 'CUIT'
          end
          object edNroCarpeta: TIntEdit
            Left = 92
            Top = 12
            Width = 81
            Height = 21
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Alignment = taRightJustify
          end
          object edCARATULA: TEdit
            Left = 91
            Top = 92
            Width = 646
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 7
          end
          inline fraEstado: TfraCodigoDescripcion
            Left = 90
            Top = 116
            Width = 310
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            DesignSize = (
              310
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 245
            end
          end
          object chkJuicios: TCheckBox
            Left = 192
            Top = 8
            Width = 85
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Juicios'
            TabOrder = 1
            Visible = False
          end
          object chkMediaciones: TCheckBox
            Left = 300
            Top = 8
            Width = 120
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Mediaciones'
            TabOrder = 2
            Visible = False
          end
          inline fraTipoMediacion: TfraCodigoDescripcion
            Left = 496
            Top = 116
            Width = 242
            Height = 23
            Anchors = [akTop, akRight]
            TabOrder = 9
            DesignSize = (
              242
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 177
            end
          end
          object edDemandante: TEdit
            Left = 91
            Top = 68
            Width = 311
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 5
          end
          object edDemandado: TEdit
            Left = 432
            Top = 68
            Width = 306
            Height = 21
            Anchors = [akTop, akRight]
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 6
          end
          object chkBloqueado: TCheckBox
            Left = 440
            Top = 8
            Width = 85
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Bloqueado'
            TabOrder = 3
          end
          inline fraTipoJuicio: TfraCodigoDescripcion
            Left = 91
            Top = 44
            Width = 647
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            DesignSize = (
              647
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 53
              Width = 594
            end
            inherited edCodigo: TPatternEdit
              Width = 50
              MaxLength = 8
              Pattern = '0123456789'
            end
          end
          inline fraEmpresaFiltro: TfraEmpresa
            Left = 90
            Top = 144
            Width = 643
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
            TabOrder = 10
            inherited lbContrato: TLabel
              Left = 539
            end
            inherited edContrato: TIntEdit
              Left = 586
            end
            inherited cmbRSocial: TArtComboBox
              Width = 404
            end
          end
        end
      end
      object tsLetrados: TTabSheet
        Caption = 'Letrados'
        ImageIndex = 1
        object gbLetrados: TGroupBox
          Left = 0
          Top = 0
          Width = 744
          Height = 207
          Align = alClient
          Caption = ' Letrados '
          TabOrder = 0
          DesignSize = (
            744
            207)
          object lblAbogado: TLabel
            Left = 10
            Top = 16
            Width = 55
            Height = 13
            AutoSize = False
            Caption = 'Abogado:'
          end
          object lblAbogadoOponente: TLabel
            Left = 8
            Top = 42
            Width = 96
            Height = 13
            Caption = 'Abogado Oponente:'
          end
          inline fraAbogadosPropios: TfraAbogadosLegales
            Left = 113
            Top = 12
            Width = 621
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              621
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 46
              Top = 1
              Width = 576
            end
            inherited edCodigo: TPatternEdit
              Top = 1
              Width = 42
            end
          end
          inline fraAbogadosParteActora: TfraAbogadosLegales
            Left = 113
            Top = 36
            Width = 621
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DesignSize = (
              621
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 46
              Top = 1
              Width = 576
            end
            inherited edCodigo: TPatternEdit
              Top = 1
              Width = 42
            end
          end
        end
      end
      object tsJuzgados: TTabSheet
        Caption = 'Juzgados'
        ImageIndex = 2
        object gbJuzgado: TGroupBox
          Left = 0
          Top = 0
          Width = 744
          Height = 207
          Align = alClient
          Caption = 'Juzgado'
          TabOrder = 0
          object lbFuero: TLabel
            Left = 367
            Top = 16
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
            Top = 41
            Width = 63
            Height = 13
            Caption = 'Juzgado Nro:'
          end
          object lbSecretaria: TLabel
            Left = 365
            Top = 41
            Width = 53
            Height = 13
            Caption = 'Secretar'#237'a:'
          end
          object lblExpediente: TLabel
            Left = 9
            Top = 65
            Width = 39
            Height = 13
            Caption = 'N'#186' Exp.:'
          end
          object Label8: TLabel
            Left = 159
            Top = 66
            Width = 5
            Height = 13
            Caption = '/'
            Visible = False
          end
          object Label9: TLabel
            Left = 9
            Top = 89
            Width = 86
            Height = 13
            Caption = 'Expediente Export'
          end
          inline fraFuero: TfraCodigoDescripcion
            Left = 430
            Top = 12
            Width = 266
            Height = 23
            TabOrder = 1
            DesignSize = (
              266
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 201
            end
          end
          inline fraJurisdiccion: TfraCodigoDescripcion
            Left = 81
            Top = 12
            Width = 274
            Height = 23
            TabOrder = 0
            DesignSize = (
              274
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 209
            end
          end
          inline fraJuzgado: TfraCodigoDescripcion
            Left = 81
            Top = 36
            Width = 274
            Height = 23
            TabOrder = 2
            DesignSize = (
              274
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 209
            end
          end
          inline fraSecretaria: TfraCodigoDescripcion
            Left = 430
            Top = 36
            Width = 264
            Height = 23
            TabOrder = 3
            DesignSize = (
              264
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 199
            end
          end
          object edAnioExpediente: TPatternEdit
            Left = 170
            Top = 62
            Width = 30
            Height = 21
            MaxLength = 2
            TabOrder = 4
            Pattern = '0123456789'
          end
          object edNroExpediente: TPatternEdit
            Left = 81
            Top = 62
            Width = 75
            Height = 21
            MaxLength = 10
            TabOrder = 5
            Pattern = 
              'abcdefghijklmn'#241'opqrstuvwxyzABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789' +
              '-'
          end
          object edExpedienteExport: TPatternEdit
            Left = 103
            Top = 86
            Width = 269
            Height = 21
            MaxLength = 10
            TabOrder = 6
            Pattern = 
              'abcdefghijklmn'#241'opqrstuvwxyzABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789' +
              '-'
          end
        end
      end
      object tsFechas: TTabSheet
        Caption = 'Fechas'
        ImageIndex = 3
        object gbFechas: TGroupBox
          Left = 0
          Top = 0
          Width = 744
          Height = 89
          Align = alClient
          Caption = ' Fechas '
          TabOrder = 0
          object lblFechaInicioHasta: TLabel
            Left = 177
            Top = 17
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object lblFechaInicioDesde: TLabel
            Left = 10
            Top = 17
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'F. Notif. desde:'
          end
          object lblFechaCierreDesde: TLabel
            Left = 10
            Top = 40
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'F. Fin desde:'
          end
          object LblFechaCierrehasta: TLabel
            Left = 178
            Top = 40
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object lblFechaAsignacionDesde: TLabel
            Left = 10
            Top = 63
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'F.Asignaci'#243'n:'
          end
          object lblFechaAsignacionHasta: TLabel
            Left = 178
            Top = 63
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object CmbIniHta: TDateComboBox
            Left = 208
            Top = 13
            Width = 88
            Height = 21
            MinDateCombo = CmbIniDde
            TabOrder = 1
          end
          object CmbIniDde: TDateComboBox
            Left = 86
            Top = 13
            Width = 88
            Height = 21
            MaxDateCombo = CmbIniHta
            TabOrder = 0
          end
          object CmbCierrehta: TDateComboBox
            Left = 208
            Top = 36
            Width = 88
            Height = 21
            MinDateCombo = CmbCierredde
            TabOrder = 3
          end
          object CmbCierredde: TDateComboBox
            Left = 86
            Top = 36
            Width = 88
            Height = 21
            MaxDateCombo = CmbCierrehta
            TabOrder = 2
          end
          object edFechaAsignDesde: TDateComboBox
            Left = 86
            Top = 60
            Width = 88
            Height = 21
            MaxDateCombo = edFechaAsignHasta
            TabOrder = 4
          end
          object edFechaAsignHasta: TDateComboBox
            Left = 208
            Top = 60
            Width = 88
            Height = 21
            MinDateCombo = edFechaAsignDesde
            TabOrder = 5
          end
          object chkSinAbogadoDesignado: TCheckBox
            Left = 312
            Top = 62
            Width = 161
            Height = 17
            Caption = 'Sin Abogado Designado'
            TabOrder = 6
            OnClick = chkSinAbogadoDesignadoClick
          end
          object chkFechadeCierre: TCheckBox
            Left = 312
            Top = 38
            Width = 161
            Height = 17
            Caption = 'Sin Fecha de Cierre'
            TabOrder = 7
            OnClick = chkFechadeCierreClick
          end
        end
        object gbAgenda: TGroupBox
          Left = 0
          Top = 89
          Width = 744
          Height = 118
          Align = alBottom
          Caption = ' Agenda  '
          TabOrder = 1
          object lblCitasDesde: TLabel
            Left = 9
            Top = 17
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Citas desde:'
          end
          object lblCitasHasta: TLabel
            Left = 176
            Top = 17
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object lblVencimientos: TLabel
            Left = 358
            Top = 16
            Width = 75
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vencimientos:'
          end
          object lblVencimientosHasta: TLabel
            Left = 528
            Top = 16
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object dcbFechaCitaDesde: TDateComboBox
            Left = 85
            Top = 13
            Width = 88
            Height = 21
            MaxDateCombo = dcbFechaCitaHasta
            TabOrder = 0
          end
          object dcbFechaCitaHasta: TDateComboBox
            Left = 207
            Top = 13
            Width = 88
            Height = 21
            MinDateCombo = dcbFechaCitaDesde
            TabOrder = 1
          end
          object edFechaVencimientoDesde: TDateComboBox
            Left = 437
            Top = 12
            Width = 88
            Height = 21
            MaxDateCombo = edFechaVencimientoHasta
            TabOrder = 2
          end
          object edFechaVencimientoHasta: TDateComboBox
            Left = 559
            Top = 12
            Width = 88
            Height = 21
            MinDateCombo = edFechaVencimientoDesde
            TabOrder = 3
          end
        end
      end
      object tsImportes: TTabSheet
        Caption = 'Importes'
        ImageIndex = 4
        object gbImporte: TGroupBox
          Left = 0
          Top = 0
          Width = 744
          Height = 207
          Align = alClient
          Caption = ' Importe '
          TabOrder = 0
          object lblImporteSentencia: TLabel
            Left = 8
            Top = 19
            Width = 74
            Height = 13
            AutoSize = False
            Caption = 'Imp.Sentencia'
          end
          object lblImporteSentenciaHasta: TLabel
            Left = 189
            Top = 21
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object lblImporteDemandado: TLabel
            Left = 8
            Top = 42
            Width = 81
            Height = 13
            AutoSize = False
            Caption = 'Imp.Demandado'
          end
          object lblImporteDemandadoHasta: TLabel
            Left = 189
            Top = 44
            Width = 26
            Height = 13
            Caption = 'hasta'
          end
          object edImpReclaDesde: TCurrencyEdit
            Left = 98
            Top = 15
            Width = 87
            Height = 21
            AutoSize = False
            TabOrder = 0
          end
          object edImpReclaHasta: TCurrencyEdit
            Left = 220
            Top = 15
            Width = 87
            Height = 21
            AutoSize = False
            TabOrder = 1
          end
          object edImpDemaDesde: TCurrencyEdit
            Left = 98
            Top = 38
            Width = 87
            Height = 21
            AutoSize = False
            TabOrder = 2
          end
          object edImpDemaHasta: TCurrencyEdit
            Left = 220
            Top = 38
            Width = 87
            Height = 21
            AutoSize = False
            TabOrder = 3
          end
          object chkSinImporteSentencia: TCheckBox
            Left = 320
            Top = 16
            Width = 201
            Height = 17
            Caption = 'Sin Importe de Sentencia'
            TabOrder = 4
          end
          object chkSinImporteDemanda: TCheckBox
            Left = 320
            Top = 40
            Width = 201
            Height = 17
            Caption = 'Sin Importe de Demanda'
            TabOrder = 5
          end
        end
      end
      object tsOrigenDemanda: TTabSheet
        Caption = 'Origen de la Demanda'
        ImageIndex = 5
        object gbOrigenDemanda: TGroupBox
          Left = 4
          Top = 0
          Width = 605
          Height = 91
          Caption = 'Reclamos '
          TabOrder = 0
          DesignSize = (
            605
            91)
          object lblReclamante: TLabel
            Left = 7
            Top = 22
            Width = 60
            Height = 13
            Caption = 'Reclamante:'
          end
          object lblReclamo: TLabel
            Left = 7
            Top = 43
            Width = 45
            Height = 13
            Caption = 'Reclamo:'
          end
          object lbSiniestro: TLabel
            Left = 9
            Top = 68
            Width = 63
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Nro. Siniestro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          inline fraReclamante: TfraCodigoDescripcion
            Left = 95
            Top = 16
            Width = 503
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              503
              24)
            inherited cmbDescripcion: TArtComboBox
              Width = 438
            end
          end
          inline fraReclamo: TfraCodigoDescripcion
            Left = 94
            Top = 39
            Width = 503
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DesignSize = (
              503
              25)
            inherited cmbDescripcion: TArtComboBox
              Width = 438
            end
            inherited edCodigo: TPatternEdit
              Left = 2
            end
          end
          object edSiniestro: TIntEdit
            Left = 96
            Top = 64
            Width = 98
            Height = 21
            Hint = 'N'#250'mero de Siniestro'
            Anchors = [akTop, akRight]
            TabOrder = 2
            MaxLength = 8
          end
        end
      end
      object tbEvento: TTabSheet
        Caption = 'Eventos'
        ImageIndex = 6
        DesignSize = (
          744
          207)
        object lblEvento: TLabel
          Left = 4
          Top = 15
          Width = 42
          Height = 13
          Caption = 'Eventos:'
        end
        object Label1: TLabel
          Left = 4
          Top = 40
          Width = 37
          Height = 13
          AutoSize = False
          Caption = 'Fecha'
        end
        object Label2: TLabel
          Left = 149
          Top = 39
          Width = 26
          Height = 13
          Caption = 'hasta'
        end
        object Label3: TLabel
          Left = 4
          Top = 63
          Width = 47
          Height = 13
          AutoSize = False
          Caption = 'F. Venc:'
        end
        object Label4: TLabel
          Left = 149
          Top = 63
          Width = 26
          Height = 13
          Caption = 'hasta'
        end
        object Label5: TLabel
          Left = 4
          Top = 86
          Width = 47
          Height = 13
          AutoSize = False
          Caption = 'F. Carga:'
        end
        object Label6: TLabel
          Left = 149
          Top = 86
          Width = 26
          Height = 13
          Caption = 'hasta'
        end
        inline fraTipoEvento: TfraCodigoDescripcion
          Left = 57
          Top = 10
          Width = 672
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            672
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 607
          end
          inherited edCodigo: TPatternEdit
            Pattern = '0123456789'
          end
        end
        object edFechaEventodde: TDateComboBox
          Left = 58
          Top = 35
          Width = 88
          Height = 21
          MaxDateCombo = edFechaEventohta
          TabOrder = 1
        end
        object edFechaEventohta: TDateComboBox
          Left = 180
          Top = 35
          Width = 88
          Height = 21
          MinDateCombo = edFechaEventodde
          TabOrder = 2
        end
        object edFechaVencEventodde: TDateComboBox
          Left = 58
          Top = 59
          Width = 88
          Height = 21
          MaxDateCombo = edFechaVencEventohta
          TabOrder = 3
        end
        object edFechaVencEventohta: TDateComboBox
          Left = 180
          Top = 59
          Width = 88
          Height = 21
          MinDateCombo = edFechaVencEventodde
          TabOrder = 4
        end
        object edFechaCargaEventodde: TDateComboBox
          Left = 58
          Top = 83
          Width = 88
          Height = 21
          MaxDateCombo = edFechaCargaEventohta
          TabOrder = 5
        end
        object edFechaCargaEventohta: TDateComboBox
          Left = 180
          Top = 83
          Width = 88
          Height = 21
          MinDateCombo = edFechaCargaEventodde
          TabOrder = 6
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 235
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    inherited ToolBar: TToolBar
      Width = 735
      Align = alClient
      HotImages = frmPrincipal.ilByN
      Images = frmPrincipal.ilColor
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbNuevaMediacion: TToolButton
        Left = 370
        Top = 0
        Caption = 'Nueva Mediaci'#243'n'
        ImageIndex = 22
      end
      object tbSumatoria: TToolButton
        Left = 393
        Top = 0
        Caption = 'tbSumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbSeleccionar: TToolButton
        Left = 416
        Top = 0
        Hint = 'Seleccionar Juicio'
        ImageIndex = 23
        OnClick = tbSeleccionarClick
      end
      object tbSeparador: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 264
    Width = 752
    Height = 242
    TabStop = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'JT_NUMEROCARPETA'
        Title.Caption = 'Nro.Carpeta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jt_demandante'
        Title.Caption = 'Demandante'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jt_demandado'
        Title.Caption = 'Demandado'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JU_DESCRIPCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_DESCRIPCION'
        Title.Caption = 'Fuero'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DESCRIPCION'
        Title.Caption = 'Juzgado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_DESCRIPCION'
        Title.Caption = 'Instancia'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Secretar'#237'a'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_DESCRIPCION'
        Title.Caption = 'Observaciones'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_IMPORTEDEMANDADO'
        Title.Caption = 'Importe Demandado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_IMPORTESENTENCIA'
        Title.Caption = 'Importe Sentencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_FECHAASIGN'
        Title.Caption = 'Fecha Asig.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_EXPEDIENTE'
        Title.Caption = 'Expediente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_RESULTADO'
        Title.Caption = 'Resultado Probable'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jt_fechanotificacionjuicio'
        Title.Caption = 'F.Notificaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_FECHAFINJUICIO'
        Title.Caption = 'F.Fin'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JT_REGISTRACION'
        Title.Caption = 'Registracion'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Abogado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDIACIONJUICIO'
        Title.Caption = 'Mediaci'#243'n/Juicio'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jt_importereserva'
        Title.Caption = 'Reserva Capital'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jt_importereservahonorarios'
        Title.Caption = 'Reserva Honorarios'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Evento'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FechaEvento'
        Title.Caption = 'Fecha Evento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FechaVencEvento'
        Title.Caption = 'Fecha Venc. Evento'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FechaCargaEvento'
        Title.Caption = 'Fecha Carga Evento'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jt_fecharecepsentencia'
        Title.Caption = 'Recep.Sentencia'
        Width = 99
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    Left = 36
    Top = 404
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 404
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro.Carpeta'
        DataField = 'JT_NUMEROCARPETA'
        FieldIndex = 0
      end
      item
        Title = 'Nro.Juicio'
        DataField = 'JT_ID'
        FieldIndex = 1
      end
      item
        Title = 'Demandante'
        DataField = 'jt_demandante'
        FieldIndex = 2
      end
      item
        Title = 'Demandado'
        DataField = 'jt_demandado'
        FieldIndex = 3
      end
      item
        Title = 'Car'#225'tula'
        DataField = 'JT_CARATULA'
        FieldIndex = 4
      end
      item
        Title = 'Jurisdicci'#243'n'
        DataField = 'JU_DESCRIPCION'
        FieldIndex = 5
      end
      item
        Title = 'Fuero'
        DataField = 'FU_DESCRIPCION'
        FieldIndex = 6
      end
      item
        Title = 'Juzgado'
        DataField = 'JZ_DESCRIPCION'
        FieldIndex = 7
      end
      item
        Title = 'Instancia'
        DataField = 'IN_DESCRIPCION'
        FieldIndex = 8
      end
      item
        Title = 'Secretar'#237'a'
        DataField = 'SC_DESCRIPCION'
        FieldIndex = 9
      end
      item
        Title = 'Estado'
        DataField = 'EJ_DESCRIPCION'
        FieldIndex = 10
      end
      item
        Title = 'Observaciones'
        DataField = 'JT_DESCRIPCION'
        FieldIndex = 11
      end
      item
        Title = 'Importe Demandado'
        DataField = 'JT_IMPORTEDEMANDADO'
        FieldIndex = 14
      end
      item
        Title = 'Importe Sentencia'
        DataField = 'JT_IMPORTESENTENCIA'
        FieldIndex = 15
      end
      item
        Title = 'Fecha Asig.'
        DataField = 'JT_FECHAASIGN'
        FieldIndex = 16
      end
      item
        Title = 'Expediente'
        DataField = 'JT_EXPEDIENTE'
        FieldIndex = 17
      end
      item
        Title = 'Resultado Probable'
        DataField = 'JT_RESULTADO'
        FieldIndex = 18
      end
      item
        Title = 'F.Notificaci'#243'n'
        DataField = 'jt_fechanotificacionjuicio'
        FieldIndex = 19
      end
      item
        Title = 'F.Fin'
        DataField = 'JT_FECHAFINJUICIO'
        FieldIndex = 20
      end
      item
        Title = 'Registracion'
        DataField = 'JT_REGISTRACION'
        FieldIndex = 21
      end
      item
        Title = 'Abogado'
        DataField = 'BO_NOMBRE'
        FieldIndex = 22
      end
      item
        Title = 'Mediaci'#243'n/Juicio'
        DataField = 'MEDIACIONJUICIO'
        FieldIndex = 23
      end>
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
    OnGetSubTotals = QueryPrintGetSubTotals
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
    DBGrid = nil
    RetriveFrom = rfQueryPrint
    Left = 92
    Top = 404
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id ')
    Left = 84
    Top = 268
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
  object sdqConsultaRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id')
    Left = 172
    Top = 268
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
end
