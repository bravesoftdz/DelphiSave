object frmManMotAnulCitaciones: TfrmManMotAnulCitaciones
  Left = 246
  Top = 221
  Width = 261
  Height = 87
  Caption = 'frmManMotAnulCitaciones'
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
    SQL.Strings = (
      'SELECT *'
      'FROM smc_motanulcitaciones')
    Left = 68
    Top = 12
    object sdqDatosMC_ID: TFloatField
      FieldName = 'MC_ID'
      Required = True
    end
    object sdqDatosMC_CODIGO: TStringField
      FieldName = 'MC_CODIGO'
      Size = 10
    end
    object sdqDatosMC_DESCRIPCION: TStringField
      FieldName = 'MC_DESCRIPCION'
      Size = 250
    end
    object sdqDatosMC_USUALTA: TStringField
      FieldName = 'MC_USUALTA'
    end
    object sdqDatosMC_FECHAALTA: TDateTimeField
      FieldName = 'MC_FECHAALTA'
    end
    object sdqDatosMC_USUMODIF: TStringField
      FieldName = 'MC_USUMODIF'
    end
    object sdqDatosMC_FECHAMODIF: TDateTimeField
      FieldName = 'MC_FECHAMODIF'
    end
    object sdqDatosMC_USUBAJA: TStringField
      FieldName = 'MC_USUBAJA'
    end
    object sdqDatosMC_FECHABAJA: TDateTimeField
      FieldName = 'MC_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 40
    Top = 12
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'MC_CODIGO'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'MC_DESCRIPCION'
        MaxLength = 100
      end
      item
        Title = 'Dado de baja'
        TitleAlignment = taCenter
        DataField = 'MC_FECHABAJA'
        Alignment = taCenter
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Motivos de no Carga'
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
    Left = 124
    Top = 12
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 152
    Top = 12
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'MC_ID'
        FieldName = 'MC_ID'
        Visible = False
        PrimaryKey = True
        EditType = etInteger
        MaxLength = 10
        ReadOnly = True
        Options = [foShowInEditor]
        ColWidth = 84
      end
      item
        Caption = 'C'#243'digo'
        FieldName = 'MC_CODIGO'
        CharCase = ecUpperCase
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'MC_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 250
        ColWidth = 400
      end
      item
        Caption = 'MC_FECHABAJA'
        FieldName = 'MC_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        ColWidth = 148
      end
      item
        Caption = 'MC_FECHAALTA'
        FieldName = 'MC_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        MaxLength = 18
        Options = [foShowInEditor]
        ColWidth = 148
      end
      item
        Caption = 'MC_USUALTA'
        FieldName = 'MC_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end
      item
        Caption = 'MC_FECHAMODIF'
        FieldName = 'MC_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        MaxLength = 18
        Options = [foShowInEditor]
        ColWidth = 148
      end
      item
        Caption = 'MC_USUMODIF'
        FieldName = 'MC_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end
      item
        Caption = 'MC_USUBAJA'
        FieldName = 'MC_USUBAJA'
        FieldType = ftUserDelete
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end>
    Caption = 'Mantenimiento de motivos de anulaci'#243'n de citaciones'
    TableName = 'smc_motanulcitaciones'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManMotAnulCitaciones_ABMDialog'
    Left = 96
    Top = 12
  end
end
