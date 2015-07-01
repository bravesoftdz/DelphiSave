object frmManDocumentos: TfrmManDocumentos
  Left = 410
  Top = 401
  Width = 359
  Height = 88
  Caption = 'Mantenimiento de Documentación Solicitada'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object sdqDocumentos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'Select tb_codigo, tb_descripcion, tb_clave, tb_baja, tb_modulo, ' +
        'TB_ESPECIAL1'
      'From ctb_tablas'
      'Where tb_clave = '#39'TDOCU'#39
      'And tb_codigo <> '#39'0'#39
      'And tb_modulo = '#39'MUTUAL'#39)
    Left = 88
    Top = 8
    object sdqDocumentosTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Required = True
      Size = 10
    end
    object sdqDocumentosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDocumentosTB_CLAVE: TStringField
      FieldName = 'TB_CLAVE'
      Required = True
      Size = 5
    end
    object sdqDocumentosTB_BAJA: TStringField
      FieldName = 'TB_BAJA'
      Size = 1
    end
    object sdqDocumentosTB_MODULO: TStringField
      FieldName = 'TB_MODULO'
      Size = 15
    end
    object sdqDocumentosTB_ESPECIAL1: TStringField
      FieldName = 'TB_ESPECIAL1'
      Size = 100
    end
  end
  object dsDocumentos: TDataSource
    DataSet = sdqDocumentos
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
        Title = 'Código'
        DataField = 'TB_CODIGO'
        MaxLength = 10
      end
      item
        Title = 'Descripción'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 80
      end>
    DataSource = dsDocumentos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
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
        Caption = 'Código'
        FieldName = 'TB_CODIGO'
        PrimaryKey = True
        MaxLength = 3
        ColWidth = 60
      end
      item
        Caption = 'TB_CLAVE'
        FieldName = 'TB_CLAVE'
        Visible = False
        PrimaryKey = True
        DefaultValue = 'TDOCU'
        ColWidth = 0
      end
      item
        Caption = 'Descripción'
        FieldName = 'TB_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 150
        ColWidth = 100
      end
      item
        Caption = 'TB_MODULO'
        FieldName = 'TB_MODULO'
        Visible = False
        DefaultValue = 'MUTUAL'
        MaxLength = 15
        ColWidth = 124
      end
      item
        Caption = 'Dado de Baja'
        FieldName = 'TB_BAJA'
        Visible = False
        DefaultValue = ' '
        MaxLength = 1
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 12
      end
      item
        Caption = 'Requiere fecha desde-hasta'
        FieldName = 'TB_ESPECIAL1'
        EditType = etCheck
        ColWidth = 0
      end>
    Caption = 'Mantenimiento de Documentación Solicitada'
    TableName = 'CTB_TABLAS'
    DataSource = dsDocumentos
    ABMButtons = [abNew, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = False
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    OnGetCellParams = ABMDialogGetCellParams
    Left = 50
    Top = 9
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 173
    Top = 8
  end
end
