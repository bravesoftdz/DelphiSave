inherited fraGrupoTrabajo: TfraGrupoTrabajo
  Width = 327
  ExplicitWidth = 327
  DesignSize = (
    327
    23)
  object lblGestor: TLabel [0]
    Left = 156
    Top = 5
    Width = 32
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Gestor'
  end
  inherited edCodigo: TPatternEdit [1]
    Width = 48
    ExplicitWidth = 48
  end
  object cmbGestor: TArtComboBox [2]
    Left = 192
    Top = 1
    Width = 136
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akTop, akRight]
    NumGlyphs = 1
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Usuario'
        Width = 300
        Visible = True
      end>
    DataSource = dsGestor
    FieldList = 'DESCRIPCION'
    FieldKey = 'ID'
    RowColor1 = clBtnHighlight
    RowColor2 = clBtnText
    ClearOnCancel = True
  end
  inherited cmbDescripcion: TArtComboBox [3]
    Left = 52
    Width = 102
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LG_LOCALIDAD'
        Title.Caption = 'Localidad'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Visible = False
      end>
    ExplicitLeft = 52
    ExplicitWidth = 102
  end
  object sdqGestor: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ug_id ID, ug_usuario DESCRIPCION'
      '  FROM mug_usuariogrupotrabajo, ctb_tablas'
      ' WHERE ug_fechabaja IS NULL'
      '   AND ug_tipousuario = tb_codigo'
      '   AND tb_clave = '#39'TUSU'#39
      '   AND tb_especial1 = '#39'S'#39
      '   AND ug_grupo = :grupo')
    Left = 200
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptInput
      end>
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 228
    Top = 24
  end
end
