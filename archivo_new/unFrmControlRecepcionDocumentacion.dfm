object FrmControlRecepcionDocumentacion: TFrmControlRecepcionDocumentacion
  Left = 60
  Top = 58
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Control de Documentaci'#243'n'
  ClientHeight = 402
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    586
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel
    Left = 2
    Top = 369
    Width = 575
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object grControlCarpeta: TGroupBox
    Left = 0
    Top = 8
    Width = 580
    Height = 201
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Control de Carpetas '
    TabOrder = 0
    DesignSize = (
      580
      201)
    object lblCodigoArchivo: TLabel
      Left = 5
      Top = 23
      Width = 56
      Height = 13
      Caption = 'Nro.Archivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edCodigoArchivo: TIntEdit
      Left = 65
      Top = 19
      Width = 155
      Height = 21
      TabOrder = 0
      MaxLength = 8
    end
    inline fraFiltroArchivoCapturaContenido: TfraFiltroArchivo
      Left = 12
      Top = 48
      Width = 561
      Height = 119
      VertScrollBar.Visible = False
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inherited pcFormulario: TJvPageControl
        Width = 561
        Height = 114
        inherited tsCuit: TTabSheet
          inherited fraEmpresaCUIT: TfraEmpresa
            Width = 505
            inherited lbContrato: TLabel
              Left = 410
            end
            inherited edContrato: TIntEdit
              Left = 455
            end
            inherited cmbRSocial: TArtComboBox
              Width = 275
            end
          end
        end
        inherited tsSiniestro: TTabSheet
          inherited lblFechaSiniestro: TLabel
            Left = 387
          end
          inherited fraEmpresaSiniestro: TfraEmpresa
            Width = 506
            inherited lbContrato: TLabel
              Left = 404
            end
            inherited edContrato: TIntEdit
              Left = 449
            end
            inherited cmbRSocial: TArtComboBox
              Width = 267
            end
          end
          inherited edFechaSiniestro: TDateComboBox
            Left = 465
          end
          inherited fraTrabajadorSiniestro: TfraTrabajador
            Width = 332
            inherited cmbNombre: TArtComboBox
              Width = 245
            end
          end
        end
        inherited tsTipoNumero: TTabSheet
          inherited fraCodDescTipo: TfraCodigoDescripcion
            Width = 387
            inherited cmbDescripcion: TArtComboBox
              Width = 322
            end
          end
        end
        inherited tsJuicio: TTabSheet
          inherited fraJuicio: TfraArchJuicio
            Width = 508
            inherited cmbDescripcion: TArtComboBox
              Width = 443
            end
          end
        end
        inherited tsCuitEstableci: TTabSheet
          inherited fraEstablecimiento: TfraEstablecimiento
            Width = 513
            inherited cmbDescripcion: TArtComboBox
              Width = 445
            end
          end
          inherited fraEmpresaEmpresa: TfraEmpresa
            Width = 507
            inherited lbContrato: TLabel
              Left = 405
            end
            inherited edContrato: TIntEdit
              Left = 450
            end
            inherited cmbRSocial: TArtComboBox
              Width = 268
            end
          end
        end
        inherited tsBiblioratoNota: TTabSheet
          inherited lbCUIT: TLabel
            FocusControl = fraFiltroArchivoCapturaContenido.fraEmpresaNota.mskCUIT
          end
          inherited fraEmpresaNota: TfraEmpresa
            Width = 507
            inherited lbContrato: TLabel
              Left = 405
            end
            inherited edContrato: TIntEdit
              Left = 449
            end
            inherited cmbRSocial: TArtComboBox
              Width = 270
            end
          end
          inherited edObservaciones: TEdit
            Width = 507
          end
        end
        inherited tsProveedor: TTabSheet
          inherited fraProveedor: TfraProveedor
            Width = 544
            inherited cmbDescripcion: TArtComboBox
              Width = 247
            end
          end
        end
      end
      inherited pnSeleccionArchivo: TPanel
        Width = 561
        inherited cmbTipoArchivo: TComboBox
          Width = 409
        end
        inherited btnCargarCodigoBarras: TJvXPButton
          Left = 466
        end
      end
    end
  end
  object gbDetalleContenido: TGroupBox
    Left = 1
    Top = 212
    Width = 578
    Height = 152
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Detalle de Contenido '
    TabOrder = 1
    DesignSize = (
      578
      152)
    object lvContenido: TJvListView
      Left = 8
      Top = 16
      Width = 564
      Height = 124
      Anchors = [akLeft, akTop, akRight, akBottom]
      Checkboxes = True
      Columns = <
        item
          Caption = 'Orden'
        end
        item
          Caption = 'Tipo Documento'
          Width = 150
        end
        item
          Caption = 'C'#243'digo'
          Width = 150
        end>
      RowSelect = True
      ShowWorkAreas = True
      TabOrder = 0
      ViewStyle = vsReport
      ColumnsOrder = '0=50,1=150,2=150'
    end
  end
  object btnMailEnviar: TButton
    Left = 423
    Top = 375
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Enviar'
    Default = True
    TabOrder = 2
  end
  object btnMailOmitir: TButton
    Left = 501
    Top = 375
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Omitir'
    ModalResult = 2
    TabOrder = 3
  end
end
