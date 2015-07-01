object fraDeclaracionesPresentadas: TfraDeclaracionesPresentadas
  Left = 0
  Top = 0
  Width = 716
  Height = 301
  TabOrder = 0
  object dbgPresentaciones: TArtDBGrid
    Left = 0
    Top = 0
    Width = 716
    Height = 301
    Align = alClient
    DataSource = dsPresentaciones
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = clWindow
    FooterBand = False
    TitleHeight = 32
    Columns = <
      item
        Expanded = False
        FieldName = 'Per'#237'odo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empleados'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Masa Salarial'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha Presentaci'#243'n'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Origen'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rectificativa'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cod.Rect.'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = '%'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vig.Tarifa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F.Emisi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gesti'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rechazada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Formulario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F.Ingreso'
        Visible = True
      end>
  end
  object dsPresentaciones: TDataSource
    Left = 176
    Top = 128
  end
end
