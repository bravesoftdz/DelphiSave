object frmFormularioEmi: TfrmFormularioEmi
  Left = 320
  Top = 67
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Formulario'
  ClientHeight = 533
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    431
    533)
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TButton
    Left = 274
    Top = 506
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancel: TButton
    Left = 352
    Top = 506
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
  inline fraNominas: TfraNominas
    Left = 1
    Top = 0
    Width = 427
    Height = 496
    TabOrder = 0
    inherited pcDatosCargar: TJvPageControl
      Height = 409
      inherited tb165_170: TTabSheet
        inherited fraForm165_170: TfraForm165_170
          inherited gbDetalle: TGroupBox
            inherited fraCondicion: TfraStaticCodigoDescripcion
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
        end
      end
      inherited tbNota: TTabSheet
        inherited fraFormNota: TfraFormNota
          inherited fpAltaRespuesta: TFormPanel
            inherited gbRespuesta: TJvgGroupBox
              FullHeight = 59
            end
          end
          inherited pcNota: TJvPageControl
            inherited tbNotaActual: TTabSheet
              inherited fraTipoNomina: TfraCodigoDescripcionExt
                Width = 152
                inherited cmbDescripcion: TArtComboBox
                  Width = 119
                end
              end
            end
          end
        end
      end
      inherited tbPagos: TTabSheet
        inherited fraFormPagos: TfraFormPagos
          inherited gbDetalle: TGroupBox
            inherited fraCondicion: TfraStaticCodigoDescripcion
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
      end
      inherited tbInfMixta931_170: TTabSheet
        inherited fraFormMixta931_170: TfraFormMixta931_170
          Height = 384
          inherited gbfrm170: TGroupBox
            inherited fraForm170: TfraForm165_170
              inherited gbDetalle: TGroupBox
                inherited fraCondicion: TfraStaticCodigoDescripcion
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
          end
        end
      end
      inherited tbAdicionarDetalle: TTabSheet
        inherited fraFormAdicionarDetalle: TfraFormAdicionarDetalle
          inherited tbComandosDetalleAdicDetalle: TToolBar
            Left = 321
          end
        end
      end
    end
    inherited tbComandosObservacion: TToolBar
      inherited tbAddVerificacion: TToolButton
        OnClick = fraNominastbAddObservacionClick
      end
    end
  end
  object gbConservar: TGroupBox
    Left = 1
    Top = 498
    Width = 192
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Conservar'
    TabOrder = 3
    object chkConservarTipoForm: TCheckBox
      Left = 8
      Top = 14
      Width = 94
      Height = 17
      Caption = 'Tipo Formulario'
      TabOrder = 0
    end
    object chkConservarFechaPres: TCheckBox
      Left = 108
      Top = 14
      Width = 77
      Height = 17
      Caption = 'Fecha Pres.'
      TabOrder = 1
    end
  end
end
