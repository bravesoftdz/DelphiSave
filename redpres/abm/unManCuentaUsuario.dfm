object frmManCuentaUsuario: TfrmManCuentaUsuario
  Left = 258
  Top = 230
  Width = 395
  Height = 98
  Caption = 'frmManCuentaUsuario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline fraUsuario: TfraUsuario
    Left = 5
    Top = 38
    Width = 282
    Height = 21
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Width = 198
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT cu_usuario, cu_cuenta, cu_usualta, cu_fechaalta,'
      '       cu_usumodif, cu_fechamodif, cu_usubaja, cu_fechabaja'
      '  FROM ccu_cuentausuario ')
    Left = 4
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Usuario'
        FieldName = 'CU_USUARIO'
        PrimaryKey = True
        MaxLength = 10
        ColWidth = 200
      end
      item
        Caption = 'Nro. cuenta'
        FieldName = 'CU_CUENTA'
        MaxLength = 60
        ColWidth = 260
      end
      item
        Caption = 'CU_USUALTA'
        FieldName = 'CU_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 60
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 173
      end
      item
        Caption = 'CU_FECHAALTA'
        FieldName = 'CU_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        MaxLength = 20
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 50
      end
      item
        Caption = 'CU_USUBAJA'
        FieldName = 'CU_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end
      item
        Caption = 'CU_FECHABAJA'
        FieldName = 'CU_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 148
      end
      item
        Caption = 'CU_USUMODIF'
        FieldName = 'CU_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end
      item
        Caption = 'CU_FECHAMODIF'
        FieldName = 'CU_FECHAMODIF'
        Visible = False
        Options = [foAllowSort, foAllowPrint]
        ColWidth = 0
      end>
    Caption = 'Mantenimiento de cuentas de usuario'
    TableName = 'CCU_CUENTAUSUARIO'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManCCU_CUENTAUSUARIODialog'
    BeforePrint = ABMDialogBeforePrint
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    CustomSetDefault = ABMDialogCustomSetDefault
    Left = 60
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 32
    Top = 4
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Aseguradoras de Fondos de Jubilaciones y Pensiones'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 95
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 88
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 117
    Top = 4
  end
end
