object frmManEspecialidades: TfrmManEspecialidades
  Left = 544
  Top = 240
  Width = 228
  Height = 84
  Caption = 'frmManEspecialidades'
  Color = clBtnFace
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
      'SELECT ES_CODIGO, ES_DESCRIPCION, ES_FECHABAJA'
      'FROM MES_ESPECIALIDADES')
    Left = 21
    Top = 14
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 49
    Top = 14
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'ES_CODIGO'
        PrimaryKey = True
        MaxLength = 3
        ReadOnly = True
        ColWidth = 50
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'ES_DESCRIPCION'
        MaxLength = 50
        ColWidth = 400
      end
      item
        Caption = 'Fecha Baja'
        FieldName = 'ES_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 148
      end>
    Caption = 'Mantenimiento de Especialidades'
    TableName = 'MES_ESPECIALIDADES'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    BeforePrint = ABMDialogBeforePrint
    GetDefaults = ABMDialogGetDefaults
    Left = 77
    Top = 14
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'ES_CODIGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 80
      end
      item
        Title = 'Fecha Baja'
        TitleAlignment = taCenter
        DataField = 'ES_FECHABAJA'
        Alignment = taCenter
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Especialidades'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -12
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
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
    PageOrientation = pxPortrait
    Left = 105
    Top = 14
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 134
    Top = 14
  end
end
