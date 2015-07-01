inherited frmEMIAdministracionCartas: TfrmEMIAdministracionCartas
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    inherited pcFiltros: TPageControl
      Width = 803
      inherited tsFiltros0: TTabSheet
        inherited gbDelegacion: TGroupBox
          Left = 553
          Width = 237
          inherited cmbDelegacion: TDBCheckCombo
            Width = 226
          end
        end
        inherited gbCorreoImpresion: TGroupBox
          Width = 239
          inherited fraCorreo: TfraStaticCTB_TABLAS
            Width = 234
            inherited cmbDescripcion: TComboGrid
              Width = 170
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
          Left = 553
          Width = 236
          inherited cmbCodigosNoRecepcion: TCheckCombo
            Width = 226
          end
        end
        inherited gbModulo: TGroupBox
          Width = 313
          inherited cmbModulo: TDBCheckCombo
            Width = 299
          end
        end
        inherited gbCodigoTexto: TGroupBox
          Left = 553
          Width = 236
          inherited fraCodTexto: TfraStaticCodigoDescripcion
            Width = 227
            inherited cmbDescripcion: TComboGrid
              Width = 163
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
          Width = 469
          inherited cmbUsuImpresion: TDBCheckCombo
            Width = 456
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 313
          inherited cmbCodigosRecepcion: TCheckCombo
            Width = 302
          end
        end
        inherited gbUsuarioReimpresion: TGroupBox
          Left = 477
          Width = 313
          inherited cmbUsuReimpresion: TDBCheckCombo
            Width = 301
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
          Width = 663
          inline fraEmpresa: TfraEmpresa
            Left = 9
            Top = 15
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
            TabOrder = 0
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
        inherited gbPendientes: TGroupBox
          Width = 538
        end
        inherited gbUsuarioAlta: TGroupBox
          Width = 545
          inherited cmbUsuAlta: TDBCheckCombo
            Width = 524
          end
        end
        inherited gbTrackTrace: TGroupBox
          Left = 678
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        OnClick = tbNuevoClick
      end
    end
  end
  inherited fpTrackTrace: TFormPanel
    Left = 542
    Top = 320
  end
  inherited fpReemplazar: TFormPanel
    Left = -46
    Top = 445
    inherited Button1: TButton
      OnClick = Button1Click
    end
  end
  inherited fpRecepcionCartaDoc: TFormPanel
    Left = 94
    Top = 292
  end
  object fpSeleccionarCarpeta: TFormPanel [7]
    Left = 588
    Top = 421
    Width = 488
    Height = 96
    Caption = 'Seleccione carpeta de destino'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = edCarpetaDestino
    object Label18: TLabel
      Left = 8
      Top = 20
      Width = 37
      Height = 13
      Caption = 'Carpeta'
    end
    object Bevel6: TBevel
      Left = 4
      Top = 48
      Width = 480
      Height = 8
      Shape = bsTopLine
    end
    object edCarpetaDestino: TEdit
      Left = 56
      Top = 16
      Width = 400
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object btnSeleccionarCarpeta: TButton
      Left = 456
      Top = 16
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btnSeleccionarCarpetaClick
    end
    object btnAceptar3: TButton
      Left = 329
      Top = 64
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btnAceptar3Click
    end
    object btnCancelarCarpeta: TButton
      Left = 407
      Top = 64
      Width = 72
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
  end
  inherited fpOpcionesImpresion: TFormPanel
    Left = 746
    Top = 254
    OnShow = fpOpcionesImpresionShow
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
  inherited dsDelegacion: TDataSource
    Left = 644
    Top = 2
  end
  inherited sdqDelegacion: TSDQuery
    Left = 616
    Top = 2
  end
  object folderDialog: TFolderDialog
    Title = 'Seleccione la carpeta donde desea guardar los archivos PDF'
    Directory = 'E:\'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.0'
    Left = 76
    Top = 334
  end
end
