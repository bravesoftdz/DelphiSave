object frmManDerivacionVolantes: TfrmManDerivacionVolantes
  Left = 369
  Top = 215
  Width = 555
  Height = 424
  Caption = 'frmManDerivacionVolantes'
  Color = clBtnFace
  Constraints.MinHeight = 424
  Constraints.MinWidth = 555
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
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION, TB_FECHABAJA'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE='#39'MUVOL'#39
      '   AND TB_ESPECIAL2 LIKE '#39'D%'#39
      'UNION ALL   '
      'SELECT TB_CODIGO, TB_DESCRIPCION, TB_FECHABAJA'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE='#39'VOLAV'#39
      '   AND TB_CODIGO <> '#39'0'#39
      '')
    Left = 9
    Top = 10
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 37
    Top = 10
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'TB_CODIGO'
        ColWidth = 50
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'TB_DESCRIPCION'
        ColWidth = 100
      end>
    Caption = 'Mantenimiento de Derivaci'#243'n de Volantes'
    TableName = 'CTB_TABLAS'
    DataSource = dsDatos
    ABMButtons = [abSave, abOrder, abNavigator, abProperty]
    SortOnExecute = True
    AllowEditPK = False
    AllowUndelete = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManEspecialidades_ABMDialog'
    OnPropertyClick = ABMDialogPropertyClick
    BeforePrint = ABMDialogBeforePrint
    Left = 65
    Top = 10
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        DataField = 'TB_CODIGO'
        MaxLength = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 0
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Derivacion de Volantes'
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
    LastColType = lcFill
    PageOrientation = pxLandscape
    OnGetCellParams = QueryPrintGetCellParams
    Left = 93
    Top = 10
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 121
    Top = 10
  end
end
