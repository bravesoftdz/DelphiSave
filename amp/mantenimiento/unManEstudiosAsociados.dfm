inherited frmManEstudiosAsociados: TfrmManEstudiosAsociados
  Left = 184
  Top = 54
  Width = 703
  Height = 612
  Caption = 'Mantenimiento de Asociaci'#243'n entre Estudios para Seguimiento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 695
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 695
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 691
      end>
    inherited ToolBar: TToolBar
      Width = 678
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 695
    Height = 555
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigobase'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.Base'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcionbase'
        Title.Caption = 'Descripci'#243'n Estudio Base'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigoasociado'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.Asoc.'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcionasociado'
        Title.Caption = 'Descripci'#243'n Estudio Asociado'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 75
    Width = 389
    Height = 430
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 394
      Width = 381
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 51
      Width = 92
      Height = 13
      Caption = 'Estudios Asociados'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 9
      Width = 62
      Height = 13
      Caption = 'Estudio Base'
    end
    inherited btnAceptar: TButton
      Left = 228
      Top = 400
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 400
    end
    inline fraEstBase: TfraCodigoDescripcion
      Left = 11
      Top = 24
      Width = 368
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 303
      end
    end
    object clbEstAsociado: TRxCheckListBox
      Left = 12
      Top = 66
      Width = 366
      Height = 322
      CheckKind = ckCheckMarks
      ItemHeight = 13
      TabOrder = 3
      InternalVersion = 202
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   ea_id, ea_estudiobase, ea_estudioasociado, ea_fechabaja' +
        ','
      '         e1.es_id idbase, e1.es_codigo codigobase,'
      '         e1.es_descripcion descripcionbase, e2.es_id idasociado,'
      
        '         e2.es_codigo codigoasociado, e2.es_descripcion descripc' +
        'ionasociado'
      
        '    FROM hys.hea_estudioasociado, art.aes_estudios e1, art.aes_e' +
        'studios e2'
      '   WHERE e1.es_id = ea_estudiobase'
      '     AND e2.es_id = ea_estudioasociado'
      'ORDER BY e1.es_codigo, e2.es_codigo')
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
        Title = 'Descripci'#243'n Beneficiario'
        DataField = 'bp_descripcion'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n Concepto'
        DataField = 'cp_denpago'
        FieldIndex = 1
      end
      item
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
  object sdqEdoFinal: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   es_id, es_codigo || '#39'  '#39' || es_descripcion descripcion,' +
        ' ea_fechabaja,'
      '         ea_id'
      '    FROM hys.hea_estudioasociado, art.aes_estudios'
      '   WHERE es_fechabaja IS NULL'
      '     AND ea_estudioasociado(+) = es_id'
      '     AND es_id <> :idbase'
      '     AND ea_estudiobase(+) = :idbase'
      'ORDER BY es_descripcion')
    Left = 16
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idbase'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idbase'
        ParamType = ptInput
      end>
  end
end
