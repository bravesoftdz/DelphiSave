object frmManPracticasModulos: TfrmManPracticasModulos
  Left = 324
  Top = 381
  Width = 239
  Height = 92
  Caption = 'frmManPracticasModulos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT *'
      'FROM AMED.MPM_PRACTICAMODULO')
    Left = 12
    Top = 8
    object sdqDatosPM_ID: TFloatField
      FieldName = 'PM_ID'
      Required = True
    end
    object sdqDatosPM_DESCRIPCION: TStringField
      FieldName = 'PM_DESCRIPCION'
      Size = 100
    end
    object sdqDatosPM_USUALTA: TStringField
      FieldName = 'PM_USUALTA'
    end
    object sdqDatosPM_FECHALTA: TDateTimeField
      FieldName = 'PM_FECHALTA'
    end
    object sdqDatosPM_USUBAJA: TStringField
      FieldName = 'PM_USUBAJA'
    end
    object sdqDatosPM_FECHABAJA: TDateTimeField
      FieldName = 'PM_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 40
    Top = 8
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Código'
        FieldName = 'PM_ID'
        PrimaryKey = True
        MaxLength = 2
        ReadOnly = True
        ColWidth = 68
      end
      item
        Caption = 'Descripción'
        FieldName = 'PM_DESCRIPCION'
        MaxLength = 100
        ColWidth = 350
      end
      item
        Caption = 'PM_FECHALTA'
        FieldName = 'PM_FECHALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 0
      end
      item
        Caption = 'PM_USUALTA'
        FieldName = 'PM_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 0
      end
      item
        Caption = 'PM_FECHABAJA'
        FieldName = 'PM_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        ColWidth = 0
      end
      item
        Caption = 'PM_USUBAJA'
        FieldName = 'PM_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 0
      end>
    Caption = 'Prácticas Módulos'
    TableName = 'AMED.MPM_PRACTICAMODULO'
    DataSource = dsDatos
    ABMButtons = [abNew, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    SecurityKey = 'frmManPracticaModulo_ABMDialog'
    BeforeABM = ABMDialogBeforeABM
    OnGetCellParams = ABMDialogGetCellParams
    Left = 68
    Top = 8
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 96
    Top = 8
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 124
    Top = 8
  end
end
