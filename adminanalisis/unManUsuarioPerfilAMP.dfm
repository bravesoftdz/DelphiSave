object frmManUsuariosPerfilesAMP: TfrmManUsuariosPerfilesAMP
  Left = 504
  Top = 143
  Width = 447
  Height = 181
  Caption = 'Usuarios de Perfiles AMP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object fpABM: TFormPanel
    Left = 8
    Top = 36
    Width = 422
    Height = 109
    Caption = 'Mantenimiento de Estudios'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      422
      109)
    object bvSep1: TBevel
      Left = 4
      Top = 62
      Width = 414
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 12
      Top = 36
      Width = 86
      Height = 13
      Caption = '&Perfil Estudio AMP'
      FocusControl = fraPerfilAMP
    end
    object Label2: TLabel
      Left = 12
      Top = 9
      Width = 36
      Height = 13
      Caption = '&Usuario'
    end
    object btnAceptar: TButton
      Left = 263
      Top = 72
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 338
      Top = 72
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraPerfilAMP: TfraCodigoDescripcion
      Left = 107
      Top = 32
      Width = 308
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 243
        DataSource = nil
      end
    end
    inline fraUsuario: TfraUsuario
      Left = 108
      Top = 6
      Width = 306
      Height = 21
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 222
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT pu_id, pu_idperfil, pu_usuario, pu_fechaalta, pu_usualta,' +
        ' pu_fechabaja,'
      
        '       pu_fechabaja, pu_usubaja, pu_fechamodif, pu_usumodif, se_' +
        'nombre,'
      '       pa_descripcion'
      
        '  FROM hys.hpu_perfilusuarioamp hpu, art.use_usuarios, hys.hpa_p' +
        'erfilamp'
      ' WHERE se_usuario = pu_usuario'
      '   AND pa_id = pu_idperfil')
    Left = 8
    Top = 4
    object sdqDatospu_id: TFloatField
      FieldName = 'pu_id'
    end
    object sdqDatospu_idperfil: TFloatField
      FieldName = 'pu_idperfil'
    end
    object sdqDatospu_usuario: TStringField
      FieldName = 'pu_usuario'
    end
    object sdqDatospu_usualta: TStringField
      FieldName = 'pu_usualta'
    end
    object sdqDatospu_usubaja: TStringField
      FieldName = 'pu_usubaja'
    end
    object sdqDatospu_usumodif: TStringField
      FieldName = 'pu_usumodif'
    end
    object sdqDatospu_fechaalta: TDateTimeField
      FieldName = 'pu_fechaalta'
    end
    object sdqDatospu_fechabaja: TDateTimeField
      FieldName = 'pu_fechabaja'
    end
    object sdqDatospu_fechamodif: TDateTimeField
      FieldName = 'pu_fechamodif'
    end
    object sdqDatosse_nombre: TStringField
      FieldName = 'se_nombre'
      Size = 50
    end
    object sdqDatospa_descripcion: TStringField
      FieldName = 'pa_descripcion'
      Size = 250
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 36
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'pu_id'
        FieldName = 'pu_id'
        Visible = False
        PrimaryKey = True
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'pu_idperfil'
        FieldName = 'pu_idperfil'
        Visible = False
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'Usuario'
        FieldName = 'pu_usuario'
        MaxLength = 20
        ColWidth = 164
      end
      item
        Caption = 'Nombre'
        FieldName = 'se_nombre'
        MaxLength = 50
        ColWidth = 400
      end
      item
        Caption = 'Perfil'
        FieldName = 'pa_descripcion'
        MaxLength = 250
        ColWidth = 400
      end
      item
        Caption = 'pu_fechaalta'
        FieldName = 'pu_fechaalta'
        Visible = False
        EditType = etDate
        FieldType = ftDateNew
        MaxLength = 10
        ColWidth = 148
      end
      item
        Caption = 'pu_usualta'
        FieldName = 'pu_usualta'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 20
        ColWidth = 164
      end
      item
        Caption = 'pu_fechamodif'
        FieldName = 'pu_fechamodif'
        Visible = False
        FieldType = ftDateModify
        MaxLength = 10
        ColWidth = 148
      end
      item
        Caption = 'pu_usumodif'
        FieldName = 'pu_usumodif'
        Visible = False
        FieldType = ftUserModify
        MaxLength = 20
        ColWidth = 164
      end
      item
        Caption = 'pu_fechabaja'
        FieldName = 'pu_fechabaja'
        Visible = False
        EditType = etDate
        FieldType = ftDateDelete
        ColWidth = 148
      end
      item
        Caption = 'pu_usubaja'
        FieldName = 'pu_usubaja'
        Visible = False
        FieldType = ftUserDelete
        MaxLength = 20
        ColWidth = 164
      end>
    Caption = 'Usuarios de Perfiles AMP'
    TableName = 'HYS.hpu_perfilusuarioamp'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = False
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    SecurityKey = 'frmManUsuariosPerfilesAMP_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    Left = 64
    Top = 4
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'ES_CODIGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 92
      end
      item
        Title = 'M'#225'ximo'
        TitleAlignment = taCenter
        DataField = 'ES_MAXIMO'
        Alignment = taRightJustify
        FormatFloat = '#,#0.00'
        MaxLength = 12
      end
      item
        Title = 'M'#237'nimo'
        TitleAlignment = taCenter
        DataField = 'ES_MINIMO'
        Alignment = taRightJustify
        FormatFloat = '#,#0.00'
        MaxLength = 12
      end
      item
        Title = 'Unidad de Medida'
        TitleAlignment = taCenter
        DataField = 'ES_UMEDIDA'
        MaxLength = 20
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Estudios'
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
    OnGetCellParams = QueryPrintGetCellParams
    Left = 92
    Top = 4
  end
end
