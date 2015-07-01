object frmManSubPrestaciones: TfrmManSubPrestaciones
  Left = 364
  Top = 237
  Width = 242
  Height = 84
  Caption = 'frmManSubPrestaciones'
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
    Left = 68
    Top = 12
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT  *'
      'FROM      CTB_TABLAS'
      'WHERE  TB_CLAVE = '#39'SUBPR'#39' '
      '       AND TB_CODIGO <> '#39'0'#39)
    Left = 40
    Top = 12
    object sdqDatosTB_CLAVE: TStringField
      FieldName = 'TB_CLAVE'
      Required = True
      Size = 5
    end
    object sdqDatosTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Required = True
      Size = 10
    end
    object sdqDatosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDatosTB_MODULO: TStringField
      FieldName = 'TB_MODULO'
      Size = 15
    end
    object sdqDatosTB_ESPECIAL1: TStringField
      FieldName = 'TB_ESPECIAL1'
      Size = 30
    end
    object sdqDatosTB_BAJA: TStringField
      FieldName = 'TB_BAJA'
      Size = 1
    end
    object sdqDatosTB_ESPECIAL2: TStringField
      FieldName = 'TB_ESPECIAL2'
      Size = 30
    end
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'TB_CODIGO'
        PrimaryKey = True
        MaxLength = 10
        ReadOnly = True
        ColWidth = 10
      end
      item
        Caption = 'TB_CLAVE'
        FieldName = 'TB_CLAVE'
        Visible = False
        PrimaryKey = True
        DefaultValue = 'SUBPR'
        MaxLength = 5
        ReadOnly = True
        ColWidth = 30
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'TB_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 150
        ColWidth = 150
      end
      item
        Caption = 'Dado de Baja'
        FieldName = 'TB_BAJA'
        Visible = False
        DefaultValue = 'NULL'
        MaxLength = 1
        ColWidth = 10
      end
      item
        Caption = 'Con Comodato'
        FieldName = 'TB_ESPECIAL1'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 244
      end>
    Caption = 'Mantenimiento de Subprestaciones'
    TableName = 'CTB_TABLAS'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    GetDefaults = ABMDialogGetDefaults
    OnGetCellParams = ABMDialogGetCellParams
    Left = 96
    Top = 12
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'TB_CODIGO'
        Alignment = taCenter
        MaxLength = 11
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 125
      end
      item
        Title = 'Con Comodato'
        TitleAlignment = taCenter
        DataField = 'TB_ESPECIAL1'
        Alignment = taCenter
        MaxLength = 20
      end
      item
        Title = 'Dado de baja'
        TitleAlignment = taCenter
        DataField = 'TB_BAJA'
        Alignment = taCenter
        MaxLength = 5
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Subprestaciones'
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
    PageOrientation = pxLandscape
    Left = 124
    Top = 12
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 153
    Top = 12
  end
end
