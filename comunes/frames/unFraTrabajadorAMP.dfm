object fraTrabajadorAMP: TfraTrabajadorAMP
  Left = 0
  Top = 0
  Width = 492
  Height = 22
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    492
    22)
  object lbTrabCUIL: TLabel
    Left = 4
    Top = 4
    Width = 24
    Height = 13
    Caption = 'CUIL'
    FocusControl = mskCUIL
  end
  object lbTrabNombre: TLabel
    Left = 124
    Top = 4
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = cmbNombre
  end
  object mskCUIL: TMaskEdit
    Left = 36
    Top = 0
    Width = 81
    Height = 21
    EditMask = '99-########-c;0; '
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskCUILKeyPress
  end
  object cmbNombre: TArtComboBox
    Left = 168
    Top = 0
    Width = 324
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dl_cuit'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end>
    DataSource = dsTrabajador
    FieldList = 'TJ_NOMBRE'
    FieldKey = 'TJ_CUIL'
    RowColor1 = 15263976
    RowColor2 = 13750737
    OnCloseUp = cmbNombreCloseUp
    OnDropDown = cmbNombreDropDown
    OnGetCellParams = cmbNombreGetCellParams
  end
  object sdqTrabajador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TJ_NOMBRE, TJ_CUIL, NULL DL_EGRESO, DL_CUIT'
      'FROM CTJ_TRABAJADOR, CDL_DATOSLABORALES'
      'WHERE TJ_CUIL = DL_CUIL')
    Left = 4
    Top = 28
  end
  object dsTrabajador: TDataSource
    DataSet = sdqTrabajador
    Left = 32
    Top = 28
  end
end
