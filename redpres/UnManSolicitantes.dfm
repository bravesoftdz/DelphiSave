object frmManSolicitantes: TfrmManSolicitantes
  Left = 470
  Top = 314
  Width = 263
  Height = 109
  Caption = 'frmManSolicitantes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 64
    Top = 20
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_CLAVE, TB_DESCRIPCION, TB_ESPECIAL1, TB_BAJ' +
        'A'
      'FROM CTB_TABLAS'
      'WHERE  TB_CLAVE = '#39'TRASS'#39' '
      '       AND TB_CODIGO <> '#39'0'#39)
    Left = 92
    Top = 20
    object sdqDatosTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Required = True
      Size = 10
    end
    object sdqDatosTB_CLAVE: TStringField
      FieldName = 'TB_CLAVE'
      Required = True
      Size = 5
    end
    object sdqDatosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDatosTB_ESPECIAL1: TStringField
      FieldName = 'TB_ESPECIAL1'
      Size = 30
    end
    object sdqDatosTB_BAJA: TStringField
      FieldName = 'TB_BAJA'
      Size = 1
    end
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Código'
        FieldName = 'TB_CODIGO'
        PrimaryKey = True
        CharCase = ecUpperCase
        MaxLength = 1
        ColWidth = 45
      end
      item
        Caption = 'TB_CLAVE'
        FieldName = 'TB_CLAVE'
        Visible = False
        PrimaryKey = True
        DefaultValue = 'TRASS'
        MaxLength = 5
        ReadOnly = True
        ColWidth = 30
      end
      item
        Caption = 'Descripción'
        FieldName = 'TB_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 150
        ColWidth = 150
      end
      item
        Caption = 'Dado de Baja'
        FieldName = 'TB_BAJA'
        Visible = False
        MaxLength = 1
        ColWidth = 10
      end>
    Caption = 'Mantenimiento de Solicitantes'
    TableName = 'CTB_TABLAS'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManTiposTraslado_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    OnGetCellParams = ABMDialogGetCellParams
    Left = 120
    Top = 20
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Código'
        TitleAlignment = taCenter
        DataField = 'TB_CODIGO'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Descripción'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 100
      end
      item
        Title = 'Dado de baja'
        TitleAlignment = taCenter
        DataField = 'TB_BAJA'
        Alignment = taCenter
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Solicitantes'
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
    Left = 148
    Top = 20
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 176
    Top = 20
  end
end
