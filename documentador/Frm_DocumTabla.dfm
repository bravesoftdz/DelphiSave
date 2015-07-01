object Frm_DocTabla: TFrm_DocTabla
  Left = 193
  Top = 133
  Width = 521
  Height = 283
  Caption = 'Documentador'
  Color = clBtnFace
  Constraints.MinHeight = 190
  Constraints.MinWidth = 440
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    000000000000C00C00000000000000000000000000C00FF0C000000000000000
    00000000C00FF00F0C00000000000000000000C00FF00FF0F0C0000000000000
    0000C00FF00FFFFB0F0C00000000000000C00FF00FFFFFFFF0F0C00000000000
    000FF00FFFFBF88FFF0F0C000000000000000FFFFFF88FFFFFF0F0C000000000
    000FFFFBF88FFFFB88FF0F0C000000000000FFF88FFFFF88FFFFF0F0C0000000
    00000FFFFFFB88FFFFFBFF0F0C000000000000FFFF88FFFFFF77FFF0F0C000C0
    C000000BF8FFFFFB70FFFFFB0F0C0C0C00000000000FFF700FFFF77FF0F00CC0
    08800FFFFFF000010FF77FFFFF000CC08FFFFFFFFFF88800F77FFF7077F00CC0
    FFFFFFFFF00000077FFFFFF0F0000C10FFFFFFFF8000B00FFFFFFFF000000CC0
    FFFFFFFF800B080F7077F000007000000FFFFFFF80B08F0FF0F0000700000000
    000FFFFF0B08F00BF0000000000000000000FFF0B0FF00000000700000000000
    0000000B0FF000000700000000000000000000B0000000000000000000000000
    00000B000000000000000000000000000000B000000000000000000000000000
    000B000000000000000000000000000000B00000000000000000000000000000
    0B00000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFF0FFFFFFC07FFFFF003FFFFC0
    01FFFF0000FFFC00007FFC00003FFC00001FFC00000FFE000007FF000003C380
    000181C0000001800000000000000000000000000001000200050000000D8000
    0063F800017FFE00637FFF00F8FFFF81FFFFFF1FFFFFFE3FFFFFFC7FFFFFF8FF
    FFFFF1FFFFFFF3FFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000C0000000000
    00C000C000000000C000F00C0000000000FF8F00C0000000FF88FFF00C000000
    0FFFF88F00C0000000F88FFFF00CC07770000007FF00C08FFFFF007FF000C0FF
    FF00B00700000000FF0BF0000000000000BF0000000000000B00000000000000
    B00000000000000B00000000000000B0000000000000FF3F0000FC1F0000F00F
    0000E0070000E0030000E0010000000000000000000000000000000200000015
    0000F0670000F0FF0000E7FF0000CFFF0000DFFF0000}
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 29
    Align = alTop
    TabOrder = 0
    DesignSize = (
      513
      29)
    object Label1: TLabel
      Left = 184
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Tabla'
    end
    object Label2: TLabel
      Left = 4
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Due'#241'o:'
    end
    object Dbc_Owner: TDBLookupComboBox
      Left = 44
      Top = 4
      Width = 137
      Height = 21
      KeyField = 'USERNAME'
      ListField = 'USERNAME'
      ListSource = Ds_Owner
      TabOrder = 0
      OnCloseUp = Dbc_OwnerCloseUp
    end
    object Dbc_Tabla: TDBLookupComboBox
      Left = 216
      Top = 4
      Width = 294
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'TABLE_NAME'
      ListField = 'TABLE_NAME'
      ListSource = Ds_Tabla
      TabOrder = 1
      OnCloseUp = Dbc_TablaCloseUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 29
    Width = 513
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      513
      28)
    object Label3: TLabel
      Left = 4
      Top = 8
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Te_DescripcionTabla: TEdit
      Left = 68
      Top = 4
      Width = 442
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 227
    Width = 513
    Height = 29
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object pnlBotonera: TPanel
      Left = 352
      Top = 1
      Width = 160
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Cmd_Salir: TButton
        Left = 82
        Top = 4
        Width = 75
        Height = 21
        Caption = '&Salir'
        TabOrder = 0
        OnClick = Cmd_SalirClick
      end
      object Cmd_Guardar: TButton
        Left = 2
        Top = 4
        Width = 75
        Height = 21
        Caption = '&Guardar'
        TabOrder = 1
        OnClick = Cmd_GuardarClick
      end
    end
  end
  object SG_Campos: TStringGrid
    Left = 0
    Top = 57
    Width = 513
    Height = 167
    Align = alClient
    ColCount = 2
    DefaultColWidth = 200
    DefaultRowHeight = 18
    RowCount = 1
    FixedRows = 0
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 3
    RowHeights = (
      18)
  end
  object Panel4: TPanel
    Left = 0
    Top = 224
    Width = 513
    Height = 3
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
  end
  object Sdq_Owner: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    SQL.Strings = (
      'SELECT USERNAME FROM SYS.ALL_USERS')
    Left = 108
    object Sdq_OwnerUSERNAME: TStringField
      FieldName = 'USERNAME'
      Required = True
      Size = 30
    end
  end
  object Ds_Owner: TDataSource
    DataSet = Sdq_Owner
    Left = 136
  end
  object Sdq_Tabla: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    SQL.Strings = (
      'SELECT TABLE_NAME'
      'FROM SYS.ALL_TABLES'
      'WHERE OWNER = :Owner')
    Left = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'Owner'
        ParamType = ptInput
      end>
    object Sdq_TablaTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Required = True
      Size = 30
    end
  end
  object Ds_Tabla: TDataSource
    DataSet = Sdq_Tabla
    Left = 380
  end
  object Sdq_Campos: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    AfterOpen = Sdq_CamposAfterOpen
    SQL.Strings = (
      'SELECT CO.COLUMN_NAME, COMMENTS'
      'FROM SYS.ALL_TAB_COLUMNS TA, SYS.ALL_COL_COMMENTS CO'
      'WHERE CO.OWNER = :Owner'
      'AND CO.TABLE_NAME = :Tabla'
      'AND TA.OWNER = CO.OWNER'
      'AND TA.TABLE_NAME = CO.TABLE_NAME'
      'AND TA.COLUMN_NAME = CO.COLUMN_NAME'
      'ORDER BY COLUMN_ID')
    Left = 324
    Top = 84
    ParamData = <
      item
        DataType = ftString
        Name = 'Owner'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Tabla'
        ParamType = ptInput
      end>
    object Sdq_CamposCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object Sdq_CamposCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 4000
    end
  end
  object Ds_Campos: TDataSource
    DataSet = Sdq_Campos
    Left = 352
    Top = 84
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 292
    Top = 84
  end
end
