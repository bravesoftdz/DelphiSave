inherited frmGeneracionCartasAdmin: TfrmGeneracionCartasAdmin
  Left = 205
  Top = 110
  Caption = 'Administraci'#243'n de Cartas Documento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
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
        Top = -2
        Width = 652
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Empresa'
        TabOrder = 0
        DesignSize = (
          652
          45)
        object Bevel3: TBevel
          Left = 120
          Top = 9
          Width = 3
          Height = 31
          Anchors = [akLeft, akTop, akBottom]
          Shape = bsLeftLine
        end
        inline fraEmpresa: TfraEmpresaDeudora
          Left = 126
          Top = 14
          Width = 521
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
            Left = 420
          end
          inherited edContrato: TIntEdit
            Left = 464
          end
          inherited cmbRSocial: TArtComboBox
            Width = 254
            DataSource = nil
          end
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
        object rbEmpNormal: TRadioButton
          Left = 6
          Top = 18
          Width = 60
          Height = 17
          Caption = 'Afilia&da'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = FiltroEmpresa
        end
      end
    end
  end
end
