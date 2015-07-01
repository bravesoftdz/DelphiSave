inherited frmAMPAdministracionCartas: TfrmAMPAdministracionCartas
  Left = 240
  Top = 106
  Width = 800
  Height = 580
  Caption = 'Administraci'#243'n de Cartas Documento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 277
    inherited pcFiltros: TPageControl
      Width = 787
      Height = 271
      inherited tsFiltros0: TTabSheet
        inherited gbNroCarta: TGroupBox
          Visible = False
        end
        inherited gbNroCartaDoc: TGroupBox
          Left = 1
          inherited Label1: TLabel
            Left = 95
            Top = 18
          end
          inherited edNroCartaDocDesde: TMaskEdit
            OnExit = edNroCartaDocDesdeExit
          end
        end
        inherited gbDelegacion: TGroupBox
          Left = 402
          Width = 375
          inherited cmbDelegacion: TDBCheckCombo
            Width = 356
          end
        end
        inherited gbCorreoImpresion: TGroupBox
          Left = 203
          Width = 198
          inherited fraCorreo: TfraStaticCTB_TABLAS
            Width = 193
            inherited cmbDescripcion: TComboGrid
              Width = 129
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
          Left = 499
          Width = 278
          inherited cmbCodigosNoRecepcion: TCheckCombo
            Width = 257
          end
        end
        inherited gbCodigoTexto: TGroupBox
          Width = 280
          inherited fraCodTexto: TfraStaticCodigoDescripcion
            Left = 8
            Top = 14
            Width = 255
            inherited cmbDescripcion: TComboGrid
              Width = 192
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
              Width = 257
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
          Left = 0
          Width = 410
          inherited cmbUsuImpresion: TDBCheckCombo
            Width = 390
          end
        end
        inherited gbUsuarioReimpresion: TGroupBox
          Left = 411
          Width = 367
          inherited cmbUsuReimpresion: TDBCheckCombo
            Width = 345
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
        inherited gbFormulario: TGroupBox
          Width = 527
          inline fraEmpresaDeudora: TfraEmpresa
            Left = 8
            Top = 16
            Width = 513
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
              Left = 409
            end
            inherited edContrato: TIntEdit
              Left = 454
            end
            inherited cmbRSocial: TArtComboBox
              Width = 273
            end
          end
        end
        inherited gbFechaImpresion: TGroupBox
          Left = 1
          Top = 142
          TabOrder = 7
        end
        inherited gbFechaReimpresion: TGroupBox
          Left = 206
          Top = 142
          TabOrder = 8
        end
        inherited gbFechaRecepcion: TGroupBox
          Left = 412
          Top = 142
          TabOrder = 9
        end
        inherited gbPendientes: TGroupBox
          Left = 206
          Top = 185
          Width = 539
          TabOrder = 11
          inherited chkPendienteImpresion: TCheckBox
            Top = 12
            Width = 69
            Height = 25
            WordWrap = True
          end
          inherited chkPendienteRecepcion: TCheckBox
            Left = 151
          end
          inherited chkPendienteReemplazo: TCheckBox
            Left = 75
          end
          inherited chkPendienteAval: TCheckBox
            Left = 319
          end
          inherited chkAvaladas: TCheckBox
            Left = 400
          end
          inherited chkVentanilla: TCheckBox
            Left = 469
          end
          inherited chkPendienteRemito: TCheckBox
            Left = 226
          end
        end
        inherited gbFechaAlta: TGroupBox
          Left = 1
          Top = 185
          TabOrder = 12
        end
        inherited gbUsuarioAlta: TGroupBox
          Left = 3
          Top = 93
          Width = 772
          TabOrder = 6
          inherited cmbUsuAlta: TDBCheckCombo
            Width = 751
          end
        end
        inherited rgEstado: TRadioGroup
          ItemIndex = 2
          TabOrder = 3
        end
        inherited gbTrackTrace: TGroupBox
          Left = 662
          Top = 47
          Height = 46
          TabOrder = 5
        end
        inherited gbCartaConNroLote: TGroupBox
          Left = 614
          Top = 142
        end
        object gbLote: TGroupBox
          Left = 662
          Top = -1
          Width = 114
          Height = 47
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Lote'
          TabOrder = 2
          object edLote: TIntEdit
            Left = 8
            Top = 17
            Width = 97
            Height = 21
            TabOrder = 0
          end
        end
        object gbEstablecimiento: TGroupBox
          Left = 129
          Top = 47
          Width = 527
          Height = 46
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Establecimiento'
          TabOrder = 4
          DesignSize = (
            527
            46)
          inline fraEstablecimiento: TfraEstablecimiento
            Left = 7
            Top = 15
            Width = 514
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            inherited cmbDescripcion: TArtComboBox
              Width = 449
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 277
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      inherited ToolButton5: TToolButton
        Width = 7
      end
      inherited tbNuevo: TToolButton
        Left = 30
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Left = 53
      end
      inherited tbEliminar: TToolButton
        Left = 76
      end
      inherited ToolButton4: TToolButton
        Left = 99
      end
      inherited tbPropiedades: TToolButton
        Left = 107
      end
      inherited ToolButton3: TToolButton
        Left = 130
      end
      inherited tbLimpiar: TToolButton
        Left = 138
      end
      inherited tbOrdenar: TToolButton
        Left = 161
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 184
      end
      inherited ToolButton6: TToolButton
        Left = 207
      end
      inherited tbImprimir: TToolButton
        Left = 215
      end
      inherited tbExportar: TToolButton
        Left = 251
      end
      inherited tbEnviarMail: TToolButton
        Left = 274
      end
      inherited ToolButton8: TToolButton
        Left = 297
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 305
      end
      inherited tbMaxRegistros: TToolButton
        Left = 328
      end
      inherited ToolButton11: TToolButton
        Left = 351
      end
      inherited tbSalir: TToolButton
        Left = 359
      end
      inherited tbRecepcion: TToolButton
        Left = 382
      end
      inherited tbRecepcionMasiva: TToolButton
        Left = 405
      end
      inherited tbReemplazo: TToolButton
        Left = 428
      end
      inherited tbTrackTrace: TToolButton
        Left = 451
      end
      inherited ToolButton2: TToolButton
        Left = 474
      end
      inherited tbSalir2: TToolButton
        Left = 482
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 306
    Width = 792
    Height = 218
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Lote'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NROCARTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carta'
        Width = 93
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'tc_codigo'
        Title.Alignment = taCenter
        Title.Caption = 'Cod.Carta'
        Width = 55
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigofirma'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Firma'
        Width = 55
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
        Expanded = False
        FieldName = 'TRACKYTRACE'
        Title.Caption = 'Track & Trace'
        Width = 114
        Visible = True
      end>
  end
  inherited fpTrackTrace: TFormPanel
    Left = 410
    Top = 331
  end
  inherited fpReemplazar: TFormPanel
    Left = 133
    Top = 326
    inherited gbDatosCartaDoc: TGroupBox
      Top = 119
      inline fraEmpresaDatosActuales: TfraEmpresa
        Left = 4
        Top = 17
        Width = 598
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
        inherited lbContrato: TLabel
          Left = 494
        end
        inherited edContrato: TIntEdit
          Left = 539
        end
        inherited cmbRSocial: TArtComboBox
          Width = 324
        end
      end
    end
    inherited gbDatosActuales: TGroupBox
      Top = 11
      inline fraEmpresaDatosCartaDoc: TfraEmpresa
        Left = 4
        Top = 17
        Width = 598
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
        inherited lbContrato: TLabel
          Left = 494
        end
        inherited edContrato: TIntEdit
          Left = 539
        end
        inherited cmbRSocial: TArtComboBox
          Width = 324
        end
      end
    end
  end
  inherited fpRecepcionCartaDoc: TFormPanel
    Left = 288
    Top = 391
  end
  inherited fpOpcionesImpresion: TFormPanel
    Left = 177
    Top = 335
    BorderIcons = [biSystemMenu]
    inherited btnCancelarImpresion: TButton
      OnClick = btnCancelarImpresionClick
    end
    inherited edCantCopias: TIntEdit
      Text = '3'
      Value = 3
    end
  end
  inherited pnlBottomCartas: TPanel
    Top = 524
    Width = 792
    inherited Panel1: TPanel
      Left = 194
    end
    inherited pnlRemito: TPanel
      Left = 672
    end
    inherited pnlTotales: TPanel
      Left = 171
      inherited ToolBarTotales: TToolBar
        inherited tbCalcularTotal: TToolButton
          ImageIndex = 39
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    Top = 357
  end
  inherited dsConsulta: TDataSource
    Top = 357
  end
  inherited SortDialog: TSortDialog
    Top = 385
  end
  inherited ExportDialog: TExportDialog
    Top = 385
  end
  inherited QueryPrint: TQueryPrint
    Top = 413
  end
  inherited Seguridad: TSeguridad
    Top = 329
  end
  inherited FormStorage: TFormStorage
    Top = 329
  end
  inherited PrintDialog: TPrintDialog
    Top = 413
  end
  inherited ShortCutControl: TShortCutControl
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
      end
      item
        Enabled = False
        Key = 16452
      end>
    Top = 329
  end
  inherited FieldHider: TFieldHider
    Top = 357
  end
  inherited pmnuImprimir: TPopupMenu
    Top = 413
  end
  inherited sdqCCA_CARTA: TSDQuery
    Top = 445
  end
  inherited sdusdqCCA_CARTA: TSDUpdateSQL
    Top = 445
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
end
