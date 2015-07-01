inherited frmGeneracionCartasAdminLegales: TfrmGeneracionCartasAdminLegales
  Left = 338
  Top = 154
  Caption = 'frmGeneracionCartasAdminLegales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Top = 344
  end
  inherited pnlInferior: TPanel
    Top = 348
    Height = 175
    DesignSize = (
      658
      175)
    inherited Bevel2: TBevel
      Top = 141
    end
    inherited Bevel1: TBevel
      Top = 148
    end
    inherited edTexto: TRxRichEdit
      Height = 106
    end
    inherited btnImprimir: TButton
      Top = 149
    end
    inherited btnAceptar: TButton
      Top = 149
    end
    inherited btnCancelar: TButton
      Top = 149
    end
    inherited ToolBar1: TToolBar
      Left = 8
      Top = 147
      Width = 105
      Height = 24
      ButtonHeight = 22
      object Label12: TLabel
        Left = 25
        Top = 2
        Width = 65
        Height = 22
        Caption = 'Otro Domicilio'
      end
    end
  end
  inherited pnlSuperior: TPanel
    Height = 344
    inherited Panel1: TPanel
      Top = 176
      Height = 168
      DesignSize = (
        658
        168)
      inherited edObservaciones: TMemo
        Left = 52
        Height = 159
      end
    end
    inherited pnlDatos: TPanel
      Top = 104
      inherited fraCtbTablasCorreo: TfraStaticCTB_TABLAS
        DesignSize = (
          273
          24)
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
        DesignSize = (
          272
          24)
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
        DesignSize = (
          271
          25)
        inherited cmbDescripcion: TComboGrid
          Width = 208
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
        DesignSize = (
          273
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 210
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
        DesignSize = (
          272
          24)
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
      inherited fraCodigoCodTexto: TfraCodigoDescripcion
        DesignSize = (
          272
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 207
        end
      end
    end
    inherited pnlAdicional: TPanel
      Height = 104
      DesignSize = (
        658
        104)
      inherited gbEmpresa: TGroupBox
        Top = 46
        TabOrder = 1
        inherited fraEmpresa: TfraEmpresa
          OnExit = fraEmpresaExit
          inherited edContrato: TIntEdit
            Left = 538
          end
        end
      end
      inherited gbTrabajador: TGroupBox
        TabOrder = 2
        inherited fraTrabajador: TfraTrabajador
          inherited cmbNombre: TArtComboBox
            Width = 512
          end
        end
      end
      inherited gbSiniestro: TGroupBox
        TabOrder = 0
        Visible = False
        inherited Label1: TLabel [0]
        end
        inherited Label42: TLabel [1]
        end
        inherited edTrabajador: TEdit [2]
        end
        inherited edSiniestro: TSinEdit [3]
        end
      end
    end
  end
  inherited fpCambiarDomicilioCarta: TFormPanel
    Left = 32
    Top = 296
    inherited fraDomicilio: TfraDomicilio
      DesignSize = (
        604
        52)
    end
    inherited pnlDestinatario: TPanel
      inherited fraDestinatario: TfraCtbTablas
        DesignSize = (
          248
          23)
      end
    end
  end
end
