object frmManPrestaciones: TfrmManPrestaciones
  Left = 381
  Top = 173
  Width = 448
  Height = 157
  Caption = 'frmManPrestaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cmbFormulario: TArtComboBox
    Left = 4
    Top = 4
    Width = 433
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 0
    Text = 'cmbFormulario'
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 240
        Visible = True
      end>
    DataSource = dsFormulario
    FieldList = 'TB_DESCRIPCION'
    FieldKey = 'TB_CODIGO'
  end
  object chkReqAud: TCheckBox
    Left = 8
    Top = 32
    Width = 15
    Height = 17
    Caption = 'Requiere auditoria'
    TabOrder = 1
    OnClick = chkReqAudClick
  end
  object chkExigeMod: TCheckBox
    Left = 8
    Top = 56
    Width = 15
    Height = 17
    Hint = 
      'Indica si la prestaci'#243'n admite multiples subprestaciones en las ' +
      'autorizaciones'
    Caption = 'Exige modulador'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = chkExigeModClick
  end
  inline fraGTrabajo: TfraCodDesc
    Left = 8
    Top = 100
    Width = 305
    Height = 23
    TabOrder = 3
    inherited cmbDescripcion: TArtComboBox
      Left = 46
      Width = 259
    end
    inherited edCodigo: TPatternEdit
      Width = 40
    end
    inherited Propiedades: TPropiedadesFrame
      FieldBaja = 'GP_FBAJA'
      FieldCodigo = 'GP_CODIGO'
      FieldDesc = 'GP_NOMBRE'
      FieldID = 'GP_CODIGO'
      TableName = 'MGP_GTRABAJO'
    end
  end
  object chkMultPrestaciones: TCheckBox
    Left = 8
    Top = 80
    Width = 15
    Height = 17
    Caption = 'Mult. prestaciones'
    TabOrder = 4
    OnClick = chkExigeModClick
  end
  object sdqFormulario: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'FOAUT'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 76
    Top = 4
  end
  object dsFormulario: TDataSource
    DataSet = sdqFormulario
    Left = 104
    Top = 4
  end
  object sdqPrestacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT pr_codigo, pr_descripcion, pr_formulario, tb_descripcion,' +
        ' pr_diasevo, '
      
        '       pr_fbaja, pr_requiereauditoria, pr_exigemodulador, pr_gtr' +
        'abajo, '
      
        '       gp_nombre, pr_multiplesprestaciones, pr_cantidadsinaudito' +
        'ria'
      '  FROM ctb_tablas, mpr_prestaciones, mgp_gtrabajo'
      ' WHERE tb_clave = '#39'FOAUT'#39
      '   AND tb_codigo = pr_formulario'
      '   AND pr_gtrabajo = gp_codigo(+)')
    Left = 244
    Top = 32
  end
  object dsPrestacion: TDataSource
    DataSet = sdqPrestacion
    Left = 272
    Top = 32
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'PR_CODIGO'
        PrimaryKey = True
        MaxLength = 6
        ColWidth = 52
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'PR_DESCRIPCION'
        MaxLength = 50
        ColWidth = 320
      end
      item
        Caption = 'Formulario'
        FieldName = 'PR_FORMULARIO'
        MaxLength = 1
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 12
      end
      item
        Caption = 'Formulario'
        FieldName = 'TB_DESCRIPCION'
        MaxLength = 150
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 320
      end
      item
        Caption = 'D'#237'as Evo.'
        FieldName = 'PR_DIASEVO'
        MaxLength = 2
        DecimalPlaces = 0
        ColWidth = 84
      end
      item
        Caption = 'Fecha de Baja'
        FieldName = 'PR_FBAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 148
      end
      item
        Caption = 'Req. Auditoria'
        FieldName = 'PR_REQUIEREAUDITORIA'
        MaxLength = 50
        ColWidth = 150
      end
      item
        Caption = 'Mult. prestaciones'
        FieldName = 'PR_MULTIPLESPRESTACIONES'
        MaxLength = 50
        ColWidth = 150
      end
      item
        Caption = 'Exige Modul.'
        FieldName = 'PR_EXIGEMODULADOR'
        MaxLength = 1
        ColWidth = 150
      end
      item
        Caption = 'G.Trabajo'
        FieldName = 'PR_GTRABAJO'
        MaxLength = 2
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 100
      end
      item
        Caption = 'Grupo Trabajo'
        FieldName = 'GP_NOMBRE'
        MaxLength = 150
        Options = [foAllowPrint, foShowInGrid]
        ColWidth = 100
      end
      item
        Caption = 'Cant. sin audit.'
        FieldName = 'PR_CANTIDADSINAUDITORIA'
        EditType = etInteger
        MaxLength = 3
        ColWidth = 80
      end>
    Caption = 'Mantenimiento de Prestaciones'
    TableName = 'MPR_PRESTACIONES'
    DataSource = dsPrestacion
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 85
    SecurityKey = 'frmManPrestaciones_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    CustomSetDefault = ABMDialogCustomSetDefault
    Left = 300
    Top = 32
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'PR_CODIGO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'PR_DESCRIPCION'
        MaxLength = 60
      end
      item
        Title = 'Formulario'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 60
      end
      item
        Title = 'Dias Evo.'
        TitleAlignment = taCenter
        DataField = 'PR_DIASEVO'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Fecha de Baja'
        TitleAlignment = taCenter
        DataField = 'PR_FBAJA'
        Alignment = taCenter
        MaxLength = 10
      end>
    DataSource = dsPrestacion
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Prestaciones'
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
    PageOrientation = pxPortrait
    Left = 328
    Top = 32
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 357
    Top = 32
  end
end
