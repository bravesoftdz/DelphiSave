inherited frmGeneracionCartasAdmin: TfrmGeneracionCartasAdmin
  Left = 159
  Caption = 'Administraci'#243'n de Cartas Documento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlInferior: TPanel
    inherited btnAceptar: TButton
      Top = 231
      Height = 26
    end
  end
  inherited pnlSuperior: TPanel
    inherited Panel1: TPanel
      Top = 131
      Height = 131
      inherited edObservaciones: TMemo
        Height = 130
      end
    end
    inherited pnlDatos: TPanel
      Top = 49
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
      Height = 49
      object gbEmpresa: TGroupBox
        Left = 1
        Top = 3
        Width = 652
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Empresa'
        TabOrder = 0
        DesignSize = (
          652
          43)
        inline fraEmpresa: TfraEmpresa
          Left = 3
          Top = 16
          Width = 645
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
            Left = 541
          end
          inherited edContrato: TIntEdit
            Left = 586
          end
          inherited cmbRSocial: TArtComboBox
            Width = 371
          end
        end
      end
    end
  end
end
