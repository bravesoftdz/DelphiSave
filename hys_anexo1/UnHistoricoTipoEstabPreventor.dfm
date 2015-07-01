object frmHistoricoAsignaciones: TfrmHistoricoAsignaciones
  Left = 181
  Top = 170
  Caption = 'Hist'#243'rico Cambios'
  ClientHeight = 292
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    638
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object cbAbogados: TCoolBar
    Left = 0
    Top = 0
    Width = 638
    Height = 29
    Bands = <
      item
        Control = tbrHistoricoTipoEstab
        ImageIndex = -1
        MinHeight = 27
        Width = 632
      end>
    object tbrHistoricoTipoEstab: TToolBar
      Left = 9
      Top = 0
      Width = 625
      Height = 27
      BorderWidth = 1
      ButtonWidth = 26
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilByN
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      object tbSalirHistorico: TToolButton
        Left = 0
        Top = 0
        Caption = 'Salir'
        ImageIndex = 5
        OnClick = tbSalirHistoricoClick
      end
    end
  end
  object dbGridHistoricoAsignaciones: TDBGrid
    Left = 8
    Top = 35
    Width = 622
    Height = 256
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsHistoricoAsignaciones
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'he_cuit'
        Title.Caption = 'Cuit'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_estableci'
        Title.Caption = 'Establecimiento'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_tipo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_actividad'
        Title.Caption = 'Actividad'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Caption = 'Preventor'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        Title.Caption = 'Motivo Cambio'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_FECHAVENCIMIENTOASIG'
        Title.Caption = 'F.Vigencia Asignaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preventorprovisorio'
        Title.Caption = 'Preventor Provisorio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_fdesdeprevprovisorio'
        Title.Caption = 'Fecha desde Preventor Provisorio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_fhastaprevprovisorio'
        Title.Caption = 'Fecha hasta Preventor Provisorio'
        Visible = True
      end>
  end
  object dsHistoricoAsignaciones: TDataSource
    DataSet = sdqHistoricoAsignaciones
    Left = 63
    Top = 216
  end
  object sdqHistoricoAsignaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   hhe.he_cuit, hhe.he_estableci, hhe.he_tipo, hhe.he_acti' +
        'vidad,'
      
        '         pit.it_nombre, hhe.he_fechaalta, hhe.he_usualta, hhe.he' +
        '_observacion,'
      
        '         hhe.he_motivoid, hhe.he_fechavencimientoasig, hma.ma_de' +
        'scripcion,'
      '         he_idpreventorprovisorio, he_fdesdeprevprovisorio,'
      
        '         he_fhastaprevprovisorio, pit2.it_nombre preventorprovis' +
        'orio'
      '    FROM hys.hhe_histestabporpreventor hhe,'
      '         art.pit_firmantes pit,'
      '         art.pit_firmantes pit2,'
      '         hys.hma_motivoasigprev hma'
      '   WHERE hhe.he_cuit = :cuit'
      '     AND hhe.he_estableci = :estableci'
      '     AND hhe.he_itcodigo = pit.it_codigo(+)'
      '     AND hhe.he_idpreventorprovisorio = pit2.it_id(+)'
      '     AND hhe.he_motivoid = hma.ma_id(+)'
      'ORDER BY hhe.he_id DESC')
    Left = 35
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Estableci'
        ParamType = ptInput
      end>
  end
end
