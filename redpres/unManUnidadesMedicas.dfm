object frmManUnidadesMedicas: TfrmManUnidadesMedicas
  Left = 205
  Top = 145
  Width = 446
  Height = 209
  Caption = 'frmManUnidadesMedicas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT *'
      'FROM SUM_UNIDADESMEDICAS'
      'order by um_codigo')
    Left = 12
    Top = 8
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 40
    Top = 8
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'UM_CODIGO'
        PrimaryKey = True
        MaxLength = 2
        ColWidth = 68
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'UM_DESCRIPCION'
        MaxLength = 50
        ColWidth = 350
      end
      item
        Caption = 'Valor'
        FieldName = 'UM_VALOR'
        EditType = etCurrency
        MaxLength = 10
        DecimalPlaces = 4
        ColWidth = 75
      end
      item
        Caption = 'Fecha de Baja'
        FieldName = 'UM_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        ColWidth = 75
      end>
    Caption = 'Mantenimiento de Unidades M'#233'dicas'
    TableName = 'SUM_UNIDADESMEDICAS'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    BeforePrint = ABMDialogBeforePrint
    Left = 68
    Top = 8
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 96
    Top = 8
  end
end
