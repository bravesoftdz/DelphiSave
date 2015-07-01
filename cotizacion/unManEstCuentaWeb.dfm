inherited frmManEstCuentaWeb: TfrmManEstCuentaWeb
  Left = 314
  Top = 219
  Width = 636
  Height = 400
  Caption = 'Proceso Mensual de Estado de Cuenta Web'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 636
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 628
    Height = 15
  end
  inherited CoolBar: TCoolBar
    Top = 15
    Width = 628
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 624
      end>
    inherited ToolBar: TToolBar
      Width = 611
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 44
    Width = 628
    Height = 329
    Columns = <
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Width = 355
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_FULTPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Ult. Proceso'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_FPROXPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pr'#243'x. Proceso'
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EN_PERIODICIDADPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodicidad Proceso'
        Width = 152
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 96
    Width = 432
    Height = 124
    Constraints.MaxHeight = 124
    Constraints.MinHeight = 124
    Constraints.MinWidth = 432
    inherited BevelAbm: TBevel
      Top = 88
      Width = 424
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 13
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 32
      Width = 55
      Height = 25
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'F. Pr'#243'ximo Proceso'
      Layout = tlCenter
      WordWrap = True
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Periodicidad'
    end
    inherited btnAceptar: TButton
      Left = 272
      Top = 94
      Width = 72
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 352
      Top = 94
      Width = 72
      TabOrder = 4
    end
    inline fraEntidadesWeb: TfraEntidades
      Left = 72
      Top = 9
      Width = 358
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 293
        DataSource = nil
      end
    end
    object edFProximoProceso: TDateComboBox
      Left = 72
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edPeriodicidad: TIntEdit
      Left = 72
      Top = 60
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    AutoCalcFields = False
    UniDirectional = True
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
  object spConsulta: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'ART.Web.get_entidadestadocuenta'
    Left = 80
    Top = 312
    ParamData = <
      item
        DataType = ftCursor
        Name = 'O_RECORDSET'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'FILTRO'
        ParamType = ptInput
      end>
  end
  object sdqConsulta1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 24
    Top = 312
  end
  object dspConsulta: TDataSetProvider
    DataSet = spConsulta
    Left = 52
    Top = 312
  end
end
