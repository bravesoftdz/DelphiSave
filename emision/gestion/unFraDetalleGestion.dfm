object fraDetalleGestion: TfraDetalleGestion
  Left = 0
  Top = 0
  Width = 533
  Height = 103
  TabOrder = 0
  DesignSize = (
    533
    103)
  object dbgDetalle: TArtDBGrid
    Left = 2
    Top = 1
    Width = 529
    Height = 102
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDatos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetalleDrawColumnCell
    FooterBand = False
    TitleHeight = 17
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT dj_empleados, dj_masasalarial, dj_fechapresentacion, tf_d' +
        'escripcion formulario, ob_descripcion'
      
        '  FROM emi.iob_observacion, emi.ido_ddjjobservacion, emi.itf_tip' +
        'oformulario, emi.idj_ddjj'
      ' WHERE tf_id = dj_idformulario'
      '   AND do_idobservacion = ob_id'
      '   AND do_idddjj = dj_id'
      '   AND dj_iddetallesublotegestion = :iddetalle'
      '   AND ob_rechazo IN('#39'S'#39', '#39'G'#39')'
      '')
    Left = 387
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 415
    Top = 48
  end
end
