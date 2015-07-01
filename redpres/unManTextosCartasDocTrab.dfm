object frmManTextosCartasDocTrab: TfrmManTextosCartasDocTrab
  Left = 306
  Top = 99
  Width = 581
  Height = 364
  Caption = 'Mantenimiento de la CTT_TEXTOSCARTASDOCTRAB'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fpEditor: TFormPanel
    Left = 4
    Top = 32
    Width = 557
    Height = 297
    Caption = 'Mantenimiento de Formatos de Cartas Documento'
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    ActiveControl = edCodigo
    Constraints.MinHeight = 200
    Constraints.MinWidth = 300
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 54
      Height = 13
      Caption = 'Descripción'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 92
      Width = 545
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 264
      Width = 545
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 68
      Width = 51
      Height = 13
      Caption = 'F.Empresa'
    end
    object edCodigo: TPatternEdit
      Left = 72
      Top = 8
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 5
      TabOrder = 0
      Pattern = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789'
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 36
      Width = 477
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
    end
    object btnAceptar: TButton
      Left = 401
      Top = 268
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 476
      Top = 268
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object edTexto: TRichEdit
      Left = 4
      Top = 96
      Width = 545
      Height = 165
      Anchors = [akLeft, akTop, akRight, akBottom]
      PlainText = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    inline fraFormCartasDoc: TfraFormCartasDoc
      Left = 72
      Top = 64
      Width = 477
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 422
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT TT_FORMATO, TT_DESCRIPCION, TT_FORMATOEMPRESA, DT_DESCRIP' +
        'CION, TT_TEXTO '
      'FROM CTT_TEXTOSCARTASDOCTRAB, CDT_TEXTOSCARTASDOC'
      'WHERE TT_FORMATOEMPRESA = DT_FORMATO (+)'
      'AND TT_FORMATO LIKE '#39'AB%'#39
      '')
    Left = 4
    object sdqDatosTT_FORMATO: TStringField
      FieldName = 'TT_FORMATO'
      Required = True
      Size = 5
    end
    object sdqDatosTT_DESCRIPCION: TStringField
      FieldName = 'TT_DESCRIPCION'
      Size = 100
    end
    object sdqDatosTT_FORMATOEMPRESA: TStringField
      FieldName = 'TT_FORMATOEMPRESA'
      Size = 5
    end
    object sdqDatosDT_DESCRIPCION: TStringField
      FieldName = 'DT_DESCRIPCION'
      Size = 100
    end
    object sdqDatosTT_TEXTO: TMemoField
      FieldName = 'TT_TEXTO'
      BlobType = ftMemo
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 32
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Código'
        FieldName = 'TT_FORMATO'
        PrimaryKey = True
        DefaultValue = 'AB'
        MaxLength = 5
        ColWidth = 44
      end
      item
        Caption = 'Descripción'
        FieldName = 'TT_DESCRIPCION'
        MaxLength = 100
        ColWidth = 500
      end
      item
        Caption = 'Formato Empresa'
        FieldName = 'DT_DESCRIPCION'
        MaxLength = 100
        ColWidth = 500
      end>
    Caption = 'Mantenimiento de Textos de Cartas Documento'
    TableName = 'CTT_TEXTOSCARTASDOCTRAB'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 85
    SecurityKey = 'frmManTextosCartasDocTrab_ABMDialog'
    BeforeABM = ABMDialogBeforeABM
    Left = 60
  end
  object sdqUpdate: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'INSERT INTO CTT_TEXTOSCARTASDOCTRAB '
      
        '(TT_FORMATO, TT_DESCRIPCION, TT_FORMATOEMPRESA, TT_TEXTO, TT_COD' +
        'EVENTOTRAM, TT_ADICIONAL) '
      'VALUES '
      '(:pCodigo, :pDescripcion, :pFEmpresa, :pTexto, NULL, '#39'N'#39')')
    Left = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDescripcion'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftOraBlob
        Name = 'pTexto'
        ParamType = ptInput
      end>
  end
end
