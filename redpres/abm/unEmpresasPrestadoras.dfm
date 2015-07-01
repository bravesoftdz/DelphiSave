inherited frmEmpresasPrestadoras: TfrmEmpresasPrestadoras
  Left = 348
  Top = 122
  Width = 817
  Caption = 'Empresas Prestadoras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 809
    Visible = True
    object GroupBox3: TGroupBox
      Left = 2
      Top = 0
      Width = 471
      Height = 45
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        471
        45)
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 7
        Top = 17
        Width = 456
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
          Left = 352
        end
        inherited edContrato: TIntEdit
          Left = 399
        end
        inherited cmbRSocial: TArtComboBox
          Width = 217
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 561
      Top = 0
      Width = 248
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestadora'
      TabOrder = 1
      DesignSize = (
        248
        45)
      inline fraPrestadoraFiltro: TfraCodigoDescripcion
        Left = 8
        Top = 16
        Width = 234
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 169
        end
      end
    end
    object rgEmpBaja: TRadioGroup
      Left = 474
      Top = 0
      Width = 86
      Height = 45
      Caption = 'Incluir Bajas'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'S'#237
        'No')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Width = 809
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 805
      end>
    inherited ToolBar: TToolBar
      Width = 792
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 809
    Columns = <
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ep_descripcion'
        Title.Caption = 'Prestadora'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 116
    Width = 565
    Height = 169
    BorderStyle = bsSingle
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 133
      Width = 557
    end
    inherited btnAceptar: TButton
      Left = 407
      Top = 139
    end
    inherited btnCancelar: TButton
      Left = 485
      Top = 139
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 20
      Width = 533
      Height = 45
      Caption = 'Empresa'
      TabOrder = 2
      DesignSize = (
        533
        45)
      inline fraEmpresa: TfraEmpresa
        Left = 7
        Top = 17
        Width = 518
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
          Left = 414
        end
        inherited edContrato: TIntEdit
          Left = 461
        end
        inherited cmbRSocial: TArtComboBox
          Width = 279
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 76
      Width = 533
      Height = 45
      Caption = 'Prestadora'
      TabOrder = 3
      inline fraPrestadora: TfraCodigoDescripcion
        Left = 6
        Top = 16
        Width = 521
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 456
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT es_id, es_idempresa, es_idprestadora, ep_descripcion, '
      '                es_fechabaja, em_nombre, em_cuit '
      
        '            FROM art.aes_empresaservicio, art.aep_empresaprestad' +
        'ora,'
      '                        afi.aem_empresa'
      
        '           WHERE es_idprestadora = ep_id and em_id = es_idempres' +
        'a')
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
