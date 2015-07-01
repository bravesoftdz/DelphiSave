inherited fraActividad: TfraActividad
  Width = 361
  ExplicitWidth = 361
  DesignSize = (
    361
    23)
  inherited cmbDescripcion: TArtComboBox
    Left = 48
    Width = 312
    CharCase = ecUpperCase
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'CIIU'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end>
    ExplicitLeft = 48
    ExplicitWidth = 312
  end
  inherited edCodigo: TPatternEdit
    Width = 44
    MaxLength = 6
    Pattern = '1234567890'
    ExplicitWidth = 44
  end
end
