inherited frmReservasActuariales: TfrmReservasActuariales
  Left = 274
  Top = 131
  Caption = 'Reservas Actuariales'
  ClientHeight = 370
  ClientWidth = 492
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  OldCreateOrder = True
  ExplicitLeft = 274
  ExplicitTop = 131
  ExplicitWidth = 500
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 492
    Height = 43
    ExplicitWidth = 492
    ExplicitHeight = 43
    object gbPeriodo: TGroupBox
      Left = 3
      Top = 0
      Width = 79
      Height = 41
      Caption = 'Periodo'
      TabOrder = 0
      object edPeriodo: TPeriodoPicker
        Left = 10
        Top = 14
        Width = 60
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 43
    Width = 492
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 486
      end>
    ExplicitTop = 43
    ExplicitWidth = 492
    inherited ToolBar: TToolBar
      Width = 477
      ExplicitWidth = 477
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 72
    Width = 492
    Height = 298
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accidente'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SEXO'
        Title.Alignment = taCenter
        Title.Caption = 'Sexo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBD'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBD_POSDECRETO'
        Title.Alignment = taCenter
        Title.Caption = 'IBD PosDecreto'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Edad'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Actividad'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porc.'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANTICIPOS'
        Title.Alignment = taCenter
        Title.Caption = 'Anticipos'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Res. Total'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_ART'
        Title.Alignment = taCenter
        Title.Caption = 'Res. ART'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_FFEP'
        Title.Alignment = taCenter
        Title.Caption = 'Res. FFEP'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_GBPA'
        Title.Alignment = taCenter
        Title.Caption = 'Res. GPBA'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA'
        Title.Caption = 'Reserva'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLASIFICACION'
        Title.Caption = 'Clasificaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_NACIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Nacim.'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_FIN_ILT'
        Title.Alignment = taCenter
        Title.Caption = 'F. Fin ILT'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_FIN_ILP'
        Title.Alignment = taCenter
        Title.Caption = 'F. Fin ILP'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACION_ACTUAL'
        Title.Caption = 'Sit. Actual'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_DICTAMEN'
        Title.Alignment = taCenter
        Title.Caption = 'F. Dictamen'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ALTA_MEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta M'#233'dica'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASIGNACION_FAMILIAR'
        Title.Alignment = taCenter
        Title.Caption = 'Asign. Familiar'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO1'
        Title.Alignment = taCenter
        Title.Caption = 'Juicio 1'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO2'
        Title.Alignment = taCenter
        Title.Caption = 'Juicio 2'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO3'
        Title.Alignment = taCenter
        Title.Caption = 'Juicio 3'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO4'
        Title.Alignment = taCenter
        Title.Caption = 'Juicio 4'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 56
        Visible = True
      end>
  end
  object pgGrillas: TPageControl [3]
    Left = 0
    Top = 72
    Width = 492
    Height = 298
    ActivePage = tsExtILT
    Align = alClient
    TabOrder = 3
    OnChange = pgGrillasChange
    object tsIncapacidad: TTabSheet
      Caption = 'Incapacidad'
      ExplicitWidth = 1912
      ExplicitHeight = 928
    end
    object tsMortales: TTabSheet
      Caption = 'Mortales'
      ImageIndex = 1
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridMortales: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsMortales
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridMortalesPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Siniestro'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Alignment = taCenter
            Title.Caption = 'Orden'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 114
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_ACCIDENTE'
            Title.Alignment = taCenter
            Title.Caption = 'F. Accidente'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SEXO'
            Title.Alignment = taCenter
            Title.Caption = 'Sexo'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBD'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EDAD'
            Title.Alignment = taCenter
            Title.Caption = 'Edad'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACTIVIDAD'
            Title.Alignment = taCenter
            Title.Caption = 'Actividad'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Title.Caption = 'Sector'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_CAPITAL'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Capital'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ADICIONAL'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Adicional'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA'
            Title.Alignment = taCenter
            Title.Caption = 'Reserva'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ART'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_FFEP'
            Title.Alignment = taCenter
            Title.Caption = 'Res. FFEP'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_GBPA'
            Title.Alignment = taCenter
            Title.Caption = 'Res. GPBA'
            Width = 72
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_NACIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'F. Nacim'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUICIO1'
            Title.Alignment = taCenter
            Title.Caption = 'Juicio 1'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUICIO2'
            Title.Alignment = taCenter
            Title.Caption = 'Juicio 2'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUICIO3'
            Title.Alignment = taCenter
            Title.Caption = 'Juicio 3'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUICIO4'
            Title.Alignment = taCenter
            Title.Caption = 'Juicio 4'
            Width = 52
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end>
      end
    end
    object tsJuicios: TTabSheet
      Caption = 'Juicios'
      ImageIndex = 2
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridJuicios: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsJuicios
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridJuiciosPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'JUICIO'
            Title.Alignment = taCenter
            Title.Caption = 'Juicio'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Siniestro'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Alignment = taCenter
            Title.Caption = 'Orden'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARATULA'
            Title.Caption = 'Car'#225'tula'
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAPITAL'
            Title.Alignment = taCenter
            Title.Caption = 'Capital'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HONORARIOS'
            Title.Alignment = taCenter
            Title.Caption = 'Honorarios'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Total'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ART'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_GBPA'
            Title.Alignment = taCenter
            Title.Caption = 'Res. GPBA'
            Width = 78
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_INICIO'
            Title.Alignment = taCenter
            Title.Caption = 'F. Inicio'
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_ACCIDENTE'
            Title.Alignment = taCenter
            Title.Caption = 'F. Accidente'
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Title.Caption = 'Estado'
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Title.Caption = 'Sector'
            Width = 131
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'GPBA'
            Title.Alignment = taCenter
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 225
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end>
      end
    end
    object tsILT: TTabSheet
      Caption = 'ILT'
      ImageIndex = 3
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridILT: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsILT
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridILTPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Siniestro'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Alignment = taCenter
            Title.Caption = 'Orden'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 144
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FACCIDENTE'
            Title.Alignment = taCenter
            Title.Caption = 'F. Accidente'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBD'
            Title.Alignment = taCenter
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Title.Caption = 'Sector'
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBD_PROMEDIO'
            Title.Alignment = taCenter
            Title.Caption = 'IBD Promedio'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIAS_ILT'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as ILT'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIAS_LIQUIDADOS'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as Liquidados'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FRANQUICIA'
            Title.Alignment = taCenter
            Title.Caption = 'Franquicia'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIAS_ILT_ART'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as ILT ART'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIAS_PENDIENTES_ILT'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as Pend. ILT'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ILT'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ILT'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ILT_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ILT ART'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ILT_FFEP'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ILT FFEP'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ILT_GBPA'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ILT GPBA'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLASIFICACION'
            Title.Caption = 'Clasificaci'#243'n'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_CONTRIBUCIONES'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Contribuciones'
            Width = 105
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end>
      end
    end
    object tsPrestEspecie: TTabSheet
      Caption = 'Prestaciones en Especie'
      ImageIndex = 4
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridPrestEspecie: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsPrestEspecie
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridPrestEspeciePaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Siniestro'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Alignment = taCenter
            Title.Caption = 'Orden'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 173
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_ACCIDENTE'
            Title.Alignment = taCenter
            Title.Caption = 'F. Accidente'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Title.Caption = 'Sector'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRESTACION_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Prestaci'#243'n Total'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COSTO_MINIMO'
            Title.Alignment = taCenter
            Title.Caption = 'Costo M'#237'nimo'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA'
            Title.Alignment = taCenter
            Title.Caption = 'Reserva'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Res. ART'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_FFEP'
            Title.Alignment = taCenter
            Title.Caption = 'Res. FFEP'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVA_GBPA'
            Title.Alignment = taCenter
            Title.Caption = 'Res. GPBA'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLASIFICACION'
            Title.Caption = 'Clasificaci'#243'n'
            Width = 195
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end>
      end
    end
    object tsPEMasaSal: TTabSheet
      Caption = 'PE por Masa Salarial'
      ImageIndex = 6
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridPEMasaSal: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsPEMasaSal
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridPEMasaSalPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'MASASALARIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Masa Salarial'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESPEMASA'
            Title.Alignment = taCenter
            Title.Caption = 'Reserva '
            Width = 136
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end>
      end
    end
    object tsExtILT: TTabSheet
      Caption = 'Extensi'#243'n de ILT'
      ImageIndex = 7
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridExtILT: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsExtILT
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridExtILTPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'IDRESERVA'
            Title.Alignment = taCenter
            Title.Caption = 'ID Reserva'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDRESERVA_ART'
            Title.Alignment = taCenter
            Title.Caption = 'ID Reserva ART'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDRESERVA_FFEP'
            Title.Alignment = taCenter
            Title.Caption = 'ID Reserva FFEP'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDRESERVA_GPBA'
            Title.Alignment = taCenter
            Title.Caption = 'ID Reserva GPBA'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Siniestro'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Alignment = taCenter
            Title.Caption = 'Orden'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 173
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FACCIDENTE'
            Title.Alignment = taCenter
            Title.Caption = 'F. Accidente'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHAILT2'
            Title.Alignment = taCenter
            Title.Caption = 'F. Extensi'#243'n ILT'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBD'
            Title.Alignment = taCenter
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBD_VIEJO'
            Title.Alignment = taCenter
            Title.Caption = 'IBD Anterior'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Title.Caption = 'Sector'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRIMESTRE'
            Title.Alignment = taCenter
            Title.Caption = 'Trimestre Origen'
            Width = 92
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IBDPROMEDIO'
            Title.Alignment = taCenter
            Title.Caption = 'IBD Promedio'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIASEXTILT'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as Ext. ILT'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIASEXTLIQUIDADOS'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as Ext. ILT Liquidados'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIASPEND_EXTILT'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'as Ext. ILT Pend.'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RES_EXTILT'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Ext. ILT'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RES_EXTILT_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Ext. ILT ART'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RES_EXTILT_FFEP'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Ext. ILT FFEP'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RES_EXTILT_GBPA'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Ext. ILT GBPA'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLASIFICACION'
            Title.Caption = 'Clasificaci'#243'n'
            Width = 198
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIIU'
            Width = 68
            Visible = True
          end>
      end
    end
    object tsGInvalidez: TTabSheet
      Caption = 'Gran Invalidez'
      ImageIndex = 8
      ExplicitWidth = 1912
      ExplicitHeight = 928
      object GridGInvalidez: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsGInvalidez
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridGInvalidezPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Siniestro'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEN'
            Title.Alignment = taCenter
            Title.Caption = 'Orden'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPL'
            Title.Alignment = taCenter
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESERVABALANCE'
            Title.Alignment = taCenter
            Title.Caption = 'Res. Balance'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Diferencia Res.'
            Width = 105
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 56
            Visible = True
          end>
      end
    end
    object tsResumen: TTabSheet
      Caption = 'Resumen'
      ImageIndex = 5
      object GridResumen: TArtDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 270
        Align = alClient
        DataSource = dsResumen
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridResumenPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
            Width = 107
            Visible = True
          end>
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        '/*SELECT RP_SINIESTRO SINIESTRO, RP_ORDEN ORDEN, RP_FACCIDENTE F' +
        'ECHA_ACCIDENTE,'
      
        '       RP_SEXO SEXO, RP_IBD IBD, RP_IBD_POSDECRETO IBD_POSDECRET' +
        'O, RP_EDAD EDAD,'
      
        '       RP_ACTIVIDAD ACTIVIDAD, RP_SECTOR SECTOR, RP_PORCENTAJE P' +
        'ORCENTAJE,'
      
        '       RP_ANTICIPOS ANTICIPOS, RP_RES_TOTAL RESERVA_TOTAL, RP_RE' +
        'S_ART RESERVA_ART,'
      
        '       RP_RES_FFEP RESERVA_FFEP, RP_RES_GBPA RESERVA_GBPA, RP_RE' +
        'SERVA RESERVA,'
      
        '       RP_CLASIFICACION CLASIFICACION, RP_FNACIMIENTO FECHA_NACI' +
        'MIENTO,'
      
        '       RP_FFIN_ILT FECHA_FIN_ILT, RP_FFIN_ILP FECHA_FIN_ILP, RP_' +
        'CIE10 CIE10,'
      
        '       RP_SITUACIONACTUAL SITUACION_ACTUAL, RP_FDICTAMEN FECHA_D' +
        'ICTAMEN,'
      
        '       RP_FALTAMEDICA FECHA_ALTA_MEDICA, RP_ASIGFAMILIAR ASIGNAC' +
        'ION_FAMILIAR, RP_TOTAL TOTAL,'
      
        '       RP_JUICIO1 JUICIO1, RP_JUICIO2 JUICIO2, RP_JUICIO3 JUICIO' +
        '3, RP_JUICIO4 JUICIO4'
      ' FROM ACTUARIAL.URP_RESERVAINCAPACIDAD'
      'WHERE 1 = 2*/'
      ''
      
        'SELECT RM_SINIESTRO SINIESTRO, RM_ORDEN ORDEN, RM_NOMBRE NOMBRE,' +
        ' RM_FACCIDENTE FECHA_ACCIDENTE,'
      
        '       RM_SEXO SEXO, RM_IBD IBD, RM_EDAD EDAD, RM_ACTIVIDAD ACTI' +
        'VIDAD, RM_SECTOR SECTOR,'
      
        '       RM_RES_CAPITAL RESERVA_CAPITAL, RM_RES_ADICIONAL RESERVA_' +
        'ADICIONAL, RM_RESERVA RESERVA,'
      
        '       RM_RES_ART RESERVA_ART, RM_RES_FFEP RESERVA_FFEP, RM_RES_' +
        'GBPA RESERVA_GBPA,'
      
        '       RM_FNACIMIENTO FECHA_NACIMIENTO, RM_TOTAL TOTAL, RM_JUICI' +
        'O1 JUICIO1, RM_JUICIO2 JUICIO2,'
      '       RM_JUICIO3 JUICIO3, RM_JUICIO4 JUICIO4'
      '  FROM ACTUARIAL.URM_RESERVAMORTAL'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end>
    Left = 108
    Top = 200
  end
  object sdqMortales: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqMortalesAfterOpen
    SQL.Strings = (
      
        'SELECT RM_SINIESTRO SINIESTRO, RM_ORDEN ORDEN, RM_NOMBRE NOMBRE,' +
        ' RM_FACCIDENTE FECHA_ACCIDENTE,'
      
        '       RM_SEXO SEXO, RM_IBD IBD, RM_EDAD EDAD, RM_ACTIVIDAD ACTI' +
        'VIDAD, RM_SECTOR SECTOR,'
      
        '       RM_RES_CAPITAL RESERVA_CAPITAL, RM_RES_ADICIONAL RESERVA_' +
        'ADICIONAL, RM_RESERVA RESERVA,'
      
        '       RM_RES_ART RESERVA_ART, RM_RES_FFEP RESERVA_FFEP, RM_RES_' +
        'GBPA RESERVA_GBPA,'
      
        '       RM_FNACIMIENTO FECHA_NACIMIENTO, RM_TOTAL TOTAL, RM_JUICI' +
        'O1 JUICIO1, RM_JUICIO2 JUICIO2,'
      '       RM_JUICIO3 JUICIO3, RM_JUICIO4 JUICIO4'
      '  FROM ACTUARIAL.URM_RESERVAMORTAL'
      ' WHERE 1 = 2')
    Left = 152
    Top = 200
  end
  object dsMortales: TDataSource
    DataSet = sdqMortales
    Left = 180
    Top = 200
  end
  object sdqJuicios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqJuiciosAfterOpen
    SQL.Strings = (
      
        'SELECT RJ_JUICIO JUICIO, RJ_SINIESTRO SINIESTRO, RJ_ORDEN ORDEN,' +
        ' RJ_CARATULA CARATULA, '
      
        '       RJ_CAPITAL CAPITAL, RJ_HONORARIOS HONORARIOS, RJ_RES_TOTA' +
        'L RESERVA_TOTAL, '
      
        '       RJ_RES_ART RESERVA_ART, RJ_RES_GBPA RESERVA_GBPA, RJ_FECH' +
        'AINICIO FECHA_INICIO, '
      
        '       RJ_FACCIDENTE FECHA_ACCIDENTE, RJ_FECHA FECHA, RJ_ESTADO ' +
        'ESTADO, RJ_SECTOR SECTOR,'
      '       RJ_GPBA GPBA, RJ_DESCRIPCION DESCRIPCION'
      '  FROM ACTUARIAL.URJ_RESERVAJUICIO'
      ' WHERE 1 = 2'
      ' '
      '')
    Left = 152
    Top = 228
  end
  object dsJuicios: TDataSource
    DataSet = sdqJuicios
    Left = 180
    Top = 228
  end
  object sdqILT: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqILTAfterOpen
    SQL.Strings = (
      
        'SELECT RI_SINIESTRO SINIESTRO, RI_ORDEN ORDEN, RI_NOMBRE NOMBRE,' +
        ' RI_FACCIDENTE FACCIDENTE, '
      
        '       RI_IBD IBD, RI_SECTOR SECTOR, RI_IBDPROMEDIO IBD_PROMEDIO' +
        ', RI_DIASILT DIAS_ILT, '
      
        '       RI_DIASLIQUIDADOS DIAS_LIQUIDADOS, RI_FRANQUICIA FRANQUIC' +
        'IA, RI_DIASILT_ART DIAS_ILT_ART, '
      
        '       RI_DIASPEND_ILT DIAS_PENDIENTES_ILT, RI_RES_ILT RESERVA_I' +
        'LT, RI_RES_ILT_ART RESERVA_ILT_ART,'
      
        '       RI_RES_ILT_FFEP RESERVA_ILT_FFEP, RI_RES_ILT_GBPA RESERVA' +
        '_ILT_GBPA, RI_CLASIFICACION CLASIFICACION,'
      '       RI_RES_CONTRI RESERVA_CONTRIBUCIONES'
      '  FROM ACTUARIAL.URI_RESERVAILT'
      ' WHERE 1 = 2'
      ' ')
    Left = 152
    Top = 256
  end
  object dsILT: TDataSource
    DataSet = sdqILT
    Left = 180
    Top = 256
  end
  object sdqPrestEspecie: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPrestEspecieAfterOpen
    SQL.Strings = (
      
        'SELECT RE_SINIESTRO SINIESTRO, RE_ORDEN ORDEN, RE_NOMBRE NOMBRE,' +
        ' RE_FACCIDENTE FECHA_ACCIDENTE, '
      
        '       RE_SECTOR SECTOR, RE_PETOTAL PRESTACION_TOTAL, PE_COSTOMI' +
        'NIMOACT COSTO_MINIMO, '
      
        '       RE_RESERVA RESERVA, RE_RES_ART RESERVA_ART, RE_RES_FFEP R' +
        'ESERVA_FFEP, RE_RES_GBPA RESERVA_GBPA, '
      '       RE_CLASIFICACION CLASIFICACION'
      '  FROM ACTUARIAL.URE_RESERVAPRESESPE'
      ' WHERE 1 = 2')
    Left = 152
    Top = 284
  end
  object dsPrestEspecie: TDataSource
    DataSet = sdqPrestEspecie
    Left = 180
    Top = 284
  end
  object SortDialogMortales: TSortDialog
    Caption = 'Orden'
    DataSet = sdqMortales
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 200
  end
  object SortDialogJuicios: TSortDialog
    Caption = 'Orden'
    DataSet = sdqJuicios
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 228
  end
  object SortDialogILT: TSortDialog
    Caption = 'Orden'
    DataSet = sdqILT
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 256
  end
  object SortDialogPrestEspecie: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPrestEspecie
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 284
  end
  object sdqResumen: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqResumenAfterOpen
    SQL.Strings = (
      'SELECT TIPO, TOTAL'
      
        '  FROM (SELECT '#39'Incapacidad'#39' TIPO, RP_PERIODO PERIODO, SUM(RP_TO' +
        'TAL) TOTAL'
      '          FROM ACTUARIAL.URP_RESERVAINCAPACIDAD'
      '         GROUP BY RP_PERIODO'
      '         UNION ALL'
      
        '        SELECT '#39'Mortal'#39' TIPO, RM_PERIODO PERIODO, SUM(RM_TOTAL) ' +
        'TOTAL'
      '          FROM ACTUARIAL.URM_RESERVAMORTAL'
      '         GROUP BY RM_PERIODO'
      '         UNION ALL'
      
        '        SELECT '#39'Juicios'#39' TIPO, RJ_PERIODO PERIODO, SUM(RJ_RES_TO' +
        'TAL) TOTAL'
      '          FROM ACTUARIAL.URJ_RESERVAJUICIO'
      '         GROUP BY RJ_PERIODO'
      '         UNION ALL'
      
        '        SELECT '#39'ILT'#39' TIPO, RI_PERIODO PERIODO, SUM(RI_RES_ILT) T' +
        'OTAL'
      '          FROM ACTUARIAL.URI_RESERVAILT'
      '         GROUP BY RI_PERIODO'
      '         UNION ALL'
      
        '        SELECT '#39'Prestaciones en Especie'#39' TIPO, RE_PERIODO PERIOD' +
        'O, SUM(RE_RESERVA) TOTAL'
      '          FROM ACTUARIAL.URE_RESERVAPRESESPE'
      '         GROUP BY RE_PERIODO'
      '        )'
      'WHERE 1 = 2'
      '')
    Left = 152
    Top = 392
  end
  object dsResumen: TDataSource
    DataSet = sdqResumen
    Left = 180
    Top = 392
  end
  object SortDialogResumen: TSortDialog
    Caption = 'Orden'
    DataSet = sdqResumen
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 392
  end
  object sdqPEMasaSal: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPEMasaSalAfterOpen
    SQL.Strings = (
      
        'SELECT RM_CONTRATO CONTRATO, RM_MASASALARIAL MASASALARIAL, RM_RE' +
        'SPEMASA RESPEMASA, RM_PERIODO'
      '  FROM ACTUARIAL.URM_RESERVAESPEMASA'
      ' WHERE 1 = 2'
      '')
    Left = 152
    Top = 311
  end
  object dsPEMasaSal: TDataSource
    DataSet = sdqPEMasaSal
    Left = 180
    Top = 311
  end
  object SortDialogPEMasaSal: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPEMasaSal
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 311
  end
  object sdqExtILT: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqExtILTAfterOpen
    SQL.Strings = (
      
        'SELECT RE_IDRESERVA IDRESERVA, RE_IDRESERVA_ART IDRESERVA_ART, R' +
        'E_IDRESERVA_FFEP IDRESERVA_FFEP,'
      
        '       RE_IDRESERVA_GPBA IDRESERVA_GPBA, RE_SINIESTRO SINIESTRO,' +
        ' RE_ORDEN ORDEN, RE_NOMBRE NOMBRE,'
      
        '       RE_FACCIDENTE FACCIDENTE, RE_FECHAILT2 FECHAILT2, RE_IBD ' +
        'IBD, RE_IBD_VIEJO IBD_VIEJO, RE_SECTOR SECTOR,'
      
        '       RE_IBDPROMEDIO IBDPROMEDIO, RE_DIASEXTILT DIASEXTILT, RE_' +
        'DIASEXTLIQUIDADOS DIASEXTLIQUIDADOS,'
      
        '       RE_DIASPEND_EXTILT DIASPEND_EXTILT, RE_RES_EXTILT RES_EXT' +
        'ILT, RE_RES_EXTILT_ART RES_EXTILT_ART,'
      
        '       RE_RES_EXTILT_FFEP RES_EXTILT_FFEP, RE_RES_EXTILT_GBPA RE' +
        'S_EXTILT_GBPA, RE_CLASIFICACION CLASIFICACION,'
      
        '       RE_CIIU CIIU, RE_CONTRATO CONTRATO, RE_TRIMESTRE TRIMESTR' +
        'E'
      '  FROM ACTUARIAL.URE_RESERVAEXTILT'
      ' WHERE 1 = 2'
      '')
    Left = 152
    Top = 338
  end
  object dsExtILT: TDataSource
    DataSet = sdqExtILT
    Left = 180
    Top = 338
  end
  object SortDialogExtILT: TSortDialog
    Caption = 'Orden'
    DataSet = sdqExtILT
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 338
  end
  object sdqGInvalidez: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqGInvalidezAfterOpen
    SQL.Strings = (
      
        'SELECT RG_SINIESTRO SINIESTRO, RG_ORDEN ORDEN, RG_SPL SPL, RG_RE' +
        'SERVABALANCE RESERVABALANCE, RG_DIFERENCIA DIFERENCIA'
      '  FROM ACTUARIAL.URG_RESERVAGI'
      ' WHERE 1 = 2'
      ''
      '')
    Left = 152
    Top = 365
  end
  object dsGInvalidez: TDataSource
    DataSet = sdqGInvalidez
    Left = 180
    Top = 365
  end
  object SortDialogGInvalidez: TSortDialog
    Caption = 'Orden'
    DataSet = sdqGInvalidez
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 208
    Top = 365
  end
end
