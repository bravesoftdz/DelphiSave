inherited frmManOCR_CALCULORESERVA: TfrmManOCR_CALCULORESERVA
  Left = 302
  Top = 286
  Width = 704
  Height = 409
  Caption = 'Reservas'
  Constraints.MinHeight = 409
  Constraints.MinWidth = 704
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 696
    Height = 25
  end
  inherited CoolBar: TCoolBar
    Top = 25
    Width = 696
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 692
      end>
    inherited ToolBar: TToolBar
      Width = 679
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCerrarVigencia: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cerrar Vigencia (Ctrl+V)'
        ImageIndex = 22
        OnClick = tbCerrarVigenciaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 7
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
    Top = 54
    Width = 696
    Height = 328
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'RESERVA'
        Title.Alignment = taCenter
        Title.Caption = 'Reserva'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Descripci'#243'n'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODOS'
        Title.Alignment = taCenter
        Title.Caption = 'Periodos'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALICUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Al'#237'cuota'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIVISOR'
        Title.Alignment = taCenter
        Title.Caption = 'Divisor'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIGENCIA_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIGENCIA_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CIERRE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cierre'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 71
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 88
    Height = 188
    Constraints.MaxHeight = 188
    Constraints.MaxWidth = 461
    Constraints.MinHeight = 188
    Constraints.MinWidth = 461
    inherited BevelAbm: TBevel
      Top = 152
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 128
      Width = 51
      Height = 13
      Caption = 'Vig. Desde'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Reserva'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 42
      Width = 41
      Height = 13
      Caption = 'Periodos'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 70
      Width = 38
      Height = 13
      Caption = 'Al'#237'cuota'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 100
      Width = 32
      Height = 13
      Caption = 'Divisor'
    end
    inherited btnAceptar: TButton
      Left = 306
      Top = 158
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Top = 158
      TabOrder = 6
    end
    inline fraReserva: TfraStaticCTB_TABLAS
      Left = 64
      Top = 9
      Width = 389
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 325
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object ppVigenciaDesde: TPeriodoPicker
      Left = 65
      Top = 125
      Width = 60
      Height = 21
      TabOrder = 4
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
    object edPeriodos: TIntEdit
      Left = 65
      Top = 39
      Width = 60
      Height = 21
      TabOrder = 1
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 8
      MaxValue = 99999999
    end
    object edDivisor: TIntEdit
      Left = 65
      Top = 97
      Width = 60
      Height = 21
      TabOrder = 3
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 8
      MaxValue = 99999999
    end
    object edAlicuota: TCurrencyEdit
      Left = 65
      Top = 68
      Width = 60
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      TabOrder = 2
    end
  end
  object fpCerrarVigencia: TFormPanel [4]
    Left = 125
    Top = 280
    Width = 160
    Height = 80
    Caption = 'Cerrar Vigencia'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 80
    Constraints.MaxWidth = 160
    Constraints.MinHeight = 80
    Constraints.MinWidth = 160
    OnEnter = fpCerrarVigenciaEnter
    object Label6: TLabel
      Left = 11
      Top = 14
      Width = 53
      Height = 13
      Caption = 'Vig. Hasta:'
    end
    object btnAceptarVig: TButton
      Left = 10
      Top = 48
      Width = 64
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarVigClick
    end
    object btnCancelarVig: TButton
      Left = 87
      Top = 48
      Width = 64
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarVigClick
    end
    object ppVigenciaHasta: TPeriodoPicker
      Left = 67
      Top = 11
      Width = 56
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CR_RESERVA RESERVA, TB_DESCRIPCION NOMBRE, CR_PERIODOS PE' +
        'RIODOS, CR_ALICUOTA ALICUOTA,'
      
        '       CR_DIVISOR DIVISOR, CR_VIGENCIADESDE VIGENCIA_DESDE, CR_V' +
        'IGENCIAHASTA VIGENCIA_HASTA,'
      '       CR_FECHACIERRE FECHA_CIERRE, CR_FECHABAJA FECHA_BAJA'
      '  FROM CTB_TABLAS, OCR_CALCULORESERVA'
      ' WHERE TB_CODIGO = CR_RESERVA'
      '   AND TB_CLAVE = '#39'CORES'#39
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
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
      end
      item
        Key = 16470
        LinkControl = tbCerrarVigencia
      end>
  end
end
