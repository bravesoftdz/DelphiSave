inherited frmTareasaRevisar: TfrmTareasaRevisar
  Left = 492
  Top = 200
  Caption = 'Tareas a revisar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 95
    Visible = True
    object Label44: TLabel
      Left = 5
      Top = 56
      Width = 61
      Height = 13
      Caption = 'F.Alta Desde'
    end
    object Label46: TLabel
      Left = 172
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label18: TLabel
      Left = 5
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label19: TLabel
      Left = 5
      Top = 31
      Width = 30
      Height = 13
      Caption = 'Estab.'
    end
    object Label1: TLabel
      Left = 311
      Top = 56
      Width = 84
      Height = 13
      Caption = 'F.Revisi'#243'n Desde'
    end
    object Label2: TLabel
      Left = 495
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 77
      Top = 52
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 204
      Top = 52
      Width = 88
      Height = 21
      TabOrder = 1
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 77
      Top = 3
      Width = 537
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
      TabOrder = 2
      DesignSize = (
        537
        21)
      inherited lbContrato: TLabel
        Left = 433
      end
      inherited edContrato: TIntEdit
        Left = 480
      end
      inherited cmbRSocial: TArtComboBox
        Width = 298
      end
    end
    object edEstablecimiento: TPatternEdit
      Left = 77
      Top = 27
      Width = 537
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Pattern = '1234567890,'
    end
    object edFechaRevisionDesde: TDateComboBox
      Left = 400
      Top = 52
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object edFechaRevisionHasta: TDateComboBox
      Left = 527
      Top = 52
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object chkPendientes: TCheckBox
      Left = 4
      Top = 76
      Width = 86
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pendientes'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  inherited CoolBar: TCoolBar
    Top = 95
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 124
    Height = 226
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_ESTABLECI'
        Title.Caption = 'Nro.Establecimiento'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_FECHADESDE'
        Title.Caption = 'Fecha Desde'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_FECHAHASTA'
        Title.Caption = 'Fecha Hasta'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_TAREA'
        Title.Caption = 'Tarea'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_FECHAREVISION'
        Title.Caption = 'Fecha Revisi'#243'n'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_USUREVISION'
        Title.Caption = 'Usu.Revisi'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_FECHAFINALIZADO'
        Title.Caption = 'Fecha Finalizado'
        Width = 125
        Visible = True
      end>
  end
  object edObservacionGrilla: TDBMemo [3]
    Left = 0
    Top = 350
    Width = 621
    Height = 89
    Align = alBottom
    DataField = 'TE_OBSERVACION'
    DataSource = dsConsulta
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 180
    Width = 425
    Height = 169
    inherited BevelAbm: TBevel
      Top = 133
      Width = 417
    end
    object Label3: TLabel [1]
      Left = 5
      Top = 12
      Width = 50
      Height = 13
      Caption = 'F.Revisi'#243'n'
    end
    object Label4: TLabel [2]
      Left = 5
      Top = 32
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 267
      Top = 139
    end
    inherited btnCancelar: TButton
      Left = 345
      Top = 139
    end
    object edFechaRevision: TDateComboBox
      Left = 64
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edObservacion: TMemo
      Left = 4
      Top = 48
      Width = 416
      Height = 80
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT em_cuit, em_nombre, co_contrato, hte.*'
      '  FROM afi.aco_contrato, afi.aem_empresa, hys.hte_tareaerror hte'
      ' WHERE em_id = te_idempresa'
      '  AND em_id = co_idempresa'
      '  AND co_contrato = art.get_vultcontrato(em_cuit)')
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
        Key = 16463
        LinkControl = tbOrdenar
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
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 81
    Top = 256
  end
end
