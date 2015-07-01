inherited frmGeneracionCartasEventos: TfrmGeneracionCartasEventos
  Left = 208
  Top = 105
  Caption = 'Generaci'#243'n de Cartas de Eventos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Top = 252
  end
  inherited pnlInferior: TPanel
    Top = 255
    Height = 268
    inherited Bevel2: TBevel
      Top = 234
    end
    inherited Bevel1: TBevel
      Top = 241
    end
    inherited edTexto: TRxRichEdit
      Height = 195
    end
    inherited btnImprimir: TButton
      Top = 242
    end
    inherited btnAceptar: TButton
      Top = 242
    end
    inherited btnCancelar: TButton
      Top = 242
    end
  end
  inherited pnlSuperior: TPanel
    Height = 252
    inherited Panel1: TPanel
      Top = 134
      Height = 118
      inherited edObservaciones: TMemo
        Height = 158
      end
    end
    inherited pnlDatos: TPanel
      Top = 50
      Height = 84
      inherited fraCtbTablasCorreo: TfraStaticCTB_TABLAS
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
      inherited fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS
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
      inherited fraCodigoModulo: TfraStaticCodigoDescripcion
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
      inherited fraCodigoCodFirmante: TfraStaticCodigoDescripcion
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
      inherited fraARTs: TfraStaticCodigoDescripcion
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
    inherited pnlAdicional: TPanel
      Height = 50
      object gbEmpresa: TGroupBox
        Left = 1
        Top = -1
        Width = 652
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Empresa'
        TabOrder = 0
        DesignSize = (
          652
          45)
        inline fraEmpresa: TfraEmpresaDeudora
          Left = 4
          Top = 14
          Width = 642
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
          TabOrder = 0
          inherited lbContrato: TLabel
            Left = 541
          end
          inherited edContrato: TIntEdit
            Left = 585
          end
          inherited cmbRSocial: TArtComboBox
            Width = 375
            DataSource = nil
          end
        end
      end
    end
  end
  inherited Seguridad1: TSeguridad
    Left = 14
    Top = 317
  end
  inherited FormPlacement: TFormPlacement
    Left = 42
    Top = 317
  end
  inherited sdqDatos: TSDQuery
    Left = 14
    Top = 344
  end
  inherited sduDatos: TSDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO CCA_CARTA'
      '(CA_ID, CA_IDTEXTOCARTA, CA_CORREO, CA_TIPOSALIDA, CA_IDFIRMA,'
      ' CA_OBSERVACIONES, CA_IDFORMULARIO, CA_MANUAL,'
      ' CA_TEXTOFINAL, CA_IDDELEGACION, CA_IDAREATEXTO, '
      ' CA_IDEMPDEUDORA, CA_USUALTA, CA_FECHAALTA)'
      'VALUES'
      
        '(:CA_ID, :CA_IDTEXTOCARTA, :CA_CORREO, :CA_TIPOSALIDA, :CA_IDFIR' +
        'MA,'
      ' :CA_OBSERVACIONES, :CA_IDFORMULARIO, :CA_MANUAL,'
      ' :CA_TEXTOFINAL, :CA_IDDELEGACION, :CA_IDAREATEXTO, '
      ' :CA_IDEMPDEUDORA, :CA_USUALTA, SYSDATE)')
    Left = 42
    Top = 344
  end
end
