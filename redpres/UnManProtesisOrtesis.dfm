object frmManProtesisOrtesis: TfrmManProtesisOrtesis
  Left = 330
  Top = 240
  Width = 368
  Height = 126
  Caption = 'frmManProtesisOrtesis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cmbOrigen: TArtComboBox
    Left = 4
    Top = 4
    Width = 353
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 0
    Text = 'cmbOrigen'
    Columns = <
      item
        Expanded = False
        FieldName = 'PA_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end>
    DataSource = dsOrigen
    FieldList = 'PA_DESCRIPCION'
    FieldKey = 'PA_CODIGO'
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select    im_codigo, im_marca, im_empresa, im_origen, im_fbaja,'
      '             pa_codigo, pa_descripcion'
      'from      MIM_IMPLANTES, CPA_PAISES'
      'where   im_origen = pa_codigo (+)'
      '')
    Left = 24
    Top = 56
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 52
    Top = 56
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'IM_CODIGO'
        PrimaryKey = True
        MaxLength = 3
        ReadOnly = True
        ColWidth = 54
      end
      item
        Caption = 'Marca'
        FieldName = 'IM_MARCA'
        CharCase = ecUpperCase
        MaxLength = 35
        ColWidth = 184
      end
      item
        Caption = 'Raz'#243'n Social'
        FieldName = 'IM_EMPRESA'
        MaxLength = 40
        ColWidth = 182
      end
      item
        Caption = 'Origen'
        FieldName = 'IM_ORIGEN'
        MaxLength = 3
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 3
      end
      item
        Caption = 'Origen'
        FieldName = 'PA_DESCRIPCION'
        MaxLength = 60
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 136
      end
      item
        Caption = 'Fecha Baja'
        FieldName = 'IM_FBAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 63
      end>
    Caption = 'Mantenimiento de Pr'#243'tesis y '#211'rtesis'
    TableName = 'MIM_IMPLANTES'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    BeforePrint = ABMDialogBeforePrint
    GetDefaults = ABMDialogGetDefaults
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    CustomSetDefault = ABMDialogCustomSetDefault
    Left = 80
    Top = 56
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'IM_CODIGO'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Marca'
        DataField = 'IM_MARCA'
        MaxLength = 50
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'IM_EMPRESA'
        MaxLength = 50
      end
      item
        Title = 'Origen'
        DataField = 'PA_DESCRIPCION'
        MaxLength = 30
      end
      item
        Title = 'Fecha Baja'
        TitleAlignment = taCenter
        DataField = 'IM_FBAJA'
        Alignment = taCenter
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Pr'#243'tesis y '#211'rtesis'
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
    Left = 108
    Top = 56
  end
  object sdqOrigen: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select PA_CODIGO, PA_DESCRIPCION'
      'from CPA_PAISES'
      'Order by PA_DESCRIPCION')
    Left = 96
    Top = 4
  end
  object dsOrigen: TDataSource
    DataSet = sdqOrigen
    Left = 124
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 136
    Top = 56
  end
end
