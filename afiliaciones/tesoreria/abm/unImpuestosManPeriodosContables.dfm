inherited frmImpuestosManPeriodosContables: TfrmImpuestosManPeriodosContables
  Left = 127
  Top = 169
  Width = 580
  Height = 450
  Caption = 'Per'#237'odos Contables'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 580
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 572
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 572
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 568
      end>
    inherited ToolBar: TToolBar
      Width = 555
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Hint = 'Abrir Periodo Contable (Ctrl+A)'
        ImageIndex = 28
      end
      inherited tbModificar: TToolButton
        Hint = 'Cerrar Periodo Contable (Ctrl+R)'
        ImageIndex = 29
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      object tbReapertura: TToolButton
        Left = 370
        Top = 0
        Hint = 'Reapertura de Periodo Contable (Ctrl+P)'
        ImageIndex = 22
        OnClick = tbReaperturaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 572
    Height = 388
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'IP_ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IP_PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Alta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IP_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAMODIF'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Modificaci'#243'n'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IP_USUMODIF'
        Title.Caption = 'Usuario de Modificaci'#243'n'
        Width = 128
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 155
    Top = 104
    Width = 250
    Height = 89
    ActiveControl = edIP_PERIODO
    Constraints.MaxHeight = 89
    Constraints.MaxWidth = 250
    Constraints.MinHeight = 89
    Constraints.MinWidth = 250
    DesignSize = (
      250
      89)
    inherited BevelAbm: TBevel
      Top = 53
      Width = 242
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 7
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object Label2: TLabel [2]
      Left = 68
      Top = 7
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    inherited btnAceptar: TButton
      Left = 95
      Top = 59
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 170
      Top = 59
    end
    object edIP_PERIODO: TPeriodoPicker
      Left = 12
      Top = 26
      Width = 49
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205510'
      Periodo.MinPeriodo = '195511'
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
    object cmbIP_ESTADO: TComboBox
      Left = 68
      Top = 26
      Width = 172
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Abierto'
        'Cerrado')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT IP_ID, IP_ESTADO, IP_PERIODO, TRUNC(IP_FECHAALTA) FECHAAL' +
        'TA, IP_USUALTA,'
      
        '       TRUNC(IP_FECHAMODIF) FECHAMODIF, IP_USUMODIF, IP_FECHABAJ' +
        'A, '
      
        '       DECODE(IP_ESTADO, '#39'A'#39', '#39'Abierto'#39', '#39'C'#39', '#39'Cerrado'#39', '#39'Err'#243'ne' +
        'o'#39') ESTADO'
      '  FROM CONT.OIP_IMPPERIODO'
      '                              ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16449
        LinkControl = tbNuevo
      end
      item
        Key = 16466
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
      end
      item
        Key = 16464
        LinkControl = tbReapertura
      end>
  end
end
