inherited frmMedidasCautelares: TfrmMedidasCautelares
  Left = 324
  Top = 205
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Medidas Cautelares'
  ClientHeight = 278
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Height = 204
    Columns = <
      item
        Expanded = False
        FieldName = 'TM_DESCRIPCION'
        Title.Caption = 'Medida Cautelar'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC_IMPORTE'
        Title.Caption = 'Importe'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 273
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 104
    Width = 436
    Height = 152
    inherited BevelAbm: TBevel
      Top = 116
      Width = 428
    end
    object lblMedidasCautelares: TLabel [1]
      Left = 6
      Top = 10
      Width = 53
      Height = 26
      Caption = ' Medidas '#13#10'Cautelares:'
    end
    object lblImporte: TLabel [2]
      Left = 7
      Top = 41
      Width = 38
      Height = 13
      Caption = 'Importe:'
      FocusControl = edImporte
    end
    object lblDetalle: TLabel [3]
      Left = 9
      Top = 68
      Width = 36
      Height = 13
      Caption = 'Detalle:'
    end
    inherited btnAceptar: TButton
      Left = 278
      Top = 122
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 356
      Top = 122
      TabOrder = 4
    end
    inline fraMedidasCautelares: TfraCodigoDescripcion
      Left = 61
      Top = 9
      Width = 367
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 302
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object edImporte: TCurrencyEdit
      Left = 62
      Top = 38
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      MaxValue = 99999999.990000000000000000
      TabOrder = 1
    end
    object edObservaciones: TRichEdit
      Left = 60
      Top = 63
      Width = 371
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      PlainText = True
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT tm_descripcion, mc_id, mc_idtipomedida, mc_importe, mc_ob' +
        'servaciones,'
      '       mc_fechabaja'
      
        '  FROM legales.ltm_tipomedidas ltm, legales.lmc_medidascautelare' +
        's lmc'
      
        ' WHERE tm_id = mc_idtipomedida AND mc_idjuicioentramite = :idjui' +
        'cio'
      '')
    Left = 4
    Top = 153
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicio'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 32
    Top = 153
  end
  inherited SortDialog: TSortDialog
    Left = 4
    Top = 181
  end
  inherited ExportDialog: TExportDialog
    Left = 32
    Top = 181
  end
  inherited QueryPrint: TQueryPrint
    Left = 32
    Top = 209
  end
  inherited Seguridad: TSeguridad
    Left = 4
    Top = 125
  end
  inherited FormStorage: TFormStorage
    Left = 32
    Top = 125
  end
  inherited PrintDialog: TPrintDialog
    Left = 4
    Top = 209
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
    Left = 60
    Top = 125
  end
  inherited FieldHider: TFieldHider
    Left = 60
    Top = 153
  end
end
