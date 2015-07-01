object frmMantImportesValoresAmpo: TfrmMantImportesValoresAmpo
  Left = 554
  Top = 347
  Width = 299
  Height = 93
  Caption = 'frmMantImportesValoresAmpo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sdqAmpo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select periodo_ponerbarra(am_periodo) periodo,'
      '       am_periodo, am_numampos, am_valorampo, am_importope, '
      
        '       am_importope_contribpatr,  am_importeminimo, am_importemi' +
        'nimopostde'
      'from cam_topeampos'
      'order by am_periodo')
    Left = 88
    Top = 8
    object sdqAmpoPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 7
    end
    object sdqAmpoAM_NUMAMPOS: TFloatField
      FieldName = 'AM_NUMAMPOS'
      Required = True
    end
    object sdqAmpoAM_VALORAMPO: TFloatField
      FieldName = 'AM_VALORAMPO'
      Required = True
    end
    object sdqAmpoAM_IMPORTOPE: TFloatField
      FieldName = 'AM_IMPORTOPE'
      Required = True
    end
    object sdqAmpoAM_IMPORTOPE_CONTRIBPATR: TFloatField
      FieldName = 'AM_IMPORTOPE_CONTRIBPATR'
      Required = True
    end
    object sdqAmpoAM_IMPORTEMINIMO: TFloatField
      FieldName = 'AM_IMPORTEMINIMO'
      Required = True
    end
    object sdqAmpoAM_IMPORTEMINIMOPOSTDE: TFloatField
      FieldName = 'AM_IMPORTEMINIMOPOSTDE'
    end
    object sdqAmpoAM_PERIODO: TStringField
      FieldName = 'AM_PERIODO'
      Required = True
      Size = 6
    end
  end
  object dsAmpo: TDataSource
    DataSet = sdqAmpo
    Left = 116
    Top = 8
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 144
    Top = 8
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Per'#237'odo'
        DataField = 'PERIODO'
        MaxLength = 18
      end
      item
        Title = 'N'#186' de AMPOS'
        DataField = 'AM_NUMAMPOS'
        MaxLength = 18
      end
      item
        Title = 'Valor del AMPO'
        DataField = 'AM_VALORAMPO'
        MaxLength = 18
      end
      item
        Title = 'Importe Tope'
        DataField = 'AM_IMPORTOPE'
        MaxLength = 18
      end
      item
        Title = 'Importe Contr. Pat.'
        DataField = 'AM_IMPORTOPE_CONTRIBPATR'
        MaxLength = 18
      end
      item
        Title = 'Salario M'#237'nimo'
        DataField = 'AM_IMPORTEMINIMO'
        MaxLength = 18
      end
      item
        Title = 'Salario M'#237'nimo Post'
        DataField = 'AM_IMPORTEMINIMOPOSTDE'
        MaxLength = 0
      end>
    DataSource = dsAmpo
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Importes y Valores de AMPOS'
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
    Left = 16
    Top = 10
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Per'#237'odo'
        FieldName = 'AM_PERIODO'
        PrimaryKey = True
        MaxLength = 6
        ReadOnly = True
        Options = [foAllowSort, foShowInEditor, foAllowPrint]
        ColWidth = 52
      end
      item
        Caption = 'Per'#237'odo'
        FieldName = 'PERIODO'
        MaxLength = 7
        ReadOnly = True
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 100
      end
      item
        Caption = 'N'#186' de AMPOS'
        FieldName = 'AM_NUMAMPOS'
        EditType = etCurrency
        MaxLength = 5
        ColWidth = 100
      end
      item
        Caption = 'Valor del AMPO'
        FieldName = 'AM_VALORAMPO'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 100
      end
      item
        Caption = 'Importe Tope'
        FieldName = 'AM_IMPORTOPE'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 100
      end
      item
        Caption = 'Importe Contr. Pat.'
        FieldName = 'AM_IMPORTOPE_CONTRIBPATR'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 100
      end
      item
        Caption = 'Salario M'#237'nimo'
        FieldName = 'AM_IMPORTEMINIMO'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 100
      end
      item
        Caption = 'Salario M'#237'nimo Post Decreto'
        FieldName = 'AM_IMPORTEMINIMOPOSTDE'
        EditMask = ',0.00;-,0.00'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 130
      end>
    Caption = 'Mantenimiento de importes y valores AMPO'
    TableName = 'cam_topeampos'
    DataSource = dsAmpo
    ABMButtons = [abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 110
    SecurityKey = 'Seguridad'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    Left = 50
    Top = 9
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 173
    Top = 8
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'Prueba'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 212
    Top = 8
  end
end
