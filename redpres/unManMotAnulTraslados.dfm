object frmManMotAnulTraslados: TfrmManMotAnulTraslados
  Left = 262
  Top = 249
  Width = 262
  Height = 81
  Caption = 'Mantenimiento de motivos de anulaci'#243'n de traslados'
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
      'SELECT * '
      'FROM smt_motanultraslados')
    Left = 48
    Top = 8
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 76
    Top = 8
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Id'
        FieldName = 'MT_ID'
        Visible = False
        PrimaryKey = True
        EditType = etInteger
        ReadOnly = True
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'C'#243'digo'
        FieldName = 'MT_CODIGO'
        MaxLength = 2
        ColWidth = 50
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'MT_DESCRIPCION'
        MaxLength = 250
        ColWidth = 350
      end
      item
        Caption = 'Permite liquidar'
        FieldName = 'MT_PERMITELIQUIDAR'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 80
      end
      item
        Caption = 'F.Baja'
        FieldName = 'MT_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 8
        ColWidth = 75
      end
      item
        Caption = 'Cantidad'
        FieldName = 'MT_USUBAJA'
        EditType = etCurrency
        FieldType = ftUserDelete
        DecimalPlaces = 0
        ColWidth = 0
      end
      item
        Caption = 'MT_FECHAALTA'
        FieldName = 'MT_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 0
      end
      item
        Caption = 'MT_USUALTA'
        FieldName = 'MT_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 0
      end
      item
        Caption = 'MT_FECHAMODIF'
        FieldName = 'MT_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        ColWidth = 0
      end
      item
        Caption = 'MT_USUMODIF'
        FieldName = 'MT_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        ColWidth = 0
      end>
    Caption = 'Mantenimiento de motivos de anulaci'#243'n de traslados'
    TableName = 'SMT_MOTANULTRASLADOS'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    BeforePrint = ABMDialogBeforePrint
    Left = 104
    Top = 8
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 132
    Top = 8
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 188
    Top = 8
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 160
    Top = 8
  end
end
