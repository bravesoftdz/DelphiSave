inherited frmManTransicionEstados: TfrmManTransicionEstados
  Left = 184
  Top = 54
  Width = 703
  Height = 612
  Caption = 'Mantenimiento de Transiciones de Estados de Lotes'
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
        FieldName = 'te_inicial'
        Title.Alignment = taCenter
        Title.Caption = 'Edo.Inic.'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado_inicial'
        Title.Caption = 'Descripci'#243'n Edo. Inicial'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'te_final'
        Title.Alignment = taCenter
        Title.Caption = 'Edo.Fin.'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado_final'
        Title.Caption = 'Descripci'#243'n Edo. Final'
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
      Width = 45
      Height = 13
      Caption = 'Al Estado'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 9
      Width = 52
      Height = 13
      Caption = 'Del Estado'
    end
    inherited btnAceptar: TButton
      Left = 228
      Top = 400
    end
    inherited btnCancelar: TButton
      Left = 309
      Top = 400
    end
    inline fraEstadoInicial: TfraCodigoDescripcion
      Left = 11
      Top = 24
      Width = 368
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 303
      end
    end
    object clbEdoFinal: TRxCheckListBox
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
      'SELECT   te_id, dei.de_id id_inicial, te_inicial,'
      
        '         dei.de_descripcion estado_inicial, te_final, def.de_id ' +
        'id_final,'
      '         def.de_descripcion estado_final, te_fechabaja'
      
        '    FROM hys.hte_transicionestado, hys.hde_descripcionestadolote' +
        ' dei,'
      '         hys.hde_descripcionestadolote def'
      '   WHERE dei.de_codigo = te_inicial'
      '     AND def.de_codigo = te_final'
      'ORDER BY dei.de_descripcion, def.de_descripcion')
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
      'SELECT   de_codigo, de_descripcion, te_fechabaja, te_id'
      '    FROM hys.hte_transicionestado, hys.hde_descripcionestadolote'
      '   WHERE te_final(+) = de_codigo'
      '     AND te_inicial(+) = :pinicial'
      'ORDER BY de_descripcion'
      '')
    Left = 16
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pinicial'
        ParamType = ptInput
      end>
  end
end
