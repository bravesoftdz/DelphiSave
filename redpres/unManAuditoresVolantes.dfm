object frmManAuditoresVolantes: TfrmManAuditoresVolantes
  Left = 248
  Top = 208
  Width = 351
  Height = 160
  Caption = 'frmManAuditoresVolantes'
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
    Left = 4
    Top = 53
    Width = 301
    Height = 21
    TabOrder = 0
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 122
    Top = 10
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Usuario Auditor'
        DataField = 'SE_NOMBRE'
        MaxLength = 100
      end
      item
        Title = 'Fecha de alta'
        DataField = 'VU_FECHAALTA'
        Visible = False
        MaxLength = 70
      end
      item
        Title = 'Fecha de baja'
        DataField = 'VU_FECHABAJA'
        Visible = False
        MaxLength = 70
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Auditores de Volantes'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
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
    Footer.Font.Height = -11
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
    PageOrientation = pxLandscape
    OnGetCellParams = QueryPrintGetCellParams
    Left = 93
    Top = 10
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'ID'
        FieldName = 'VU_ID'
        Visible = False
        PrimaryKey = True
        EditType = etInteger
        ColWidth = 0
      end
      item
        Caption = 'Usuario Auditor'
        FieldName = 'VU_USUAUDITOR'
        MaxLength = 20
        ColWidth = 150
      end
      item
        Caption = 'VU_FECHAALTA'
        FieldName = 'VU_FECHAALTA'
        Visible = False
        EditType = etDate
        FieldType = ftDateNew
        ColWidth = 70
      end
      item
        Caption = 'VU_FECHABAJA'
        FieldName = 'VU_FECHABAJA'
        Visible = False
        EditType = etDate
        FieldType = ftDateDelete
        ColWidth = 70
      end
      item
        Caption = 'Usuario Auditor'
        FieldName = 'SE_NOMBRE'
        MaxLength = 300
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 250
      end>
    Caption = 'Mantenimiento de Auditores de Volantes'
    TableName = 'SVU_AUDITORESVOLANTES'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManAuditoresVolantes_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    CustomSetDefault = ABMDialogCustomSetDefault
    Left = 65
    Top = 10
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 37
    Top = 10
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT VU_ID, VU_USUAUDITOR, VU_FECHAALTA, VU_FECHABAJA, SE_NOMB' +
        'RE  '
      '  FROM SVU_AUDITORESVOLANTES, USE_USUARIOS'
      ' WHERE VU_USUAUDITOR = SE_USUARIO')
    Left = 9
    Top = 10
    object sdqDatosVU_ID: TFloatField
      FieldName = 'VU_ID'
    end
    object sdqDatosVU_USUAUDITOR: TStringField
      DisplayWidth = 100
      FieldName = 'VU_USUAUDITOR'
    end
    object sdqDatosVU_FECHAALTA: TDateTimeField
      FieldName = 'VU_FECHAALTA'
    end
    object sdqDatosVU_FECHABAJA: TDateTimeField
      FieldName = 'VU_FECHABAJA'
    end
    object sdqDatosSE_NOMBRE: TStringField
      DisplayWidth = 250
      FieldName = 'SE_NOMBRE'
      Size = 250
    end
  end
end
