inherited frmCobAdministracionCartas: TfrmCobAdministracionCartas
  Left = 251
  Top = 190
  Caption = 'Administraci'#243'n de Cartas de Cobranzas'
  ClientHeight = 550
  ClientWidth = 865
  ExplicitLeft = 251
  ExplicitTop = 190
  ExplicitWidth = 873
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 865
    ExplicitWidth = 865
    DesignSize = (
      865
      219)
    inherited pcFiltros: TPageControl
      Width = 1016
      Constraints.MinWidth = 758
      TabStop = False
      ExplicitWidth = 1016
      inherited tsFiltros0: TTabSheet
        ExplicitWidth = 1008
        DesignSize = (
          1008
          187)
        inherited gbNroCartaDoc: TGroupBox
          inherited Label1: TLabel
            Left = 102
            ExplicitLeft = 102
          end
        end
        inherited gbDelegacion: TGroupBox
          Width = 358
          ExplicitWidth = 1413
          DesignSize = (
            358
            43)
          inherited cmbDelegacion: TDBCheckCombo
            Width = 348
            ExplicitWidth = 1403
          end
        end
        inherited gbCorreoImpresion: TGroupBox
          inherited fraCorreo: TfraStaticCTB_TABLAS
            Width = 182
            ExplicitWidth = 182
            DesignSize = (
              182
              27)
            inherited cmbDescripcion: TComboGrid
              Width = 118
              ExplicitWidth = 118
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
          Left = 493
          Width = 363
          ExplicitLeft = 493
          ExplicitWidth = 363
          DesignSize = (
            363
            43)
          inherited cmbCodigosNoRecepcion: TCheckCombo
            Width = 353
            ExplicitWidth = 353
          end
        end
        inherited gbCodigoTexto: TGroupBox
          Width = 358
          ExplicitWidth = 1413
          DesignSize = (
            358
            43)
          inherited fraCodTexto: TfraStaticCodigoDescripcion
            Width = 349
            Height = 24
            ExplicitWidth = 1404
            ExplicitHeight = 24
            DesignSize = (
              349
              24)
            inherited cmbDescripcion: TComboGrid
              Width = 286
              ExplicitWidth = 1341
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
            Width = 228
            ExplicitWidth = 228
            DesignSize = (
              228
              25)
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
          Width = 416
          ExplicitWidth = 416
          DesignSize = (
            416
            43)
          inherited cmbUsuImpresion: TDBCheckCombo
            Width = 404
            ExplicitWidth = 404
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 256
          ExplicitWidth = 256
          DesignSize = (
            256
            43)
          inherited cmbCodigosRecepcion: TCheckCombo
            Width = 246
            ExplicitWidth = 246
          end
        end
        inherited gbUsuarioReimpresion: TGroupBox
          Width = 436
          ExplicitWidth = 1491
          DesignSize = (
            436
            43)
          inherited cmbUsuReimpresion: TDBCheckCombo
            Width = 424
            ExplicitWidth = 1479
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
      end
      inherited tsFiltros1: TTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          1008
          187)
        inherited gbFormulario: TGroupBox
          Width = 727
          ExplicitWidth = 727
          DesignSize = (
            727
            46)
          object rbEmpNormal: TRadioButton
            Left = 6
            Top = 18
            Width = 60
            Height = 17
            Caption = 'Afilia&da'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = FiltroEmpresa
          end
          object rbEmpDeudora: TRadioButton
            Left = 66
            Top = 18
            Width = 51
            Height = 17
            Caption = 'Otr&as'
            TabOrder = 1
            OnClick = FiltroEmpresa
          end
          inline fraEmpresaDeudora: TfraEmpresaDeudora
            Left = 123
            Top = 14
            Width = 598
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            ExplicitLeft = 123
            ExplicitTop = 14
            inherited lbRSocial: TLabel
              Left = 120
              ExplicitLeft = 120
            end
            inherited lbContrato: TLabel
              Left = 496
              ExplicitLeft = 496
            end
            inherited Label6: TLabel
              Width = 25
              ExplicitWidth = 25
            end
          end
        end
        inherited gbFechaImpresion: TGroupBox
          Left = 4
          Top = 92
          Width = 208
          TabOrder = 4
          ExplicitLeft = 4
          ExplicitTop = 92
          ExplicitWidth = 208
          inherited Label2: TLabel
            Left = 98
            Width = 12
            Font.Name = 'MS Serif'
            ParentFont = False
            ExplicitLeft = 98
            ExplicitWidth = 12
          end
          inherited edFechaImpresionDesde: TDateComboBox
            Left = 6
            ExplicitLeft = 6
          end
          inherited edFechaImpresionHasta: TDateComboBox
            Left = 114
            ExplicitLeft = 114
          end
        end
        inherited gbFechaReimpresion: TGroupBox
          Left = 217
          Top = 92
          Width = 217
          TabOrder = 5
          ExplicitLeft = 217
          ExplicitTop = 92
          ExplicitWidth = 217
          inherited Label4: TLabel
            Left = 103
            Width = 12
            Font.Name = 'MS Serif'
            ParentFont = False
            ExplicitLeft = 103
            ExplicitWidth = 12
          end
          inherited edFechaReImpresionDesde: TDateComboBox
            Left = 7
            ExplicitLeft = 7
          end
          inherited edFechaReImpresionHasta: TDateComboBox
            Left = 122
            ExplicitLeft = 122
          end
        end
        inherited gbFechaRecepcion: TGroupBox
          Left = 436
          Top = 92
          Width = 217
          TabOrder = 6
          ExplicitLeft = 436
          ExplicitTop = 92
          ExplicitWidth = 217
          inherited Label3: TLabel
            Left = 102
            Width = 12
            Font.Name = 'MS Serif'
            ParentFont = False
            ExplicitLeft = 102
            ExplicitWidth = 12
          end
          inherited edFechaRecepcionDesde: TDateComboBox
            Left = 6
            ExplicitLeft = 6
          end
          inherited edFechaRecepcionHasta: TDateComboBox
            Left = 122
            ExplicitLeft = 122
          end
        end
        inherited gbPendientes: TGroupBox
          Left = 217
          Top = 135
          Width = 566
          ExplicitLeft = 217
          ExplicitTop = 135
          ExplicitWidth = 566
          inherited chkVentanilla: TCheckBox [0]
            Left = 425
            Top = 26
            Color = clRed
            ParentColor = False
            Visible = False
            ExplicitLeft = 425
            ExplicitTop = 26
          end
          inherited chkPendienteImpresion: TCheckBox [1]
            Left = 5
            Top = 12
            Width = 72
            Height = 25
            WordWrap = True
            ExplicitLeft = 5
            ExplicitTop = 12
            ExplicitWidth = 72
            ExplicitHeight = 25
          end
          inherited chkPendienteRecepcion: TCheckBox [2]
            Left = 153
            Width = 88
            Caption = 'Pend. recepc.'
            ExplicitLeft = 153
            ExplicitWidth = 88
          end
          inherited chkPendienteReemplazo: TCheckBox [3]
            Left = 77
            Width = 70
            ExplicitLeft = 77
            ExplicitWidth = 70
          end
          inherited chkPendienteAval: TCheckBox [4]
            Left = 336
            ExplicitLeft = 336
          end
          inherited chkAvaladas: TCheckBox [5]
            Left = 416
            ExplicitLeft = 416
          end
          inherited chkPendEnvioVentanilla: TCheckBox
            Left = 487
            ExplicitLeft = 487
          end
          inherited chkPendienteRemito: TCheckBox
            Left = 245
            ExplicitLeft = 245
          end
        end
        inherited gbFechaAlta: TGroupBox
          Left = 4
          Top = 135
          Width = 208
          ExplicitLeft = 4
          ExplicitTop = 135
          ExplicitWidth = 208
          inherited Label5: TLabel
            Left = 99
            Width = 12
            Font.Name = 'MS Serif'
            ParentFont = False
            ExplicitLeft = 99
            ExplicitWidth = 12
          end
          inherited edFechaAltaDesde: TDateComboBox
            Left = 7
            ExplicitLeft = 7
          end
          inherited edFechaAltaHasta: TDateComboBox
            Left = 115
            ExplicitLeft = 115
          end
        end
        inherited gbUsuarioAlta: TGroupBox
          Left = 128
          Width = 727
          ExplicitLeft = 128
          ExplicitWidth = 727
          DesignSize = (
            727
            47)
          inherited cmbUsuAlta: TDBCheckCombo
            Width = 704
            ExplicitWidth = 704
          end
        end
        inherited gbTrackTrace: TGroupBox
          Left = 890
          TabOrder = 7
          ExplicitLeft = 890
        end
        inherited gbCartaConNroLote: TGroupBox
          Left = 655
          Top = 92
          Width = 128
          ExplicitLeft = 655
          ExplicitTop = 92
          ExplicitWidth = 128
          inherited rbCartaNroLote_Todas: TRadioButton
            Width = 48
            ExplicitWidth = 48
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 865
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 859
      end>
    ExplicitWidth = 865
    inherited ToolBar: TToolBar
      Left = 11
      Width = 850
      ButtonHeight = 32
      ButtonWidth = 29
      ExplicitLeft = 11
      ExplicitWidth = 850
      inherited tbRefrescar: TToolButton
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited ToolButton5: TToolButton
        Left = 29
        Visible = True
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
        Enabled = True
        ExplicitLeft = 66
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbEliminar: TToolButton
        Left = 95
        Enabled = True
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
        Enabled = True
        ExplicitLeft = 264
        ExplicitWidth = 44
        ExplicitHeight = 32
      end
      inherited tbExportar: TToolButton
        Left = 308
        Enabled = True
        ExplicitLeft = 308
        ExplicitWidth = 29
        ExplicitHeight = 32
      end
      inherited tbEnviarMail: TToolButton
        Left = 337
        Enabled = True
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
      object tbCambiarFirmante: TToolButton
        Left = 622
        Top = 0
        Hint = 'Cambiar Firmante'
        Caption = 'tbCambiarFirmante'
        ImageIndex = 39
        OnClick = tbCambiarFirmanteClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 865
    Height = 273
    AutoTitleHeight = True
    Columns = <
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
        FieldName = 'FORMULARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Formulario'
        Width = 83
        Visible = True
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
        FieldName = 'TRACKYTRACE'
        Title.Caption = 'Track & Trace'
        Width = 92
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
        FieldName = 'DESCR_VENTANILLA'
        Title.Caption = 'Descr. Ventanilla'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTESTADOCARTAVENTANILLA'
        Title.Caption = 'Ult. Estado Env'#237'o Ventanilla'
        Width = 137
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULTFESTADOCARTAVENTANILLA'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. F. Estado Env'#237'o Ventanilla'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_TIPOSALIDA'
        Title.Caption = 'Tipo Salida'
        Width = 106
        Visible = True
      end>
  end
  inherited fpReemplazar: TFormPanel
    Left = 158
    Top = 385
    ExplicitLeft = 158
    ExplicitTop = 385
    inherited btnMismosDatos: TButton [1]
      Left = 374
      Width = 82
      ExplicitLeft = 374
      ExplicitWidth = 82
    end
    inherited btnDatosNuevos: TButton [2]
      Left = 456
      Width = 82
      ExplicitLeft = 456
      ExplicitWidth = 82
    end
    inherited Button1: TButton [3]
      Left = 538
      Width = 82
      ExplicitLeft = 538
      ExplicitWidth = 82
    end
    inherited gbDatosCartaDoc: TGroupBox [4]
      inline fraEmpresaDatosCartaDoc: TfraEmpresa
        Left = 9
        Top = 20
        Width = 592
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
        ExplicitLeft = 9
        ExplicitTop = 20
        ExplicitWidth = 592
        ExplicitHeight = 21
        DesignSize = (
          592
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 489
          ExplicitLeft = 489
        end
        inherited edContrato: TIntEdit
          Left = 535
          ExplicitLeft = 535
        end
        inherited cmbRSocial: TArtComboBox
          Width = 353
          ExplicitWidth = 353
        end
      end
    end
    inherited gbDatosActuales: TGroupBox [5]
      inline fraEmpresaDatosActuales: TfraEmpresa
        Left = 9
        Top = 20
        Width = 592
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
        ExplicitLeft = 9
        ExplicitTop = 20
        ExplicitWidth = 592
        ExplicitHeight = 21
        DesignSize = (
          592
          21)
        inherited lbContrato: TLabel
          Left = 490
          ExplicitLeft = 490
        end
        inherited edContrato: TIntEdit
          Left = 535
          ExplicitLeft = 535
        end
        inherited cmbRSocial: TArtComboBox
          Width = 353
          ExplicitWidth = 353
        end
      end
    end
  end
  inherited fpRecepcionCartaDoc: TFormPanel
    Left = 114
    Top = 264
    ExplicitLeft = 114
    ExplicitTop = 264
    inherited lbFRecepcion: TLabel
      Left = 269
      Width = 96
      Alignment = taRightJustify
      Caption = 'Fecha de Recepci'#243'n'
      ParentFont = True
      ExplicitLeft = 269
      ExplicitWidth = 96
    end
    inherited lbCodRecepcion: TLabel
      ParentFont = True
    end
    inherited edFechaRecepcion: TDateComboBox
      Left = 268
      ExplicitLeft = 268
    end
    inherited rgRecepOk: TRadioGroup
      Width = 103
      Caption = ' Recepci'#243'n O&K '
      ExplicitWidth = 103
    end
  end
  object fpNuevoFirmante: TFormPanel [7]
    Left = 142
    Top = 388
    Width = 400
    Height = 76
    Caption = 'Cambiar Firmante'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 76
    Constraints.MinHeight = 76
    Constraints.MinWidth = 400
    OnEnter = fpTrackTraceEnter
    DesignSize = (
      400
      76)
    object Bevel4: TBevel
      Left = 4
      Top = 40
      Width = 392
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbFirmante: TLabel
      Left = 8
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Firmante'
    end
    object btnNuevoFirmanteAceptar: TButton
      Left = 239
      Top = 46
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnNuevoFirmanteAceptarClick
    end
    object btnNuevoFirmanteCancelar: TButton
      Left = 318
      Top = 46
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraNuevoFirmante: TfraStaticCodigoDescripcion
      Left = 54
      Top = 12
      Width = 337
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 54
      ExplicitTop = 12
      ExplicitWidth = 337
      ExplicitHeight = 25
      DesignSize = (
        337
        25)
      inherited cmbDescripcion: TComboGrid
        Width = 274
        ExplicitWidth = 274
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
  inherited fpOpcionesImpresion: TFormPanel
    Left = 566
    Top = 474
    Height = 229
    BorderStyle = bsDialog
    Constraints.MaxWidth = 0
    Constraints.MinHeight = 0
    Constraints.MinWidth = 0
    ExplicitLeft = 566
    ExplicitTop = 474
    ExplicitHeight = 229
    DesignSize = (
      257
      229)
    inherited Bevel2: TBevel
      Top = 193
      ExplicitTop = 193
    end
    inherited Label7: TLabel
      Top = 52
      ExplicitTop = 52
    end
    inherited Label8: TLabel
      Top = 149
      ExplicitTop = 149
    end
    inherited btnAceptarImpresion: TButton
      Left = 102
      Top = 199
      TabOrder = 8
      ExplicitLeft = 102
      ExplicitTop = 199
    end
    inherited btnCancelarImpresion: TButton
      Top = 199
      TabOrder = 9
      ExplicitTop = 199
    end
    inherited rbPreview: TRadioButton
      TabOrder = 0
      OnClick = OpcionesImpresion
    end
    inherited rbImprimir: TRadioButton
      TabOrder = 1
      OnClick = OpcionesImpresion
    end
    inherited edCantCopias: TIntEdit
      Top = 48
      TabOrder = 3
      ExplicitTop = 48
    end
    inherited btnParar: TButton
      Left = 7
      Top = 199
      Anchors = [akLeft, akBottom]
      TabOrder = 10
      ExplicitLeft = 7
      ExplicitTop = 199
    end
    inherited cmbImpresoras: TComboBox
      Left = 66
      Top = 146
      ExplicitLeft = 66
      ExplicitTop = 146
    end
    inherited BarProgreso: TProgressBar
      Top = 172
      Width = 245
      TabOrder = 11
      ExplicitTop = 172
      ExplicitWidth = 245
    end
    inherited rbVentanilla: TRadioButton
      TabOrder = 2
      OnClick = OpcionesImpresion
    end
    object rgIntimacion: TRadioGroup
      Left = 6
      Top = 74
      Width = 145
      Height = 66
      Caption = ' Intimaci'#243'n '#191'Qu'#233' imprimo? '
      ItemIndex = 2
      Items.Strings = (
        'Carta'
        'Formulario 817'
        'Ambos')
      TabOrder = 4
    end
    object rgDatos: TRadioGroup
      Left = 155
      Top = 91
      Width = 96
      Height = 49
      Caption = ' Datos '
      ItemIndex = 0
      Items.Strings = (
        'Carta'
        'Actuales')
      TabOrder = 6
    end
    object chkFirma: TCheckBox
      Left = 155
      Top = 75
      Width = 90
      Height = 17
      Caption = 'Mostrar firma'
      TabOrder = 5
    end
  end
  inherited pnlBottomCartas: TPanel
    Top = 521
    Width = 865
    ExplicitTop = 524
    ExplicitWidth = 865
    inherited Panel1: TPanel
      Left = 194
      ExplicitLeft = 194
    end
    inherited pnlRemito: TPanel
      Left = 745
      ExplicitLeft = 745
    end
    inherited pnlTotales: TPanel
      Left = 171
      ExplicitLeft = 171
    end
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
      end>
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
  inherited pmnuImprimir: TPopupMenu
    OnPopup = pmnuImprimirPopup
    object mnuImprimirEstadoCuenta: TMenuItem
      Caption = 'Imprimir Estado de Cuenta'
      OnClick = mnuImprimirEstadoCuentaClick
    end
  end
  inherited sdqUsuReimpresion: TSDQuery
    Left = 666
    Top = 195
  end
  inherited dsUsuReimpresion: TDataSource
    Left = 694
    Top = 195
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
        Key = 16466
        LinkControl = tbRecepcion
      end
      item
        Key = 16464
        LinkControl = tbReemplazo
      end
      item
        Key = 16468
        LinkControl = tbTrackTrace
      end>
    Left = 104
    Top = 279
  end
end
