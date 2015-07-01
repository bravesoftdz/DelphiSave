object frmManTipoPrestador: TfrmManTipoPrestador
  Left = 381
  Top = 237
  Width = 205
  Height = 72
  Caption = 'frmManTipoPrestador'
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
      
        'SELECT TP_CODIGO, TP_DESCRIPCION, TP_DATOSMEDICOS, TP_FBAJA, TP_' +
        'VISIBLE,'
      
        '       TP_RENOVAUTOMATICA, TP_DNI, TP_ESTATUTO, TP_ACTA, TP_CV, ' +
        'TP_MATRICULA, TP_TITULO, TP_HABILITACION, TP_COMPLEJIDAD,'
      '       TP_CARTACOMPROMISO, TP_RESPCIVIL'
      'FROM MTP_TIPOPRESTADOR')
    Left = 12
    Top = 8
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 40
    Top = 8
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'TP_CODIGO'
        PrimaryKey = True
        MaxLength = 3
        ColWidth = 28
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'TP_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 50
        ColWidth = 404
      end
      item
        Caption = 'Datos M'#233'dicos'
        FieldName = 'TP_DATOSMEDICOS'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Fecha Baja'
        FieldName = 'TP_FBAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 148
      end
      item
        Caption = 'Visible'
        FieldName = 'TP_VISIBLE'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Renov. Autom'#225'tica'
        FieldName = 'TP_RENOVAUTOMATICA'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'DNI'
        FieldName = 'TP_DNI'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Estatuto'
        FieldName = 'TP_ESTATUTO'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Acta / Poder'
        FieldName = 'TP_ACTA'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'CV'
        FieldName = 'TP_CV'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Mart'#237'cula'
        FieldName = 'TP_MATRICULA'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'T'#237'tulo'
        FieldName = 'TP_TITULO'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Habilitaci'#243'n'
        FieldName = 'TP_HABILITACION'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Complejidad'
        FieldName = 'TP_COMPLEJIDAD'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Carta de compromiso'
        FieldName = 'TP_CARTACOMPROMISO'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end
      item
        Caption = 'Resp. Civil'
        FieldName = 'TP_RESPCIVIL'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 50
      end>
    Caption = 'Mantenimiento del Tipo de Prestador'
    TableName = 'MTP_TIPOPRESTADOR'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    Left = 70
    Top = 8
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'TP_CODIGO'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TP_DESCRIPCION'
        MaxLength = 120
      end
      item
        Title = 'Dat.M'#233'd.'
        TitleAlignment = taCenter
        DataField = 'TP_DATOSMEDICOS'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Fecha de Baja'
        TitleAlignment = taCenter
        DataField = 'TP_FBAJA'
        Alignment = taCenter
        MaxLength = 12
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Tipo de Prestadores'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
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
    Left = 96
    Top = 8
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 124
    Top = 8
  end
end
