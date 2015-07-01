object frmMantEmpresasSinTopeAMPO: TfrmMantEmpresasSinTopeAMPO
  Left = 251
  Top = 144
  Width = 568
  Height = 111
  Caption = 'frmMantEmpresasSinTopeAMPO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline fraEmpresa: TfraEmpresa
    Left = 0
    Top = 8
    Width = 556
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    inherited lbRSocial: TLabel
      Left = 84
    end
    inherited lbContrato: TLabel
      Left = 460
    end
    inherited edContrato: TIntEdit
      Left = 504
      Width = 50
    end
    inherited cmbRSocial: TArtComboBox
      Left = 128
      Width = 329
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT cuit_ponerguiones(ae_cuit) CUIT, ae_cuit, mp_nombre, '
      
        '              periodo_ponerbarra(ae_periododesde) periododesde, ' +
        'ae_periododesde,'
      
        '              periodo_ponerbarra(ae_periodohasta) periodohasta, ' +
        'ae_periodohasta'
      'FROM cmp_empresas, sae_empresas_sin_topeampo'
      'WHERE ae_cuit=mp_cuit')
    Left = 80
    Top = 40
    object sdqDatosCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqDatosAE_CUIT: TStringField
      FieldName = 'AE_CUIT'
      Size = 11
    end
    object sdqDatosMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqDatosAE_PERIODODESDE: TStringField
      FieldName = 'AE_PERIODODESDE'
      Size = 4000
    end
    object sdqDatosAE_PERIODOHASTA: TStringField
      FieldName = 'AE_PERIODOHASTA'
      Size = 4000
    end
    object sdqDatosPERIODODESDE: TStringField
      FieldName = 'PERIODODESDE'
      Size = 4000
    end
    object sdqDatosPERIODOHASTA: TStringField
      FieldName = 'PERIODOHASTA'
      Size = 4000
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 108
    Top = 40
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 136
    Top = 40
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        MaxLength = 15
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        MaxLength = 90
      end
      item
        Title = 'Vig. Desde'
        DataField = 'PERIODODESDE'
        MaxLength = 12
      end
      item
        Title = 'Vig. Hasta'
        DataField = 'PERIODOHASTA'
        MaxLength = 12
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Empresas Sin Tope AMPO'
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
    Left = 8
    Top = 42
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'CUIT'
        FieldName = 'AE_CUIT'
        PrimaryKey = True
        MaxLength = 11
        ColWidth = 92
      end
      item
        Caption = 'Raz'#243'n Social'
        FieldName = 'MP_NOMBRE'
        MaxLength = 60
        ReadOnly = True
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 400
      end
      item
        Caption = 'Vig. Desde'
        FieldName = 'AE_PERIODODESDE'
        MaxLength = 7
        Options = [foShowInEditor]
        ColWidth = 100
      end
      item
        Caption = 'Vig. Hasta'
        FieldName = 'AE_PERIODOHASTA'
        MaxLength = 7
        Options = [foShowInEditor, foAllowPrint]
        ColWidth = 100
      end
      item
        Caption = 'Vig. Desde'
        FieldName = 'PERIODODESDE'
        MaxLength = 7
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 100
      end
      item
        Caption = 'Vig. Hasta'
        FieldName = 'PERIODOHASTA'
        MaxLength = 7
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 100
      end>
    Caption = 'Mantenimiento de empresas sin tope AMPO'
    TableName = 'SAE_EMPRESAS_SIN_TOPEAMPO'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 80
    SecurityKey = 'frmMantEmpresasSinTopeAMPO_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    Left = 42
    Top = 41
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 165
    Top = 40
  end
end
