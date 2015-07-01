object frmManGrupoTrabajo: TfrmManGrupoTrabajo
  Left = 545
  Top = 246
  Width = 297
  Height = 130
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
      'SELECT gp_codigo, gp_nombre, gp_descripcion, gp_fbaja, '
      '       gp_siniestros, gp_diasmax,  gp_fax, gp_email, '
      
        '       gp_cronico, gp_idtercerizadora, gp_usubaja, gp_fechamodif' +
        ', gp_usumodif'
      '  FROM mgp_gtrabajo')
    Left = 9
    Top = 10
    object sdqDatosGP_CODIGO: TStringField
      DisplayWidth = 3
      FieldName = 'GP_CODIGO'
      Required = True
      Size = 3
    end
    object sdqDatosGP_NOMBRE: TStringField
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqDatosGP_DESCRIPCION: TStringField
      FieldName = 'GP_DESCRIPCION'
      Size = 250
    end
    object sdqDatosGP_FBAJA: TDateTimeField
      FieldName = 'GP_FBAJA'
    end
    object sdqDatosGP_SINIESTROS: TStringField
      FieldName = 'GP_SINIESTROS'
      Size = 1
    end
    object sdqDatosGP_DIASMAX: TFloatField
      FieldName = 'GP_DIASMAX'
    end
    object sdqDatosGP_FAX: TStringField
      FieldName = 'GP_FAX'
      Size = 50
    end
    object sdqDatosGP_EMAIL: TStringField
      FieldName = 'GP_EMAIL'
      Size = 50
    end
    object sdqDatosGP_CRONICO: TStringField
      FieldName = 'GP_CRONICO'
    end
    object sdqDatosGP_USUBAJA: TStringField
      FieldName = 'GP_USUBAJA'
    end
    object sdqDatosgp_usumodif: TStringField
      FieldName = 'GP_USUMODIF'
    end
    object sdqDatosGP_FECHAMODIF: TDateTimeField
      FieldName = 'GP_FECHAMODIF'
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
        FieldName = 'GP_CODIGO'
        PrimaryKey = True
        MaxLength = 3
        ColWidth = 66
      end
      item
        Caption = 'Nombre'
        FieldName = 'GP_NOMBRE'
        MaxLength = 30
        ColWidth = 160
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'GP_DESCRIPCION'
        MaxLength = 250
        ColWidth = 330
      end
      item
        Caption = 'D'#237'as M'#225'ximos'
        FieldName = 'GP_DIASMAX'
        DefaultValue = '0'
        MaxLength = 8
        ColWidth = 350
      end
      item
        Caption = 'Fecha de Baja'
        FieldName = 'GP_FBAJA'
        Visible = False
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 148
      end
      item
        Caption = 'Asignable a Siniestros'
        FieldName = 'GP_SINIESTROS'
        DefaultValue = 'S'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 12
      end
      item
        Caption = 'Fax'
        FieldName = 'GP_FAX'
        MaxLength = 50
        ColWidth = 200
      end
      item
        Caption = 'E-Mail'
        FieldName = 'GP_EMAIL'
        MaxLength = 50
        ColWidth = 200
      end
      item
        Caption = 'Cr'#243'nico'
        FieldName = 'GP_CRONICO'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 100
      end
      item
        Caption = 'Usuario de baja'
        FieldName = 'GP_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 0
      end
      item
        Caption = 'Fecha de modificaci'#243'n'
        FieldName = 'GP_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        ColWidth = 0
      end
      item
        Caption = 'Usuario de modificaci'#243'n'
        FieldName = 'GP_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        ColWidth = 0
      end>
    Caption = 'Mantenimiento de Grupos de Trabajo'
    TableName = 'MGP_GTRABAJO'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator, abProperty]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    OnPropertyClick = ABMDialogPropertyClick
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
        TitleAlignment = taCenter
        DataField = 'GP_CODIGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Nombre'
        DataField = 'GP_NOMBRE'
        MaxLength = 30
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'GP_DESCRIPCION'
        MaxLines = 2
        MaxLength = 70
      end
      item
        Title = 'Fax'
        DataField = 'GP_FAX'
        MaxLength = 25
      end
      item
        Title = 'E-Mail'
        DataField = 'GP_EMAIL'
        MaxLength = 25
      end
      item
        Title = 'Asignable a Siniestros'
        DataField = 'GP_SINIESTROS'
        MaxLength = 10
      end
      item
        Title = 'D'#237'as M'#225'ximos'
        DataField = 'GP_DIASMAX'
        MaxLength = 15
      end
      item
        Title = 'Cr'#243'nico'
        DataField = 'GP_CRONICO'
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Grupos de Trabajo'
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
