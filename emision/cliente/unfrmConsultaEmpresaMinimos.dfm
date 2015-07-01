inherited frmConsultaEmpresasMinimos: TfrmConsultaEmpresasMinimos
  Left = 325
  Top = 211
  Caption = 'Empresa de M'#237'nimos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 38
    object lblCUIT: TLabel
      Left = 9
      Top = 13
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 32
      Top = 9
      Width = 407
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
        Left = 303
      end
      inherited edContrato: TIntEdit
        Left = 350
      end
      inherited cmbRSocial: TArtComboBox
        Width = 168
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 38
  end
  inherited Grid: TArtDBGrid
    Top = 67
    Height = 250
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_empleadosminimos'
        Title.Caption = 'Cant. Empleados M'#237'n.'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_masaminima'
        Title.Caption = 'Masa M'#237'nima'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Width = 166
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT aem.em_cuit, aem.em_nombre, aco.co_contrato, iem.em_emple' +
        'adosminimos, iem.em_masaminima, iem.em_usualta,'
      '       iem.em_fechaalta, iem.em_usumodif, iem.em_fechamodif'
      
        '  FROM emi.iem_empresaminimo iem, afi.aem_empresa aem, afi.aco_c' +
        'ontrato aco'
      ' WHERE iem.em_idempresa = aem.em_id'
      '   AND aco.co_contrato = art.get_vultcontrato(aem.em_cuit)')
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
