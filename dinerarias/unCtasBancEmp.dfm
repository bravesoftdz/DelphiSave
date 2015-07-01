inherited frmCtasBancEmp: TfrmCtasBancEmp
  Left = 259
  Top = 102
  Width = 755
  Height = 443
  Caption = 'Cuentas Bancarias de Empresas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 745
    Height = 53
    object gbEmpresa: TGroupBox
      Left = 2
      Top = 1
      Width = 436
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        436
        49)
      inline fraEmpresa: TfraEmpresa
        Left = 7
        Top = 18
        Width = 421
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
          Left = 317
        end
        inherited edContrato: TIntEdit
          Left = 364
        end
        inherited cmbRSocial: TArtComboBox
          Width = 182
        end
      end
    end
    object rgCuenta: TRadioGroup
      Left = 592
      Top = 1
      Width = 152
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Posee Cuenta'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todas')
      TabOrder = 1
    end
    object rgBajas: TRadioGroup
      Left = 439
      Top = 1
      Width = 152
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Mostrar Bajas'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todas')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    Width = 745
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 741
      end>
    inherited ToolBar: TToolBar
      Width = 728
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 745
    Height = 332
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_fechaaltamcarga'
        Title.Caption = 'Alta Mesa Carga'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuenta'
        Title.Caption = 'Cuenta'
        Width = 500
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT co_contrato, em_cuit, em_nombre, cp_fechabaja, cp_fechaal' +
        'tamcarga, em_id,'
      '              art.varios.get_DatosCta (cp_id) cuenta, cp_id '
      '  FROM afi.aem_empresa, ccp_cuentapago, afi.aco_contrato'
      ' WHERE cp_idacreedor(+) = em_id'
      '   AND co_idempresa = em_id'
      '   AND co_fechabaja IS NULL')
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
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
