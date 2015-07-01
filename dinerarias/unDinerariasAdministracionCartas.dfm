inherited frmDinerariasAdministracionCartas: TfrmDinerariasAdministracionCartas
  Left = 388
  Top = 190
  Caption = 'Administraci'#243'n de Cartas Documento'
  ClientHeight = 510
  ClientWidth = 770
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  ExplicitLeft = 388
  ExplicitTop = 190
  ExplicitWidth = 778
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 770
    ExplicitWidth = 816
    inherited pcFiltros: TPageControl
      Width = 831
      ExplicitWidth = 877
      inherited tsFiltros0: TTabSheet
        ExplicitWidth = 823
        inherited gbDelegacion: TGroupBox
          Left = 684
          Width = 78
          ExplicitLeft = 684
          ExplicitWidth = 100
          inherited cmbDelegacion: TDBCheckCombo
            Width = 68
            ExplicitWidth = 90
          end
        end
        inherited gbCorreoImpresion: TGroupBox
          Left = 0
          Top = 130
          ExplicitLeft = 0
          ExplicitTop = 130
          inherited fraCorreo: TfraStaticCTB_TABLAS
            inherited cmbDescripcion: TComboGrid
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
        inherited gbCodigoNoRecepcion: TGroupBox
          Width = 264
          ExplicitWidth = 264
          inherited cmbCodigosNoRecepcion: TCheckCombo
            Width = 254
            ExplicitWidth = 254
          end
        end
        inherited gbCodigoTexto: TGroupBox
          Width = 264
          ExplicitWidth = 286
          inherited fraCodTexto: TfraStaticCodigoDescripcion
            Width = 267
            ExplicitWidth = 289
            inherited cmbDescripcion: TComboGrid
              Width = 204
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
        end
        inherited gbCodigoFirmante: TGroupBox
          inherited fraCodFirmante: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Width = 163
              ExplicitWidth = 163
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
        inherited gbUsuarioImpresion: TGroupBox
          Left = 202
          Width = 216
          ExplicitLeft = 202
          ExplicitWidth = 216
          inherited cmbUsuImpresion: TDBCheckCombo
            Width = 203
            ExplicitWidth = 203
          end
        end
        inherited gbUsuarioReimpresion: TGroupBox
          Width = 341
          ExplicitWidth = 363
          inherited cmbUsuReimpresion: TDBCheckCombo
            Width = 341
            ExplicitWidth = 363
          end
        end
        inherited gbArea: TGroupBox
          inherited fraArea: TfraStaticCodigoDescripcion
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
        object gbGrupoTrab: TGroupBox
          Left = 333
          Top = -1
          Width = 349
          Height = 43
          Caption = 'Grupo Trabajo'
          TabOrder = 12
          DesignSize = (
            349
            43)
          inline fraGrupoTrabajo: TfraGrupoTrabajo
            Left = 6
            Top = 14
            Width = 336
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 6
            ExplicitTop = 14
            ExplicitWidth = 336
            ExplicitHeight = 25
            DesignSize = (
              336
              25)
            inherited lblGestor: TLabel
              Left = 165
              ExplicitLeft = 165
            end
            inherited edCodigo: TPatternEdit
              TabOrder = 1
            end
            inherited cmbGestor: TArtComboBox
              Left = 201
              DataSource = nil
              ExplicitLeft = 201
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 111
              TabOrder = 0
              DataSource = nil
              ExplicitWidth = 111
            end
          end
        end
      end
      inherited tsFiltros1: TTabSheet
        Constraints.MinWidth = 823
        inherited gbFormulario: TGroupBox
          Left = 127
          Width = 518
          ExplicitLeft = 127
          ExplicitWidth = 564
          DesignSize = (
            518
            46)
          inline fraEmpresaDeudora: TfraEmpresa
            Left = 8
            Top = 16
            Width = 503
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
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 503
            ExplicitHeight = 21
            DesignSize = (
              503
              21)
            inherited lbContrato: TLabel
              Left = 399
              ExplicitLeft = 445
            end
            inherited edContrato: TIntEdit
              Left = 446
              ExplicitLeft = 446
            end
            inherited cmbRSocial: TArtComboBox
              Width = 264
              DataSource = nil
              ExplicitWidth = 264
            end
          end
        end
        inherited gbFechaImpresion: TGroupBox
          Width = 190
          ExplicitWidth = 190
          inherited Label2: TLabel
            Left = 91
            Width = 8
            Caption = '>'
            ExplicitLeft = 91
            ExplicitWidth = 8
          end
          inherited edFechaImpresionHasta: TDateComboBox
            Left = 100
            ExplicitLeft = 100
          end
        end
        inherited gbFechaReimpresion: TGroupBox
          Left = 193
          Width = 188
          ExplicitLeft = 193
          ExplicitWidth = 188
          inherited Label4: TLabel
            Left = 91
            Width = 8
            Caption = '>'
            ExplicitLeft = 91
            ExplicitWidth = 8
          end
          inherited edFechaReImpresionHasta: TDateComboBox
            Left = 99
            ExplicitLeft = 99
          end
        end
        inherited gbFechaRecepcion: TGroupBox
          Left = 381
          Width = 190
          ExplicitLeft = 381
          ExplicitWidth = 190
          inherited Label3: TLabel
            Left = 91
            Width = 8
            Caption = '>'
            ExplicitLeft = 91
            ExplicitWidth = 8
          end
          inherited edFechaRecepcionHasta: TDateComboBox
            Left = 100
            ExplicitLeft = 100
          end
        end
        inherited gbPendientes: TGroupBox
          Width = 574
          ExplicitWidth = 574
          inherited chkPendienteReemplazo: TCheckBox
            Top = 10
            Width = 75
            Height = 28
            ExplicitTop = 10
            ExplicitWidth = 75
            ExplicitHeight = 28
          end
        end
        inherited gbFechaAlta: TGroupBox
          Left = 571
          Width = 191
          ExplicitLeft = 571
          ExplicitWidth = 191
          inherited Label5: TLabel
            Left = 91
            Width = 8
            Caption = '>'
            ExplicitLeft = 91
            ExplicitWidth = 8
          end
          inherited edFechaAltaHasta: TDateComboBox
            Left = 100
            ExplicitLeft = 100
          end
        end
        inherited gbUsuarioAlta: TGroupBox
          Left = 300
          Width = 347
          ExplicitLeft = 300
          ExplicitWidth = 393
          inherited cmbUsuAlta: TDBCheckCombo
            Width = 326
            ExplicitWidth = 372
          end
        end
        inherited gbTrackTrace: TGroupBox
          Left = 649
          ExplicitLeft = 695
        end
        inherited gbCartaConNroLote: TGroupBox
          Left = 579
          TabOrder = 12
          ExplicitLeft = 579
        end
        object GroupBox1: TGroupBox
          Left = 649
          Top = -1
          Width = 114
          Height = 46
          Anchors = [akTop, akRight, akBottom]
          Caption = '&Siniestro'
          TabOrder = 10
          object edSiniestro: TSinEdit
            Left = 4
            Top = 17
            Width = 104
            Height = 21
            TabOrder = 0
          end
        end
        object gbSiniestro: TGroupBox
          Left = 127
          Top = 45
          Width = 170
          Height = 47
          Caption = '&Rango de Siniestros'
          TabOrder = 11
          object lbSiniestros: TLabel
            Left = 78
            Top = 20
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Serif'
            Font.Style = []
            ParentFont = False
          end
          object SinDesde: TSinEdit
            Left = 5
            Top = 16
            Width = 73
            Height = 21
            TabOrder = 0
            ViewStyle = [etSiniestro]
          end
          object SinHasta: TSinEdit
            Left = 92
            Top = 16
            Width = 73
            Height = 21
            TabOrder = 1
            ViewStyle = [etSiniestro]
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 770
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 766
      end>
    ExplicitWidth = 770
    inherited ToolBar: TToolBar
      Width = 757
      ButtonHeight = 32
      ButtonWidth = 29
      ExplicitWidth = 757
      inherited tbRefrescar: TToolButton
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton5: TToolButton
        Left = 29
        ExplicitLeft = 29
        ExplicitHeight = 32
      end
      inherited tbNuevo: TToolButton
        Left = 37
        OnClick = tbNuevoClick
        ExplicitLeft = 37
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbModificar: TToolButton
        Left = 66
        ExplicitLeft = 66
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbEliminar: TToolButton
        Left = 95
        ExplicitLeft = 95
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton4: TToolButton
        Left = 124
        ExplicitLeft = 124
        ExplicitHeight = 32
      end
      inherited tbPropiedades: TToolButton
        Left = 132
        ExplicitLeft = 132
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton3: TToolButton
        Left = 161
        ExplicitLeft = 161
        ExplicitHeight = 32
      end
      inherited tbLimpiar: TToolButton
        Left = 169
        ExplicitLeft = 169
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbOrdenar: TToolButton
        Left = 198
        ExplicitLeft = 198
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 227
        ExplicitLeft = 227
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton6: TToolButton
        Left = 256
        ExplicitLeft = 256
        ExplicitHeight = 32
      end
      inherited tbImprimir: TToolButton
        Left = 264
        ExplicitLeft = 264
        ExplicitWidth = 44
        ExplicitHeight = 32
      end
      inherited tbExportar: TToolButton
        Left = 308
        ExplicitLeft = 308
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbEnviarMail: TToolButton
        Left = 337
        ExplicitLeft = 337
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton8: TToolButton
        Left = 366
        ExplicitLeft = 366
        ExplicitHeight = 32
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 374
        ExplicitLeft = 374
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbMaxRegistros: TToolButton
        Left = 403
        ExplicitLeft = 403
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton11: TToolButton
        Left = 432
        ExplicitLeft = 432
        ExplicitHeight = 32
      end
      inherited tbSalir: TToolButton
        Left = 440
        ExplicitLeft = 440
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbRecepcion: TToolButton
        Left = 469
        ExplicitLeft = 469
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbRecepcionMasiva: TToolButton
        Left = 498
        ExplicitLeft = 498
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbReemplazo: TToolButton
        Left = 527
        ExplicitLeft = 527
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbTrackTrace: TToolButton
        Left = 556
        ExplicitLeft = 556
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton2: TToolButton
        Left = 585
        ExplicitLeft = 585
        ExplicitHeight = 32
      end
      inherited tbSalir2: TToolButton
        Left = 593
        ExplicitLeft = 593
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      object tbSeguimiento: TToolButton
        Left = 622
        Top = 0
        Hint = 'Seguimiento de Cartas Documento'
        ImageIndex = 35
        OnClick = tbSeguimientoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 770
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'siniestro'
        Title.Caption = 'Siniestro'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Trabajador'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NROCARTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carta'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Raz'#243'n Social'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_idformulario'
        Title.Alignment = taCenter
        Title.Caption = 'Formulario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TIPOCARTA'
        Title.Caption = 'Tipo Carta'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTCORREO'
        Title.Caption = 'Ultimo Correo'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUIMPRESION'
        Title.Caption = 'Usuario Impresi'#243'n'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUREIMPRESION'
        Title.Caption = 'Usuario Reimpresion'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RECEPCIONOK'
        Title.Alignment = taCenter
        Title.Caption = 'Recepci'#243'n Ok'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RECEPCION'
        Title.Caption = 'Descripci'#243'n Recepci'#243'n'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVRECEPCION'
        Title.Caption = 'Obs. recepci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_FIRMANTE'
        Title.Caption = 'Firmante'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUREIMPRESION'
        Title.Caption = 'Usuario Reimpresi'#243'n'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAREIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Reimpresi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 346
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PORCVARIABLE'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Variable'
        Width = 72
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SUMAFIJA'
        Title.Alignment = taCenter
        Title.Caption = 'Suma Fija'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRACKYTRACE_REND'
        Title.Caption = 'Track & Trace Rendici'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRACKYTRACE_IMPOS'
        Title.Caption = 'Track & Trace Imposici'#243'n'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_IDAVALDIGITAL'
        Title.Alignment = taCenter
        Title.Caption = 'Aval firma'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_VENTANILLA'
        Title.Alignment = taCenter
        Title.Caption = 'Ventanilla'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otrodestinatariocarta'
        Title.Caption = 'Otro Destinatario Carta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gtrabajo'
        Title.Caption = 'G. Trabajo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usugestor'
        Title.Caption = 'Gestor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_incluirenremito'
        Title.Caption = 'Remito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_idremito'
        Title.Caption = 'Nro. remito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_idremitoreimpresion'
        Title.Caption = 'Remito reimp.'
        Visible = True
      end>
  end
  inherited fpReemplazar: TFormPanel
    Left = 553
    Top = 184
    ExplicitLeft = 553
    ExplicitTop = 184
  end
  inherited fpFirmanteIncapacidades: TFormPanel
    Left = 591
    Top = 409
    ExplicitLeft = 591
    ExplicitTop = 409
  end
  inherited fpRecepcionCartaDoc: TFormPanel
    Left = 698
    Top = 312
    ExplicitLeft = 698
    ExplicitTop = 312
  end
  inherited fpDigitalizar: TFormPanel
    Left = 484
    Top = 408
    ExplicitLeft = 484
    ExplicitTop = 408
  end
  inherited fpOpcionesImpresion: TFormPanel
    Left = 190
    Top = 382
    ExplicitLeft = 190
    ExplicitTop = 382
    inherited btnAceptarImpresion: TButton
      Top = 130
      ExplicitTop = 130
    end
    inherited btnCancelarImpresion: TButton
      OnClick = btnCancelarImpresionClick
    end
    inherited rbImprimir: TRadioButton
      Top = 22
      Width = 122
      ExplicitTop = 22
      ExplicitWidth = 122
    end
    inherited BarProgreso: TProgressBar
      TabOrder = 9
    end
    object GroupBox3: TGroupBox
      Left = 129
      Top = 1
      Width = 120
      Height = 40
      TabOrder = 8
      object rbFirmanteOrig: TRadioButton
        Left = 11
        Top = 6
        Width = 98
        Height = 17
        Caption = 'Firmante original'
        TabOrder = 0
      end
      object rbFirmanteActual: TRadioButton
        Left = 11
        Top = 24
        Width = 98
        Height = 14
        Caption = 'Firmante actual'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
  end
  inherited pnlBottomCartas: TPanel
    Top = 481
    Width = 770
    ExplicitTop = 549
    ExplicitWidth = 816
    inherited pnlRemito: TPanel
      Left = 650
      ExplicitLeft = 696
    end
  end
  inherited fpGenerarRemito: TFormPanel
    Left = 178
    Top = 304
    ExplicitLeft = 178
    ExplicitTop = 304
  end
  object fpSeguimiento: TFormPanel [11]
    Left = 900
    Top = 44
    Width = 480
    Height = 400
    Caption = 'Seguimiento de la Carta Documento xxx'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    KeyPreview = True
    Constraints.MaxHeight = 600
    Constraints.MinHeight = 240
    Constraints.MinWidth = 480
    object Splitter1: TSplitter
      Left = 0
      Top = 137
      Width = 480
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 480
      Height = 137
      Align = alTop
      Caption = 'Panel1'
      Constraints.MinHeight = 120
      TabOrder = 0
      object gridSeguimiento1: TArtDBGrid
        Left = 1
        Top = 1
        Width = 478
        Height = 135
        Align = alClient
        DataSource = dsSeguimiento1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GridKeyDown
        OnKeyUp = GridKeyUp
        IniStorage = FormStorage
        MultiSelect = True
        OnGetCellParams = GridGetCellParams
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 140
      Width = 480
      Height = 219
      Align = alClient
      Caption = 'Panel2'
      Constraints.MinHeight = 120
      TabOrder = 1
      object gridSeguimiento2: TArtDBGrid
        Left = 1
        Top = 1
        Width = 478
        Height = 217
        Align = alClient
        DataSource = dsSeguimiento2
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GridKeyDown
        OnKeyUp = GridKeyUp
        IniStorage = FormStorage
        MultiSelect = True
        OnGetCellParams = GridGetCellParams
        FooterBand = False
        TitleHeight = 17
        AutoTitleHeight = True
      end
    end
    object pnButtons: TPanel
      Left = 0
      Top = 359
      Width = 480
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnCerrar: TButton
        Left = 600
        Top = 8
        Width = 72
        Height = 25
        Cancel = True
        Caption = 'Cerrar'
        ModalResult = 2
        TabOrder = 0
      end
    end
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
  end
  inherited dsUsuImpresion: TDataSource
    Left = 102
    Top = 247
  end
  inherited sdqUsuImpresion: TSDQuery
    Left = 74
    Top = 247
  end
  inherited dsDelegacion: TDataSource
    Left = 716
  end
  inherited sdqDelegacion: TSDQuery
    Left = 688
  end
  inherited sdqModulo: TSDQuery
    Top = 164
  end
  inherited dsModulo: TDataSource
    Top = 164
  end
  inherited ShortCutControlHijo: TShortCutControl
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 76
    Top = 392
  end
  object ShortCutControlHijo2: TShortCutControl
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
    Left = 100
    Top = 304
  end
  object sdqSeguimiento1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT cr_nrocartadoc AS nro_carta_doc, cr_codigobarras_cd AS tr' +
        'ake_trace, cr_pieza AS pieza, cr_fechaalta AS fecha_alta'
      '  FROM ccr_cab_recepcioncartadoc'
      ' WHERE cr_idcarta = :idcarta')
    Left = 28
    Top = 466
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcarta'
        ParamType = ptInput
      end>
  end
  object dsSeguimiento1: TDataSource
    DataSet = sdqSeguimiento1
    Left = 56
    Top = 466
  end
  object sdqSeguimiento2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT rc_lote AS lote, rc_codigobarras_cd AS trake_trace, rc_re' +
        'ceptor AS receptor, rc_nroplanilla1 AS ctp_planilla,'
      
        '       rc_nroplanilla2 AS nro_planilla, rc_fechahora_planilla AS' +
        ' fecha_planilla, rc_acuerdo AS acuerdo_art, rc_estado AS estado,'
      
        '       rc_desc_estado AS desc_estado, rc_fecha_ent AS fecha, rc_' +
        'hora_ent AS hora, rc_cod_ent AS cod_entrega,'
      
        '       rc_desc_ent AS desc_entrega, rc_posee_ar AS posee_ar, rc_' +
        'devolucion AS tiene_devolucion,'
      
        '       rc_cp_devolucion AS cp_devolucion, rc_devolucion_planilla' +
        ' AS dire_devolucion, rc_nrocartadoc AS nro_carta_doc,'
      '       rc_usualta AS usuario_alta'
      '  FROM crc_recepcioncartadoc'
      ' WHERE rc_idcarta = :idcarta')
    Left = 28
    Top = 506
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcarta'
        ParamType = ptInput
      end>
  end
  object dsSeguimiento2: TDataSource
    DataSet = sdqSeguimiento2
    Left = 56
    Top = 506
  end
end
