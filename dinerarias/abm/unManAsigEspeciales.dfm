object frmManAsigEspeciales: TfrmManAsigEspeciales
  Left = 285
  Top = 197
  Width = 386
  Height = 130
  Caption = 'frmManAsigEspeciales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fraTiposAsig: TfraCodigoDescripcion
    Left = 6
    Top = 8
    Width = 357
    Height = 23
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Left = 38
      Width = 318
    end
    inherited edCodigo: TPatternEdit
      Width = 32
    end
  end
  object edCantidad: TCurrencyEdit
    Left = 6
    Top = 35
    Width = 42
    Height = 21
    AutoSize = False
    DecimalPlaces = 0
    MaxLength = 2
    TabOrder = 1
  end
  object edFImputacion: TDateComboBox
    Left = 6
    Top = 62
    Width = 88
    Height = 21
    TabStop = False
    Color = clWhite
    TabOrder = 2
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT * '
      'FROM sas_asign_especiales, stf_tiposasigfamiliares '
      'WHERE as_tipoasignacion = tf_tipo')
    Left = 172
    Top = 40
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 200
    Top = 40
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Id'
        FieldName = 'AS_ID'
        Visible = False
        PrimaryKey = True
        EditType = etInteger
        ReadOnly = True
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Cod. Asig.'
        FieldName = 'AS_TIPOASIGNACION'
        MaxLength = 20
        ColWidth = 100
      end
      item
        Caption = 'Tipo Asignaci'#243'n'
        FieldName = 'TF_DESCRIPCION'
        MaxLength = 60
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 350
      end
      item
        Caption = 'Cantidad'
        FieldName = 'AS_CANTIDAD'
        EditType = etCurrency
        MaxLength = 2
        DecimalPlaces = 0
        ColWidth = 30
      end
      item
        Caption = 'F.Imput.'
        FieldName = 'AS_FECHAPRESENTACION'
        EditType = etDate
        ColWidth = 120
      end
      item
        Caption = 'F.Baja'
        FieldName = 'AS_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        ColWidth = 75
      end
      item
        Caption = 'AS_FECHAALTA'
        FieldName = 'AS_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 0
      end
      item
        Caption = 'AS_USUALTA'
        FieldName = 'AS_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 0
      end
      item
        Caption = 'AS_FECHAMODIF'
        FieldName = 'AS_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        ColWidth = 0
      end
      item
        Caption = 'AS_USUMODIF'
        FieldName = 'AS_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        ColWidth = 0
      end
      item
        Caption = 'AS_USUBAJA'
        FieldName = 'AS_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 0
      end
      item
        Caption = 'AS_IDTRABAJADOR'
        FieldName = 'AS_IDTRABAJADOR'
        Visible = False
        ColWidth = 0
      end
      item
        Caption = 'AS_CUIL'
        FieldName = 'AS_CUIL'
        Visible = False
        ColWidth = 0
      end>
    Caption = 'Asignaciones Familiares - Asignaciones Especiales'
    TableName = 'SAS_ASIGN_ESPECIALES'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    BeforeSave = ABMDialogBeforeSave
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    CustomSetDefault = ABMDialogCustomSetDefault
    Left = 228
    Top = 40
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 256
    Top = 40
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 312
    Top = 40
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 284
    Top = 40
  end
end
