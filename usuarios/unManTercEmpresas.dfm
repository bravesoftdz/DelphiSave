inherited frmManTercEmpresas: TfrmManTercEmpresas
  Caption = 'Empresas de Tercerizadoras'
  ClientWidth = 612
  ExplicitWidth = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 612
    Height = 48
    Visible = True
    ExplicitWidth = 718
    ExplicitHeight = 48
    object pnlVigencias: TPanel
      Left = 5
      Top = 4
      Width = 258
      Height = 39
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      object rbConVigencia: TRadioButton
        Left = 4
        Top = 9
        Width = 88
        Height = 17
        Caption = 'Con Vigencia'
        TabOrder = 0
      end
      object rbSinVigencia: TRadioButton
        Left = 100
        Top = 9
        Width = 88
        Height = 17
        Caption = 'Sin Vigencia'
        TabOrder = 1
      end
      object rbTodos: TRadioButton
        Left = 196
        Top = 9
        Width = 53
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 266
      Top = -1
      Width = 345
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tercerizadora'
      TabOrder = 1
      ExplicitWidth = 451
      DesignSize = (
        345
        44)
      inline fraTercerizadoraFiltro: TfraCodigoDescripcion
        Left = 5
        Top = 15
        Width = 335
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 441
        inherited cmbDescripcion: TArtComboBox
          Width = 270
          ExplicitWidth = 376
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 612
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 608
      end>
    inherited ToolBar: TToolBar
      Left = 9
      Width = 599
      ExplicitLeft = 9
      ExplicitWidth = 599
      inherited tbModificar: TToolButton
        Hint = 'Cerrar Vigencia...'
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 612
    Height = 359
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT Empresa'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_IDTERCERIZADORA'
        Title.Caption = 'Id Emp. Terc.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPTERCE'
        Title.Caption = 'Emp. Tercerizadora'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_VIGENCIADESDE'
        Title.Caption = 'Vigencia Desde'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_VIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 85
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 121
    Top = 168
    Height = 189
    BorderStyle = bsDialog
    ExplicitLeft = 121
    ExplicitTop = 168
    ExplicitHeight = 189
    inherited BevelAbm: TBevel
      Top = 153
      ExplicitTop = 153
    end
    inherited btnAceptar: TButton
      Top = 159
      TabOrder = 3
      ExplicitTop = 159
    end
    inherited btnCancelar: TButton
      Top = 159
      TabOrder = 4
      ExplicitTop = 159
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 2
      Width = 451
      Height = 47
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        451
        47)
      inline fraEmpresa: TfraEmpresa
        Left = 5
        Top = 17
        Width = 439
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 17
        ExplicitWidth = 439
        ExplicitHeight = 24
        DesignSize = (
          439
          24)
        inherited lbContrato: TLabel
          Left = 335
          ExplicitLeft = 141
        end
        inherited edContrato: TIntEdit
          Left = 382
          ExplicitLeft = 382
        end
        inherited cmbRSocial: TArtComboBox
          Width = 200
          ExplicitWidth = 200
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 52
      Width = 451
      Height = 47
      Caption = 'Tercerizadora'
      TabOrder = 1
      DesignSize = (
        451
        47)
      inline fraTercerizadora: TfraCodigoDescripcion
        Left = 5
        Top = 18
        Width = 441
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 18
        ExplicitWidth = 441
        inherited cmbDescripcion: TArtComboBox
          Width = 376
          ExplicitWidth = 376
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 102
      Width = 451
      Height = 47
      Caption = 'Vigencias'
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 24
        Width = 75
        Height = 13
        Caption = 'Vigencia Desde'
      end
      object Label2: TLabel
        Left = 247
        Top = 24
        Width = 72
        Height = 13
        Caption = 'Vigencia Hasta'
      end
      object dcVigenciaDesde: TDateComboBox
        Left = 88
        Top = 18
        Width = 112
        Height = 21
        TabOrder = 0
      end
      object dcVigenciaHasta: TDateComboBox
        Left = 326
        Top = 18
        Width = 112
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT et_id, em_id, em_cuit, em_nombre EMPRESA, et_idtercerizad' +
        'ora, tm_nombre EMPTERCE, '
      '             et_vigenciadesde, et_vigenciahasta'
      
        '  FROM amed.met_empresa_terce, amed.mtm_tercerizadora_medica, af' +
        'i.aem_empresa '
      'WHERE et_idtercerizadora = tm_id '
      '     AND et_idempresa = em_id'
      'order by em_nombre')
  end
  inherited ShortCutControl: TShortCutControl
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
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
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
      end
      item
        Key = 0
      end>
  end
end
