object frmManCompaniasAseguradoras: TfrmManCompaniasAseguradoras
  Left = 544
  Top = 240
  Width = 228
  Height = 84
  BorderIcons = [biSystemMenu]
  Caption = 'frmManCompaniasAseguradoras'
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
    SQL.Strings = (
      'SELECT CS_ID, CS_NOMBRE'
      'FROM MCS_COMPANIASEGURO')
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
        Caption = 'C�digo'
        FieldName = 'CS_ID'
        PrimaryKey = True
        MaxLength = 3
        ReadOnly = True
        ColWidth = 50
      end
      item
        Caption = 'Nombre'
        FieldName = 'CS_NOMBRE'
        MaxLength = 50
        ColWidth = 400
      end>
    Caption = 'Mantenimiento de Compa��as de Seguros'
    TableName = 'MCS_COMPANIASEGURO'
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
        Title = 'C�digo'
        TitleAlignment = taCenter
        DataField = 'CS_ID'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Nombre'
        DataField = 'CS_NOMBRE'
        MaxLength = 80
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Compa��as de Seguros'
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
