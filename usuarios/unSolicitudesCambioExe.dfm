inherited frmSolicitudesCambioExe: TfrmSolicitudesCambioExe
  Left = 257
  Top = 139
  Caption = 'Consulta de Solicitudes de Cambio de Ejecutables/Archivos'
  ClientHeight = 390
  ClientWidth = 772
  Constraints.MinHeight = 420
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  ExplicitLeft = 257
  ExplicitTop = 139
  ExplicitWidth = 780
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 74
    Visible = True
    ExplicitWidth = 772
    ExplicitHeight = 74
    object grpFechaOP: TGroupBox
      Left = 485
      Top = 4
      Width = 208
      Height = 66
      Caption = ' Fecha de Alta'
      TabOrder = 4
      object Label4: TLabel
        Left = 98
        Top = 31
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 8
        Top = 27
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAltaHasta
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 112
        Top = 27
        Width = 88
        Height = 21
        MinDateCombo = edFechaAltaDesde
        TabOrder = 1
      end
    end
    object rgImpresas: TRadioGroup
      Left = 4
      Top = 4
      Width = 157
      Height = 66
      Caption = ' Impresi'#243'n '
      ItemIndex = 1
      Items.Strings = (
        '&Todas'
        '&Pendientes de Impresi'#243'n'
        '&Impresas')
      TabOrder = 0
      OnClick = tbRefrescarClick
    end
    object rgPropiedad: TRadioGroup
      Left = 164
      Top = 4
      Width = 137
      Height = 66
      Caption = ' Propiedad '
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        '&S'#243'lo las m'#237'as'
        'Todas men&os las m'#237'as')
      TabOrder = 1
      OnClick = tbRefrescarClick
    end
    object rgActivas: TRadioGroup
      Left = 308
      Top = 4
      Width = 73
      Height = 66
      Caption = ' Activas '
      ItemIndex = 1
      Items.Strings = (
        'Todas'
        'S'#237
        'No')
      TabOrder = 2
      OnClick = tbRefrescarClick
    end
    object rgAutorizacion: TRadioGroup
      Left = 388
      Top = 4
      Width = 93
      Height = 66
      Caption = ' Autorizaci'#243'n '
      ItemIndex = 2
      Items.Strings = (
        'Todas'
        'Autorizadas'
        'Pendientes')
      TabOrder = 3
      OnClick = tbRefrescarClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 74
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    ExplicitTop = 74
    ExplicitWidth = 772
    inherited ToolBar: TToolBar
      Width = 759
      ExplicitWidth = 759
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Autorizar Solicitudes'
        ImageIndex = 18
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 103
    Width = 772
    Height = 287
    PopupMenu = mnuSeleccion
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'JC_NROSOLICITUD'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Solicitud'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JC_NOMBREPROGR'
        Title.Caption = 'Archivo'
        Width = 183
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'JC_FECHAPROGR'
        Title.Alignment = taCenter
        Title.Caption = 'F. Archivo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JC_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'JC_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JC_MODIFICACIONES'
        Title.Caption = 'Cambios Realizados'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JC_ANALISTA'
        Title.Caption = 'Autorizado por'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'JC_FIMPRESIONSOLICITUD'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n Solic.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIORIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Prioridad'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JC_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 117
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 66
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 312
    Top = 204
    Width = 329
    Height = 97
    ExplicitLeft = 312
    ExplicitTop = 204
    ExplicitWidth = 329
    ExplicitHeight = 97
    DesignSize = (
      329
      97)
    inherited BevelAbm: TBevel
      Top = 61
      Width = 321
      ExplicitTop = 61
      ExplicitWidth = 321
    end
    inherited btnAceptar: TButton
      Left = 171
      Top = 67
      ExplicitLeft = 171
      ExplicitTop = 67
    end
    inherited btnCancelar: TButton
      Left = 249
      Top = 67
      ExplicitLeft = 249
      ExplicitTop = 67
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT JC_NROSOLICITUD, JC_NOMBREPROGR, JC_FECHAPROGR, JC_FECHAA' +
        'LTA,'
      '       JC_MODIFICACIONES, JC_ANALISTA, JC_FIMPRESIONSOLICITUD,'
      
        '       DECODE(JC_PRIORIDAD, 0, '#39'Baja'#39', 1, '#39'Mediana'#39', 2, '#39'Alta'#39', ' +
        #39'Mediana'#39') PRIORIDAD'
      '  FROM EJC_PROGREJECUTABLES'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
        LinkControl = tbSalir
      end>
    Left = 108
    Top = 200
  end
  object mnuSeleccion: TPopupMenu
    Left = 139
    Top = 229
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object mnuImprimir: TPopupMenu
    Left = 167
    Top = 229
    object mnuImprimirSolicitud: TMenuItem
      Caption = 'Imprimir Solicitud'
      OnClick = mnuImprimirSolicitudClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
  end
end
