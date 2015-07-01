inherited fraReconfirmacion: TfraReconfirmacion
  Width = 166
  Height = 22
  DesignSize = (
    166
    22)
  object cmbEstudio: TArtComboBox [0]
    Left = 68
    Top = 0
    Width = 98
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'ET_CUIT'
        Title.Caption = 'CUIT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_ESTUDIO'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Estudio'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPORES'
        Title.Caption = 'Resultado'
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'ET_ESTUDIO'
    FieldKey = 'ET_FECHA'
    OnCloseUp = cmbEstudioCloseUp
    OnDropDown = cmbEstudioDropDown
    OnGetCellParams = cmbEstudioGetCellParams
  end
  object edFecha: TDateEditor [1]
    Left = 0
    Top = 0
    Width = 65
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = edFechaKeyDown
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'SELECT ET_CUIT, MP_NOMBRE, ET_FECHA, ET_ESTUDIO, ES_DESCRIPCION,'
      
        '       DECODE(ET_TIPORES,'#39'N'#39','#39'Normal'#39','#39'A'#39','#39'Anormal'#39') TIPORES, ET' +
        '_FECHABAJA'
      '  FROM AES_ESTUDIOS, AET_ESTRAB, CMP_EMPRESAS'
      ' WHERE ET_CUIT = MP_CUIT'
      '   AND ET_TIPO = '#39'EP'#39
      '   AND ET_ESTUDIO = ES_CODIGO'
      '   AND 1=2'
      'ORDER BY ET_FECHA')
  end
end
