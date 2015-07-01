inherited frmMovimientosVistaPrevia: TfrmMovimientosVistaPrevia
  Left = 181
  Top = 223
  Width = 786
  Height = 405
  BorderIcons = [biSystemMenu]
  Caption = 'Movimientos - Estado de Cuenta'
  FormStyle = fsNormal
  KeyPreview = True
  OldCreateOrder = True
  Visible = False
  OnKeyDown = FSFormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 778
    Height = 2
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 2
    Width = 778
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 774
      end>
    inherited ToolBar: TToolBar
      Width = 761
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilColor
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      object ToolButton7: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 36
        Style = tbsSeparator
      end
      object tbAnterior: TToolButton
        Left = 378
        Top = 0
        Hint = 'Per'#237'odo anterior (Ctrl -)'
        Caption = 'tbAnterior'
        ImageIndex = 31
        OnClick = tbAnteriorClick
      end
      object edPeriodo: TPeriodoPicker
        Left = 401
        Top = 0
        Width = 72
        Height = 22
        OnExit = edPeriodoExit
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 7
        Periodo.Ano = 1956
        Periodo.Valor = '195607'
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = True
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
        AutoExit = True
      end
      object tbSiguiente: TToolButton
        Left = 473
        Top = 0
        Hint = 'Per'#237'odo siguiente (Ctrl +)'
        Caption = 'tbSiguiente'
        ImageIndex = 32
        OnClick = tbSiguienteClick
      end
      object ToolButton1: TToolButton
        Left = 496
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 38
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 504
        Top = 0
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object Label1: TLabel
        Left = 527
        Top = 0
        Width = 142
        Height = 22
        Caption = '   Referencias -->>   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlRefSinAprobar: TPanel
        Left = 669
        Top = 0
        Width = 78
        Height = 22
        Hint = 'Haga click para cambiar el color...'
        BevelInner = bvLowered
        Caption = 'Sin aprobar'
        Color = clPurple
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = pnlRefSinAprobarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 31
    Width = 778
    Height = 347
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    FixedCols = 1
    OnGetCellParams = GridGetCellParams
    OnPaintFooter = GridPaintFooter
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'MT_PERIODO_FORMATEADO'
        Title.Caption = 'Per'#237'odo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_CODIGO'
        Title.Caption = 'C'#243'digo de Movimiento'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_COBRADO'
        Title.Caption = 'Cobrado'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_DEVENGADO'
        Title.Caption = 'Devengado'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_FECHA_RECAUDACION'
        Title.Caption = 'Fecha de Recaudaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_FECHA_DISTRIBUCION'
        Title.Caption = 'Fecha de Distribuci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_FECHA_ALTA'
        Title.Caption = 'Fecha de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_FECHA_APROBADO'
        Title.Caption = 'Fecha de Aprobaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_USUAPROBADO'
        Title.Caption = 'Aprobado'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_RECEPCION'
        Title.Caption = 'Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_BOLETA'
        Title.Caption = 'Boleta'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_CHEQUE'
        Title.Caption = 'Cheque'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_BANCO'
        Title.Caption = 'Banco'
        Width = 43
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM V_ZMT_MOVIMIENTOSTOTALES'
      ' WHERE MT_CONTRATO = :CONTRATO'
      '   AND MT_PERIODO  = :PERIODO ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PERIODO'
        ParamType = ptInput
      end>
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = frmPrincipal.DBLogin
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'pnlRefSinAprobar.Color'
      'ColorDialog.CustomColors')
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
  object ColorDialog: TColorDialog
    Color = clPurple
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 80
    Top = 256
  end
end
