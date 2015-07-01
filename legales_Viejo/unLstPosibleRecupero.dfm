inherited frmLstPosibleRecupero: TfrmLstPosibleRecupero
  Left = 217
  Top = 193
  Width = 698
  Height = 345
  Caption = 'Listado - Posible Recupero'
  Constraints.MinHeight = 338
  Constraints.MinWidth = 690
  OldCreateOrder = True
  StatusBar = frmPrincipal.sbEstado
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 690
    Height = 66
    object gbFechaAccidente: TGroupBox
      Left = 5
      Top = 4
      Width = 264
      Height = 53
      Caption = 'Fecha Accidente'
      TabOrder = 0
      object lbFechaDesde: TLabel
        Left = 7
        Top = 21
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object lbFechaHasta: TLabel
        Left = 135
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object edFechaAccDesde: TDateComboBox
        Left = 43
        Top = 17
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAccHasta
        TabOrder = 0
      end
      object edFechaAccHasta: TDateComboBox
        Left = 169
        Top = 17
        Width = 88
        Height = 21
        MinDateCombo = edFechaAccDesde
        TabOrder = 1
      end
    end
    object gbListados: TGroupBox
      Left = 272
      Top = 4
      Width = 224
      Height = 53
      Caption = 'Listados'
      TabOrder = 1
      object rbGeneral: TRadioButton
        Left = 4
        Top = 21
        Width = 62
        Height = 17
        Caption = 'General'
        TabOrder = 0
      end
      object rbRechazo: TRadioButton
        Left = 75
        Top = 21
        Width = 68
        Height = 17
        Caption = 'Rechazo'
        TabOrder = 1
      end
      object rbTrabajador: TRadioButton
        Left = 146
        Top = 21
        Width = 76
        Height = 17
        Caption = 'Trabajador'
        TabOrder = 2
      end
    end
    object gbConsolidado: TGroupBox
      Left = 499
      Top = 4
      Width = 186
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Consolidado'
      TabOrder = 2
      DesignSize = (
        186
        53)
      object chkConsolidado: TCheckCombo
        Left = 7
        Top = 21
        Width = 170
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Items.Strings = (
          'Con Alta M'#233'dica'
          'Con Dictamen de Comisi'#243'n M'#233'dica')
      end
    end
  end
  inherited CoolBar: TCoolBar
    Left = 4
    Top = 66
    Width = 265
    Align = alNone
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 261
      end>
    inherited ToolBar: TToolBar
      Width = 248
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbImprimir: TToolButton
        Left = 0
        Top = 30
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Left = 23
        Top = 30
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Left = 46
        Top = 30
      end
      inherited ToolButton8: TToolButton
        Left = 69
        Top = 30
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 77
        Top = 30
      end
      inherited tbMaxRegistros: TToolButton
        Left = 100
        Top = 30
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 123
        Top = 30
      end
      inherited tbSalir: TToolButton
        Left = 131
        Top = 30
      end
    end
  end
  inherited Grid: TArtDBGrid
    Left = 4
    Top = 99
    Width = 682
    Height = 216
    Align = alNone
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACCIDENTE'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Width = 134
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_ACC'
        Title.Caption = 'TIPO ACC.'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACC_DESTINATARIO'
        Title.Alignment = taCenter
        Title.Caption = 'ACC. DESTINATARIO'
        Width = 124
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'ALTA MEDICA'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'POSIBLE_RECUPERO'
        Title.Alignment = taCenter
        Title.Caption = 'POSIBLE RECUPERO'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAUSA_FIN'
        Title.Caption = 'CAUSA FIN'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EVENTO'
        Width = 261
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PORCENTAJE'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CARACTER'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRADO'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ILT_ESTIMADA'
        Title.Alignment = taCenter
        Title.Caption = 'ILT ESTIMADA'
        Width = 83
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ILT'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ILP'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MORTALES'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'OTROS'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PREST_MEDICAS'
        Title.Alignment = taCenter
        Title.Caption = 'PREST. MEDICAS'
        Width = 104
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 107
        Visible = True
      end>
  end
  object pnlCantRegistros: TPanel [3]
    Left = 272
    Top = 66
    Width = 414
    Height = 29
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      
        'SINIESTRO, ORDEN, ACCIDENTE, CUIT, EMPRESA, CUIL, TRABAJADOR, TI' +
        'POACCID'#9'TIPO_ACC, ACCIDENTETRANSITO'#9'ACC_DESTINATARIO,'
      
        'POSIBLERECUPERO'#9'POSIBLE_RECUPERO, CAUSAFIN CAUSA_FIN, EVENTO, PO' +
        'RCENTAJE, FECHA, CARACTER, GRADO, ILT, ILP, MORTALES, OTROS, '
      'PRESTMEDICAS PREST_MEDICAS, PRESTADOR, TIPO'
      
        'from art.srt_recuperotrabajador where accidente between '#39'01/01/2' +
        '001'#39' AND '#39'01/01/2001'#39)
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'SINIESTRO'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'ORDEN'
        DataField = 'ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'ACCIDENTE'
        DataField = 'ACCIDENTE'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        FieldIndex = 0
      end
      item
        Title = 'EMPRESA'
        DataField = 'EMPRESA'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        FieldIndex = 0
      end
      item
        Title = 'TRABAJADOR'
        DataField = 'TRABAJADOR'
        FieldIndex = 0
      end
      item
        Title = 'TIPO ACC.'
        DataField = 'TIPO_ACC'
        FieldIndex = 0
      end
      item
        Title = 'ACC. DESTINATARIO'
        DataField = 'ACC_DESTINATARIO'
        FieldIndex = 0
      end
      item
        Title = 'POSIBLE RECUPERO'
        DataField = 'POSIBLE_RECUPERO'
        FieldIndex = 0
      end
      item
        Title = 'CAUSA FIN'
        DataField = 'CAUSA_FIN'
        FieldIndex = 0
      end
      item
        Title = 'EVENTO'
        DataField = 'EVENTO'
        FieldIndex = 0
      end
      item
        Title = 'PORCENTAJE'
        DataField = 'PORCENTAJE'
        FieldIndex = 0
      end
      item
        Title = 'FECHA'
        DataField = 'FECHA'
        FieldIndex = 0
      end
      item
        Title = 'CARACTER'
        DataField = 'CARACTER'
        FieldIndex = 0
      end
      item
        Title = 'GRADO'
        DataField = 'GRADO'
        FieldIndex = 0
      end
      item
        Title = 'ILT'
        DataField = 'ILT'
        FieldIndex = 0
      end
      item
        Title = 'ILP'
        DataField = 'ILP'
        FieldIndex = 0
      end
      item
        Title = 'MORTALES'
        DataField = 'MORTALES'
        FieldIndex = 0
      end
      item
        Title = 'OTROS'
        DataField = 'OTROS'
        FieldIndex = 0
      end
      item
        Title = 'PREST. MEDICAS'
        DataField = 'PREST_MEDICAS'
        FieldIndex = 0
      end
      item
        Title = 'PRESTADOR'
        DataField = 'PRESTADOR'
        FieldIndex = 0
      end
      item
        Title = 'TIPO'
        DataField = 'TIPO'
        FieldIndex = 0
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Sin.'
        DataField = 'SINIESTRO'
        Width = 180
        MaxLength = 10
      end
      item
        Title = 'Ord.'
        DataField = 'ORDEN'
        Width = 170
        MaxLength = 5
      end
      item
        Title = 'Accid.'
        TitleAlignment = taCenter
        DataField = 'ACCIDENTE'
        Alignment = taCenter
        Width = 280
        MaxLength = 10
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'CUIT'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        Width = 1400
        MaxLength = 30
      end
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'CUIL'
        Alignment = taCenter
        Width = 300
        MaxLength = 12
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        Width = 700
        MaxLength = 30
      end
      item
        Title = 'Tipo Acc.'
        DataField = 'TIPO_ACC'
        Width = 300
        MaxLength = 1
      end
      item
        Title = 'Destinat.'
        TitleAlignment = taCenter
        DataField = 'ACC_DESTINATARIO'
        Alignment = taCenter
        Width = 320
        MaxLength = 1
      end
      item
        Title = 'Alta M'#233'd.'
        TitleAlignment = taCenter
        DataField = 'EX_ALTAMEDICA'
        Alignment = taCenter
        Width = 310
        MaxLength = 0
      end
      item
        Title = 'Pos. Recup.'
        DataField = 'POSIBLE_RECUPERO'
        Alignment = taCenter
        Width = 400
        MaxLength = 1
      end
      item
        Title = 'C. Fin'
        DataField = 'CAUSA_FIN'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Evento'
        DataField = 'EVENTO'
        Width = 1480
        MaxLength = 30
      end
      item
        Title = 'Porc.'
        TitleAlignment = taCenter
        DataField = 'PORCENTAJE'
        Alignment = taRightJustify
        Width = 270
        MaxLength = 4
      end
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'FECHA'
        Alignment = taCenter
        Width = 280
        MaxLength = 10
      end
      item
        Title = 'Caracter'
        TitleAlignment = taCenter
        DataField = 'CARACTER'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Grado'
        TitleAlignment = taCenter
        DataField = 'GRADO'
        Alignment = taCenter
        Width = 230
        MaxLength = 0
      end
      item
        Title = 'TOTAL'
        TitleAlignment = taCenter
        DataField = 'TOTAL'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end>
    LastColType = lcNone
    PageOrientation = pxLandscape
    PageSize = psLegal
    Top = 285
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
  inherited FieldHider: TFieldHider
    Top = 227
  end
end
