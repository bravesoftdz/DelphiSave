inherited frmManParametrosManualesMail: TfrmManParametrosManualesMail
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Par'#225'metro'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_OBLIGATORIO'
        Title.Caption = 'Obligatorio'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_VALORDEFECTO'
        Title.Caption = 'Valor por Defecto'
        Width = 200
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT mp_id, mp_idgestionable, mp_nombre, mp_tipo, mp_obligator' +
        'io,'
      '       mp_fechaalta, mp_usualta, mp_fechamodif, mp_usumodif,'
      '       mp_fechabaja, mp_usubaja, mp_valordefecto'
      '  FROM emi.imp_mailparametro'
      'WHERE mp_idgestionable = :idgestionable'
      '  AND mp_idmodonotificacion = :idmodonotificacion')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idgestionable'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idmodonotificacion'
        ParamType = ptInput
      end>
  end
end
