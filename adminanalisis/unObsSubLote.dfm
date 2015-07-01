inherited frmObsSubLote: TfrmObsSubLote
  Left = 231
  Top = 148
  Width = 522
  Height = 469
  Caption = 'Observaciones del SubLote'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 514
    Height = 22
  end
  inherited CoolBar: TCoolBar
    Top = 22
    Width = 514
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 510
      end>
    inherited ToolBar: TToolBar
      Width = 497
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 51
    Width = 345
    Height = 391
    Align = alLeft
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OS_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TO_DESCRIPCION'
        Title.Caption = 'Observaci'#243'n'
        Width = 242
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 345
    Top = 51
    Width = 169
    Height = 391
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 4
    object redObservaciones: TRichEdit
      Left = 0
      Top = 20
      Width = 169
      Height = 371
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 169
      Height = 20
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Observaciones'
      TabOrder = 1
    end
  end
  inherited fpAbm: TFormPanel
    Left = 117
    Top = 99
    Width = 528
    Height = 300
    Constraints.MinHeight = 300
    Constraints.MinWidth = 400
    inherited BevelAbm: TBevel
      Top = 264
      Width = 520
    end
    object Label2: TLabel [1]
      Left = 6
      Top = 37
      Width = 96
      Height = 13
      Caption = 'Fecha Observaci'#243'n:'
    end
    object Label1: TLabel [2]
      Left = 10
      Top = 9
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 370
      Top = 270
    end
    inherited btnCancelar: TButton
      Left = 448
      Top = 270
    end
    object edFecha: TDateComboBox
      Left = 104
      Top = 35
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edObservacion: TRichEdit
      Left = 6
      Top = 61
      Width = 516
      Height = 200
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      ScrollBars = ssBoth
      TabOrder = 3
    end
    inline fraObservacion: TfraCodigoDescripcion
      Left = 105
      Top = 4
      Width = 417
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 352
        DataSource = nil
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT   *'
      
        '    FROM hys.hos_observacionessublote, hys.hto_tipoobservacionsu' +
        'blote'
      '   WHERE os_idlote = :pidlote'
      '     AND os_idestableci = :pidestableci'
      '     AND OS_IDTIPOOBSERVACION = to_id'
      
        '     AND os_observacion NOT LIKE '#39'Baja de trabajador en el lote ' +
        'por Siniestro%'#39
      'ORDER BY os_fecha')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pidlote'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pidestableci'
        ParamType = ptInput
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
  end
end
