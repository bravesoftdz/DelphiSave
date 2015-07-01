object frmManResponsable: TfrmManResponsable
  Left = 546
  Top = 248
  Width = 283
  Height = 107
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        ' select re_responsable, re_nombre, re_direccion, re_telefono, re' +
        '_fecbaja, re_generaautorizacion, re_generaaut_unica'
      ' from mre_responsable')
    Left = 9
    Top = 10
    object sdqDatosRE_NOMBRE: TStringField
      DisplayWidth = 100
      FieldName = 'RE_NOMBRE'
      Size = 100
    end
    object sdqDatosRE_DIRECCION: TStringField
      DisplayWidth = 200
      FieldName = 'RE_DIRECCION'
      Size = 200
    end
    object sdqDatosRE_TELEFONO: TStringField
      FieldName = 'RE_TELEFONO'
    end
    object sdqDatosRE_FECBAJA: TDateTimeField
      FieldName = 'RE_FECBAJA'
    end
    object sdqDatosRE_RESPONSABLE: TFloatField
      FieldName = 'RE_RESPONSABLE'
    end
    object sdqDatosRE_GENERAAUTORIZACION: TStringField
      FieldName = 'RE_GENERAAUTORIZACION'
    end
    object sdqDatosRE_GENERAAUT_UNICA: TStringField
      FieldName = 'RE_GENERAAUT_UNICA'
      Size = 1
    end
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
        FieldName = 'RE_RESPONSABLE'
        PrimaryKey = True
        EditType = etInteger
        MaxLength = 5
        ColWidth = 80
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'RE_NOMBRE'
        MaxLength = 100
        ColWidth = 150
      end
      item
        Caption = 'Direcci'#243'n'
        FieldName = 'RE_DIRECCION'
        MaxLength = 100
        ColWidth = 350
      end
      item
        Caption = 'Tel'#233'fono'
        FieldName = 'RE_TELEFONO'
        MaxLength = 100
        ColWidth = 100
      end
      item
        Caption = 'Fecha Baja'
        FieldName = 'RE_FECBAJA'
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 80
      end
      item
        Caption = 'Genera Aut.'
        FieldName = 'RE_GENERAAUTORIZACION'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 100
      end
      item
        Caption = 'Genera Aut. Unica'
        FieldName = 'RE_GENERAAUT_UNICA'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 100
      end>
    Caption = 'Mantenimiento de Responsables'
    TableName = 'MRE_RESPONSABLE'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator, abProperty]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManResponsable_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    GetDefaults = ABMDialogGetDefaults
    Left = 65
    Top = 10
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        DataField = 'RE_RESPONSABLE'
        MaxLength = 10
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'RE_NOMBRE'
        MaxLength = 70
      end
      item
        Title = 'Direcci'#243'n'
        DataField = 'RE_DIRECCION'
        MaxLength = 70
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'RE_TELEFONO'
        MaxLength = 10
      end
      item
        Title = 'Genera Autorizaci'#243'n'
        DataField = 'RE_GENERAAUTORIZACION'
        MaxLength = 0
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Responsables'
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
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 122
    Top = 10
  end
end
