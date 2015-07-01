inherited frmEMIGeneracionCartas: TfrmEMIGeneracionCartas
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlSuperior: TPanel
    inherited Panel1: TPanel
      Top = 113
      Height = 149
      inherited edObservaciones: TMemo
        Top = 4
        Height = 144
      end
    end
    inherited pnlDatos: TPanel
      Top = 33
      Height = 80
      inherited Label10: TLabel
        Top = 87
        Visible = False
      end
      object lblModoNotificacion: TLabel [6]
        Left = 329
        Top = 58
        Width = 52
        Height = 13
        Caption = '&Modo Notif'
      end
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
        Top = 83
        Visible = False
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
      inline fraModoNotificacion: TfraCodigoDescripcion
        Left = 382
        Top = 54
        Width = 269
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        inherited cmbDescripcion: TArtComboBox
          Width = 204
        end
      end
    end
    inherited pnlAdicional: TPanel
      Height = 33
      object pnEmpresa: TPanel
        Left = 0
        Top = 0
        Width = 655
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 12
          Width = 29
          Height = 13
          AutoSize = False
          Caption = 'CUI&T'
        end
        inline fraEmpresaCartaDoc: TfraEmpresa
          Left = 56
          Top = 8
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
          TabOrder = 0
          inherited lbContrato: TLabel
            Left = 488
          end
          inherited edContrato: TIntEdit
            Left = 535
          end
          inherited cmbRSocial: TArtComboBox
            Width = 353
          end
        end
      end
    end
  end
end
