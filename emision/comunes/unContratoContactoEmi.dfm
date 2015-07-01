inherited frmContratoContactoEmi: TfrmContratoContactoEmi
  Caption = 'Contactos del Contrato'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ArtDBGrid: TArtDBGrid
    Height = 81
  end
  inherited grbContacto: TGroupBox
    Top = 176
    Height = 125
    inherited fraContacto: TfraContacto
      Top = 15
      inherited fraArea: TfraStaticCTB_TABLAS
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
      inherited fraCargo: TfraStaticCTB_TABLAS
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
      inherited fraTelefonos: TfraTelefono
        inherited cmbTelefonos: TComboGrid
          Cells = ()
          ColWidths = (
            64
            64)
        end
      end
      inherited sdqDatos: TSDQuery
        Left = 36
        Top = 32
      end
      inherited dsDatos: TDataSource
        Left = 64
        Top = 32
      end
    end
    object chkRemitenteCarta: TCheckBox
      Left = 152
      Top = 106
      Width = 161
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Utilizar en Gesti'#243'n de Emisi'#243'n'
      TabOrder = 1
    end
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
      end>
  end
end
