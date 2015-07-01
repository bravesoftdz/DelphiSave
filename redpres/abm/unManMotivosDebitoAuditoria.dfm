object frmManMotivoDebitoAuditoria: TfrmManMotivoDebitoAuditoria
  Left = 323
  Top = 224
  Width = 409
  Height = 114
  Caption = 'Motivos de d'#233'bito de auditor'#237'a'
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
      
        'SELECT ma_id, ma_codigo, ma_descripcion, ma_usualta, ma_fechaalt' +
        'a, ma_usumodif, '
      '       ma_fechamodif, ma_usubaja, ma_fechabaja'
      '  FROM SIN.sma_motivosdebitosauditoria')
    Left = 4
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'MA_CODIGO'
        PrimaryKey = True
        MaxLength = 2
        DecimalPlaces = 0
        ColWidth = 40
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'MA_DESCRIPCION'
        MaxLength = 100
        ColWidth = 260
      end
      item
        Caption = 'MA_USUALTA'
        FieldName = 'MA_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 60
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 173
      end
      item
        Caption = 'MA_FECHAALTA'
        FieldName = 'MA_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        MaxLength = 20
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 50
      end
      item
        Caption = 'MA_USUBAJA'
        FieldName = 'MA_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end
      item
        Caption = 'MA_FECHABAJA'
        FieldName = 'MA_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 148
      end
      item
        Caption = 'MA_USUMODIF'
        FieldName = 'MA_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 0
      end
      item
        Caption = 'MA_FECHAMODIF'
        FieldName = 'MA_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        Options = [foAllowSort, foAllowPrint]
        ColWidth = 0
      end>
    Caption = 'Motivos de d'#233'bito de auditor'#237'a'
    TableName = 'SIN.sma_motivosdebitosauditoria'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManSMA_MOTIVOSDEBITOAUDITORIADialog'
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
    Title.Text = 'Aseguradoras de Fondos de Jubilaciones y Pensiones'
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
    PageOrientation = pxLandscape
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
