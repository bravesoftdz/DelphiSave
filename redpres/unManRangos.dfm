object frmManRangos: TfrmManRangos
  Left = 250
  Top = 105
  Width = 516
  Height = 225
  Caption = 'frmManRangos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTrabajador: TPanel
    Left = 8
    Top = 44
    Width = 433
    Height = 21
    BevelOuter = bvNone
    TabOrder = 0
    OnExit = pnlTrabajadorExit
    object Label1: TLabel
      Left = 96
      Top = 4
      Width = 86
      Height = 13
      Caption = 'Apellido y Nombre'
    end
    object edUsuario: TEdit
      Left = 0
      Top = 0
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edUsuarioKeyPress
    end
    object cmbUsuario: TArtComboBox
      Left = 184
      Top = 0
      Width = 249
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'SE_USUARIO'
          Title.Caption = 'Código'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SE_NOMBRE'
          Title.Caption = 'Apellido y Nombre'
          Visible = True
        end>
      DataSource = dsUsuario
      OnCloseUp = cmbUsuarioCloseUp
      OnDropDown = cmbUsuarioDropDown
    end
  end
  object cmbAccion: TRxDBLookupCombo
    Left = 8
    Top = 88
    Width = 197
    Height = 21
    DropDownCount = 8
    LookupField = 'TB_CODIGO'
    LookupDisplay = 'TB_DESCRIPCION'
    LookupSource = dsAccion
    TabOrder = 1
  end
  object ambRangos: TABMDialog
    Fields = <
      item
        Caption = 'Usuarios'
        FieldName = 'RA_USUARIO'
        PrimaryKey = True
        MaxLength = 20
        Order = otAscending
        ColWidth = 80
      end
      item
        Caption = 'Apellido y Nombre'
        FieldName = 'SE_NOMBRE'
        MaxLength = 50
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 120
      end
      item
        Caption = 'Sector'
        FieldName = 'SC_DESCRIPCION'
        MaxLength = 60
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 120
      end
      item
        Caption = 'Acción'
        FieldName = 'RA_ACCION'
        PrimaryKey = True
        DefaultValue = 'P'
        MaxLength = 1
        Order = otAscending
        Options = [foAllowSort, foShowInEditor, foAllowPrint]
        ColWidth = 60
      end
      item
        Caption = 'Acción'
        FieldName = 'DESC_ACCION'
        ReadOnly = True
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 75
      end
      item
        Caption = 'Mínimo'
        FieldName = 'RA_MINIMO'
        PrimaryKey = True
        DefaultValue = '0'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 12
        Order = otAscending
        ColWidth = 68
      end
      item
        Caption = 'Máximo'
        FieldName = 'RA_MAXIMO'
        PrimaryKey = True
        DefaultValue = '0'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 12
        Order = otAscending
        ColWidth = 68
      end
      item
        Caption = 'Usuario de Alta'
        FieldName = 'RA_USUALTA'
        FieldType = ftUserNew
        MaxLength = 20
        ColWidth = 80
      end
      item
        Caption = 'Fecha de Alta'
        FieldName = 'RA_FECHAALTA'
        PrimaryKey = True
        EditType = etDate
        FieldType = ftDateNew
        MaxLength = 10
        ColWidth = 60
      end
      item
        Caption = 'Usuario de Baja'
        FieldName = 'RA_USUBAJA'
        FieldType = ftUserDelete
        MaxLength = 20
        ColWidth = 80
      end
      item
        Caption = 'Fecha de Baja'
        FieldName = 'RA_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        ColWidth = 60
      end>
    Caption = 'Rangos de Aprobación o Autorización'
    TableName = 'MRA_RANGOAPRO'
    DataSource = dsRangos
    ABMButtons = [abNew, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 70
    SecurityKey = 'frmManRangos_ambRangos'
    BeforePrint = ambRangosBeforePrint
    BeforeSave = ambRangosBeforeSave
    OnNeedControl = ambRangosNeedControl
    CustomSetValue = ambRangosCustomSetValue
    CustomGetSQLValue = ambRangosCustomGetSQLValue
    CustomSetDefault = ambRangosCustomSetDefault
    Left = 8
    Top = 8
  end
  object sdqRangos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT RA_USUARIO, SE_NOMBRE, SC_DESCRIPCION, RA_ACCION,'
      '       TB_DESCRIPCION DESC_ACCION,'
      
        '       RA_MINIMO, RA_MAXIMO, RA_USUALTA, RA_FECHAALTA, RA_USUBAJ' +
        'A, RA_FECHABAJA'
      'FROM CTB_TABLAS, USE_USUARIOS, USC_SECTORES, MRA_RANGOAPRO'
      'WHERE RA_USUARIO = SE_USUARIO'
      'AND SC_CODIGO = SE_SECTOR'
      'AND TB_CLAVE =  '#39'TRANG'#39
      'AND TB_MODULO = '#39'MUTUAL'#39
      'AND TB_CODIGO = RA_ACCION')
    Left = 36
    Top = 8
  end
  object dsRangos: TDataSource
    DataSet = sdqRangos
    Left = 64
    Top = 8
  end
  object sdqUsuario: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT SE_USUARIO, SE_NOMBRE'
      'FROM USE_USUARIOS')
    Left = 444
    Top = 40
    object sdqUsuarioSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
      Required = True
    end
    object sdqUsuarioSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
  end
  object dsUsuario: TDataSource
    DataSet = sdqUsuario
    Left = 472
    Top = 40
  end
  object sdqAccion: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TRANG'#39)
    Left = 220
    Top = 84
  end
  object dsAccion: TDataSource
    DataSet = sdqAccion
    Left = 248
    Top = 84
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 93
    Top = 8
  end
end
