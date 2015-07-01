inherited frmManCAT_AREATEXTO_EMI: TfrmManCAT_AREATEXTO_EMI
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    BorderStyle = bsNone
  end
  inherited fpAbm: TFormPanel
    OnShow = fpAbmShow
    inherited PageControl1: TPageControl
      inherited tsUsuarios: TTabSheet
        inherited pnlDatos: TPanel
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
        end
      end
      object tsParametrosManuales: TTabSheet
        Caption = 'Par'#225'metros Manuales'
        ImageIndex = 2
      end
    end
    object btnAplicar: TButton
      Left = 412
      Top = 283
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'A&plicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAplicarClick
    end
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'AT_MODULO'
      end
      item
        DataField = 'AT_DESCRIPCION'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end>
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
      end>
  end
end
