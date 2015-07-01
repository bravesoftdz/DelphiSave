inherited frmEventosAutorizacion: TfrmEventosAutorizacion
  Left = 413
  Top = 247
  Width = 705
  Height = 507
  Caption = 'Eventos que generan autorizaci'#243'n'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 695
    Height = 45
    object gbEvento: TGroupBox
      Left = 4
      Top = 3
      Width = 361
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Evento'
      TabOrder = 0
      DesignSize = (
        361
        41)
      object dbchkEvento: TDBCheckCombo
        Left = 4
        Top = 15
        Width = 351
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEventos
        KeyField = 'em_codigo'
        ListField = 'em_descripcion'
      end
    end
    object gbFecha: TGroupBox
      Left = 366
      Top = 3
      Width = 194
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
      TabOrder = 1
      object Label1: TLabel
        Left = 91
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object deFechaDesde: TDateComboBox
        Left = 6
        Top = 15
        Width = 84
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = deFechaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object deFechaHasta: TDateComboBox
        Left = 106
        Top = 15
        Width = 84
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = deFechaDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object rgVer: TRadioGroup
      Left = 561
      Top = 3
      Width = 131
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Ver Estado'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Pend.'
        'Todos')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 45
    Width = 695
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 691
      end>
    inherited ToolBar: TToolBar
      Width = 678
    end
  end
  inherited Grid: TArtDBGrid
    Top = 74
    Width = 695
    Height = 404
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'siniestro'
        Title.Caption = 'Siniestro'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tj_nombre'
        Title.Caption = 'Trabajador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 're_nombre'
        Title.Caption = 'Responsable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'er_evento'
        Title.Caption = 'N'#176' Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'er_fecha'
        Title.Caption = 'Fecha Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'er_codigo'
        Title.Caption = 'C'#243'digo Evento'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT er_siniestro, er_orden,'
      
        '       art.SIN.get_recaida_recalificacion (er_siniestro, er_orde' +
        'n) er_recaida,'
      '       tj_nombre, re_nombre, er_evento, er_fecha'
      '  FROM SIN.sem_eventomedicoreca,'
      '       art.ser_evemedrecalif, art.sex_expedientes,'
      '       comunes.ctj_trabajador, art.mre_responsable'
      ' WHERE em_generaautorizacion = '#39'S'#39
      '   AND em_codigo = er_codigo'
      '   AND er_evento > 0'
      '   AND ex_siniestro = er_siniestro'
      '   AND ex_orden = er_orden'
      
        '   AND ex_recaida = art.SIN.get_recaida_recalificacion (er_sinie' +
        'stro, er_orden)'
      '   AND tj_id = ex_idtrabajador'
      '   AND er_responsable = re_responsable(+)')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
  object sdqEventos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT em_codigo, em_descripcion'
      'FROM SIN.sem_eventomedicoreca'
      'WHERE em_fechabaja IS NULL'
      '    AND em_generaautorizacion = '#39'S'#39)
    Left = 140
    Top = 20
  end
  object dsEventos: TDataSource
    DataSet = sdqEventos
    Left = 176
    Top = 20
  end
end
