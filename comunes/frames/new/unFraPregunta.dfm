inherited fraPregunta: TfraPregunta
  Width = 451
  Height = 154
  ExplicitWidth = 451
  ExplicitHeight = 154
  object pnlRespuesta: TPanel
    Left = 0
    Top = 71
    Width = 451
    Height = 83
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pcRespuesta: TAdvPageControl
      Left = 0
      Top = 0
      Width = 451
      Height = 83
      ActivePage = tsListaDeRespuestas
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clWindowText
      ActiveFont.Height = -11
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = []
      Align = alClient
      TabBorderColor = clBtnFace
      TabSheetBorderColor = clBtnFace
      TabBackGroundColor = clBtnFace
      TabMargin.RightMargin = 0
      TabOverlap = 0
      Version = '2.0.0.0'
      PersistPagesState.Location = plRegistry
      PersistPagesState.Enabled = False
      TabOrder = 0
      TabStop = False
      object tsTextoLibre: TAdvTabSheet
        Caption = 'Texto Libre'
        Color = clBtnFace
        ColorTo = clNone
        TabColor = clBtnFace
        TabColorTo = clNone
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object mTextoLibre: TMemo
          Left = 0
          Top = 0
          Width = 443
          Height = 55
          Align = alClient
          TabOrder = 0
        end
      end
      object tsListaDeRespuestas: TAdvTabSheet
        Caption = 'Lista de Respuestas'
        Color = clBtnFace
        ColorTo = clNone
        ImageIndex = 1
        TabColor = clBtnFace
        TabColorTo = clNone
        DesignSize = (
          443
          55)
        inline fraListaDeRespuestas: TfraCodDesc
          Left = 0
          Top = 0
          Width = 406
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitWidth = 406
          inherited cmbDescripcion: TArtComboBox
            Width = 341
            ExplicitWidth = 341
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'BAJA'
            FieldCodigo = 'CODIGO'
            FieldDesc = 'DESCRIPCION'
            FieldID = 'ID'
            FullLikeComparison = True
            OrderBy = 'ORDEN'
            TableName = 'TABLA'
            OnChange = fraListaDeRespuestasPropiedadesChange
          end
        end
      end
      object tsRespuestaMultiple: TAdvTabSheet
        Caption = 'Respuesta M'#250'ltiple'
        Color = clBtnFace
        ColorTo = clNone
        ImageIndex = 2
        TabColor = clBtnFace
        TabColorTo = clNone
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
  end
  object pnlPregunta: TJvPanel
    AlignWithMargins = True
    Left = 12
    Top = 25
    Width = 427
    Height = 46
    Margins.Left = 12
    Margins.Top = 0
    Margins.Right = 12
    Margins.Bottom = 0
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    MultiLine = True
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Pregunta?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnlBreadCrumb: TJvPanel
    AlignWithMargins = True
    Left = 12
    Top = 0
    Width = 427
    Height = 25
    Margins.Left = 12
    Margins.Top = 0
    Margins.Right = 12
    Margins.Bottom = 0
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    MultiLine = True
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Bread > Crumb'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 2
  end
  object sdqGuardarRespuesta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'INSERT INTO comercial.ced_encuestainstanciadetalle('
      '  ed_id, '
      '  ed_idencuestainstancia, '
      '  ed_idencuesta,'
      '  ed_idpregunta,  '
      '  ed_idrespuesta, '
      '  ed_respuestalibre,'
      '  ed_respuestadinamica,'
      '  ed_idrespuestadinamica)'
      'VALUES ('
      ' comercial.seq_ced_id.nextval,'
      ' :idencuestainstancia,'
      ' :idencuesta, '
      ' :idpregunta,'
      ' CASE :idrespuesta '
      '   WHEN 0 THEN NULL '
      '   ELSE :idrespuesta '
      ' END, '
      ' :respuestalibre,'
      ' :respuestadinamica,'
      ' :idrespuestadinamica)')
    Left = 136
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idencuestainstancia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idencuesta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpregunta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idrespuesta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idrespuesta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'respuestalibre'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'respuestadinamica'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idrespuestadinamica'
        ParamType = ptInput
      end>
  end
  object sdqCargarRespuesta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM comercial.ced_encuestainstanciadetalle'
      ' WHERE 1 = 1'
      '   AND ed_idencuestainstancia = :idencuestainstancia'
      '   AND ed_idpregunta = :idpregunta')
    Left = 368
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idencuestainstancia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpregunta'
        ParamType = ptInput
      end>
  end
  object sdqModificarRespuesta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'update comercial.ced_encuestainstanciadetalle set'
      '  ed_idrespuesta = DECODE(:idrespuesta, 0, NULL, :idrespuesta),'
      '  ed_respuestalibre = :respuestalibre,'
      '  ed_respuestadinamica = :respuestadinamica,'
      
        '  ed_idrespuestadinamica = DECODE(:idrespuestadinamica, 0, NULL,' +
        ' :idrespuestadinamica)'
      'where ed_id = :id')
    Left = 252
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idrespuesta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idrespuesta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'respuestalibre'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'respuestadinamica'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idrespuestadinamica'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idrespuestadinamica'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
end
