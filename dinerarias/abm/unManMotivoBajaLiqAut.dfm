inherited frmManMotivoBajaLiqAut: TfrmManMotivoBajaLiqAut
  Left = 326
  Top = 180
  Caption = 'Motivos de baja de liquidaciones autom'#225'ticas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ML_ID'
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 350
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 200
    Width = 445
    Height = 114
    ActiveControl = edCodigo
    inherited BevelAbm: TBevel
      Top = 78
      Width = 437
    end
    object Label1: TLabel [1]
      Left = 35
      Top = 21
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 49
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 287
      Top = 84
    end
    inherited btnCancelar: TButton
      Left = 365
      Top = 84
    end
    object edCodigo: TEdit
      Left = 74
      Top = 16
      Width = 54
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 74
      Top = 44
      Width = 361
      Height = 21
      MaxLength = 250
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ML_CODIGO, ML_DESCRIPCION, ML_FECHABAJA, ML_ID'
      'FROM SIN.sml_motivobajaliqaut')
    Left = 4
    Top = 152
  end
  inherited dsConsulta: TDataSource
    Left = 32
    Top = 152
  end
  inherited SortDialog: TSortDialog
    Left = 4
    Top = 180
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'ML_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'ML_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'ML_FECHABAJA'
        Title = 'Fecha de Baja'
      end>
    Left = 32
    Top = 180
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'C'#243'digo'
        DataField = 'ML_CODIGO'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ML_DESCRIPCION'
        Width = 700
        MaxLength = 0
      end
      item
        Title = 'Fecha Baja'
        DataField = 'ML_FECHABAJA'
        Width = 200
        MaxLength = 0
      end>
    Title.Text = 'Mantenimiento de Motivos de baja de liquidaciones autom'#225'ticas'
    Left = 32
    Top = 208
  end
  inherited Seguridad: TSeguridad
    Left = 4
    Top = 124
  end
  inherited FormStorage: TFormStorage
    Left = 32
    Top = 124
  end
  inherited PrintDialog: TPrintDialog
    Left = 4
    Top = 208
  end
  inherited ShortCutControl: TShortCutControl
    Left = 60
    Top = 124
  end
  inherited FieldHider: TFieldHider
    Left = 60
    Top = 152
  end
end
