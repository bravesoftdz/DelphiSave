inherited frmManReclamos: TfrmManReclamos
  Left = 250
  Top = 346
  Width = 529
  Height = 302
  Caption = 'Mantenimientos de Tipos Reclamos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 521
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 521
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 517
      end>
    inherited ToolBar: TToolBar
      Width = 504
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 521
    Height = 245
    Columns = <
      item
        Expanded = False
        FieldName = 'RC_ID'
        Title.Caption = 'C'#243'd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_DESCRIPCION'
        Title.Caption = 'Descripcion'
        Width = 334
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_RECLAMAINCAPACIDAD'
        Title.Caption = 'Recl.Inc.'
        Width = 82
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 88
    Top = 64
    Width = 389
    Height = 166
    inherited BevelAbm: TBevel
      Top = 130
      Width = 381
    end
    object lblDescripcion: TLabel [1]
      Left = 12
      Top = 13
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 231
      Top = 136
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 136
    end
    object edDescripcion: TEdit
      Left = 77
      Top = 11
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
    end
    object chkReclamaIncapacidad: TCheckBox
      Left = 12
      Top = 103
      Width = 137
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Reclama Incapacidad'
      TabOrder = 3
    end
    object gbPerfil: TGroupBox
      Left = 10
      Top = 40
      Width = 365
      Height = 54
      Caption = 'Perfil'
      TabOrder = 4
      object chkDemandada: TCheckBox
        Left = 20
        Top = 20
        Width = 81
        Height = 17
        Caption = 'Demandada'
        TabOrder = 0
      end
      object chkActora: TCheckBox
        Left = 144
        Top = 20
        Width = 69
        Height = 17
        Caption = 'Actora'
        TabOrder = 1
      end
      object chkMediacion: TCheckBox
        Left = 248
        Top = 20
        Width = 81
        Height = 17
        Caption = 'Mediaci'#243'n'
        TabOrder = 2
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT lrc.rc_id, lrc.rc_descripcion, lrc.rc_reclamaincapacidad,' +
        ' RC_FECHABAJA, rc_etapa'
      '  FROM legales.lrc_reclamo lrc')
    Left = 16
    Top = 76
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 76
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'C'#243'd.'
        DataField = 'RC_ID'
        FieldIndex = 0
      end
      item
        Title = 'Descripcion'
        DataField = 'RC_DESCRIPCION'
        FieldIndex = 1
      end
      item
        Title = 'Recl.Inc.'
        DataField = 'RC_RECLAMAINCAPACIDAD'
        FieldIndex = 2
      end>
    Left = 16
    Top = 104
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 104
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 132
  end
  inherited Seguridad: TSeguridad
    Left = 15
    Top = 48
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 48
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 132
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 48
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 76
  end
end
