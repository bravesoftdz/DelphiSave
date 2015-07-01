object frmMantTiposAsigFam: TfrmMantTiposAsigFam
  Left = 251
  Top = 220
  Width = 248
  Height = 88
  Caption = 'frmMantTiposAsigFam'
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
      
        'SELECT tf_tipo, tf_descripcion, tf_mesesantiguedad, tf_fechabaja' +
        ', te_usubaja,'
      
        '              tf_fechamodif, tf_usumodif, tf_fechaalta, tf_usual' +
        'ta '
      '   FROM stf_tiposasigfamiliares')
    Left = 88
    Top = 8
    object sdqDatosTF_TIPO: TStringField
      FieldName = 'TF_TIPO'
      Required = True
      Size = 2
    end
    object sdqDatosTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Size = 30
    end
    object sdqDatosTF_MESESANTIGUEDAD: TFloatField
      FieldName = 'TF_MESESANTIGUEDAD'
    end
    object sdqDatosTF_FECHABAJA: TDateTimeField
      FieldName = 'TF_FECHABAJA'
    end
    object sdqDatosTE_USUBAJA: TStringField
      FieldName = 'TE_USUBAJA'
    end
    object sdqDatosTF_FECHAMODIF: TDateTimeField
      FieldName = 'TF_FECHAMODIF'
    end
    object sdqDatosTF_USUMODIF: TStringField
      FieldName = 'TF_USUMODIF'
    end
    object sdqDatosTF_FECHAALTA: TDateTimeField
      FieldName = 'TF_FECHAALTA'
    end
    object sdqDatosTF_USUALTA: TStringField
      FieldName = 'TF_USUALTA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
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
        Title = 'C'#243'digo'
        DataField = 'TF_TIPO'
        MaxLength = 10
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TF_DESCRIPCION'
        MaxLength = 80
      end
      item
        Title = 'Antig'#252'edad'
        DataField = 'TF_MESESANTIGUEDAD'
        MaxLength = 15
      end
      item
        Title = 'F. Baja'
        DataField = 'TF_FECHABAJA'
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Tipos de Asignaciones Familiares'
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
        Caption = 'C'#243'digo'
        FieldName = 'TF_TIPO'
        PrimaryKey = True
        MaxLength = 2
        ReadOnly = True
        ColWidth = 20
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'TF_DESCRIPCION'
        MaxLength = 30
        ColWidth = 244
      end
      item
        Caption = 'Antig'#252'edad'
        FieldName = 'TF_MESESANTIGUEDAD'
        EditType = etInteger
        MaxLength = 2
        DecimalPlaces = 0
        ColWidth = 84
      end
      item
        Caption = 'Fecha Baja'
        FieldName = 'TF_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 148
      end
      item
        Caption = 'TE_USUBAJA'
        FieldName = 'TE_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end
      item
        Caption = 'TF_FECHAALTA'
        FieldName = 'TF_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        MaxLength = 18
        Options = [foShowInEditor]
        ColWidth = 148
      end
      item
        Caption = 'TF_USUALTA'
        FieldName = 'TF_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end
      item
        Caption = 'TF_FECHAMODIF'
        FieldName = 'TF_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        MaxLength = 18
        Options = [foShowInEditor]
        ColWidth = 148
      end
      item
        Caption = 'TF_USUMODIF'
        FieldName = 'TF_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end>
    Caption = 'Mantenimiento de tipos de asignaciones familiares'
    TableName = 'stf_tiposasigfamiliares'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
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
end
