inherited frmManRAD_ARCHIVODOCUMENTO: TfrmManRAD_ARCHIVODOCUMENTO
  Left = 104
  Top = 128
  Width = 600
  Height = 460
  Caption = 'Mantenimiento de Documentos por Archivo'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 30
    Visible = True
    DesignSize = (
      592
      30)
    object lbTipoArchivo: TLabel
      Left = 4
      Top = 8
      Width = 39
      Height = 13
      Caption = 'Archivo:'
    end
    inline fraTipoArchivoBusqueda: TfraCodigoDescripcion
      Left = 47
      Top = 4
      Width = 539
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        539
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 96
        Width = 441
      end
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 90
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 30
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 59
    Width = 592
    Height = 373
    Columns = <
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Tipo de Archivo'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Doc.'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_DESCRIPCION'
        Title.Caption = 'Documento'
        Width = 248
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJADOC'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja C'#243'd. Doc.'
        Width = 91
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 45
    Top = 108
    Width = 500
    Height = 72
    Constraints.MaxHeight = 72
    Constraints.MinHeight = 72
    Constraints.MinWidth = 500
    DesignSize = (
      500
      72)
    inherited BevelAbm: TBevel
      Top = 36
      Width = 492
    end
    object lbDocumento: TLabel [1]
      Left = 8
      Top = 12
      Width = 55
      Height = 13
      Caption = 'Documento'
    end
    inherited btnAceptar: TButton
      Left = 342
      Top = 42
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 420
      Top = 42
      TabOrder = 2
    end
    object cmbAD_IDDOCUMENTO: TDBIncComboGrid
      Left = 76
      Top = 8
      Width = 416
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      KeyField = 'TD_ID'
      ListField = 'TD_DESCRIPCION'
      ListSource = dsDocumentos
      ValidateOnExit = False
      Columns = <
        item
          Expanded = False
          FieldName = 'TD_CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TD_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 400
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TD_FECHAALTA'
          Title.Alignment = taCenter
          Title.Caption = 'F. Alta'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TD_SECTOR'
          Title.Caption = 'Sector'
          Width = 75
          Visible = True
        end>
      SearchOnExit = False
    end
  end
  object sdqDocumentos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TD_ID, TD_CODIGO, TD_DESCRIPCION, TD_SECTOR, TRUNC(TD_FEC' +
        'HAALTA) TD_FECHAALTA'
      'FROM RTD_TIPODOCUMENTO'
      'WHERE TD_FECHABAJA IS NULL'
      'ORDER BY TD_DESCRIPCION'
      '')
    Left = 184
    Top = 117
  end
  object dsDocumentos: TDataSource
    DataSet = sdqDocumentos
    Left = 212
    Top = 117
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
    Left = 111
    Top = 200
  end
end
