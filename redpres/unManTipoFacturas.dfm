object frmManTipoFacturas: TfrmManTipoFacturas
  Left = 356
  Top = 223
  Width = 272
  Height = 88
  Caption = 'frmManTipoFacturas'
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
      
        'SELECT tf_id, tf_codigo, tf_descripcion, tf_usualta, tf_fechaalt' +
        'a, tf_usumodif,'
      '       tf_fechamodif, tf_usubaja, tf_fechabaja'
      '  FROM SIN.stf_tipofacturadevol')
    Left = 4
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'TF_ID'
        FieldName = 'TF_ID'
        Visible = False
        PrimaryKey = True
        ReadOnly = True
        Options = [foShowInEditor]
        ColWidth = 0
      end
      item
        Caption = 'C'#243'digo'
        FieldName = 'TF_CODIGO'
        MaxLength = 2
        DecimalPlaces = 0
        ColWidth = 40
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'TF_DESCRIPCION'
        MaxLength = 100
        ColWidth = 260
      end
      item
        Caption = 'TF_USUALTA'
        FieldName = 'TF_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 60
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 173
      end
      item
        Caption = 'TF_FECHAALTA'
        FieldName = 'TF_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        MaxLength = 20
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 50
      end
      item
        Caption = 'TF_USUBAJA'
        FieldName = 'TF_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end
      item
        Caption = 'TF_FECHABAJA'
        FieldName = 'TF_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 148
      end
      item
        Caption = 'TF_USUMODIF'
        FieldName = 'TF_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end
      item
        Caption = 'TF_FECHAMODIF'
        FieldName = 'TF_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end>
    Caption = 'Tipos de factura para devoluci'#243'n'
    TableName = 'sin.stf_tipofacturadevol'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManSTF_TIPOFACTURADEVLDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    Left = 60
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 32
    Top = 4
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Tipos de factura'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
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
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLegal
    Zoom = 95
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 88
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 117
    Top = 4
  end
end
