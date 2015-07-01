inherited frmListHistoricoVolante: TfrmListHistoricoVolante
  Left = 218
  Top = 109
  Width = 542
  Caption = 'Hist'#243'rico de volantes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 534
    Height = 53
    object pnlFecha: TCheckPanel
      Left = 1
      Top = 2
      Width = 212
      Height = 48
      Caption = '&Fecha'
      TabOrder = 0
      Checked = False
      OnChange = pnlFechaChange
      object Label1: TLabel
        Left = 100
        Top = 24
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object deFechaDesde: TDateComboBox
        Left = 6
        Top = 20
        Width = 89
        Height = 21
        MaxDateCombo = deFechaHasta
        TabOrder = 0
      end
      object deFechaHasta: TDateComboBox
        Left = 117
        Top = 20
        Width = 89
        Height = 21
        MinDateCombo = deFechaDesde
        TabOrder = 1
      end
    end
    object pnlEstado: TCheckPanel
      Left = 217
      Top = 2
      Width = 316
      Height = 48
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '&Estado'
      TabOrder = 1
      Checked = False
      OnChange = pnlEstadoChange
      DesignSize = (
        316
        48)
      object cmbEstados: TDBCheckCombo
        Left = 7
        Top = 19
        Width = 302
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DataSource = dsEstados
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    Width = 534
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 530
      end>
    inherited ToolBar: TToolBar
      Width = 517
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 534
    Height = 235
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HV_VOLANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Volante'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HV_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HV_USUALTA'
        Title.Caption = 'Usuario'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANTERIOR'
        Title.Caption = 'Estado anterior'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_IDENTIFICADOR'
        Title.Alignment = taCenter
        Title.Caption = 'Id. Prestador'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 300
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   hv_volante, tb_descripcion, hv_fechaalta, hv_usualta, '
      '         ca_descripcion, ca_identificador,'
      
        '         art.amebpba.get_estadoprevio_vol(hv_volante,hv_id) ante' +
        'rior'
      
        '    FROM shv_historicovolante, ctb_tablas, svo_volantes, cpr_pre' +
        'stador'
      '   WHERE hv_volante = vo_volante'
      '     AND vo_prestador = ca_identificador'
      '     AND hv_estado = tb_codigo'
      '     AND tb_clave = '#39'MUVOL'#39)
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 304
    Top = 65535
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION '
      '  FROM CTB_TABLAS '
      ' WHERE TB_CLAVE = '#39'MUVOL'#39
      '   AND TB_CODIGO <> '#39'0'#39' '
      '   AND TB_ESPECIAL1 = '#39'C'#39
      'ORDER BY TB_DESCRIPCION')
    Left = 276
    Top = 65535
  end
end
