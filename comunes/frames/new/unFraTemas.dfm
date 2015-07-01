inherited fraTemas: TfraTemas
  Width = 472
  Height = 265
  OnMouseWheelDown = FrameMouseWheelDown
  OnMouseWheelUp = FrameMouseWheelUp
  ExplicitWidth = 472
  ExplicitHeight = 265
  object smTemas: TJvScrollMax
    Left = 0
    Top = 0
    Width = 472
    Height = 265
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -9
    ButtonFont.Name = 'Small Fonts'
    ButtonFont.Style = []
    AutoHeight = False
    ScrollBarWidth = 18
    Align = alClient
    BevelInner = bvLowered
    ParentColor = True
    TabOrder = 0
    TabStop = True
    OnResize = smTemasResize
    ParentBackground = False
  end
  object sdqTemas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        '  SELECT  '#39' '#39' || comercial.visita.get_descripcioncategoria(vt_id' +
        ') breadcrumb,'
      '         cvt.*,'
      '         CASE vt_tipo'
      '           WHEN '#39'Q'#39' THEN'
      '             vt_respuestasql'
      '           WHEN '#39'R'#39' THEN'
      '             '#39'SELECT codigo, id, descripcion, baja, orden'
      
        '                FROM (SELECT vr_id codigo, vr_id id, vr_descripc' +
        'ion descripcion, vr_fechabaja baja, vr_id orden'
      '                        FROM comercial.cvr_visitarespuesta'
      '                       WHERE vr_idtema = '#39
      '             || vt_id'
      '             || '#39') tabla'#39
      '             || '#39' WHERE 1 = 1 '#39
      '         END'
      '           AS consulta'
      '    FROM comercial.cvt_visitatema cvt'
      '   WHERE vt_idvisita = :idvisita'
      '     AND vt_fechabaja IS NULL'
      'ORDER BY vt_orden')
    Left = 76
    Top = 36
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idvisita'
        ParamType = ptInput
      end>
  end
end
