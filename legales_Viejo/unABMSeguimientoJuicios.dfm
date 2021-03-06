object frmAdminstracionJuicio: TfrmAdminstracionJuicio
  Left = 575
  Top = 102
  Caption = 'Seguimiento de Juicios en Tr'#225'mite'
  ClientHeight = 570
  ClientWidth = 790
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 798
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnCabecera: TPanel
    Left = 0
    Top = 27
    Width = 790
    Height = 360
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      790
      360)
    object lblDetalle: TLabel
      Left = 7
      Top = 325
      Width = 36
      Height = 13
      Caption = 'Detalle:'
    end
    inline fraDatosJuzgado: TfraJuzgados
      Left = 2
      Top = 232
      Width = 789
      Height = 91
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 2
      ExplicitTop = 232
      ExplicitWidth = 789
      ExplicitHeight = 91
      inherited gbJuzgados: TGroupBox
        Left = 0
        Top = 0
        Width = 789
        Height = 91
        Align = alClient
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 789
        ExplicitHeight = 91
        DesignSize = (
          789
          91)
        inherited lblFuero: TLabel
          Width = 30
          ExplicitWidth = 30
        end
        inherited lblJuzgado: TLabel
          Width = 63
          ExplicitWidth = 63
        end
        inherited lblInstancia: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lblExpediente: TLabel
          Width = 39
          ExplicitWidth = 39
        end
        inherited lblFechaIngreso: TLabel
          Width = 47
          ExplicitWidth = 47
        end
        inherited Label1: TLabel
          Width = 5
          ExplicitWidth = 5
        end
        inherited fraFuero: TfraCodigoDescripcionExt
          Width = 429
          ExplicitWidth = 429
          DesignSize = (
            429
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 364
            ExplicitWidth = 364
          end
        end
        inherited fraSecretaria: TfraCodigoDescripcionExt
          Width = 428
          ExplicitWidth = 428
          DesignSize = (
            428
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 363
            ExplicitWidth = 363
          end
        end
        inherited btnMasDatosJuzgado: TBitBtn
          OnClick = fraDatosJuzgadobtnMasDatosJuzgadoClick
        end
        inherited fpMasDatosJuzgado: TFormPanel
          inherited pgMasDatosJuzgado: TPageControl
            inherited tsSede: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 445
              ExplicitHeight = 111
              inherited lblDomicilioJuzgado: TLabel
                Width = 45
                ExplicitWidth = 45
              end
              inherited lblTelefonoJuzgado: TLabel
                Width = 50
                ExplicitWidth = 50
              end
              inherited lblFaxJuzgado: TLabel
                Width = 20
                ExplicitWidth = 20
              end
              inherited lblLocJuzgado: TLabel
                Width = 49
                ExplicitWidth = 49
              end
            end
          end
        end
        inherited btnInstanciasAnteriores: TBitBtn
          OnClick = fraDatosJuzgadobtnInstanciasAnterioresClick
        end
        inherited dteFechaIngreso: TDateComboBox
          MinDateCombo = edFECHANOTIFICACION
          ErrorMessage = 
            'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
            'o'
          DialogTitle = 'Seleccione una fecha.'
          Weekends = [Sun, Sat]
        end
      end
      inherited sdqJuzgado: TSDQuery
        DataSource = fraDatosJuzgado.fraJuzgado.dsDatos
      end
    end
    object edtDescripcion: TMemo
      Left = 45
      Top = 325
      Width = 976
      Height = 31
      MaxLength = 2048
      TabOrder = 3
    end
    object gbJuicio: TGroupBox
      Left = 3
      Top = 0
      Width = 362
      Height = 232
      Caption = 'Juicio'
      TabOrder = 0
      DesignSize = (
        362
        232)
      object lblTipoJuicio: TLabel
        Left = 11
        Top = 40
        Width = 54
        Height = 13
        Caption = 'Tipo Juicio:'
      end
      object lbConcurso: TLabel
        Left = 186
        Top = 16
        Width = 68
        Height = 13
        Caption = 'F.Notificaci'#243'n:'
      end
      object lbAbogado: TLabel
        Left = 14
        Top = 106
        Width = 46
        Height = 26
        Caption = 'Estudio/'#13#10'Abogado:'
      end
      object lblCaratula: TLabel
        Left = 11
        Top = 63
        Width = 45
        Height = 13
        Caption = 'Car'#225'tula: '
      end
      object lblFechaAsignacion: TLabel
        Left = 11
        Top = 137
        Width = 53
        Height = 13
        Caption = 'F. Asignac.'
      end
      object lblCarpeta: TLabel
        Left = 11
        Top = 15
        Width = 40
        Height = 13
        Caption = 'Carpeta:'
      end
      object lblContra: TLabel
        Left = 203
        Top = 63
        Width = 12
        Height = 13
        Caption = 'C/'
      end
      inline fraTipoJuicio: TfraCodigoDescripcion
        Left = 91
        Top = 35
        Width = 257
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 91
        ExplicitTop = 35
        ExplicitWidth = 257
        DesignSize = (
          257
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 53
          Width = 204
          DataSource = nil
          ExplicitLeft = 53
          ExplicitWidth = 204
        end
        inherited edCodigo: TPatternEdit
          Width = 50
          MaxLength = 8
          Pattern = '0123456789'
          ExplicitWidth = 50
        end
      end
      object edFECHANOTIFICACION: TDateComboBox
        Left = 260
        Top = 12
        Width = 88
        Height = 21
        MaxDateCombo = fraDatosJuzgado.dteFechaIngreso
        Weekends = [Sun, Sat]
        TabOrder = 0
      end
      inline fraAbogadosPropios: TfraAbogadosLegales
        Left = 90
        Top = 108
        Width = 206
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 90
        ExplicitTop = 108
        ExplicitWidth = 206
        DesignSize = (
          206
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 56
          Width = 151
          DataSource = nil
          ExplicitLeft = 56
          ExplicitWidth = 151
        end
        inherited edCodigo: TPatternEdit
          Width = 50
          Pattern = '0123456789'
          ExplicitWidth = 50
        end
        inherited dsDatos: TDataSource
          Left = 15
        end
      end
      object edCARATULA: TEdit
        Left = 91
        Top = 84
        Width = 257
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Color = clWhite
        MaxLength = 1024
        TabOrder = 4
      end
      object tbEdicionAbogado: TToolBar
        Left = 298
        Top = 105
        Width = 31
        Height = 27
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar'
        HotImages = dmLegales.ilByN
        Images = dmLegales.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        object tbNuevoAbogado: TToolButton
          Left = 0
          Top = 0
          Hint = 'Modificar'
          ImageIndex = 14
          OnClick = tbNuevoAbogadoClick
        end
      end
      object edFECHAASIGNADO: TDateComboBox
        Left = 91
        Top = 133
        Width = 88
        Height = 21
        ErrorMessage = 
          'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
          'o'
        DialogTitle = 'Seleccione una fecha'
        Weekends = [Sun, Sat]
        TabOrder = 7
      end
      object edNroCarpeta: TIntEdit
        Left = 92
        Top = 12
        Width = 78
        Height = 21
        Color = 16776176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Alignment = taRightJustify
        MaxLength = 8
      end
      object edDemandante: TEdit
        Left = 91
        Top = 60
        Width = 108
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Color = clWhite
        MaxLength = 200
        TabOrder = 2
      end
      object edDemandado: TEdit
        Left = 221
        Top = 60
        Width = 127
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Color = clWhite
        MaxLength = 200
        TabOrder = 3
      end
    end
    object gbDetalleJuicio: TGroupBox
      Left = 368
      Top = 0
      Width = 421
      Height = 232
      Anchors = [akRight]
      Caption = '  Observaci'#243'n '
      TabOrder = 1
      DesignSize = (
        421
        232)
      object lblMotivoJuicio: TLabel
        Left = 26
        Top = 188
        Width = 35
        Height = 13
        Caption = 'Motivo:'
        Visible = False
      end
      object lblEstadoJuicio: TLabel
        Left = 18
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Estado:'
      end
      object Label1: TLabel
        Left = 18
        Top = 93
        Width = 50
        Height = 13
        Caption = 'Fecha Fin:'
      end
      inline fraEstado: TfraCodigoDescripcion
        Left = 84
        Top = 12
        Width = 254
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 84
        ExplicitTop = 12
        ExplicitWidth = 254
        DesignSize = (
          254
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 172
          DataSource = nil
          ExplicitWidth = 172
        end
        inherited edCodigo: TPatternEdit
          Pattern = '0123456789'
        end
      end
      object tbEdicionMotivo: TToolBar
        Left = 339
        Top = 183
        Width = 56
        Height = 26
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        Caption = 'EdicionMotivos'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        object tbNuevoMotivo: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nuevo'
          ImageIndex = 6
        end
        object tbDetalleMotivo: TToolButton
          Left = 23
          Top = 0
          Hint = 'Modificar'
          ImageIndex = 14
        end
      end
      object tbExplorarHistoricoEstado: TToolBar
        Left = 321
        Top = 10
        Width = 37
        Height = 25
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar de Hist'#243'rico de Estado'
        HotImages = dmLegales.ilByN
        Images = dmLegales.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object tbHistoricoEstados: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nuevo'
          ImageIndex = 14
          OnClick = tbHistoricoEstadosClick
        end
      end
      object psSentenciaMediacion: TPageControl
        Left = 2
        Top = 111
        Width = 418
        Height = 117
        ActivePage = Sentencia
        Anchors = [akLeft, akTop, akRight, akBottom]
        Style = tsFlatButtons
        TabOrder = 3
        object Sentencia: TTabSheet
          Caption = 'Sentencia'
          TabVisible = False
          DesignSize = (
            410
            107)
          object lblSentencia: TLabel
            Left = 16
            Top = 10
            Width = 48
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Sentencia'
          end
          object lblDescripcionSentencia: TLabel
            Left = 16
            Top = 32
            Width = 36
            Height = 13
            Caption = 'Detalle:'
          end
          object lbFechaFinJuicio: TLabel
            Left = 275
            Top = 9
            Width = 34
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'F.Sent:'
          end
          object Panel1: TPanel
            Left = 9
            Top = 70
            Width = 486
            Height = 26
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              486
              26)
            object lblDictamen: TLabel
              Left = 8
              Top = 6
              Width = 48
              Height = 13
              Caption = 'Dictamen:'
            end
            object tbInspeccionarDictamenAcustorio: TToolBar
              Left = 367
              Top = 1
              Width = 29
              Height = 27
              Align = alNone
              Anchors = [akTop, akRight]
              BorderWidth = 1
              ButtonWidth = 25
              Caption = 'Tb Inspeccionar Dictamenes Acusatorios'
              HotImages = dmLegales.ilByN
              Images = dmLegales.ilColor
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Visible = False
              object tbExplorarDictamenAcusatorio: TToolButton
                Left = 0
                Top = 0
                Hint = 'Nuevo'
                ImageIndex = 14
              end
            end
            object mDictamen: TMemo
              Left = 75
              Top = 3
              Width = 291
              Height = 23
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = 16776176
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          inline fraTipoResultadoJuicio: TfraCodigoDescripcion
            Left = 83
            Top = 5
            Width = 187
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            TabOrder = 0
            ExplicitLeft = 83
            ExplicitTop = 5
            ExplicitWidth = 187
            DesignSize = (
              187
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 32
              Width = 154
              Color = 16776176
              DataSource = nil
              ExplicitLeft = 32
              ExplicitWidth = 154
            end
            inherited edCodigo: TPatternEdit
              Width = 28
              Color = 16776176
              ExplicitWidth = 28
            end
          end
          object edFECHASENTENCIA: TDateComboBox
            Left = 313
            Top = 5
            Width = 97
            Height = 21
            TabStop = False
            Color = 16776176
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Anchors = [akTop, akRight]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object mSentencia: TRxRichEdit
            Left = 84
            Top = 31
            Width = 326
            Height = 40
            DrawEndPage = False
            Anchors = [akLeft, akTop, akRight]
            Color = 16776176
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
            WantTabs = True
          end
        end
        object Mediacion: TTabSheet
          Caption = 'Mediacion'
          TabVisible = False
          object lblFin: TLabel
            Left = 197
            Top = 67
            Width = 29
            Height = 13
            Caption = 'F. Fin:'
          end
          object pnSentencia: TPanel
            Left = 0
            Top = 0
            Width = 410
            Height = 107
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblMediador: TLabel
              Left = 16
              Top = 51
              Width = 47
              Height = 13
              Caption = 'Mediador:'
            end
            object lblTipoMediacion: TLabel
              Left = 16
              Top = 5
              Width = 62
              Height = 13
              Caption = 'T.Mediaci'#243'n:'
            end
            object lblNroExpedienteMediacion: TLabel
              Left = 16
              Top = 74
              Width = 39
              Height = 13
              Caption = 'N'#186' Exp.:'
            end
            object lblOrganismosMediacion: TLabel
              Left = 16
              Top = 27
              Width = 53
              Height = 13
              Caption = 'Organismo:'
            end
            inline fraMediador: TfraAbogadosLegales
              Left = 82
              Top = 47
              Width = 266
              Height = 23
              TabOrder = 2
              ExplicitLeft = 82
              ExplicitTop = 47
              ExplicitWidth = 266
              DesignSize = (
                266
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 53
                Width = 212
                DataSource = nil
                ExplicitLeft = 53
                ExplicitWidth = 212
              end
              inherited edCodigo: TPatternEdit
                Width = 50
                Pattern = '0123456789'
                ExplicitWidth = 50
              end
            end
            inline fraTipoMediacion: TfraCodigoDescripcion
              Left = 82
              Top = 0
              Width = 277
              Height = 23
              TabOrder = 0
              ExplicitLeft = 82
              ExplicitWidth = 277
              DesignSize = (
                277
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 53
                Width = 212
                DataSource = nil
                ExplicitLeft = 53
                ExplicitWidth = 212
              end
              inherited edCodigo: TPatternEdit
                Width = 50
                MaxLength = 8
                Pattern = '0123456789'
                ExplicitWidth = 50
              end
            end
            object edNroExpedienteMediacion: TPatternEdit
              Left = 83
              Top = 71
              Width = 75
              Height = 21
              MaxLength = 20
              TabOrder = 3
            end
            inline fraOrganismoMediacion: TfraCodigoDescripcionExt
              Left = 83
              Top = 23
              Width = 269
              Height = 23
              TabOrder = 1
              ExplicitLeft = 83
              ExplicitTop = 23
              ExplicitWidth = 269
              DesignSize = (
                269
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 52
                Width = 212
                DataSource = nil
                ExplicitLeft = 52
                ExplicitWidth = 212
              end
              inherited edCodigo: TPatternEdit
                Width = 49
                MaxLength = 8
                Pattern = '0123456789'
                ExplicitWidth = 49
              end
            end
          end
        end
      end
      object edFECHAFINJUICIO: TDateComboBox
        Left = 85
        Top = 89
        Width = 88
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object tbGestionDeuda: TToolBar
    Left = 0
    Top = 0
    Width = 790
    Height = 27
    Caption = 'tbGestionDeuda'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = dmLegales.ilByN
    Images = dmLegales.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbSeparador0: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tbSeparador0'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbGuardar: TToolButton
      Left = 8
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tbGuardar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = tbGuardarClick
    end
    object tbSeparador: TToolButton
      Left = 31
      Top = 0
      Width = 13
      Caption = 'tbSeparador'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object tbReasignarAbogado: TToolButton
      Left = 44
      Top = 0
      Hint = 'Reasignar Abogado'
      Caption = 'Expediente'
      ImageIndex = 22
      ParentShowHint = False
      ShowHint = True
      OnClick = tbReasignarAbogadoClick
    end
    object tbVerPagosPendientes: TToolButton
      Left = 67
      Top = 0
      Hint = 'Ver Pagos Pendientes'
      Caption = 'tbVerPagosPendientes'
      ImageIndex = 18
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbFijarSentencia: TToolButton
      Left = 90
      Top = 0
      Hint = 'Fijar Importes Regulados de '#13#10'la Sentencia  Definitiva'
      Caption = 'Fijar Sentencia Definitiva'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = tbFijarSentenciaClick
    end
    object tbBloquearPagosSiniestros: TToolButton
      Left = 113
      Top = 0
      Hint = 'Bloquear pago Siniestros'
      Caption = 'Bloquear pagos siniestros'
      ImageIndex = 32
      OnClick = tbBloquearPagosSiniestrosClick
    end
    object tbEditarFormulas: TToolButton
      Left = 136
      Top = 0
      Hint = 'Editar F'#243'rmulas'
      Caption = 'tbEditarFormulas'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbBloquear: TToolButton
      Left = 159
      Top = 0
      Hint = 'Bloquear Juicio'
      Caption = 'tbBloquear'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = tbBloquearClick
    end
    object tbVerImagenes: TToolButton
      Left = 182
      Top = 0
      Hint = 'Ver Im'#225'genes Digitalizadas'
      ImageIndex = 31
      OnClick = tbVerImagenesClick
    end
    object tbSeparador2: TToolButton
      Left = 205
      Top = 0
      Width = 11
      Caption = 'tbSeparador2'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object tbElevacionAJuicio: TToolButton
      Left = 216
      Top = 0
      Hint = 'Elevaci'#243'n a Juicio'
      Caption = 'Elevaci'#243'n a Juicio'
      ImageIndex = 30
      ParentShowHint = False
      ShowHint = True
      OnClick = tbElevacionAJuicioClick
    end
    object tbseparator3: TToolButton
      Left = 239
      Top = 0
      Width = 8
      Caption = 'tbseparator3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbImprimir: TToolButton
      Left = 247
      Top = 0
      Hint = 'Impresi'#243'n (Ctrl+I)'
      Caption = 'tbImprimir'
      DropdownMenu = fraPuntosRevisionJuicioEnTramite.pmPuntosRevision
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      Visible = False
    end
    object tbSeparador3: TToolButton
      Left = 285
      Top = 0
      Width = 8
      Caption = 'tbSeparador3'
      ImageIndex = 6
      Style = tbsSeparator
      Visible = False
    end
    object tbSalir: TToolButton
      Left = 293
      Top = 0
      Hint = 'Salir'
      Caption = 'tbSalir'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSalirClick
    end
    object lblAviso: TLabel
      Left = 316
      Top = 0
      Width = 310
      Height = 22
      Caption = '     Guardar para habilitar las solapas y los botones.    '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
  end
  object pnDetalle: TPanel
    Left = 0
    Top = 387
    Width = 790
    Height = 183
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pgDetallesJuicio: TPageControl
      Left = 0
      Top = 0
      Width = 790
      Height = 183
      ActivePage = tsPuntosRevision
      Align = alClient
      TabOrder = 0
      OnChange = pgDetallesJuicioChange
      object tbOrigenSiniestro: TTabSheet
        Caption = 'Origen Demanda'
        ImageIndex = 3
        object cbOrigenDemanda: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = tbOrigenDemanda
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object tbOrigenDemanda: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = frmPrincipal.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoOrigenDemanda: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevoOrigenDemandaClick
            end
            object tbEdicionOrigenDemanda: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbEdicionOrigenDemandaClick
            end
            object tbBajaOrigenDemanda: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbBajaOrigenDemandaClick
            end
            object tbOrigenDemandaSeparador1: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbImprimirOrigenDemanda: TToolButton
              Left = 77
              Top = 0
              Hint = 'Imprimir Origen Demanda'
              ImageIndex = 4
            end
          end
        end
        object dbgOrigenDemanda: TRxDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 126
          Align = alClient
          DataSource = dsOrigenDemanda
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgOrigenDemandaDblClick
          RowColor2 = 16776176
          OnGetCellParams = dbgOrigenDemandaGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'RE_DESCRIPCION'
              Title.Caption = 'Origen'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LEGALES.GET_DESCRIPCIONORIGENDEMANDA(OD_ID)'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BO_NOMBRE'
              Title.Caption = 'Abogado'
              Visible = True
            end>
        end
      end
      object tsReclamos: TTabSheet
        Caption = 'Reclamos'
        ImageIndex = 7
        object fpReclamo: TFormPanel
          Left = 136
          Top = 106
          Width = 509
          Height = 105
          Caption = 'Reclamo'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          DesignSize = (
            509
            105)
          object lblReclamo: TLabel
            Left = 9
            Top = 15
            Width = 45
            Height = 13
            Caption = 'Reclamo:'
          end
          object bvSeparadorBotonesReclamos: TBevel
            Left = 9
            Top = 67
            Width = 496
            Height = 5
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object lblImporteDemandado: TLabel
            Left = 9
            Top = 43
            Width = 99
            Height = 13
            Caption = 'Importe Demandado:'
          end
          object lblPorcentajeIncapacidadDemanda: TLabel
            Left = 211
            Top = 39
            Width = 165
            Height = 13
            Caption = 'Porcentaje Incapacidad Demanda:'
          end
          object lblPorcentaje: TLabel
            Left = 433
            Top = 39
            Width = 8
            Height = 13
            Caption = '%'
          end
          object tbReclamo: TToolBar
            Left = 451
            Top = 9
            Width = 54
            Height = 26
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbEditarReclamos: TToolButton
              Left = 0
              Top = 0
              Hint = 'Editar'
              ImageIndex = 6
            end
            object tbExplorarReclamos: TToolButton
              Left = 23
              Top = 0
              Hint = 'Explorar'
              ImageIndex = 14
            end
          end
          object btnAceptarReclamo: TButton
            Left = 333
            Top = 75
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 2
          end
          object btnCancelarReclamo: TButton
            Left = 418
            Top = 75
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 3
          end
          object edtImporteDemandadoReclamo: TCurrencyEdit
            Left = 113
            Top = 39
            Width = 64
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '$,0.00;-$,0.00'
            TabOrder = 1
          end
          object edPorcentajeIncapacidadDemanda: TCurrencyEdit
            Left = 382
            Top = 36
            Width = 46
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxValue = 100.000000000000000000
            TabOrder = 4
          end
        end
        inline fraReclamoSentenciaReclamo: TfraReclamoSentencia
          Left = 0
          Top = 0
          Width = 782
          Height = 155
          Align = alClient
          TabOrder = 1
          ExplicitWidth = 782
          ExplicitHeight = 155
          inherited dbReclamos: TArtDBGrid
            Width = 782
            Height = 126
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TitleFont.Name = 'MS Sans Serif'
            OnDblClick = fraReclamoSentenciaReclamodbReclamosDblClick
            OnPaintFooter = fraReclamoSentenciaReclamodbReclamosPaintFooter
            Columns = <
              item
                Expanded = False
                FieldName = 'RC_DESCRIPCION'
                Title.Caption = 'Reclamo'
                Width = 502
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_MONTODEMANDADO'
                Title.Caption = 'Monto Demandado'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RT_MONTOSENTENCIA'
                Title.Caption = 'Monto Sentencia'
                Width = 74
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
            Width = 782
            Bands = <
              item
                Control = fraReclamoSentenciaReclamo.tbrReclamo
                ImageIndex = -1
                MinHeight = 27
                Width = 776
              end>
            ExplicitWidth = 782
            inherited tbrReclamo: TToolBar
              Width = 769
              ExplicitWidth = 769
              inherited tbNuevoReclamo: TToolButton
                OnClick = tbNuevoReclamoClickOverride
              end
              inherited tbEdicionReclamo: TToolButton
                OnClick = fraReclamoSentenciaReclamotbEdicionReclamoClick
              end
            end
          end
          inherited fpReclamo: TFormPanel
            Left = 173
            Top = 217
            Width = 524
            Height = 186
            ExplicitLeft = 173
            ExplicitTop = 217
            ExplicitWidth = 524
            ExplicitHeight = 186
            DesignSize = (
              524
              186)
            inherited bvSeparadorBotones: TBevel
              Top = 148
              Width = 511
              ExplicitTop = 148
              ExplicitWidth = 511
            end
            inherited btnAceptarReclamo: TButton
              Left = 348
              Top = 156
              OnClick = fraReclamoSentenciaReclamobtnAceptarReclamoClick
              ExplicitLeft = 348
              ExplicitTop = 156
            end
            inherited btnCancelarReclamo: TButton
              Left = 433
              Top = 156
              ExplicitLeft = 433
              ExplicitTop = 156
            end
            inherited ScrollBox1: TScrollBox
              Left = 4
              Top = 1
              Height = 209
              ExplicitLeft = 4
              ExplicitTop = 1
              ExplicitHeight = 209
              inherited pnImporteReclamo: TPanel
                Top = 35
                ExplicitTop = 35
                inherited lblImporteDemandado: TLabel
                  Left = 4
                  Width = 99
                  ExplicitLeft = 4
                  ExplicitWidth = 99
                end
                inherited lblPor: TLabel
                  Width = 19
                  ExplicitWidth = 19
                end
                inherited pnReclamoIncapacidad: TPanel
                  Left = 245
                  Width = 250
                  ExplicitLeft = 245
                  ExplicitWidth = 250
                  inherited lblPorcentajeIncapacidadDemanda: TLabel
                    Left = 29
                    Width = 70
                    ExplicitLeft = 29
                    ExplicitWidth = 70
                  end
                  inherited Label1: TLabel
                    Left = 48
                    ExplicitLeft = 48
                  end
                  inherited Label2: TLabel
                    Left = 239
                    Width = 8
                    ExplicitLeft = 239
                    ExplicitWidth = 8
                  end
                  inherited lnlPorcentajeIncapacidad: TLabel
                    Left = 239
                    Width = 8
                    ExplicitLeft = 239
                    ExplicitWidth = 8
                  end
                  inherited edPorcentajeIncapacidadDemanda: TCurrencyEdit
                    Left = 189
                    ExplicitLeft = 189
                  end
                  inherited edPorcentajeIncapacidadSegunPerito: TCurrencyEdit
                    Left = 189
                    ExplicitLeft = 189
                  end
                  inherited cbIndeterminadoIncDem: TCheckBox
                    Left = 147
                    ExplicitLeft = 147
                  end
                end
                inherited edtImporteDemandadoReclamo: TCurrencyEdit
                  Width = 59
                  MaxLength = 99999999
                  ExplicitWidth = 59
                end
                inherited cmbPor: TExComboBox
                  Width = 170
                  ExplicitWidth = 170
                end
              end
              inherited pnImporteSentencia: TPanel
                Top = 106
                ExplicitTop = 106
                inherited lblImporteSentencia: TLabel
                  Width = 111
                  ExplicitWidth = 111
                end
                inherited lblTituloPorcentajeSolidario: TLabel
                  Left = 207
                  Width = 97
                  ExplicitLeft = 207
                  ExplicitWidth = 97
                end
                inherited lblPorcentajeSolidario: TLabel
                  Left = 416
                  Width = 8
                  ExplicitLeft = 416
                  ExplicitWidth = 8
                end
                inherited lblImporteAPagar: TLabel
                  Width = 113
                  ExplicitWidth = 113
                end
                inherited Label3: TLabel
                  Width = 54
                  ExplicitWidth = 54
                end
                inherited ceImporteSentencia: TCurrencyEdit
                  Width = 56
                  MaxLength = 99999999
                  ExplicitWidth = 56
                end
                inherited cePorcentajeSolidario: TCurrencyEdit
                  Left = 365
                  ExplicitLeft = 365
                end
              end
              inherited pnOrigenDemanda: TPanel
                Top = 179
                ExplicitTop = 179
                inherited lblOrigenanteRelacionado: TLabel
                  Width = 34
                  ExplicitWidth = 34
                end
                inherited fraOrigenReclamoRelacionado: TfraCodigoDescripcion
                  inherited cmbDescripcion: TArtComboBox
                    DataSource = nil
                  end
                  inherited edCodigo: TPatternEdit
                    Pattern = '0123456789'
                  end
                end
              end
              inherited pnl1: TPanel
                Height = 35
                Alignment = taLeftJustify
                ExplicitHeight = 35
                DesignSize = (
                  519
                  35)
                inherited lblReclamo: TLabel
                  Width = 45
                  ExplicitWidth = 45
                end
                inherited fraReclamo: TfraCodigoDescripcion
                  Top = 7
                  Width = 322
                  ExplicitTop = 7
                  ExplicitWidth = 322
                  DesignSize = (
                    322
                    23)
                  inherited cmbDescripcion: TArtComboBox
                    Width = 257
                    DataSource = nil
                    ExplicitWidth = 257
                  end
                  inherited edCodigo: TPatternEdit
                    Pattern = '0123456789'
                  end
                end
                inherited tbReclamo: TToolBar
                  Left = 450
                  HotImages = dmLegales.ilByN
                  Images = dmLegales.ilColor
                  ExplicitLeft = 450
                  inherited tbEditarReclamos: TToolButton
                    Visible = False
                    OnClick = fraReclamoSentenciaReclamotbEditarReclamosClick
                  end
                end
              end
              inherited pnl2: TPanel
                Top = 157
                ExplicitTop = 157
                inherited lblImporteNominal: TLabel
                  Width = 79
                  ExplicitWidth = 79
                end
                inherited Label5: TLabel
                  Width = 46
                  ExplicitWidth = 46
                end
              end
            end
          end
        end
      end
      object tbEventosSeguimiento: TTabSheet
        Caption = 'Eventos de Seguimiento'
        ImageIndex = 2
        object dbgEventosJuicioEnTramite: TRxDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 126
          Align = alClient
          DataSource = dsEventoJuicioEnTramite
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgEventosJuicioEnTramiteDblClick
          RowColor2 = 16776176
          OnGetCellParams = dbgEventosJuicioEnTramiteGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'TE_DESCRIPCION'
              Title.Caption = 'Evento'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ET_FECHAEVENTO'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ET_FECHAVENCIMIENTO'
              Title.Caption = 'Fecha Vencimiento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIENEADJUNTO'
              Title.Caption = 'Tiene Adjunto'
              Width = 90
              Visible = True
            end>
        end
        object cbEventos: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = tbrEventos
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object tbrEventos: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoEvento: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevoEventoClick
            end
            object tbModificarEvento: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbModificarEventoClick
            end
            object tbEliminarEvento: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbEliminarEventoClick
            end
            object tbEventosSeparador: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'tbEventosSeparador'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbAccImprimir: TToolButton
              Left = 77
              Top = 0
              Hint = 'Imprimir Eventos'
              ImageIndex = 4
              Visible = False
            end
            object tbImpresionEventos: TToolButton
              Left = 100
              Top = 0
              Hint = 'Impresi'#243'n de Eventos'
              Caption = 'ImpresionEventos'
              ImageIndex = 13
              OnClick = tbImpresionEventosClick
            end
            object tbOrdenar: TToolButton
              Left = 123
              Top = 0
              Hint = 'Ordenar  '
              ImageIndex = 2
              OnClick = tbOrdenarClick
            end
          end
        end
        object fpEventoSeguimiento: TFormPanel
          Left = 163
          Top = 3
          Width = 499
          Height = 301
          HelpContext = 7
          Caption = 'Evento'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderStyle = bsDialog
          Position = poScreenCenter
          DesignSize = (
            499
            301)
          object lbAccion: TLabel
            Left = 9
            Top = 34
            Width = 37
            Height = 13
            Caption = 'Evento:'
          end
          object bvSeparadorBotonesEventos: TBevel
            Left = 4
            Top = 264
            Width = 492
            Height = 4
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object lblFechaEvento: TLabel
            Left = 8
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Fecha:'
          end
          object lblVencimientoEvento: TLabel
            Left = 211
            Top = 10
            Width = 94
            Height = 13
            Caption = 'Fecha Vencimiento:'
          end
          object lblObservacuinesEvento: TLabel
            Left = 8
            Top = 59
            Width = 74
            Height = 13
            Caption = 'Observaciones:'
          end
          object lblArchivosAsociados: TLabel
            Left = 10
            Top = 209
            Width = 64
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Asociar Doc.:'
          end
          inline fraTipoEvento: TfraCodigoDescripcion
            Left = 103
            Top = 30
            Width = 336
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 103
            ExplicitTop = 30
            ExplicitWidth = 336
            DesignSize = (
              336
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 269
              DataSource = nil
              ExplicitWidth = 269
            end
            inherited edCodigo: TPatternEdit
              Pattern = '0123456789'
            end
          end
          object btnAccAceptar: TButton
            Left = 337
            Top = 272
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 7
            OnClick = btnAccAceptarClick
          end
          object btnAccCancelar: TButton
            Left = 415
            Top = 272
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 8
          end
          object tbEdicionTiposEventos: TToolBar
            Left = 439
            Top = 29
            Width = 55
            Height = 27
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            ButtonWidth = 25
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object tbEdicionTipoEvento: TToolButton
              Left = 0
              Top = 0
              Hint = 'Editar'
              ImageIndex = 6
              Visible = False
            end
            object tbDetallesEvento: TToolButton
              Left = 25
              Top = 0
              Hint = 'Mas Datos'
              ImageIndex = 14
            end
          end
          object edFechaVencimientoEvento: TDateComboBox
            Left = 308
            Top = 6
            Width = 101
            Height = 21
            TabOrder = 1
          end
          object edtArchivosAsociados: TEdit
            Left = 104
            Top = 206
            Width = 333
            Height = 21
            Anchors = [akLeft, akRight, akBottom]
            Color = 16776176
            ReadOnly = True
            TabOrder = 5
          end
          object tbrVerArchivosAsociados: TToolBar
            Left = 435
            Top = 202
            Width = 63
            Height = 27
            Align = alNone
            Anchors = [akBottom]
            BorderWidth = 1
            ButtonWidth = 25
            HotImages = dmLegales.ilColor
            Images = dmLegales.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            object tbSeleccionArchivosAsociar: TToolButton
              Left = 0
              Top = 0
              Hint = 'Seleccionar Archivos'
              ImageIndex = 26
              OnClick = tbSeleccionArchivosAsociarClick
            end
            object tbAsociarDoc: TToolButton
              Left = 25
              Top = 0
              Hint = 'Asociar Doc.'
              Caption = 'tbAsociarDoc'
              ImageIndex = 23
              OnClick = tbAsociarDocClick
            end
          end
          object edFechaEventoDesde: TDateComboBox
            Left = 102
            Top = 4
            Width = 99
            Height = 21
            Weekends = [Sun, Sat]
            TabOrder = 0
          end
          object mObservacionesEvento: TRxRichEdit
            Left = 104
            Top = 56
            Width = 333
            Height = 147
            DrawEndPage = False
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HideScrollBars = False
            ParentFont = False
            PlainText = True
            ScrollBars = ssNone
            TabOrder = 4
          end
        end
      end
      object tbTareas: TTabSheet
        Caption = 'Tareas'
        ImageIndex = 4
        object jvnsSeparador: TJvNetscapeSplitter
          Left = 427
          Top = 31
          Width = 9
          Height = 124
          Align = alRight
          Maximized = False
          Minimized = False
          ButtonCursor = crDefault
          ExplicitHeight = 127
        end
        object psTareas: TPageControl
          Left = 0
          Top = 31
          Width = 427
          Height = 124
          ActivePage = Dia
          Align = alClient
          TabOrder = 3
          object Dia: TTabSheet
            Caption = 'Dia'
            TabVisible = False
            object ProgramacionSemanal: TJvTFWeeks
              Left = 0
              Top = 0
              Width = 419
              Height = 114
              Cells = <
                item
                  Color = clBlack
                  CellDate = 38439.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38440.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38441.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38442.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38443.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38444.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end>
              GapSize = 4
              TitleAttr.Visible = False
              TitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              TitleAttr.TxtAttr.Font.Color = clWindowText
              TitleAttr.TxtAttr.Font.Height = -21
              TitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              TitleAttr.TxtAttr.Font.Style = [fsBold]
              TitleAttr.Title = 'Week of mar 28, 2005'
              CellAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.Font.Color = clWindowText
              CellAttr.Font.Height = -11
              CellAttr.Font.Name = 'MS Sans Serif'
              CellAttr.Font.Style = []
              CellAttr.TitleAttr.Color = clWhite
              CellAttr.TitleAttr.FrameAttr.Color = clGray
              CellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              CellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              CellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              CellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              CellAttr.DrawBottomLine = False
              SelCellAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.Font.Color = clWindowText
              SelCellAttr.Font.Height = -11
              SelCellAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.Font.Style = []
              SelCellAttr.TitleAttr.Color = clNavy
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWhite
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              SelCellAttr.DrawBottomLine = False
              DateFormat = 'ddddd'
              TimeFormat = 't'
              Align = alClient
              ParentColor = True
              TabOrder = 2
              DisplayDate = 38439.000000000000000000
              DisplayOrder = doLeftRight
              DWNames.DWN_Sunday = 'S'
              DWNames.DWN_Monday = 'M'
              DWNames.DWN_Tuesday = 'T'
              DWNames.DWN_Wednesday = 'W'
              DWNames.DWN_Thursday = 'T'
              DWNames.DWN_Friday = 'F'
              DWNames.DWN_Saturday = 'S'
              DWTitleAttr.Height = 20
              DWTitleAttr.Visible = False
              DWTitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              DWTitleAttr.TxtAttr.Font.Color = clWindowText
              DWTitleAttr.TxtAttr.Font.Height = -11
              DWTitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              DWTitleAttr.TxtAttr.Font.Style = [fsBold]
            end
            object ProgramacionMensual: TJvTFMonths
              Left = 0
              Top = 0
              Width = 419
              Height = 114
              Cells = <
                item
                  Color = clBlack
                  CellDate = 38410.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38411.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38412.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38413.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38414.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38415.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38416.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38417.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38418.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38419.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38420.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38421.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38422.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38423.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38424.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38425.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38426.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38427.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38428.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38429.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38430.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38431.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38432.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38433.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38434.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38435.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38436.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38437.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38438.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38439.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38440.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38441.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38442.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38443.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38444.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38445.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38446.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38447.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38448.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38449.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38450.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38451.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end>
              GapSize = 0
              TitleAttr.Visible = False
              TitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              TitleAttr.TxtAttr.Font.Color = clWindowText
              TitleAttr.TxtAttr.Font.Height = -21
              TitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              TitleAttr.TxtAttr.Font.Style = [fsBold]
              TitleAttr.Title = 'marzo 2005'
              CellAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.Font.Color = clWindowText
              CellAttr.Font.Height = -11
              CellAttr.Font.Name = 'MS Sans Serif'
              CellAttr.Font.Style = []
              CellAttr.TitleAttr.Color = clWhite
              CellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              CellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              CellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              CellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              CellAttr.DrawBottomLine = False
              SelCellAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.Font.Color = clWindowText
              SelCellAttr.Font.Height = -11
              SelCellAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.Font.Style = []
              SelCellAttr.TitleAttr.Color = clNavy
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWhite
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              SelCellAttr.DrawBottomLine = False
              DateFormat = 'ddddd'
              TimeFormat = 't'
              Align = alClient
              ParentColor = True
              TabOrder = 1
              Month = 3
              Year = 2005
              DisplayDate = 38439.000000000000000000
              DWNames.DWN_Sunday = 'S'
              DWNames.DWN_Monday = 'M'
              DWNames.DWN_Tuesday = 'T'
              DWNames.DWN_Wednesday = 'W'
              DWNames.DWN_Thursday = 'T'
              DWNames.DWN_Friday = 'F'
              DWNames.DWN_Saturday = 'S'
              DWTitleAttr.FrameAttr.Style = fs3DRaised
              DWTitleAttr.Height = 20
              DWTitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              DWTitleAttr.TxtAttr.Font.Color = clWindowText
              DWTitleAttr.TxtAttr.Font.Height = -11
              DWTitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              DWTitleAttr.TxtAttr.Font.Style = []
              ExtraDayCellAttr.Font.Charset = DEFAULT_CHARSET
              ExtraDayCellAttr.Font.Color = clWindowText
              ExtraDayCellAttr.Font.Height = -11
              ExtraDayCellAttr.Font.Name = 'MS Sans Serif'
              ExtraDayCellAttr.Font.Style = []
              ExtraDayCellAttr.TitleAttr.Color = clWhite
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              ExtraDayCellAttr.DrawBottomLine = False
              OffDayCellAttr.Font.Charset = DEFAULT_CHARSET
              OffDayCellAttr.Font.Color = clWindowText
              OffDayCellAttr.Font.Height = -11
              OffDayCellAttr.Font.Name = 'MS Sans Serif'
              OffDayCellAttr.Font.Style = []
              OffDayCellAttr.TitleAttr.Color = clWhite
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              OffDayCellAttr.DrawBottomLine = False
              FirstDayOfMonthFormat = 'mmm d'
              DayFormat = 'd'
            end
            object ProgramacionDiaria: TJvTFDays
              Left = 0
              Top = 0
              Width = 419
              Height = 114
              ScheduleManager = Schedule
              ColHdrHeight = 30
              Cols = <
                item
                  SchedDate = 37987.000000000000000000
                  SchedName = 'Tareas Programadas'
                  Title = 'Tareas Programadas - 01/01/2004'
                  Width = 348
                end>
              Options = [agoSizeCols, agoSizeRows, agoSizeColHdr, agoSizeRowHdr, agoSizeAppt, agoMoveAppt, agoShowPics, agoShowText, agoShowApptHints, agoShowSelHint, agoQuickEntry]
              RowHeight = 12
              Template.CompDate = 36406.000000000000000000
              Template.LinearDayCount = 1
              Template.LinearEndDate = 37987.000000000000000000
              Template.LinearName = 'Tareas Programadas'
              Template.LinearStartDate = 37987.000000000000000000
              Grouping = grNone
              GridStartTime = 0.333333333333333300
              GridEndTime = 0.750000000000000000
              TimeBlocks = <>
              TimeBlockProps.BlockHdrAttr.Font.Charset = DEFAULT_CHARSET
              TimeBlockProps.BlockHdrAttr.Font.Color = clWindowText
              TimeBlockProps.BlockHdrAttr.Font.Height = -11
              TimeBlockProps.BlockHdrAttr.Font.Name = 'MS Sans Serif'
              TimeBlockProps.BlockHdrAttr.Font.Style = []
              TimeBlockProps.BlockHdrAttr.ParentFont = False
              TimeBlockProps.BlockHdrAttr.FrameColor = clBlack
              TimeBlockProps.SelBlockHdrAttr.Font.Charset = DEFAULT_CHARSET
              TimeBlockProps.SelBlockHdrAttr.Font.Color = clBlack
              TimeBlockProps.SelBlockHdrAttr.Font.Height = -11
              TimeBlockProps.SelBlockHdrAttr.Font.Name = 'MS Sans Serif'
              TimeBlockProps.SelBlockHdrAttr.Font.Style = []
              TimeBlockProps.SelBlockHdrAttr.ParentFont = False
              TimeBlockProps.SelBlockHdrAttr.FrameColor = clBlack
              ApptAttr.Color = clWhite
              ApptAttr.Font.Charset = DEFAULT_CHARSET
              ApptAttr.Font.Color = clWindowText
              ApptAttr.Font.Height = -13
              ApptAttr.Font.Name = 'MS Sans Serif'
              ApptAttr.Font.Style = []
              ApptAttr.ParentFont = False
              SelApptAttr.Color = clBtnFace
              SelApptAttr.Font.Charset = DEFAULT_CHARSET
              SelApptAttr.Font.Color = clWindowText
              SelApptAttr.Font.Height = -13
              SelApptAttr.Font.Name = 'MS Sans Serif'
              SelApptAttr.Font.Style = []
              SelApptAttr.ParentFont = False
              HdrAttr.Font.Charset = DEFAULT_CHARSET
              HdrAttr.Font.Color = clWindowText
              HdrAttr.Font.Height = -13
              HdrAttr.Font.Name = 'MS Sans Serif'
              HdrAttr.Font.Style = []
              HdrAttr.ParentFont = False
              HdrAttr.FrameColor = clBlack
              SelHdrAttr.Font.Charset = DEFAULT_CHARSET
              SelHdrAttr.Font.Color = clBlack
              SelHdrAttr.Font.Height = -11
              SelHdrAttr.Font.Name = 'MS Sans Serif'
              SelHdrAttr.Font.Style = []
              SelHdrAttr.ParentFont = False
              SelHdrAttr.FrameColor = clBlack
              FancyRowHdrAttr.Hr2400 = True
              FancyRowHdrAttr.MinorFont.Charset = DEFAULT_CHARSET
              FancyRowHdrAttr.MinorFont.Color = clWindowText
              FancyRowHdrAttr.MinorFont.Height = -11
              FancyRowHdrAttr.MinorFont.Name = 'MS Sans Serif'
              FancyRowHdrAttr.MinorFont.Style = []
              FancyRowHdrAttr.MajorFont.Charset = DEFAULT_CHARSET
              FancyRowHdrAttr.MajorFont.Color = clWindowText
              FancyRowHdrAttr.MajorFont.Height = -21
              FancyRowHdrAttr.MajorFont.Name = 'MS Sans Serif'
              FancyRowHdrAttr.MajorFont.Style = []
              SelFancyRowHdrAttr.Hr2400 = True
              SelFancyRowHdrAttr.MinorFont.Charset = DEFAULT_CHARSET
              SelFancyRowHdrAttr.MinorFont.Color = clBlack
              SelFancyRowHdrAttr.MinorFont.Height = -11
              SelFancyRowHdrAttr.MinorFont.Name = 'MS Sans Serif'
              SelFancyRowHdrAttr.MinorFont.Style = []
              SelFancyRowHdrAttr.MajorFont.Charset = DEFAULT_CHARSET
              SelFancyRowHdrAttr.MajorFont.Color = clBlack
              SelFancyRowHdrAttr.MajorFont.Height = -21
              SelFancyRowHdrAttr.MajorFont.Name = 'MS Sans Serif'
              SelFancyRowHdrAttr.MajorFont.Style = []
              SelFancyRowHdrAttr.TickColor = clBlack
              PrimeTime.StartTime = 0.250000000000000000
              PrimeTime.EndTime = 0.833333333333333400
              PrimeTime.Color = clInfoBk
              GroupHdrAttr.Font.Charset = DEFAULT_CHARSET
              GroupHdrAttr.Font.Color = clWindowText
              GroupHdrAttr.Font.Height = -11
              GroupHdrAttr.Font.Name = 'MS Sans Serif'
              GroupHdrAttr.Font.Style = []
              GroupHdrAttr.ParentFont = False
              GroupHdrAttr.FrameColor = clBlack
              SelGroupHdrAttr.Font.Charset = DEFAULT_CHARSET
              SelGroupHdrAttr.Font.Color = clBlack
              SelGroupHdrAttr.Font.Height = -11
              SelGroupHdrAttr.Font.Name = 'MS Sans Serif'
              SelGroupHdrAttr.Font.Style = []
              SelGroupHdrAttr.ParentFont = False
              SelGroupHdrAttr.FrameColor = clBlack
              LeftCol = 0
              OnDateChanging = ProgramacionDiariaDateChanging
              OnDateChanged = ProgramacionDiariaDateChanged
              DateFormat = 'ddddd'
              TimeFormat = 't'
              Align = alClient
              Color = clWhite
              TabOrder = 0
              OnDblClick = ProgramacionDiariaDblClick
              DesignSize = (
                415
                110)
            end
          end
          object Semana: TTabSheet
            Caption = 'Semana'
            TabVisible = False
            object jvwTareasSemanales: TJvTFWeeks
              Left = 0
              Top = 0
              Width = 419
              Height = 225
              Cells = <
                item
                  Color = clBlack
                  CellDate = 38411.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38412.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38413.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38414.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38415.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38416.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end>
              GapSize = 4
              TitleAttr.Visible = False
              TitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              TitleAttr.TxtAttr.Font.Color = clWindowText
              TitleAttr.TxtAttr.Font.Height = -21
              TitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              TitleAttr.TxtAttr.Font.Style = [fsBold]
              TitleAttr.Title = 'Week of feb 28, 2005'
              CellAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.Font.Color = clWindowText
              CellAttr.Font.Height = -11
              CellAttr.Font.Name = 'MS Sans Serif'
              CellAttr.Font.Style = []
              CellAttr.TitleAttr.Color = clWhite
              CellAttr.TitleAttr.FrameAttr.Color = clGray
              CellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              CellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              CellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              CellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              CellAttr.DrawBottomLine = False
              SelCellAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.Font.Color = clWindowText
              SelCellAttr.Font.Height = -11
              SelCellAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.Font.Style = []
              SelCellAttr.TitleAttr.Color = clNavy
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWhite
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              SelCellAttr.DrawBottomLine = False
              DateFormat = 'ddddd'
              TimeFormat = 't'
              Align = alTop
              ParentColor = True
              TabOrder = 0
              Anchors = [akLeft, akTop, akRight, akBottom]
              DisplayDate = 38416.000000000000000000
              DisplayOrder = doLeftRight
              DWNames.DWN_Sunday = 'S'
              DWNames.DWN_Monday = 'M'
              DWNames.DWN_Tuesday = 'T'
              DWNames.DWN_Wednesday = 'W'
              DWNames.DWN_Thursday = 'T'
              DWNames.DWN_Friday = 'F'
              DWNames.DWN_Saturday = 'S'
              DWTitleAttr.Height = 20
              DWTitleAttr.Visible = False
              DWTitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              DWTitleAttr.TxtAttr.Font.Color = clWindowText
              DWTitleAttr.TxtAttr.Font.Height = -11
              DWTitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              DWTitleAttr.TxtAttr.Font.Style = [fsBold]
            end
          end
          object Mes: TTabSheet
            Caption = 'Mes'
            TabVisible = False
            object jvmTareasMensuales: TJvTFMonths
              Left = 0
              Top = 0
              Width = 419
              Height = 207
              Cells = <
                item
                  Color = clBlack
                  CellDate = 38410.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38411.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38412.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38413.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38414.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38415.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38416.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38417.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38418.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38419.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38420.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38421.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38422.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38423.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38424.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38425.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38426.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38427.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38428.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38429.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38430.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38431.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38432.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38433.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38434.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38435.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38436.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38437.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38438.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38439.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38440.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38441.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38442.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38443.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38444.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38445.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38446.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38447.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38448.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38449.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38450.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end
                item
                  Color = clBlack
                  CellDate = 38451.000000000000000000
                  CellPics = <>
                  CanSelect = True
                end>
              GapSize = 0
              TitleAttr.Visible = False
              TitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              TitleAttr.TxtAttr.Font.Color = clWindowText
              TitleAttr.TxtAttr.Font.Height = -21
              TitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              TitleAttr.TxtAttr.Font.Style = [fsBold]
              TitleAttr.Title = 'marzo 2005'
              CellAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.Font.Color = clWindowText
              CellAttr.Font.Height = -11
              CellAttr.Font.Name = 'MS Sans Serif'
              CellAttr.Font.Style = []
              CellAttr.TitleAttr.Color = clWhite
              CellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              CellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              CellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              CellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              CellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              CellAttr.DrawBottomLine = False
              SelCellAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.Font.Color = clWindowText
              SelCellAttr.Font.Height = -11
              SelCellAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.Font.Style = []
              SelCellAttr.TitleAttr.Color = clNavy
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWhite
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              SelCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              SelCellAttr.DrawBottomLine = False
              DateFormat = 'ddddd'
              TimeFormat = 't'
              Align = alTop
              ParentColor = True
              TabOrder = 0
              Month = 3
              Year = 2005
              DisplayDate = 38416.000000000000000000
              DWNames.DWN_Sunday = 'S'
              DWNames.DWN_Monday = 'M'
              DWNames.DWN_Tuesday = 'T'
              DWNames.DWN_Wednesday = 'W'
              DWNames.DWN_Thursday = 'T'
              DWNames.DWN_Friday = 'F'
              DWNames.DWN_Saturday = 'S'
              DWTitleAttr.FrameAttr.Style = fs3DRaised
              DWTitleAttr.Height = 20
              DWTitleAttr.TxtAttr.Font.Charset = DEFAULT_CHARSET
              DWTitleAttr.TxtAttr.Font.Color = clWindowText
              DWTitleAttr.TxtAttr.Font.Height = -11
              DWTitleAttr.TxtAttr.Font.Name = 'MS Sans Serif'
              DWTitleAttr.TxtAttr.Font.Style = []
              ExtraDayCellAttr.Font.Charset = DEFAULT_CHARSET
              ExtraDayCellAttr.Font.Color = clWindowText
              ExtraDayCellAttr.Font.Height = -11
              ExtraDayCellAttr.Font.Name = 'MS Sans Serif'
              ExtraDayCellAttr.Font.Style = []
              ExtraDayCellAttr.TitleAttr.Color = clWhite
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              ExtraDayCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              ExtraDayCellAttr.DrawBottomLine = False
              OffDayCellAttr.Font.Charset = DEFAULT_CHARSET
              OffDayCellAttr.Font.Color = clWindowText
              OffDayCellAttr.Font.Height = -11
              OffDayCellAttr.Font.Name = 'MS Sans Serif'
              OffDayCellAttr.Font.Style = []
              OffDayCellAttr.TitleAttr.Color = clWhite
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Charset = DEFAULT_CHARSET
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Color = clWindowText
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Height = -11
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Name = 'MS Sans Serif'
              OffDayCellAttr.TitleAttr.DayTxtAttr.Font.Style = []
              OffDayCellAttr.DrawBottomLine = False
              FirstDayOfMonthFormat = 'mmm d'
              DayFormat = 'd'
            end
          end
          object PuntosRevision: TTabSheet
            Caption = 'PuntosRevision'
            TabVisible = False
          end
        end
        object cbTareas: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 31
          Bands = <
            item
              Control = tbrAgenda
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object tbrAgenda: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevaTarea: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevaTareaClick
            end
            object tbEditarTarea: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbEditarTareaClick
            end
            object tbEliminarTarea: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbEliminarTareaClick
            end
            object tbSeparadorTarea: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbVistaDia: TToolButton
              Tag = 1
              Left = 77
              Top = 0
              Hint = 'Vista Diaria'
              ImageIndex = 16
            end
            object tbVistaSemana: TToolButton
              Left = 100
              Top = 0
              Hint = 'Vista Semanal'
              Caption = 'tbVistaSemana'
              ImageIndex = 15
            end
            object tbVistaMes: TToolButton
              Left = 123
              Top = 0
              Hint = 'Vista Mensual'
              Caption = 'tbVistaMes'
              ImageIndex = 9
            end
            object tbSeparadorTareas2: TToolButton
              Left = 146
              Top = 0
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbImprimirTareas: TToolButton
              Left = 154
              Top = 0
              Hint = 'Imprimir Tareas'
              ImageIndex = 4
            end
            object tbSeparadorTareas3: TToolButton
              Left = 177
              Top = 0
              Width = 8
              Caption = 'tbSeparadorTareas3'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object lblFechaFijadaTarea: TLabel
              Left = 185
              Top = 0
              Width = 47
              Height = 22
              Alignment = taCenter
              AutoSize = False
              BiDiMode = bdRightToLeftNoAlign
              Caption = 'Fecha:'
              ParentBiDiMode = False
              Layout = tlCenter
            end
            object dtcFechaActualVisualizacion: TDateComboBox
              Left = 232
              Top = 0
              Width = 101
              Height = 22
              TabOrder = 0
              OnChange = dtcFechaActualVisualizacionChange
            end
          end
        end
        object pnCalendario: TPanel
          Left = 436
          Top = 31
          Width = 346
          Height = 124
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object mcCalendario: TJvMonthCalendar2
            Left = 0
            Top = 0
            Width = 346
            Height = 169
            Align = alTop
            ParentColor = False
            TabStop = True
            TabOrder = 0
            Colors.BackColor = clActiveBorder
            Colors.TitleBackColor = clBtnFace
            Colors.TitleTextColor = clOlive
            DateFirst = 38389.000000000000000000
            Today = 38393.631742337970000000
            OnSelChange = mcCalendarioSelChange
          end
        end
        object fpTareas: TFormPanel
          Left = 175
          Top = -5
          Width = 431
          Height = 226
          HelpContext = 7
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderStyle = bsDialog
          Position = poScreenCenter
          DesignSize = (
            431
            226)
          object lblTipoTarea: TLabel
            Left = 25
            Top = 36
            Width = 31
            Height = 13
            Caption = 'Tarea:'
          end
          object bvSeparadorBotonesTareas: TBevel
            Left = 4
            Top = 187
            Width = 424
            Height = 3
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object lblFechaProgramacionTarea: TLabel
            Left = 25
            Top = 11
            Width = 33
            Height = 13
            Caption = 'Fecha:'
          end
          object lblDescripcionTarea: TLabel
            Left = 25
            Top = 81
            Width = 59
            Height = 13
            Caption = 'Descripci'#243'n:'
          end
          object lblHecho: TLabel
            Left = 25
            Top = 58
            Width = 35
            Height = 13
            Caption = 'Hecho:'
          end
          object lblResultadosObtenidosTarea: TLabel
            Left = 25
            Top = 113
            Width = 56
            Height = 13
            Caption = 'Resultados:'
          end
          object imAlarma: TImage
            Left = 27
            Top = 158
            Width = 25
            Height = 25
            AutoSize = True
            Picture.Data = {
              07544269746D617006020000424D060200000000000076000000280000001900
              000019000000010004000000000090010000320B0000320B0000100000001000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00DDDDDDDDDDDDDDDDDDDDDDDDD00000008DDDDDDDDDDDDDDDDDDDDDD8D000
              0000DDDDDDDDDDDDDDDDDDDDDDDDD0000000DD8DDDDDDDDDDDDDDDDDD8DDD000
              0000DDD8DDDDDDDDDDDDDDDD8DDDD0000000DDDD8DDDDDD88DDDDDD8DDDDD000
              0000DDDDDDDDDD0000DDDDDDDDDDD0000000DDDDDDD0007777000DDDDDDDD000
              0000DDDDD807FF7F7F77700DDDDDD0000000DDDDD8FFFFF77878780DDDDDD000
              0000DDDDDD878F77778880DDDDDDD0000000DDDDDDD87FF778780DDDDDDDD000
              0000DDDDDDD88F7777880DDDDDDDD00000008D888DD87FF778780DD888D8D000
              0000DDDDDDD88F7777880DDDDDDDD0000000DDDDDDD87FF778780DDDDDDDD000
              0000DDDDDDD88F7777880DDDDDDDD0000000DDDDDDDD87F77870DDDDDDDDD000
              0000DDDDDDDDD87F770DDDDDDDDDD0000000DDDDDD8DDD8770DDD8DDDDDDD000
              0000DDDDD8DDDDD88DDDDD8DDDDDD0000000DDDD8DDDDDD80DDDDDD8DDDDD000
              0000DDD8DDDDDDDDDDDDDDDD8DDDD0000000DDDDDDDDDDDDDDDDDDDDDDDDD000
              0000D8DDDDDDDDDDDDDDDDDDDD8DD0000000}
            Transparent = True
          end
          object lblMinutosAlarmaAntes: TLabel
            Left = 245
            Top = 163
            Width = 67
            Height = 13
            Caption = 'Minutos Antes'
          end
          object bvSeparadorBotonesAlarmaTareas: TBevel
            Left = 5
            Top = 150
            Width = 424
            Height = 5
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object btnAceptarTarea: TButton
            Left = 269
            Top = 196
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            TabOrder = 8
            OnClick = btnAceptarTareaClick
          end
          object btnCancelarTarea: TButton
            Left = 347
            Top = 196
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 9
            OnClick = btnCancelarTareaClick
          end
          object dtcFechaProgramacion: TDateComboBox
            Left = 104
            Top = 6
            Width = 101
            Height = 21
            TabOrder = 0
          end
          object mDescripcionTarea: TMemo
            Left = 104
            Top = 79
            Width = 317
            Height = 30
            MaxLength = 2048
            TabOrder = 3
          end
          object mDescripcionResultadoTarea: TMemo
            Left = 104
            Top = 111
            Width = 317
            Height = 30
            MaxLength = 2048
            TabOrder = 4
          end
          inline fraTareas: TfraCodigoDescripcion
            Left = 104
            Top = 28
            Width = 264
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 104
            ExplicitTop = 28
            ExplicitWidth = 264
            DesignSize = (
              264
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 199
              DataSource = nil
              ExplicitWidth = 199
            end
            inherited edCodigo: TPatternEdit
              Pattern = '0123456789'
            end
          end
          inline fraHechos: TfraCodigoDescripcion
            Left = 104
            Top = 53
            Width = 320
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 104
            ExplicitTop = 53
            ExplicitWidth = 320
            DesignSize = (
              320
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 255
              DataSource = nil
              ExplicitWidth = 255
            end
            inherited edCodigo: TPatternEdit
              Pattern = '0123456789'
            end
          end
          object chkCompletado: TCheckBox
            Left = 321
            Top = 7
            Width = 85
            Height = 17
            TabStop = False
            Caption = 'Completado'
            TabOrder = 10
          end
          object chkAlarmaActivada: TCheckBox
            Left = 105
            Top = 161
            Width = 69
            Height = 17
            Caption = '&Recordar:'
            TabOrder = 5
          end
          object udMinutosAviso: TUpDown
            Left = 217
            Top = 160
            Width = 15
            Height = 21
            Associate = ceMinutosAviso
            Max = 60
            TabOrder = 7
          end
          object ceMinutosAviso: TCardinalEdit
            Left = 179
            Top = 160
            Width = 38
            Height = 21
            TabOrder = 6
            Alignment = taRightJustify
          end
          object teHoraDesde: TDateTimePicker
            Left = 208
            Top = 5
            Width = 52
            Height = 21
            Date = 0.648611111108039000
            Time = 0.648611111108039000
            Kind = dtkTime
            TabOrder = 11
          end
          object teHoraHasta: TDateTimePicker
            Left = 264
            Top = 5
            Width = 52
            Height = 21
            Date = 0.648611111108039000
            Time = 0.648611111108039000
            Kind = dtkTime
            TabOrder = 12
          end
          object tbTareaNueva: TToolBar
            Left = 370
            Top = 26
            Width = 56
            Height = 26
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            ButtonWidth = 25
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            object tbEdicionTareas: TToolButton
              Left = 0
              Top = 0
              Hint = 'Editar'
              ImageIndex = 6
              Visible = False
            end
          end
        end
      end
      object tsPeritajes: TTabSheet
        Caption = 'Peritajes'
        ImageIndex = 6
        object cbPeritaje: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = tbPeritajes
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object tbPeritajes: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoPeritaje: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbNuevoPeritajeClick
            end
            object tbEditarPeritaje: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbEditarPeritajeClick
            end
            object tbEliminarPeritaje: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbEliminarPeritajeClick
            end
            object tbSeparadorPeritaje2: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbImprimirPeritajes: TToolButton
              Left = 77
              Top = 0
              Hint = 'Imprimir Peritajes'
              ImageIndex = 4
              Visible = False
            end
          end
        end
        object dbgPeritajes: TRxDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 126
          Align = alClient
          DataSource = dsPericiasJuicios
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPeritajesDblClick
          RowColor2 = 16776176
          OnGetCellParams = dbgPeritajesGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'TP_DESCRIPCION'
              Title.Caption = 'Pericia'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PJ_FECHANOTIFICACION'
              Title.Caption = 'Fecha Notificaci'#243'n'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PJ_FECHAPERITAJE'
              Title.Caption = 'Fecha Pericia'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PJ_RESULTADOPERITAJE'
              Title.Caption = 'Resultado'
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PJ_FECHAVENCIMPUGNACION'
              Title.Caption = 'F. Venc. Impug'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PJ_IMPUGNACION'
              Title.Caption = 'Impugnaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PJ_BAREMO'
              Title.Caption = 'Ap. Baremo'
              Visible = True
            end>
        end
        object fpPeritajes: TFormPanel
          Left = 287
          Top = 17
          Width = 415
          Height = 360
          HelpContext = 7
          Caption = 'Peritajes'
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderStyle = bsDialog
          Position = poScreenCenter
          object pn1: TPanel
            Left = 0
            Top = 0
            Width = 415
            Height = 135
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              415
              135)
            object lblPericia: TLabel
              Left = 9
              Top = 13
              Width = 35
              Height = 13
              Caption = 'Pericia:'
            end
            object lblResultadoPericia: TLabel
              Left = 8
              Top = 110
              Width = 51
              Height = 13
              Caption = 'Resultado:'
            end
            object lblFechaRealizacionPericia: TLabel
              Left = 222
              Top = 86
              Width = 68
              Height = 13
              Caption = 'Fecha Pericia:'
            end
            object lblFechaAsignacionPerito: TLabel
              Left = 8
              Top = 63
              Width = 61
              Height = 13
              Caption = 'Fecha Notif.:'
            end
            object lblFVencImpug: TLabel
              Left = 8
              Top = 82
              Width = 78
              Height = 13
              Caption = 'F. Venc. Impug.:'
            end
            object lbPerito: TLabel
              Left = 9
              Top = 38
              Width = 30
              Height = 13
              Caption = 'Perito:'
            end
            object mResultadosPeritaje: TMemo
              Left = 87
              Top = 105
              Width = 313
              Height = 30
              MaxLength = 2048
              TabOrder = 4
            end
            object dcbFechaPericia: TDateComboBox
              Left = 296
              Top = 82
              Width = 104
              Height = 21
              TabOrder = 2
            end
            object dcbFechaNotificacionPerito: TDateComboBox
              Left = 87
              Top = 59
              Width = 106
              Height = 21
              TabOrder = 1
            end
            inline fraPericia: TfraCodigoDescripcion
              Left = 86
              Top = 6
              Width = 319
              Height = 25
              TabOrder = 0
              ExplicitLeft = 86
              ExplicitTop = 6
              ExplicitWidth = 319
              ExplicitHeight = 25
              DesignSize = (
                319
                25)
              inherited cmbDescripcion: TArtComboBox
                Width = 254
                DataSource = nil
                ExplicitWidth = 254
              end
              inherited edCodigo: TPatternEdit
                Pattern = '0123456789'
              end
            end
            object edFVencImpug: TDateComboBox
              Left = 87
              Top = 82
              Width = 106
              Height = 21
              TabOrder = 3
            end
            object chkCargaEstudioJuridico: TCheckBox
              Left = 220
              Top = 59
              Width = 178
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Carga Estudio Jur'#237'dico'
              TabOrder = 5
            end
            inline fraPerito: TfraCodigoDescripcion
              Left = 86
              Top = 31
              Width = 288
              Height = 25
              TabOrder = 6
              ExplicitLeft = 86
              ExplicitTop = 31
              ExplicitWidth = 288
              ExplicitHeight = 25
              DesignSize = (
                288
                25)
              inherited cmbDescripcion: TArtComboBox
                Width = 223
                DataSource = nil
                ExplicitWidth = 223
              end
              inherited edCodigo: TPatternEdit
                Pattern = '0123456789'
              end
            end
            object tbPeritosABM: TToolBar
              Left = 374
              Top = 32
              Width = 30
              Height = 27
              Align = alNone
              Anchors = [akTop, akRight]
              BorderWidth = 1
              ButtonWidth = 25
              Caption = 'ToolBar'
              HotImages = dmLegales.ilByN
              Images = dmLegales.ilColor
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              object tbModificarPerito: TToolButton
                Left = 0
                Top = 0
                Hint = 'Modificar Perito'
                ImageIndex = 14
                OnClick = tbModificarPeritoClick
              end
            end
          end
          object pnPorcentajeIncapacidad: TPanel
            Left = 0
            Top = 135
            Width = 415
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object lblIncPeritoMedico: TLabel
              Left = 8
              Top = 29
              Width = 130
              Height = 13
              Caption = 'Incapacidad Perito M'#233'dico:'
            end
            object lblIncapacidadDemanda: TLabel
              Left = 8
              Top = 5
              Width = 111
              Height = 13
              Caption = 'Incapacidad Demanda:'
            end
            object Label5: TLabel
              Left = 215
              Top = 29
              Width = 8
              Height = 13
              Caption = '%'
            end
            object lnlPorcentajeIncapacidad: TLabel
              Left = 215
              Top = 6
              Width = 8
              Height = 13
              Caption = '%'
            end
            object edPorcentajeIncDemanda: TCurrencyEdit
              Left = 165
              Top = 2
              Width = 46
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ' ,0.00;- ,0.00'
              MaxValue = 100.000000000000000000
              TabOrder = 0
            end
            object edPorcentajeIncPeritoMedico: TCurrencyEdit
              Left = 165
              Top = 25
              Width = 46
              Height = 21
              AutoSize = False
              DisplayFormat = ' ,0.00;- ,0.00'
              MaxValue = 100.000000000000000000
              TabOrder = 1
            end
          end
          object pnIBM: TPanel
            Left = 0
            Top = 183
            Width = 415
            Height = 53
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object lblIBMArt: TLabel
              Left = 5
              Top = 9
              Width = 47
              Height = 13
              Caption = 'IBM ART:'
            end
            object lblIBMPericial: TLabel
              Left = 5
              Top = 31
              Width = 56
              Height = 13
              Caption = 'IBM Pericial'
            end
            object edIBMArt: TCurrencyEdit
              Left = 163
              Top = 5
              Width = 64
              Height = 21
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              MaxLength = 99999999
              TabOrder = 0
            end
            object edIBMPericial: TCurrencyEdit
              Left = 163
              Top = 28
              Width = 64
              Height = 21
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              TabOrder = 1
            end
          end
          object pn4: TPanel
            Left = 0
            Top = 263
            Width = 202
            Height = 55
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 3
            object lblImpugnacion: TLabel
              Left = 5
              Top = 15
              Width = 64
              Height = 13
              Caption = 'Impugnaci'#243'n:'
            end
            object rgImpugnacion: TRadioGroup
              Left = 86
              Top = 0
              Width = 113
              Height = 42
              Columns = 2
              Items.Strings = (
                'Si'
                'No')
              TabOrder = 0
            end
          end
          object pnBaremo: TPanel
            Left = 202
            Top = 263
            Width = 207
            Height = 55
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 4
            Visible = False
            object lblBaremo: TLabel
              Left = 6
              Top = 15
              Width = 78
              Height = 13
              Caption = 'Aplica BAREMO'
            end
            object rgBaremo: TRadioGroup
              Left = 92
              Top = 0
              Width = 113
              Height = 42
              Columns = 2
              Items.Strings = (
                'Si'
                'No')
              TabOrder = 0
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 318
            Width = 415
            Height = 42
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 5
            DesignSize = (
              415
              42)
            object bvSeparadorBotonesPeritaje: TBevel
              Left = 4
              Top = 5
              Width = 408
              Height = 5
              Anchors = [akLeft, akRight, akBottom]
              Shape = bsTopLine
            end
            object btnAceptarPericia: TButton
              Left = 253
              Top = 11
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Aceptar'
              TabOrder = 0
              OnClick = btnAceptarPericiaClick
            end
            object btnCancelarPericia: TButton
              Left = 331
              Top = 11
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Cancel = True
              Caption = '&Cancelar'
              ModalResult = 2
              TabOrder = 1
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 236
            Width = 415
            Height = 27
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 6
            DesignSize = (
              415
              27)
            object lbAsociarDocPericia: TLabel
              Left = 6
              Top = 6
              Width = 64
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Asociar Doc.:'
            end
            object tbArchivosPericia: TToolBar
              Left = 360
              Top = 0
              Width = 55
              Height = 26
              Align = alNone
              Anchors = [akBottom]
              BorderWidth = 1
              ButtonWidth = 25
              HotImages = dmLegales.ilColor
              Images = dmLegales.ilByN
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object tbSeleccionArchivosAsociarPericias: TToolButton
                Left = 0
                Top = 0
                Hint = 'Seleccionar Archivos'
                ImageIndex = 26
                OnClick = tbSeleccionArchivosAsociarPericiasClick
              end
              object tbAsociarDocPericias: TToolButton
                Left = 25
                Top = 0
                Hint = 'Asociar Doc.'
                Caption = 'tbAsociarDoc'
                ImageIndex = 23
                OnClick = tbAsociarDocPericiasClick
              end
            end
            object edtArchivosAsociadosPericias: TEdit
              Left = 84
              Top = 3
              Width = 275
              Height = 21
              Anchors = [akLeft, akRight, akBottom]
              Color = 16776176
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
      end
      object tsImportes: TTabSheet
        Caption = 'Importes'
        ImageIndex = 3
        TabVisible = False
        object gbImportes: TGroupBox
          Left = 0
          Top = 50
          Width = 782
          Height = 41
          Align = alTop
          Caption = 'Importes'
          TabOrder = 0
          object lbDemandado: TLabel
            Left = 54
            Top = 19
            Width = 99
            Height = 13
            Caption = 'Importe Demandado:'
          end
          object lbMontoprivilegio: TLabel
            Left = 304
            Top = 19
            Width = 89
            Height = 13
            Caption = 'Importe Sentencia:'
          end
          object Label9: TLabel
            Left = 524
            Top = 19
            Width = 126
            Height = 13
            Caption = 'Importe Recurso Extraord.:'
          end
          object edIMPORTEDEMANDADO: TCurrencyEdit
            Left = 162
            Top = 15
            Width = 92
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = 16776176
            DisplayFormat = '$,0.00;-$,0.00'
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object edIMPORTESENTENCIA: TCurrencyEdit
            Left = 399
            Top = 15
            Width = 93
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = 16776176
            DisplayFormat = '$,0.00;-$,0.00'
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object edIMPORTESRECEXTRAORD: TCurrencyEdit
            Left = 655
            Top = 15
            Width = 93
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = 16776176
            DisplayFormat = '$,0.00;-$,0.00'
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object gbReservasAsigandas: TGroupBox
          Left = 0
          Top = 0
          Width = 782
          Height = 50
          Align = alTop
          Caption = ' Reservas Asignadas'
          TabOrder = 1
          DesignSize = (
            782
            50)
          object chkReservaHonorarios: TCheckBox
            Left = 274
            Top = 18
            Width = 119
            Height = 18
            Caption = 'Reserva Honorarios:'
            TabOrder = 1
            OnClick = chkReservaHonorariosClick
          end
          object chkReservaCapital: TCheckBox
            Left = 47
            Top = 19
            Width = 101
            Height = 17
            Caption = 'Reserva Capital:'
            TabOrder = 0
            OnClick = chkReservaCapitalClick
          end
          object tbAprobacionDeReservas: TToolBar
            Left = 832
            Top = 15
            Width = 53
            Height = 26
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object tbAprobarReservas: TToolButton
              Left = 0
              Top = 0
              Hint = 'Aprobar Reservas'
              Caption = 'Aprobar Reservas'
              ImageIndex = 19
              OnClick = tbAprobarReservasClick
            end
            object tbHistoricoReservas: TToolButton
              Left = 23
              Top = 0
              Caption = 'Hist'#243'rico de Reservas'
              ImageIndex = 14
              OnClick = tbHistoricoReservasClick
            end
          end
          object ToolBar3: TToolBar
            Left = 710
            Top = 15
            Width = 64
            Height = 26
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            object tbHistoricoReserva: TToolButton
              Left = 0
              Top = 0
              Hint = 'Historico Reserva'
              ImageIndex = 14
              OnClick = tbHistoricoReservasClick
            end
            object tbCalculaReservaGestion: TToolButton
              Left = 23
              Top = 0
              Caption = 'Calcular Reserva Gesti'#243'n'
              ImageIndex = 21
            end
          end
          object chkReservaGestion: TCheckBox
            Left = 500
            Top = 18
            Width = 106
            Height = 18
            Caption = 'Reserva Gesti'#243'n:'
            TabOrder = 7
            OnClick = chkReservaGestionClick
          end
          object ceReservaCapital: TJvValidateEdit
            Left = 162
            Top = 17
            Width = 92
            Height = 21
            AutoSize = False
            Color = 16776176
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisabledColor = clSilver
            DisplayFormat = dfCurrency
            DecimalPlaces = 2
            EditText = '0,00'
            Enabled = False
            TabOrder = 3
            OnKeyPress = ceReservaCapitalKeyPress
          end
          object ceReservaHonorarios: TJvValidateEdit
            Left = 398
            Top = 17
            Width = 92
            Height = 21
            AutoSize = False
            Color = 16776176
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisabledColor = clSilver
            DisplayFormat = dfCurrency
            DecimalPlaces = 2
            EditText = '0,00'
            Enabled = False
            TabOrder = 4
            OnKeyPress = ceReservaCapitalKeyPress
          end
          object ceReservaGestion: TJvValidateEdit
            Left = 605
            Top = 17
            Width = 92
            Height = 21
            AutoSize = False
            Color = 16776176
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisabledColor = clSilver
            DisplayFormat = dfCurrency
            DecimalPlaces = 2
            EditText = '0,00'
            Enabled = False
            TabOrder = 6
            OnKeyPress = ceReservaCapitalKeyPress
          end
        end
      end
      object tsPagos: TTabSheet
        Caption = 'Pagos'
        ImageIndex = 3
        object dbgPagosEfectuados: TRxDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 97
          Align = alClient
          DataSource = dsPagoLegal
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgPagosEfectuadosDblClick
          RowColor2 = 16776176
          OnGetCellParams = dbgPagosEfectuadosGetCellParams
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
        object cbEdicionPagosEfectudos: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = tbPagos
              ImageIndex = -1
              MinHeight = 782
              Width = 776
            end>
          Visible = False
          object tbPagos: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 782
            BorderWidth = 1
            ButtonHeight = 173
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = dmLegales.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbIngresoPago: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo Pago'
              ImageIndex = 6
            end
            object tbEdicionPago: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar Pago'
              ImageIndex = 7
              OnClick = tbEdicionPagoClick
            end
            object tbEliminarPago: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar Pago'
              ImageIndex = 8
              OnClick = tbEliminarPagoClick
            end
            object tbSeparadorPagos: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbImprimirPagos: TToolButton
              Left = 77
              Top = 0
              Hint = 'Imprimir Liquidaci'#243'n de Pago'
              ImageIndex = 4
              Visible = False
              OnClick = tbImprimirPagosClick
            end
            object tbObtenerEstadoPago: TToolButton
              Left = 100
              Top = 0
              Hint = 'Obtener Estado Pago'
              Caption = 'Obtener Estado Pago'
              ImageIndex = 30
              OnClick = tbObtenerEstadoPagoClick
            end
            object tbAprobacionConceptosDuplicados: TToolButton
              Left = 123
              Top = 0
              Hint = 'Aprobaci'#243'n Conceptos Duplicados'
              Caption = 'tbAprobacionConceptosDuplicados'
              ImageIndex = 23
              OnClick = tbAprobacionConceptosDuplicadosClick
            end
            object tbseparator4: TToolButton
              Left = 146
              Top = 0
              Width = 8
              ImageIndex = 5
              Style = tbsSeparator
            end
            object pnConceptoDuplicado: TPanel
              Left = 154
              Top = 0
              Width = 127
              Height = 173
              BevelOuter = bvNone
              TabOrder = 0
              object lbConceptoDuplicado: TLabel
                Left = 24
                Top = 5
                Width = 97
                Height = 13
                Alignment = taRightJustify
                Caption = 'Concepto Duplicado'
              end
              object lbColorConceptoDuplicado: TLabel
                Left = 5
                Top = 4
                Width = 15
                Height = 15
                AutoSize = False
                Color = clGreen
                ParentColor = False
              end
            end
          end
        end
        object plTotalesPago: TPanel
          Left = 0
          Top = 126
          Width = 782
          Height = 29
          Align = alBottom
          TabOrder = 2
        end
      end
      object tsPuntosRevision: TTabSheet
        Caption = 'Puntos de Revision'
        Enabled = False
        ImageIndex = 8
        TabVisible = False
        inline fraPuntosRevisionJuicioEnTramite: TfraPuntosRevision
          Left = 0
          Top = 0
          Width = 782
          Height = 155
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 782
          ExplicitHeight = 155
          inherited nsSplitter: TJvNetscapeSplitter
            Left = 502
            Height = 126
            ExplicitLeft = 502
            ExplicitHeight = 129
          end
          inherited tlPuntosRevision: TJvTimeLine
            Width = 502
            Height = 126
            YearFont.Height = -15
            Items = <
              item
                Left = 106
                Top = 111
                Caption = 'Revisi'#243'n de Progreso'
                Color = clMoneyGreen
                Date = 38417.000000000000000000
                Hint = 'Revisi'#243'n de Progreso'
                ImageIndex = 1
              end
              item
                Left = 122
                Top = 151
                Caption = 'Revision de Prueba'
                Date = 38421.000000000000000000
                Hint = 'Revision de Prueba'
                ImageIndex = 2
                Level = 1
              end
              item
                Left = 187
                Top = 151
                Caption = 'Revisi'#243'n de Comprobantes de Contestaci'#243'n de Prueba'
                Date = 38462.000000000000000000
                Hint = 'Revisi'#243'n de Comprobantes de Contestaci'#243'n de Prueba'
                ImageIndex = 2
                Level = 2
              end>
            ExplicitWidth = 502
            ExplicitHeight = 126
            DesignSize = (
              498
              122)
          end
          inherited dbgPuntosRevision: TDBGrid
            Left = 511
            Width = 271
            Height = 126
            ReadOnly = True
            TitleFont.Name = 'MS Sans Serif'
            Columns = <
              item
                Expanded = False
                FieldName = 'EJ_DESCRIPCION'
                Title.Caption = 'Etapa'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PR_DESCRIPCION'
                Title.Caption = 'Punto Revisi'#243'n'
                Width = 145
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'JP_ID'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_IDJUICIOENTRAMITE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_IDETAPAPROCESAL'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_IDPUNTOREVISION'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_FECHATIPICA'
                Title.Caption = 'Fecha Program.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'JP_FECHALIMITE'
                Title.Caption = 'Fecha L'#237'mite'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'JP_USUALTA'
                Title.Caption = 'Usuario Alta'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_FECHAALTA'
                Title.Caption = 'Fecha Alta'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_USUMODIF'
                Title.Caption = 'Usuario Modificacion'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_FECHAMODIF'
                Title.Caption = 'Fecha Modificacion'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_USUBAJA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'JP_FECHABAJA'
                Visible = False
              end>
          end
          inherited cbPuntosRevision: TCoolBar
            Width = 782
            Bands = <
              item
                Control = fraPuntosRevisionJuicioEnTramite.tbPuntosRevisio
                ImageIndex = -1
                MinHeight = 27
                Width = 776
              end>
            ExplicitWidth = 782
            inherited tbPuntosRevisio: TToolBar
              Width = 769
              HotImages = dmLegales.ilByN
              Images = dmLegales.ilColor
              ExplicitWidth = 769
            end
          end
          inherited fpEventoSeguimiento: TFormPanel
            Left = 179
            Top = 40
            ExplicitLeft = 179
            ExplicitTop = 40
            inherited lblPuntoRevision: TLabel
              Width = 72
              ExplicitWidth = 72
            end
            inherited lblFechaProgramada: TLabel
              Width = 93
              ExplicitWidth = 93
            end
            inherited lblObservaciones: TLabel
              Width = 74
              ExplicitWidth = 74
            end
            inherited lblFechaLimite: TLabel
              Width = 65
              ExplicitWidth = 65
            end
            inherited fraEditEtapaProcesal: TfraCtbTablas
              Width = 281
              ExplicitWidth = 281
              DesignSize = (
                281
                25)
              inherited cmbDescripcion: TArtComboBox
                DataSource = nil
              end
            end
            inherited btnEditPuntoRevision: TfraCodigoDescripcion
              inherited cmbDescripcion: TArtComboBox
                DataSource = nil
              end
            end
          end
          inherited il16: TImageList
            Bitmap = {
              494C010108001C0024000E001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
              494C010109001C00240018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      object tsEmbargos: TTabSheet
        Caption = 'Embargos'
        ImageIndex = 9
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object ToolBar1: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = frmPrincipal.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbImprimirEmbargos: TToolButton
              Left = 0
              Top = 0
              Hint = 'Imprimir Embargos'
              ImageIndex = 4
              OnClick = tbImprimirEmbargosClick
            end
            object ToolButton2: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 24
              Style = tbsSeparator
            end
            object tbAplicacion: TToolButton
              Left = 31
              Top = 0
              Hint = 'Aplicaci'#243'n'
              Caption = 'tbAplicacion'
              ImageIndex = 23
              OnClick = tbAplicacionClick
            end
          end
        end
        object dbgEmbargos: TRxDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 97
          Align = alClient
          DataSource = dsEmbargos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          RowColor2 = 16776176
          OnGetCellParams = dbgEmbargosGetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'BANCO'
              Title.Caption = 'Banco'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Title.Caption = 'Cuenta'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTOEMBARGADO'
              Title.Alignment = taCenter
              Title.Caption = 'Monto Embargado'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Title.Alignment = taCenter
              Title.Caption = 'Importe Retenido'
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OFICIO'
              Title.Caption = 'Oficio'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Title.Caption = 'Estado'
              Width = 132
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'REPETIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Repetido'
              Width = 49
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA_REGULARIZADO'
              Title.Alignment = taCenter
              Title.Caption = 'F. Regularizado'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO_REGULARIZADO'
              Title.Caption = 'Motivo Regularizado'
              Width = 142
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES'
              Title.Caption = 'Observaciones'
              Width = 272
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TIPO'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHABAJA'
              Title.Alignment = taCenter
              Title.Caption = 'F. Baja'
              Width = 68
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 126
          Width = 782
          Height = 29
          Align = alBottom
          TabOrder = 2
          object lbTotalRetenido: TLabel
            Left = 312
            Top = 8
            Width = 75
            Height = 13
            Caption = 'lbTotalRetenido'
          end
          object lbTotalEmbargo: TLabel
            Left = 152
            Top = 8
            Width = 74
            Height = 13
            Caption = 'lbTotalEmbargo'
          end
        end
      end
      object tsRecursosExtraordinarios: TTabSheet
        Caption = 'Recursos Extraordinarios'
        ImageIndex = 10
        object CoolBar2: TCoolBar
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Bands = <
            item
              Control = ToolBar2
              ImageIndex = -1
              MinHeight = 27
              Width = 776
            end>
          object ToolBar2: TToolBar
            Left = 9
            Top = 0
            Width = 769
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = dmLegales.ilByN
            Images = frmPrincipal.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbImprimirRecExtraord: TToolButton
              Left = 0
              Top = 0
              Hint = 'Imprimir Recursos Extraord.'
              ImageIndex = 4
              OnClick = tbImprimirRecExtraordClick
            end
            object ToolButton3: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 24
              Style = tbsSeparator
            end
            object tbSumatoriaRecExtraord: TToolButton
              Left = 31
              Top = 0
              Hint = 'Sumatoria'
              ImageIndex = 21
              Style = tbsCheck
              Visible = False
              OnClick = tbSumatoriaRecExtraordClick
            end
            object ToolButton4: TToolButton
              Left = 54
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 25
              Style = tbsSeparator
            end
          end
        end
        object dbgRecExtraord: TArtDBGrid
          Left = 0
          Top = 29
          Width = 782
          Height = 97
          Align = alClient
          DataSource = dsRecExtraord
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FooterBand = False
          OnPaintFooter = dbgRecExtraordPaintFooter
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CONCEPTO'
              Title.Caption = 'Concepto'
              Width = 306
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Title.Alignment = taCenter
              Title.Caption = 'Importe'
              Width = 109
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha'
              Width = 74
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 126
          Width = 782
          Height = 29
          Align = alBottom
          TabOrder = 2
          object lblTotalRecursoExtra: TLabel
            Left = 222
            Top = 8
            Width = 98
            Height = 13
            Caption = 'lblTotalRecursoExtra'
          end
        end
      end
    end
  end
  object fpVerAplicaciones: TFormPanel
    Left = 522
    Top = 414
    Width = 416
    Height = 184
    Caption = 'a'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpVerAplicacionesKeyPress
    DesignSize = (
      416
      184)
    object gridAplicaciones: TArtDBGrid
      Left = 0
      Top = 0
      Width = 416
      Height = 145
      Align = alTop
      DataSource = dsAplicaciones
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Importe'
          Width = 93
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Alta'
          Width = 110
          Visible = True
        end>
    end
    object btnCerrarAplicaciones: TButton
      Left = 336
      Top = 152
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCerrarAplicacionesClick
    end
    object pnTotal: TPanel
      Left = 8
      Top = 152
      Width = 185
      Height = 24
      Caption = 'Total: $99.999'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object fpJuicioRelacionado: TFormPanel
    Left = 570
    Top = 463
    Width = 362
    Height = 79
    Caption = 'Juicio Relacionado'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsToolWindow
    Position = poMainFormCenter
    DesignSize = (
      362
      79)
    object Bevel7: TBevel
      Left = 4
      Top = 36
      Width = 352
      Height = 7
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbNroCarpetaRelacionada: TLabel
      Left = 2
      Top = 6
      Width = 93
      Height = 26
      Caption = '      Nro Carpeta '#13#10'Juicio Relacionado:'
    end
    object btnAceptarProcedencia: TButton
      Left = 197
      Top = 46
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarProcedenciaClick
    end
    object btnCancelarProcedencia: TButton
      Left = 278
      Top = 46
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraJuicioRelacionado: TfraCodigoDescripcion
      Left = 102
      Top = 5
      Width = 253
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 102
      ExplicitTop = 5
      ExplicitWidth = 253
      DesignSize = (
        253
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 200
        DataSource = nil
        ExplicitLeft = 53
        ExplicitWidth = 200
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        MaxLength = 8
        Pattern = '0123456789'
        ExplicitWidth = 50
      end
    end
  end
  object pnAprobacionConDup: TFormPanel
    Left = 548
    Top = 454
    Width = 423
    Height = 141
    Caption = 'Aprobaci'#243'n de Conceptos Duplicados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      423
      141)
    object lbMotivo: TLabel
      Left = 10
      Top = 55
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarAprobConDup: TButton
      Left = 266
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarAprobConDupClick
    end
    object btnCancelarAprobConDup: TButton
      Left = 344
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object gbAprobacion: TGroupBox
      Left = 120
      Top = 4
      Width = 185
      Height = 41
      TabOrder = 2
      object cbAprobadoConDup: TCheckBox
        Left = 16
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Aprobado'
        TabOrder = 0
        OnClick = cbAprobadoConDupClick
      end
      object cbRechazadoConDup: TCheckBox
        Left = 96
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Rechazado'
        TabOrder = 1
        OnClick = cbRechazadoConDupClick
      end
    end
    object edMotivo: TMemo
      Left = 56
      Top = 50
      Width = 361
      Height = 57
      MaxLength = 400
      TabOrder = 3
    end
  end
  object EnterAsTab: TJvEnterAsTab
    Left = 632
    Top = 314
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    OnDisableComponent = SeguridadDisableComponent
    PermitirEdicion = False
    Left = 422
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'SortDialogEvento.SortFields')
    StoredValues = <>
    Left = 445
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbGuardar
      end
      item
        Key = 16460
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
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16468
      end>
    Left = 349
  end
  object odAbrirArchivo: TOpenDialog
    Title = 'x'
    Left = 474
  end
  object AlarmaEventos: TJvTFAlarm
    ScheduleManager = Schedule
    Left = 720
    Top = 553
  end
  object Schedule: TJvTFScheduleManager
    OnRefreshAppt = ScheduleRefreshAppt
    OnPostAppt = SchedulePostAppt
    OnDeleteAppt = ScheduleDeleteAppt
    StateImages = iStates
    CustomImages = imCustom
    StateImageMap.AlarmEnabled = 0
    StateImageMap.AlarmDisabled = 1
    StateImageMap.Shared = -1
    StateImageMap.Recurring = -1
    StateImageMap.Modified = -1
    OnLoadBatch = ScheduleLoadBatch
    SchedLoadMode = slmBatch
    Left = 748
    Top = 553
  end
  object sdqIntervencionesAnteriores: TSDQuery
    Options = []
    Left = 635
    Top = 551
  end
  object sdqFuncionariosJuzgado: TSDQuery
    Options = []
    Left = 663
    Top = 551
  end
  object imCustom: TImageList
    Left = 803
    Top = 553
  end
  object sdqUpdApptQuery: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE legales.lja_juicioentramiteagenda a'
      '   SET ja_idnrojuicio = :ja_idnrojuicio,'
      '       ja_fechainicio = :ja_fechainicio,'
      '       ja_fechafin = :ja_fechafin,'
      '       ja_descripcionevento = :ja_descripcionevento,'
      '       ja_alarmaactivada = :ja_alarmaactivada,'
      '       ja_alarma = :ja_alarma,'
      '       ja_completado = :ja_completado,'
      '       ja_resultadoevento = :ja_resultadoevento,'
      '       ja_idtipotarea = :ja_idtipotarea,'
      '       ja_idhecho = :ja_idhecho,'
      '       ja_usumodif = :ja_usumodif,'
      '       ja_fechamodif = :ja_fechamodif'
      'where'
      '       ja_appid = :ja_appid')
    InsertSQL.Strings = (
      'INSERT  INTO legales.lja_juicioentramiteagenda'
      '            (ja_id, ja_idnrojuicio, ja_fechainicio, ja_fechafin,'
      '             ja_descripcionevento, ja_alarmaactivada, ja_alarma,'
      '             ja_completado, ja_resultadoevento, ja_idtipotarea,'
      '             ja_idhecho, ja_appid, ja_usualta, ja_fechaalta'
      '            )'
      
        '     VALUES (:ja_id, :ja_idnrojuicio, :ja_fechainicio, :ja_fecha' +
        'fin,'
      
        '             :ja_descripcionevento, :ja_alarmaactivada, :ja_alar' +
        'ma,'
      
        '             :ja_completado, :ja_resultadoevento, :ja_idtipotare' +
        'a,'
      '             :ja_idhecho, :ja_appid, :ja_usualta, :ja_fechaalta'
      '            )')
    Left = 520
    Top = 551
  end
  object sdqGetApptQuery: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'select * from legales.lja_juicioentramiteagenda where ja_appid =' +
        ' :appid')
    UpdateObject = sdqUpdApptQuery
    Left = 492
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'appid'
        ParamType = ptInput
      end>
  end
  object iStates: TImageList
    Left = 779
    Top = 553
    Bitmap = {
      494C010102001800200010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object sdqEventoJuicioEnTramite: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT et_id, et_fechaevento, et_observaciones, et_respuesta, et' +
        '_fechavencimiento, et_idtipoevento, lte_tipoevento.te_descripcio' +
        'n,'
      '       et_fechabaja, NVL((SELECT DISTINCT '#39'S'#39
      
        '                                     FROM legales.lea_eventoarch' +
        'ivoasociado'
      
        '                                    WHERE ea_ideventojuicioentra' +
        'mite = et_id'
      
        '                                      AND ea_fechabaja IS NULL),' +
        ' '#39'N'#39') tieneadjunto'
      '  FROM legales.let_eventojuicioentramite, legales.lte_tipoevento'
      ' WHERE (et_idtipoevento = lte_tipoevento.te_id)'
      '   AND et_idjuicioentramite = :idjuicioentramite')
    Left = 548
    Top = 551
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end>
  end
  object dsEventoJuicioEnTramite: TDataSource
    DataSet = sdqEventoJuicioEnTramite
    Left = 548
    Top = 580
  end
  object sdqOrigenDemanda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
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
      '       od_prescertificadosmedicos,OD_FECHANACIMIENTO'
      
        '  FROM legales.lod_origendemanda, legales.lre_reclamante, legale' +
        's.lbo_abogado'
      ' WHERE od_idreclamante = lre_reclamante.re_id'
      '   AND od_idabogado = lbo_abogado.bo_id(+)'
      '   AND od_idjuicioentramite = :idjuicioentramite')
    Left = 608
    Top = 551
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsOrigenDemanda: TDataSource
    DataSet = sdqOrigenDemanda
    Left = 608
    Top = 579
  end
  object sdqTareas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT  JA_FECHAINICIO, JA_FECHAFIN, JA_ID, JA_IDNROJUICIO,'
      '        JA_DESCRIPCIONEVENTO, JA_ALARMAACTIVADA,'
      
        '        JA_ALARMA, JA_RESULTADOEVENTO, JA_IDTIPOTAREA, JA_IDHECH' +
        'O, JA_COMPLETADO, JA_APPID'
      'FROM LEGALES.LJA_JUICIOENTRAMITEAGENDA A'
      
        'WHERE ( (JA_FECHAINICIO >= :FechaDesde) AND (JA_FECHAFIN < (:Fec' +
        'haHasta + 1)) )'
      'and JA_IDNROJUICIO = :IdJuicioEnTramite'
      'and ja_fechabaja is null')
    Left = 579
    Top = 551
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FechaHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IdJuicioEnTramite'
        ParamType = ptInput
      end>
  end
  object sdqPericiasJuicios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT lpj.pj_id, lpj.pj_idperito, lpj.pj_fechanotificacion,'
      
        '       lpj.pj_fechaperitaje, lpj.pj_resultadoperitaje, lpj.pj_fe' +
        'chaalta,'
      
        '       lpj.pj_usualta, lpj.pj_fechamodif, lpj.pj_usumodif, lpj.p' +
        'j_fechabaja,'
      
        '       lpj.pj_usubaja, ltp.tp_descripcion, lpj.pj_descripcionper' +
        'icia,'
      '       DECODE (pj_tipopericia,'
      '               '#39'C'#39', '#39'Consentir'#39','
      '               '#39'I'#39', '#39'Inpugnar'#39
      '              ) pj_tipopericia,'
      '       lpj.pj_iddesignacion, lpj.pj_idtipopericia,'
      '       lpj.pj_fechavencimpugnacion, lpj.pj_incapacidaddemanda,'
      
        '       lpj.pj_incapacidadperitomedico, lpj.pj_ibmart, lpj.pj_ibm' +
        'pericial,'
      '       lpj.pj_impugnacion,PJ_COMPLETAESTUDIO,'
      
        '       DECODE (lpj.pj_impugnacion, '#39'S'#39', 0, '#39'N'#39', 1, -1) AS impugn' +
        'acion,'
      '       DECODE (lpj.pj_baremo, '#39'S'#39', 0, '#39'N'#39', 1, -1) AS baremo, '
      '       pj_baremo'
      
        '  FROM legales.lpj_peritajejuicio lpj, legales.ltp_tipopericia l' +
        'tp'
      ' WHERE lpj.pj_idtipopericia = ltp.tp_id(+)'
      '   AND lpj.pj_idjuicioentramite = :idjuicioentramite')
    Left = 464
    Top = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end>
  end
  object dsPericiasJuicios: TDataSource
    DataSet = sdqPericiasJuicios
    Left = 466
    Top = 580
  end
  object sdqPagoLegal: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqPagoLegalAfterScroll
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
      
        '              '#39#39') estado,pl_idintereses,pl_fechaaprobacion, pl_u' +
        'suaprobacion,'
      '       pl_duplicado, pl_estadoduplicidad, pl_motivoaprobacion, '
      
        '       DECODE(PL_ESTADODUPLICIDAD, '#39'A'#39', '#39'Aprobado'#39', '#39'R'#39', '#39'Rechaz' +
        'ado'#39', '#39#39') AS estadoduplicado,'
      '       pl_idliquidacion  '
      
        '  FROM rce_chequeemitido, legales.lpl_pagolegal lpl, legales.lbp' +
        '_beneficiariopago lbp,'
      '       art.scp_conpago scp, legales.lto_tipooperacion lto'
      ' WHERE (    (lpl.pl_idbeneficiariopago = lbp.bp_id(+))'
      '        AND (lpl.pl_conpago = scp.cp_conpago)'
      '        AND (lpl.pl_idtipooperacion = lto.to_id(+)))'
      '        AND lpl.pl_idjuicioentramite = :idjuicioentramite'
      '        AND ce_id(+) = pl_idchequeemitido')
    UpdateObject = sduPagoLegal
    Left = 381
    Top = 551
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsPagoLegal: TDataSource
    DataSet = sdqPagoLegal
    Left = 382
    Top = 579
  end
  object pmSeguimientoJuicios: TPopupMenu
    Left = 503
    Top = 65535
    object ImprimirExpediente1: TMenuItem
      Caption = '&Expediente'
    end
    object mnuLiquidacion: TMenuItem
      Caption = '&Liquidaci'#243'n'
    end
    object EvolucindeInstancias1: TMenuItem
      Caption = 'Instancias'
    end
    object mnuEventos: TMenuItem
      Caption = 'Eventos'
    end
    object mnuAgenda: TMenuItem
      Caption = 'Agenda'
    end
  end
  object sdqArchivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT'
      '  ea_descripcion, ea_patharchivo, ea_id'
      '  FROM legales.lea_eventoarchivoasociado'
      ' WHERE ea_ideventojuicioentramite = :IdEventoJuicioEnTramite'
      ' and ea_fechabaja is null'
      '')
    Left = 691
    Top = 551
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdEventoJuicioEnTramite'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqArchivosAsociados
    Left = 691
    Top = 580
  end
  object sduPagoLegal: TSDUpdateSQL
    Left = 348
    Top = 550
  end
  object sdqDictamenAcusatorio: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT sja_JuiciosAcusatorios.*,'
      '       '#39'Dictamen: '#39' || sja.ja_nrodictamen ||'
      '       '#39' Expediente SRT: '#39' || sja.ja_expedientesrt  ||'
      '       '#39' Motivo: '#39' || motivos.tb_descripcion  ||'
      '       '#39' Infracci'#243'n: '#39'  || infracciones.tb_descripcion Dictamen'
      '  FROM sja_juiciosacusatorios sja,'
      '       ctb_tablas areas,'
      '       ctb_tablas motivos,'
      '       ctb_tablas infracciones,'
      '       ctb_tablas estados,'
      '       legales.lbo_abogado'
      ' WHERE (    (sja.ja_abogado = lbo_abogado.bo_id)'
      '        AND (sja.ja_area = areas.tb_codigo(+))'
      '        AND (sja.ja_motivo = motivos.tb_codigo(+))'
      '        AND (sja.ja_tema = infracciones.tb_codigo(+))'
      '        AND (sja.ja_estado = estados.tb_codigo(+))'
      '        AND (areas.tb_clave = '#39'AREAD'#39')'
      '        AND (motivos.tb_clave = '#39'MOACU'#39')'
      '        AND (infracciones.tb_clave = '#39'TEACU'#39')'
      '        AND (estados.tb_clave = '#39'LGEST'#39')'
      '       ) AND sja.ja_nrodictamen = :NRODICTAMEN'
      '')
    Left = 396
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRODICTAMEN'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object cdsArchivosAsociados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PATHARCHIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 757
    Top = 497
    Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F000B444553
      4352495043494F4E01004900000001000557494454480200020064000B504154
      484152434849564F010049000000010005574944544802000200640002494404
      0001000000000005535441544501004900000001000557494454480200020001
      000000}
  end
  object dsEmbargos: TDataSource
    DataSet = sdqEmbargos
    Left = 310
    Top = 579
  end
  object sdqEmbargos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEmbargosAfterOpen
    SQL.Strings = (
      
        'SELECT   ba_nombre banco, cb_numero cuenta, em_importe importe, ' +
        'em_fecha fecha, em_oficio oficio, ee_descripcion estado,'
      
        '         em_repetido repetido, em_fecharegularizado fecha_regula' +
        'rizado, re_descripcion motivo_regularizado,'
      
        '         em_observaciones observaciones, TRUNC(em_fechabaja) fec' +
        'habaja, em_id, em_montoembargado montoembargado,'
      '         em_tipo tipo'
      
        '    FROM zba_banco, zcb_cuentabancaria, lre_regularizacionembarg' +
        'o, lee_estadoembargo, lem_embargo'
      '   WHERE ee_id = em_idestado'
      '     AND cb_id(+) = em_idcuentabancaria'
      '     AND ba_id(+) = cb_idbanco'
      '     AND re_id(+) = em_idregularizado'
      '     AND em_idjuicio = :idjuicio'
      'ORDER BY em_fecha'
      '')
    Left = 310
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicio'
        ParamType = ptInput
      end>
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Embargos'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 56
    Top = 468
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 83
    Top = 469
  end
  object sdqAplicaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEmbargosAfterOpen
    SQL.Strings = (
      
        'SELECT ta_descripcion tipo, ae_importe importe, TRUNC(ae_fechaal' +
        'ta) fecha'
      '  FROM lta_tipoaplicacionembargo, lae_aplicacionembargo'
      ' WHERE ta_id = ae_idtipoaplicacion'
      '   AND ae_fechabaja IS NULL'
      '   AND ae_idembargo = :idembargo')
    Left = 270
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idembargo'
        ParamType = ptInput
      end>
  end
  object dsAplicaciones: TDataSource
    DataSet = sdqAplicaciones
    Left = 270
    Top = 579
  end
  object dsRecExtraord: TDataSource
    DataSet = sdqRecExtraord
    Left = 241
    Top = 579
  end
  object sdqRecExtraord: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRecExtraordAfterOpen
    SQL.Strings = (
      
        '  SELECT tr_descripcion concepto, tr_operacion*ar_importe import' +
        'e, trunc(ar_fechaalta) fecha'
      '    FROM ltr_tipoaplicacionrecext, lar_aplicacionrecursoext'
      '   WHERE tr_id = ar_idtipoaplicacion'
      '     AND ar_fechabaja is null'
      '     AND ar_idjuicio = :idjuicio'
      'ORDER BY ar_fechaalta'
      ''
      ''
      '')
    Left = 241
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicio'
        ParamType = ptInput
      end>
  end
  object QueryPrintRecExtraord: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Recursos Extraordinarios'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Left = 112
    Top = 468
  end
  object SortDialogEvento: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEventoJuicioEnTramite
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 545
    Top = 613
  end
  object cdsArchivosAsociadosPericias: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PATHARCHIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 789
    Top = 497
    Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F000B444553
      4352495043494F4E01004900000001000557494454480200020064000B504154
      484152434849564F010049000000010005574944544802000200640002494404
      0001000000000005535441544501004900000001000557494454480200020001
      000000}
  end
  object sdqArchivosAsociadosPericias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT pa_descripcion, pa_patharchivo, pa_id'
      '  FROM legales.lpa_periciaarchivoasociado'
      ' WHERE pa_idpericias = :idpericias'
      '   AND pa_fechabaja IS NULL')
    Left = 835
    Top = 551
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpericias'
        ParamType = ptInput
      end>
  end
  object dsArchivosAsociadosPericias: TDataSource
    DataSet = sdqArchivosAsociadosPericias
    Left = 835
    Top = 580
  end
end
