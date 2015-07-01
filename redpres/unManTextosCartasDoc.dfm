object frmManTextosCartasDoc: TfrmManTextosCartasDoc
  Left = 325
  Top = 121
  Width = 579
  Height = 366
  Caption = 'Mantenimiento de la CDT_TEXTOSCARTASDOC'
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
    Width = 553
    Height = 297
    Caption = 'Mantenimiento de Formatos de Cartas Documento'
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    ActiveControl = edCodigo
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
      Top = 64
      Width = 541
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 264
      Width = 541
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
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
      Width = 473
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
    end
    object btnAceptar: TButton
      Left = 397
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
      TabOrder = 3
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 472
      Top = 268
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edTexto: TRichEdit
      Left = 4
      Top = 68
      Width = 541
      Height = 193
      Anchors = [akLeft, akTop, akRight, akBottom]
      PlainText = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT DT_FORMATO, DT_DESCRIPCION, DT_TEXTO, DT_SOLOEMPRESA, DT_' +
        'ADICIONAL'
      'FROM CDT_TEXTOSCARTASDOC'
      'WHERE DT_FORMATO LIKE '#39'AB%'#39)
    Left = 4
    object sdqDatosDT_FORMATO: TStringField
      FieldName = 'DT_FORMATO'
      Required = True
      Size = 5
    end
    object sdqDatosDT_DESCRIPCION: TStringField
      FieldName = 'DT_DESCRIPCION'
      Size = 100
    end
    object sdqDatosDT_TEXTO: TMemoField
      FieldName = 'DT_TEXTO'
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
        FieldName = 'DT_FORMATO'
        PrimaryKey = True
        DefaultValue = 'AB'
        MaxLength = 5
        ColWidth = 44
      end
      item
        Caption = 'Descripción'
        FieldName = 'DT_DESCRIPCION'
        MaxLength = 100
        ColWidth = 400
      end>
    Caption = 'Mantenimiento de Textos de Cartas Documento'
    TableName = 'CDT_TEXTOSCARTASDOC'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 85
    SecurityKey = 'frmManTextosCartasDoc_ABMDialog'
    BeforeABM = ABMDialogBeforeABM
    Left = 60
  end
  object sdqUpdate: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'UPDATE CDT_TEXTOSCARTASDOC'
      'SET DT_DESCRIPCION = :pDescripcion,'
      'DT_TEXTO =   :pTexto'
      'WHERE DT_FORMATO = :pCodigo')
    Left = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'pDescripcion'
        ParamType = ptInput
      end
      item
        DataType = ftOraBlob
        Name = 'pTexto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCodigo'
        ParamType = ptInput
      end>
  end
end
