object Frm_DocObjects: TFrm_DocObjects
  Left = 297
  Top = 171
  Width = 310
  Height = 174
  Caption = 'Documentador de Objetos de la Base de Datos'
  Color = clBtnFace
  Constraints.MinHeight = 174
  Constraints.MinWidth = 230
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    302
    147)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 121
    Align = alTop
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      302
      121)
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label2: TLabel
      Left = 4
      Top = 42
      Width = 35
      Height = 13
      Caption = 'Due'#241'o:'
    end
    object Label3: TLabel
      Left = 4
      Top = 74
      Width = 34
      Height = 13
      Caption = 'Objeto:'
    end
    object Label4: TLabel
      Left = 4
      Top = 102
      Width = 53
      Height = 13
      Caption = 'Comentario'
    end
    object Dbc_Owner: TDBLookupComboBox
      Left = 58
      Top = 36
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'USERNAME'
      ListField = 'USERNAME'
      ListSource = Ds_Owner
      TabOrder = 0
      OnCloseUp = Dbc_TipoCloseUp
    end
    object Dbc_Tabla: TDBLookupComboBox
      Left = 58
      Top = 67
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'OBJECT_NAME'
      ListField = 'OBJECT_NAME'
      ListSource = Ds_Tabla
      TabOrder = 1
      OnClick = Dbc_TablaClick
    end
    object Dbc_Tipo: TDBLookupComboBox
      Left = 58
      Top = 6
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'OBJECT_TYPE'
      ListField = 'OBJECT_TYPE'
      ListSource = Ds_Tipo
      TabOrder = 2
      OnCloseUp = Dbc_TipoCloseUp
    end
    object Te_Comentarios: TMemo
      Left = 58
      Top = 96
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 2000
      TabOrder = 3
    end
  end
  object Cmd_Salir: TButton
    Left = 220
    Top = 124
    Width = 82
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Salir'
    TabOrder = 1
    OnClick = Cmd_SalirClick
  end
  object Cmd_Guardar: TButton
    Left = 136
    Top = 124
    Width = 82
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Guardar'
    TabOrder = 2
    OnClick = Cmd_GuardarClick
  end
  object Sdq_Owner: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    SQL.Strings = (
      'SELECT USERNAME '
      'FROM SYS.ALL_USERS'
      'ORDER BY USERNAME ')
    Left = 214
    Top = 30
    object Sdq_OwnerUSERNAME: TStringField
      FieldName = 'USERNAME'
      Required = True
      Size = 30
    end
  end
  object Ds_Owner: TDataSource
    DataSet = Sdq_Owner
    Left = 242
    Top = 30
  end
  object Sdq_Tabla: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    SQL.Strings = (
      'SELECT OBJECT_NAME'
      'FROM SYS.ALL_OBJECTS'
      'ORDER BY OBJECT_NAME')
    Left = 216
    Top = 68
    object Sdq_TablaOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Required = True
      Size = 30
    end
  end
  object Ds_Tabla: TDataSource
    DataSet = Sdq_Tabla
    Left = 244
    Top = 68
  end
  object Sdq_Tipo: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT OBJECT_TYPE'
      'FROM SYS.ALL_OBJECTS'
      'ORDER BY OBJECT_TYPE')
    Left = 214
    Top = 2
    object Sdq_TipoOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Required = True
      Size = 15
    end
  end
  object Ds_Tipo: TDataSource
    DataSet = Sdq_Tipo
    Left = 242
    Top = 2
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Top = 124
  end
end
