object frmManAsigHijos: TfrmManAsigHijos
  Left = 319
  Top = 175
  Width = 361
  Height = 93
  Caption = 'frmManAsigHijos'
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
      'FROM sah_Asign_Hijos'
      '')
    Left = 20
    Top = 8
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 48
    Top = 8
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Id'
        FieldName = 'AH_ID'
        Visible = False
        PrimaryKey = True
        EditType = etInteger
        ReadOnly = True
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Nombre'
        FieldName = 'AH_NOMBRE'
        MaxLength = 60
        ColWidth = 350
      end
      item
        Caption = 'Tipo y Nro. Doc.'
        FieldName = 'AH_TIPONRODOC'
        MaxLength = 20
        ColWidth = 100
      end
      item
        Caption = 'F.Nacimiento'
        FieldName = 'AH_FNACIMIENTO'
        EditType = etDate
        MaxLength = 10
        DecimalPlaces = 4
        ColWidth = 75
      end
      item
        Caption = 'Hijo Discap.'
        FieldName = 'AH_HIJODISCAPACITADO'
        EditType = etCheck
        ColWidth = 120
      end
      item
        Caption = 'F.Fallecimiento'
        FieldName = 'AH_FBAJA'
        EditType = etDate
        ColWidth = 75
      end
      item
        Caption = 'AH_FECHAALTA'
        FieldName = 'AH_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 0
      end
      item
        Caption = 'AH_USUALTA'
        FieldName = 'AH_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 0
      end
      item
        Caption = 'AH_FECHAMODIF'
        FieldName = 'AH_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        ColWidth = 0
      end
      item
        Caption = 'AH_USUMODIF'
        FieldName = 'AH_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        ColWidth = 0
      end
      item
        Caption = 'AH_USUBAJA'
        FieldName = 'AH_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 0
      end
      item
        Caption = 'AH_IDTRABAJADOR'
        FieldName = 'AH_IDTRABAJADOR'
        Visible = False
        ColWidth = 0
      end
      item
        Caption = 'AH_CUIL'
        FieldName = 'AH_CUIL'
        Visible = False
        ColWidth = 0
      end>
    Caption = 'Asignaciones Familiares - Datos de los hijos'
    TableName = 'SAH_ASIGN_HIJOS'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    SecurityKey = 'frmManAsigHijos_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    Left = 76
    Top = 8
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 104
    Top = 8
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 160
    Top = 8
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 132
    Top = 8
  end
end
