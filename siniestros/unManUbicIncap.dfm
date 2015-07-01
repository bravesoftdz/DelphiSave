object frmManUbicIncap: TfrmManUbicIncap
  Left = 224
  Top = 228
  Width = 387
  Height = 127
  Caption = 'Mantenimiento de ubicaci'#243'n de incapacidades'
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
  inline fraDelegacion: TfraCodigoDescripcion
    Left = 8
    Top = 43
    Width = 357
    Height = 23
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Left = 48
      Width = 308
    end
    inherited edCodigo: TPatternEdit
      Width = 44
    end
  end
  inline fraProvincia: TfraCodigoDescripcion
    Left = 9
    Top = 70
    Width = 357
    Height = 23
    TabOrder = 1
    inherited cmbDescripcion: TArtComboBox
      Left = 48
      Width = 308
    end
    inherited edCodigo: TPatternEdit
      Width = 44
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT ui_id, ui_codigo, ui_descripcion, ui_delegacion_asoc, ui_' +
        'fechaalta,'
      
        '       ui_usualta, ui_fechabaja, ui_usubaja, lg_nombre, pv_descr' +
        'ipcion,'
      '       ui_provincia'
      
        '  FROM SIN.sui_ubicacionincapacidad, dlg_delegaciones, cpv_provi' +
        'ncias'
      ' WHERE ui_delegacion_asoc = lg_codigo(+)'
      '   AND ui_provincia = pv_codigo(+)')
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
        FieldName = 'UI_ID'
        Visible = False
        PrimaryKey = True
        EditType = etInteger
        ReadOnly = True
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'C'#243'digo'
        FieldName = 'UI_CODIGO'
        MaxLength = 10
        ColWidth = 75
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'UI_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 60
        ColWidth = 350
      end
      item
        Caption = 'Deleg. asociada'
        FieldName = 'LG_NOMBRE'
        MaxLength = 20
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 100
      end
      item
        Caption = 'F.Baja'
        FieldName = 'UI_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        ColWidth = 75
      end
      item
        Caption = 'UI_USUBAJA'
        FieldName = 'UI_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 0
      end
      item
        Caption = 'UI_FECHAALTA'
        FieldName = 'UI_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 0
      end
      item
        Caption = 'UI_USUALTA'
        FieldName = 'UI_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 0
      end
      item
        Caption = 'Deleg. asociada'
        FieldName = 'UI_DELEGACION_ASOC'
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Provincia'
        FieldName = 'UI_PROVINCIA'
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'Provincia'
        FieldName = 'PV_DESCRIPCION'
        MaxLength = 20
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 100
      end>
    Caption = 'Ubicaci'#243'n de incapacidades'
    TableName = 'SIN.SUI_UBICACIONINCAPACIDAD'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    SecurityKey = 'frmManUbicIncap_ABMDialog'
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    CustomSetDefault = ABMDialogCustomSetDefault
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
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 160
    Top = 8
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 132
    Top = 8
  end
end
