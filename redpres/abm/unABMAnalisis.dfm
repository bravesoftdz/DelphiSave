inherited frmAbmAnalisis: TfrmAbmAnalisis
  Caption = 'Historia Cl'#237'nica'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    inherited Label2: TLabel
      FocusControl = fraOperativo.edPeriodo
    end
    inherited lbEstudio: TLabel
      FocusControl = fraEstudio.edCodigo
    end
    object Label3: TLabel [15]
      Left = 4
      Top = 6
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    inherited fraOperativo: TfraOperativo
      TabOrder = 8
    end
    inherited fraEstablecimiento: TfraEstablecimiento_OLD
      inherited sdqDatos: TSDQuery
        Top = 48
      end
      inherited dsDatos: TDataSource
        Top = 48
      end
    end
    inherited fraEstudio: TfraEstudio
      inherited cmbDescripcion: TArtComboBox
        Width = 494
      end
    end
    inherited fraPrestador: TfraPrestadorAMP
      TabOrder = 9
    end
    inline fraEmpresaHijo: TfraEmpresa
      Left = 52
      Top = 3
      Width = 704
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
      TabOrder = 6
      inherited lbContrato: TLabel
        Left = 600
      end
      inherited edContrato: TIntEdit
        Left = 645
      end
      inherited cmbRSocial: TArtComboBox
        Width = 465
      end
    end
    inline fraTrabajadorHijo: TfraTrabajadorAMP
      Left = 3
      Top = 88
      Width = 702
      Height = 25
      TabOrder = 7
      inherited lbTrabCUIL: TLabel
        Width = 23
      end
      inherited cmbNombre: TArtComboBox
        Width = 534
      end
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
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'ET_PERIODO'
      end
      item
        DataField = 'ET_CUIT'
      end
      item
        DataField = 'MP_CONTRATO'
      end
      item
        DataField = 'MP_NOMBRE'
      end
      item
        DataField = 'ET_ESTABLECI'
      end
      item
        DataField = 'ET_CUIL'
      end
      item
        DataField = 'TJ_NOMBRE'
      end
      item
        DataField = 'ET_FECHA'
      end
      item
        DataField = 'ES_DESCRIPCION'
      end
      item
        DataField = 'ET_RESULTADO'
      end
      item
        DataField = 'ET_TIPORES'
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
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
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
end
